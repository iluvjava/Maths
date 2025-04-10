- [A Better Proof for FISTA Convergence](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
### **Intro**

We improve upon the previous proof and make it simpler. 
We assume the following optimization problem: 
$$
\begin{aligned}
    \min_{x \in \R^n}\{F(x):= f(x) + g(x)\}. 
\end{aligned}
$$

Unless specified, the following are assumed throughout. 

#### **Assumptions**
1. $f$ is a differentiable function with $L$ Lipschitz gradient. 
2. $g$ is a convex function. 
3. $\argmin{x}{F(x)} \neq \emptyset$. 

This is a description of the three points algorithm. 


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

This is a single-valued operator. 

#### **Algorithm | Accelerated proximal gradient**
> Let $(\alpha_k)_{k \ge 0}$ be a sequence in $\R$. 
> Initialize with $y_0 = x_0 = v_0$. 
> For $k = 1, \ldots$ updates: 
> $$
> \begin{aligned}
>     y_{k} &= \alpha_{k} v_{k - 1} + (1 - \alpha_{k}) x_{k - 1}. 
>     \\
>     x_k &= T_Ly_k, 
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}).
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
### **Convergence rate accelerated gradient algorithm**

#### **Theorem | convergence rate of accelerated proximal gradient**
> Let $(\alpha_k)_{k \ge 0}$ be a sequence in $\R$ such that $\alpha_k^{-2}(1 - \alpha_k) \le \alpha_{k - 1}^{-2}$ for all $k \ge 1$. 
> Initialize the Accelerated proximal gradient algorithm with $\alpha_0 = 1$ and let $(x_k, v_k, y_k)_{k \ge0}$ be the sequence generated. 
> Let $x^+$ be a minimizer of $F$, then it has for all $k \ge 1$: 
> $$
> \begin{aligned}
>     F(x_k) - F(x^+) + \frac{L\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2 
>     \le 
>     \alpha_k^2 \left(
>         F(x_0) - F(x^+) - \frac{L}{2}\Vert x^+ - v_0\Vert^2
>     \right). 
> \end{aligned}
> $$

Suppose $x^+$ exists as a minimizer of $F$. 
Define $z_k = \alpha_k x^+ + (1 - \alpha_k)x_{k - 1}$. 
It can be verified that: 
$$
\begin{aligned}
    z_k - x_k &= \alpha_k(x^+ - v_k),
    \\
    z_k - y_k &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

To verify, consider the definition of the algorithm: 

$$
\begin{aligned}
    z_k - x_k &= 
    \alpha_k x^+ + (1 - \alpha_k)x_{k - 1} - x_k
    \\
    &= \alpha_kx^+ + (x_{k - 1} - x_k) - \alpha_kx_{k - 1}
    \\
    &= \alpha_k x^+ - \alpha_k v_k, 
    \\
    z_k - y_k &= 
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
    &\le F(z_k) 
    - F(x_k) - \frac{L}{2}\Vert z_k - x_k\Vert^2 + 
    \frac{L}{2}\Vert z_k - y_k\Vert^2
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

**Remarks**

This proof is inspired by the approach in the Catalyst Paper. It's our belief that it can be improved further. 
It doesn't use any inner product making which is fascinating. 

#### **Discussion**

Let's talk about convergence of quantities other than the objective function $F$. 
With the assumption that $g \equiv 0$, it has $F = f$. 
Using the Lipschitz continuity of the gradient it has the inequality: 

$$
\begin{aligned}
    \alpha_k^2\left(
        f(x_0) - f^+
    \right) \ge 
    f(x) - \inf_{x} f(x) &\ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2. 
\end{aligned}
$$

Which is all we can say. 

---
### **Extensions and modifications**

There are two variants of the Monotone version of FISTA. 
One is from Amir Beck. 
The other one is from Nesterov's Original writing which also appeared in the Catalyst Non-convex paper. 

#### **Algorithm | MFISTA with Armijo Line Search**
> Initialize with $y_0 = x_0 = v_0, \alpha_0 = 1$. 
> For all $k = 1, \ldots$ the algorithm create sequences $(x_k, v_k, y_k)$ by:
> $$
> \begin{aligned}
>     y_k &= \alpha_k v_{k - 1} + (1 - \alpha_k) x_{k - 1}, \\
>     \tilde x_k &= T_L(y_{k}), \\
>     x_k &= \argmin{z}
>     \left\lbrace
>         f(z) \left |\; z \in \{\tilde x_k, x_{k - 1}\}
>         \right.
>     \right\rbrace,
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}) + \alpha_k^{-1}(\tilde x_k - x_k). 
> \end{aligned}
> $$
> Here, the sequence of $L_k$ is generated by any line search routine such that it asserts for all $k \ge 0$ the condition: 
> $$
> \begin{aligned}
>     D_{f}(\tilde x_k, y_k) \le \frac{L_k}{2}\Vert \tilde x_k - y_k\Vert^2. 
> \end{aligned}
> $$
> And there exists some $\overline L$ such that $\overline L \ge L_k$ for all $k \ge 0$. 

**Observations**

Obviously it has $F(x_k) \le \min(F(\tilde x_k), F(x_{k - 1})) \le F(x_{k - 1})$, this makes the most recent iterate always the smallest. 
This is a simpler representation. 
Observe that, if $x_k = x_{k - 1}$ then 

