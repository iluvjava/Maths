- [FISTA Made Simple Part I](FISTA%20Made%20Simple%20Part%20I.md)

---
### **Intro**

Please read the previous file. 
Recall that the assumptions and the theories that were based on 
Unless specified, the following are assumed throughout. 

#### **Assumptions Set 1**
1. $f$ is a differentiable function with $L$ Lipschitz gradient, and it's convex. 
2. $g$ is a convex function. 
3. $\argmin{x}\;F(x) \neq \emptyset$. 

This is a description of the three points algorithm. 


#### **Definition | proximal gradient operator**
> Let $F = f + g$ where $f$ is differentiable, $L$ Lipschitz smooth. 
> $g$ is convex. 
> Define the proximal gradient operator: 
> $$
> \begin{aligned}
>     T_Lx = \argmin{z \in \R^n }
>     \left\lbrace 
>         g(z) + f(x) + \langle \nabla f(x), z - x\rangle + \frac{L}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

This is a single-valued operator. 

Proved in [Proximal Gradient Inequality Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Proximal%20Gradient%20Inequality%20Part%20I.md) is the following theorem: 

#### **Theorem | Proximal gradient inequality**
> Assume that $F = f + g$ where $f$ is $L$ Lipschitz smooth and $\mu \ge 0$ convex. 
> Then, for $y \in \R^n, \bar y = T_Ly$ it has the following: 
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


---
### **Extensions and modifications**

There are two variants of the Monotone version of FISTA. 
One is from Amir Beck. 
The other one is from Nesterov's Original writing which also appeared in the Catalyst Non-convex paper. 

#### **Algorithm | Generic Monotone Accelerated Gradient with Generic Line Search**
> Initialize with $y_0 = x_0 = v_0, \alpha_0 = 1$. 
> Initialize any $L_0$ such that
> $$
> \begin{aligned}
>     D_f(T_{L_0}, y_0) &\le \frac{L_0}{2}\Vert T_{L_0}x_0 - y_0\Vert^2. 
> \end{aligned}
> $$
> Let $(\alpha_k)_{k \ge 0}$ be a sequence such that $\alpha_k \in (0, 1) \forall k \ge 0$ and $\alpha_0 \in (0, 1]$. 
> The algorithm makes sequences $(x_k, v_k, y_k)_{k \ge 1}$, such that for all $k = 1, 2, \ldots$ they satisfy: 
> $$
> \begin{aligned}
>     & y_k = \alpha_k v_{k - 1} + (1 - \alpha_k) x_{k - 1}, \\
>     & \tilde x_k = T_{L_k}(y_{k}), \\ 
>     & v_k = x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1}), \\
>     & D_{f}(\tilde x_k, y_k) \le \frac{L_k}{2}\Vert \tilde x_k - y_k\Vert^2, \\
>     & \text{Choose any } x_k: F(x_k) \le \min(F(\tilde x_k), F(x_{k - 1})). 
> \end{aligned}
> $$
> Hence, the proximal gradient inequality applies for $\tilde x_k$. 
> And there exists some $\overline L$ such that $\overline L \ge L_k$ for all $k \ge 0$. 

**Observations**

One option is to choose $x_k \in \{x_k, \tilde x_k\}$. 
Such an option reduces the above algorithm to MFISTA by Amir Beck. 
It has $F(x_k) \le \min(F(\tilde x_k), F(x_{k - 1})) \le F(x_{k - 1})$, this makes the most recent iterate always the smallest. 
This is a simpler representation. 
Observe that, if $x_k = x_{k - 1}$ then replacing all instance of $x_k$ by $x_{k - 1}$ it has: 

$$
\begin{aligned}
    y_{k + 1} &= \alpha_{k + 1}(v_k) + (1 - \alpha_{k + 1})x_{k - 1}
    \\
    &= \alpha_{k + 1}(x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1})) + (1 - \alpha_{k + 1})x_{k - 1}
    \\
    &= \alpha_{k + 1} x_{k - 1} + \alpha_{k + 1}\alpha_k^{-1}(\tilde x_k - x_{k - 1}) + (1 - \alpha_{k + 1}) x_{k - 1}
    \\
    &= x_{k - 1} + \alpha_{k + 1}\alpha_k^{-1}(\tilde x_k - x_{k - 1})
    \\
    &= \tilde x_k + (\alpha_{k + 1} \alpha_k^{-1} - 1)(\tilde x_k - x_{k - 1}). 
\end{aligned}
$$
It's not exactly clear on what it's trying to do in this case. 
Otherwise, $x_k = \tilde x_k$ and it yields: 

$$
\begin{aligned}
    y_{k + 1} &= 
    \alpha_{k + 1}(v_k) + (1 - \alpha_{k + 1})\tilde x_k
    \\
    &= 
    \alpha_{k + 1}(x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1})) + (1 - \alpha_{k + 1})\tilde x_k
    \\
    &= 
    \alpha_{k + 1}\left(
        (1 - \alpha_{k}^{-1})x_{k - 1} + (\alpha_k^{-1} - 1)\tilde x_k + \tilde x_k
    \right) + 
    (1 - \alpha_{k + 1})\tilde x_k
    \\
    &= 
    \alpha_{k + 1}\left(
        (\alpha_k^{-1} - 1)(\tilde x_k - x_{k - 1}) + \tilde x_k
    \right) + 
    (1 - \alpha_{k + 1})\tilde x_k
    \\
    &= \tilde x_k + \alpha_{k + 1}(\alpha_k^{-1} - 1)(\tilde x_k - x_{k - 1}). 
