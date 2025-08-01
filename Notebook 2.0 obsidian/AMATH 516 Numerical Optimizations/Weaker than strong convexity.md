- [Bregman Divergence Introduction](Bregman%20Divergence%20Introduction.md)
- [Weaker Characterizations of Strong Convexity](Properties%20of%20Functions/Weaker%20Characterizations%20of%20Strong%20Convexity.md)

---
### **Intro**

List some examples of Bregman Divergences of convex functions. 
Assume that the Ambient space is $\R^n$. 

**Notations**. 
Denote $\Pi_C$ to be the projection onto a set $C$. 
Denote $D_f$ to be the Bregman Divergence of the function $f$. 

#### **Example | Distance squared to a set**
> Let $\varphi = (1/2)\dist(\cdot | C)^2$.
> Denote $\overline{(\cdot)} = \Pi_C(x)$ to be the projection of some vector onto the set $C$. 
> Then for all $x, y \in \R^n$: 
> $$
> \begin{aligned}
>     & \frac{1}{2}\Vert \bar x - \bar y\Vert^2 - \Vert x - \bar x\Vert \Vert \bar x - \bar y\Vert + \frac{1}{2}\Vert x - y\Vert^2 
>     \\
>     &\le 
>     D_{\varphi}(x, y) 
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
    D_{\varphi}(x, y) &= 
    \varphi(x) - \varphi(y) - \left\langle \nabla \varphi(y), x - y\right\rangle
    \\
    &= \varphi(x) - \varphi(y) - \langle y - \bar y, x - y\rangle
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
    &= - \frac{1}{2}\Vert \bar x - \bar y\Vert^2 + \langle x - \bar x, \bar x - \bar y\rangle 
    + \frac{1}{2}\Vert x - y \Vert^2. 
\end{align*}
$$

The final parts are completed via Cauchy inequalities. $\blacksquare$

**Remarks**


There are 2 interesting special cases to note. 
1. When $\bar x = \bar y$, i.e: the projection of $x, y$ are onto the same point, then it has: $D_{\varphi}(x, y) = \frac{1}{2}\Vert x - y\Vert^2$. 
2. A weaker condition is when $x - \bar x \perp \bar x - \bar y$, it has $D_\varphi(x, y) = (1/2)\left(\Vert x - y\Vert^2 - \Vert \bar x - \bar y\Vert^2\right)$. 

Under the above two conditions, the Bregman Divergence is symmetric. 
And it has a quadratic lower bound. 
Next, Consider this. 
- When $C$ is a singleton, then we have the trivial examples. 
- When $C$ is a affine subspace, $\langle x - \bar x, \bar x - \bar y\rangle = 0$ for all $x, y \in \R^n$. 
- When $C$ is an halfspace, it has $\langle x - \bar x, \bar x - \bar y\rangle = 0$ for all $x, y \not \in \text{int}\; C$. 
- When $\bar x = \bar y = z$, it means that $x, y \in N_C(z)$. Both $x, y$ are in the normal cone at their projection. 
- In general, $\bar x, \bar y$ lies on a face of convex body $C$, then it has $\langle x - \bar x, \bar x - \bar y\rangle = 0$, by some geometry. 

This special case happens often. 
Another case to consider is the symmetric divergence. 
After some algebra, it can be shown that: 

$$
\begin{aligned}
    D_\varphi(x, y) + D_\varphi(y, x) &= 
    \langle x - y, \bar x - \bar y\rangle 
    + \Vert x - y\Vert^2. 
\end{aligned}
$$



> [!Warning]
> This is technically not a Bregman Divergence because $D_{d_C^2}(x, y) = 0 \iff  x = y$ is false, because $d_C^2$ is not a Legendre type function. 
> The inverse of the gradient of the function doesn't exist at all. 
>
> We didn't assume that $C$ is a convex set. 


