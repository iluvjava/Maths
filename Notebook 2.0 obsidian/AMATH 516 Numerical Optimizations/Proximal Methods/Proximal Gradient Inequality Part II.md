- [Proximal Gradient Inequality Part II](Proximal%20Gradient%20Inequality%20Part%20II.md)
- [Weakly Convex Function](../Weakly%20Convex%20Function.md)

---
### **Intro**

Recall contents from the previous file. 
In this file we present proximal gradient inequality in the nonconvex settings. 
We will first introduce the nonconvex settings to set up the scope and then we will discuss the proximal gradient and the gradient mapping operator in this scope. 

#### **Assumption set 1**
> Let $F = f + g$ where $f$ is a $L$ smooth differentiable function and $g$ is weakly/strongly convex, i.e: There exists a largest $q \in \R^n$ such that $g - q/2\Vert \cdot\Vert^2$ is a convex function. 


The proximal gradient operator remains the same, it will be applied to $F = f + g$ under Assumption set 1. 
Recall the definition of proximal gradient operator: 

$$
\begin{aligned}
    T_{\beta^{-1}f, g}(x) &= \argmin{z \in \R^n}\left\lbrace
        g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{\beta}{2}\Vert z - x\Vert^2
    \right\rbrace
    \\
    &= \left[
        I + \beta^{-1} \partial g
    \right]\circ \left[
        I - \beta^{-1}\nabla f
    \right](x). 
\end{aligned}
$$

When we choose $\beta > \max(-q, 0)$, the operator $T_{\beta^{-1}f, g}(x)$ admits a unique solution due theories of strong convexity. 
Recall that the gradient mapping has

$$
\begin{aligned}
    \mathcal G_{\beta^{-1}, f, g}(x) 
    &= x - T_{\beta^{-1}, f, g}(x) 
    \in \beta(\nabla f(\bar x) + \partial g(x)).
\end{aligned}
$$
These results are obvious from the calculus of nonsmooth calculus. 





---
### **Extensions of Proximal Gradient Inequality**

We will prove the same claim with different approaches. 
This is sometimes useful. 
In this section we consider the [Mordukhovich Limiting Subdifferential](AMATH%20516%20Numerical%20Optimizations/Non-Smooth%20Calculus/Limiting%20Subgradient.md) due nonconvexity. 
The proofs based on subgradient inequality will be simpler compared to using Quadratic growth conditions over minimizers. 

#### **Claim 2.1 | The Fundamental Proximal Gradient Inequality**
> Suppose $\beta > 0$. 
> Let $F = f + g$. 
> Let $f$ be differentiable, assume there exists $q \in \R$ be the largest value such that $g - q\Vert \cdot\Vert^2/2$ is convex. 
> For any $x \in \R^n$, define $\bar x = T_{\beta^{-1}, f, g}(x)$, it has $\forall z \in \R^n$
> $$
> \begin{aligned}
>     \frac{q}{2}\Vert z - \bar x\Vert^2 
>     &\le 
>     F(z) - F(\bar x) - \langle \beta(x - \bar x), z - \bar x\rangle 
>     + D_f(x, \bar x ) - D_f(z, x). 
> \end{aligned}
> $$

**Proof**

By definition, it has 

$$
\begin{aligned}
    \bar x &\in \argmin{z} \left\lbrace
        g(z) + \langle \nabla f(x), z\rangle + \frac{\beta}{2}\Vert z - x\Vert^2
    \right\rbrace
    \\
    \implies
    \mathbf 0 
    &\in \partial g(\bar x) + \nabla f(x) + \beta(\bar x - x)
    \\
    \iff 
    \partial g(\bar x) &\ni
    - \nabla f(x) - \beta(\bar x - x). 
\end{aligned}
$$

Here $\partial g$ would be the limiting subgradient. 
Since $g - q \Vert \cdot\Vert^2/2$ is convex it has for all $z\in \R^n$: 

