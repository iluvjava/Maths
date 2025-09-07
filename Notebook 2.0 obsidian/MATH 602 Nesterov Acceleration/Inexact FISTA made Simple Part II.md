- [Inexact FISTA Made Simple Part I](Inexact%20FISTA%20Made%20Simple%20Part%20I.md)
- [Strong Convexity](../AMATH%20516%20Numerical%20Optimizations/Properties%20of%20Functions/Strong%20Convexity.md)

---
### **Intro**

The lemma below describes what happen when we minimizes a strongly convex function inexactly. 

#### **Lemma 0 | minimizing a strongly convex function inexactly**
> Let $h: \R^n \rightarrow \overline \R$ be a $\kappa$ strongly convex function. 
> Let $x^+ = \argmin{z}\;h(z)$ to be the minimizer. 
> For all $\epsilon$ let $\tilde x$ be such that $h(\tilde x) - h(x^+) \le \epsilon$.
> Then it has 
> $$
> \begin{aligned}
>     (\forall z\in \R^n)(\forall \theta \in \R)\quad
>     0 &\le 
>     h(z) - h(\tilde x) - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
>     + \epsilon \max(1, \theta^{-1}). 
> \end{aligned}
> $$

**Proof**

Strong convexity asserts error bound condition $\forall z \in \R^n$

$$
\begin{aligned}
    & h(z) - h(x^+)
    \\
    &\ge
    \frac{\kappa}{2}\Vert z - x^+\Vert^2
    \\
    &\ge
    \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
    + \frac{\kappa(1 - \theta^{-1})}{2}\Vert \tilde x - x^+\Vert^2.
\end{aligned}\tag{a}
$$

At the last inequality, we used an identity from [Cute Formulas](../AMATH%20516%20Numerical%20Optimizations/Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md), with the uninformative name: "An useful inequality". 
Continuing from (a) it has

$$
\begin{aligned}
    0 &\le h(z) - h(x^+) 
    - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
    - \frac{\kappa(1 - \theta^{-1})}{2}\Vert \tilde x - x^+\Vert^2
    \\
    &\le 
    h(z) + \epsilon - h(\tilde x) 
    - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
    + \frac{\kappa(\theta^{-1} - 1)}{2}\Vert \tilde x - x^+\Vert^2
    \\
    &\le 
    h(z) - h(\tilde x) 
    - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
    + \epsilon 
    + \max(0, \theta^{-1} - 1)\frac{\kappa}{2}\Vert \tilde x - x^+\Vert^2
    \\
    &= h(z) - h(\tilde x) 
    - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
    + \epsilon\max(1, \theta^{-1}). 
\end{aligned}
$$

We used strong convexity of $h$ to derive: 

$$
\begin{aligned}
    & \epsilon 
    + \max(0, \theta^{-1} - 1)\frac{\kappa}{2}\Vert \tilde x - x^+\Vert^2
    \\
    &\le 
    \epsilon + \max(0, \theta^{-1} - 1)(h(\tilde x) - h(x^+))
    \\
    &\le \epsilon + \max(0, \theta^{-1} - 1)\epsilon
    \\
    &\le 
    \epsilon\max(1, \theta^{-1}). 
\end{aligned}
$$

$\blacksquare$


#### **Assumption 0**
> The assumption is about $(F, f, g, L)$. 
> - $f$ is a convex, $L$ lipschitz smooth function. 
> - $g$ is a closed, convex, proper function. 

---
### **Inexact proximal gradient preliminaries**

#### **Definition 0 | PG Model Function**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> Let $\kappa \ge 0$. 
> For all $x \in \R^n$, and $z \in \text{dom}\; g$ define $h_\kappa(z | x) := g(z) + \langle \nabla f(x), z\rangle + \frac{\kappa}{2}\Vert z - x\Vert^2$. 

#### **Definition 1 | The exact proximal gradient operator**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> Then the exact proximal gradient operator is defined as 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\quad
>     T_\kappa(x) := 
>     \argmin{z\in \R^n}
>     \left\lbrace
>         g(z) + \langle \nabla f(x), z\rangle + \frac{\kappa}{2}\Vert x - z\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$


#### **Definition 2 | Inexact proximal gradient operator**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> Let $\delta \ge 0$, $\kappa \ge 0$, define $h_\kappa(z| x) := z \mapsto g(z) + \langle \nabla f(x), z\rangle + \frac{\kappa}{2}\Vert z - x\Vert^2$. 
> Let $x^+ = T_\kappa(x)$, with $T_\kappa$ given by **Definition 1**. 
> Then, the inexact proximal gradient operator is defined as: 
> $$
> \begin{aligned}
>     T_\kappa^{(\delta)}(x) := 
>     \left\lbrace
>         z \in \R^n : 
>         h_\kappa(z| x) - h_\kappa(x^+ | x) \le \frac{\delta}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

#### **Theorem | Inexact over regularized proximal gradient inequality**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> For any $\delta \in [0, 1], \kappa \ge 0$. 
> For all $x$, let $\tilde x \in T_{B + \kappa}^{(\delta\kappa)}(x)$ and assume $D_f(\tilde x, x) \le B/2\Vert \tilde x - x\Vert^2$. 
> Then, for all $z \in \R^n$: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(z) - F(\tilde x)
>     + \frac{B + \kappa}{2}\Vert z - x\Vert^2
>     - \frac{(B + \kappa)(1 - \delta)}{2}\Vert z - \tilde x\Vert^2. 
> \end{aligned}
> $$

**Proof**

