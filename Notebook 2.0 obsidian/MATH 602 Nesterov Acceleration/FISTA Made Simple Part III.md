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
>     T_\beta (x | F) &= \argmin{z} \left\lbrace
>         g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{\beta}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

**Remarks**

If the function $g \equiv 0$, then it yields the gradient descent operator $T_\beta(x) = x - \beta^{-1}\nabla f(x)$. 
In the context where it's clear what the function $F = f + g$ is, we simply write $T_\beta(x)$ for short. 

#### **Definition | Bregman Divergence**
> Let $f:\R^n \rightarrow \overline \R$ be a differentiable function. 
> Then, for all the Bregman divergence $D_f: \R^n \times \text{dom}\nabla f \rightarrow \R$ is defined as: 
> $$
> \begin{aligned}
>     D_f(x, y) := f(x) - f(y) - \langle \nabla f(y), x - y\rangle. 
> \end{aligned}
> $$

**Remarks**

This condition is used in line search for the proximal gradient inequality. 


---
### **Relaxed Weak Accelerated Proximal Gradient Algorithm**

The relaxed weak accelerated proximal gradient algorithm has a simple and compact proof behind it, if we use the similar triangle representation of the algorithm. 


#### **Definition | R-WAPG Sequence**
> Let $(L_k)_{k \ge 0}$ be a sequence such that $L_k > \mu$ for all $k$. 
> Let $\alpha_0 \in (0, 1]$, $(\alpha_k)_{k \ge 1}$ has $\alpha_k \in (\mu/ L_k, 1)$. 
> Then define for all $k \ge 0$: 
> $$
> \begin{aligned}
>     \rho_k(1 - \alpha_{k + 1})\alpha_k^2 = \alpha_{k + 1}(\alpha_{k + 1} - \mu/L_k). 
> \end{aligned}
> $$

#### **Definition | similar triangle form**
> Let $(\alpha_k)_{k \ge 0}$ be an R-WAPG sequence. 
> 
> Suppose that the base case $v_{-1}, x_{k - 1}$ is provided. 
> Then the algorithm produces the sequence $(y_k, x_k, v_k)_{k \ge 0}$ satisfies these inequalities: 
> $$
> \begin{aligned}
>     y_k &= (1 + \tau_k)^{-1} v_{k - 1} + \tau_k (1 + \tau_k)^{-1} x_{k - 1},
>     \\
>     x_k &= T_{L_k}(y_k),
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}). 
> \end{aligned}
> $$
> Here, $\tau_k = L_k(1 - \alpha_k)(L_k\alpha_k - \mu)^{-1}$.
> In addition, we assume a dynamic line search policy so that it also assets the inequality $D_f(x_k, y_k) \le L_k/2\Vert x_k - y_k\Vert^2$. 

In preparation of the proof for the convergence rate of the algorithm for one iteration, the following lemmas and theorems are relevant. 


#### **Theorem 1 | Jensen's strongly convex inequality**
> Let $F: \R^n \rightarrow \overline \R$ be a $\mu \ge 0$ strongly convex function. 
> Then, it is equivalent to the following condition. 
> For all $x, y \in \R^n$, $\lambda \in (0, 1)$ it satisfies the inequality 
> $$
> \begin{aligned}
>     (\forall \lambda \in [0, 1])\; 
>     F(\lambda x + (1 - \lambda)y) \le \lambda F(x) + (1 - \lambda)F(y) -\mu\frac{\lambda(1 - \lambda)}{2} \Vert y - x\Vert^2. 
> \end{aligned}
> $$
> 

**Proof**

This is well known, proof is in [Strong Convexity](../AMATH%20516%20Numerical%20Optimizations/Properties%20of%20Functions/Strong%20Convexity.md). 

$\blacksquare$


#### **Theorem 2 | the proximal gradient inequality**
> Let function $F$ satisfies Assumption 1, so it's $\mu \ge 0$ strongly convex. 
> Then, it satisfies the proximal gradient inequality. 
> It has, for all $x \in \R^n, z \in \R^n$, define $x^+ = T_L(x)$: 
> $$
> \begin{aligned}
>     0&\le F(z) - F(x^+) - \frac{L}{2}\Vert z - x^+\Vert^2  + \frac{L - \mu}{2}\Vert z - x\Vert^2
>     \\
>     &=  F(z) - F(x^+) - \langle L(x - x^+), z - x\rangle
>     - \frac{\mu}{2}\Vert z - x\Vert^2
>     - \frac{L}{2}\Vert x - x^+\Vert^2. 
> \end{aligned}
> $$

Under the context of a dynamic line search policy employed to the similar triangle form, we would have $x = y_k, x_k = x^+$, then, the above inequality is satisfied for all $z \in \R^n$, $k \ge 0$: 

