
Pre-requisite: 
- [Morau Envelope and Convex Proximal Operators](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)
- [Proximal Inequality](AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Inequality.md)

---
### **Intro**

This section introduces a crucial inequality that is widely used for the convergence proof of the algorithm that involves the use of a proximal gradient operator. 

#### **Assumption 0**
> 1. $h = f + g$ where $g: \R \rightarrow \overline \R$, $f, g$ are closed convex and proper, and $f$ is $L$-Lipschitz smooth. 

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

$\blacksquare$

**Remark**

Convexity of $f$ is not necessary for the claim to hold. 
This is true for all non-convex but differential $f$ as well. 


---
### **The envelope approach for proximal gradient inequality**

We are changing the notations a bit sorry. 

**Organizations:**

The inequality can be derived from a slightly weaker set of assumptions. 
The difference here is the absence of subgradient inequality which is not used for the proof. 
The following is the same proof adapted from [Proximal Gradient Convergence Rate](Proximal%20Gradient%20Convergence%20Rate.md).

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

#### **Claim 1.2 | generic proximal gradient inequality**
> Let $F = g + f$ where $f:\R^n\rightarrow \overline \R$ is differentiable, and $g:\R^n\rightarrow \overline \R$ such that it is bounded below. 
> Let $y \in \R^n$ and suppose that the function $\widetilde{\mathcal M}_F^{1/\beta}(\cdot, y)$ satisfies the quadratic growth condition with constant $q > 0$ such that for all $y^+ \in T_{1/\beta,f, g}(y)$ it has 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad 
>     0 &\le \widetilde{\mathcal M}_F^{1/\beta}(x, y) - 
>     \widetilde{\mathcal M}^{1/\beta}_F(y^+, y) - 
>     \frac{q}{2}\Vert x - y^+\Vert^2. 
> \end{aligned}
> $$
> Then, $y^+$ is unique, and it has the following equivalent representations: 
> $$
> \begin{aligned}
>   0 &\le 
>   F(x) - F(y^+) + D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) -
>   D_{\beta/2\Vert \cdot\Vert^2 - f}(y^+, y) - q/2\Vert x -
>   y^+\Vert^2
>   \\
>   &= F(x) - F(y^+)
>   - \langle \beta(y - y^+), x - y^+\rangle
>   - D_f(x, y) 
>   + D_f(y^+, y)
>   + \frac{\beta - q}{2}\Vert x - y^+\Vert^2. 
> \end{aligned}
> $$ 

**Proof**

The proof is direct. 
Denote $\widetilde{\mathcal M}^{\beta^{-1}}_F, \mathcal M^{\beta^{-1}}_F$ by $\mathcal M, \widetilde{\mathcal M}$ for short. 
The function $\widetilde{\mathcal M}(\cdot; y)$ 
Using only quadratic growth $\widetilde {\mathcal M}(\cdot; y)$ and previous lemma it has: 

$$
\begin{aligned}
    0 &\le \widetilde{\mathcal M}(x; y) - \widetilde {\mathcal M}(y^+; y) - 
    \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &= \mathcal M(x; y) - D_f(x, y) - \left(
        \mathcal M(y^+; y) - D_f(y^+, y)
    \right) 
    - \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &= F(x) - F(y^+) + 
    \frac{\beta}{2}\Vert x - y\Vert^2 - \frac{\beta}{2}\Vert y^+ - y\Vert^2
    - D_f(x, y) + D_f(y^+, y)
    - \frac{q}{2}\Vert x - y^+\Vert^2 
    \\
    &=  F(x) - F(y^+) + 
    D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) - D_{\beta/2\Vert \cdot\Vert^2 - f}(y^+, y) - 
    \frac{q}{2}\Vert x - y^+\Vert^2. 
\end{aligned}
$$

Expanding the definition of the Bregman Divergence on the last equality:  

