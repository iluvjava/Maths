[[Dykstra Projection Algorithm]], [[Introduction ADMM]]


---
### **Intro**

This file is talking about A.2 in the appendix of the paper [[Dykstra’s Algorithm, ADMM, and Coordinate Descent-Connections, Insights, and Extensions.pdf]]. We do the claim in that paper, but with a lot of details. Here is a series of steps we will do to tackle the claim properly. 

**The main problem**

$$
\begin{aligned}
    & \arg\min_u \sum_{i = 1}^{d} \delta_{C_i}(u) 
    \equiv& 
    \underset{u_0, u_2, \cdot, u_d}{\arg\min}
    \left\lbrace
        \sum_{i = 1}^{d}\delta_{C_i}(u_i) \text{ s.t: }
    u_{i - 1} = u_{i} \; \forall\; 0\le i \le d
    \right\rbrace. 
\end{aligned}\tag{1}
$$

here, we define that $u_{-1} = u_d$. additionally, we might consider adding a penalty term $\frac{1}{2}\Vert u - y\Vert^2$. Additionally, one can replace the indicator function to a closed convex proper functions $f_i$, which works the same due to the properties shared by the proximal operator and the projection onto convex sets. To start, we state the dykstra algorithm applied to the problem which is: 

$$
\begin{aligned}
    \begin{cases}
        u^+_0 = u_d , 
        \\
        u^+_i = P_{C_i}(z_i + u^+_{i - 1}) & \forall 1 \le i \le d, 
        \\
        z^+_i = z + (u^+_{i - 1} - u_{i}) & \forall 1 \le i \le d. 
    \end{cases}
\end{aligned}
$$

The argument we want to make is that, a slightly modified version of the ADMM algorithm plus an limiting argument on the quadratic penalty term on the Lagrangian will prove that the above Dykstra algorithm is equivalent to ADMM algorithm. 

---
### **Useful Quantities**

We define $N = (d + 1)n$, where n is the dimension of $u_i$, or the domain of the function $f_i$. To encode the constraints, we consider the use of the block structure matrix $B$ defined as: 

$$
\begin{aligned}
    B := \begin{bmatrix}
        -I_n & & & I_n &
        \\
        I_n & -I_n & & &
        \\
        & I_n& -I_n & &
        \\
        & & \ddots  & &
        \\
        & & & I_n & -I_n
    \end{bmatrix}\in \mathbb R^{N\times N}, u := \begin{bmatrix}
        u_0 \\ u_1\\ u_2\\ \vdots \\ u_d
    \end{bmatrix}\in \mathbb R^N, f(u) = \sum_{i = 1}^{d}\delta_{C_i}(u_i), 
\end{aligned}
$$

Then the constraints can be defined concisely as $Bx = \mathbf 0$. Allowing us to put the problem that has been splitted into the form: $\arg\min_{u\in \mathbb R^N}\{f(u)| Bu = \mathbf 0\}$. To consider the use of ADMM with the problem, we need a special type of norm induced by the following block structure matrix: 

$$
\begin{aligned}
    P = \text{diag}(\rho_0, \rho_1, \cdots, \rho_d)\otimes I_n,
\end{aligned}
$$

such a block diagonal matrix induces a norm $\Vert x\Vert_P^N = \langle x, Px\rangle$. 

---
### **Lagrangians**

The classical Lagrangian of the splitted expression (1) is: 

$$
\begin{aligned}
    \mathcal L(u, v) &= 
    f(u) + \langle v, Bu\rangle
    \\
    \mathcal{L}_P(u, v) &= 
    f(u) + \langle v, Bu\rangle + \frac{1}{2}\Vert Bu\Vert_P^2, 
\end{aligned}
$$

one can rescale the Augmented Lagrangian's dual variable $u = Pz$, which gives us: 

$$
\begin{aligned}
    \mathcal L_P(u, Pv)=& f(u) + \langle Pz, Bu\rangle + \frac{1}{2}\Vert Bu\Vert^2_P
    \\
    =& 
    f(u) + \langle P^{1/2}z,P^{1/2} Bu\rangle + \frac{1}{2}\Vert P^{1/2}Bu\Vert^2
    \\
    =& 
    f(u) + 
    \frac{1}{2}(\Vert P^{1/2}z + P^{1/2}Bu\Vert^2 - \Vert P^{1/2}z\Vert^2)
    \\
    =& 
    f(u) + \frac{1}{2}(\Vert z + Bu\Vert^2_P - \Vert z\Vert^2_P)
    \\
    =& \mathcal{\hat L}_P(u, z), 
\end{aligned}
$$

And the last line above is the sacled augmented Lagragian for the splitted problem in (1). 

---
### **Derving the ADMM**