$$
\begin{aligned}
    \frac{q}{2}\Vert z - \bar x\Vert^2 
    &\le 
    g(z) - g(\bar x) + \langle \nabla f(x) + \beta(\bar x - x), z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + \langle \nabla f(x), z - \bar x\rangle + \langle \beta(\bar x - x), z - \bar x\rangle
    \\
    &= g(z) - g(\bar x) + \langle \nabla f(x), z - x\rangle
    + \langle \nabla f(x), x - \bar x\rangle
    + \langle \beta(\bar x - x), z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) 
    + (-D_f(z, x) + f(z) - f(x))
    + (D_f(\bar x, x) - f(\bar x) + f(x))
    + \langle \beta(\bar x - x), z - \bar x\rangle
    \\
    &= F(z) - F(\bar x) - D_f(z, x) + D_f(\bar x, x) 
    - \langle \beta(x - \bar x), z - \bar x\rangle. 
\end{aligned}
$$

$\blacksquare$

**Remarks**

It's a different proof, a different setup for $g$, but the results remains similar. 


#### **Claim 2.1.1 | Monotone descent property under smoothness**
> Let $F = f + g$ where, $f$ is differentiable and, the divergence is upper bounded by $L$, i.e: $D_f(x, y) \le L/2 \Vert x - y\Vert^2$ for all $x, y \in \R^n$, and there exists a largest $q \in \R$ such that $g - q\frac{\Vert \cdot\Vert^2}{2}$ is convex. 
> Let $\bar x = T_{\beta^{-1}, f, g}(x)$. 
> Then, for all $x \in \R^n$, it has the following inequality: 
> $$
> \begin{aligned}
>     0 \le F(x) - F(\bar x) - (\beta + q/2 - L/2)\Vert x - \bar x\Vert^2. 
> \end{aligned}
> $$
> And descent is possible when $\beta \ge (L - q)/2$. 
> The maximum descent is achieved by taking $\beta = (L - q)$

**Proof**

The assumption of $f, g$ is fits **Claim 2.1** because $f$ is differentiable and $g - q\Vert \cdot\Vert^2/2$ is a convex function. 
Invoking **Claim 2.1** with $\bar x = T_{\beta^{-1}, f, g}(x)$, and $z = x$, we have for all $x \in \R^n$: 

$$
\begin{aligned}
    0 &\le 
    - \frac{q}{2}\Vert x - \bar x\Vert^2 + 
    F(x) - F(\bar x) - \langle \beta(x - \bar x), x - \bar x\rangle 
    + D_f(x, \bar x ) - D_f(x, x)
    \\
    &= 
    - \frac{q}{2}\Vert x - \bar x\Vert^2 + 
    F(x) - F(\bar x) - \beta \Vert x - \bar x\Vert^2
    + D_f(x, \bar x ) - 0
    \\
    &\le
    - \frac{q}{2}\Vert x - \bar x\Vert^2 + 
    F(x) - F(\bar x) - \beta \Vert x - \bar x\Vert^2
    + \frac{L}{2}\Vert x - \bar x\Vert^2 
    \\
    &= F(x) - F(\bar x) - \left(
        \beta + \frac{q}{2} - \frac{L}{2}
    \right) \Vert x - \bar x\Vert^2. 
\end{aligned}
$$

Descent in the value of the function is possible if $\beta + q/2 - L/2 \ge 0$. 
To find the best stepsize, dependence between $\bar x$ and stepsize $\beta$ needs to be removed. 
To do that consider 

$$
\begin{aligned}
    0 &\le 
    F(x) - F(\bar x) - \left(
        \beta + \frac{q}{2} - \frac{L}{2}
    \right)\beta^{-2}\Vert \beta(x - \bar x) \Vert^2 
    \\
    &= 
    F(x) - F(\bar x) - \left(
        \beta + \frac{q}{2} - \frac{L}{2}
    \right)\beta^{-2}\Vert \mathcal G_{\beta^{-1}}(x) \Vert^2 
    \\
    &= F(x) - F(\bar x) - \left(
        \beta^{-1} + \frac{q - L}{2\beta^2} 
    \right)\Vert \mathcal G_{\beta^{-1}}(x)\Vert^2.
\end{aligned}
$$