\end{aligned}
$$

In this case, it reduced to the MFISTA algorithm. 

**Remarks**

If, sequence $\alpha_k$ requires $L_k$, then the algorithm generates $(x_k, v_k, x_{k + 1})$ instead. 

#### **Theorem 3.1 | Convergence of Generic Monotone Accelerated Gradient with Line Search**
> Let $F = f + g$ satisfy Assumptions set 1. 
> Let $(\alpha_k)_{k \ge 0}$ be a sequence such that $\alpha_k \in (0, 1)$ for all $k \ge 1$ and $\alpha_0 \in (0, 1]$. 
> Let $\rho_k = (1 - \alpha_{k + 1})^{-1}\alpha_{k + 1}^2 \alpha_k^{-2} > 0$. 
> Define the sequence $(\beta_k)_{k \ge 0}$, let $\beta_0 = 1$ and for all $k \ge 1$: 
> $$
> \begin{aligned}
>     \beta_k &:= \prod_{i = 0}^{k - 1}(1 - \alpha_{i + 1})
>     \max\left(1, \rho_i L_{i + 1}L_i^{-1}\right). 
> \end{aligned}
> $$
> Then, the convergence rate of Generic Monotone Accelerated Gradient with Generic Non-Monotone Line Search algorithm has for all $x^+ \in \R^n, k \ge 1$: 
> $$
> \begin{aligned}
>     F(x_k) - F(x^+) + \frac{L_k\alpha_k}{2}\Vert x^+ - v_k\Vert^2
>     & \le 
>     \beta_k
>     \left(
>         F(x_0) - F(x^+) + \frac{L_0\alpha_0}{2} \Vert x^+ - v_k\Vert^2
>     \right). 
> \end{aligned}
> $$
> If in addition, the algorithm is initialized with $\alpha_0 = 1, x_0 = v_0 = T_{L_{0}}x_{-1} \in \text{dom}\; F$ and $x^+$ is a minimizer of $F$, then the convergence rate simplifies: 
> $$
> \begin{aligned}
>     F(x_k) - F(x^+) + \frac{L_k\alpha_k}{2}\Vert x^+ - v_k\Vert^2
>     & \le 
>     \frac{\beta_kL_0}{2}\Vert x^+ - x_{-1}\Vert^2. 
> \end{aligned}
> $$


**Observations**

Note that the sequence has equivalently: 

$$
\begin{aligned}
    \alpha_k &= 
    \frac{1}{2}
    \left(
        \alpha_{k - 1}\sqrt{\alpha_{k -1}^2 + 4 \rho_{k - 1}} - \alpha^2_{k - 1}
    \right). 
\end{aligned}
$$

This is nothing new, see [The Nesterov Momentum Sequence](The%20Nesterov%20Momentum%20Sequence.md) for more information. 

**Proof**

Define $z_k = \alpha_k x^+ + (1 - \alpha_k) x_{k - 1}$ for all $k \ge 0$. 
To start, we first establish the equalities that: 

$$
\begin{aligned}
    z_k - \tilde x_k &= \alpha_k(x^+ - v_k)
    \\
    x_k - y_k &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

To demonstrate, it has 

$$
\begin{aligned}
    z_k - \tilde x_k &= (\alpha_k x^+ + (1 - \alpha_k)x_{k - 1}) - \tilde x_k
    \\
    &= \alpha_k (x^+ + \alpha_k^{-1}(1 - \alpha_k)x_{k - 1} - \alpha_k^{-1}\tilde x_k)
    \\
    &= \alpha_k(x^+ + \alpha_k^{-1}x_{k - 1} - x_{k - 1} - \alpha_k^{-1}\tilde x_k)
    \\
    &= \alpha_k(x^+ + \alpha_k^{-1}(x_{k - 1} - \tilde x_k) - x_{k - 1})
    \\
    &= \alpha_k(x^+ - v_{k}), 
    \\
    z_k - y_k &= 
    (\alpha_k x^+ + (1 - \alpha_k)x_{k - 1}) - \left(
        \alpha_k v_{k - 1} + (1 - \alpha_k)x_{k - 1}
    \right)
    \\
    &= \alpha_k(x^+ + \alpha_k^{-1}(1 - \alpha_k)x_{k - 1} - v_{k - 1} - \alpha_k^{-1}(1 - \alpha_k)x_{k - 1})
    \\
    &= \alpha_k(x^+ - v_{k - 1}). 
\end{aligned}
$$

Suppose that $(\alpha_k)_{k\ge 0}$ has $\forall k \ge 1$:
$$
    1 - \alpha_k = \frac{\alpha_k^2}{\alpha_{k - 1}^2\rho_{k - 1}}. 
$$
Then the convergence rate can be derived. 
Look, 

