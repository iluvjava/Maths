
Pre-requisite: 
- [Morau Envelope and Convex Proximal Operators](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)

---
### **Intro**

This section introduces a crucial inequality that is widely used for the convergence proof of the algorithm that involves the use of a proximal gradient operator. 

#### **Assumption 0**
> 1. $h = f + g$ where $g: \R \rightarrow \overline \R$, $f$ are closed convex and proper, and $f is $L$-Lipschitz smooth. 


Recall from previous sections on results of the proximal gradient operator. 

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

We can do this by standard rules of non-smooth convex analysis. 

**Remark**

Convexity of $f$ is not necessary for the claim to hold. 
This is true for all non-convex but differential $f$ as well. 

<!-- 
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
 
 -->

---
### **The envelope approach for proximal gradient inequality**

We are changing the notations a bit sorry. 

**Organizations:**

The inequality can be derived from a slightly weaker set of assumptions. 
The difference here is the absence of subgradient inequality which is not used for the proof. 
The following is the same proof adapted from [Proximal Gradient Convergence Rate](AMATH%20516%20Numerical%20Optimizations/Classics%20Algorithms/Proximal%20Gradient%20Convergence%20Rate.md).

**Notations:**
Let $\beta > 0$be arbitrary. 
Denotes: 
$$
\begin{aligned}
    F &:= g + f, 
    \\
    T_{\beta^{-1}, f, g}&= [I + \beta^{-1}\partial g]\circ [I - \beta^{-1}\nabla f], 
    \\
    \widetilde{\mathcal M}^{\beta^{-1}}_F
    (x; y)
    &:= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle
    + \frac{\beta}{2}\Vert x - y\Vert^2,
    \\
    \mathcal M^{\beta^{-1}}_F(x; y) 
    &:= F(x) + \frac{\beta}{2}\Vert x - y\Vert^2
\end{aligned}
$$

Take note that $T_{\beta^{-1}, f, g} = \argmin{x} \;\widetilde{\mathcal M}(x; y)$. 


#### **Assumption 1 | Smooth plus nonsmooth**
> Unless specified, we assume that $f:\R^n \rightarrow \R$ differentiable and $g$ is closed, proper, and convex. 


Before the major claim we state the following lemma to the proof sleek and cool. 

#### **Lemma 1.1 | The proximal gradient envelope**
> Take $F = g + f$, Take $\widetilde{\mathcal M}^{\beta^{-1}}_F, \mathcal M^{\beta^{-1}}_F$ as given Assumption 1. 
> Take any arbitrary $\beta > 0$. 
> We will have for all $x \in \R^n$ the following relations: 
> $$
> \begin{aligned}
>     \widetilde{\mathcal M}^{\beta^{-1}}_F(x; y)
>     &= 
>     \mathcal M^{\beta^{-1}}_F(x; y)- D_f(x, y) 
>     \\
>     &= F(x) + D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y)
>     \\
>     & \le \mathcal M^{\beta^{-1}}_F(x; y)
> \end{aligned}
> $$

**Proof**

The proof for the equality is direct, we have for all $\forall x, y$: 

$$
\begin{aligned}
    \widetilde{\mathcal M}^{\beta^{-1}}_F(x; y) 
    &= 
    g(x) + f(y) + \langle \nabla f(y), x - y\rangle + \frac{\beta}{2}\Vert x - y\Vert^2
    \\
    &= 
    g(x) + f(x) - f(x) + f(y) 
    + \langle \nabla f(y), x - y\rangle + \frac{\beta}{2}\Vert x - y\Vert^2
    \\
    &= 
    F(x) - D_f(x, y) + \frac{\beta}{2}\Vert x - y\Vert^2 
    \\
    &= \mathcal M^{\beta^{-1}}_F(x; y) - D_f(x, y). 
\end{aligned}
$$




**Remarks**

