[[Dykstra Projection Algorithm]], [[Introduction ADMM]], [[Moreau Envelope and Proximal Mapping]]

---
### **Intro**

This file is talking about A.2 in the appendix of the paper [[Dykstra’s Algorithm, ADMM, and Coordinate Descent-Connections, Insights, and Extensions.pdf]]. We do the claim in that paper, but with a lot of details. Here is a series of steps we will do to tackle the claim properly. 

**The main problem**

$$
\begin{aligned}
    & \arg\min_u \sum_{i = 1}^{d} \delta_{C_i}(u) 
    \equiv \underset{u_0, u_2, \cdot, u_d}{\arg\min}
    \left\lbrace
        \sum_{i = 1}^{d}\delta_{C_i}(u_i) \text{ s.t: }
    u_{i - 1} = u_{i} \; \forall\; 0\le i \le d
    \right\rbrace. 
\end{aligned}\tag{1}
$$

here, *we define that* $u_{-1} = u_d$. additionally, we might consider adding a penalty term $\frac{1}{2}\Vert u - y\Vert^2$. Additionally, one can replace the indicator function to a closed convex proper functions $f_i$, which works the same due to the properties shared by the proximal operator and the projection onto convex sets. To start, we state the dykstra algorithm applied to the problem which is: 

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
        -I_n & & & & I_n
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

then the constraints can be defined concisely as $Bx = \mathbf 0$. Allowing us to put the problem that has been splitted into the form: $\arg\min_{u\in \mathbb R^N}\{f(u)| Bu = \mathbf 0\}$. To consider the use of ADMM with the problem, we need a special type of norm induced by the following block structure matrix: 

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

For updating the variables, we have: 

$$
\begin{aligned}
    u_0^+ =& \underset{u_0\in \mathbb E}{\text{argmin}}
    \left\lbrace
       \frac{\rho_1}{2}\Vert z_1 + u_0 - u_1\Vert^2
       + 
       \frac{\rho_0}{2}\Vert z_0 + u_{-1} - u_0\Vert^2
       + 
       \textcolor{blue}{\frac{1}{2}\Vert u_0 - u_d \Vert^2}
    \right\rbrace
    \\
    u_i^+ =& 
    \underset{u_i\in \mathbb E}{\text{argmin}}
    \left\lbrace
       \delta_{C_i}(u) + 
       \frac{\rho_i}{2}\Vert z_i + u_{i - 1} - u_i\Vert^2
       + 
       \frac{\rho_{i + 1}}{2}
       \Vert z_i + u_i - u_{i + 1}\Vert^2 
    \right\rbrace\quad 
    \forall 1 \le i \le d, 
\end{aligned}
$$

we define $\rho_{d + 1} = \rho_0$, and the term highlighted in blue is not part of the ADMM, this is an additional inertia term introduced just to make the argument work. Observe that it's the sum of a function adding finitely many 2 norm error to a constraint with a weight associated with the term. Refer to [[Minimizer of Quadratic Sum, Weighted Average]]. For $u_0^+$ we can assign $\alpha_1 = \rho_1, \alpha_2 = \rho_0, \alpha_3= 1; y_1 = u_1 - z_1, y_2 = z_0 + u_d, y_3 = u_d$. Therefore, the minimizer for $u_0^+$ is the weight average and it given by: 

$$
\begin{aligned}
    u_0^+ := 
    \frac{\rho_1(u_1 - z_1) + \rho_0(z_0 + u_d) + u_d}{1 + \rho_0 + \rho_1}. 
\end{aligned}
$$

Similary, for $u_d^+$ we have $\alpha_1 = \rho_i, \alpha_2 = \rho_{i + 1}; y_1 = z_i + u_{i - 1}, y_2 = u_{i + 1} - z_i$, therefore: 

