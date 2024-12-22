- [Morau Envelope and Convex Proximal Operators](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)

---
### **Intro**

This section introduces a crucial inequality that is widely used for the convergence proof of the algorithm that involves the use of a proximal gradient operator. 

**Assumption**

1. $h = f + g$ where $g: Q \rightarrow \infty$, $f$ is convex and $L$-Lipschitz smooth. 

**Organizations**

In the introduction part, we prove the proximal gradient inequality using subgradient inequality, which implicitly assumed that the function is convex. 
The section that follows will weaken the assumptions and give equally satisfying proofs. 


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

**Organizations:**

The inequality can be derived from a slightly weaker set of assumptions. 
The difference here is the absence of subgradient inequality which is not used for the proof. 
The following is the same proof adapted from [Proximal Gradient Convergence Rate](AMATH%20516%20Numerical%20Optimizations/Classics%20Algorithms/Proximal%20Gradient%20Convergence%20Rate.md).

**Notations:**

$$
\begin{aligned}
    h(x) &:= g + f, 
    \\
    T&= [I + L^{-1}\partial h]\circ [I - L^{-1}\nabla f], 
    \\
    \widetilde{\mathcal M}^{L^{-1}}
    (x; y)
    &:= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle
    + \frac{L}{2}\Vert x - y\Vert^2,
    \\
    \mathcal M^{L^{-1}}(x; y) 
    &:= h(x) + \frac{L}{2}\Vert x - y\Vert^2.
\end{aligned}
$$

Unless specified, we assume that $f$ $L$ Lipschitz smooth and $g$ is convex. 
Before the major claim we state the following lemma to the proof sleek and cool: 

#### **Lemma | The proximal gradient envelope**
> With $h = g + f$ as assumed in this section. 
> Take $\widetilde{\mathcal M}^{L^{-1}}, \mathcal M^{L^{-1}}$ as defined above, we will have for all $x \in \R^n$ that: 
> $$
> \begin{aligned}
>     \widetilde{\mathcal M}^{L^{-1}}(x; y)
>     &= 
>     \mathcal M^{L^{-1}}(x; y)- D_f(x, y) \le \mathcal M^{L^{-1}}(x; y). 
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

The inequality is by convexity of $f$ and Lipschitz property of $F$. 
The inexact model function upper bound the actual model function. 


**Remarks**

This should make sense since the linearizing the smooth part make the model function lower than the original model function, so it's less. 


#### **Claim | The Fundamental Proximal gradient inequality**
> Let $h = g + f$ where $f$ is differentiable, and $g$ is convex. 
> Let $T$ denote the proximal gradient operator. 
> Fix any $y$, we have for all $x$: 
> $$
> \begin{aligned}
>     h(x) - h(Ty) - \langle L(y - Ty), x - Ty\rangle
>     &\ge  D_f(x, y)  - D_f(Ty; y)
> \end{aligned}
> $$

**Proof**

