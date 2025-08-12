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
> Then the function $f(x) = h(Ax + b)$ is Smooth and semi strongly convex with $A_1 = \sqrt{\mu}A$, and $A_2 = \sqrt{L}A$, here $I$ is the identity function. 

**Proof**

The proof is direct. 
Let $x, y \in \R$ be arbitrary. 
For $A_1$ it has: 
$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &=
    h(Ax) - h(Ay) - \langle A^T \nabla h(y), x - y\rangle
    \\
    &= h(Ax) - h(Ay) - \langle \nabla h(y), Ax - Ay\rangle
    \\
    &\ge \frac{\mu}{2}\Vert Ax - Ay\Vert^2.
\end{aligned}
$$

Next, for the upper bound from the smoothness, it's also direct because 

$$
\begin{aligned}
    & f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    \\
    &= h(Ax) - h(Ay) - \left\langle A^T\nabla h(x), x - y\right\rangle
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
    \frac{\sigma_{\min|\cdot|}^{\neq 0}(A_1)^2}{2}
    \left\Vert 
        (I - \Pi_{\text{ker}})(x - y)
    \right\Vert^2. 
\end{aligned}
$$

$\blacksquare$

In the following parts, we will assume the form of the objective function and make use of the theorems we derived above. 

#### **Assumption 4 | a basic problem**
> The following assumption is about $(F, f, g, h, A, b, \mu, L)$. 
> 1. $(f, h, A, b, \mu, L)$ satisfies Assumption 3. 
> 2. $g = \delta_X$, it is an indicator of a closed, nonempty convex set $X$. 
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
In this section, we denote $\sigma(A)$ as the short for $\sigma_{\min |\cdot|}^{\neq 0}(A)$ for the minimum nonzero singular value of $A$ in absolute value. 

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
> Consider any $x, z \in \R^n$, then there exists a $B \ge 0$ such that for $x^+ = T_B(x)$, it has $D_f(x, x^+) \le \frac{B}{2}\Vert x - x^+\Vert^2$, and it satisfies: 
> $$
> \begin{aligned}
>    0 &\le F(z) - F(x^+) + \frac{B - \mu\sigma(A)^2}{2}\Vert z - x\Vert^2 
>   - \frac{B}{2}\Vert z - x^+\Vert^2
>   + \frac{\mu\sigma(A)^2}{2}\Vert \Pi_{\text{ker}A}(z - x)\Vert^2. 
> \end{aligned}
> $$

**Proof**

Denote $\sigma =\sigma(A)$ for short, and $\Pi = \Pi_{\text{ker}A}, \Pi_{\perp} = I - \Pi_{\text{ker}A}$ for short. 
The function in the proximal gradient operator is $L$ strongly convex, so it has quadratic growth over the minimizer $x^+$: 

