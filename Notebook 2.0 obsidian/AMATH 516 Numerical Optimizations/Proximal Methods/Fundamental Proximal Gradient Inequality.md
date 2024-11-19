- [Morau Envelope and Convex Proximal Operators](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)

---
### **Intro**

This lemma is being used too often that I think it's worth singling it out. 
This lemma is a generalization of the proximal lemma in the convex case, and it can be seem as an inexact version of the same lemma applied to the proving the convergence of convex optimization problems. 

#### **Lemma 0.1 | Gradient Mapping**
> Let $h = g + f$ where $g$ is convex, $f$ is $L$-Lipschitz smooth and differentiable. 
> With the proximal gradient operator $\mathcal T_L(x) = [I + L^{-1}\partial g]^{-1}[I - L^{-1}\nabla f](x)$, and gradient mapping operator $\mathcal G_L(x) = L(x - \mathcal T_L(x))$, then it satisfies for all $x$: 
> $$
> \begin{aligned}
>   x^+ &= \mathcal T_L(x), 
>   \\
>   L(x - x^+) &\in  \nabla f(x) + \partial g(x^+) \ni \mathcal G_L(x). 
> \end{aligned}
> $$
> Equivalently, $\exists v \in g(x^+)$ such that $L(x - x^+) = \nabla f(x) + v = \mathcal G_L(x)$. 

**Proof**

$$
\begin{aligned}
    x^+ &= [I + L^{-1}\partial g]^{-1}\circ [I - L^{-1}\nabla f](x)
    \\
    [I + L^{-1}\partial g](x^+) &\ni [I - L^{-1}\nabla f](x)
    \\
    x^+ + L^{-1}\partial g(x^+) &\ni x - L^{-1}\nabla f(x)
    \\
    x^+ - x + L^{-1}\partial g(x^+) &\ni L^{-1}\nabla f(x)
    \\
    L(x^+ - x) + \partial g(x^+) &\ni - \nabla f(x)
    \\
    L(x - x^+) &\in \nabla f(x) + \partial g(x^+)
    \\
    \mathcal G_L(x) &\in \nabla f(x) + \partial g(x^+). 
\end{aligned}
$$

#### **Lemma 0.2 | Fundamental proximal gradient lemma**
> Suppose that $h = f + g$ where $g$ is convex and $f$ is Lipschitz smooth. 
> Denote $D_f(x,y)$ to be the Bregman divergence $f(x) - f(y) - \langle \nabla f(y), x - y\rangle$ for all $x, y$. 
> Let $\mathcal T_L(x)$ be the proximal gradient operator and $\mathcal G_L = I - \mathcal T_L$ be the gradient mapping.
> Fix any $x \in \R^n$, then for all $z$ we have the inequality: 
> $$
> \begin{aligned}
>     h(z) - h(\mathcal T_L x) - \langle \mathcal G_L (x), z - x\rangle - 
>     D_f(z, x) - \frac{1}{2L}\Vert \mathcal G_L(x)\Vert^2 \ge 0. 
> \end{aligned}
> $$

Let's fix $x$, 
From smoothness of $f$ we have: 

$$
\begin{aligned}
    D_f(\mathcal T_Lx, x) - \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    &\le 0
    \\
    \iff 
    f(x) - f(\mathcal T_L x) - \langle \nabla f(x), x - \mathcal T_L x\rangle + 
    \frac{L}{2}\Vert x-  \mathcal T_L x\Vert^2 
    &\ge 0
    \\
    \iff 
    f(x) - f(\mathcal T_L x)
    - \langle \nabla f(x), z - \mathcal T_L x\rangle
    - \langle \nabla f(x), x - z\rangle
    + 
    \frac{L}{2}\Vert x-  \mathcal T_L x\Vert^2 
    &\ge 0
\end{aligned}\tag{1}
$$

From the convexity of $g$ we have for all $z$: 

$$
\begin{aligned}
    (\forall v \in \partial g(\mathcal T_L x))
    \quad 
    g(z) - g(\mathcal T_L x) 
    - \langle  v, z - \mathcal T_L x\rangle
    &\ge 0
\end{aligned}\tag{2}
$$

Adding (1) and (2) together, we have for all $v \in \partial g(\mathcal T_L x)$

$$
\begin{aligned}
    g(z) + f(x) - h(\mathcal T_Lx)
    - \langle \nabla f(x) + v, z - \mathcal T_L x\rangle
    - \langle \nabla f(x), x - z\rangle
    + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2 &\ge 0
    \\
    \iff 
    h(z) - h(\mathcal T_L x)
    - \langle \nabla f(x) + v, z - \mathcal T_L x\rangle
    + f(x) - f(z) 
    - \langle \nabla f(x), x - z\rangle
    + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    &\ge 0
    \\
    \iff 
    h(z) - h(\mathcal T_L x)
    - \langle \nabla f(x) + v, z - \mathcal T_L x\rangle
    - D_f(z, x)
    + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    &\ge 0. 