$$
\begin{aligned}
    0 &\le F(z) - F(x_k) - \frac{L_k}{2}\Vert z - x_k\Vert^2 + \frac{L_k - \mu}{2}\Vert z - y_k\Vert^2. 
\end{aligned}\tag{1}
$$

The choice of $x,y$ is restricted to only the iterates where line search occurred. 
This inequality due to the line search condition: 

$$
\begin{aligned}
    D_f(x_k, y_k) \le \frac{L_k }{2}\Vert x_k - y_k\Vert^2.    
\end{aligned}
$$

---
### **The one-step convergence claim**

Using all the tools above, we can find the convergence rate of the algorithm for all R-WAPG sequence. 

#### **Theorem 3 | one-step convergence claim**
> Let $F = f + g$ satisfies Assumption 1 for some $L > \mu \ge 0$. 
> Let the sequence $(\alpha_k)_{k \ge0}$ be an R-WAPG sequence. 
> Suppose that $(x_k, y_k, v_k)_{k \ge 0}$ satisfies Similar Triangle form of the accelerated proximal gradient algorithm for some initial $v_{-1}, x_{-1}$. 
> Then for all $k \ge 1$, the following inequality is satisfied for all $\bar x \in \R^n$: 
> $$
> \begin{aligned}
>    - F(\bar x) + F(x_k) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
>    & \le \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)(1 - \alpha_k)\left(
>        F(x_{k - 1}) - F(\bar x) 
>        + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
>    \right). 
> \end{aligned}
> $$
> If in addition, we choose $\alpha_0 = 1$, and let $x_{-1} = v_{-1}$, then a base case of the inequality is: 
> $$
> \begin{aligned}
>     F(x_{0}) - F(\bar x) + \frac{L_0}{2}\Vert \bar x - x_{0}\Vert^2 
>     &\le \frac{L_0 - \mu}{2}\Vert \bar x - v_{-1}\Vert^2. 
> \end{aligned}
> $$

**Proof**

Let define the sequence $z_k = \alpha_k \bar x + (1 - \alpha_k)x_{k - 1}$ for all $k \ge 0$. 
Here is a list of intermediate results labeled to prove the inequality above. 
1. **(a)**: The Proximal Gradient inequality in inequality (1), but with $z = z_k$, $k \ge 0$. 
2. **(b)**: The Jensen's inequality, with $z = z_k$, for $k \ge 0$. 
3. **(c)**: The definition of the R-WAPG sequence, $\rho_k(1 - \alpha_{k + 1})\alpha_k^2 = \alpha_{k + 1}(\alpha_{k + 1} - \mu/L_k)$ for $k \ge 0$.
4. **(d)**: The equality $z_k - y_k = (L_k - \mu)^{-1}((L_k\alpha_k - \mu)(\bar x - v_k) + \mu(1 - \alpha_k)(\bar x - x_{k - 1}))$. This will be proved at the end.
5. **(e)**: The equality $z_k - x_k = \alpha_k(\bar x - v_k)$. 
6. **(f)**: This will be proved at the end:
$$
\begin{aligned}
    (\forall k \ge 1)\; \frac{1}{2}\left(
        \frac{\mu^2(1 - \alpha_k)^2}{L_k - \mu} - \mu \alpha_k(1 - \alpha_k)
    \right) &= 
    \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}. 
\end{aligned}
$$

1. **(g)**: This will be proved at the end:
$$
\begin{aligned}
    (\forall k \ge 1)\; 
    \frac{1}{2}\left(
        \frac{(L_k\alpha_k - \mu)^2}{L_k - \mu} - 
        \alpha_{k - 1}^2\rho_{k - 1}L_k(1 - \alpha_k)
    \right)
    &= 
    \frac{\mu(L_k\alpha_k - \mu)(\alpha_k - 1)}{2(L_k - \mu)}. 
\end{aligned}
$$
1. **(h)**: This will be proved at the end: 
$$
\begin{aligned}
    (\forall k \ge 1)\; \frac{\mu(L_k\alpha_k - \mu)(\alpha_k - 1)}{2(L_k - \mu)} &\le 0. 
\end{aligned}
$$

Assume $k \ge 1$. 
With these intermediate results, the proof starts with the proximal gradient inequality: 