The proof is direct. 
The function $\widetilde{\mathcal M}(\cdot; y)$ is a $L$ strongly convex function with minimizer $Ty$ and hence it has admits quadratic growth condition around its minimizer, which gives the  strictly weaker inequality (See [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information about this property) for all $x \in Q$: 

$$
{\small
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
    + D_f(Ty; y)
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
    + D_f(Ty; y)
    &\ge 0
    \\
    \iff 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}\Vert x - y\Vert^2 - 
        \frac{L}{2}\Vert Ty - y\Vert^2
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
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
    - D_f(x, y) 
    + D_f(Ty; y)
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
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff
    \left(
        h(x) - h(Ty) + \frac{L}{2}\Vert x - Ty\Vert^2 
        - L\langle  x - Ty, y - Ty\rangle
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \iff 
    h(x) - h(Ty)
    - \langle L(y - Ty), x - Ty\rangle
    - D_f(x, y) 
    + D_f(Ty; y)
    &\ge 0. 
\end{aligned}
}
$$

On the first $\implies$, we use the property of the proximal gradient envelope that $-\widetilde{\mathcal M}^{\overline L^{-1}}(T_Ly, y) \ge -\mathcal M^{L^{-1}}(x; y)$. 

**Remarks**

In the proof above, smoothness and convexity is not directly involved in the proof. 
Here we will discuss how to get some alternatives from the lemma given the extra assumptions. 
When $f$ is $L$-Lipschitz smooth, then the lemma becomes: 

$$
\begin{aligned}
    h(x) - h(Ty)
    - \langle L(y - Ty),x - y \rangle
    - \frac{L}{2}\Vert y - Ty\Vert^2
    - D_f(x, y) 
    &\ge 0,
    \\
    \left(
        h(x) - h(Ty) + 
        \frac{L}{2}\Vert x - y\Vert^2 
        - \frac{L}{2}\Vert x - Ty\Vert^2 
    \right)
    - D_f(x, y) - \frac{L}{2}\Vert Ty - y\Vert^2
    &\ge 0. 
\end{aligned}
$$

When $f$ is $L$ Lipschitz smooth and also $\mu \ge 0$ strongly convex, the inequality becomes: 

$$
\begin{aligned}
    h(x) - h(Ty)
    - \langle L(y - Ty),x - y \rangle
    - \frac{L}{2}\Vert y - Ty\Vert^2
    - \frac{\mu}{2}\Vert x - y\Vert^2
    &\ge 0,
    \\
    \left(
        h(x) - h(Ty) + 
        \frac{L}{2}\Vert x - y\Vert^2 
        - \frac{L}{2}\Vert x - Ty\Vert^2 
    \right)
    - \frac{\mu}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert Ty - y\Vert^2
    &\ge 0. 
\end{aligned}
$$

The lower bound of $\mu/2\Vert x - y\Vert^2$ replaces the Bregman Divergence $D_f(x, y)$ in the inequality. 
To see the alternatives, we start with the inequality: 
$$
\begin{aligned}
    h(x) - h(Ty) - \langle L(y - Ty), x - Ty\rangle - D_f(x, y) + D_f(Ty; y)&\ge 0
    \\
    \iff
    h(x) - h(Ty)
    - \langle L(y - Ty), x - y + y - Ty\rangle - D_f(x, y) + D_f(Ty; y)
    &\ge 0
    \\
    \iff
    h(x) - h(Ty)
    - \langle L(y - Ty),x - y \rangle
    - L\Vert y - Ty\Vert^2
    - D_f(x, y) 
    + D_f(Ty; y)
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

The last $\implies$ has used the smoothness upper bound of $f$, which has 

$$
    D_f(Ty, y) \le L/2\Vert Ty - y\Vert^2.
$$ 

This reduces the coefficient on $\Vert y - Ty\Vert^2$. 
There are other lower bounds for the Bregman Divergence. For example from the smoothness it has: 

$$
D_f(x, y) \ge \frac{1}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert^2. 
$$

And from the strong convexity it has: 

$$
\begin{aligned}
    D_f(x, y) \ge \frac{\mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

The second inequality comes from something in the middle of the proof. 

$$
\begin{aligned}
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}
        \left(
            \Vert x - y\Vert^2
            - 
            \Vert y - Ty\Vert^2
        \right)
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \implies 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}
        \left(
            \Vert x - y\Vert^2
            - 
            \Vert y - Ty\Vert^2
        \right)
    \right)
    - \frac{\mu}{2}\Vert x - y\Vert^2
    + D_f(Ty; y)
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \implies 
    \left(
        h(x) - h(Ty) 
        + 
        \frac{L}{2}
        \left(
            \Vert x - y\Vert^2
            - 
            \Vert y - Ty\Vert^2
        \right)
    \right)
    - \frac{\mu}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert Ty - y\Vert^2
    - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0
    \\
    \implies 
    h(x) - h(Ty) + \frac{L - \mu}{2}\Vert x - y\Vert^2 - \frac{L}{2}\Vert x - Ty\Vert^2
    &\ge 0. 
\end{aligned}
$$

All the intermediate steps are all useful implications of the proximal gradient lemma. 



---
### **Proximal gradient inequality with weak convexity**

Here we take the convention that $f$ is $\mu$ weakly convex if and only if $f + \mu/2\Vert \cdot\Vert^2$ is convex. 

#### **Assumption of weak convexity of additive composite objective**
Let $F:= f + g$, let $f:\R^n \rightarrow \overline \R$ be $\mu$ weakly convex and differentiable. 
Let $g:Q\rightarrow \overline \R$ be convex. 
This assumption is more general than it first seems. 
For any $F: = f + g$, in the case where $g: Q \rightarrow \overline \R$ is $\mu$ weakly convex, and $f$ is convex. 
Then $F = (g + \mu/2\Vert \cdot\Vert^2) + (f - \mu/2\Vert \cdot\Vert^2)$; and in this case $\hat f:= f - \mu/2\Vert \cdot\Vert^2$ is $\mu$ weakly convex, and $\hat g = g + \mu/2\Vert \cdot\Vert^2$ is convex. 
Therefore, without loss of generality, we only need to assume one of either $f$ or $g$ is $\mu$ weakly convex, this can be conducted as long as we know which one is $\mu$ weakly convex. 

#### **The key exploit**
So, if $F$ is $\mu$ weakly convex, then the linearized model function has for all $y \in Q$:
$$
    \widetilde{\mathcal M}^{\overline L^{-1}}(x, y) = 
    g(x) + \langle \nabla f(y),x - y \rangle
    + \frac{L^+}{2}\Vert x - y\Vert^2. 
$$

where $\overline L = L + \mu$ where $L > 0$. 
This function, $\widetilde {\mathcal M}^{L^+}(\cdot, y)$ is a $L$ strongly convex function. 
This can be used to phrase a new theorem that is more general. 

#### **Lemma | The Proximal Gradient Envelope**
> With $F := g + f$, $g:Q \rightarrow \overline \R$ is convex and $f:\R^n \rightarrow \R$ is $\mu$ weakly convex and differentiable. 
> Fix any $y \in \R^n$, then for all $x \in Q$: 
> $$
> \begin{aligned}
>     \widetilde{\mathcal M}^{\overline L^{-1}}(x; y) = \widetilde{\mathcal M}^{\overline L^{-1}}(x; y) - D_f(x, y). 
> \end{aligned}
> $$

**Proof**

The previous proof can be reused because convexity is never involved in the previous proof for the equality. 





