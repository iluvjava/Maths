[Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md)

---
### **Intro**

We address and expand some of the remarks after the proof in details. 
There seems to be some big room for improving things. 
Before we start, we restate important definitions and claims here. 

Throughout we consider minimization problem of the form: 
$$
\begin{aligned}
    \min_x \left\lbrace
        F(x) := f(x) + g(x)
    \right\rbrace
\end{aligned}
$$

where $f$ is $\mu \ge 0$ strongly convex and $L$-Lipschitz smooth, and $g$ is just convex. 
$\mathcal J_{L^{-1}}$, $\mathcal G_{L^{-1}}$ are the proximal gradient and the gradient mapping given by 

$$
\begin{aligned}
    T_Ly 
    &= \argmin{x}\left\lbrace
        g(x) + f(y) + \langle \nabla f(y), x - y\rangle 
        + 
        \frac{L}{2}\Vert x - y\Vert^2
    \right\rbrace,
    \\
    \mathcal G_{L} y &= L\left(I - \widetilde{\mathcal J}_{L^{-1}}\right). 
\end{aligned}
$$

The estimating sequence $(\phi_k: \R^n \rightarrow \R)_{k \ge 0}$ used to prove the algorithm is given by the following 2 definitions. 

#### **Def | Recursive estimating sequence**
> Let $(\alpha_k)_{k\ge 0}$ be a sequence such that $\phi_k \in (0, 1)$ for all $k \ge 0$. 
> Define the estimating sequence $\phi_k : \R \rightarrow \R^n$ be such that 
> $$
> \begin{aligned}
>     & g_k := L(y_k - T_L y_k) \quad \text{Gradient mapping }, 
>     \\
>     & l_F(x; y_k) := F(T_L y_k) - \langle g_k, x - y_k\rangle + 
>     \frac{1}{2L}\Vert g_k\Vert^2, 
>     \\
>     & 
>     \phi_{k + 1}(x)
>     := (1 - \alpha_k)\phi_k (x) + 
>     \alpha_k (l_F(x; y_k) + \mu/2\Vert x - y_k\Vert^2). 
> \end{aligned}
> $$

**Obervations**

The sequence $\phi_k$ is always a simple quadratic function. 


#### **Def | Canonical form of the estimating sequence**
> Suppose that an estimating sequence is parameterized in the following way: 
> $$
> \begin{aligned}
>     \phi_k^* &:= \min_x \phi_k(x), 
>     \\
>     \phi_k(x) &= \phi_k^* + \frac{\gamma_k}{2}\Vert x - v_k\Vert^2. 
> \end{aligned}
> $$
> The canonical form is a simple quadratic characterize by a constant curvature $\gamma_k$ and the unique minimizer $v_k$. 
> Let $(y_k)_{k \in \N}, \alpha_k$ be any sequenced used to define estimating sequence $\phi_k: \R^n \mapsto \R$ recursively, then the recursive definition of $\phi_k$ in canonical form satisfies recurrence relationship for all $k \in \N$: 
> $$
> {\small
> \begin{aligned}
>     & \gamma_{k + 1} = (1 - \alpha_k) \gamma_k + \mu \alpha_k
>     \\
>     & 
>     v_{k + 1} = \gamma_{k + 1}^{-1}
>     (\gamma_k(1 - \alpha_k)v_k - \alpha_k g_k + \mu \alpha_k y_k)
>     \\
>     & 
>     \phi_{k + 1}^* = 
>     (1 - \alpha_k)\phi_k^*
>     + \alpha_k\left(
>         F(T_L y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
>     \right) 
>     - \frac{\alpha_k^2}{2 \gamma_{k + 1}} \Vert g_k\Vert^2 
>     + 
>     \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}} 
>     \left(
>         \frac{\mu}{2}\Vert v_k - y_k\Vert^2 
>         + \langle v_k - y_k , g_k\rangle
>     \right). 
> \end{aligned}
> }
> $$
> Here $g_k = \mathcal G_L y_k$. 


The following sequence showed the descent sequence from the Nesterov's estimating sequence that allows for the design of the accelerated proximal gradient algorithm. 

#### **Theorem | The estimated residual**
> 


#### **Stronger Inductive Hypothesis**

