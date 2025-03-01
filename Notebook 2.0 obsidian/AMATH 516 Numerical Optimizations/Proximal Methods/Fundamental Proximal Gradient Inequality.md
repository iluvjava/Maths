
Pre-requisite: 
- [Morau Envelope and Convex Proximal Operators](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)
- [Proximal Inequality](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Inequality.md)

---
### **Intro**

This section introduces a crucial inequality that is widely used for the convergence proof of the algorithm that involves the use of a proximal gradient operator. 

#### **Assumption 0**
> 1. $h = f + g$ where $g: \R \rightarrow \overline \R$, $f$ are closed convex and proper, and $f is $L$-Lipschitz smooth. 

Recall from previous sections on results of the proximal gradient operator. 



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

---
### **The envelope approach for proximal gradient inequality**

We are changing the notations a bit sorry. 

**Organizations:**

The inequality can be derived from a slightly weaker set of assumptions. 
The difference here is the absence of subgradient inequality which is not used for the proof. 
The following is the same proof adapted from [Proximal Gradient Convergence Rate](AMATH%20516%20Numerical%20Optimizations/Classics%20Algorithms/Proximal%20Gradient%20Convergence%20Rate.md).

**Notations:**

Let $\beta > 0$, denote: 
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

$\blacksquare$


**Remarks**

This should make sense since the linearizing the smooth part make the model function lower than the original model function, so it's less. 
This is true for all $L$, the $L$ here doesn't have to be the Lipschitz smoothness constant of function $f$. 

#### **Claim 1.2 | The Fundamental Proximal gradient inequality**
> Let $F = g + f$ where $f:\R^n\rightarrow \overline \R$ is differentiable, and $g:\R^n\rightarrow \overline \R$ such that it is bounded below. 
> Let $y \in \R^n$ and suppose that the function $\widetilde{\mathcal M}_F^{1/\beta}(\cdot, y)$ satisfies the quadratic growth condition with constant $q > 0$ such that for all $\bar y \in T_{1/\beta,f, g}(y)$ it has 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad 
>     0 &\le \widetilde{\mathcal M}_F^{1/\beta}(x, y) - 
>     \widetilde{\mathcal M}^{1/\beta}_F(\bar y, y) - 
>     \frac{q}{2}\Vert x - \bar y\Vert^2. 
> \end{aligned}
> $$
> Then, $\bar y$ is unique, and it has the following inequality and equality: 
> $$
> \begin{aligned}
>   0 &\le F(x) - F(\bar y) + D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) -
>   D_{\beta/2\Vert \cdot\Vert^2 - f}(\bar y, y) - q/2\Vert x -
>   \bar y\Vert^2
>   \\
>   &= F(x) - F(\bar y)
>   - \langle \beta(y - \bar y), x - \bar y\rangle
>   - D_f(x, y) 
>   + D_f(\bar y, y)
>   + \frac{\beta - q}{2}\Vert x - \bar y\Vert^2. 
> \end{aligned}
> $$ 

**Proof**

The proof is direct. 
Denote $\widetilde{\mathcal M}^{\beta^{-1}}_F, \mathcal M^{\beta^{-1}}_F$ by $\mathcal M, \widetilde{\mathcal M}$ for short. 
The function $\widetilde{\mathcal M}(\cdot; y)$ 
Using only quadratic growth $\widetilde {\mathcal M}(\cdot; y)$ and previous lemma it has: 

$$
\begin{aligned}
    0 &\le \widetilde{\mathcal M}(x; y) - \widetilde {\mathcal M}(\bar y; y) - 
    \frac{q}{2}\Vert x - \bar y\Vert^2
    \\
    &= \mathcal M(x; y) - D_f(x, y) - \left(
        \mathcal M(\bar y; y) - D_f(\bar y, y)
    \right) 
    - \frac{q}{2}\Vert x - \bar y\Vert^2
    \\
    &= F(x) - F(\bar y) + 
    \frac{\beta}{2}\Vert x - y\Vert^2 - \frac{\beta}{2}\Vert \bar y - y\Vert^2
    - D_f(x, y) + D_f(\bar y, y)
    - \frac{q}{2}\Vert x - \bar y\Vert^2 
    \\
    &=  F(x) - F(\bar y) + 
    D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) - D_{\beta/2\Vert \cdot\Vert^2 - f}(\bar y, y) - 
    \frac{q}{2}\Vert x - \bar y\Vert^2. 
\end{aligned}
$$

Expanding the definition of the Bregman Divergence it has: 