$$
{\small\begin{aligned}
    & \left(
        F(x) - F(y^+) 
        + 
        \frac{\beta}{2}\Vert x - y\Vert^2 - 
        \frac{\beta}{2}\Vert y^+ - y\Vert^2
    \right)
    - D_f(x, y) 
    + D_f(y^+; y)
    - \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &=
    \left(
        F(x) - F(y^+) 
        + 
        \frac{\beta}{2}
        \left(
            \Vert x - y^+ + y^+ - y\Vert^2
            - 
            \Vert y - y^+\Vert^2
        \right)
    \right)
    - D_f(x, y) 
    + D_f(y^+; y)
    - \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &= 
    \left(
        F(x) - F(y^+) + \frac{\beta}{2}\Vert x - y^+\Vert^2 
        - \beta\langle  x - y^+, y - y^+\rangle
    \right)
    - D_f(x, y) 
    + D_f(y^+; y)
    - \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &=
    F(x) - F(y^+)
    - \langle \beta(y - y^+), x - y^+\rangle
    - D_f(x, y) 
    + D_f(y^+, y)
    + \frac{\beta - q}{2}\Vert x - y^+\Vert^2. 
\end{aligned}}
$$ 

$\blacksquare$

#### **Theorem 1.4 | convex smooth proximal gradient inequality**
> Assume that $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu \ge 0$ strongly convex. 
> Then, for $y \in \R^n, y^+ = T_{L^{-1}, f, g}(y)$ it has the following: 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad 
>     0 &\le 
>     F(x) - F(y^+) - \langle L(y - y^+), x - y\rangle
>     - \frac{\mu}{2}\Vert x - y\Vert^2
>     - \frac{L}{2}\Vert y - y^+\Vert^2. 
>     \\
>     &= F(x) - F\left(y^+\right) - \frac{L}{2}\Vert x - y^+\Vert^2  + \frac{L - \mu}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$


**Proof**

By definition, for all $y \in \R^n$, $\widetilde {\mathcal M}_F^{1/L}(\cdot, y)$ is $L$ strongly convex. 
Therefore, it admits quadratic growth condition over its unique minimizer $y^+$ and hence the previous claim applies with $q = L =\beta$. 
From strong $\mu \ge 0$ strong convexity and $L$ Lipschitz smoothness of $f$,it has: 

$$
\begin{aligned}
    \frac{\mu}{2}\Vert x - y\Vert^2 \le 
    D_f(x, y) \le \frac{L}{2}\Vert x - y\Vert^2. 
\end{aligned}\tag{a}
$$

Therefore, it has 

$$
\begin{aligned}
    & \frac{-L}{2}\Vert x - y\Vert^2 \le 
    -D_f(x, y) \le 
    \frac{-\mu}{2}\Vert x - y\Vert^2
    \\
    \iff &
    0 \le D_{L/2\Vert \cdot\Vert^2 - f}(x, y) 
    \le \frac{L - \mu}{2}\Vert x - y\Vert^2. 
\end{aligned}\tag{b}
$$

Take Claim 1.2 and with $q = L = \beta$ it has: 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(y^+) + D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) -
    D_{\beta/2\Vert \cdot\Vert^2 - f}(y^+, y) - q/2\Vert x -
    y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+) + D_{L/2\Vert \cdot\Vert^2 - f}(x, y) -
    D_{L/2\Vert \cdot\Vert^2 - f}(y^+, y) - L/2\Vert x -
    y^+\Vert^2
    \\
    &\underset{\text{(b)}}{\le}
    F(x) - F(y^+) 
    + \frac{L - \mu}{2}\Vert x - y\Vert^2
    - 0
    - \frac{L}{2}\Vert x -y^+\Vert^2. 
\end{aligned}
$$

Equivalently, from Claim 1.2: 

$$
\begin{aligned}
    0 &\le F(x) - F(y^+)
    - \langle \beta(y - y^+), x - y^+\rangle
    - D_f(x, y) 
    + D_f(y^+, y)
    + \frac{\beta - q}{2}\Vert x - y^+\Vert^2
    \\
    &= F(x) - F(y^+)
    - L\langle y - y^+, x - y^+\rangle
    - D_f(x, y) 
    + D_f(y^+, y)
    + 0
    \\
    &\underset{\text{(a)}}{=} 
    F(x) - F(y^+)
    - L\langle y - y^+, x - y + y - y^+\rangle
    - \frac{\mu}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert y - y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+)
    - L\langle y - y^+, x - y \rangle
    - \frac{\mu}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y - y^+\Vert^2. 
\end{aligned}
$$

Claim 1.2 showed that the expression we started with in both cases are equal, hence they are still equal because it's all equalities. 

$\blacksquare$

**Remark**

