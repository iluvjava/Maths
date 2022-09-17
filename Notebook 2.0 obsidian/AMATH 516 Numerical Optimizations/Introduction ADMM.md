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
\min_{x, z} l(x) + \phi(z) \text{ s.t: }x = z,
$$

were we have one more variables of the same dimension. The Lagrangian of this primal problem would be given as the following: 
$$
\mathcal{L}(x, z, \lambda) = g(x) + \phi(z) + \langle \lambda, x - z\rangle. 
$$

**Definition Augmented Lagrangian**: 

The augmented Lagrangian is the same problem listed above but with a quadratic penalization norm: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, \lambda) = 
    g(x) + \phi(z) + \langle \lambda, x - z\rangle + \frac{\gamma}{2}\Vert x - z\Vert^2
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
    \mathcal L_\gamma(x, z, u) = l(x) + \phi(x) + \frac{1}{2\gamma}(
        \Vert r - u\Vert^2 - \Vert u\Vert^2
    )
\end{aligned}, 
$$

we derive it by considering: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, \lambda = \gamma u) = l(x) + \phi(x) + 
    \underbrace{\langle \lambda, x - z\rangle + \frac{1}{2\gamma}\Vert x - z\Vert^2}_{[1]}. 
\end{aligned}
$$

And we would like to consider chainging the form of \[1\] so that it matches: $\frac{1}{2\gamma}(\Vert r - u\Vert^2 - \Vert u\Vert^2)$ as in the scaled form. Substituting the definition of $r$ into \[1\] we have: 
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

which is exactly the same as the last term for the scaled Lagrangian. 


---
### **Methods of Dual Ascend**
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
    & u^{(k + 1)} := u^{(k)} + \underbrace{Ax^{(k + 1)} + Bz^{(k + 1)} - c}_{=: r^{(k + 1)}}
\end{aligned}
$$

---
### **Dual Feasibility of ADMM**

**#TODO, #URGENT** 



---
### **Convergence Results**

See [[ADMM Convergence]]. 





