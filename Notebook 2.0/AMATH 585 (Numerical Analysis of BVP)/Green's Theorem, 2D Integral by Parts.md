
[[Divergence Theorem]]

---
### **Intro**


We consider the divergence theorem applied to $\nabla\cdot(u, \hat{v})$ on the closed and bounded simple region denoted as $\Omega$ and its smooth boundary defined as $\text{bd}(\Omega)$, then, we apply the divergence's theorem.

Not in particular, but consider one of the example application of This theorem in the context of 2D Finite Element method: 

$$
\begin{aligned}
    & \hspace{0.5em}
    \langle \nabla\cdot (\nabla u), \hat{v}\rangle + 
    \iint_{\Omega} \underbrace{(u_x\hat{v}_x + u_y \hat{v}_y)}_{
        \nabla u \cdot \nabla \hat{v}} dxdy
    \\
    &= \iint_{\Omega} 
    \nabla \cdot (\nabla \hat{v}) + \nabla u \cdot \nabla \hat{v}
    dxdy
    \\
    \underset{[1]}{\implies}
    &= 
    \iint_{\Omega}\nabla\cdot(\nabla u\hat{v}) dxdy 
    \\
    &= 
    \iint_{\Omega}\nabla\cdot (\nabla u)\hat{v}dxdy
    \\
    \underset{\text{div theorem}}{\implies}
    &=
    \int_{\text{bd}(\Omega)} 
        (\nabla u)\hat{v}
    d\mathbf{n}
\end{aligned}\tag{1}
$$

Step [1] is justified by considering: 

$$
\begin{aligned}
    \nabla \cdot (\nabla u\hat{v}) &= 
    \nabla \cdot \left(
        \begin{bmatrix}
            u_x \\ u_y
        \end{bmatrix}\hat{v}
    \right)
    \\
    &= 
    \nabla \cdot \begin{bmatrix}
        u_x \hat{v} \\ u_y \hat{v}
    \end{bmatrix}
    \\
    &= 
    \partial_x[u_x\hat{v}] + \partial_y[u_y\hat{v}]
    \\
    &= 
    u_{xx}\hat{v} + u_x \hat{v}_x + u_{yy}\hat{v} + u_y\hat{v}_y
    \\
    &= 
    \nabla u\cdot \nabla \hat{v} + \hat{v}\nabla \cdot (\nabla u)
\end{aligned}\tag{2}
$$

Expression (1) now has been justified. Another interpretation of expression (1) is viewing the Laplacian inner product term using the definition of Hilber Space Inner product directly, obtaining: 

**Cannonical Form**

> $$
> \begin{aligned}
>     & \hspace{0.5em}
>     \iint_{\Omega}\nabla\cdot(\nabla u)\hat{v}dxdy
>     +
>     \iint_{\Omega} \underbrace{(u_x\hat{v}_x + u_y \hat{v}_y)}_{
>         \nabla u \cdot \nabla \hat{v}} dxdy
>     \\
>     &= \int_{\text{bd}(\Omega)}(\nabla u)\hat{v}d\mathbf{n}
> \end{aligned}\tag{3}
> $$

For better Clarity, consider replacing $\nabla u$ into $\vec{F} = [F_1(x, y)\; F_2(x, y)]^T$, a generic vector field function, then it can be said that: 

> $$
> \begin{aligned}
>     & \hspace{0.5em}
>     \iint_{\Omega}
>     (\nabla\cdot\vec{F})\hat{v}dxdy
>     \\
>     &= \int_{\text{bd}(\Omega)}(\vec{F})\hat{v}d\mathbf{n}
>     -
>     \iint_{\Omega} \underbrace{(F_1\hat{v}_x + F_2 \hat{v}_y)}_{
>         \vec{F}\nabla \hat{v}} dxdy
>     \\
>     &= \int_{\text{bd}(\Omega)}(\vec{F})\hat{v}d\mathbf{n}
>     - \iint_{\Omega} \vec{F}\nabla \hat{v} dxdy
>         
> \end{aligned}\tag{3}
> $$

Moving to second term of the integral of the dot product of the divergence between the 2 functions will expose a form of the formula that is very similar to the product rule in 1D. Refer to this [wiki](https://en.wikipedia.org/wiki/Integration_by_parts) the higher dimension section to know more about it. 