The inductive hypothesis made $\phi_k^* \ge F(T_Ly_k)$ during the proof can be improved. 
Let's instead make the following stronger inductive hypothesis that: 

$$
\begin{align*}
    \phi_k^* = F(x_k) + R_k, 
\end{align*}
$$

and we use the following equality instead: 

$$
\begin{aligned}
    \epsilon_k &:= F(x_k) - l_F(x_k; y_k) \ge 0, 
    \\
    F(x_k) &= l_F(x_k; y_k)
    + \epsilon_k. 
\end{aligned}
$$

With the above, we redo the inductive hypothesis part of the proof to explore the recurrence relations of the residual $\epsilon_k$. 
Starting with the canonical form 

$$
\begin{aligned}
    \phi_{k + 1}^* 
    &= 
    (1 - \alpha_k)\phi_k^*
    + \alpha_k\left(
        F(T_L y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
    \right) 
    - \frac{\alpha_k^2}{2 \gamma_{k + 1}} \Vert g_k\Vert^2 
    \\
    &\quad 
        + 
        \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}} 
        \left(
            \frac{\mu}{2}\Vert v_k - y_k\Vert^2 
            + \langle v_k - y_k , g_k\rangle
        \right)
    \\
    &= 
    (1 - \alpha_k)\left(
        l_F(x_k; y_k) + \epsilon_k + R_k
    \right)
    + 
    \alpha_k\left(
        F(T_L y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
    \right) 
    + 
    \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}
    \Vert v_k - y_k\Vert^2
    \\
        &\quad 
        + \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
        \langle v_k - y_k, g_k\rangle
    \\
    &= 
    (1 - \alpha_k)\left(
        F(T_L y_k) - \langle g_k, x - y_k\rangle + 
        \frac{1}{2L}\Vert g_k\Vert^2 + \epsilon_k + R_k
    \right)
    \\ &\quad 
        + 
        \alpha_k\left(
            F(T_L y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
        \right) 
        + 
        \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \\
        &\quad 
        + \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
        \langle v_k - y_k, g_k\rangle
    \\
    &= 
    F(T_Ly_k)
    + 
    \left(
        \frac{1}{2L} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left\langle 
        g_k, \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}(v_k - y_k) + (x_k - y_k)
    \right\rangle
    \\ & \quad 
        + (1 - \alpha_k)(\epsilon_k + R_k)
        + \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
\end{aligned}
$$

Make the inner product zero, and assert the non-negativity of the coefficient for $\Vert g_k\Vert^2$ so: 

$$
\begin{aligned}
    \frac{\alpha_k \gamma_k}{\gamma_{k + 1}}(v_k - y_k) 
    &= y_k - x_k, 
    \\
    L\alpha_k^2 
    \le
    \gamma_{k + 1} &= (1 - \alpha_k)\gamma_k + \mu \alpha_k. 
\end{aligned}
$$

It gives us the following relations on the Nesterov's estimating sequence which is 

$$
\begin{aligned}
    \phi_{k + 1}^* &= 
    F(T_Ly_k)
    + 
    \left(
        \frac{1}{2L} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    \\ & \quad 
        + (1 - \alpha_k)(\epsilon_k + R_k)
        + \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2. 
\end{aligned}
$$

Listing several possiblities here, we have 

1. $1/(2L) - \alpha_k^2/(2\gamma_{k + 1}) = 0$. 
2. $\mu = 0$.


#### **When Both are true**
When both conditions are true, assuming that $x_{k + 1} = T_L y_k$, then it admits a simple representation of: 

$$
\begin{aligned}
    \phi_{k + 1}^* 
    &= 
    F(T_L y_k) + (1 - \alpha_k)(\epsilon_k + R_k)
    \\
    &= 
    F(T_L y_k) + (1 - \alpha_k)(F(x_k) - l_F(x_k; y_k) + R_k)
    \\
    &= 
    F(T_L y_k) + (1 - \alpha_k)(F(x_k) - l_F(x_k; y_k) + \phi_k^* - F(x_k)), 
    \\
    \iff 
    \phi_{k + 1}^* - F(x_{k + 1}) &= 
    (1 - \alpha_k)(F(x_k) - l_F(x_k; y_k)) + (1 - \alpha_k)(\phi_k^* - F(x_k))
    \\
    &= 
    (1 - \alpha_k)\epsilon_k + (1 - \alpha_k)(\phi_k^* - F(x_k)), 
    \\
    \iff 
    \phi_{k + 1}^* - F(x_{k + 1}) - 
    (1 - \alpha_k)(\phi_k^* - F(x_k)) &= (1 - \alpha_k)\epsilon_k. 
\end{aligned}
$$

The first equation we used $R_k = \phi_k^* - F(x_k)$ from the inductive hypothesis. 
The first equation also reveals the recurrence relations $R_{k + 1} = (1 - \alpha_k)(\epsilon_k + R_k)$. 
The second equation expands on the relations of the residual. 

This allows a new representation of $\phi_k^*$ that made use of $F(x_k)$. 

$$
\begin{aligned}
    \lambda_k &:= \prod_{i = 1}^{k} (1 - \alpha_i), \lambda_0 := 1, 
    \\
    \phi_{k + 1}^* - F(x_{k + 1}) &= 
    (\lambda_k/\lambda_{k - 1})\epsilon_k 
    + (\lambda_k/\lambda_{k - 2})\epsilon_{k - 1} 
    + (\lambda_k/\lambda_{k - 3})\epsilon_{k - 2}
    + (\lambda_k/\lambda_0)\epsilon_0
    \\
    \iff 
    \phi_{k + 1}^* &= 
    F(x_{k + 1}) + 
    \sum_{i = 1}^{k}\frac{\lambda_k}{\lambda_{k - 1}}\epsilon_{k - 1}. 
\end{aligned}
$$

Recurrence obtained, the goal next is unclear. 
The gap between $\phi_k^*$ and $F(x_k)$ is the weighted sum of all the regrets of on iterates $x_k$. 

#### **When Both are not satisfied**

Thre would be a similar trend here. 
Incorperating the terms into $R_k$ which gives 

$$
\begin{aligned}
    \phi_{k + 1}^*
    &= F(T_Ly_k) + (1 - \alpha_k)\epsilon_k
    + 
    (1 - \alpha_k)\left(
        R_k + 
        \frac{\mu\alpha_k \gamma_k}{2 \gamma_{k + 1}} \Vert v_k - y_k\Vert^2
        + 
        \frac{1}{2(1 - \alpha_k)}\left(
            L^{-1} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
        \right)\Vert g_k\Vert^2
    \right). 
\end{aligned}
$$

Therefore, it establishes the following recurrences for the residual $R_{k + 1}$: 

$$
\begin{aligned}
    R_{k + 1}
    := 
    (1 - \alpha_k) 
    \left(
        R_k + \epsilon_k + 
        \frac{(1 - \alpha_k)\mu \alpha_k \gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
    \right)
    + 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2. 
\end{aligned}
$$


---
### **Residual definitions of the estimating sequence**

Previously we define the algorithm using estimating sequence and their recurrence definition. 
Now we derive the recurrence relations of the Estimating sequence using the algorithm that it defined, in addition with the Residual Recurrences derived in the previous section. 

Our goal is to go back and also show the convergence of the sequence $F(x_k)$, hopefully identifying the Lyapunov quantities. 
We hope that this recovers a Beck's style of proof of the FISTA algorithm. 

#### **When both conditions are false**

Given the quantities $v_k, x_k, \alpha_k, \gamma_k$, for all $k\ge 0$ define recursively $y_k, v_{k + 1}, x_{k + 1}, \alpha_{k + 1}, \gamma_{k + 1}$ by: 

$$
\begin{aligned}
    \text{find } &
    L\alpha_k \in(0, 1): \alpha_k \le (1 - \alpha_k)\gamma_k + \mu \alpha_k
    \\
    \gamma_{k + 1} 
    &= (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
    \\
    y_k &= 
    (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k), 
    \\
    v_{k + 1} &= \gamma_{k + 1}^{-1}
    (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k), 
    \\
    x_{k + 1} &= T_L y_k. 
\end{aligned}
$$

The recurrence relations defines the sequences $x_k, y_k, v_k, \gamma_k, \alpha_k$ for all $k \ge 0$ given the initial condition $v_0, x_0, \alpha_0, \gamma_0$. 
Next, redefine the Nesterov's estimating sequence $\phi_k(x)$ for all $k\ge 0$ by canonical form: 

$$
\begin{aligned}
    \phi_{k + 1}(x) &= 
    \phi_{k}^* + \gamma_{k + 1}/2\Vert x - v_{k + 1}\Vert^2
    \\
    &= F(x_{k + 1}) + R_{k + 1} + 
    \gamma_{k + 1}/2\Vert x - v_{k + 1}\Vert^2. 
\end{aligned}
$$

The value $R_{k + 1}$ here satisfies recursive relations: 

$$
\begin{aligned}
    g_k &:= L(y_k - T_L y_k), 
    \\
    l_F(x; y_k) &= F(T_Ly_k) - \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    \epsilon_{k} &:= F(x_k) - l_F(x_k; y_k), 
    \\
    R_{k + 1}
    &:= 
    (1 - \alpha_k) 
    \left(
        R_k + \epsilon_k + 
        \frac{(1 - \alpha_k)\mu \alpha_k \gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
    \right)
    + 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2. 
\end{aligned}
$$

#### **When both conditions are true**

We strenthen th results and simplify the above under the assumption that $\alpha_k \le (1 - \alpha_k) \gamma_k + \mu \alpha_k$ and $\mu = 0$. 
This will simplify the relations on iterates tremendously. 


Given $v_k, x_k, \alpha_k \gamma_k$, for all $k \ge 0$, define recursively $y_k, v_{k + 1}, x_{k + 1}, \alpha_{k + 1}, \gamma_{k + 1}$ by: 


$$
\begin{aligned}
    \text{find } &
    \alpha_k \in(0, 1): L\alpha_k \le (1 - \alpha_k)\gamma_k, 
    \\
    \gamma_{k + 1} 
    &= (1 - \alpha_k)\gamma_k, 
    \\
    y_k &= 
    \gamma_k^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k), 
    \\
    v_{k + 1} &= \gamma_{k + 1}^{-1}
    (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k), 
    \\
    x_{k + 1} &= T_L y_k. 
\end{aligned}
$$

Definitions for $l_F, g_k, \epsilon_k, \phi_k(x)$ remains the same but $R_{k + 1}$ would instead satisfies: 

$$
\begin{aligned}
    R_{k + 1} := 
    (1 - \alpha_k)
    \left(
        R_k + \epsilon_k
    \right). 
\end{aligned}
$$



---
### **Analyzing the Lyapunov recurrences**

With the new representation of Estimating sequence, we can represent the Lyapunov quantities directly using $F(x_k)$, the implicit descent sequence that we were interested in. 
We want to see $F(x_k)$ popping up in the Lyapunov quantity below: 

$$
\begin{aligned}
    \phi_{k + 1}(x^*) - \phi_k(x^*) 
    & \le 
    \alpha_k(\phi_k(x^*) - F(x^*))
    \\
    \iff 
    \phi_{k + 1}(x^*) - F(x^*)
    &\le 
    (1 - \alpha_k)(\phi_k (x^*) - F(x^*)). 
\end{aligned}
$$

The new relations on the Canoncial gives: 

$$
\begin{aligned}
    (\forall k \ge 0)(\forall x): 
    \phi_{k}(x) = \phi_k^* + \frac{\gamma_k}{2}\Vert x - v_k\Vert^2
    &= 
    F(x_k) + R_k + 
    \frac{\gamma_k}{2}\Vert x - v_k\Vert^2, 
    \\
    x = x^*\implies 
    (\forall k \ge 0): \phi_k(x^*) 
    &= F(x_k) + R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2. 
\end{aligned}
$$

This leads to the following primary question. 
Can we prove the inequality from just the Residual definition of the estimating sequence? 
So, goal is to compare the quantities: 

$$
\begin{aligned}
    & F(x_k) - F(x^*) + R_k + \gamma_k/2\Vert v_k - x^*\Vert^2; 
    \\
    & F(x_{k + 1}) - F(x^*) + R_{k + 1} + \gamma_{k + 1}/2\Vert v_{k + 1} - x^*\Vert^2. 
\end{aligned}
$$