$$
{\small\begin{aligned}
    0 &\le 
    \left(
        F(x) - F(\bar y) 
        + 
        \frac{\beta}{2}\Vert x - y\Vert^2 - 
        \frac{\beta}{2}\Vert \bar y - y\Vert^2
    \right)
    - D_f(x, y) 
    + D_f(\bar y; y)
    - \frac{q}{2}\Vert x - \bar y\Vert^2
    \\
    &=
    \left(
        F(x) - F(\bar y) 
        + 
        \frac{\beta}{2}
        \left(
            \Vert x - \bar y + \bar y - y\Vert^2
            - 
            \Vert y - \bar y\Vert^2
        \right)
    \right)
    - D_f(x, y) 
    + D_f(\bar y; y)
    - \frac{q}{2}\Vert x - \bar y\Vert^2
    \\
    &= 
    \left(
        F(x) - F(\bar y) + \frac{\beta}{2}\Vert x - \bar y\Vert^2 
        - \beta\langle  x - \bar y, y - \bar y\rangle
    \right)
    - D_f(x, y) 
    + D_f(\bar y; y)
    - \frac{q}{2}\Vert x - \bar y\Vert^2
    \\
    &=
    F(x) - F(\bar y)
    - \langle \beta(y - \bar y), x - \bar y\rangle
    - D_f(x, y) 
    + D_f(\bar y, y)
    + \frac{\beta - q}{2}\Vert x - \bar y\Vert^2. 
\end{aligned}}
$$ 

$\blacksquare$



#### **Theorem 1.3 | Convex smooth proximal gradient inequality**
> Assume that $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu \ge 0$ convex.  
> Then, for $y \in \R^n, \bar y = T_{L^{-1}, f, g}$ it has the following: 
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


**Proof**

By definition, for all $y \in \R^n$, $\widetilde {\mathcal M}_F^{1/L}(\cdot, y)$ is $L$ strongly convex. 
Therefore, it admits quadratic growth condition over its unique minimizer $\bar y$ and hence the previous claim applies with $q = L =\beta$. 
From strong $\mu \ge 0$ strong convexity and $L$ Lipschitz smoothness of $f$,it has: 

$$
\begin{aligned}
    \frac{\mu}{2}\Vert x - y\Vert^2 \le 
    D_f(x, y) \le \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

Take Claim 1.2 it has: 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(\bar y) - \langle L(y - \bar y), x - \bar y\rangle - D_f(x, y) + D_f(\bar y, y)
    & 
    \\
    &\le 
    F(x) - F(\bar y) - \langle L(y - \bar y), x - \bar y\rangle 
    - D_f(x, y)
    + \frac{L}{2}\Vert \bar y - y\Vert^2
    \\
    &= 
    F(x) - F(\bar y) - \langle L(y - \bar y), x -y + y - \bar y\rangle 
    - \frac{\mu}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert \bar y - y\Vert^2
    \\
    &= 
    F(x) - F(\bar y) - \langle L(y - \bar y), x -y \rangle - L \Vert y - \bar y\Vert^2
    - \frac{\mu}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert \bar y - y\Vert^2
    \\
    &\le 
    F(x) - F(\bar y) - \langle L(y - \bar y), x - y\rangle
    - \frac{\mu}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y - \bar y\Vert^2. 
\end{aligned}
$$

On the second inequality above we made use of the upper bound of the Bregman divergence $D_f$ using the smoothness assumption. 
Our first result is claimed, proceeding further it has: 