\end{aligned}
$$

Apply Lemma 0.1 so $\exists v \in \partial g(\mathcal T_L x)$ such that $\mathcal G_L(x) = \nabla f(x) + v = L (x - \mathcal T_L x)$, therefore the above becomes

$$
\begin{aligned}
    h(z) - h(\mathcal T_L x)
    - \langle L(x - \mathcal T_L x) , z - \mathcal T_L x\rangle
    - D_f(z, x)
    + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    &\ge 0
    \\
    \iff 
    h(z) - h (\mathcal T_L x)
    - \langle L(x - \mathcal T_L x), z - x + x - \mathcal T_L x\rangle
    + \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    - D_f(z, x)
    &\ge 0
    \\
    \iff 
    h(z) - h (\mathcal T_L x)
    - \langle L(x - \mathcal T_L x), z - x\rangle
    - \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2
    - D_f(z, x)
    &\ge 0
    \\
    \iff 
    h(z) - h (\mathcal T_L x)
    - \langle \mathcal G_L x, z - x\rangle
    - \frac{1}{2L}\Vert \mathcal G_L x\Vert^2
    - D_f(z, x)
    &\ge 0. 
\end{aligned}
$$

**Remarks**

This is actually the same inequality used in the [V-FISTA](V-FISTA.md). 
This can be interpreted as an the consequence of the inexact evaluation of using proximal gradient operator. 
More specifically, assuming that we have the exact proximal point evaluation for function $h$ at $x$ be given by: 

$$
\begin{aligned}
    \mathcal P_L x := \argmin{y}\left\lbrace
        h(y) + \frac{L}{2}\Vert  y- x\Vert^2
    \right\rbrace, 
\end{aligned}
$$

using convexity, and subdifferential, we get the proximal inequality: 

$$
\begin{aligned}
    h(x) - h(\mathcal P_Lx) 
    - \langle \partial h(\mathcal P_L x), x - \mathcal P_L x\rangle
    &\ge 
    0
    \\
    \textcolor{gray}{
        \text{by: }
        L(x - \mathcal P_L x) \in \partial h(\mathcal P_L x)
    }&
    \\
    \implies 
    h(x) - h(\mathcal P_Lx) 
    - \langle L(x - \mathcal P_L x), x - \mathcal P_L x\rangle
    &\ge 0. 
\end{aligned}
$$

When proving the above results, we had the following equivalent intermediate step: 

$$
\begin{aligned}
    h(z) - h(\mathcal T_L x) 
    - \langle
        L(x - \mathcal T_L x), 
        z - \mathcal T_L x
    \rangle 
    &\ge 
    D_f(z, x) - \frac{L}{2}\Vert x - \mathcal T_L x\Vert^2. 
\end{aligned}
$$

The act of using $\mathcal T_L$ instead of $\mathcal P_L$ still forges very similar inequality, the quantities on the RHS can be interpreted as the error of the approximation by the proximal gradient operator $\mathcal T_L x$. 

**Remarks**

Here, we could also assume that the function $g$ is also strongly convex. 
In this way, the above inequality can be generalized. 


---
### **The envelope approach**

The inequality can be derived from a slightly weaker set of assumptions. 
The difference here is the absence of subgradient inequality which is not used for the proof. 
The following is the same proof adapted from [Proximal Gradient Convergence Rate](Proximal%20Gradient%20Convergence%20Rate.md). 

In this section we use some slightly different notations: 

$$
\begin{aligned}
    h(x) &= g + f, 
    \\
    T&= [I + L^{-1}\partial h]\circ [I - L^{-1}\nabla f]
    \\
    \widetilde{\mathcal M}^{L^{-1}}
    (x; y) 
    &:= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle 
    + \frac{L}{2}\Vert x - y\Vert^2
    \\
    \mathcal M^{L^{-1}}(x; y) 
    &:= h(x) + \frac{L}{2}\Vert x - y\Vert^2
\end{aligned}
$$

Before the major claim we state the following lemma to the proof sleek and cool: 