$$
\begin{aligned}
    0 &\le F(z_k) - F(x_k) - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 + \frac{L_k - \mu}{2}\Vert z_k - y_k\Vert^2
    \\
    &\underset{\text{(b)}}{\le}
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k) 
    - \frac{\mu\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 + \frac{L_k - \mu}{2}\Vert z_k - y_k\Vert^2. 
\end{aligned}\tag{2}
$$

Now, the last 3 terms can be simplified through a chain of equalities, look: 

$$
\begin{aligned}
    &- \frac{\mu\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    + \frac{L_k - \mu}{2}\Vert z_k - y_k\Vert^2
    \\
    &\underset{\text{(d)}}{=} 
    -\frac{\mu\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    + \frac{L_k - \mu}{2}
    \left\Vert 
        \frac{L_k\alpha_k - \mu}{L_k - \mu}(\bar x - v_{k - 1}) + 
        \frac{\mu(1 - \alpha_k)}{L_k - \mu}(\bar x - x_{k - 1})
    \right\Vert^2
    \\
    &= 
    - \frac{\mu\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    \\
    &\quad + 
        \frac{(L_k\alpha_k - \mu)^2}{2(L_k - \mu)} \Vert \bar x - v_{k - 1}\Vert^2
        + \frac{\mu^2(1 - \alpha_k)^2}{2(L_k - \mu)} \Vert \bar x - x_{k - 1}\Vert^2
        + \frac{(L_k\alpha_k - \mu)\mu(1 - \alpha_k)}{L_k - \mu}\langle \bar x - x_{k - 1}, \bar x - v_{k - 1}\rangle
    \\
    &= \left(
        \frac{\mu^2(1 - \alpha_k)^2}{2(L_k - \mu)} - \frac{\mu\alpha_k(1 - \alpha_k)}{2}
    \right)\Vert \bar x - x_{k - 1}\Vert^2
    + 
    \left(
        \frac{(L_k\alpha_k - \mu)^2}{2(L_k - \mu)}
        - \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}
    \right)\Vert \bar x - v_{k - 1}\Vert^2
    \\ &\quad 
        + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
        + \frac{(L_k\alpha_k - \mu)\mu(1 - \alpha_k)}{L_k - \mu}\langle \bar x - x_{k - 1}, \bar x - v_{k - 1}\rangle
    \\
    &\underset{\text{(f)}}{=} 
    \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}\Vert \bar x - x_{k - 1}\Vert^2
    + 
    \left(
        \frac{(L_k\alpha_k - \mu)^2}{2(L_k - \mu)}
        - \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}
    \right)\Vert \bar x - v_{k - 1}\Vert^2
    \\ &\quad 
        + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
        + \frac{(L_k\alpha_k - \mu)\mu(1 - \alpha_k)}{L_k - \mu}\langle \bar x - x_{k - 1}, \bar x - v_{k - 1}\rangle
    \\
    &\underset{\text{(g)}}{=}
    \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}\Vert \bar x - x_{k - 1}\Vert^2
    + 
    \frac{\mu(L_k\alpha_k - \mu)(\alpha_k - 1)}{2(L_k - \mu)}\Vert \bar x - v_{k - 1}\Vert^2
    \\ &\quad 
        + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
        + \frac{(L_k\alpha_k - \mu)\mu(1 - \alpha_k)}{L_k - \mu}\langle \bar x - x_{k - 1}, \bar x - v_{k - 1}\rangle
    \\
    &= 
    \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \\ & \quad
        + \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}\left(
            \Vert \bar x - x_{k - 1}\Vert^2 + \Vert \bar x - v_{k - 1}\Vert^2 - 2\langle\bar x - x_{k - 1},\bar x - v_{k - 1} \rangle
        \right)
    \\
    &= \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}\Vert x_{k - 1} - v_{k - 1}\Vert^2. 
\end{aligned}
$$

Continuing chain of inequalities (2) using the above equality it has 

$$
{\small
\begin{aligned}
    0 &\le 
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
    \\ &\quad 
    + \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}\Vert x_{k - 1} - v_{k - 1}\Vert^2
    \\
    &\underset{\text{(h)}}{\le}
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
    \\
    &= (1 - \alpha_k)(F(x_{k - 1}) - F(\bar x)) + F(\bar x) - F(x_k)
    + \frac{\alpha_{k - 1}^2L_k \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
    \\
    &\underset{\text{(e)}}{=} 
    (1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{L_k\rho_{k - 1}}{L_{k - 1}}\frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) 
    + F(\bar x) - F(x_k)-  \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
    \\
    &\le 
    (1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)
        \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) 
    + F(\bar x) - F(x_k)-  \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
    \\
    &\le (1 - \alpha_k)\left(
        \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)(F(x_{k - 1}) - F(\bar x))
        + \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)
        \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) 
    \\
    &\quad + F(\bar x) - F(x_k)-  \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
    \\
    &= 
    \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)(1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) 
    + F(\bar x) - F(x_k)-  \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2. 
\end{aligned}
}
$$

The base case is writing Inequality (1) differently. 
When $\alpha_0 = 1$, it has $y_0 = v_{-1} = x_{-1}$, and it makes $z_0 = \bar x$ therefore this makes Inequality (1) into:


$$
\begin{aligned}
    0 &\le F(z_0) - F(x_{0}) - \frac{L_0}{2}\Vert z_0 - x_0\Vert^2 + \frac{L_0 - \mu}{2}\Vert z_0 - y_0\Vert^2
    \\
    &= F(\bar x) - F(x_0) - \frac{L_0}{2}\Vert \bar x - x_0\Vert^2 + \frac{L_0 - \mu}{2}\Vert \bar x - v_{-1}\Vert^2. 
\end{aligned}
$$


Going back to prove the remaining intermediate results, the following equalities will be useful. 
$$
\begin{aligned}
    \tau_k = L_k(1 - \alpha_k)(L_k\alpha_k - \mu)^{-1}.
\end{aligned}\tag{i}
$$

$$
\begin{aligned}
    (1 + \tau_k)^{-1}
    &\underset{\text{(i)}}{=} \left(
        1 + \frac{L_k(1 - \alpha_k)}{L_k\alpha_k - \mu}
    \right)^{-1} = \left(
        \frac{L_k\alpha_k - \mu + L_k(1 - \alpha_k)}{L_k\alpha_k - \mu}
    \right)^{-1}
    = \frac{L_k\alpha_k - \mu}{L_k - \mu}.
\end{aligned}\tag{j}
$$

$$
\begin{aligned}
    \tau_k(1 + \tau_k)^{-1} &\underset{\text{(i),(j)}}= 
    \frac{L_k(1 - \alpha_k)}{L_k\alpha_k - \mu}
    \frac{L_k\alpha_k - \mu}{L_k - \mu}
    \\
    &= \frac{L_k(1 - \alpha_k)}{L_k - \mu}. 
\end{aligned}\tag{k}
$$

Take note that, because $\alpha_k \in (\mu/L_k, 1)$ for all $k \ge 1$, $\tau_k > 0$ for all $k \ge 1$.
However, $\alpha_0 \in (0, 1]$, so it's possible to have $\tau_0 = 0$. 

**Proof of (d)**

To prove it, first observe that the updates of $y_k$, it has for all $k \ge 1$: 

$$
\begin{aligned}
    0 &= (1 + \tau_k)^{-1} v_{k - 1} + \tau_k (1 + \tau_k)^{-1} x_{k - 1} - y_k
    \\
    &\underset{\text{(k)}}{=} (1 + \tau_k)^{-1} v_{k - 1} + \frac{L_k(1 - \alpha_k)}{L_k - \mu} x_{k - 1} - y_k
    \\
    &= (1 + \tau_k)^{-1} v_{k - 1} +(1 - \alpha_k)x_{k - 1} + \left(
        \frac{L_k(1 - \alpha_k)}{L_k - \mu} - (1 - \alpha_k)
    \right) x_{k - 1} - y_k
    \\
    &= (1 + \tau_k)^{-1} v_{k - 1} +(1 - \alpha_k)x_{k - 1} + 
    (1 - \alpha_k)\left(
        \frac{L_k}{L_k - \mu} - 1
    \right) x_{k - 1} - y_k
    \\
    &= (1 + \tau_k)^{-1} v_{k - 1} +(1 - \alpha_k)x_{k - 1} + 
    \frac{\mu(1 - \alpha_k)}{L - \mu}x_{k - 1} - y_k
    \\
    \iff 
    (1 - \alpha_k)x_{k - 1} - y_k 
    &= - (1 + \tau_k)^{-1}v_{k - 1} - \frac{\mu(1 - \alpha_k)}{L_k - \mu}x_{k - 1}. 
\end{aligned}
$$

With the above the following is true: 

$$
\begin{aligned}
    z_k - y_k &= \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - y_k
    \\
    &= \alpha_k \bar x - (1 + \tau_k)^{-1}v_{k - 1} - \frac{\mu(1 - \alpha_k)}{L_k - \mu}x_{k - 1}
    \\
    &\underset{\text{(j)}}{=}
    \alpha_k \bar x - \frac{L_k\alpha_k - \mu}{L_k - \mu}v_{k - 1} 
    - \frac{\mu(1 - \alpha_k)}{L_k - \mu}x_{k - 1}
    \\
    &= \frac{L_k\alpha_k - \mu}{L_k - \mu}(\bar x - v_{k - 1})
    + \left(
        \alpha_k - \frac{L_k\alpha_k - \mu}{L_k - \mu}
    \right)\bar x - \frac{\mu(1 - \alpha_k)}{L_k - \mu}x_{k - 1}
    \\
    &= 
    \frac{L_k\alpha_k - \mu}{L_k - \mu}(\bar x - v_{k - 1})
    +
    \frac{\alpha_kL_k - \alpha_k \mu - L_k\alpha_k + \mu}{L_k - \mu}
    \bar x - \frac{\mu(1 - \alpha_k)}{L_k - \mu}x_{k - 1}
    \\
    &= \frac{L_k\alpha_k - \mu}{L_k - \mu}(\bar x - v_{k - 1})
    +
    \frac{\mu(1 - \alpha_k)}{L_k - \mu}(\bar x - x_{k - 1})
