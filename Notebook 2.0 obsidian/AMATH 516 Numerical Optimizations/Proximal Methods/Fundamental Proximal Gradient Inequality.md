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
    \mathcal M^{L^{-1}}
    (x; y) 
    &:= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle 
    + \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

The following claim and proof will use a strictly weaker assumptions to obtain a strictly better results. 

#### **Claim | The Fundamental Proximal gradient inequality**
> Fix any $y$, we have for all $x$: 
> $$
> \begin{aligned}
>     F(x) - F(Ty) - \langle L(y - Ty), x - Ty\rangle
>     &\ge \frac{- L}{2}\Vert x - Ty\Vert^2 + D_f(x, y) 
> \end{aligned}
> $$

To start, agree with the following inequality which comes from the definition of the Envelope function 
$$
\begin{aligned}
    M^{L^{-1}}(Ty; y) 
    &= 
    g(Ty) + f(y) + \langle \nabla f(y), Ty - y\rangle 
    + \frac{L}{2}\Vert Ty - y\Vert^2
    \\
    \text{$f$ is convex }
    \implies 
    &\ge 
    h(Ty) + \frac{L}{2}\Vert Ty - y\Vert^2
    \\
    &\ge h(Ty). 
\end{aligned}\tag{1}
$$

Next, the function $M^{L^{-1}}(\cdot, y)$ is a $L$  strongly convex function by its definition therefore using the quadratic growth condition for a strongly convex function we have inequalities: 

$$
\begin{aligned}
    \mathcal {M}^{L^{-1}}(x; y) - 
    \mathcal {M}^{L^{-1}}(Ty; y) - 
    \frac{L}{2}\Vert x - T y\Vert^2 
    &\ge 0
    \\
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle + \frac{L}{2}\Vert x - y\Vert^2 
    - \mathcal M^{L^{-1}}(Ty; y)
    - \frac{L}{2}\Vert x - T y\Vert^2
    &\ge 0
    \\
    (1)\implies 
    f(y) - f(x) + \langle \nabla f(y), x - y\rangle 
     + \frac{L}{2}\Vert x - y\Vert^2 + f(x) + g(x) - h(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2
    & \ge 0
    \\
    \iff 
    -D_f(x, y) + \frac{L}{2}\Vert x - y\Vert^2 
    + h(x) - h(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty) - \frac{L}{2}
    \left(
        \Vert x - Ty\Vert^2 - \Vert x - y\Vert^2
    \right) - D_f(x, y) 
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty) - \frac{L}{2}\left(
        \Vert x - Ty\Vert^2 - \Vert x - Ty + Ty - y\Vert^2
    \right)
    - D_f(x, y) 
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty) - 
    \frac{L}{2}\left(
        - \Vert y - Ty\Vert^2
        - 2\langle x - Ty, Ty - y\rangle
    \right) - D_f(x, y) 
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty) + \frac{L}{2}\Vert y - Ty\Vert^2 
    - L\langle y - Ty, x - Ty\rangle - D_f(x, y) 
    &\ge 0. 
\end{aligned}
$$


Now, observe that we have $L(y - Ty) = \mathcal G_L(y)$, and in this case it makes the above simplifies to 

$$
\begin{aligned}
    h(x) - h(Ty) - \langle \mathcal G_L(y), x - Ty\rangle
    &\ge 
    D_f(x, y) - \frac{L}{2}\Vert y - Ty\Vert^2. 
\end{aligned}
$$

**Remarks**

The results here is the same as the previous claims. 
The only difference here is the lemma we used. 
Observe that this inequality is even tighter than the previous if we instead use the inequality: 
$$
\begin{aligned}
    M^{L^{-1}}(Ty; y) &\ge h(Ty) + \frac{L}{2}\Vert Ty - y\Vert^2. 
\end{aligned}
$$

Then we instead have: 

$$
\begin{aligned}
    h(x) - h(Ty) - \langle L(y - Ty), x - Ty\rangle 
    &\ge 
    D_f(x, y) \ge 0
\end{aligned}
$$

Now, this is strange. 
The above results means that the proximal gradient inequality when evaluates inexactly, still ratains the same inequality when the quantities involved inexact!