We will list intermediate results (a), (b), and then prove the claim by the end. 
The function $h_{B + \kappa}(z | x)$ is $B + \kappa$ strongly convex, using **Lemma 0** gives: 
Firstly, consider the following intermediate results: 
$$
\begin{aligned}
    & \langle \nabla f(x), z - \tilde x\rangle
    \\
    &=
    \langle \nabla f(x), z - x\rangle
    + \langle \nabla f(x), x - \tilde x\rangle
    \\
    &= 
    -D_f(z, x) + f(z) - f(x)
    + D_f(\tilde x, x) - f(\tilde x) + f(x)
    \\
    &= 
    -D_f(z, x) + f(z)
    + D_f(\tilde x, x) - f(\tilde x). 
\end{aligned}\tag{a}
$$

The second intermediate result is:  

$$
\begin{aligned}
    & h_{B + \kappa}(z | x) - h_{B + \kappa}(\tilde x | x) 
    \\
    &= 
    g(z) - g(\tilde x) 
    + \langle \nabla f(x), z - \tilde x\rangle
    + \frac{B + \kappa}{2}\Vert z - x\Vert^2
    - \frac{B + \kappa}{2}\Vert \tilde x - x\Vert^2
    \\
    &\underset{\text{(a)}}{=} 
    g(z) - g(\tilde x) 
    -D_f(z, x) + f(z)
    + D_f(\tilde x, x) - f(\tilde x)
        \\&\quad 
        + \frac{B + \kappa}{2}\Vert z - x\Vert^2
        - \frac{B + \kappa}{2}\Vert \tilde x - x\Vert^2
    \\
    &=
    F(z) - F(\tilde x) 
    -D_f(z, x) + f(z) + D_f(\tilde x, x)
        \\&\quad 
        + \frac{B + \kappa}{2}\Vert z - x\Vert^2
        - \frac{B + \kappa}{2}\Vert \tilde x - x\Vert^2
    \\
    &\underset{\text{(1)}}{\le}
    F(z) - F(\tilde x) 
    + \frac{B + \kappa}{2}\Vert z - x\Vert^2
    + D_f(\tilde x, x)
    - \frac{B + \kappa}{2}\Vert \tilde x - x\Vert^2
    \\
    &\underset{\text{(2)}}{\le}
    F(z) - F(\tilde x)
    + \frac{B + \kappa}{2}\Vert z - x\Vert^2
    - \frac{\kappa}{2}\Vert \tilde x - x\Vert^2. 
\end{aligned}\tag{b}
$$

At (1), we used $f$ convex hence $-D_f(z, x) \le 0$ for all $z, x$. 
At (2), we used the fact that $D_f(\tilde x, x) \le \frac{B}{2}\Vert \tilde x - x\Vert^2$, which is assumed. 
Next, because of the definition of $T_{B + \kappa}^{(\delta\kappa)}(x)$, we can apply **Lemma 0** with $\kappa$ redefined as $\kappa + B$ and $\epsilon = \frac{\delta\kappa}{2}\Vert \tilde x - x\Vert^2$, then it has for all $z \in \R^n, \theta \in \R$: 
$$
\begin{aligned}
    0 &\le h_\kappa(z| x) - h_\kappa(\tilde x| x) 
    - \frac{(B + \kappa)(1 - \theta)}{2}\Vert z - \tilde x\Vert^2 
    + \epsilon \max(1, \theta^{-1})
    \\
    &\le 
    F(z) - F(\tilde x)
    + \frac{B + \kappa}{2}\Vert z - x\Vert^2
    - \frac{(B + \kappa)(1 - \theta)}{2}\Vert z - \tilde x\Vert^2 
    - \frac{\kappa}{2}\Vert \tilde x - x\Vert^2
    + \frac{\delta\kappa}{2}\Vert \tilde x - x\Vert^2\max(1, \theta^{-1}). 
\end{aligned}
$$

Set $\theta = \delta$, then the last two terms of the above inequality simplifies: 

$$
\begin{aligned}
    & \frac{-\kappa}{2}\Vert \tilde x - x\Vert^2
    + \frac{\delta\kappa}{2}\max(1, \theta^{-1})\Vert \tilde x - x\Vert^2
    \\
    &= \frac{\kappa}{2}\left(
        -1 + \delta \max(1, \theta^{-1})
    \right)\Vert \tilde x - x\Vert^2
    \\
    &= 
    \frac{\kappa}{2}\left(
        -1 + \delta \max(1, \delta^{-1})
    \right)\Vert \tilde x - x\Vert^2
    \\
    &= \frac{\kappa}{2}\left(
        -1 + \max(\delta, 1)
    \right)\Vert \tilde x - x\Vert^2
    \\ 
    &\le 0. 
\end{aligned}
$$
At the last inequality, we used $\delta \in (0, 1)$. 
This simplifies the inequality into: 

$$
\begin{aligned}
    0 &\le 
    F(z) - F(\tilde x)
    + \frac{B + \kappa}{2}\Vert z - x\Vert^2
    - \frac{(B + \kappa)(1 - \delta)}{2}\Vert z - \tilde x\Vert^2. 
\end{aligned}
$$

$\blacksquare$

**Remarks**

The $\kappa$ here is the over regularization parameter, it make room for the error $\epsilon$ from the inexact evaluation and, retaining the overall format of the proximal gradient inequality. 
If $\kappa = 0$, then it's the exact evaluation of $T_{B}$, to be inexact it's required that $\kappa > 0$. 

---
### **The algorithms and its convergence requirements**

The algorithm will make use of the, inexact proximal gradient operator from the previous section. 


#### **Definition | Inexact Accelerated Proximal Gradient Method**
> 
