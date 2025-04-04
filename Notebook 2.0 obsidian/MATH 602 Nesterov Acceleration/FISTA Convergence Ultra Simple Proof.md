- [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
### **Intro**

We improve upon the previous proof and make it simpler. 
This is a descriptions of the three points algorithm. 
#### **Definition | proximal gradient operator**
> Let $F = f + g$ where $f$ is differentiable, $L$ Lipschitz smooth. 
> $g$ is convex. 
> Define the proximal gradient operator: 
> $$
> \begin{aligned}
>     T_Lx = \argmin{z \in \R^n }
>     \left\lbrace 
>         g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{L}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

This is a single valued operator. 

#### **Algorithm | Accelerated proximal gradient algorithm**
> Initialize with $y_0 = x_0 = v_0$, $\alpha_0 = 1$.
> For $k = 1, \ldots$ updates: 
> $$
> \begin{aligned}
>     x_k &= T_Ly_k, 
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1})
>     \\
>     y_{k + 1} &= \alpha_{k + 1} v_{k} + (1 - \alpha_{k + 1}) x_{k}. 
> \end{aligned}
> $$

Proved in [Fundamental Proximal Gradient Inequality](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Fundamental%20Proximal%20Gradient%20Inequality.md) is the following theorem: 

#### **Theorem | Proximal gradient inequality**
> Assume that $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu \ge 0$ convex. 
> Then, for $y \in \R^n, \bar y = T_Ly$ it has the following: 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad 
>     0 &\le 
>     F(x) - F(\bar y) - \langle L(y - \bar y), x - y\rangle
>     - \frac{\mu}{2}\Vert x - y\Vert^2
>     - \frac{L}{2}\Vert y - \bar y\Vert^2. 
>     \\
>     &= F(x) - F(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2  + \frac{L - \mu}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

---
### **Convergence rate of the algorithm**

Suppose $x^+$ exists as a minimizer of $F$. 
Define $z = \alpha_k x^+ + (1 - \alpha_k)x_{k - 1}$. 
It can be verified that: 
$$
\begin{aligned}
    z - x_k &= \alpha_k(x^+ - v_k),
    \\
    z - y_k &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

To verify, consider the definition of the algorithm: 

$$
\begin{aligned}
    z - x_k &= 
    \alpha_k x^+ + (1 - \alpha_k)x_{k - 1} - x_k
    \\
    &= \alpha_kx^+ + (x_{k - 1} - x_k) - \alpha_kx_{k - 1}
    \\
    &= \alpha_k x^+ - \alpha_k v_k, 
    \\
    z - y_k &= 
    \alpha_k x^+ + (1 - \alpha_k)x_{k - 1} - y_k
    \\
    &= \alpha_k x^+ + ((1 - \alpha_k)x_{k - 1} - y_k)
    \\
    &= \alpha_kx^+ - \alpha_k v_{k - 1}. 
\end{aligned}
$$

Suppose that the sequence $(\alpha_k)_{k\ge 0}$ satisfies $\alpha_k^{-2}(1 - \alpha_k) \le \alpha_{k - 1}^{-2}$ for all $k \ge 1$ with $\alpha_0 = 1$ being the base case. 
Use the proximal gradient inequality with  it then has $\forall k \ge 1$: 

$$
\begin{aligned}
    0 
    &\le F(z) 
    - F(x_k) - \frac{L}{2}\Vert z - x_k\Vert^2 + 
    \frac{L}{2}\Vert z - y_k\Vert^2
    \\
    &\le 
    \alpha_k F(x^+) + (1 - \alpha_k) F(x_{k - 1}) - F(x_k)
    + \frac{L\alpha_k^2}{2}
    \left(
        \Vert x^+ - v_{k - 1}\Vert^2 - \Vert x^+ - v_k\Vert^2
    \right)
    \\
    &= 
    (\alpha_k - 1)F(x^+) + F(x^+) + (1 - \alpha_k) F(x_{k - 1}) - F(x_k)
    + \frac{L\alpha_k^2}{2} \Vert x^+ - v_{k - 1}\Vert^2 
    - \frac{L\alpha_k^2}{2} \Vert x^+ - v_k\Vert^2 
    \\
    &= 
    (1 - \alpha_k)(F(x_{k - 1}) - F(x^+))
    + F(x^+) - F(x_k)
    + \frac{L\alpha_k^2}{2} \Vert x^+ - v_{k - 1}\Vert^2 
    - \frac{L\alpha_k^2}{2} \Vert x^+ - v_k\Vert^2 
    \\
    &= 
    \left(
        (1 - \alpha_k)(F(x_{k - 1}) - F(x^+))
        + \frac{L\alpha_k^2}{2} \Vert x^+ - v_{k - 1}\Vert^2 
    \right)
    -
    \left(
        F(x_k) - F(x^+) + 
        \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right)
    \\
    &= 
    \alpha_{k}^{2}
        \left(
        \left(
            \alpha_k^{-2}(1 - \alpha_k)(F(x_{k - 1}) - F(x^+))
            + \frac{L}{2} \Vert x^+ - v_{k - 1}\Vert^2 
        \right)
        -
        \left(
            \alpha_k^{-2}(F(x_k) - F(x^+)) + 
            \frac{L}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \right)
    \\
    &\le 
    \alpha_{k}^{2}
        \left(
        \left(
            \alpha_{k - 1}^{-2}(F(x_{k - 1}) - F(x^+))
            + \frac{L}{2} \Vert x^+ - v_{k - 1}\Vert^2 
        \right)
        -
        \left(
            \alpha_k^{-2}(F(x_k) - F(x^+)) + 
            \frac{L}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \right)
    \\
    &=
    \alpha_{k}^{2}\left(
        \alpha_{k - 1}^{-2}
        \left(
            F(x_{k - 1}) - F(x^+)
            + \frac{L \alpha_{k - 1}^2}{2} \Vert x^+ - v_{k - 1}\Vert^2 
        \right)
        -
        \alpha_{k}^{-2}
        \left(
            F(x_k) - F(x^+) + 
            \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \right)
    \\
    &= 
    \frac{\alpha_{k - 1}^{-2}}{\alpha_k^{-2}}
    \left(
        F(x_{k - 1}) - F(x^+)
        + \frac{L \alpha_{k - 1}^2}{2} \Vert x^+ - v_{k - 1}\Vert^2 
    \right)
    -
    \left(
        F(x_k) - F(x^+) + 
        \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right)
    \\
    &\le \frac{\alpha_{k - 1}^{-2}\alpha_{k - 2}^{-2}}{\alpha_k^{-2}\alpha_{k - 1}^{-2}}
    \left(
        F(x_{k - 2}) - F(x^+)
        + \frac{L \alpha_{k - 2}^2}{2} \Vert x^+ - v_{k - 2}\Vert^2 
    \right)
    -
    \left(
        F(x_k) - F(x^+) + 
        \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right)
    \\
    & \quad (\cdots)
    \\
    &\le \frac{\alpha_0^{-2}}{\alpha_k^{-2}}
    \left(
        F(x_0) - F(x^+) + 
        \frac{L}{2}\Vert x^+ - v_0\Vert^2
    \right) - 
    \left(
        F(x_k) - F(x^+) + 
        \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right)
    \\
    &= \alpha_k^2
    \left(
        F(x_0) - F(x^+) + 
        \frac{L}{2}\Vert x^+ - v_0\Vert^2
    \right) - 
    \left(
        F(x_k) - F(x^+) + 
        \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right). 
\end{aligned}
$$

Rearranging, it's done. $\blacksquare$


