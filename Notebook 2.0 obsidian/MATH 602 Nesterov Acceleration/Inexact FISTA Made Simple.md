- [FISTA Made Simple Part I](FISTA%20Made%20Simple%20Part%20I.md)

---
### **Intro**

In this section, we show a simple formulation of inexact FISTA algorithm with a specific error schedule. 
We will motivate the formulation of the algorithm with a specific application. 
We will now state our assumptions. 

**Notations.** 
The $(\sim)$ denotes an expression in $()$ that stayed unchanged from the last line of derivations. 
For example $(a^2 + b^2) = (\sim) + 2ab - 2ab = (a + b)^2 - 2ab$. 
This notation is used for the purpose of not typing so much repeating stuff that make things too long to fit onto the screen and terrible to read. 


#### **Assumption 1 | The overall settings**
> We assume the following about $(F, f, g, L)$: 
> 1. $f: \R^n \rightarrow \R$ is a convex, $L$ Lipschitz smooth function. 
> 2. $g: \R^n \rightarrow \R$ is convex, proper, and closed. 
> 3. The over all objective has $F = f + g$. 

Denote the proximal gradient operator of $F = f+ g$ as $T_B(x) = \pprox{B^{-1}g}(x - B^{-1}\nabla f(x))$. 
Note that by definition it has also: 

$$
\begin{aligned}
    T_B(x) &= 
    \pprox{B^{-1}g}\left(
        x - B^{-1}\nabla f(x)
    \right)
    \\
    &= \argmin{z}\left\lbrace
        g(z)
        + \langle \nabla f(x), z\rangle
        + \frac{B}{2}\Vert z - x \Vert^2
    \right\rbrace. 
\end{aligned}
$$


#### **Definition 1 | A Measure of Error**
> Let $(F, f, g, L)$ satisfies assumption 1. 
> For all $x, z \in \R^n$, define $S$: 
> $$
> \begin{aligned}
>     S(z | x) &= \partial 
>     \left[
>         z \mapsto g(z)
>         + \langle \nabla f(x), z\rangle
>         + \frac{B}{2}\Vert z - x \Vert^2
>     \right](z). 
> \end{aligned}
> $$

Observe
- $S(z | x) = \partial g(z) + \nabla f(x)+ B(z - x)$. 
- $0 \in S(T(x), x)$. 
- $(S(\cdot, x))^{-1}(\mathbf 0)$ is a singleton by strong convexity. 

Let's assume inexact evaluation of $\tilde x \approx T_B(x)$, then the error measure is the set $S(\tilde x | x)$. 
Assuming that we have accurate information on $\nabla f(x)$, then $\forall w \in S(\tilde x | x)\;\exists \tilde v \in \partial g(\tilde x)$. 

$$
\begin{aligned}
    w &=
    \tilde v + \nabla f(x) + B(\tilde x - x). 
\end{aligned}
$$

We want to control $w$ in the implementations of the algorithm. 
This value is accessible. 

#### **Theorem 1 | Inexact Proximal Gradient inequality**
> Let $(F, f, g, L)$ satisfies Assumption 0. 
> Let $\epsilon \ge 0$. 
> Suppose inexact evaluation $\tilde x \approx T_{B + \epsilon}(x)$ such that $\exists w \in S(\tilde x | x):\Vert w\Vert \le \epsilon \Vert x - \tilde x\Vert$ and $\exists B: D_f(\tilde x, x)\le \frac{B}{2}\Vert \tilde x - x\Vert^2$. 
> Then for all $z, x \in \R^n$ it has: 
> $$
> \begin{aligned}
>     0 &\le F(z) - F(\tilde x) + \frac{B}{2}\Vert z - x\Vert^2
>     - \frac{B - \epsilon}{2}\Vert z - \tilde x\Vert^2 
>     + \frac{\epsilon}{2}\Vert \tilde x - x\Vert^2. 
> \end{aligned}
> $$


**Proof**

Let $h = z \mapsto g(z) + \langle \nabla f(x), z \rangle + \frac{B + \epsilon}{2}\Vert x - z\Vert^2$. 
$h$ is $B + \epsilon$ strongly convex by convexity of $g$. 
Since $w \in \partial h(\tilde x)$, it has subgradient inequality through strong convexity it has 