\end{aligned}
$$

**Proof of (e)**.
The proof is direct. 
For all $k \ge 1$, it has: 

$$
\begin{aligned}
    z_k - x_k &= \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - x_k
    \\
    &= \alpha_k \bar x + x_{k  1} - x_k - \alpha_k x_{k - 1}
    \\
    &= \alpha_k(\bar x - \alpha_k^{-1}(x_k - x_{k - 1}) - x_{k - 1})
    \\
    &= \alpha_k (\bar x - v_k).
\end{aligned}
$$

**Proof of (f)**. 
The proof is direct. 
For all $k \ge 0$ it has: 

$$
\begin{aligned}
    \frac{\mu^2(1 - \alpha_k)^2}{2(L_k - \mu)} - \frac{\mu\alpha_k(1 - \alpha_k)}{2}
    &= 
    \frac{1}{2(L_k - \mu)}\left(
        \mu^2(1 - \alpha_k)^2 - (L_k - \mu)\mu \alpha_k(1 - \alpha_k)
    \right)
    \\
    &= \frac{1 - \alpha_k}{2(L_k - \mu)}\left(
        \mu^2 - \mu^2\alpha_k - (L_k \mu \alpha_k - \mu^2 \alpha_k)
    \right)
    \\
    &= 
    \frac{1 - \alpha_k}{2(L_k - \mu)}\left(
        \mu^2 - L_k\mu\alpha_k
    \right)
    \\
    &= \frac{(1 - \alpha_k)\mu(\mu - L_k\alpha_k)}{2(L_k - \mu)} 
    \\
    &= \frac{(\alpha_k - 1)\mu(L_k\alpha_k - \mu)}{2(L_k - \mu)}. 
\end{aligned}
$$

**Proof of (g)**. 
For all $k \ge 0$, it follows: 

$$
\begin{aligned}
    \frac{(L_k\alpha_k - \mu)^2}{2(L_k - \mu)} - \frac{\alpha_{k - 1}^2 L \rho_{k - 1}(1 - \alpha_k)}{2}
    &\underset{\text{(c)}}{=} \frac{(L\alpha_k - \mu)^2}{2(L_k - \mu)} - \frac{L_k\alpha_k(\alpha_k - \mu/L_k)}{2}
    \\
    &= \frac{1}{2(L_k - \mu)}\left(
        (L_k\alpha_k - \mu)^2 - (L_k - \mu)L_k\alpha_k(\alpha_k - \mu/L_k)
    \right)
    \\
    &= 
    \frac{1}{2(L_k - \mu)}\left(
        (L_k\alpha_k - \mu)^2 - (L_k - \mu)\alpha_k(L_k\alpha_k - \mu)
    \right)
    \\
    &= \frac{L_k\alpha_k - \mu}{2(L_k - \mu)}\left(
        L_k\alpha_k - \mu - (L - \mu)\alpha_k
    \right)
    \\
    &= \frac{L_k\alpha_k - \mu}{2(L_k - \mu)}\left(
        \mu\alpha_k - \mu
    \right)
    \\
    &= \frac{(L\alpha_k - \mu)\mu(\alpha_k - 1)}{2(L_k - \mu)}. 
\end{aligned}
$$

**Proof of (h)**. 
For all $k \ge 1$, by (c), the definition of the R-WAPG sequence, $\alpha_k \in (\mu/L_k, 1)$, then it has $L_k\alpha_k \in (\mu, L_k)$, so $L_k\alpha_k - \mu > 0$, and $\alpha_k - 1 < 0$. 
Finally, we have $L_k \ge \mu$, therefore, the fraction is negative. 

$\blacksquare$


---
### **Fast linear rate of convergence**

Using theorem 3, the convergence rate can be derived. 
The convergence rate will be exclusively governed by the $(\alpha_k)_{k \ge 0}$ sequence. 
The following theorems, definitions will clarify.

#### **Definition | the beta sequence**
> Let $(\alpha_k)_{k \ge 0}$ be an R-WAPG sequence. 
> The $(\beta_k)_{k \ge 0}$ is a sequence defined by:
> $$
> \begin{aligned}
>     \beta_k &:= \begin{cases}
>         1 & k = 0, \\
>         \prod_{i = 0}^{k-1} \max\left(
>              1, \frac{L_{i + 1}\rho_{i}}{L_i}
>          \right)(1 - \alpha_{i + 1}) & k \ge 1. 
>     \end{cases}
> \end{aligned}
> $$

