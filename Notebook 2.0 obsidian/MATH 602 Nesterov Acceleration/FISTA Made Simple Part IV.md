- [FISTA Made Simple Part III](FISTA%20Made%20Simple%20Part%20III.md)

---
### **Intro**

This file continues the discussion. 
But, this time, we focus on linear convergence rate that doesn't need strong convexity. 
We will introduce strong convexity relative to a semi-norm and, the proximal gradient inequality, and Jesen's inequality. 


**Notations**. 
Denote $\Pi_C$is as the projection onto the set $C$. 
The notations $\sigma_{\min |\cdot|}^{\neq 0}(A)$ denotes that smallest singular value of $A$ in absolute value that is not zero. 



#### **Assumption 1 | Smooth and semi strongly convex**
> The following assumption is about $(f, A_1, A_2)$
> Let $f: \R^n \rightarrow \overline \R$, and there exists $L \ge \sigma \ge 0$ and, two matrices $A_1, A_2$ such that for all $x, y \in \R^n$ it has 
> $$
> \begin{aligned}
>     (\forall x \in \R^m)(\forall y \in \R^m)\quad
>     \frac{1}{2}\Vert A_1x - A_1y\Vert^2 \le 
>     D_f(x, y) \le \frac{1}{2}\Vert A_2x - A_2y\Vert^2. 
> \end{aligned}
> $$

#### **Assumption 2 | Smooth and semi strongly convex plus convex**
> The following assumption is about $(f, g, F, A_1, A_2)$. 
> 1. Let $F = f + g$ where $f$ satisfies Assumption 1. 
> 2. $g: \R^n\rightarrow \overline \R$ is a closed convex and proper function. 

#### **Assumption 3 | smooth and strongly convex with affine composite**
> The following assumption is about $(f, h, A, b, \mu, L)$. 
> 1. Let $A \in \R^{n\times n}$, $b \in \R^{n}$. 
> 2. $h: \R^n \rightarrow \overline \R$ is a $\mu \ge 0$ strongly convex and $L$ Lipschitz smooth function. 
> 3. $f = h(Ax + b)$. 

We promise that under these assumption we can extend the linear convergence rate of Nesterov's accelerated gradient algorithm to beyond the strongly convex case. 
The following will characterize a specific class of function that satisfies Assumption 2.

#### **Theorem 1 | affine composite of S-CNVX functions**
> Let $A\in \R^{n \times m}$ and $b \in \R^n$.
> Suppose that $h:\R^n \rightarrow \overline \R$ is a $\mu \ge 0$ strongly convex and $L$ smooth. 
> Then the function $f = h(Ax + b)$ is Smooth and semi strongly convex with $A_1 = \sqrt{\mu}A$, and $A_2 = \sqrt{L}A$, here $I$ is the identity function. 

**Proof**

The proof is direct. 
Let $x, y \in \R$ be arbitrary. 
For $A_1$ it has: 
$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &=
    g(Ax) - g(Ay) - \langle A^T \nabla g(y), x - y\rangle
    \\
    &= g(Ax) - g(Ay) - \langle \nabla g(y), Ax - Ay\rangle
    \\
    &\ge \frac{\mu}{2}\Vert Ax - Ay\Vert^2.
\end{aligned}
$$

Next, for the upper bound from the smoothness, it's also direct because 

$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &= g(Ax) - g(Ay) - \left\langle A^T\nabla g(x), x - y\right\rangle
    \\
    &\le \frac{L_g}{2} \Vert Ax - Ay\Vert^2. 
\end{aligned}
$$

$\blacksquare$