The claim is true for all $L$ that is larger than the real Lipschitz modulus of $f$. 


#### **Theorem 1.5 | Strong convexity from both smooth and nonsmooth parts**
> Let $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu_f \ge 0$ strongly convex, let $g$ be $\mu_g \ge 0$ strongly convex. 
> Then for any $x \in \R^n, y \in \R^n, y^+ = T_{L^{-1}, f, g}$, it satisfies:
>
> $$
> \begin{aligned}
>     0 &\le 
>     F(x) - F(y^+)
>     - L\langle y - y^+, x - y\rangle
>     - \frac{\mu_f}{2}\Vert x - y\Vert^2
>     - \frac{L}{2}\Vert y^+ - y\Vert^2
>     + \frac{\mu_g}{2}\Vert x - y^+\Vert^2. 
>     \\
>     & =
>     F(x) - F(y^+)
>     - \frac{L + \mu_g}{2}\Vert x - y^+ \Vert^2
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
    F(x) - F(y^+)
    - \langle L(y - y^+), x - y^+\rangle
    - D_f(x, y) 
    + D_f(y^+, y)
    - \frac{\beta - q}{2}\Vert x - y^+\Vert^2
    \\
    &\le 
    F(x) - F(y^+)
    - \langle L(y - y^+), x - y^+\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert y^+ - y\Vert^2
    - \frac{\mu_g}{2}\Vert x - y^+\Vert^2
    \\
    &=
    F(x) - F(y^+)
    - \langle L(y - y^+), x - y + y -y^+\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    + \frac{L}{2}\Vert y^+ - y\Vert^2
    - \frac{\mu_g}{2}\Vert x - y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+)
    - L\langle y - y^+, x - y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y^+ - y\Vert^2
    - \frac{\mu_g}{2}\Vert x - y^+\Vert^2. 
\end{aligned}
$$

Completing the square:

$$
\begin{aligned}
    0 &\le 
    F(x) - F(y^+)
    - L\langle y - y^+, x - y\rangle
    - \frac{\mu_f}{2}\Vert x - y\Vert^2
    - \frac{L}{2}\Vert y^+ - y\Vert^2
    - \frac{\mu_g}{2}\Vert x - y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+)
    - \frac{L}{2}\Vert x - y^+ \Vert^2
    + \frac{L - \mu_f}{2}\Vert x- y\Vert^2
    - \frac{\mu_g}{2}\Vert x - y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+)
    - \frac{L + \mu_g}{2}\Vert x - y^+ \Vert^2
    + \frac{L - \mu_f}{2}\Vert x- y\Vert^2. 
\end{aligned}
$$

$\blacksquare$

Without the smooth part of the function, it produces the proximal point inequality.

#### **Theorem 1.6 | The Proximal Point inequality**
> Suppose $F = f + g$ satisfies **Assumption 0**, and in addition assume $f \equiv 0$. 
> Let, $y \in \R^n$, $y^+ = T_{\beta^{-1}, f, g}(y)$. 
> Then it satisfies for all $x \in \R^n$ the inequality: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(x) - F(y^+) 
>     + \frac{\beta}{2}\Vert x - y\Vert^2
>     - \frac{\beta}{2}\Vert y^+ - y\Vert^2
>     - \frac{q}{2}\Vert x - y^+\Vert^2. 
> \end{aligned}
> $$

**Proof**

Starting from **Claim 1.2**, it has: 

$$
\begin{aligned}
    0 &\le F(x) - F(y^+) + 
    D_{\beta/2\Vert \cdot\Vert^2 - f}(x, y) - D_{\beta/2\Vert \cdot\Vert^2 - f}(y^+, y) - 
    \frac{q}{2}\Vert x - y^+\Vert^2
    \\
    &= 
    F(x) - F(y^+) 
    + \frac{\beta}{2}\Vert x - y\Vert^2
    - \frac{\beta}{2}\Vert y^+ - y\Vert^2
    - \frac{q}{2}\Vert x - y^+\Vert^2. 
\end{aligned}
$$

Because the Bregman Divergence of $f\equiv 0$ is simply zero. $\blacksquare$

**Remarks**

To see how it's used, see [Convex Proximal Point Method, Part I](Convex%20Proximal%20Point%20Method,%20Part%20I.md). 



---
### **Non-trivial extension**