#### **Theorem 4 | generic convergence rate of the similar triangle**
> Let $F = f + g$ satisfies Assumption 1 for some $L > \mu \ge 0$. 
> Let $(\alpha_k)_{k \ge 0}$ be an R-WAPG sequence. 
> Suppose that $(x_k, y_k, v_k)_{k \ge 0}$ satisfies Similar Triangle Form of the accelerated proximal gradient algorithm for initial value $v_{-1}, x_{-1}$. 
> Then for all $k \ge 1, \bar x \in \R^n$, the following inequality is true: 
> $$
> \begin{aligned}
>     F(x_k) - F(\bar x) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
>     &\le
>     \beta_{k}
>     \left(
>         F(x_0)- F(\bar x) + \frac{\alpha_0 L_0}{2}\Vert \bar x - v_{0}\Vert^2
>     \right). 
> \end{aligned}
> $$
> If in addition, we assume that the initial condition has $\alpha_0 = 1, v_{-1} = x_{-1}$, then the convergence rate simplifies and it gives: 
> $$
> \begin{aligned}
>     F(x_k) - F(\bar x) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
>     &\le
>     \beta_{k}\frac{L_0 - \mu}{2}\Vert \bar x -v_{k - 1}\Vert^2. 
> \end{aligned}
> $$


**Proof**

Let's fix $\bar x$. 
Using Theorem 3, for all $k \ge 1$, we apply the inequality repeatedly and unroll the recursion which gives: 

$$
{\small
\begin{aligned}
    & - F(\bar x) + F(x_k) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
    \\
    & \le \max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right)(1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right)
    \\
    &\le 
    \left(
        \prod_{i = k - 2}^{k - 1} \max\left(1, \frac{L_{i + 1}\rho_{i - 1}}{L_{i - 1}}\right)(1 - \alpha_{i + 1})
    \right)
    \left(
        F(x_{k - 2}) - F(\bar x) 
        + \frac{\alpha_{k - 2}^2L_{k - 2}}{2}\Vert \bar x - v_{k - 2}\Vert^2
    \right)
    \\
    & \cdots
    \\
    &\le 
    \left(
        \prod_{i = 1}^{k - 1} \max\left(1, \frac{L_{i + 1}\rho_{i - 1}}{L_{i - 1}}\right)(1 - \alpha_{i + 1})
    \right)
    \left(
        F(x_0) - F(\bar x) 
        + \frac{\alpha_{0}^2L_{k - 2}}{2}\Vert \bar x - v_{0}\Vert^2
    \right)
    \\
    &= 
    \beta_k
    \left(
        F(x_0) - F(\bar x) 
        + \frac{\alpha_{0}^2L_{k - 2}}{2}\Vert \bar x - v_{0}\Vert^2
    \right). 
\end{aligned}
}
$$

Under the assumption that $\alpha_0 = 1, v_{-1} = x_{-1}$, then the second part of Theorem 3 applies, hence the above RHS is bounded above:

$$
\begin{aligned}
    F(x_0) - F(\bar x) + \frac{\alpha_0^2L_{0}}{2}\Vert \bar x - v_0\Vert^2
    &= 
    F(x_0) - F(\bar x) + \frac{L_{0}}{2}\Vert \bar x - v_0\Vert^2
    \\
    &\le \frac{L_0 - \mu}{2}\Vert \bar x - v_{-1}\Vert^2. 
\end{aligned}
$$

$\blacksquare$


#### **Discussion, known specialized results about this sequence**

Choose $\rho_{k - 1} = L_{k - 1}/L_k$, then $\max\left(1, \frac{L_k\rho_{k - 1}}{L_{k - 1}}\right) = 1$, and we have the sequence: 

$$
\begin{aligned}
    L_{k-1}L_k^{-1}(1 - \alpha_{k})\alpha_{k - 1}^2 = \alpha_{k}(\alpha_{k} - \mu/L_k). 
\end{aligned}
$$

This is the sequence for Nesterov's acceleration with line search and strong convexity index $\mu$. 
Assuming a line search, or back tracking routine is used sothat $\rho_k$ is bounded. 
It achieves fast linear convergence rate on $\beta_k$, and $\mathcal O (1/k^2)$ convergence rate when $\mu = 0$. 


---
### **Interpolation hypothesis and stochastic gradient**

Interpolation in machine learning means that the model can drive the loss functions of all the samples to their minimum. 
In other words, the minimizer for each cost function of every sample has a non-zero intersection. 

