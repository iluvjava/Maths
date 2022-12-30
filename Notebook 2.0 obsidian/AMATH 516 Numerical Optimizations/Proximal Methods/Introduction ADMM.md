Major Reference Sources: 
* [Stanford University](https://stanford.edu/~boyd/admm.html) ALL IN ONE Resources for ADMM 
* Paper [link](https://stanford.edu/~boyd/papers/pdf/admm_distr_stats.pdf)
* Paper [[Proximal Algorithms in Stats and ML.pdf]]
* Paper: [link](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf), starting with pg: 153, where it starts talking about interpretations of the ADMM methods. 

Prerequisites: 
* [[Characterizing Functions for Optimizations]]
* [[Moreau Envelope and Proximal Mapping]]
* [[Subgradient and Subdifferential Definition]]

---
### **Intro**
Alternating direction method of multiplier (ADMM). We state the assumptions of the algorithms and then summarized the algorithms. Including: 

1. The formulations of the Augmented Lagrangian
2. The assumptions made: 
	1. Strong duality 
	2. Saddle point exists for the given problem. 
3. The optimality conditions 
	1. Primal and dual residuals of the ADMM iterations
4. Some brief justifications for some of the claims

The premise of the paper started with solving objectives that are separable, in the form of $f(x) + g(x)$, the splitting is the equivalent equality constrained optimization problem: 
$$
\min_{x, z} \{l(x) + \phi(z)\} \text{ s.t: }x = z,
$$

were we have one more variables of the same dimension. The Lagrangian of this primal problem would be given as the following: 
$$
\mathcal{L}(x, z, \lambda) = l(x) + \phi(z) + \langle \lambda, x - z\rangle. 
$$

**Definition Augmented Lagrangian**: 

The augmented Lagrangian is the same problem listed above but with a quadratic penalization norm: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, \lambda) = 
    l(x) + \phi(z) + \langle \lambda, x - z\rangle + \frac{\gamma}{2}\Vert x - z\Vert^2
\end{aligned}, 
$$
which has primal

$$
\begin{aligned}
    \min_{x, z} l(x) + \phi(z) + \frac{\gamma}{2}\Vert x - z\Vert^2\text{ s.t: }x = z
\end{aligned}. 
$$

**Definition of the Scaled Form Lagrangian**

The scaled form is obtained by setting $u = \gamma^{-1}\lambda, r = x - z$: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, u) = l(x) + \phi(z) + \frac{1}{2\gamma}(
        \Vert r - u\Vert^2 - \Vert u\Vert^2
    )
\end{aligned}, 
$$

we derive it by considering: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, \lambda = \gamma u) = l(x) + \phi(z) + 
    \underbrace{\langle \lambda, x - z\rangle + \frac{1}{2\gamma}\Vert x - z\Vert^2}_{[1]}. 
\end{aligned}
$$

And we would like to consider changing the form of \[1\] by substituting $\lambda = \gamma u$ so that it matches: $\frac{1}{2\gamma}(\Vert r - u\Vert^2 - \Vert u\Vert^2)$ as in the scaled form. Substituting the definition of $r$ into \[1\] we have: 
$$
\begin{aligned}
    & \gamma \langle u, x - z\rangle + \frac{1}{2\gamma} \Vert r\Vert^2
    \\
    =& 
    \gamma \langle u, r\rangle  + \frac{1}{2\gamma}\Vert r\Vert^2
    \\
    =& \frac{\gamma}{2}\left(
        \frac{2}{\gamma^2}\langle u, r\rangle + 
        \frac{1}{\gamma^2}\Vert r\Vert^2
    \right)
    \\
    =& 
    \frac{\gamma}{2}
    \left(
        2\left\langle \frac{u}{\gamma}, \frac{r}{\gamma} \right\rangle + 
        \left\Vert
             \frac{r}{\gamma} 
        \right\Vert^2
    \right)
    \\
    =& 
    \frac{\gamma}{2}\left(
        \left\Vert
            \frac{r}{\gamma}+ \frac{u}{\gamma}
        \right\Vert^2 - \left\Vert
            \frac{u}{\gamma}
        \right\Vert^2
    \right)
    =& \frac{1}{2\gamma} \left(
        \Vert r - u\Vert^2 - \Vert u\Vert^2
    \right), 
\end{aligned}
$$

which is exactly the same as the last term for the scaled Lagrangian. Next, we list the scaled Lagragian for splitting that involves more than one functions. Here we list the objectives and the splitting of the problem: 

$$
\begin{aligned}
    \min_{x\in \mathbb R_n} \left\lbrace
        \sum_{i=1}^{m}f_i(x)
    \right \rbrace
    \equiv 
    \min_{x_1, x_2, \cdots x_m \in \mathbb R^n}
    \left\lbrace
        \left.
        \sum_{i = 1}^{m} f_i(x_i) 
        \right|
        x_j = x_{j + 1} \; \forall 
        j = \{1, 2, \cdots, m- 1\}
    \right\rbrace, 