$$
(\forall z \in \R^n)\;  
\frac{B + \epsilon}{2}\Vert z - \tilde x\Vert^2 \le h(z) - h(\tilde x) - \langle w,  z - \tilde x\rangle. 
$$

This means

$$
\begin{aligned}
    \frac{B + \epsilon}{2}\Vert \tilde x - z \Vert^2 
    &\le 
    g(z) + \langle \nabla f(x), z\rangle + \frac{B + \epsilon}{2}\Vert z - x\Vert^2
    - \left(
        g(\tilde x) + 
        \langle \nabla f(x), \tilde x\rangle
        + 
        \frac{B + \epsilon}{2}\Vert \tilde x - x\Vert^2
    \right)
    - \langle w, z - \tilde x\rangle
    \\
    &= 
    \left(
        g(z) - g(\tilde x)
        + \frac{B + \epsilon}{2}\Vert z - x\Vert^2 - \frac{B + \epsilon}{2}\Vert \tilde x - x\Vert^2
        - \langle w, z - \tilde x\rangle
    \right)
    + \langle \nabla f(x), z - x + x -\tilde x\rangle
    \\
    &= 
    (\sim)
    + \langle \nabla f(x), z - x\rangle
    - \langle \nabla f(x), \tilde x - x\rangle
    \\
    &= 
    (\sim)
    - D_f(z, x) + f(z) - f(x)
    + D_f(\tilde x, x) - f(\tilde x) + f(x)
    \\
    &= (\sim)
    - D_f(z, x) + f(z)
    + D_f(\tilde x, x) - f(\tilde x)
    \\
    &= 
    \left(
        F(z) - F(\tilde x)
        - \langle w, z - \tilde x\rangle
    \right)
    + 
    \left(
        \frac{B + \epsilon}{2}\Vert z - x\Vert^2 - D_f(z, x)
    \right) 
    + \left(
        D_f(\tilde x, x)
        - \frac{B + \epsilon}{2}\Vert \tilde x - x\Vert^2
    \right)
    \\
    &\underset{(1)}{\le} 
    (\sim)
    + \left(
        \frac{B + \epsilon}{2}\Vert z - x\Vert^2
        - \frac{\epsilon}{2}\Vert \tilde x - x\Vert^2
    \right)
    \\
    &\le
    F(z) - F(\tilde x) + \Vert w \Vert\Vert z - \tilde x\Vert
    + \left(
       \sim
    \right)
    \\
    &\underset{(2)}{\le}
    F(z) - F(\tilde x) 
    + \epsilon\Vert x - \tilde x\Vert\Vert z - \tilde x\Vert
    + (\sim)
\end{aligned}
$$

At (1), we used convexity which has $- D_f(z, x) \le 0$, and the linear search condition $D_f(\tilde x, x) \le \frac{B}{2}\Vert \tilde x - x\Vert^2$.
At (2) we used $\Vert w\Vert \le \epsilon \Vert x - \tilde x\Vert$, this is our result:

$$
\begin{aligned}
    0 &\le
    \left(
        F(z) - F(\tilde x) + \frac{B + \epsilon}{2}\Vert z - x\Vert^2
        - \frac{B + \epsilon}{2}\Vert z - \tilde x\Vert^2 
    \right)
    + \epsilon \Vert \tilde x - x\Vert \Vert z - \tilde x\Vert
    - \frac{\epsilon}{2}\Vert \tilde x - x\Vert^2
    \\
    &= (\sim)
    + \epsilon \Vert \tilde x - x\Vert \Vert z - \tilde x\Vert
    - \frac{\epsilon}{2}\Vert \tilde x - x\Vert^2 - \frac{\epsilon}{2}\Vert z - \tilde x\Vert^2
    + \frac{\epsilon}{2}\Vert z - \tilde x\Vert^2
    \\
    &= 
    \left(
        \sim
    \right)
    - \epsilon(\Vert x - \tilde x\Vert - \Vert z -\tilde x\Vert)^2 
    + \frac{\epsilon}{2}\Vert z - \tilde x\Vert^2 
    \\
    &\le 
    (\sim)
    + \frac{\epsilon}{2}\Vert z - \tilde x\Vert^2
    \\
    &= 
    F(z) - F(\tilde x) + \frac{B + \epsilon}{2}\Vert z - x\Vert^2
    - \frac{B}{2}\Vert z - \tilde x\Vert^2. 