$$
\begin{aligned}
    & \frac{B}{2}\Vert z - x^+\Vert^2
    \\
    &\le 
    \left(
        g(z) + \langle \nabla f(x), z - x\rangle + \frac{B}{2}\Vert z - x\Vert^2
    \right)
    - \left(
        g(x^+) + \langle \nabla f(x), x^+ - x\rangle + \frac{B}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &=
    \left(
        F(z) - D_f(z, x) + \frac{B}{2}\Vert z - x\Vert^2
    \right) - 
    \left(
        F(x^+) - D_f(x^+, x) + \frac{B}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &\underset{(1)}{\le}
    \left(
        F(z) + \frac{B}{2}\Vert z - x\Vert^2 
        - \frac{\mu\sigma^2}{2}\Vert \Pi_{\perp}(z - x)\Vert^2
    \right)
    - \left(
        F(x^+) - D_f(x^+, x) + \frac{B}{2}\Vert x - x^+\Vert^2
    \right)
    \\
    &\underset{(2)}{\le} 
    F(z) 
    + \frac{B}{2}\Vert z - x\Vert^2
    - \frac{\mu\sigma^2}{2}\Vert \Pi_{\perp}(z - x)\Vert^2
    - F(x^+). 
\end{aligned}
$$

At (1), we used the fact that $f = h(Ax + b)$, so it has $D_f(z, x) \ge \frac{\mu\sigma(A)^2}{2}\Vert \Pi_{\perp}(z - x)\Vert^2$. 
At (2), we used the fact that $B$ makes $- D_f(x, x^+) + \frac{B}{2}\Vert x - x^+\Vert^2 \ge 0$. 
Continuing it has 

$$
\begin{aligned}
    0 
    &\le 
    F(z) + \frac{B}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma^2}{2}\Vert \Pi_{\perp}(z - x)\Vert^2
    - F(x^+)
    - \frac{B}{2}\Vert z - x^+\Vert^2
    \\
    &= 
    F(z) 
    + \frac{B}{2}\Vert z - x\Vert^2 
    - \frac{\mu\sigma^2}{2}\left(
        \Vert z - x\Vert^2 
        - \Vert \Pi(z - x)\Vert^2
    \right)
    - F(x^+)
    - \frac{B}{2}\Vert z - x^+\Vert^2
    \\
    &\le F(z) - F(x^+)
    + \frac{B - \mu\sigma^2}{2}\Vert z - x\Vert^2 
    - \frac{B}{2}\Vert z - x^+\Vert^2
    + \frac{\mu\sigma^2}{2}\Vert \Pi(z - x)\Vert^2. 
\end{aligned}
$$

$\blacksquare$

**Remarks**

When $B \ge L \Vert A\Vert^2$, the condition $D_f(x, x^+) \le B/2\Vert x - x^+\Vert^2$ will be true for all $x \in \R^n$. 
The results from strong convexity can be adopted for this type of seminorm as well. 

#### **Theorem | Jesen's inequality with seminorm**
> Let $h: \R^n \rightarrow \R$ be a $L$ Lipschitz smooth and $\mu\ge 0$ strongly convex function.  
> Let $A \in \R^{n\times m}, b \in \R^n$. 
> Denote $\Pi_{\perp} = I - \Pi_{\text{ker}\; A}$ for short. 
> Suppose that $f(x) = h(Ax + b)$, then it satisfies for all $x, y \in \R^n, \lambda\in [0, 1]$ the inequality: 
> $$
> \begin{aligned}
>   0 &\le f(\lambda x + (1 - \lambda)y) - \lambda f(x) - (1 - \lambda)f(y)
>   - \frac{\mu\sigma(A)^2\lambda(1 - \lambda)}{2}\Vert \Pi_{\perp}(x - y)\Vert^2. 
> \end{aligned}
> $$

**Proof**

To simplify notations, we denote $\sigma = \sigma(A)$ for short, and use $\Pi = \Pi_{\text{ker}A}$, $\Pi_{\perp} = I - \Pi_{\text{ker}A}$ for short. 
From Assumption 4 it has $f = h(Ax + b)$ therefore it has the following

$$
\begin{aligned}
    0 &\le D_f(x, y)  - \frac{\sigma^2 \mu}{2}\Vert \Pi_{\perp}(x - y)\Vert^2
    \\
    &= f(x) - f(y) - \langle \nabla f(y), x - y\rangle 
    - \frac{\sigma^2 \mu}{2}\left\Vert \Pi_{\perp}(x - y)\right\Vert^2
    \\
    &=
    f(x) - f(y) - \langle \nabla f(y), x - y\rangle
    - \frac{\sigma^2 \mu}{2}\left\Vert \Pi_{\perp}x\right\Vert^2
    - \frac{\sigma^2 \mu}{2}\left\Vert \Pi_{\perp}y\right\Vert^2
    + \sigma^2\mu\langle \Pi_{\perp}x, \Pi_{\perp}y\rangle
    \\
    &= 
    f(x) - \frac{\sigma^2 \mu}{2}\Vert \Pi_{\perp} x\Vert^2
    - \left(
        f(y) - \frac{\mu\sigma^2}{2}\Vert \Pi_\perp y\Vert^2 
    \right) 
    - \sigma^2\mu\Vert \Pi_{\perp} y\Vert^2
    - \langle \nabla f(y), x - y\rangle
    + \sigma^2\mu\langle \Pi_\perp x, \Pi_\perp y\rangle
    \\
    &= 
    f(x) - \frac{\sigma^2 \mu}{2}\Vert \Pi_{\perp} x\Vert^2
    - \left(
        f(y) - \frac{\mu\sigma^2}{2}\Vert \Pi_\perp y\Vert^2 
    \right) 
    - \langle \nabla f(y), x - y\rangle
    + \sigma^2\mu\langle \Pi_\perp (x - y), \Pi_\perp y\rangle
    \\
    &= 
    f(x) - \frac{\sigma^2 \mu}{2}\Vert \Pi_{\perp} x\Vert^2
    - \left(
        f(y) - \frac{\mu\sigma^2}{2}\Vert \Pi_\perp y\Vert^2 
    \right) 
    - \langle \nabla f(y), x - y\rangle
    + \sigma^2\mu\left\langle x - y, \Pi_\perp^{\top}\Pi_\perp  y\right\rangle
    \\
    &= 
    f(x) - \frac{\sigma^2 \mu}{2}\Vert \Pi_{\perp} x\Vert^2
    - \left(
        f(y) - \frac{\mu\sigma^2}{2}\Vert \Pi_\perp y\Vert^2 
    \right) 
    + \left\langle x - y, \sigma^2\mu\Pi_\perp^{\top}\Pi_\perp  y - \nabla f(y)\right\rangle. 
\end{aligned}
$$

Next, if $\phi (x) = f(x) + \frac{\sigma^2\mu}{2}\Vert \Pi_\perp x\Vert^2$, then $\nabla \phi(x) = \nabla f(x) + \mu\sigma^2\Pi_{\perp}^\top \Pi_{\perp} x$. 
From here, it's not hard to see that the above inequality is: 

$$
\begin{aligned}
    0&\le 
    \phi(x) - \phi(y) 
    - \left\langle 
        \nabla \phi(y), x - y
    \right\rangle. 
\end{aligned}
$$

Hence, the function $f(x) - \frac{\sigma\mu}{2}\Vert \Pi_\perp x\Vert^2$ is a convex function. 
From here, we will be ready to show the Jensen's formula. 
For all $x, y \in \R^n$, consider the convexity of $\phi$, it has for all $\lambda \in [0, 1]$ the inequality: 

$$
\begin{aligned}
    0 &\le \lambda \phi(x) + (1 - \lambda)\phi(x) - \phi(\lambda x + (1 - \lambda)y)
    \\
    & \cdots
    \\
    &= 
    f(\lambda x + (1 - \lambda)y) - \lambda f(x) - (1 - \lambda)f(y)
    - \frac{\mu\sigma^2\lambda(1 - \lambda)}{2}\Vert \Pi_{\perp}(x - y)\Vert^2. 
\end{aligned}
$$

We skipped some algebra because the proof is very similar to strong convexity. 
See [Strong Convexity](../AMATH%20516%20Numerical%20Optimizations/Properties%20of%20Functions/Strong%20Convexity.md) for more information. $\blacksquare$


---
### **Everything about the algorithm**

We state the algorithm in similar triangle form. 
This time, we will nondimensionalize the algorithm to simplify the algebra for the convergence proof. 

#### **Definition | similar triangle form of accelerated proximal gradient**
> Suppose that $F = f + g$ with $f$ Lipschitz smooth and, $g$ closed convex proper. 
> Denote $T_B$ to be the proximal gradient operator on $F = f + g$. 
> Let $q_k \in [0, 1)$ for all $k \ge 0$. 
> Given the initial condition $v_{-1}, x_{-1} \in \R^n$. 
> An algorithm is a similar triangle form of the accelerated proximal gradient if the iterates generated $(y_k, x_k, v_k)_{k \ge 1}$ satisfies for all $k \ge 1$: 
> $$
> \begin{aligned}
>     y_k &= \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} 
>     + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1},
>     \\
>     x_k &= T_{L_k}(y_k),
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}). 
> \end{aligned}
> $$

