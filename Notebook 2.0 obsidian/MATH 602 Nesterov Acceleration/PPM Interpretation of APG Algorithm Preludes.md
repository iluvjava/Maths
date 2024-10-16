- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)

---
### **Preliminaries**

The following concepts are crucial for introducing proximal gradient into the PPM interpretation frameworks of the accelerated gradient method!

#### **Lemma 0.1 | Nesterov Gradient Mapping**
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

#### **Lemma 0.2 | Linear Lower Bound of Gradient Mapping**
> Continuing from previous lemma, now with $f$ being $\mu \ge 0$ strongly convex. 
> Fix any $x$, let $x^+ = \mathcal T_L(x)$, then we have the inequality for all $z$: 
> $$
> \begin{aligned}
>     h(z) &\ge 
>     h(x^+) + \langle \mathcal G_L (x), z - x\rangle + 
>     \frac{L}{2}\Vert x - x^+\Vert^2 + \frac{\mu}{2}
>     \Vert z - x\Vert^2. 
> \end{aligned}
> $$

**Observations**

Set $z = x^+$, it's: 

$$
\begin{aligned}
    h(x^+) &\ge 
    h(x^+) + \langle L(x - x^+), x^+ - x \rangle + 
    (L/2)\Vert x - x^+\Vert^2 + (\mu/2)\Vert x^+ -x\Vert^2
    \\
    &= h(x^+) - (L/2)\Vert x - x^+\Vert^2 + (\mu/2) \Vert x^+ - x\Vert^2
    \\
    &= h(x^+) - ((L - \mu)/2)\Vert x^+ - x\Vert^2, 
\end{aligned}
$$

so unless $x^+ = x$ (minimum of the function), or $L= \mu$, it's not an equality at $z = x^+$. 
When $g \equiv 0$, it reduces to 

$$
\begin{aligned}
    x' &= \prox{\eta g}(x), 
    \\
    g(z) &\ge
    g(x') + \langle \mathcal \partial g(x'), z - x\rangle
    \\
    &= 
    g(x') + \eta^{-1}\langle \mathcal x - x', z - x\rangle, 
\end{aligned}
$$

which is for the proximal point. 

**Proof**

Directly from the $L$-smoothness of $f$, $\mu\ge 0$ strong convexity of $f$ and convesity of $g$, it has 
$$
\begin{aligned}
    &f(x^+) \le 
    f(x) + \langle \nabla f(x), x^+ - x\rangle
    + \frac{L}{2}\Vert x - x^+\Vert^2, 
    \\
    &
    f(x) \le f(z) - \langle \nabla f(x), z - x\rangle
    - \frac{\mu}{2}\Vert z - x\Vert^2, 
    \\
    &g(x^+) \le 
    g(z) + \langle  v, x^+ - z\rangle \quad 
    \forall v\in \partial g(x^+). 
\end{aligned}
$$

Now, for any $v \in \partial g(x^+)$, it can be said that: 

$$
\begin{aligned}
    h(x^+) &= f(x^+) + g(x^+)
    \\&
    \begin{aligned}
        &\le 
        \left(
            f(x) + \langle \nabla f(x), x^+ - x\rangle
            + \frac{L}{2}\Vert x - x^+\Vert^2
        \right)
        \\
        &\qquad  
        + (g(z) + \langle \partial g(x^+), x^+ - z\rangle)
    \end{aligned}
    \\&
    \begin{aligned}
        &\le 
        \left(
            f(z) - \langle \nabla f(x), z - x\rangle
            - \frac{\mu}{2}\Vert z - x\Vert^2
            + \langle \nabla f(x), x^+ - x\rangle
            + 
            \frac{L}{2}\Vert x - x^+\Vert^2
        \right)
        \\
        &\qquad 
        +
        (g(z) + \langle \partial g(x^+), x^+ - z\rangle)
    \end{aligned}
    \\&
    \begin{aligned}
        &= 
        (f(z) + h(z)) 
        \\
        &\qquad 
        + \left(
            \langle \nabla f(x), x - z\rangle + 
            \langle \nabla f(x), x^+ - x\rangle + 
            \langle \partial g(x^+), x^+ - z\rangle
        \right) 
        \\ 
        &\qquad 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + 
        \left(
            \langle \nabla f(x), x - x^+ + x^+ - z\rangle + 
            \langle \nabla f(x), x^+ - x\rangle + 
            \langle \partial g(x^+), x^+ - z\rangle
        \right)
        \\
        &\qquad 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\
    & 
    \begin{aligned}
        &= h(z) + 
        \langle \nabla f(x) + v, x^+ - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\
    \exists\; v \in \partial g(z) \text{ s.t } h(x^+)
    & 
    \begin{aligned}
        &= h(z) + 
            \langle \mathcal G_L(x), x^+ - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\& 
    \begin{aligned}
        &= h(z) + \langle L(x - x^+), x^+ - x + x - z\rangle 
        - \frac{\mu}{2}\Vert z - x\Vert^2
        + \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}
    \\&
    \begin{aligned}
        &= h(z) + 
        \underbrace{\langle L(x - x^+), x - z\rangle}_{
            = - \langle \mathcal G_L (x), z - x\rangle
        }
        - \frac{\mu}{2}\Vert z - x\Vert^2
        - \frac{L}{2}\Vert x - x^+\Vert^2
    \end{aligned}. 
\end{aligned}
$$

Substituting $\mathcal G_L(x) = L (x - x^+)$ to the above expression, rearrange it a bit will recover the desired inequalities. 
Therefore, the inequality is justified. 

**Remarks**

<mark style="background: #FFB86CA6;">This inequality is not tight. </mark>
Observe that $\mu/2\Vert z - x\Vert^2 \le D_f(z, x)$, where $D_f$ is the Bregman Divergence of $f$. 


#### **Lemma 0.3 | Weaker linear lower bound of the Gradient Mapping**
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

using convexity, and subdifferentia, we get the proximal inequality: 

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

When proving the above results, we have the intermediate step: 

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