\end{aligned}
$$

$\blacksquare$


#### **Notes on algorithmic implementations**

An algorithm need to generate $\tilde x$ given $\epsilon, B$ that fits **Theorem 1**. 
Suppose that an iterative procedure were used to estimate $\tilde x$, producing $\tilde x_1, \tilde x_2, \ldots$. 
The quantity $\Vert x - \tilde x\Vert^2$ can be measured directly in algorithm implementations, for some iterative procedures.
The quantity $w$ is accessible by $\partial g(x_i), \nabla f(x_i)$. 

Given any initial guess $\tilde x_0$. 
Consider the following procedures:

For any $i = 1, 2, \ldots$
1. choose any $\tilde v_i \in \partial g(\tilde x_i)$;
2. compute $w_i = \tilde v_i + \nabla f(x) + B_i(\tilde x - x)$;
3. Assess $\Vert w_i\Vert \le \epsilon \Vert x - \tilde x_i\Vert$, go back to the loop. 
4. Assess $D_f(\tilde x_i, x) \le \frac{B}{2}\Vert \tilde x_i - x\Vert^2$, if not, increase $B$ and, go back to the start of the loop. 
5. Produce a better approximation $\tilde x_{i + 1} = T_{B + \epsilon}(x)$

Such a procedure always exists as long as the algorithms can make $\dist(\mathbf 0 | \partial g(\tilde x_i)) \rightarrow 0$. 
We now have some more comment. 
We think the algorithm need to have the following advantages. 
- Accessing $\partial g(\tilde x_i)$ is fast but not computing $\prox_g$. 
- Computing $f, \nabla f$ is exect, and fast. 


---
### **The accelerated proximal gradient algorithm**

The following definition defines the accelerated proximal gradient algorithm. 

#### **Definition 2 | Accelerated proximal gradient**
> Let $(\alpha_k)_{k \ge 0}$ be a sequence in $(0, 1]$. 
> Let $(B_k)_{k \ge 0}$ be a non-negative sequence. 
> Let $F = f + g$ with $f$ being a $\mathcal C^1$ function $g$ being convex. 
> Initialize with any $(x_{-1}, v_{-1})$. 
> The algorithm is a type of accelerated proximal gradient if it generates $(y_k, x_k, v_k)_{k \ge 0}$ such that
> for $k\ge 0$: 
> $$
> \begin{aligned}
>     y_{k} &= \alpha_{k} v_{k - 1} + (1 - \alpha_{k}) x_{k - 1},
>     \\
>     x_k &= T_{B_k}y_k : D_f(x_k, y_k) \le \frac{B_k}{2}\Vert x_k - y_k\Vert^2, 
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}).
> \end{aligned}
> $$


---
### **Error schedules and convergence rate**

For the convergence analysis, we need the assumption below

#### **Assumption 2 | Required for convergence**
> We will make assumption on $(F, f, g, L, X^+)$. 
> - Assume that $(F, f, g, L)$ satisfies **Assumption 1**. 
> - Define then assume $X := \argmin{x}\; F \neq \emptyset$. 