**Remarks**

The parameter $q$ is produced via none dimensionalization, usually, $q = \mu/L \in [0, 1)$. 
In our case, it's going to be $q = (\mu\sigma(A)^2)/B_k$ where $B_k$ is the inverse of the step-size from the line search routine. 

#### **Definition | relaxed Nesterov's momentum sequence**
> For any $q_k \in (0, 1]$. 
> Let $(\alpha_k)_{k \ge 0}$ be a sequence such that, $\alpha_0 \in (0, 1]$, and $\alpha_k \in (q_k, 1)$ for all $k \ge 1$. 
> We define the relaxation sequence $(\rho_k)_{k \ge 0}$ to be: 
> $$
> \begin{aligned}
>     \rho_{k - 1} &= \frac{\alpha_k(\alpha_k - q_k)}{(1 - \alpha_{k})\alpha_{k - 1}^2}. 
> \end{aligned}
> $$
> For all $k \ge 1$. 

#### **Definition | the relaxed accelerated proximal gradient method (RAPG)**
> An algorithm is a generic Nesterov's accelerated gradient method if, the sequence $(\alpha_k)_{k \ge 0}$ is a relaxed momentum sequence, and the iterates $(y_k, x_k, v_k)_{k \ge 1}$ satisfies the similar triangle form. 