$$
\begin{aligned}
    y_{k + 1} &= \alpha_{k + 1}(v_k) + (1 - \alpha_{k + 1})x_k
    \\
    &= \alpha_{k + 1}(x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k})) + (1 - \alpha_{k + 1})x_k
    \\
    &= \alpha_{k + 1}(x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1})) + (1 - \alpha_{k + 1})x_{k - 1}
    \\
    &= \alpha_{k + 1} x_{k - 1} + \alpha_{k + 1}\alpha_k^{-1}(\tilde x_k - x_{k - 1}) + (1 - \alpha_{k + 1}) x_{k - 1}
    \\
    &= x_{k - 1} + \alpha_{k + 1}\alpha_k^{-1}(\tilde x_k - x_{k - 1})
    \\
    &= \tilde x_k + (\alpha_{k + 1} \alpha_k^{-1} - 1)(\tilde x_k - x_{k - 1}). 
\end{aligned}
$$
It's not exactly clear on what it's trying to do in this case. 
Otherwise, $x_k = \tilde x_k$ and it yields: $v_k = x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1})$, this gives: 

$$
\begin{aligned}
    y_{k + 1} &= 
    \alpha_{k + 1}v_k + (1 - \alpha_{k + 1})x_k
    \\
    &= 
    \alpha_{k + 1}(x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1})) + (1 - \alpha_{k + 1})x_k
    \\
    &= 
    \alpha_{k + 1}\left(
        (1 - \alpha_{k}^{-1})x_{k - 1} + (\alpha_k^{-1} - 1)x_k + x_k
    \right) + 
    (1 - \alpha_{k + 1})x_k
    \\
    &= 
    \alpha_{k + 1}\left(
        (\alpha_k^{-1} - 1)(x_k - x_{k - 1}) + x_k
    \right) + 
    (1 - \alpha_{k + 1})x_k
    \\
    &= x_k + \alpha_{k + 1}(\alpha_k^{-1} - 1)(x_k - x_{k - 1}). 
\end{aligned}
$$

It reduces to the original without monotone constraint FISTA under this case. 
The convergence results now follow. 

#### **Theorem | Convergence of MFISTA**

**Proof**

Define $z_k = \alpha_k x^+ + (1 - \alpha_k) x_{k - 1}$ for all $k \ge 0$. 
To start, we first establish the equalities that: 

$$
\begin{aligned}
    z_k - x_k &= \alpha_k(x^+ - v_k) + \tilde x_k - x_k, 
    \\
    x_k - y_k &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

To demonstrate, it has 

$$
\begin{aligned}
    z_k - x_k &= 
    (\alpha_k x^+ + (1 - \alpha_k)x_{k - 1}) - x_k
    \\
    &= \alpha_k x^+ - \alpha_k x_{k - 1} + (x_{k - 1} - x_k)
    \\
    &= 
    \alpha_k(x^+ - x_{k - 1} + \alpha_k^{-1}(x_{k - 1} - x_k))
    \\
    &= 
    \alpha_k(x^+ - x_{k - 1} + \alpha_k^{-1}(x_{k - 1} - x_k) - \alpha_k^{-1}(\tilde x_k - x_k) + \alpha_k^{-1}(\tilde x_k - x_k))
    \\
    &= \alpha_k(x^+ - v_k), 
    \\
    z_k - y_k &= 
    (\alpha_k x^+ + (1 - \alpha_k)x_{k - 1}) - \left(
        \alpha_k v_{k - 1} + (1 - \alpha_k)x_{k - 1}
    \right)
    \\
    &= \alpha_k(x^+ + \alpha_k^{-1}(1 - \alpha_k)x_{k - 1} - v_{k - 1} - \alpha_k^{-1}(1 - \alpha_k)x_{k - 1})
    \\
    &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

Suppose that $(\alpha_k)_{k\ge 0}$ has $\forall k \ge 1$: $\alpha_k^{-2}(1 - \alpha_k) \le \alpha_{k - 1}^{-2}$, then the convergence rate can be derived by: 

$$
\begin{aligned}
    
\end{aligned}
$$

$\blacksquare$

However, Nesterov's Monotone Accelerated Gradient method is different from MFISTA. 
It requires more computations at each step, and it's stated below. 

#### **Algorithm | Nesterov's Monotone Accelerated Gradient**




---
### **Accelerated proximal gradient with strong convexity**

The convergence analysis will be dependent on the similar triangle form discussed in [Weak Accelerated Proximal Gradient Part II](Weak%20Accelerated%20Proximal%20Gradient%20Part%20II.md). 

#### **Similar Triangle Form**
> Let iterates $(y_k, x_{k}, v_{k})_{k \ge 1}$ and sequence $(\alpha_k, \rho_k)_{k \ge 0}$ be given by Definition R-WAPG. 
> Then for all $k \ge 1$, iterate $y_k, x_{k + 1}, v_{k + 1}$
> satisfy: 
> $$
> \begin{aligned}
>     y_{k} &= 
>     \left(
>         1 + \frac{L - L\alpha_{k}}{L\alpha_{k} - \mu}
>     \right)^{-1}
>     \left(
>         v_{k} + 
>         \left(\frac{L - L\alpha_{k}}{L\alpha_{k} - \mu} \right) x_{k}
>     \right), 
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
> \end{aligned}
> $$

Make the observations that the update of the iterates has alternative representations for $y_k, v_{k}$. 