#### **Lemma | The difference on the Envelope**
> With $h = g + f$ as assumed in this section. 
> Take $\widetilde{\mathcal M}^{L^{-1}}, \mathcal M^{L^{-1}}$ as defined above, we will have for all $x \in \R^n$ that: 
> $$
> \begin{aligned}
>     \widetilde{\mathcal M}^{L^{-1}}(x; y)
>     &= 
>     \mathcal M^{L^{-1}}(x; y)- D_f(x, y) \ge \mathcal M^{L^{-1}}(x; y). 
> \end{aligned}
> $$

**Proof**

The proof for the equality is direct, we have for all $\forall x, y$: 

$$
\begin{aligned}
    \widetilde{\mathcal M}^{L^{-1}}(x; y) 
    &= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle + \frac{L}{2}\Vert x - y\Vert^2
    \\
    &= 
    g(x) + f(x) - f(x) + f(y) 
    + \langle \nabla f(y), x - y\rangle + \frac{L}{2}\Vert x - y\Vert^2
    \\
    &= 
    h(x) - D_f(x, y) + \frac{L}{2}\Vert x - y\Vert^2 
    \\
    &= \mathcal M^{L^{-1}}(x; y) - D_f(x, y). 
\end{aligned}
$$

The inequality is direct by convexity of $f$ and Lipschitz property of $F$. 

**Remarks**

The above inequality can be interpreted with inexact evaluation of a proximal point evaluation. 
Let's make it precise. 




#### **Claim | The Fundamental Proximal gradient inequality**
> Let $h = f + g$ and proximal gradient operator $T$ be given as in this section. 
> Fix any $y$, we have for all $x$: 
> $$
> \begin{aligned}
>     h(x) - h(Ty) - \langle L(y - Ty), x - Ty\rangle
>     &\ge  D_f(x, y) 
> \end{aligned}
> $$

**Proof**

The proof is direct. 
The function $\widetilde{\mathcal M}(\cdot; y)$ is a $L$ strongly convex function with minimizer $Ty$ and hence it has admits quadratic growth condition around its minimizer, which gives the  strictly weaker inequality (See [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information about this property) for all $x \in \R^n$: 

$$
\begin{aligned}
    \widetilde{\mathcal M}^{L^{-1}}(x; y) - 
    \widetilde{\mathcal M}^{L^{-1}}(Ty; y)
    - 
    \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 
    0
    \\
    \implies 
    \left(
        \mathcal M^{L^{-1}}(x; y) - D_f(x, y)
    \right) - 
    \mathcal M^{L^{-1}}(Ty; y) 
    - 
    \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    \left(
        \mathcal M^{L^{-1}}(x; y)
        - 
        \mathcal M^{L^{-1}}(Ty; y)
    \right)
    - 
    D_f(x, y) 
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}\Vert x - y\Vert^2 - 
        \frac{L}{2}\Vert Ty - y\Vert^2
    \right)
    - 
    D_f(x, y) 
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}
        \left(
            \Vert x - Ty + Ty - y\Vert^2
            - 
            \Vert y - Ty\Vert^2
        \right)
    \right)
    - 
    D_f(x, y) 
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}
        \left(
            \Vert x - Ty\Vert^2 + 
            2\langle x - Ty, Ty - y\rangle
        \right)
    \right)
    - 
    D_f(x, y) 
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff
    \left(
        h(x) - h(Ty) + \frac{L}{2}\Vert x - Ty\Vert^2 
        - L\langle  x - Ty, y - Ty\rangle
    \right)
    - 
    D_f(x, y) 
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty)
    - \langle L(y - Ty), x - Ty\rangle
    - D_f(x, y) 
    &\ge 0. 
\end{aligned}
$$

**Remarks**

The envelope $\mathcal M^{L^{-1}}(x; y)$ having quadratic growth is a weaker conditions than $L^{-1}$ strong convexity of the Envelope function. 
This results here are also strictly better than the previous results it implies the previous results. 

$$
\begin{aligned}
    h(x) - h(Ty) - \langle L(y - Ty), x - Ty\rangle - D_f(x, y) &\ge 0
    \\
    \iff
    h(x) - h(Ty)
    - \langle L(y - Ty), x - y + y - Ty\rangle - D_f(x, y) 
    &\ge 0
    \\
    \iff
    h(x) - h(Ty)
    - \langle L(y - Ty),x - y \rangle
    - L\Vert y - Ty\Vert^2
    - D_f(x, y) 
    &\ge 0
    \\
    \implies 
    h(x) - h(Ty)
    - \langle L(y - Ty),x - y \rangle
    - \frac{L}{2}\Vert y - Ty\Vert^2
    - D_f(x, y) 
    &\ge 0
\end{aligned}
$$

That, is kinda wild. 
Oh yeah, from smoothness we also have 

$$
D_f(x, y) \ge \frac{1}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert^2. 
$$