This should make sense since the linearizing the smooth part make the model function lower than the original model function, so it's less. 
This is true for all $L$, the $L$ here doesn't have to be the Lipschitz smoothness constant of function $f$. 

#### **Claim 1.2 | The Fundamental Proximal gradient inequality**
> Let $F = g + f$ where $f$ is convex and differentiable, and $g$ is convex and $F$ is $\mu \ge 0$ strongly convex. 
> Let $\beta > 0$ be arbitrary. 
> Let $T$ denote the proximal gradient operator: $T_{\beta^{-1}, f, g}$. 
> For any $y, x \in \R^n$, we have the following equivalent inequalities: 
> $$
> \begin{aligned}
>   0 &\le F(x) - F(Ty) + D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) -
>   D_{\beta/2\Vert \cdot\Vert^2 - f}(Ty, y) - (\beta + \mu)/2\Vert x -
>   Ty\Vert^2
>   \\
>   &= F(x) - F(Ty)
>   - \langle \beta(y - Ty), x - Ty\rangle
>   - D_f(x, y) 
>   + D_f(Ty, y)
>   - \frac{\mu}{2}\Vert x - Ty\Vert^2. 
> \end{aligned}
> $$ 

**Proof**

The proof is direct. 
We can assume $F$ is $\mu \ge 0$ strongly convex, the strong convexity can come from $f$ or $g$, or both. 
Denote $\widetilde{\mathcal M}^{\beta^{-1}}_F, \mathcal M^{\beta^{-1}}_F$ by $\mathcal M, \widetilde{\mathcal M}$ for short. 

Then, the function $\widetilde{\mathcal M}(\cdot; y)$ is a $\beta + \mu$ strongly convex function with minimizer $Ty$ and hence it has admits quadratic growth condition around its minimizer, which gives the strictly weaker inequality (See [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md) for more information about this property). 
Using only quadratic growth $\widetilde {\mathcal M}(\cdot; y)$ we can achieve (1.) by considering for all $x \in \R^n$: 

$$
\begin{aligned}
    0 &\le \widetilde{\mathcal M}(x; y) - \widetilde {\mathcal M}(Ty; y) - 
    \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &= \mathcal M(x; y) - D_f(x, y) - \left(
        \mathcal M(Ty; y) - D_f(Ty, y)
    \right) 
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &= F(x) - F(Ty) + 
    \frac{\beta}{2}\Vert x - y\Vert^2 - \frac{\beta}{2}\Vert Ty - y\Vert^2
    - D_f(x, y) + D_f(Ty, y)
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2 
    \\
    &=  F(x) - F(Ty) + 
    D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) - D_{\beta/2\Vert \cdot\Vert^2 - f}(Ty, y) - 
    \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2. 
\end{aligned}
$$

(1.) is proven, based on the intermediate results we have: 