The following theorem shows that, smooth and semi strongly convex function has similar behaviors. 
#### **Theorem 2 | simple, S-CNVX like bounds on smooth and semi strongly convex**
> Suppose that $(f, g, F, A_1, A_2)$ satisfies Assumption 2. 
> Then for all $x, y \in \R^n$ it has 
> $$
> \begin{aligned}
>     \frac{\sigma_{\min|\cdot|}^{\neq0}(A_1)^2}{2}\Vert (I - \Pi_{\text{ker}(A_1)})(x - y)\Vert^2
>     \le \frac{1}{2}\Vert A_1x - A_1y\Vert^2 
>     \le D_h(x, y) \le \frac{\Vert A_2\Vert^2}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

The proof is algebra. 
Consider arbitrary $x, y \in \R^n$, it's not hard to justify the upper bound because $\Vert x - y\Vert\le \Vert A\Vert^2\Vert x- y \Vert^2$. 
To see the lower bound, observe that for the $x - y$ vector it admits orthogonal decompositions $\Pi_{\text{ker}A_1}(x - y) \perp (I -\Pi_{\text{ker}A_1})(x - y)$, therefore it admits the following inequality 

$$
\begin{aligned}
    & \frac{1}{2}\Vert A_1x - A_1y\Vert^2 
    \\
    &\ge \frac{1}{2}\Vert A_1(x - y)\Vert^2 
    \\
    &= \frac{1}{2}\left(
        \left\Vert
            A_1\Pi_{\text{ker}A_1}(x - y)
        \right\Vert^2 
        + 
        \left\Vert
            A_1(I - \Pi_{\text{ker}A_1})(x - y)
        \right\Vert^2 
    \right)
    \\
    &\ge 
    \frac{1}{2}\left\Vert
        A_1(I - \Pi_{\text{ker}A_1})(x - y)
    \right\Vert^2
    \\
    &\ge 
    \frac{\sigma_{\min|\cdot|}^{\neq 0}(A_1)}{2}
    \left\Vert 
        (I - \Pi_{\text{ker}})(x - y)
    \right\Vert^2. 
\end{aligned}
$$

$\blacksquare$

In the following parts, we will assume the form of the objective function and make use of the theorems we drived above. 

#### **Assumption 4 | the ultimate objective function**
> The following assumption is about $(F, f, g, h, A, b, \mu, L)$. 
> 1. $(f, h, A, b, \mu, L)$ satisfies Assumption 3. 
> 2. $g$ is a proper closed and, convex function. 
> 3. Objective function is $F = f + g$.
> 4. The set of minimizers $X^+ := \argmin{x} F(x)\neq \emptyset$. 

There are several consequences of the list of assumptions above. 
Since the function $h$ is $\mu \ge 0$ strongly convex and $L$ Lipschitz smooth, and $f = h (Ax + b)$ by Assumption 3. 
Then using Theorem 1, 2 on $f = h(Ax + b)$ yields the inequality: 

$$
\begin{aligned}
    & \frac{\mu\sigma_{\min |\cdot|}^{\neq 0}(A)^2}{2}
    \Vert (I - \Pi_{\text{ker}(A)})(x - y)\Vert^2
    \\ 
    &\le 
    \frac{\mu}{2}\Vert Ax - Ay\Vert^2 
    \le
    D_f(x, y) \le \frac{L}{2}\Vert Ax - Ay\Vert^2
    \\
    &\le \frac{L\Vert A\Vert^2}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$




---
### **Preparing crucial inequalities for the convergence proof**

These lemmas and theorems are crucial for proving the convergence rate of accelerated first proximal gradient algorithm. 

#### **Definition | Proximal gradient operator**
> Let $F = f + g$ where $f$ is $L$ Lipschitz smooth and $g$ is convex.
> Let $B > 0$. 
> We define the proximal gradient operator 
> $$
> \begin{aligned}
>     T_{B}(x) = \argmin{z}\left\lbrace
>         g(z) + \langle \nabla f(x), z - x\rangle + \frac{B}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

The above operator $T_B(x)$ is a singleton, and it also has $T_B(x) = \pprox{x}(x - B^{-1}\nabla f(x))$. 