---
### **Proving the convergence rate**

The convergence rate proof involves a lot of brute algebra. 
We will show that the generic Nesterov's accelerated proximal gradient method with a function that satisfies Assumption 4 will produce linear convergence rate, without restarting. 

#### **Lemma | Convergence Preparations Part I**
> Let the sequence $(y_k, x_k, v_k)_{k \ge 1}$ be a sequence generated by RAPG. 
> Let $\bar x \in \R^n$ be arbitrary, define $z_k = \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - y_k$. 
> Then the sequence of iterates satisfies for all $k \ge 1$: 
> $$
> \begin{aligned}
>     z_k - y_k &= (1 - q_k)^{-1}\left(
>         (\alpha_k - q_k)(\bar x - v_{k - 1}) + q_k(1 - \alpha_k)(\bar x - x_{k - 1})
>     \right), 
>     \\
>     z_k - x_k &= \alpha_k (\bar x - v_k), 
>     \\
>     y_k &= x_{k -1} + (1 - q_k)^{-1}(\alpha_{k - 1} - 1)(\alpha_k - q_k)(x_{k - 1} - x_{k - 2}). 
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    0 &= \left(
        \frac{\alpha_k - q_k}{1 - q_k} 
    \right)v_{k - 1} 
    + \left(
        \frac{1 - \alpha_k}{1 - q_k}
    \right)x_{k - 1} - y_k
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k} 
    \right)v_{k - 1} 
    + (1 - \alpha_k)x_{k - 1}
    + \left(
        \frac{1 - \alpha_k}{1 - q_k} - (1 - \alpha_k)
    \right)x_{k - 1} - y_k
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k} 
    \right)v_{k - 1} 
    + (1 - \alpha_k)x_{k - 1}
    + (1 - \alpha_k)\left(
        \frac{1 - (1 - \alpha_k)}{1 - q_k}
    \right)x_{k - 1} - y_k
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k} 
    \right)v_{k - 1} 
    + (1 - \alpha_k)x_{k - 1}
    + \frac{q_k(1 -\alpha_k)}{1 - q_k}x_{k - 1} - y_k. 
\end{aligned}
$$

Recall that $z_k = \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - y_k$. 
Therefore, we have 

$$
\begin{aligned}
    z_k - y_k &= 
    \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - y_k
    \\
    &= \alpha_k \bar x 
    - \left(
        \frac{\alpha_k - q_k}{1 - q_k}
    \right)v_{k - 1}
    - \frac{q_k(1 -\alpha_k)}{1 - q_k}x_{k - 1}
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k}
    \right)(\bar x - v_{k - 1})
    + \left(
        \alpha_k - \frac{\alpha_k - q_k}{1 - q_k} 
    \right)\bar x
    - \frac{q_k(1 -\alpha_k)}{1 - q_k}x_{k - 1}
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k}
    \right)(\bar x - v_{k - 1})
    + \left(
        \frac{\alpha_k - \alpha_kq_k - (\alpha_k - q_k)}{1 - q_k}
    \right)\bar x
    - \frac{q_k(1 -\alpha_k)}{1 - q_k}x_{k - 1}
    \\
    &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k}
    \right)(\bar x - v_{k - 1})
    + \left(
        \frac{q_k(1 - \alpha_k)}{1 - q_k}
    \right)\left(
        \bar x - x_{k - 1}
    \right). 
\end{aligned}
$$

Next: 