$$
{\small
\begin{aligned}
    0 &\le 
    F(z_k) 
    - F(\tilde x_k) - \frac{L_k}{2}\Vert z_k - \tilde x_k\Vert^2 + 
    \frac{L_k}{2}\Vert z_k - y_k\Vert^2
    \\
    &= F(\alpha_k x^+ + (1 - \alpha_k)x_{k - 1}) - F(\tilde x_k)
    - \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k \Vert^2 
    + \frac{L_k\alpha_k^2}{2}\Vert(x^+ - v_{k - 1})\Vert^2
    \\
    &\le 
    \alpha_k F(x^+) + (1 - \alpha_k) F(x_{k - 1}) - F(\tilde x_k)
    - \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k \Vert^2 
    + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k - 1} \Vert^2
    \\
    &= 
    (\alpha_k - 1)F(x^+) + (1 - \alpha_k) F(x_{k - 1}) + F(x^+) - F(\tilde x_k)
    - \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k \Vert^2 
    + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k - 1}\Vert^2
    \\
    &= 
    (1 - \alpha_k)(F(x_{k - 1}) - F(x^+)) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k - 1}\Vert^2
    - \left(
        F(\tilde x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k}\Vert^2
    \right)
    \\
    &\le 
    (1 - \alpha_k)(F(x_{k - 1}) - F(x^+)) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k - 1}\Vert^2
    - \left(
        F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_{k}\Vert^2
    \right)
    \\
    &= 
    (1 - \alpha_k)(F(x_{k - 1}) - F(x^+)) + 
    \left(
        \frac{\alpha_k^2}{\alpha_{k - 1}^2\rho_{k - 1}}
    \right)
    \frac{L_{k - 1}\alpha_{k - 1}^2(\rho_{k - 1}L_kL_{k - 1}^{-1})}{2}\Vert x^+ - v_k\Vert^2 \\
        &\quad 
        - \left(
            F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \\
    &= 
    \left(
        1 - \alpha_k
    \right)\left(
        F(x_{k - 1}) - F(x^+) + \frac{L_{k - 1}\alpha_{k - 1}^2(\rho_{k - 1}L_kL_{k - 1}^{-1})}{2}
        \Vert x^+ - v_{k - 1}\Vert^2
    \right) \\
        & \quad 
        - \left(
            F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \\
    &\le 
    \left(
        1 - \alpha_k
    \right)\left(
        F(x_{k - 1}) - F(x^+) + \frac{L_{k - 1}\alpha_{k - 1}^2\max(1, \rho_{k - 1}L_kL_{k - 1}^{-1})}{2}
        \Vert x^+ - v_{k - 1}\Vert^2
    \right) \\
        & \quad 
        - \left(
            F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \\
    &\le 
    \left(
        1 - \alpha_k
    \right)\max(1, \rho_{k - 1}L_kL_{k - 1}^{-1})
    \left(
        F(x_{k - 1}) - F(x^+) + \frac{L_{k - 1}\alpha_{k - 1}^2}{2}
        \Vert x^+ - v_{k - 1}\Vert^2
    \right) \\
        & \quad 
        - \left(
            F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right)
    \\
    & \cdots 
    \\
    &\le 
    \left(
        \prod^{k - 1}_{i = 0} (1 - \alpha_{i + 1})\max(1, \rho_{i}L_{i + 1}L^{-1}_i)
    \right)\left(
        F(x_0) - F(x^+) + \frac{L_0 \alpha_0}{2}\Vert x^+ - v_0\Vert^2
    \right) \\
        & \quad 
        - \left(
            F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
        \right). 
\end{aligned}
}
$$

If $x_0 = v_0 = T_{L_0}x_{-1}, \alpha_0 = 1$, then using the proximal gradient inequality it has:  

$$
\begin{aligned}
    0 &\le 
    F(x^+) - F(T_{L_{-1}}x_{-1}) - \frac{L_0}{2}\Vert x^+ - T_{L_0}x_{-1}\Vert^2 + 
    \frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    \\
    &= 
    F(x^+) - F(x_0) - \frac{L_0}{2}\Vert x^+ - v_0\Vert^2 + 
    \frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2. 
\end{aligned}
$$

By $\alpha_0 = 1$, the inequality simplifies: 

$$
\begin{aligned}
    0 &\le \left(
        \prod^{k - 1}_{i = 0} (1 - \alpha_{i + 1})\max(1, \rho_{i}L_{i + 1}L^{-1}_i)
    \right)\frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    - \left(
        F(x_k) - F(x^+) + \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \right). 
\end{aligned}
$$

$\blacksquare$




#### **Example | Armijo Monotone Line Search**

It remains to analyze the sequence to provide us with a bound on the convergence rate of the algorithm. 
The situation is easier if $\overline L \ge L_{k} \ge L_{k + 1}$ for all $k \ge 0$, i.e: increasing monotonically but bounded above. 
Let $s \in (1, \infty)$ be a constant scale. 
Consider the following rule that is the Armijo Monotone Line Search condition: 

$$
\begin{aligned}
    L_{k + 1} = \min_{n \in \mathbb N}
    \left\lbrace
        L_k s^n : 
        D_f(T_{L_ks^n}y_k, y_k) \le 
        \frac{L_k}{2}\Vert T_{L_ks^n} y_k - y_k\Vert^2
    \right\rbrace. 
\end{aligned}
$$

Eventually, there exists an $k^+$  such that $L_{k^+} \ge L_f$ the true value, it causes $L_{k^+} = L_{k^+ + j}$ for all $j \ge 0$. 
Set $\rho_k = 1$, since monotone $L_{i + 1}/L_i \ge 1$ hence the product has 

$$
\begin{aligned}
    \prod_{i = 0}^{k - 1} (1 - \alpha_{i + 1})\left(
        \frac{L_{i + 1}}{L_i} 
    \right)
    &= 
    \left(
        \prod_{i = 0}^{k - 1} (1 - \alpha_{i + 1})
    \right)
    \left(
        \prod_{i = 0}^{k - 1} L_{i + 1}/L_i
    \right)
    \\
    &= L_{k - 1}/L_0 
    \left(
        \prod_{i = 0}^{k - 1} (1 - \alpha_{i + 1})
    \right). 
\end{aligned}
$$

Depending on $L_0, s$, it's possible for $L_{k^+} > L_f$, making it an overestimate. 


#### **Example | Backtracking Line Search of Chambolle**
A none monotone line search from Chambolle et al. decays the estimates of $L_k$ at a geometric rate (or equivalently, increasing step size at a geometric rate) until the descent lemma is no longer satisfies which it then triggers an Armijo monotone line search to increase $L_k$ for proximal point $\tilde x_k$. 
The idea of gradually changing the Lipschitz constant estimate is crucial.
We call it: "The sluggish backtracking strategy.". 

Let $r \in (0, 1), s > 1$ be the relaxation ratio and Line search scale. 
Given $L_{k - 1}$ from previous iteration, it updates $L_{k}$ by: 

$$
\begin{aligned}
    & L_k := L_{k - 1}r,
    \\
    & i = 0. 
    \\
    & \text{DO: }\\ & \quad
    \begin{aligned}
        & \alpha_k := \frac{1}{2}
        \left(
            \alpha_{k - 1}\sqrt{\alpha_{k -1}^2 + 4 L_{k - 1}L_{k}^{-1}} - \alpha^2_{k - 1}
        \right),
        \\
        & y_k := \alpha_k v_{k - 1} + (1 - \alpha_k) x_{k - 1},
        \\
        &\tilde x_k := T_{L_k}y_k,
        \\
        & L_k := L_{k}s^i,
        \\
        & i := i + 1. 
    \end{aligned}
    \\
    & 
    \text{WHILE } \left(
            D_f(\tilde x_k, y_k) > L_{k}/2 \Vert \tilde x_k - y_k\Vert^2
        \right)
\end{aligned}
$$

Iterates generated by this algorithm satisfies the generic monotone scheme with generic line search with $\rho_{k - 1} = L_{k}^{-1}L_{k - 1}$. 
This line search algorithm is more complex since $y_k$ is changing each time $L_k, \alpha_k$ is being updated. 


#### **Lemma | Convergence of Chambolle's backtracking line search**
> Let $F = f + g$ satisfies Assumption Set 1. 
> If the generic Monotone Accelerated Gradient algorithm were equipped with Chambolle's Backtracking Line Search then the convergence rate of the algorithm using relaxation sequence $\rho_{k - 1} = L_k^{-1}L_{k - 1}$ is bounded by: 
> $$
> \begin{aligned}
>     \prod_{i = 0}^{k - 1} (1 - \alpha_{k + 1})\max(1, \rho_i L_{i + 1}L_i^{-1})
>     = \frac{\alpha_k^2L_k^2}{\alpha_0 L_0}
>     &\le 
>     \left(
>         1 + \frac{\sqrt{L_0\alpha_0}}{2}\sum_{i = 1}^{k} \sqrt{L_i^{-1}}
>     \right)^{-2}. 
> \end{aligned}
> $$

**Proof**

The backtracking line search proposed by Chambolle has $\rho_{k - 1} = L_k^{-1}L_{k - 1}$. 
Consequently, the sequence $(\alpha_k)_{k \ge 0}$ satisfies for all $k \ge 1$: 

$$
\begin{aligned}
    (1 - \alpha_k) = \frac{\alpha_k^2}{\alpha_{k - 1}^2\rho_{k - 1}} = \frac{\alpha_k^2L_k}{\alpha_{k - 1}^2L_{k - 1}}. 
\end{aligned}
$$

This choice makes $\rho_i L_{i + 1} L^{-1}_i = 1$, so the convergence rate simplifies, and we define $(\beta_k)_{k \ge 1}$: 

$$
\begin{aligned}
    & \beta_k := \prod_{i = 0}^{k - 1}(1 - \alpha_{i + 1}) 
    = 
    \prod_{i = 0}^{k - 1}\frac{\alpha_{i + 1}^2}{\alpha_{i}^2\rho_k}
    = 
    \prod_{i = 0}^{k - 1}\frac{\alpha_{i + 1}^2}{\alpha_{i}^2L_{i + 1}^{-1}L_{i}}
    = (\alpha_k^2/\alpha_0^2)(L_k/L_0). 
\end{aligned}
$$
Define $\beta_0 = 1$ as the base case. 
Observe that the sequence is monotone decreasing and strictly larger than zero, i.e: $0 < \beta_{k + 1} < \beta_k \; \forall k \ge 0$. 
From these definitions we have for all $k \ge 1$, $(1 - \alpha_k) = \beta_k / \beta_{k - 1}$: 
Now look, they give these: 

$$
\begin{aligned}
    (1 - \alpha_k) &= \beta_k/\beta_{k - 1}
    \\
    \iff 
    \alpha_k &= 1 - \beta_k / \beta_{k - 1}
    \\
    \implies 
    \alpha_k^2 &= (1 - \beta_k / \beta_{k - 1})^2, 
    \\
    \alpha_k^2&= (1 - \alpha_k)\alpha_{k - 1}^2L_{k - 1}L_k^{-1}
    \\
    &= 
    (1 - \alpha_k)(\alpha_{k - 1}^2L_{k - 1}L_0^{-1}\alpha_0^{-1})L_0\alpha_0L_k^{-1}
    \\
    &= 
    (\beta_k\beta_{k - 1}^{-1})\beta_{k - 1}L_0\alpha_0L_k^{-1}
    \\
    &= \beta_kL_0\alpha_0L_k^{-1}. 
\end{aligned}
$$

Combining it has $(1 - \beta_k/\beta_{k - 1})^2 = \beta_k L_0\alpha_0L_k^{-1}$. 
Using the property that $\beta_k$ is monotone decreasing, it has: 

$$
\begin{aligned}
    0 &= (1 - \beta_k/\beta_{k - 1})^2 - \beta_k L_0\alpha_0L_k^{-1}
    \\
    \iff 
    0 &= (1 - \beta_k/\beta_{k - 1}) - \sqrt{\beta_k L_0\alpha_0L_k^{-1}}
    \\
    \implies
    0 &= \left(
        \beta_k^{-1} - \beta_{k - 1}^{-1}
    \right) - \sqrt{\beta_k^{-1} L_0\alpha_0L_k^{-1}}
    \\
    &= 
    \left(\sqrt{\beta_k^{-1}} + \sqrt{\beta_{k - 1}^{-1}}\right)
    \left(\sqrt{\beta_k^{-1}} - \sqrt{\beta_{k - 1}^{-1}}\right)
    - \sqrt{\beta_k^{-1} L_0\alpha_0L_k^{-1}}
    \\
    &\le 2\sqrt{\beta_k^{-1}}\left(\sqrt{\beta_k^{-1}} - \sqrt{\beta_{k - 1}^{-1}}\right)
    - \sqrt{\beta_k^{-1} L_0\alpha_0L_k^{-1}}
    \\
    \implies
    0 &\le 
    2\left(\sqrt{\beta_k^{-1}} - \sqrt{\beta_{k - 1}^{-1}}\right)
    - \sqrt{ L_0\alpha_0L_k^{-1}}
    \\
    \implies 0 
    &\le 
    2\left(
        \sum_{i = 1}^{k}
        \sqrt{\beta_i^{-1}} - \sqrt{\beta_{i - 1}^{-1}}
    \right) - \sum_{i = 1}^{k} \sqrt{ L_0\alpha_0L_i^{-1}}
    \\
    &= 
    2\left(\sqrt{\beta_k^{-1}} -\sqrt{\beta_{0}^{-1}}\right) 
    - \sum_{i = 1}^{k} \sqrt{ L_0\alpha_0L_i^{-1}}
    \\
    &= 2\left(\sqrt{\beta_k^{-1}} - 1\right) 
    - \sqrt{L_0\alpha_0}\sum_{i = 1}^{k} \sqrt{L_i^{-1}}. 
\end{aligned}
$$

Simplifying the above yields the inequality 

$$
\begin{aligned}
    \beta_k &\le 
    \left(
        1 + \frac{\sqrt{L_0\alpha_0}}{2}\sum_{i = 1}^{k} \sqrt{L_i^{-1}}
    \right)^{-2}. 
\end{aligned}
$$

This is an upper bound of the convergence rate by our previous theorems. 

$\blacksquare$



**Remarks**

The proof shares 异曲同工之妙 with Güler's proof on the accelerated proximal point method 1992. 
It also appeared in Luca Calatronic, Anthonin Chambolle's work on "Backtracking strategies for accelerated descent method with smooth composite objectives". 
The above results are consistent with the literatures. 
In addition, if we let $L_i = L_0, \alpha_0 = 1$ for all $i$, it simplifies, and it's: $\beta_k \le \frac{4}{(k + 2)^2}$. 

Nesterov in his book, labeled (2.2.32) proposed the following algorithm as a variant for the accelerated gradient method. 
It's not exactly the same, but the presentation below would be equivalent. 

There is a similar theorem for the convergence of the gradient mapping of Generic Monotone FISTA with Line Search. 

#### **Example | Nesterov's Monotone Accelerated Gradient**
> Initialize $x_0, v_0$, $\alpha_0 \in (0, 1]$, and the sequence $(\alpha_k)_{k \ge 0}$ such that $\forall k \ge 1: \alpha_k \in (0, 1)$, The Nesterov's Monotone method generates sequences $(x_k, v_k, y_k)_{k\ge 1}$ such that it satisfies: 
> $$
> \begin{aligned}
>     y_k &= \alpha_k v_{k - 1} + (1 - \alpha_k)x_{k - 1},
>     \\
>     \tilde x_k &= T_{L_k}(y_k), \text{ with line search or backtracking. }
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1}),
>     \\
>     \hat y_k &= \argmin{}\left\lbrace
>         F(y): y \in \{x_{k - 1}, \tilde x_k\}
>     \right\rbrace,
>     \\
>     x_k &= T_L(\hat y_k). 
> \end{aligned}
> $$


