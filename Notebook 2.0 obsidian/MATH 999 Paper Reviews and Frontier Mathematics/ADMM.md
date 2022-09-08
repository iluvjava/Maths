Major Reference Sources: 
* [Stanford University](https://stanford.edu/~boyd/admm.html) ALL IN ONE Resources for ADMM 
* Paper [link](https://stanford.edu/~boyd/papers/pdf/admm_distr_stats.pdf)
* Paper [[Proximal Algorithms in Stats and ML.pdf]]

Prerequisites: 
* [[Characterizing Functions for Optimizations]]
* [[Moreau Envelope and Proximal Mapping]]
* [[Subgradient and Subdifferential Definition]]

---
### **Intro**
Alternating direction method of multiplier (ADMM). We state the assumptions of the algorithms and then summarized the algorithms. Including: 

1. The formulations of the Augmented Lagrangian
2. The assumptions made 
3. The optimality conditions 
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
    \mathcal L_\gamma(x, z, \lambda) = l(x) + \phi(x) + \frac{1}{2\gamma}(
        \Vert r - u\Vert^2 - \Vert u\Vert^2
    )
\end{aligned}, 
$$

we derive it by: 

$$
\begin{aligned}
    \mathcal L_\gamma(x, z, \lambda = \gamma u) = l(x) + \phi(x) + \langle \lambda, x - z\rangle + \frac{1}{2\gamma}\Vert x - z\Vert^2

\end{aligned}
$$

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

which requires solving the problem problem for each ascend step of the dual variable. 


---
### **Methods of Multipliers**


---
### **Splitting and ADMM**


---
### **Convergence Results**

See the appendix of the references. 