$$
{\small
\begin{aligned}
    0
    &\le 
    F(x) - F(Ty) - \langle L(y - Ty), x - y\rangle 
    - \frac{\mu}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y - Ty\Vert^2
    \\
    &=
    F(x) - F(Ty) - 
    \left(
        L\langle y - Ty, x - y \rangle + \frac{L}{2}\Vert y - Ty\Vert^2
        + \frac{L}{2}\Vert x - y\Vert^2
    \right)
    + \frac{L}{2}\Vert x - y\Vert^2 
    - \frac{\mu}{2}\Vert x - y\Vert^2
    \\
    &=
    F(x) - F(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2  + \frac{L}{2}\Vert x - y\Vert^2 
    - \frac{\mu}{2}\Vert x - y\Vert^2
    \\
    &= F(x) - F(Ty) - \frac{L}{2}\Vert x - Ty\Vert^2  + \frac{L - \mu}{2}\Vert x - y\Vert^2. 
\end{aligned}
}
$$

Our second result is claimed. 
$\blacksquare$

**Remark**

The claim is true for all $L$ that is larger than the real Lipschitz modulus of $f$. 


#### **Theorem 1.4 | Strong convexity from both smooth and nonsmooth parts**
> Let $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu_f \ge 0$ strongly convex, let $g$ be $\mu_g \ge 0$ strongly convex. 
> Then for any $x \in \R^n, y \in \R^n, \bar y = T_{L^{-1}, f, g}$, it satisfies:
>
> $$
> \begin{aligned}
>     0 &\le 
>     F(x) - F(\bar y)
>     - L\langle y - \bar y, x - y\rangle
>     - \frac{\mu_f}{2}\Vert x - y\Vert^2
>     - \frac{L}{2}\Vert \bar y - y\Vert^2
>     + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2. 
>     \\
>     & =
>     F(x) - F(\bar y)
>     - \frac{L - \mu_g}{2}\Vert x - \bar y \Vert^2
>     + \frac{L - \mu_f}{2}\Vert x- y\Vert^2. 
> \end{aligned}
> $$

**Proof**

For all $y \in \R^n$, the function $\widetilde{\mathcal M}_F^{1/L, f, g}(\cdot, y)$ is $q= \mu_g + L$ strongly convex. 
Strong convexity and L-Lipschitz smoothness create: $\forall x, y \in \R^n\;$ it has $\frac{L}{2}\Vert x - y\Vert^2 \le D_f(x, y) \ge \frac{\mu_f}{2}\Vert x - y\Vert^2$. 
The results of Claim 1.2 applies with $\beta = L$: 

$$
\begin{aligned}
    0 &\le
    F(x) - F(\bar y)
    - \langle L(y - \bar y), x - \bar y\rangle
    - D_f(x, y) 
    + D_f(\bar y, y)
    + \frac{\beta - q}{2}\Vert x - \bar y\Vert^2
    \\
    &\le 
    F(x) - F(\bar y)
    - \langle L(y - \bar y), x - \bar y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert \bar y - y\Vert^2
    + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2
    \\
    &=
    F(x) - F(\bar y)
    - \langle L(y - \bar y), x - y + y -\bar y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert \bar y - y\Vert^2
    + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2
    \\
    &= 
    F(x) - F(\bar y)
    - L\langle y - \bar y, x - y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert \bar y - y\Vert^2
    + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2. 
\end{aligned}
$$

Completing the square:

$$
\begin{aligned}
    0 &\le 
    F(x) - F(\bar y)
    - L\langle y - \bar y, x - y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert \bar y - y\Vert^2
    + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2
    \\
    &= 
    F(x) - F(\bar y)
    - \frac{L}{2}\Vert x - \bar y \Vert^2
    + \frac{L - \mu_f}{2}\Vert x- y\Vert^2
    + \frac{\mu_g}{2}\Vert x - \bar y\Vert^2
    \\
    &= 
    F(x) - F(\bar y)
    - \frac{L - \mu_g}{2}\Vert x - \bar y \Vert^2
    + \frac{L - \mu_f}{2}\Vert x- y\Vert^2. 
\end{aligned}
$$

$\blacksquare$

---
### **Proximal gradient inequality with weak convexity**

Here we take the convention that $f$ is $\mu$ weakly convex if and only if $f + \mu/2\Vert \cdot\Vert^2$ is convex. 

#### **Assumption 2 | Smooth side is weakly convex**
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

#### **Lemma 2.1 | The Proximal Gradient Envelope**
> With $F := g + f$, $g:Q \rightarrow \overline \R$ is convex and $f:\R^n \rightarrow \R$ is $\mu$ weakly convex and differentiable. 
> Fix any $y \in \R^n$, then for all $x \in Q$: 
> $$
> \begin{aligned}
>     \widetilde{\mathcal M}^{\overline L^{-1}}(x; y) = \widetilde{\mathcal M}^{\overline L^{-1}}(x; y) - D_f(x, y). 
> \end{aligned}
> $$

**Proof**

The previous proof can be reused because convexity is never involved in the previous proof for the equality. 

#### **Lemma 2.2 | The proximal gradient inequality**
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



#### **Corollary 2.3 | When smooth part is convex**


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

--- 
### **Proximal gradient inequality as an extension of proximal inequality**




---
### **Inexact Proximal Gradient inequalities**

The theories are developed under the settings of Catalyst Accelerations frameworks. 
See [Catalyst Accelerations Part IV, Inexact Oracles](../../MATH%20602%20Nesterov%20Acceleration/Catalyst%20Accelerations%20Part%20IV,%20Inexact%20Oracles.md). 