#### **Assumption 2 | Interpolation**
> Suppose $F = 1/n \sum_{i = 1}^{n} F_i$ is a $L$ smooth and $\mu \ge 0$ strongly convex function, where each $F_i$ satisfies Assumption 1 with Lipschitz smooth and strong convexity parameters $K_i, \mu_i$. 
> We assume that each of the $F_i$ has $\inf_{x} F_i(x) = 0$, and has a non-empty set of minimizer, and the overall function it has $\inf_{x}F(x) = 0$ as well. 

**Remarks**

<mark style="background: #FF5582A6;">Writings not good</mark>

#### **Definition | stochastic accelerated gradient method (SAGD)**
> Suppose that objective function $F$ satisfies Assumption 2. 
> Denote $K^{(i)} \ge \mu^{(i)}$ to be the list of Lipschitz smooth constant, strongly convex constant for components of $F$. 
> Let $(I_k)_{k \ge 0}$ be a list of i.i.d random variables uniformly sampled from set $\{0, 1, 2, \cdots, n\}$. 
> Initialize $v_{-1} = x_{-1}, \alpha_0 = 1$. 
> The SAGD generates the sequence $(y_k, x_k, v_k)_{k \ge 0}$ such that for all $k \ge 0$ they satisfy: 
> $$
> \begin{aligned}
>       & L_k/L_{k - 1}(1 - \alpha_{k})\alpha_{k - 1}^2 = \alpha_{k}\left(\alpha_{k} - \mu^{(I_k)}/L_k\right), \\
>       & \tau_k = L_k(1 - \alpha_k)\left(L_\alpha \alpha_k - \mu^{(I_k)}\right)^{-1}, \\
>       & y_k = (1 + \tau_k)^{-1}v_{k - 1} + \tau_k(1 + \tau_k)^{-1}x_{k - 1}, \\
>       & x_k =  T_{L_k}(y_k | F_{I_k}) \text{ s.t: } D_f(x_k, y_k) \le L_k/2\Vert y_k - x_k\Vert^2, \\
>       & v_k = x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}). 
> \end{aligned}
> $$

#### **Theorem 5 | SAGD one step inequality**
> Let sequence $(y_k, x_k, v_k)_{k \ge 0}$ satisfies SAGD. 
> Denote $\mathbb E_k [\cdot]$ to be the conditional expectation on $I_{0}, I_1, \ldots, I_{k - 1}$.
> Let $\bar x$ be the minimizer of $F$. 
> Then, for all $k \ge 1$ the following inequality is true: 
> $$
> \begin{aligned}
>    & - F(\bar x) + 
>    \mathbb E_k \left[
>        F_{I_k}(x_k)
>    \right]
>    + \mathbb E_k
>    \left[
>        \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
>    \right]
>    \\
>    &\le (1 - \mathbb E_k [\alpha_k])
>    \left(
>        \mathbb E \left[F(x_{k - 1})\right]
>        - 
>        F(\bar x)
>        + 
>        \mathbb E_k 
>        \left[\frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2\right]
>    \right).
> \end{aligned}
> $$
> And, for the basecase when $k = 0$, SAGD would assert the inequality: 

**Proof**

For one step, a speicific function $F_{I_k}$ is sampled. 
$F_{I_k}$ is $K^{(I_k)} > \mu^{(I_k)} \ge 0$ strongly convex and smooth. 
The sequence $\alpha_k$ is a squence of random variable and, the relations between $\alpha_k, \alpha_{k - 1}$ is given by: 

$$
\begin{aligned}
    \alpha_k &= 
    \frac{1}{2}\left(
        -L_{k - 1}L_k \alpha_{k - 1}^2 + \frac{\mu^{(I_k)}}{L_k} 
        + \sqrt{
            \left(
                \frac{\mu^{(I_k)}}{L_k}
                - L_{k - 1}L_k^{-1}\alpha_{k - 1}^2
            \right)^2
            + 4L_{k - 1}L_k^{-1}\alpha_{k - 1}
        }
    \right). 
\end{aligned}
$$

Therefore, Theorem 3 applies for function $F_{I_k}$. 
Choose $\bar x$ to be the minimizer of $F$, the following inequality is true: 

$$
\begin{aligned}
    - F_{I_k}(\bar x) + F_{I_k}(x_k) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2 
    & \le 
    (1 - \alpha_k)\left(
        F_{I_k}(x_{k - 1}) - F_{I_k}(\bar x) 
        + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right). 
\end{aligned}
$$

we can take the conditional expectation on both side of the inequality. 
It has on the LHS: 