$$
\begin{aligned}
    \bar y =& 
    \frac{\rho_i(z_i + u_{i - 1}) + \rho_{i +1}(u_{i + 1} - z_i)}
    {\rho_i + \rho_{i + 1}}
    \\
    = &
    \frac
    {(z_i + u_{i - 1}) + \frac{\rho_{i +1}}{\rho_i}(u_{i + 1} - z_i)}
    {1 + \frac{\rho_{i + 1}}{\rho_i}}
    \\
    u_i^+ = &
    P_{C_i}\left(
        \bar y
    \right)
\end{aligned}, 
$$

finally, observe that if $i = d$, then we have $\rho_{i + 1}$, which is $\rho_0$ when $i = d$. 


---
### **Taking the Limit**

The final step is to consider a limit where $\rho_i$ gets smaller for all value $0 \le i \le d$ in a very specific manner. Consider $\beta > 0$, we define $\rho_0 = \beta^{d + 1}, \rho_i = \beta^i$, then observe that we can first simplify $u_0^+$: 

$$
\begin{aligned}
    & \frac{\rho_1(u_1 - z_1) + \rho_0(z_0 + u_d) + u_d}{1 + \rho_0 + \rho_1}
    \\
    =&
    \frac{\beta_1(u_1 - z_1) + \beta^{d + 1}(z_0 + u_d) + u_d}{1 + \beta + \beta^{d + 1}} 
    \\
    \implies \lim_{\beta \rightarrow 0 }u_0^+=& u_d, 
\end{aligned}
$$

Next we consider taking the limint of $\bar y$ for $u^+_i$ which is given as: 

$$
\begin{aligned}
    \bar y &=
    \frac
    {(z_i + u_{i - 1}) + \frac{\rho_{i +1}}{\rho_i}(u_{i + 1} - z_i)}
    {1 + \frac{\rho_{i + 1}}{\rho_i}}
    \\
    &= 
    \frac
    {(z_i + u_{i - 1}) + \beta(u_{i + 1} - z_i)}
    {1 + \beta}
    \\
    \implies \lim_{\beta \rightarrow 0} \bar y &= z_i - u_{i - 1}. 
\end{aligned}
$$

Finally, we can take the limit as and conclue that $\lim_{\beta\rightarrow 0}P_{C_i}(\bar y) = P_{C_i}(z_i - u_{i - 1})$ because projection onto a closed and convex set is a continuous mapping. After taking the limit, the ADMM algorithm has the following updates instead: 

$$
\begin{aligned}
    \begin{cases}
        u_0^+ = u_d, & 
        \\
        u_i^+ = P_{C_i}(z_i + u_{i - 1}^+) & \forall 1 \le i \le d, 
        \\
        z^+ = z + B u^+. 
    \end{cases}
\end{aligned}
$$

And this is the same algorithm as the Dykstra projection algorithm listed at the beginning. 


---
### **Extensions and Others**

Take note that, we can reformulate the objective function to include one extra objective function and change the indicator functions to some generic closed convex proper functions: 

$$
\begin{aligned}
    \underset{u = (u_0, \cdots, u_d)}{\text{argmin}}
    \left\lbrace
       f_0(u_0) + \sum_{i = 1}^{d}f_i(u_i): 
       u_{i - 1} = u_i \; \forall 0 \le i \le d
    \right\rbrace, 
\end{aligned}\tag{2}
$$

Then following the same derivation and assuming that the regularity conditions and the continuity of the proximal operator holds (the later holds because the functions are all closed convex and proper.), hence we should get the following upate for our parameters $u_0^+, u_i^+$ 

$$
\begin{aligned}
    u_0^+ =& \underset{u_0\in \mathbb E}{\text{argmin}}
    \left\lbrace
        f_0(u_0) 
        +
        \frac{\rho_1}{2}\Vert z_1 + u_0 - u_1\Vert^2
        + 
        \frac{\rho_0}{2}\Vert z_0 + u_{-1} - u_0\Vert^2
        + 
        \textcolor{blue}{\frac{1}{2}\Vert u_0 - u_d \Vert^2}
    \right\rbrace
    \\
    u_i^+ =& 
    \underset{u_i\in \mathbb E}{\text{argmin}}
    \left\lbrace
        f_i(u) + 
        \frac{\rho_i}{2}\Vert z_i + u_{i - 1} - u_i\Vert^2
        + 
        \frac{\rho_{i + 1}}{2}
        \Vert z_i + u_i - u_{i + 1}\Vert^2 
    \right\rbrace\quad 
    \forall 1 \le i \le d, 