#### **Theorem | proximal gradient inequality**
> Suppose that $(F, f, g, h, A, b, \mu, L)$ satisfies Assumption 4. 
> Consider any $x, z \in \R^n$, denote $x^+ = T_L(x)$, then it has 
> $$
> \begin{aligned}
>     0 \le F(z) - F(x^+)
>     + \frac{L\Vert A\Vert^2 - \mu\sigma}{2}\Vert z - x\Vert^2 
>     - \frac{L}{2}\Vert z - x^+\Vert^2
>     + \frac{\mu\sigma}{2}\Vert \Pi(z - x)\Vert^2. 
> \end{aligned}
> $$

**Proof**

Denote $\sigma =\sigma_{\min |\cdot|}^{\neq 0}(A)$ for short, and $\Pi = \Pi_{\text{ker}(A)}$ for sort. 
The function in the proximal gradient operator is $L$ strongly convex, so it has 

$$
\begin{aligned}
    \frac{L}{2}\Vert z - x^+\Vert^2
    &\le 
    \left(
        g(z) + \langle \nabla f(x), z - x\rangle + \frac{L}{2}\Vert z - x\Vert^2
    \right)
    - \left(
        g(x^+) + \langle \nabla f(x), x^+ - x\rangle + \frac{L}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &= 
    \left(
        F(z) - D_f(z, x) + \frac{L}{2}\Vert z - x\Vert^2
    \right) - 
    \left(
        F(x^+) - D_f(x^+, x) + \frac{L}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &\underset{(1)}{\le} 
    F(z) + \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma}{2}\Vert (I - \Pi)(z - x)\Vert^2
    - \left(
        F(x^+) - D_f(x^+, x) + \frac{L}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &\underset{(2)}{\le} 
    F(z) + \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma}{2}\Vert (I - \Pi)(z - x)\Vert^2
    - F(x^+). 
\end{aligned}
$$

At (1), (2), we used the fact that $f = h(Ax + b)$, so it has 

$$
\begin{aligned}
    \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 - \frac{\sigma}{2}\Vert (I - \Pi) x - y\Vert^2 
    &\ge
    \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 - D_f(x, y) 
    \ge 0. 
\end{aligned}
$$

Continuing simplifying it has 

$$
\begin{aligned}
    0 
    &\le 
    F(z) + \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma}{2}\Vert (I - \Pi)(z - x)\Vert^2
    - F(x^+)
    - \frac{L}{2}\Vert z - x^+\Vert^2
    \\
    &= 
    F(z) + \frac{L\Vert A\Vert^2}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma}{2}\left(
        \Vert z - x\Vert^2 
        - \Vert \Pi(z - x)\Vert^2
    \right)
    - F(x^+)
    - \frac{L}{2}\Vert z - x^+\Vert^2
    \\
    &\le F(z) - F(x^+)
    + \frac{L\Vert A\Vert^2 - \mu\sigma}{2}\Vert z - x\Vert^2 
    - \frac{L}{2}\Vert z - x^+\Vert^2
    + \frac{\mu\sigma}{2}\Vert \Pi(z - x)\Vert^2. 
\end{aligned}
$$

$\blacksquare$

The results from strong convexity can be adopted for this type of seminorm as well. 

#### **Theorem | Jesen's inequality with seminorm**
> 

**Proof**

To simplify notations, we denote $\sigma = \sigma_{\min |\cdot|}^{\neq 0}(A)$ for short, and $\Pi = \Pi_{\text{ker}A}$ for short. 
From Assumption 4 it has $f = h(Ax + b)$ therefore it has the following

$$
\begin{aligned}
    0 &\le D_f(x, y)  - \frac{\sigma \mu}{2}\Vert (I - \Pi)(x - y)\Vert^2
    \\
\end{aligned}
$$



---
### **Similar triangle form**

We state the algorithm in similar triangle form. 


---
### **Proving the convergence rate**
