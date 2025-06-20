- [Weak Accelerated Proximal Gradient Part I](MATH%20602%20Nesterov%20Acceleration/Weak%20Accelerated%20Proximal%20Gradient%20Part%20I.md)
- [Proximal Gradient Inequality Part I](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20Inequality%20Part%20I.md)

---
### **Intro**


#### **Assumption 1**
> The function $F = f + g$ where, $f:\R^n \rightarrow \R$ is a $L$ Lipschitz smooth and $\mu \ge 0$ strongly convex function. 
> The function $g:\R^n \rightarrow \overline \R$ is a closed convex proper function. 

#### **Definition | the proximal gradient operator**
> Suppose $F = f + g$ satisfies Assumption 1. 
> Let $\beta > 0$. 
> Then, we define the proximal gradient operator $T_{\beta}$ as 
> $$
> \begin{aligned}
>     T_\beta (x) &= \argmin{z} \left\lbrace
>         g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{\beta}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

**Remarks**

If the function $g \equiv 0$, then it yields the gradient descent operator $T_\beta(x) = x - \beta^{-1}\nabla f(x)$. 

---
### **Relaxed Weak Accelerated Proximal Gradient Algorithm**

#### **Definition | R-WAPG Sequence**
> Let $L > \mu \ge 0$. 
> Let $\alpha_0 \in (0, 1)$, $(\alpha_k)_{k \ge 1}$ has $\alpha_k \in (\mu/ L, 1)$. 
> Then define for all $k \ge 0$: 
> $$
> \begin{aligned}
>     \rho_k(1 - \alpha_k)\alpha_k^2 = \alpha_{k + 1}(\alpha_{k + 1} - \mu/L). 
> \end{aligned}
> $$

#### **Definition | similar triangle form**
> Let $(\alpha_k)_{k \ge 0}$ be an R-WAPG sequence. 
> Define $\tau_k = \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}$. 
> Suppose that the base case $v_{-1}, x_{k - 1}$ is provided. 
> Then the algorithm produces the sequence $(y_k, x_k, v_k)_{k \ge 0}$ satisfies these inequalities: 
> $$
> \begin{aligned}
>     y_k &= (1 + \tau_k)^{-1} v_{k - 1} + \tau_k (1 + \tau_k)^{-1} x_{k - 1},
>     \\
>     x_k &= T_L(y_k),
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}). 
> \end{aligned}
> $$

In preprations of the proof for the convergence rate of the algorithm for one iteration, the the following lemmas and theorems are relevant. 


#### **Theorem | Jesen's strongly convex inequality**
> Let $F: \R^n \rightarrow \overline \R$ be a $\mu \ge 0$ strongly convex function. 
> Then, it is equiavlent to the following condition. 
> For all $x, y \in \R^n$, $\lambda \in (0, 1)$ it satsifies the inequality 

$$
\begin{aligned}
    
\end{aligned}
$$