\end{aligned}
$$

going through a same line reasoning we can obtain the relation that: 

$$
\begin{aligned}
    u_0^+ &= \text{prox}_{f_0}
    \left(
        \frac{\rho_1(u_1 - z_1) + \rho_0(z_0 - u_{-1}) + u_d}
        {1 + \rho_0 + \rho_1}
    \right)
    \\
    u_i^+ &= 
    \text{prox}_{f_i}
    \left(
        \frac{\rho_i(z_i + u_{i - 1}) + \rho_{i +1}(u_{i + 1} - z_i)}
        {\rho_i + \rho_{i + 1}}
    \right), 
\end{aligned}
$$

we take the same type of limit by setting $\rho_{-1} = \rho_0$, $\rho_i = \beta^i \; \forall 1 \le i \le d$, $\rho_0 = \beta^{i + 1}$, with $\beta >0$. Taking the limit as $\beta\rightarrow 0$, we end up with the following algorithm: 

$$
\begin{aligned}
    \begin{cases}
        u_0^+ = \text{prox}_{f_0} u_d \; ,& 
        \\
        u_i^+ = \text{prox}_{f_i}(z_i + u_{i - 1}^+) & \forall \; 1 \le i \le d\;,
        \\
        z^+ = z + B u^+,
    \end{cases}
\end{aligned}
$$

which is just a Dykstra Algorithm that seems to be suitable for any closed convex proper function. For example, one can make $f_i(x) = \text{dist}_{C_i}(x)^2, f_0 = \text{dist}_{\{y\}}(x)^2$, the square distance from the closed convex sets representing the constraints and a vector $y$. In this case, the regularity condition is satisfied for all non-empty set, and the solution is the closet point in the intersection of all constraints such that it's closest to the point $y$. 

**Remark**

When $d =1, 2$ are we getting Chambolle Pock by any chance(No it's different)? This update sequence is actually similar to a Gauss Seidel method in [[Stationary Iterative Methods]] (Yes, the GS is a coordinate descend on standard basis vector, and the dual of the Dykstra in Tibshirani's paper talks about it). 


---
### **2 Projection Case**

One can simplify the above extension by assuming that $d = 1$, and we were hit with the objectives of the classic case of Dykstra Feasibility problem with: 

$$
\begin{aligned}
    \underset{u}{\text{argmin}}
    \left\lbrace
        f_0(u_0) + f_1(u_1) \text{ s.t: }
        u_1 = u_0, u_0 = u_1
    \right\rbrace, 
\end{aligned}
$$

which in many cases, represents the splitting of a objective function $f_0(u_0)$, with another function $f_1(x_1)$ that does the regularizations, or another function $f_0$ that represents the constraints of some kind. For this objective, the "Dykstra Reformulations" will be given as: 

$$
\begin{aligned}
    \begin{cases}
        u_0^+ = \text{prox}_{f_0}u_1
        \\
        u_1^+ = \text{prox}_{f_1}(z_i + u_{0}^+)
        \\
        z^+ = z + Bu^+
    \end{cases}
\end{aligned}
$$



---
### **A Better Proximal Problem**

Take note that the regularity conditions are only satisfied whenever the intersections of all relative interiors of the closed convex sets $C_i$ are none empty. In practice this might be a rare occurrence, and to rescue, we need to consider objective functions of the form $f_i = \text{dist}_{C_i}^2(x)$. In this case, an intersection of all the sets $C_i$ would be identified if the objective of the function is zero. The function $\text{dist}_{C_i}^2(x)$ is strongly smooth and it is differentiable on the entire. 