The following lemma is similar to appeared in the Catalyst paper for the inclusion of inexact evaluation of the proximal gradient. 

#### **Lemma 2.0 | inexact proximal gradient inequality with relative error**
> Let $F = f + g$ satisfies **Assumption 0**. 
> Fix any vector $x, z \in \R^n$. 
> Let $B \ge L, \epsilon > 0$
> Suppose the evaluation of the proximal gradient operator is inexact and contains error vector $w$:
> $$
> \begin{aligned}
>     w &\in \partial \left[z \mapsto g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{B}{2}\Vert z - x\Vert^2\right](\tilde x), 
> \end{aligned}
> $$
> such that it satisfies $\Vert w\Vert \le \epsilon \Vert x - \tilde x\Vert$. 
> Then, the following inequality is true: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
>     - \frac{B}{2}\Vert z - \tilde x\Vert^2 
>     + \epsilon \Vert z - x\Vert \Vert z - \tilde x\Vert. 
> \end{aligned}
> $$

**Proof**

Make $h(z; x) = z \mapsto g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{B}{2}\Vert z - x\Vert^2$. 
An inexact solution is produced to minimizer $h(z;x)$ on $z$, giving $w \in \partial h(\tilde x; x)$. 
$h$ is $B$ strongly convex therefore subgradient inequality has for $z$

$$
\begin{aligned}
    0 
    &\le 
    h(z; x) - h(\tilde x, x) - \langle w, z - \tilde x \rangle - \frac{B}{2}\Vert z - \tilde x \Vert^2. 
\end{aligned}
$$

The only difference compared to **Claim 1.2** is the additional cross term $\langle w, z - \tilde x\rangle$. 
Using the results of **Claim 1.2** with $B = q = \beta, x^+ = \tilde x$ with the added cross product, it yields 

$$
\begin{aligned}
    0 &\le 
    F(z) - F(\tilde x) + D_{B/2\Vert \cdot\Vert^2 - f}(z, x) -
    D_{B/2\Vert \cdot\Vert^2 - f}(\tilde x, x) - \frac{B}{2}\Vert z -
    \tilde x\Vert^2 
    - \langle w, z - \tilde x\rangle
    \\
    &=
    F(z) - F(\tilde x) + \left(
        \frac{B}{2}\Vert z - x\Vert^2 - D_f(z, x)
    \right)
    - \left(
        \frac{B}{2}\Vert \tilde x - x\Vert^2 - D_f(\tilde x, x)
    \right)
    \\
        &\quad 
        - \frac{B}{2}\Vert z - \tilde x\Vert^2 
        - \langle w, z - \tilde x\rangle
    \\
    &\underset{\text{(a)}}{\le} 
    F(z) - F(\tilde x) + \left(
        \frac{B}{2}\Vert z - x\Vert^2 - D_f(z, x)
    \right)
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    - \langle w, z - \tilde x\rangle
    \\
    &\underset{\text{(b)}}{\le} 
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    - \langle w, z - \tilde x\rangle
    \\
    &\underset{\text{(c)}}{\le}  
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + \epsilon \Vert \tilde x - x\Vert \Vert z - \tilde x\Vert. 
\end{aligned}
$$

At (a), we used the fact $B \ge L$ which means $B/2\Vert \tilde x - x\Vert - D_f(\tilde x, x) \ge 0$. 
At (b), we used the fact that $\frac{B}{2}\Vert x - x\Vert^2 - D_f(x, y)\le \frac{L - \mu}{2}\Vert x - z\Vert^2$ from the $L$ smoothness, $\mu$ strong convexity of $f$. 
At (c), we used the assumption that $\Vert w\Vert \le \epsilon \Vert z - x\Vert$. 

**Remarks**

The error is relative to the choices of point $z, x$.
Further away the point $z$ is relative to $x$, the more error it's above $\Vert w\Vert$. 
Further simplifications using basic algebra yields: 