#### **Theorem | Convergence of Nestrov's Monotone FISTA variants under convexity**
> 


Obviously, this fits the generic description of the monotone algorithm. 
This variant of monotone FISTA exhibits fast convergence of the norm of the gradient mapping. 
Furthermore, observe that for all $k \ge 1$ it has from the proximal gradient inequality that (No need for convexity here): 

$$
\begin{aligned}
    0 &\le F(\hat y_k) - F(T_L \hat y_k) - \frac{L}{2}\Vert \hat y_k - T_L \hat y_k\Vert^2
    \\
    &= \min(F(x_{k - 1}), F(\tilde x_k)) - F(x_k) - \frac{L}{2}\Vert \hat y_k - T_L \hat y_k\Vert^2
    \\
    &\le F(x_{k - 1}) - F(x_k) - \frac{1}{2L}\Vert \mathcal G_L(\hat y_k) \Vert^2. 
\end{aligned}
$$

Consider partial sum $k \le i \le N$ of the above inequality then

$$
\begin{aligned}
    0 &\le \left(
        \sum_{i = k}^{N} F(x_{i - 1}) - F(x_i)
    \right) 
    - \frac{1}{2L}\sum_{i = k}^{N} \Vert \mathcal G_L(\hat y_k)\Vert^2
    \\
    &= 
    F(x_{k - 1}) - F(x_N) 
    - \frac{1}{2L}\sum_{i = k}^{N} \Vert \mathcal G_L(\hat y_k)\Vert^2
    \\
    &\le 
    F(x_{k - 1}) - F(x_N) 
    - \frac{N - (k - 1)}{2L}\left(
        \min_{k \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert^2
    \right)
    \\
    &\le F(x_{k - 1}) - F^+ 
    - \frac{N - (k - 1)}{2L}\left(
        \min_{k \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert^2
    \right)
\end{aligned}
$$

Define for all $k \ge 1$: 
$$
\begin{aligned}
    \beta_k := 
        \prod_{i = 0}^{k - 1} (1 - \alpha_{i + 1})
        \max\left(1, \rho_i L_{i + 1}L_i^{-1}\right), \beta_0 = 1. 
\end{aligned}
$$

Using previous theorem, if the algorithm is initialized via $x_0 = v_0 = T_{L_0}(x_{-1}), \alpha_0 = 1$ then the convergence rate applies and for the minimizer $x^+$ it has 

$$
\begin{aligned}
    0&\le 
    \frac{\beta_{k - 1}L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    - \frac{N - (k - 1)}{2L}\left(
        \min_{k \le i \le N} \Vert \mathcal G_L(\hat y_k)\Vert^2
    \right)
    \\
    &= \frac{\beta_{k - 1}^{}}{2}\left(
        L_0\Vert x^+ - x_{-1}\Vert^2
        - \frac{N - (k - 1)}{\beta_{k - 1}L} \min_{k \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert^2
    \right)
    \\
    \iff 
    0 &\le 
    \frac{LL_0\beta_{k - 1}\Vert x^+ - x_{-1}\Vert^2}{N - (k - 1)}
    - \min_{k \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert^2
    \\
    &\le 
    \frac{LL_0\beta_{k - 1}\Vert x^+ - x_{-1}\Vert^2}{N - (k - 1)} 
    - \min_{1 \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert^2
    \\
    \iff  0 & \le 
    \left(
        \frac{LL_0\beta_{k - 1}}{N - (k - 1)}
    \right)^{1/2}\Vert x^+ - x_{-1}\Vert
    - \min_{1 \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert
\end{aligned}
$$

Assuming that the sequence is given by $(1 - \alpha_k)\alpha_{k - 1}L_{k - 1} = \alpha_k^2 L_k$, then previous theorem has 

$$
\begin{aligned}
    \beta_k &\le 
    \left(
        1 + \frac{\sqrt{L_0}}{2}\sum_{i = 1}^{k} \sqrt{L_i^{-1}}
    \right)^{-2} \le 
    \left(
        1 + \frac{k\sqrt{L_0}}{2} \min_{1\le i \le k} \sqrt{L_i^{-1}}
    \right)^{-2}. 
\end{aligned}
$$


Looks complicated, we may want to disable line search to discuss the convergence rate here. 
Then, things simplified, $\beta_k \le 4/(k + 2)^2$ then it has 

$$
\begin{aligned}
    \frac{LL_0\beta_{k - 1}}{N - (k - 1)} &= 
    \left(
        \frac{L}{N - k + 1}
    \right)\left(
        \frac{4}{(k + 1)^2}
    \right)
    = \frac{4L}{(N - k + 1)(k + 1)^2}. 
\end{aligned}
$$

It's showned from Nesterov that 

$$
\begin{aligned}
    \max_{k = 1, \ldots, N} (N - k + 1)(k + 1) &\ge 
    (N + 2)(4/27(N + 2)^2 - 1/4) - 1/8
    \\
    \implies 
    \min_{k = 1, \ldots, N} \frac{4L}{(N - k + 1)(k + 1)^2}
    &\le 
    \frac{4L}{(N + 2)(4/27(N + 2)^2 - 1/4) - 1/8}
    \\
    &= 
    \frac{4L}{(N + 2)(1/108)(4N - 3\sqrt{3} + 8)(4N + 3\sqrt{3} + 8) - 1/8}
    \\
    &\le \frac{432L}{(N + 2)(4N - 3\sqrt{3} + 8)^2 - 1/8}
    \\
    &\le \frac{432L}{N(4N - 2)^2 - 1/8}\le \frac{432L}{N(2N)^2 - 1/8}
    \\
    &= \frac{432L}{4N^3 - 1/8}. 
\end{aligned}
$$

Which means 

$$
\begin{aligned}
    \min_{1 \le i \le N} \Vert \mathcal G_L(\hat y_i)\Vert
    &\le 
    \sqrt{\frac{432L}{4N^3 - 1/8}} \Vert x^+ - x_{-1}\Vert. 
\end{aligned}
$$

**Remarks**

Unfortunately this result can't speed up the convergence of the function value to $o(k^{-3})$. 
If the function is convex and simply bounded below and has Lipschitz gradient (A subset of weakly convex function), there would be a convergence on the squared norm of the gradient mapping. 



---
### **Bounds on the gradient mapping of the last iterate**

Without the monotone assumption, the FISTA with backtracking has convergence on the gradient mapping. 

#### **Theorem | convergence of the last gradient mapping**
> Suppose that the sequence $(y_k, x_k, v_k)_{k \ge 0}$ where generated by the Generic Monotone Accelerated Gradient Algorithm with Generic Line Search, using the sequence $(\alpha_k)_{k \ge 1}, \alpha_0 = 1$ with the initial condition that $x_1 = v_1 = y_1 = T_{L_0}x_{-1}$. 
> Let $x^+$ be a minimizer of $F$. 
> Define the sequence $(\beta_k)_{k \ge 0}$ with $\beta_0 = 1$ and 
> $$
> \begin{aligned}
>     \beta_k := \prod_{i = 0}^{k - 1}(1 - \alpha_{i + 1})
>     \max\left(1, \rho_i L_{i + 1}L_i^{-1}\right). 
> \end{aligned}
> $$
> Then the norm of the last gradient mapping at $y_k$ satisfies
> $$
> \begin{aligned}
>     \Vert \mathcal G_{L_k} y_k\Vert &\le 
>     \sqrt{\beta_k}L_k L_0 \left(
>         1 - 
>         \min(\rho_{k - 1}, L_k^{-1} L_{k - 1})^{1/2}
>     \right)\Vert x^+ - v_0\Vert. 
> \end{aligned}
> $$

**Proof**

The proof is made from the following intermediate results. 
**Intermediate Results (1)**: 
The gradient mapping admits, for all $k \ge 1$: 

$$
\begin{aligned}
    \Vert \mathcal G_{L_k} y_k\Vert &=
    L_k\alpha_k\Vert v_{k} - v_{k - 1}\Vert. 
\end{aligned}
$$

**Intermediate Results (2):**
Recall that $(1 - \alpha_k)\rho_{k - 1} = \alpha_k^2/\alpha_{k - 1}$ for all $k \ge 1$. 
If we assume that $\alpha_0 = 1$ and $x^+$ is a minimizer of $F$, then for all $k \ge 0$ it has: 
$$
\begin{aligned}
    \frac{\alpha_k}{\sqrt{\beta_k L_0}}\Vert x^+ - v_k\Vert &\le 
    \Vert x^+ - v_0\Vert. 
\end{aligned}
$$

**Now, we can derive the overall results**. For all $k \ge 0$, starting with Intermediate Results (1) we have 

$$
\begin{aligned}
    \Vert \mathcal G_{L_k} y_k\Vert 
    &= L_k\alpha_k \Vert v_k - v_{k - 1}\Vert
    \\
    &\le 
    L_k\alpha_k(\Vert v_k - x^+\Vert + \Vert v_{k - 1} - x^+\Vert)
    \\
    &\le 
    L_k \alpha_k \left(
        \frac{\sqrt{\beta_kL_0}}{\alpha_k}\Vert x^+ - v_0\Vert
        - 
        \frac{\sqrt{\beta_{k - 1}L_0}}{\alpha_{k - 1}}\Vert x^+ - v_0\Vert
    \right) 
    \\
    &= L_k L_0 \left(
        \sqrt{\beta_k}
        - 
        \frac{\alpha_k\sqrt{\beta_{k - 1}}}{\alpha_{k - 1}}
    \right)\Vert x^+ - v_0\Vert
    \\
    &= \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        \frac{\alpha_k}{\alpha_{k - 1}}\sqrt{\frac{\beta_{k - 1}}{\beta_k}}
    \right)\Vert x^+ - v_0\Vert
    \\
    &= \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        \frac{\alpha_k}{\alpha_{k - 1}}
        \left((1 - \alpha_k)\max(1, \rho_{k - 1}L_k L_{k - 1}^{-1})\right)^{-1/2}
    \right)\Vert x^+ - v_0\Vert
    \\
    &= 
    \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        ((1 - \alpha_k)\rho_{k - 1})^{1/2}
        \left((1 - \alpha_k)\max(1, \rho_{k - 1}L_k L_{k - 1}^{-1})\right)^{-1/2}
    \right)\Vert x^+ - v_0\Vert
    \\
    &= 
    \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        \left(\rho_{k - 1}^{-1}\max(1, \rho_{k - 1}L_k L_{k - 1}^{-1})\right)^{-1/2}
    \right)\Vert x^+ - v_0\Vert
    \\
    &=
    \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        \max(\rho_{k - 1}^{-1}, L_k L_{k - 1}^{-1})^{-1/2}
    \right)\Vert x^+ - v_0\Vert
    \\
    &= 
    \sqrt{\beta_k}L_k L_0 \left(
        1 - 
        \min(\rho_{k - 1}, L_k^{-1} L_{k - 1})^{1/2}
    \right)\Vert x^+ - v_0\Vert. 
\end{aligned}
$$


**Proving Intermediate Results (1)**. 
$$
\begin{aligned}
    y_k &= \alpha_k v_{k - 1} + (1 - \alpha_k)x_{k - 1}
    \iff 
    v_{k - 1} = \alpha_k^{-1}(y_k - (1 - \alpha_k)x_{k - 1}). 
\end{aligned}
$$

Hence, it has for all $k \ge 0$

$$
\begin{aligned}
    v_k - v_{k - 1} &= 
    (x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1})) - \alpha_k^{-1}(y_k - (1 - \alpha_k)x_{k - 1})
    \\
    &= 
    x_{k - 1} + \alpha_k^{-1}(\tilde x_k - x_{k - 1})
    - \alpha_k^{-1}y_k + (\alpha_k^{-1} - 1)x_{k - 1}
    \\
    &= \alpha_k^{-1}(\tilde x_k - x_{k - 1}) - \alpha_k^{-1}y_k + \alpha_k^{-1} x_{k - 1}
    \\
    &= \alpha_k^{-1}\tilde x_k - \alpha_k^{-1} y_k 
    = \alpha^{-1}_k(\tilde x_k - y_k) = \alpha_k^{-1}(T_{L_k} y_k - y_k)
    \\
    &= -\alpha_k^{-1}L_k^{-1}(\mathcal G_{L_k}(y_k)). 