$$
\begin{aligned}
    z_k - x_k &= 
    \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - x_k 
    \\
    &= \alpha_k \bar x + x_{k - 1} - \alpha_k x_{k -1} - x_k
    \\
    &= \alpha_k (\bar x  + \alpha_k^{-1}x_{k - 1} - x_{k - 1} - \alpha_k^{-1} x_k) 
    \\
    &= \alpha_k (\bar x  + \alpha_k^{-1}(x_{k - 1} - x_k)- x_{k - 1}) 
    \\
    &= \alpha_k (\bar x - v_k). 
\end{aligned}
$$

Finally, $y_k$ can be expressed using $x_k$ only. 
Starting with the first recurrence relation it has: 

$$
\begin{aligned}
    (1 - q_k)^{-1}y_k &= 
    (\alpha_k - q_k) v_{k - 1} 
    + (1 - \alpha_k)x_{k - 1}
    \\
    &= 
    (\alpha_k - q_k)\left(
        x_{k - 2} + \alpha_{k - 1}^{-1}(x_{k - 1} - x_{k - 2})
    \right) 
    + (1 - \alpha_k)x_{k - 1}
    \\
    &= 
    (\alpha_k - q_k)x_{k - 2} 
    + \alpha_{k - 1}^{-1}(x_{k - 1} - x_{k - 2}) + (1 - \alpha_k)x_{k - 1}
    \\
    &= (\alpha_k - q_k)(1 - \alpha_{k - 1}^{-1})x_{k - 2}
    + \left(
        \frac{\alpha_k - q_k}{\alpha_{k - 1}} + 1 - \alpha_k
    \right)x_{k - 1}. 
\end{aligned}
$$

Multiplying by $(1 - q_k)$ on both sides, it gives: 

$$
\begin{aligned}
    y_k &= 
    \frac{(\alpha_k - q_k)(1 - \alpha_{k - 1}^{-1})}{1 - q_k}x_{k - 2} 
    + \left(
        \frac{\alpha_k - q_k}{\alpha_{k - 1}(1 - q_k)} + \frac{1 - \alpha_k}{1 - q_k}
    \right)x_{k - 1}
    \\
    &= 
    \frac{(\alpha_k - q_k)(1 - \alpha_{k - 1}^{-1})}{1 - q_k}x_{k - 2} 
    + \left(
        \frac{
            (\alpha_{k - 1}^{-1} -1)(\alpha_k - q_k)
            + \alpha_k - q_k + 1 - \alpha_k
        }{1 - q_k}
    \right)x_{k - 1}
    \\
    &= \frac{(\alpha_k - q_k)(1 - \alpha_{k - 1}^{-1})}{1 - q_k}x_{k - 2} 
    + \left(
        \frac{
            (\alpha_{k - 1}^{-1} -1)(\alpha_k - q_k)
        }{1 - q_k} + 1
    \right)x_{k - 1}
    \\
    &= x_{k -1} + (1 - q_k)^{-1}(\alpha_{k - 1} - 1)(\alpha_k - q_k)(x_{k - 1} - x_{k - 2}). 
\end{aligned}
$$

$\blacksquare$