\end{aligned}
$$

and the corresponding Augmented Lagrangian of the system is given by: 

$$
\begin{aligned}
    \mathcal L(\{x_j\}_{j = 1}^m\cdots , \{u_i\}_{i = 1}^{m}\cdots )
    = 
    \sum_{i = 1}^{m}f_i(x_i)
    + 
    \left(
        \sum_{j = 1}^{m}
            \frac{\Vert r_i - u_i \Vert^2
            - \Vert u_i\Vert^2}{2\gamma_j}
    \right),
\end{aligned}
$$
where the constaint $\gamma_j$ have the freedom to change depending on which indices we are looking at. 


---
### **Methods of Dual Ascend**

Due to the fact that these later parts of the materials comes from different references, we are going to use $f(x) + g(x)$ as the 2 separable objective function. 

Performs gradient updated on the gradient of the dual, we assume that $l$ has global Lipschitz gradient and it's convex, and $\phi$ to be a convex function as well, then the strong duality applies, denote the dual problem then its gradient is given by: 
$$
    \nabla g(x) = \nabla \mathcal L(x^+, z^+, \lambda) \text{ where } (x^+, z^+)\in \arg\min_{x, z} \mathcal L(x, z, \lambda). 
$$

The Lagrangian is non-smooth in the primal parameters, so $(\mathbf 0, \mathbf 0)\in \partial [\mathcal L (x, z,\lambda)|(x, z)](x^+, z^+)$. In addition, the gradient of $g$ is wrt to $\lambda$ which is definitely a gradient giving us: $(x^+ - z^+)$. The method of dual ascend performs the following: 

$$
\begin{aligned}
    (x^{(t + 1)}, z^{(t + 1)}) = \arg\min_{x, z} \mathcal L(x, z, \lambda^{(t)})
    \\
    \lambda^{(t + 1)} = \lambda^{(t)} + \alpha_t(x^{(t + 1)} - z^{(t + 1)}), 
\end{aligned}
$$

which requires solving the problem for each ascend step of the dual variable. 


---
### **Methods of Multipliers**

Method of multiplier updates each of the primal variable individually, in a Gauss Seidel like manner, and then at the end it performs a step of dual ascend. Through out the algorithm, the dual is feasible. For a more generalized version of the problem we consider $f, g$ to be lsc, proper and convex, and form the primal problem and the augmented lagraian as the following: 

$$
\begin{aligned}
    & \min_{x, z} f(x) + g(z) \text{ s.t: } Ax + Bz = c,
    \\
    & \mathcal L_\rho (x, z, y) = 
    f(x) + g(z) + \langle y, Ax + Bz - c\rangle + \frac{\rho}{2}\Vert Ax + B z - c\Vert^2,
\end{aligned}
$$

Then the method of multiplier does the following updates: 

$$
\begin{aligned}
    & x^{(k + 1)} = 
    \arg\min_{x}\mathcal L_\rho (x, z^{(k)}, y^{(k)})
    \\
    & z^{(k + 1)} = 
    \arg\min_{z} \mathcal L_\rho(x^{(k + 1)}, z, y^{(k)})
    \\
    & y^{(k + 1)} =
    y^{(k)} + \rho(Ax^{(k + 1)} + Bz^{(k + 1)} - c), 
\end{aligned}
$$

and under some special case where $A, B = I$ the system of updates has a proximal method interpretations to it, we may also reconsider the scaled form of the Augmented Lagrangian, with the substitution $u = \rho^{-1}y$, and $r = Ax + Bz - c$, then we have scaled form given as: 

$$
\begin{aligned}
    \mathcal L_\rho (x, z, u) = f(x) + g(z) + \frac{1}{2\rho}
    \Vert Ax + Bz - c - u\Vert^2 - \frac{1}{2\rho}\Vert u\Vert^2, 
\end{aligned}
$$

which consequently gives us an update form of the ADMM that is simpler: 

$$
\begin{aligned}
    & x^{(k + 1)} := \arg\min_x \left\lbrace
        f(x) + \frac{\rho}{2}\Vert Ax + Bz^{(k)} - c + u\Vert^2
    \right\rbrace
    \\
    & z^{(k + 1)} := \arg\min_{z} \left\lbrace
        g(z) + \frac{\rho}{2}\Vert Ax^{(k + 1)} + Bz- c + u^{(k)}\Vert^2
    \right\rbrace
    \\
    & u^{(k + 1)} := u^{(k)} + \underbrace{Ax^{(k + 1)} + Bz^{(k + 1)} - c}_{=: r^{(k + 1)}}, 
\end{aligned}
$$

Finally, observe the fact that if $A, B$ are identity, then these 2 updates are proximal mapping. 

---
### **Dual Feasibility of ADMM**

We prove that the solutions provided by the ADMM is always dual feasible. We first assume that $f, g$ are convex, and $\mathcal L_0$, the un-regularized Lagrangian has a saddle point to it, so that: 