\end{aligned}
$$

**Proving Intermediate Results (2)**. The base case is verified by the assumption that $x_0 = v_0 = T_{L_0} x_{-1}$. 
Apply the proximal gradient inequality and using the fact that $x\^+$ is a minimizer we can get

$$
\begin{aligned}
    0 &\le 
    F(x^+) - F(T_{L_{-1}}x_{-1}) - \frac{L_0}{2}\Vert x^+ - T_{L_0}x_{-1}\Vert^2 + 
    \frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    \\
    &= 
    F(x^+) - F(x_0) - \frac{L_0}{2}\Vert x^+ - v_0\Vert^2 + 
    \frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    \\
    &\le 
    - \frac{L_0}{2}\Vert x^+ - v_0\Vert^2 + 
    \frac{L_0}{2}\Vert x^+ - x_{-1}\Vert^2
    \\
    &= \frac{L_0}{2}\left(
        \Vert x^+ - x_{-1}\Vert- \Vert x^+ - v_0\Vert 
    \right). 
\end{aligned}
$$

Because $\beta_0 = \alpha_0 = 1$, the base case holds. 
For all $k \ge 1$, we consider the convergence claim and it has 

$$
\begin{aligned}
    0 &\le \frac{L_0\beta_k }{2}\Vert x^+ - x_{-1}\Vert^2 
    - F(x_k) + F(x^+) - \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \\
    &\le 
    \frac{L_0\beta_k }{2}\Vert x^+ - x_{-1}\Vert^2 
    - \frac{L_k\alpha_k^2}{2}\Vert x^+ - v_k\Vert^2
    \\
    &= \frac{\alpha_k^2L_k}{2}\left(
        \frac{\beta_k}{\alpha_k^2L_0}
        \Vert x^+ - x_{-1}\Vert^2 
        - \Vert x^+ - v_k\Vert^2
    \right)
    \\
    \iff 
    0 &\le 
    \Vert x^+ - x_{-1}\Vert - \frac{\alpha_k}{\sqrt{\beta_k L_0}}\Vert x^+ - v_k\Vert. 
\end{aligned}
$$



---
### **Accelerated proximal gradient with strong convexity**

The convergence analysis will be dependent on the similar triangle form discussed in [Weak Accelerated Proximal Gradient Part II](Weak%20Accelerated%20Proximal%20Gradient%20Part%20II.md). 

#### **Similar Triangle Form**
> Let iterates $(y_k, x_{k}, v_{k})_{k \ge 1}$ and sequence $(\alpha_k, \rho_k)_{k \ge 0}$ be given by Definition R-WAPG. 
> Then for all $k \ge 1$, iterate $y_k, x_{k + 1}, v_{k + 1}$
> satisfy: 
> $$
> \begin{aligned}
>     y_{k} &= 
>     \left(
>         1 + \frac{L - L\alpha_{k}}{L\alpha_{k} - \mu}
>     \right)^{-1}
>     \left(
>         v_{k} + 
>         \left(\frac{L - L\alpha_{k}}{L\alpha_{k} - \mu} \right) x_{k}
>     \right), 
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k, 
>     \\
>     v_{k + 1} &= x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k). 
> \end{aligned}
> $$

Make the observations that the update of the iterates has alternative representations for $y_k, v_{k}$. 