It's not hard to see that, the best value to choose for $\beta$ is minimizing the expression $x + (1/2)(q - L)x^2$ with $x = \beta^{-1}$. 
Solving it gives: $\beta = L - q$, substituting it back it gives a best descent inequality: 
$$
\begin{aligned}
    0 &\le 
    F(x)- F(\bar x) - \frac{1}{2(L - q)}\Vert \mathcal G_{1/(L - q)}(x)\Vert^2. 
\end{aligned}
$$


$\blacksquare$

**Remarks**

When $q = 0$, this reduce to the convex case. 
To perform a line search for an algorithm simply asserts the following condition

$$
\begin{aligned}
    0 &\le F(x) - F(\bar x) - \frac{1}{2\eta}\Vert \mathcal G_{1/\eta} (x)\Vert^2.
\end{aligned}
$$


#### **Claim 2.2.1 | the smooth part is convex and Lipschitz smooth**
> ...


#### **Theorem 2.2 | Inexact proximal gradient inequality**
> Let $F = f + g$. Let $f$ be differentiable and suppose that there exists $q \in \R$ such that $g - q \Vert \cdot\Vert^2/2$ is convex. 
> Suppose that there exists $\bar x$, $\epsilon > 0$ such that $\Vert w\Vert \le \epsilon$ satisfying the variational inequality: 
> $$
> \begin{aligned}
>     w \in \partial g(\bar x) + \nabla f(x) + \beta(\bar x - x). 
> \end{aligned}
> $$
> Then the inexact proximal gradient inequality has for all $z \in \R^n$: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(z) - F(\bar x) - D_f(z, x) - D_f(\bar x, x) 
>     - \langle w, z - \bar x\rangle - \beta \langle \bar x - x, z - \bar x\rangle 
>     \\
>     &\le 
>     F(z) - F(\bar x) - D_f(z, x) - D_f(\bar x, x) 
>     + \Vert w\Vert\Vert z - \bar x\Vert
>     - \beta \langle \bar x - x, z - \bar x\rangle. 
> \end{aligned}
> $$


**Proof**

The proof uses the subgradient inequality of weakly/strongly convex functions. 
Let $v = w - \nabla f(x) - \beta(\bar x - x)$. 
Then for all $z \in \R^n$ the subgradient inequality has: 

$$
\begin{aligned}
    & \frac{q}{2}\Vert z - \bar x\Vert^2
    \\
    &\le 
    g(z) - g(\bar x) - \langle v, z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) - \langle w - \nabla f(x) - \beta(\bar x - x), z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + \langle\nabla f(x) + \beta(\bar x - x), z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + (\langle\nabla f(x), z - \bar x\rangle) 
    + \langle \beta(\bar x - x), z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + (\langle \nabla f(x), z - x\rangle - \langle \nabla f(x), x - \bar x\rangle) 
    + \langle \beta(\bar x - x), z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + 
    (- D_f(z, x) + f(z) - f(x) + D_f(\bar x, x) - f(\bar x) + f(x)) 
    + \langle \beta(\bar x - x), z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &= 
    g(z) - g(\bar x) + 
    (- D_f(z, x) + f(z) + D_f(\bar x, x) - f(\bar x)) 
    + \langle \beta(\bar x - x), z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &= 
    F(z) - F(\bar x)
    - D_f(z, x) + D_f(\bar x, x)
    + \beta\langle \bar x - x, z - \bar x\rangle
    - \langle w, z - \bar x\rangle
    \\
    &\le 
    F(z) - F(\bar x)
    - D_f(z, x) + D_f(\bar x, x)
    + \beta\langle \bar x - x, z - \bar x\rangle
    + \Vert w\Vert\Vert z - \bar x\Vert. 
\end{aligned}
$$

$\blacksquare$

#### **Discussion**

The proofs may look different from before, but the underlying mechanism is the same. 

---
### **Inexact Proximal Gradient inequalities**

The theories are developed under the settings of Catalyst Accelerations frameworks. 
See [Catalyst Accelerations Part IV, Inexact Oracles](../../MATH%20602%20Nesterov%20Acceleration/Catalyst%20Accelerations%20Part%20IV,%20Inexact%20Oracles.md). 