$$
{\small
\begin{aligned}
    0 &\le 
    \left(
        F(x) - F(Ty) 
        + 
        \frac{\beta}{2}\Vert x - y\Vert^2 - 
        \frac{\beta}{2}\Vert Ty - y\Vert^2
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &=
    \left(
        F(x) - F(Ty) 
        + 
        \frac{\beta}{2}
        \left(
            \Vert x - Ty + Ty - y\Vert^2
            - 
            \Vert y - Ty\Vert^2
        \right)
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    \left(
        F(x) - F(Ty) 
        + 
        \frac{\beta}{2}
        \left(
            \Vert x - Ty\Vert^2 + 
            2\langle x - Ty, Ty - y\rangle
        \right)
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    \left(
        F(x) - F(Ty) + \frac{\beta}{2}\Vert x - Ty\Vert^2 
        - \beta\langle  x - Ty, y - Ty\rangle
    \right)
    - D_f(x, y) 
    + D_f(Ty; y)
    - \frac{\beta + \mu}{2}\Vert x - Ty\Vert^2
    \\
    &=
    F(x) - F(Ty)
    - \langle \beta(y - Ty), x - Ty\rangle
    - D_f(x, y) 
    + D_f(Ty, y)
    - \frac{\mu}{2}\Vert x - Ty\Vert^2. 
\end{aligned}
}
$$ 

Pursuing further we have the results: 


**Remarks**

The proof only used quadratic growth condition of $\widetilde {\mathcal M}^{L^{-1}}(\cdot; y)$ around its minimizer, which is much weaker than the strong convexity of $F$. 
The proof the follows will make use of the strong convexity assumption. 


#### **Theorem 1.3 | Proximal gradient inequality with smoothness**
> Assume that $F = f + g$ where $f$ is $L$ Lipschitz smooth and convex and $F$ is $\mu \ge 0$ strongly convex. 
> Then, for $y \in \R^n$ it has the following chain of inequalities/equalities: 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad 
>     \frac{\mu}{2}\Vert x - Ty\Vert^2 &\le 
>     F(x)  - F(Ty) - \langle L(y - Ty), x - y\rangle
>     - D_f(x, y) - \frac{L}{2}\Vert y - Ty\Vert^2
>     \\
>     &= F(x)  - F(Ty) + \frac{L}{2}(\Vert x - y\Vert^2 - \Vert Ty - x\Vert^2) - D_f(x, y). 
> \end{aligned}
> $$


**Proof**

From strong $\mu \ge 0$ strong convexity and $L$ Lipschitz smoothness, Bregman Divergence of $f$ has for any fixed $y$, all $x \in \R^n$ the inequality: 

$$
\begin{aligned}
    \frac{\mu}{2}\Vert x - y\Vert^2 \le 
    D_f(x, y) \le \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

Take claim 1.2 (2.), set $\beta = L$, $T_{L^{-1}, f, g} =: T$, it has for all $x, y \in \R^n$: 
$$
\begin{aligned}
    0 &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - Ty\rangle - D_f(x, y) + D_f(Ty, y)
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    & 
    \\
    &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - Ty\rangle 
    - D_f(x, y)
    + \frac{L}{2}\Vert Ty - y\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    F(x) - F(Ty) - \langle L(y - Ty), x -y + y - Ty\rangle 
    - D_f(x, y)
    + \frac{L}{2}\Vert Ty - y\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    F(x) - F(Ty) - \langle L(y - Ty), x -y \rangle - L \Vert y - Ty\Vert^2
    - D_f(x, y)
    + \frac{L}{2}\Vert Ty - y\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &=
    \left(
        F(x)  - F(Ty) - \langle L(y - Ty), x - y\rangle
        - D_f(x, y) - \frac{L}{2}\Vert y - Ty\Vert^2
    \right)
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - y\rangle
    - D_f(x,y) 
    - \frac{L}{2}\Vert y - Ty\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2. 
\end{aligned}
$$

On the second inequality above we made use of the upper bound of the Bregman divergence $D_f$ using the smoothness assumption. 
Our first result is claimed, proceding further it has: 

$$
{\small
\begin{aligned}
    \frac{\mu}{2}\Vert x - Ty\Vert^2 
    &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - y\rangle - D_f(x, y)
    - \frac{L}{2}\Vert y - Ty\Vert^2
    \\
    &=
    F(x) - F(Ty) - 
    \left(
        L\langle y - Ty, x - y \rangle + \frac{L}{2}\Vert y - Ty\Vert^2
        + \frac{L}{2}\Vert x - y\Vert^2
    \right)
    + \frac{L}{2}\Vert x - y\Vert^2 - D_f(x, y)
    \\
    &=
    F(x) - F(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2  + \frac{L}{2}\Vert x - y\Vert^2 - D_f(x, y). 
\end{aligned}
}
$$

Our second result is claimed. 

**Remark**

The claim is true for all $L$ that is larger than the real Lipscthiz modulus of $f$. 


#### **Theorem 1.4 | Strong convexity from both smooth and nonsmooth parts**
> Let $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu_f \ge 0$ strongly convex, let $g$ be $\mu_g \ge 0$ strongly convex. 
> Then for any $x \in \R^n, y \in \R^n$, it satisfies the following inequalities: 
>
> $$
> \begin{aligned}
>     0 &\le 
>     F(x)  - F(Ty) - \langle L(y - Ty), x - y\rangle
>     - \frac{\mu_f}{2}\Vert x - y\Vert^2 
>     - \frac{L}{2}\Vert y - Ty\Vert^2
>     - \frac{\mu}{2}\Vert x - Ty\Vert^2
>     \\
>     & =
>     F(x) - F(Ty) - \frac{L + \mu}{2}\Vert x - Ty\Vert^2 
>     + \frac{L - \mu_f}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

The presence of smoothness allows us to continues from Theorem 1.3. 
Strong convexity has $\forall x, y \in \R^n\; D_f(x, y) \ge \frac{\mu_f}{2}\Vert x - y\Vert^2$. 
Continuing it has for all $x \in \R^n$

$$
{\small
\begin{aligned}
    0 &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - y\rangle
    - D_f(x, y) - \frac{L}{2}\Vert y - Ty\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &\le 
    F(x)  - F(Ty) - \langle L(y - Ty), x - y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2 
    - \frac{L}{2}\Vert y - Ty\Vert^2
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    F(x) - F(Ty) - \langle L(y - Ty), x - y\rangle
    - \frac{L}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y - Ty\Vert^2
    + \frac{L - \mu_f}{2}\Vert x - y\Vert^2 
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &= 
    F(x) - F(Ty)
    - \frac{L}{2}\Vert x - Ty\Vert^2
    + \frac{L - \mu_f}{2}\Vert x - y\Vert^2 
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    \\
    &= F(x) - F(Ty) - \frac{L + \mu}{2}\Vert x - Ty\Vert^2 + \frac{L - \mu_f}{2}\Vert x - y\Vert^2. 
\end{aligned}
}
$$

The second inequality and the last equality gives the desired results. 


---
### **Strong convexity transferred proximal gradient inequality**

We consider the case where the function under proximal operator operation is a strongly convex function. 
There should be a similar result with this new setup. 

#### **Assumption | Both has strong convexity**

> Let $F = f + g$ with $g$ being $\mu_g \ge0$ strongly convex, closed, and $f$ being $L$ Lipschitz smooth and $\mu_f \ge 0$ strongly convex. 
> Therefore, $F$ is $\mu = \mu_f + \mu_g \ge 0$ strongly convex. 

**Observations**

We can single out the strong convexity parts from the definition of strong convexity, by doing the following things: 

$$
\begin{aligned}
    F &= f + g
    \\
    &= (f - \mu_f/2\Vert \cdot\Vert^2)
    + \underbrace{(g - \mu_g/2 \Vert \cdot\Vert^2)}_{\hat g}
    + \mu/2\Vert \cdot\Vert^2
    \\
    &= f - \mu_f/2\Vert \cdot\Vert^2 + \mu/2\Vert \cdot\Vert^2 
    + \hat g
    \\
    &= 
    \underbrace{f + \mu_g/2\Vert \cdot\Vert^2}_{\hat f} + \hat g
\end{aligned}
$$

Observe that $\hat g$ is now convex, and $\hat f$ would be, $\mu \ge 0$ strongly convex and $L$ Lipschitz smooth. 



---
### **Proximal gradient inequality with weak convexity**

Here we take the convention that $f$ is $\mu$ weakly convex if and only if $f + \mu/2\Vert \cdot\Vert^2$ is convex. 

#### **Assumption | Smooth side is weakly convex**
> Let $F:= f + g$, let $f:\R^n \rightarrow \overline \R$ be $\mu$ weakly convex and differentiable. 

Let $g:Q\rightarrow \overline \R$ be convex. 
This assumption is more general than it first seems. 
For any $F$ that is the sum of a smooth $f$ and a non-smooth part $g$ such that exactly one of $f$ or $g$ is $\mu$ weakly convex, then we may assume without loss generality that the smooth part is $\mu$ weakly convex. 

**Without Loss of Generality**

For any $F: = f + g$, in the case where $g: Q \rightarrow \overline \R$ is $\mu$ weakly convex, and $f$ is convex. 
Then $F = (g + \mu/2\Vert \cdot\Vert^2) + (f - \mu/2\Vert \cdot\Vert^2)$; and in this case $\hat f:= f - \mu/2\Vert \cdot\Vert^2$ is $\mu$ weakly convex, and $\hat g = g + \mu/2\Vert \cdot\Vert^2$ is convex. 
Therefore, without loss of generality, we only need to assume one of either $f$ or $g$ is $\mu$ weakly convex, this can be conducted as long as we know which one is $\mu$ weakly convex. 

#### **The key exploit**
So, if $F$ is $\mu$ weakly convex, then the linearized model function has for all $y \in Q$:
$$
    \widetilde{\mathcal M}^{\overline L^{-1}}(x, y) = 
    g(x) + \langle \nabla f(y),x - y \rangle
    + \frac{\overline L}{2}\Vert x - y\Vert^2. 
$$

Where $\overline L = L + \mu$ where $L > 0$. 
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

#### **Lemma | The proximal gradient inequality**
> Let $F:= f + g$ where $g: Q\rightarrow \overline \R$ is convex, $f:\R^n \rightarrow \R$ is $\mu$ weakly convex and $K$ Lipschitz upper smooth. 
> Fix any $y \in \R^n$, assume the proximal linear model function is given by: 
> $$
> \begin{aligned}
>     \mathcal M(\cdot; y) = 
>     g(x) + f(y) + \langle \nabla f(y), x - y\rangle + \frac{\overline L}{2}\Vert x - y\Vert^2, 
> \end{aligned}
> $$
> Where $\overline L > \mu$. 
> Then for all $x \in \R^n$, we have the inequality: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(x) - F(Ty) 
>     - \overline L\langle x - y, y - Ty\rangle
>     + \frac{\mu}{2}\Vert x - Ty\Vert^2
>     + \left(
>         \frac{K}{2} - \overline L
>     \right)\Vert y - Ty\Vert^2 + \frac{\mu}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$


**Proof**

For notation simplicity, we consider $\widetilde{\mathcal M}(\cdot; y)$ instead of $\widetilde{\mathcal{M}}^{\overline L^{-1}}(\cdot; y)$, and $T$ denotes the proximal gradient operator. 

By assumption that $F$ is $\mu$ weakly convex. 
Choose any $\overline L > \mu$. 
Define $L := \overline L - \mu > 0$. 
Then $\widetilde{\mathcal M}(\cdot; y)$ becomes $\overline L - \mu$ strongly convex. 
The model function admits quadratic growth condition over minimizer $T_Ly$. 
Therefore, for all $x \in Q$ it has: 

$$

\begin{aligned}
    0 &\le 
    \widetilde{\mathcal M}(x; y) - \widetilde{\mathcal M}(Ty; y) - \frac{\overline L - \mu}{2}\Vert x - Ty\Vert^2 
    \\
    &= 
    \left(\mathcal M(x; y) - D_f(x, y)\right) - \mathcal M(Ty; y) + D_f(Ty, y) 
    - \frac{\overline L - \mu}{2}\Vert x - Ty\Vert^2
    \\
    &=
    \left(
        F(x) - F(Ty) 
        + \frac{\overline L}{2}\Vert x - y\Vert^2
        - \frac{\overline L}{2}\Vert y - Ty\Vert^2 
    \right)
    - \frac{\overline L - \mu}{2}\Vert x - Ty\Vert^2 
    +
    D_f(Ty, y) - D_f(x, y)
    \\
    & =
    \left(
        F(x) - F(Ty) 
        + \frac{\overline L}{2}\Vert x - Ty + Ty - y\Vert^2
        - \frac{\overline L}{2}\Vert y - Ty\Vert^2 
    \right)
    - \frac{\overline L - \mu}{2}\Vert x - Ty\Vert^2 
    + D_f(Ty, y) - D_f(x, y)
    \\
    & =
    \left(
        F(x) - F(Ty) 
        - \overline L\langle x - Ty, y - Ty\rangle
        + \frac{\overline L}{2}\Vert x - Ty\Vert^2
    \right)
    - \frac{\overline L - \mu}{2}\Vert x - Ty\Vert^2
    + D_f(Ty, y) - D_f(x, y)
    \\
    & =
    \left(
        F(x) - F(Ty) 
        - \overline L\langle x - Ty, y - Ty\rangle
    \right)
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + D_f(Ty, y) - D_f(x, y). 
\end{aligned}

$$

The chain of equivalent inequalities ends here, re-organizing it this is what we get: 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(Ty) 
    - \overline L\langle x - Ty, y - Ty\rangle
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + D_f(Ty, y) - D_f(x, y)
    \\
    &\le 
    F(x) - F(Ty) 
    - \overline L\langle x - Ty, y - Ty\rangle
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + D_f(Ty, y) + \frac{\mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

On the last inequality, we used the fact that $f$ is $\mu$ weakly strongly convex, $D_f(x, y) \ge - \mu/2\Vert x - y\Vert^2$. 
Let's assume that the Upper Lipschitz smoothness constant $K$ exists so $D_f(x, y) \le K/2\Vert x - y\Vert^2$ for all $x$, which completes an upper bound: 

$$
\begin{aligned}
    0
    &\le 
    F(x) - F(Ty) 
    - \overline L\langle x - Ty, y - Ty\rangle
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + \frac{K}{2}\Vert y - Ty\Vert^2 + \frac{\mu}{2}\Vert x - y\Vert^2
    \\
    &= 
    F(x) - F(Ty) 
    - \overline L\langle x - y + y - Ty, y - Ty\rangle
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + \frac{K}{2}\Vert y - Ty\Vert^2 + \frac{\mu}{2}\Vert x - y\Vert^2
    \\
    &= 
    F(x) - F(Ty) 
    - \overline L\langle x - y, y - Ty\rangle
    + \frac{\mu}{2}\Vert x - Ty\Vert^2
    + \left(
        \frac{K}{2} - \overline L
    \right)\Vert y - Ty\Vert^2 + \frac{\mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$



#### **Corollary | When smooth part is convex**


**Proof**

With the assumption that $F$ is $\sigma$ strongly convex and $K$ Lipschitz smooth, its Bregman Divergence has for all $x, y \in \R^n$: 

$$
\begin{aligned}
    \frac{\sigma}{2}\Vert x - y\Vert^2 
    \le D_f(x, y) \le \frac{K}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

Substituting $\mu = - \sigma$, the inequality becomes 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(Ty) 
    - \overline L\langle x - y, y - Ty\rangle
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    + \left(
        \frac{K}{2} - \overline L
    \right)\Vert y 
    - Ty\Vert^2 
    - \frac{\mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

Now, we may choose $\overline L = K$, so with that: 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(Ty) 
    - K\langle x - y, y - Ty\rangle
    - \frac{\mu}{2}\Vert x - Ty\Vert^2
    -
    \frac{K}{2}\Vert y - Ty\Vert^2 
    - \frac{\mu}{2}\Vert x - y\Vert^2
    \\
    &\le 
    F(x) - F(Ty) 
    - K\langle x - y, y - Ty\rangle
    -
    \frac{K}{2}\Vert y - Ty\Vert^2 
    - \frac{\mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

This, recovers the same lemma as in the convex smooth case, utilizing the non-convex formulation of the proximal gradient lemma. 