$$
\begin{aligned}
    0 &\le
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + \epsilon \Vert \tilde x - x\Vert \Vert z - \tilde x\Vert
    \\
    &= F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + \epsilon \Vert \tilde x - x\Vert \Vert z - \tilde x\Vert
    \\&\quad 
        - \epsilon\Vert \tilde x - x\Vert^2 - \epsilon\Vert z - \tilde x\Vert^2
        + \epsilon\Vert \tilde x - x\Vert^2 + \epsilon\Vert z - \tilde x\Vert^2
    \\
    &= 
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    - \left(
        \sqrt{\epsilon}\Vert \tilde x - x\Vert - \sqrt{\epsilon}\Vert z - x \Vert
    \right)^2
    \\&\quad 
        + \epsilon\Vert \tilde x - x\Vert^2 + \epsilon\Vert z - \tilde x\Vert^2
    \\
    &\le 
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + \Vert \tilde x - x\Vert^2 + \epsilon\Vert z - \tilde x\Vert^2
    \\
    &= 
    F(z) - F(\tilde x) + \frac{B - \mu}{2}\Vert z - x\Vert^2
    - \frac{B - \epsilon}{2}\Vert z - \tilde x\Vert^2 
    + \epsilon\Vert \tilde x - x\Vert^2. 
\end{aligned}
$$

Suppose inexact gradient evaluation of $\tilde\nabla f$ yields inexact point $\tilde x$ at $x$, then it has: 

$$
\begin{aligned}
    0 &\in \partial g(\tilde x)
    + \tilde \nabla f(x) 
    + B(\tilde x - x)
    \\
    &= \partial g(\tilde x)
    + \tilde \nabla f(x) - \nabla f(x) + \nabla f(x)
    + B(\tilde x - x)
    \\
    \iff
    \tilde \nabla  f(x) - \nabla f(x)
    &\in 
    \partial g(\tilde x) + \nabla f(x) + B(\tilde x - x). 
\end{aligned}
$$

This gives $w = \tilde \nabla f(x) - \nabla f(x)$, the error terms associated with the inexact gradient evaluation. 
The relative error conditions then yields: 

$$
\begin{aligned}
    \left\Vert \tilde \nabla f(x) - \nabla f(x)\right\Vert
    &\le \epsilon\Vert \tilde x - x\Vert. 
\end{aligned}
$$

Here, $\tilde x - x$ will relate to the gradient mapping. 


#### **Lemma 2.1 | inexact proximal gradient inequality absolute error**
> 

**Proof**

$$
\begin{aligned}
    & \frac{B}{2}\Vert z - x^+\Vert^2
    \\
    &\le h(z) - h(x^+)
    \\
    &\le h(z) + \epsilon - h(\tilde x)
    \\
    &=  \left(
        g(z) + \langle \nabla f(x), z - x\rangle + \frac{B}{2}\Vert x - z\Vert^2
    \right) + \epsilon 
    - \left(
        g(\tilde x) + \langle \nabla f(x), \tilde x - x\rangle + \frac{B}{2}\Vert \tilde x - x\Vert^2
    \right)
    \\
    &= F(z) - F(\tilde x) + D_{B/2\Vert \cdot\Vert^2 - f}(z, x) + \epsilon
    - D_{B/2\Vert \cdot\Vert^2 - f}(\tilde x, x)
    \\
    &\le 
    F(z) + F(\tilde x) + \frac{L - \mu}{2}\Vert z - x\Vert^2
    + \epsilon - 0. 
\end{aligned}
$$

And 
$$
\begin{aligned}
    & F(z) + F(\tilde x) + \frac{L - \mu}{2}\Vert z - x\Vert^2
    + \epsilon - 0 
    \\
    &\ge \frac{B}{2}\Vert z - x^+\Vert^2
    \\
    &= \frac{B}{2}\Vert z - \tilde x + \tilde x - x^+\Vert^2
    \\
    &= \frac{B}{2}\left(
        \Vert z - \tilde x\Vert^2 + \Vert \tilde x - x^+\Vert^2
    \right) + B\langle z - \tilde x, \tilde x - x^+\rangle
    \\
    &\ge 
    \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + \frac{B}{2}\Vert \tilde x - x^+\Vert^2
    -  B\Vert z - \tilde x\Vert \Vert \tilde x - x^+\Vert. 
\end{aligned}
$$

So, it's

$$
\begin{aligned}
    0
    &\le 
    F(z) + F(\tilde x) + \frac{L - \mu}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2 
    + 
    \left(
        \epsilon
        - \frac{B}{2}\Vert \tilde x - x^+\Vert^2
        - B \langle z - \tilde x, \tilde x - x^+\rangle
    \right). 
\end{aligned}
$$