#### **Lemma | one step inequality**
> Let $(F, f, g, L, X^+)$ satisfies **Assumption 2**. 
> Suppose that an algorithm satisfies optimizes the given $F =f + g$ and, it satisfies **Definition 2** and, it generates iterates $(y_k, x_k, v_k)_{k \ge 0}$. 
> Then for all $k \ge 1$: 
> $$
> \begin{aligned}
>     F(\bar x) - F(x_k)  - \frac{B_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
>     &\le 
>     \max\left(
>         1 - \alpha_k, 
>         \frac{\alpha_k(B_k + \epsilon_k)}{\alpha_{k -1}^2B_{k - 1}}
>     \right)
>     \left(
>         F(x_{k - 1}) - F(\bar x) 
>         + \frac{\alpha_{k - 1}^2B_{k - 1}}{2}\Vert \bar x - v_{k - 1} \Vert^2
>     \right). 
> \end{aligned}
> $$


**Proof**

Let $\bar x \in X^+$, making it a minimizer of $F$. 
Define $z_k := \alpha_k \bar x + (1 - \alpha_k)x_{k - 1}$. 
It can be verified that: 
$$
\begin{aligned}
    z_k - x_k &= \alpha_k(\bar x - v_k),
    \\
    z_k - y_k &= \alpha_k(\bar x - v_{k - 1}). 
\end{aligned}\tag{(a)}
$$

To verify, consider the definition of the algorithm: 

$$
\begin{aligned}
    z_k - x_k &= 
    \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - x_k
    \\
    &= \alpha_kx^+ + (x_{k - 1} - x_k) - \alpha_kx_{k - 1}
    \\
    &= \alpha_k \bar x - \alpha_k v_k, 
    \\
    z_k - y_k &= 
    \alpha_k \bar x + (1 - \alpha_k)x_{k - 1} - y_k
    \\
    &= \alpha_k \bar x - \alpha_k v_{k - 1}. 
\end{aligned}
$$

Apply **Theorem 1** with $z = z_k, \tilde x = x_k, x = y_k, \epsilon = \epsilon_k, B = B_k$. 

$$
\begin{aligned}
    0 &\le 
    (F(z_k) - F(x_k) )
    +
    \left(
        \frac{B_k + \epsilon_k}{2}\Vert z_k - y_k\Vert^2
        - \frac{B_k}{2}\Vert z_k - x_k\Vert^2
    \right)
    \\
    &\underset{(1)}{\le}
    (\alpha_k F(\bar x) + (1 - \alpha_k)F(x_{k - 1}) - F(x_k))
    + 
    \left(\sim\right)
    \\
    &\underset{\text{(a)}}{=} (\sim)
    + \left(
        \frac{(B_k + \epsilon_k)\alpha_k^2}{2}\Vert \bar x - v_{k - 1} \Vert^2
        - \frac{B_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right)
    \\
    &= 
    \left(
        F(\bar x) - F(x_k)
        + (1 - \alpha_k)(F(x_{k - 1}) - F(\bar x))
    \right)
    + (\sim)
    \\
    &= 
    \left(
        F(\bar x) - F(x_k) 
        - \frac{B_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    \right)
    + (1 - \alpha_k)(F(x_{k - 1}) - F(\bar x))
    + \frac{(B_k + \epsilon_k)\alpha_k^2}{2}\Vert \bar x - v_{k - 1} \Vert^2
    \\
    &= (\sim)
    + (1 - \alpha_k)(\sim)
    + \frac{(B_k + \epsilon_k)\alpha_k^2}{\alpha_{k - 1}^2B_{k - 1}}
    \frac{\alpha_{k - 1}^2B_{k - 1}}{2}\Vert \sim \Vert^2
    \\
    &= (\sim)
    + \max\left(
        1 - \alpha_k, 
        \frac{(B_k + \epsilon_k)\alpha_k^2}{\alpha_{k - 1}^2B_{k - 1}}
    \right)
    \left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{\alpha_{k - 1}^2B_{k - 1}}{2}\Vert \bar x - v_{k - 1} \Vert^2
    \right). 
\end{aligned}
$$

At (1), we used convexity of $F$. 
Hence, for all $k \ge 1$, we have: 

$$
\begin{aligned}
    F(\bar x) - F(x_k)  - \frac{B_k\alpha_k^2}{2}\Vert \bar x - v_k\Vert^2
    &\le 
    \max\left(
        1 - \alpha_k, 
        \frac{\alpha_k^2(B_k + \epsilon_k)}{\alpha_{k -1}^2B_{k - 1}}
    \right)
    \left(
        F(x_{k - 1}) - F(\bar x) 
        + \frac{\alpha_{k - 1}^2B_{k - 1}}{2}\Vert \bar x - v_{k - 1} \Vert^2
    \right). 
\end{aligned}
$$

$\blacksquare$


**Commentary.**
To derive the convergence rate, it remains to create convergence criterions of the error relative sequence $\epsilon_k$ such that the original optimal convergence rate of $\mathcal O(1/k^2)$ the sequence remains unaffected. 
Let the sequence $(B_k)_{k \ge 0}$ be given by **Definition 2**. 
We suggest the following descriptons using another sequence $\rho_k$ given by for all $k \ge 1$: 

$$
\begin{aligned}
    \rho_k &= \frac{B_k + \epsilon_k}{B_{k - 1}}\frac{B_{k - 1}}{B_k}.
\end{aligned}
$$

This means the following: 

$$
\begin{aligned}
    \max\left(
        1 - \alpha_k, 
        \frac{\alpha_k^2(B_k + \epsilon_k)}{\alpha_{k - 1}^2B_{k - 1}}
    \right)
    &=
    \max\left(
        \sim, 
        \rho_k\frac{B_k\alpha_k^2}{B_{k - 1}\alpha_{k - 1}^2}
    \right)
    \\
    &\le \max(1, \rho_k)\max\left(
        \sim, 
        \frac{B_k\alpha_k^2}{B_{k - 1}\alpha_{k - 1}^2}
    \right). 
\end{aligned}
$$

If we consider $\rho_k \le (1 + 2/k^2)$, it has the ability to make

$$
\begin{aligned}
    \prod_{k = 1}^{n} 
    \max \left(
        1 - \alpha_k, 
        \frac{\alpha_k^2(B_k + \epsilon_k)}{\alpha_{k - 1}^2B_{k - 1}}
    \right)
    &\le 
    \prod_{k = 1}^{n} 
    \max(1, \rho_k)
    \left(
    \prod_{i = 1}^{n}
        \max\left(
            1 - \alpha_k, 
            \frac{B_k\alpha_k^2}{B_{k - 1}\alpha_{k - 1}^2}
        \right)
    \right)
    \\
    &\le \prod_{k = 1}^n
    \left(
        1 + \frac{2}{k^2}
    \right)
    (\sim)
    \\
    &\le 2 (\sim). 
\end{aligned}
$$

The following lemma will seal the case for the other remaining big product above. 

#### **Lemma | Nesterov's momentum sequence bound**
> Let $(\alpha_k)_{k \ge 0}$ be a sequence such that $1 - \alpha_k = (B_k/B_{k - 1})(\alpha_k^2/\alpha_{k - 1})$, then it satisfies: 



#### **Theorem | Overall Convergence Rate**



---
### **Motivations and why this notes**

Consider problem of the form: 

$$
\begin{aligned}
    \min_x f(x) + g(Ax)
\end{aligned}
$$

where,
- $A \in \R^{m \times n}$
- $g: \R^m \rightarrow \overline \R$ is a closed, convex, proper function. 
- $f: \R^n\rightarrow \R$ is a $L$ Lipschitz smooth function. 
- $F = f + g$ is a function with quadratic growth condition. 

Unlike most cases, the linear mapping is in a nonsmooth term, this makes proximal gradient impossible in general because it's proxing $g(Ax)$. 
In the above notes, we can do inexact evaluations of proximal operator on $g(Ax)$ through other means such as reformulating it and using Douglas Rach for splitting. 
Because of its simplicity, restart can be used to obtain optimal linear convergence rate when $F$ has Quadratic Growth conditions. 

It can be used to solve nontrivial problems in practice. 
Consider the following formulation of a Total Variation (TV) problem: 
$$
\begin{aligned}
    \min_x 
    \left\lbrace
        \frac{1}{2}\Vert Ax - b\Vert^2
        + \lambda\Vert 
            Dx
        \Vert_1
    \right\rbrace. 
\end{aligned}
$$

This is nontrivial using methods such as Douglas Rachford, ADMM, Chambolle pock, etc due to the involvement of two linear mapping $A, D$. 
We can use primal dual method like Chambolle pock, but the proximal operator of $(1/2)\Vert Ax - b\Vert^2$ is not simple as well. 
This makes gives our method some competitive advantage, especially when we have a quadratic growth condition on $F$. 

In practice, for TV it has
- The $A$ matrix can be a down sample matrix, a convolution matrix etc. 
- The $D$ matrix is a discretized differential operator in which, minimizing it recovers images/signal of sharp edges. 
