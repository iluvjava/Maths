- [Bregman Divergence](Bregman%20Divergence.md)

---
### **Intro**

List some examples of Bregman Divergences of convex functions. 
Assume that the Ambient space is $\R^n$. 

**Notations**. 
Denote $\Pi_C$ to be the projection onto a set $C$. 
Denote $D_f$ to be the Bregman Divergence of the function $f$. 

#### **Example | Distance squared to a convex set**
> Let $d_C^2 = \dist(\cdot | C)^2$.
> Denote $\overline{(\cdot)} = \Pi_C(x)$ to be the projection of some vector onto the set $C$. 
> Then for all $x, y \in \R^n$: 
> $$
> \begin{aligned}
>     & \frac{1}{2}\Vert \bar x - \bar y\Vert^2 - \Vert x - \bar x\Vert \Vert \bar x - \bar y\Vert + \frac{1}{2}\Vert x - y\Vert^2 
>     \\
>     &\le 
>     D_{d_C^2/2}(x, y) 
>     \\
>     &= 
>     - \frac{1}{2}\Vert \bar x - \bar y\Vert^2
>     + \langle x - \bar x, \bar x - \bar y\rangle
>     + \frac{1}{2} \Vert x - y\Vert^2
>     \\
>     &\ge - \frac{1}{2}\Vert \bar x - \bar y\Vert^2 
>     + \Vert x - \bar x\Vert \Vert \bar x - \bar y\Vert 
>     + \frac{1}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

For all $x, y \in \R^n$ it has 
$$
\begin{align*}
    D_{d_C^2}(x, y) &= 
    d_C^2(x) - d_C^2(y) - \left\langle \nabla d_C^2(y), x - y\right\rangle
    \\
    &= d_C^2(x) - d_C^2(y) - \langle y - \bar y, x - y\rangle
    \\
    &= \frac{1}{2}(\Vert x - \bar x\Vert^2 - \Vert y - \bar y\Vert^2)
    - \langle y - \bar y, x - y\rangle
    \\
    &= \frac{1}{2}(\Vert x - \bar x\Vert^2 - \Vert y - \bar y\Vert^2)
    - \frac{1}{2}\Vert x - \bar y\Vert^2 
    + \frac{1}{2}\left(
        \Vert y - \bar y\Vert^2 + \Vert x - y\Vert^2
    \right)
    \\ 
    &= \frac{1}{2}\Vert x - \bar x\Vert^2
    - \frac{1}{2}\Vert x - \bar y\Vert^2 + \frac{1}{2}\Vert x - y\Vert^2
    \\
    &= 
    \frac{1}{2}\Vert x - \bar x\Vert^2
    - \frac{1}{2}\left(
        \Vert x - \bar x\Vert^2 + \Vert \bar x - \bar y\Vert^2
        + \langle x - \bar x, \bar x - \bar y\rangle
    \right)
    + \frac{1}{2}\Vert x - y\Vert^2
    \\
    &= - \Vert \bar x - \bar y\Vert^2 + \langle x - \bar x, \bar x - \bar y\rangle 
    + \frac{1}{2}\Vert x - y \Vert^2. 
\end{align*}
$$

The final parts are completed via Cauchy inequalities. $\blacksquare$

**Remarks**

Take note that, it has 
$$
\begin{aligned}
    D_{d_C^2}(x, \bar x) &= \frac{1}{2}\Vert x - \bar x\Vert^2 = D_{d_C^2}(\bar x, x),
    \\
    D_{d_C^2}(y, \bar y) &= \frac{1}{2}\Vert y - \bar y\Vert^2 = D_{d_C^2}(\bar y, y). 
\end{aligned}
$$
This, this is the definition of being quasi-strongly convex. 
If we add them together it has: 
$$
\begin{aligned}
    D_{d_C^2}(x, y) + D_{d_C^2}(y, x) &= 
    \Vert x - y\Vert^2 + \frac{1}{2}\left(
        - \Vert y - \bar x\Vert^2 - \Vert x - \bar y \Vert^2 + \Vert x - \bar x\Vert^2
        + \Vert y - \bar y\Vert^2
    \right)\\
    &= 
    \Vert x - y\Vert^2 - \langle x - y, \bar x - \bar y\rangle. 
\end{aligned}
$$

It also simplifies when $C$ is a linear subspace or a halfspace. 
When $C$ is a affine subspace, $\langle x - \bar x, \bar x - \bar y\rangle = 0$ for all $x, y \in \R^n$. 
When $C$ is an halfspace, it has $\langle x - \bar x, \bar x - \bar y\rangle = 0$ for all $x, y \not \in \text{int}\; C$. 

> [!Warning]
> This is technically not a Bregman Divergence because $D_{d_C^2}(x, y) = 0 \iff  x = y$ is false, because $d_C^2$ is not a Legendre type function. 
> The inverse of the gradient of the distance square is not invertible. 