$$
\begin{aligned}
    \mathbb E_k 
    \left[
        - F_{I_k}(\bar x) + F_{I_k}(x_k) + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right]
    &= 
    \mathbb E_k \left[- F_{I_k}(\bar x)\right]
    + 
    \mathbb E_k \left[F_{I_k}(x_k)\right]
    + 
    \mathbb E_k \left[
        \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right]
    \\
    &\underset{\text{(a)}}{=} 
    - F(\bar x) + 
    \mathbb E_k \left[
        F_{I_k}(x_k)
    \right]
    + \mathbb E_k
    \left[
        \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right]. 
\end{aligned}
$$
At **(a)**, we used Assumption 2. 
On the RHS, we do the same thing and it has: 

$$
\begin{aligned}
    & 
    \mathbb E_k\left[
        (1 - \alpha_k)
        \left(
        F_{I_k}(x_{k - 1}) - F_{I_k}(\bar x) 
        + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
        \right)
    \right]
    \\
    &\underset{\text{(b)}}{=}
    \textcolor{red}
    {
        \mathbb E_k\left[1 - \alpha_k\right]
        \mathbb E_k
            \left[
                F_{I_k}(x_{k - 1}) - F_{I_k}(\bar x) 
                + \frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
            \right]
    }
    \\
    &= 
    \mathbb E_k
    \left[1 - \alpha_k\right]
    \left(
       \mathbb E_k \left[F_{I_k}(x_{k - 1})\right] - F(\bar x)
        + 
        \mathbb E_k \left[\frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2\right]
    \right). 
\end{aligned}
$$
At **(b)**, we used the fact that, random variable $\alpha_k$ is a function of $I_k$ when conditioned, and so is $F_{I_k}(x_{k - 1})$. 
Therefore, the expectation of the product is the product of the expectation as well. 
Therefore, it gives: 
$$
\begin{aligned}
    & 
    - F(\bar x) + 
    \mathbb E_k \left[
        F_{I_k}(x_k)
    \right]
    + \mathbb E_k
    \left[
        \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right]
    \\
    &\le 
    \mathbb E_k
    \left[1 - \alpha_k\right]
    \left(
        \mathbb E_k \left[F_{I_k}(x_{k - 1})\right]
        - 
        F(\bar x)
        + 
        \mathbb E_k 
        \left[\frac{\alpha_{k - 1}^2L_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2\right]
    \right).
\end{aligned}
$$

From Assumption 2, we would have

$$
\begin{aligned}
    \mathbb E_k[\alpha_k] &= 
    \frac{1}{2}\mathbb E_k
    \left[
        - L_{k - 1}L_k \alpha_{k - 1}^2 + \frac{\mu^{(I_k)}}{L_k} 
        + \sqrt{
            \left(
                \frac{\mu^{(I_k)}}{L_k}
                - L_{k - 1}L_k^{-1}\alpha_{k - 1}^2
            \right)^2
            + 4L_{k - 1}L_k^{-1}\alpha_{k - 1}
        }\;
    \right]
    \\
    &= 
    \frac{1}{2}\left(
        - L_{k - 1}L_k \alpha_{k - 1}^2 + \frac{\mathbb E_k\left[\mu^{(I_k)}\right]}{L_k} 
        + \textcolor{red}{\sqrt{
            \left(
                \frac{\mathbb E_k \left[\mu^{(I_k)}\right]}{L_k}
                - L_{k - 1}L_k^{-1}\alpha_{k - 1}^2
            \right)^2
            + 4L_{k - 1}L_k^{-1}\alpha_{k - 1}
        }}\;
    \right)
    \\
    &= 
    \frac{1}{2}\left(
        - L_{k - 1}L_k \alpha_{k - 1}^2 + \frac{\mu}{L_k} 
        + \sqrt{
            \left(
                \frac{\mu}{L_k}
                - L_{k - 1}L_k^{-1}\alpha_{k - 1}^2
            \right)^2
            + 4L_{k - 1}L_k^{-1}\alpha_{k - 1}
        }
    \right). 
\end{aligned}
$$

$\blacksquare$


#### **Theorem 6 | SAGD convergence rate**



#### **Lemma | The stochastic sequence**

#### **Discussion**

I think the strong convexity assumption is too restrictive, artificial for the interpolation hypothesis. 
I am still investigating whether it's possible to bypass the strong convexity assumption for something weaker while keeping the fast linear convergence rate. 
I am confident it is possible because we had results in the literatures regarding the fast linear convergence rate for **Nesterov's Acceleration under Quasi Strongly Convex function, with some additional assumption.**
The additional assumption needed, causes interested issues when unrolling. 
A simple Lyapunov type of analysis under Quasi-strong convexity is possible, but thus far it eludes me. 
In addition, the proof we had above in this file, it doesn't support quasi-strongly convex function at all. 
The problem is the use of Jensen's inequality and Proximal gradient inequality which doesn't hold for quasi-strongly convex function for all points in the domain. 