> $$
> \begin{aligned}
>     & \exists (x^+, z^+, y^+): \; \mathcal L_0 (x^+, z^+, y)\le \mathcal L_0(x^+, z^+, y^+) \le \mathcal L_0(x, z, y^+)\quad  \forall x, y, z
>     \\
>     & Ax^+ + Bz^+ = c, f(x^+) \le \infty \wedge g(x^+) \le \infty
> \end{aligned}
> $$

Assuming that strong duality holds[^1], then ADMM converges and the condition \[2\] below will always be kept during the execution of the algorithm. Before we prove that it converges, we need to check 2 of the important conditions related to duality

$$
\begin{aligned}
    \mathbf 0 \in \partial f(x^+) + A^Ty^+ \quad [1]
    \\
    \mathbf 0 \in \partial g(z^+) + B^T y^+ \quad [2]
\end{aligned}
$$

which comes from the optimality of the primal variables under the staionary point assumptions for duality, basically $\mathbf 0 \in \partial [\mathcal L_\rho (x, z^+, y^+)|x], \mathbf 0 \in \mathcal [L_\rho(x^+, z, y^+)|z]$. We wish to show that on every iteration, the second condition is held true becaue 
$$
\begin{aligned}
    z^{(k + 1)} &\in \arg\min_{z}\mathcal L_\rho(x^{(k + 1)}, z, y^{k})
    \\
    \implies 
    \mathbf 0 &\in 
    \partial g(z^{k + 1}) + B^Ty^{(k)} + \rho B^T r^{(k + 1)}
    \\
    &= \partial g(z^{(k + 1)}) + B^Ty^{(k)} + \rho B^T r^{(k + 1)}
    \\
    &= \partial g(z^{(k + 1)}) + B^T y^{(k + 1)}
\end{aligned}
$$

which means that \[2\] holds for $z^{(k + 1)}$ and the upcoming updated value $y^{(k + 1)}$. Next, we check \[1\], the first stationary point condition using the optimality condition of $x^{(k + 1)}$

$$
\begin{aligned}
    x^{(k + 1)} &\in \arg\min_{x} \mathcal L(x, z^{(k)}, y^{(k)})
    \\
    \mathbf 0 &\in \partial f(x^{(k + 1)}) + A^Ty^{(k)} + \rho A^T(x^{(k + 1)} + Bz^{(k)} - c)
    \\ 
    &= \partial f(x^{(k + 1)}) + A^T(y^{(k)} + \rho(\underbrace{x^{(k + 1)} + Bz^{(k + 1)} -c}_{r^{(k + 1)}} +  B(z^{(k)} - z^{(k + 1)})))
    \\
    &= \partial f(x^{(k + 1)}) + A^T(y^{(k)} + \rho r^{(k + 1)} + \rho B(z^{(k)} - z^{(k + 1)}))
    \\
    &= \partial f(x^{(k + 1)}) + A^T(\underbrace{y^{(k)} + \rho r^{(k + 1)}}_{y^{(k + 1)}}) + \rho A^TB(z^{(k)} - z^{(k + 1)}))
    \\
    &= \partial f(x^{(k + 1)}) + A^Tr^{(k + 1)} + \rho A^TB(z^{(k)} - z^{(k + 1)})
    \\
    \implies
    \rho A^T B(z^{(k + 1)} - z^{(k)}) &\in 
    \partial f(x^{(k + 1)}) + A^Ty^{(k + 1)}, 
\end{aligned}
$$

some technicalities are involved with taking the subgradient when using the sum rules and the property of affine composition on convex function, but ignoring these allows us to get an optimality measure on condition \[2\], which is determined by the quantity: $\rho A^TB (z^{(k + 1)} - z^{(k)})$. Let's denote this quantity to be $s^{(k + 1)}$, depending on the value of $s^{(k + 1)}$ and details about the subgradient on [2], during the run time of the algorithm it might or might not violate the condition. Finally, we name the primal residual $r^{(k)}$ and the dual residual $s^{(k)}$, they will be quantity used during the proof of convergence. 

---
### **Convergence Results**

It's separate, see [[ADMM Convergence]] for more details. We make the same assumptions as before when we derive the feasibility of the algorithm during the iteration, that $f, g$ are augmented real functions and CCP, at the same time, strong duality holds for the problem so that a saddle point can be identified. 


---
### **Proxing over the Affine Linear Composition**

References: 4.4.2 of \<Proximal Algorithm\> by Bloyd. Here we consider the case where $g$ has an easy proximal operator, but, that doesn't mean the proximal operator for $g(Ax)$ is anywhere related to $g$, or it is easy to figure out. 

---
### **Solving with Constraints**




---
### **Examples**

[^1]: It's assumed instead of being a fact of the assumptions on $f, g$, and the optimal solution and Lagraigian, more invesitgations might be needed for this detail. 