#### **Lemma | Convergence Preparation Part II**
> Let the sequence $(y_k, x_k, v_k)_{k \ge 1}$ be a sequence generated by RAPG. 
> Suppose in addition that the sequence $(\alpha_k)_{k \ge 0}$ satisfies the relaxed Nesterov's momentum sequence. 
> Define the sequence $z_k = \alpha_k \bar x - (1 - \alpha_k)x_{k - 1}$. 
> Then, the following equality is true for all $k \ge 1$: 
> $$
> \begin{aligned}
>     & \frac{1 - q_k}{2}\Vert z_k - y_k\Vert^2
>     - \frac{q_k\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
>     \\
>     &= 
>     \frac{\alpha_{k - 1}\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
>     + \frac{q_k(1 - \alpha_k)(q_k - \alpha_k)}{1 - q_k}\Vert v_{k - 1} - x_{k - 1}\Vert^2. 
> \end{aligned}
> $$

**Proof**

Our first results are produced by: 

$$
\begin{aligned}
    \frac{(\alpha_k - q_k)^2}{2(1 - q_k)}
    - \frac{\alpha_{k - 1}\rho_{k - 1}(1 - \alpha_k)}{2}
    &\underset{(1)}{=} 
    \frac{(\alpha_k - q_k)^2}{2(1 - q_k)}
    - \frac{\alpha_k(\alpha_k - q_k)}{2}
    \\
    &= \frac{1}{2(1 - q_k)}\left(
        (\alpha_k - q_k)^2 - (1 - q_k)\alpha_k(\alpha_k - q_k)
    \right)
    \\
    &= \frac{\alpha_k - q_k}{2(1 - q_k)}
    \left(
        \alpha_k - q_k - (1 - q_k)\alpha_k
    \right)
    \\
    &= 
    \frac{\alpha_k - q_k}{2(1 - q_k)}
    \left(
        - q_k + q_k \alpha_k
    \right)
    \\
    &= \frac{(\alpha_k -q_k)q_k (\alpha_k - 1)}{1 - q_k}. 
\end{aligned}\tag{a}
$$

At (1), we used the relation $\alpha_{k - 1} \rho_{k - 1}(1 - \alpha_k) = \alpha_k(\alpha_k - q_k)$. 
Next, we have: 

$$
\begin{aligned}
    \frac{q_k^2(1 - \alpha_k)^2}{1 - q_k}
    - q_k\alpha_k(1 - \alpha_k)
    &= 
    \frac{q_k(1 - \alpha_k)}{1 - q_k}
    \left(
        q_k(1 - \alpha_k) - \alpha_k(1 - q_k)
    \right)
    \\
    &= 
    \frac{q_k(1 - \alpha_k)(q_k - \alpha_k)}{1 - q_k}. 
\end{aligned}\tag{b}
$$

Finally, Using these relations, we have the following equality: 

$$
\begin{aligned}
    & \frac{1 - q_k}{2}\Vert z_k - y_k\Vert^2
    - \frac{q_k\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    \\
    &\underset{(1)}{=}
    \frac{1 - q_k}{2}
    \left\Vert
        \left(
        \frac{\alpha_k - q_k}{1 - q_k}
        \right)(\bar x - v_{k - 1})
        + \left(
            \frac{q_k(1 - \alpha_k)}{1 - q_k}
        \right)\left(
            \bar x - x_{k - 1}
        \right)
    \right\Vert^2
    - \frac{q_k\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    \\
    &= 
    \frac{(\alpha_k - q_k)^2}{2(1 - q_k)}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{q_k^2(1 - \alpha_k)^2}{2(1 - q_k)}\Vert \bar x - x_{k - 1}\Vert^2
    + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
        \\&\quad 
        - \frac{1}{2}q_k \alpha_k(1 - \alpha_k)\Vert \bar x - x_{k - 1}\Vert^2
    \\
    &= \frac{(\alpha_k - q_k)^2}{2(1 - q_k)}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{1}{2}\left(
        \frac{q_k^2(1 - \alpha_k)^2}{1 - q_k} - q_k \alpha_k(1 - \alpha_k)
    \right)\Vert \bar x - x_{k - 1}\Vert^2
        \\ &\quad 
        + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
    \\
    &= \frac{(\alpha_k - q_k)^2}{2(1 - q_k)}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{1}{2}\left(
        \frac{q_k^2(1 - \alpha_k)^2}{1 - q_k} - q_k \alpha_k(1 - \alpha_k)
    \right)\Vert \bar x - x_{k - 1}\Vert^2
        \\ &\quad 
        + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
    \\
    &= 
    \frac{1}{2}\left(
        \frac{(\alpha_k - q_k)^2}{1 - q_k}
        - \alpha_{k - 1}^2 \rho_{k - 1}(1 - \alpha_k)
    \right)\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{1}{2}\left(
        \frac{q_k^2(1 - \alpha_k)^2}{1 - q_k} - q_k \alpha_k(1 - \alpha_k)
    \right)\Vert \bar x - x_{k - 1}\Vert^2
        \\ &\quad 
        + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
        - \frac{\alpha_{k - 1}^2 \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \\
    &\underset{\text{(a)}}{=}
    \frac{1}{2}\frac{(\alpha_k - q_k)q_k(\alpha_k - 1)}{1 - a_k}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{1}{2}\left(
        \frac{q_k^2(1 - \alpha_k)^2}{1 - q_k} - q_k \alpha_k(1 - \alpha_k)
    \right)\Vert \bar x - x_{k - 1}\Vert^2
        \\ &\quad 
        + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
        - \frac{\alpha_{k - 1}^2 \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \\
    &\underset{\text{(b)}}{=}
    \frac{1}{2}\frac{(\alpha_k - q_k)q_k(\alpha_k - 1)}{1 - a_k}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{1}{2}\frac{q_k(1 - \alpha_k)(q_k - \alpha_k)}{1 - q_k}\Vert \bar x - x_{k - 1}\Vert^2
        \\ &\quad 
        + \frac{(\alpha_k - q_k)q_k(1 - \alpha_k)}{1 - q_k}\langle \bar x - v_{k - 1}, \bar x - x_{k - 1}\rangle
        - \frac{\alpha_{k - 1}^2 \rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \\
    &= \frac{\alpha_{k - 1}^2\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    + \frac{q_k(1 - \alpha_k)(q_k - \alpha_k)}{1 - q_k}\Vert v_{k - 1} - x_{k - 1}\Vert^2. 
\end{aligned}
$$

At (1), we used "Convergence Preparations Part I". 
$\blacksquare$


#### **Proposition | the generic one step convergence result**
> Suppose that $(F, f, g, h, A, b, \mu, L)$ satisfies Assumption 4. 
> Let the sequence $(y_k, x_k, v_k)_{k \ge 1}$ be generated by RAPG, by applying the $F$ we just assumed, with $q_k = (\mu\sigma(A)^2)/L_k$. 
> Then, for all $k \ge 1$, the iterates satisfies: 
> $$
> \begin{aligned}
>     & F(x_k) - F(\bar x) 
>     + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
>     \\
>     &\le 
>     (1 - \alpha_k)\max\left(
>         1, \frac{\rho_{k - 1}L_k}{L_{k - 1}}
>     \right)\left(
>         F(x_{k - 1}) - F(\bar x) 
>         + \frac{L_{k - 1}\alpha_{k - 1}^2}{2}\Vert \bar x - v_{k - 1}\Vert^2
>     \right) + \mathcal R_k. 
> \end{aligned}
> $$
> Where $\mathcal R_k = \frac{q_kL_k}{2}\Vert \Pi_{\text{ker}A}(z_k - y_k)\Vert^2 + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi_{\text{ker}A}(\bar x - x_{k - 1})\Vert^2$. 

**Proof**

Let $z_k = \alpha_k \bar x + (1 - \alpha_k)x_{k - 1}$. 
$\bar x$ remains undetermined. 
Denote $\Pi = \Pi_{\text{ker}\; A}$, and $\Pi_{\perp} = I - \Pi_{\text{ker}\; A}$. 
Recall that we had the parameters $q_k$ for all $k \ge 1$ set by $q_kL_k = \sigma(A)^2\mu$. 
Starting with the proximal gradient inequality, we let $z = z_k, x = y_k, x^+ = T_{L_k}(y_k)$. 

$$
\begin{aligned}
    0 &\le 
    F(z_k) - F(x_k) 
    + \frac{L_k - \mu\sigma(A)^2}{2}\Vert z_k - y_k\Vert^2 
    - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
    + \frac{\mu\sigma(A)^2}{2}\Vert \Pi(z_k - y_k)\Vert^2
    \\
    &\underset{(1)}{\le} 
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    - \frac{\mu\sigma(A)^2\alpha_k(1 - \alpha_k)}{2}\Vert \Pi_{\perp}(\bar x - x_{k - 1})\Vert^2
        \\&\quad
        + \frac{L_k - \mu\sigma(A)^2}{2}\Vert z_k - y_k\Vert^2 
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{\mu\sigma(A)^2}{2}\Vert \Pi(z_k - y_k)\Vert^2
    \\
    &= 
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    - \frac{\mu\sigma(A)^2\alpha_k(1 - \alpha_k)}{2}
        \left(
            \Vert \bar x - x_{k - 1}\Vert^2 - \Vert \Pi(\bar x - x_{k - 1})\Vert^2
        \right)
        \\&\quad
        + \frac{L_k - \mu\sigma(A)^2}{2}\Vert z_k - y_k\Vert^2 
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{\mu\sigma(A)^2}{2}\Vert \Pi(z_k - y_k)\Vert^2
    \\
    &\underset{(2)}{=}
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    - \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}
        \left(
            \Vert \bar x - x_{k - 1}\Vert^2 - \Vert \Pi(\bar x - x_{k - 1})\Vert^2
        \right)
        \\&\quad
        + \frac{L_k - q_kL_k}{2}\Vert z_k - y_k\Vert^2 
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
    \\
    &= 
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    + L_k\left(
        \frac{1 - q_k}{2}\Vert z_k - y_k\Vert^2 
        - \frac{q_k\alpha_k(1 - \alpha_k)}{2}\Vert \bar x - x_{k - 1}\Vert^2
    \right)
        \\&\quad
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
        + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi(\bar x - x_{k - 1})\Vert^2
    \\
    &\underset{(3)}{=}
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
        \\&\quad 
        + L_k\left(
            \frac{\alpha_{k - 1}^2\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
            + \frac{q_k(1 - \alpha_k)(q_k - \alpha_k)}{1 - q_k}\Vert v_{k - 1} - x_{k - 1}\Vert^2
        \right)
        \\&\quad
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
        + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi(\bar x - x_{k - 1})\Vert^2
    \\
    &\underset{(4)}{\le} 
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    + \frac{L_k\alpha_{k - 1}\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
        \\&\quad
        - \frac{L_k}{2}\Vert z_k - x_k\Vert^2 
        + \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
        + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi(\bar x - x_{k - 1})\Vert^2
    \\
    &\underset{(5)}{=}
    \alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k)
    + \frac{L_k\alpha_{k - 1}\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
        \\&\quad
        - \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k \Vert^2 
        + \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
        + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi(\bar x - x_{k - 1})\Vert^2. 
\end{aligned}
$$
At (1), we used the Jensen's inequality. 
At (2), we used equality $q_k L_k = \sigma(A)^2\mu$. 
At (3), we used "Convergence Preparation Part II". 
At (4), We used the fact that $\alpha_k \in (q_k, 1)$, hence it makes the coefficient of $\Vert v_{k - 1} - x_{k - 1}\Vert^2$ less than zero. 
At (5), we used the equality $z_k - x_k = \alpha_k(\bar x - v_k)$ proved in "Convergence Preparations Part I". 
Denote: 
$$
\begin{aligned}
    \mathcal R_k = \frac{q_kL_k}{2}\Vert \Pi(z_k - y_k)\Vert^2
        + \frac{q_kL_k\alpha_k(1 - \alpha_k)}{2}\Vert \Pi(\bar x - x_{k - 1})\Vert^2
\end{aligned}
$$
After some re-arragement we should get the following inequality: 

$$
\begin{aligned}
    & 
    F(x_k) - F(\bar x) 
    + \frac{L_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \\
    &\le 
    (\alpha_k - 1)F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) 
    + \frac{L_k\alpha_{k - 1}^2\rho_{k - 1}(1 - \alpha_k)}{2}\Vert \bar x - v_{k - 1}\Vert^2
    + \mathcal R_k
    \\
    &= (1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{L_k\alpha_{k - 1}^2\rho_{k - 1}}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) + \mathcal R_k
    \\ 
    &= (1 - \alpha_k)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \left(
            \frac{\rho_{k - 1}L_k}{L_{k - 1}}
        \right)\frac{L_{k - 1}\alpha_{k - 1}^2}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) + \mathcal R_k
    \\
    &\le 
    (1 - \alpha_k)\max\left(
        1, \frac{\rho_{k - 1}L_k}{L_{k - 1}}
    \right)\left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{L_{k - 1}\alpha_{k - 1}^2}{2}\Vert \bar x - v_{k - 1}\Vert^2
    \right) + \mathcal R_k. 
\end{aligned}
$$

$\blacksquare$

Some additional assumptions are needed to eliminate the remainder $\mathcal R_k$ in from the previous claim. 

#### **Proposition | Assumptions needed to get convergence claim**
> ...

**Proof**

All iterates are required to have the same projections onto the set of minimizers.