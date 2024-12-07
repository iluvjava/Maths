---
alias: The Regret Residual Definitions of the Estimating Sequence used in Deriving Accelerated Proximal Gradient Method
---

- [Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md)

---
### **Intro**


The word "**regret**" is from online learning (A topic in machine learning) literatures. 
See paper "*Linear Coupling: An Ultimate Unification of Gradient and Mirror Descent*" for more information on the use of terms. 
The acronym "APG EST SEQ" stands for Accelerated Proximal Gradient Estimating Sequence. 

Throughout we consider minimization problem of the form: 
$$
\begin{aligned}
    \min_x \left\lbrace
        F(x) := f(x) + g(x)
    \right\rbrace. 
\end{aligned}
$$

Where $f$ is $\mu \ge 0$ strongly convex and $L$-Lipschitz smooth, and $g$ is just convex. 
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
    \mathcal G_{L} &= L\left(I - \widetilde{\mathcal J}_{L^{-1}}\right). 
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
>     & l_F(x; y_k) := F(T_L y_k) + \langle g_k, x - y_k\rangle + 
>     \frac{1}{2L}\Vert g_k\Vert^2, 
>     \\
>     & 
>     \phi_{k + 1}(x)
>     := (1 - \alpha_k)\phi_k (x) + 
>     \alpha_k (l_F(x; y_k) + \mu/2\Vert x - y_k\Vert^2). 
> \end{aligned}
> $$

**Observations**

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

#### **Theorem | The estimated residual (Regret)**
> Let $(\phi_k)_{k\ge 0}$ be an estimating admitting a canonical form given by the previous definition. 
> Define $\epsilon_k$ for all $k \ge 0$: 
> $$
> \begin{aligned}
>     \epsilon_k &= F(x_k) - l_F(x_k; y_k)
>     \\
>     x_{k + 1} &= T_L y_k
> \end{aligned}
> $$
> If, the sequence $v_k, y_k$, $\gamma_k, \alpha_k$ satisfies for all $k \ge 0$: 
> $$
> \begin{aligned}
>     \frac{\alpha_k \gamma_k}{\gamma_{k + 1}}(v_k - y_k) 
>     &= y_k - x_k, 
>     \\
>     L\alpha_k^2 
>     \le
>     \gamma_{k + 1} &= (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
> \end{aligned}
> $$
> then in addition to $\forall k \ge 0: \phi_{k}^* \ge F(x_{k})$, we have $\phi_k^* = F(x_k) + R_k$
> and $R_k$ satisfies recursively for all $k\ge 0$: 
> $$
> \begin{aligned}
>     R_{k + 1}
>     = \frac{1}{2}\left(
>        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
>    \right)\Vert g_k\Vert^2
>    + 
>    (1 - \alpha_k)
>    \left(
>        \epsilon_k + R_k + 
>        \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
>        \Vert v_k - y_k\Vert^2
>    \right). 
> \end{aligned}
> $$

**Proof**

Inductively assume that $\phi_k^* = F(x_k) + R_k$ where $R_k \ge 0$. 
Then the canonical form of the estimating sequence gives: 
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
        - \frac{\alpha_k^2}{2 \gamma_{k + 1}} \Vert g_k\Vert^2 
    \\
    &= 
    (1 - \alpha_k)\left(
        F(T_L y_k) + \langle g_k, x_k - y_k\rangle + 
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
        - \frac{\alpha_k^2}{2 \gamma_{k + 1}} \Vert g_k\Vert^2 
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
        + \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2. 
\end{aligned}
$$

On the first equality, we used $\phi_k^* = F(x_k) + R_k$ and $F(x_k) = \epsilon_k + l_F(x_k; y_k)$. 
The hypothesis $\alpha_k\gamma_k(v_k - y_k) = \gamma_{k + 1} (y_k - x_k)$ sets the inner product to be zero, the hypothesis $L \alpha_k^2 \le \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu \alpha_k$ makes the coefficient of $\Vert g_k\Vert^2$ to be non-negative. 
If we define $R_k$ on the remaining terms excluding $F(T_Ly_k)$, it has 

$$
\begin{aligned}
    R_{k + 1} &= 
    \left(
        \frac{1}{2L} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + (1 - \alpha_k)(\epsilon_k + R_k)
    + \frac{\mu\alpha_k(1 - \alpha_k)\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
    \\
    &= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right). 
\end{aligned}
$$

Then the inductive hypothesis hold with $\phi_{k + 1}^* = F(x_{k + 1}) + R_{k + 1}$. 


**Remarks**

It's not exactly clear what $R_k$ is, but it simplifies under some assumptions. 
Listing several possibilities here, we have 

1. $1/(2L) - \alpha_k^2/(2\gamma_{k + 1}) = 0$. 
2. $\mu = 0$.


**Both 1, 2 are true**

When both true, it has $R_{k + 1} = (1 - \alpha_k)(\epsilon_k + R_k)$. 
So it gives a new representation of $\phi_k^*$ that made use of $F(x_k)$ if we expand the recurrence relation: 

$$
\begin{aligned}
    \lambda_k &:= \prod_{i = 1}^{k} (1 - \alpha_i), \lambda_0 := 1, 
    \\
    R_{k + 1} = \phi_{k + 1}^* - F(x_{k + 1}) &= 
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
    \alpha_k \in(0, 1): L\alpha_k^2 \le \gamma_{k + 1} := (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
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

The recurrence relations define the sequences $x_k, y_k, v_k, \gamma_k, \alpha_k$ for all $k \ge 0$ given the initial condition $v_0, x_0, \alpha_0, \gamma_0$. 
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
    l_F(x; y_k) &= F(T_Ly_k) + \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    \epsilon_{k} &:= F(x_k) - l_F(x_k; y_k), 
    \\
    R_{k + 1}
    &:= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right). 
\end{aligned}
$$

#### **When both conditions are true**

We strengthen results and simplify the above under the assumption that $\alpha_k = (1 - \alpha_k) \gamma_k + \mu \alpha_k$ and $\mu = 0$. 
This will simplify the relations on iterates tremendously. 

Given $v_k, x_k, \alpha_k \gamma_k$, for all $k \ge 0$, define recursively $y_k, v_{k + 1}, x_{k + 1}, \alpha_{k + 1}, \gamma_{k + 1}$ by: 

$$
\begin{aligned}
    \text{find } &
    \alpha_k \in(0, 1): L\alpha_k^2 =\gamma_{k + 1}: = (1 - \alpha_k)\gamma_k, 
    \\
    y_k &= 
    \gamma_k^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)
    \\
    &= \alpha_k v_k + (1 - \alpha_k) x_k,
    \\
    g_k &= L (y_k - T_L y_k), 
    \\
    v_{k + 1} &= \gamma_{k + 1}^{-1}
    (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k)
    \\
    &= v_k - \alpha_k \gamma_k^{-1}(1 - \alpha_k)^{-1}g_k, 
    \\
    x_{k + 1} &= T_L y_k = y_k - L g_k. 
\end{aligned}
$$

Definitions for $l_F, g_k, \epsilon_k, \phi_k(x)$ remains the same but $R_{k + 1}$ would instead satisfy: 

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
###  **The regret inequality**

In this section, we define $g_k, l_f, \epsilon_k, R_k$ by: 

$$
\begin{aligned}
    g_k &:= L(y_k - T_L y_k), 
    \\
    l_F(x; y_k) &= F(T_Ly_k) + \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    \epsilon_{k} &:= F(x_k) - l_F(x_k; y_k), 
    \\
    R_{k + 1}
    &:= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right). 
\end{aligned}
$$

$\epsilon_k \ge 0$ always by the smoothness, convex conditions on $F$. 
Those conditions are used to derive the fundamental proximal gradient inequality, which is equivalent to this inequality here. 
And let the algorithm be defined by the recurrences: 

$$
\begin{aligned}
    \text{find } &
    \alpha_k \in(0, 1): L\alpha_k^2 \le \gamma_{k + 1} := (1 - \alpha_k)\gamma_k + \mu \alpha_k, 
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

With $\mu = 0$, the above simplifies to 

$$
\begin{aligned}
    \text{find } &
    \alpha_k \in(0, 1): L\alpha_k^2 \le \gamma_{k + 1}: = (1 - \alpha_k)\gamma_k, 
    \\
    y_k &= 
    \gamma_k^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)
    \\
    &= \alpha_k v_k + (1 - \alpha_k) x_k,
    \\
    g_k &= L (y_k - T_L y_k), 
    \\
    v_{k + 1} &= \gamma_{k + 1}^{-1}
    (\gamma_k(1 - \alpha_k) v_k - \alpha_k g_k)
    \\
    &= v_k - \alpha_k \gamma_k^{-1}(1 - \alpha_k)^{-1}g_k, 
    \\
    x_{k + 1} &= T_L y_k = y_k - L^{-1} g_k. 
\end{aligned}
$$

#### **Claim | zero S-CNVX regret inequality**
> For any $k \ge 0$, given $v_k, x_k, \alpha_k, \gamma_k$, suppose that the APG algorithm with $\mu \ge 0$ generates iterates: $y_k, v_{k + 1}, x_{k + 1}, \alpha_{k + 1},\gamma_{k + 1}$. 
> Let $R_k, \epsilon_k, l_F(x, y_k)$ be given in the start of this section with $\mu = 0$, then they satisfy the inequality
> $$
> {\small
> \begin{aligned}
>     (\forall k\ge 0) :
>     F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
>     &\le 
>     (1 - \alpha_k)
>     \left(
>         F(x_k) - F^* + R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
>     \right), 
> \end{aligned}
> }
> $$
> Where $F^*$ is the minimum and $x^*$ is the minimizer of $F$. 

**Observations**

This claim not yet has anything to do with $L\alpha_k^2 \le \gamma_{k + 1}$ yet. 


**Proof**

Recall that by definition for all $k \ge0$, $\epsilon_k$ admits 

$$
\begin{aligned}
    \epsilon_k &:= 
    F(x_k) - l_F(x_k, ;y_k) 
    \\
    &= F(x_k) - F(T_L y_k) - \langle  g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2 \ge 0. 
\end{aligned}
$$

By definitions, starting with the LHS of the inequality we want to prove, it has 

$$
{\small
\begin{aligned}
    & \quad 
    F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2 
    \\
    &= 
    F(x_k) - \epsilon_k - \langle g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2
    - F^* + R_{k + 1} + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2 
    \\
    &= 
    F(x_k) - \epsilon_k - \langle g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2
    - F^* + (1 - \alpha_k)(\epsilon_k + R_k) + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2 
    \\
    &\quad 
        + 
        \frac{1}{2}\left(
            L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
        \right)\Vert g_k\Vert^2
    \\
    &= 
    F(x_k) - F^* - \langle g_k, x_k - y_k\rangle - \frac{1}{2L} \Vert g_k\Vert^2 
    - \alpha_k \epsilon_k + (1 - \alpha_k) R_k + 
    \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    & \quad 
        + \frac{1}{2}\left(
            L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
        \right)\Vert g_k\Vert^2. 
\end{aligned}\tag{0}
}
$$

On the second equality we used the recurrence relations of the residual $R_{k + 1}$ when $\mu = 0$. 
Next, we consider expanding on the last term: 

$$
\begin{aligned}
    \frac{\gamma_{k + 1}}{2}\Vert v_{k +1} - x^*\Vert^2
    &= 
    \frac{\gamma_{k + 1}}{2}\Vert v_k - \alpha_k \gamma_{k + 1}^{-1}g_k - x^*\Vert^2
    \\
    &= \frac{\gamma_{k + 1}}{2}\Vert v_k - x^*\Vert^2 
    + \frac{\alpha_k^2}{2 \gamma_{k + 1}}\Vert g_k\Vert^2
    - \langle v_k - x^*, \alpha_k g_k\rangle
    \\
    &= 
    (1 - \alpha_k)\frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2 
    + \frac{\alpha_k^2}{2 \gamma_{k + 1}}\Vert g_k\Vert^2
    - \langle v_k - x^*, \alpha_k g_k\rangle. 
\end{aligned}
$$

On the third equality we used $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k$. 
Substituting the above back to (0) yields: 

$$
\begin{aligned}
    & 
    F(x_k) - F^* - \langle g_k, x_k - y_k\rangle - \frac{1}{2L} \Vert g_k\Vert^2 
    - \alpha_k \epsilon_k + (1 - \alpha_k) R_k
    \\ &\quad 
        + (1 - \alpha_k)\frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2 
        + \frac{\alpha_k^2}{2 \gamma_{k + 1}}\Vert g_k\Vert^2
        - \langle v_k - x^*, \alpha_k g_k\rangle
        + 
        \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    \\ &=
    F(x_k) - F^* 
    - \alpha_k \epsilon_k + (1 - \alpha_k)
    \left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + \left(
            \frac{\alpha_k^2}{2\gamma_{k + 1}}
            - \frac{1}{2L}
        \right)\Vert g_k\Vert^2
        - \langle g_k, x_k - y_k + \alpha_k(v_k - x^*)\rangle
        + \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
        \right)\Vert g_k\Vert^2
    \\ &= 
    F(x_k) - F^*
    + (1 - \alpha_k)
    \left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    +
    \alpha_k\left(
        - \langle g_k, \alpha_k^{-1}(x_k - y_k) + (v_k - x^*)\rangle
        - \epsilon_k
    \right)
    \\
    &= 
    (1 - \alpha_k)
    \left(F(x_k) - F^* + R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2\right)
    \\ &\quad 
        +
        \alpha_k\left(
            F(x_k) - F^* 
            - 
            \left\langle 
                g_k, \alpha_k^{-1}(x_k - y_k) + (v_k - x^*)
            \right\rangle
            - \epsilon_k
        \right). 
\end{aligned}\tag{$*$}
$$

On the first equality, we grouped terms with coefficient $(1 - \alpha_k)$, we also grouped the inner produce with by the comment term $g_k$. 
On the second equality, terms with comment coefficient $\alpha_k$ are also grouped. 
The third equality split $F(x_k) - F^*$ and groups it with terms having coefficient $(1 - \alpha_k)$ and $\alpha_k$. 

To simplify the inner product term, from the algorithm it has 

$$
\begin{aligned}
    y_k &= \alpha_k + (1 - \alpha_k) x_k 
    \\ \iff 
    x_k - y_k 
    &= 
    x_k - \alpha_k v_k - (1 - \alpha_k)x_k 
    \\
    &= \alpha_k (x_k - v_k)
    \\ \iff 
    x_k - y_k + \alpha_k (v_k - x^*)
    &= \alpha_k(x_k - x^*)
    \\ \iff 
    \alpha_k^{-1}(x_k - y_k) + (v_k - x^*)
    &= 
    x_k - x^*. 
\end{aligned}
$$

Therefore, the second term on the RHS of (*) simplifies to 

$$
\begin{aligned}
    &\quad 
    F(x_k) - F^* - 
    \langle g_k, x_k - x^*\rangle
    - \epsilon_k
    \\
    &= 
    F(x_k) - F^* - 
    \langle g_k, x_k - x^*\rangle
    - \left(
        F(x_k) - F(T_L y_k) - \langle  g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2 
    \right)
    \\
    &= 
    F(x_{k + 1}) - F^* + \langle g_k, x^* - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2
    \le 0 . 
\end{aligned}
$$

The last equality above simplifies to $- F^* + l_F(x^*; y_k) \le 0$. 
The claimed is proved. 

**Remarks**

The fact that $x^*$ is a minimizer of $x$ is not yet used in the proof, it could be any anything. 
The inequality condition $L\alpha_{k}^2 \le \gamma_{k + 1}$ is not yet used. 
We only used the equality $\gamma_{k + 1} = \gamma_k (1 - \alpha_k)$. 
To understand how useful the inequality is, let's consider the following cases: 

1. $L\alpha_k^2 \le \gamma_{k + 1}$, 
2. $L\alpha_k^2 = \gamma_{k + 1}$, 
3. $L\alpha_k^2 \ge \gamma_{k + 1}$. 

Inequality $L\alpha_k^2 \le \gamma_{k + 1}$ makes $R_{k + 1} \ge (1 - \alpha_k)(R_k + \epsilon_k)\ge (1 - \alpha_k)R_k$ due non-negativity of $(L^{-1} - \alpha_k^2 /\gamma_{k + 1})\Vert g_k\Vert^2$ and $\epsilon_k$. 
So $R_{k + 1} - (1 - \alpha_k)R_k \ge 0$. 
This would mean: 


$$
{\small
\begin{aligned}
    F(x_{k + 1}) - F^* + R_{k + 1} + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    \iff 
    F(x_{k + 1}) - F^* + R_{k + 1} - (1 - \alpha_k)R_k
    + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)\left(
        F(x_k) - F^* + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    \implies 
    F(x_{k + 1}) - F^* + \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)
    \left(
        F(x_k) - F^* + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}
}
$$

This now establishes the more familiar type of Lyapunov quantities. 
Otherwise, $L\alpha_k^2 \ge \gamma_{k + 1}$, then the regret quantities $R_k$ will have to be kept for the convergence of the algorithm. 

**One extra consideration**

If $\alpha_k \le (1 - \alpha_k)L\alpha_{k - 1}^2 + \mu \alpha_k$ then 

$$
\begin{aligned}
    \gamma_{k + 1} &:= 
    (1 - \alpha_k)\gamma_k + \mu \alpha_k \ge 
    (1 - \alpha_k)L \alpha_{k - 1}^2 + \mu \alpha_k
    \ge L\alpha_k^2
    \\
    \implies 
    L \alpha_k^2 &\le \gamma_{k + 1}. 
\end{aligned}
$$

The above convergence results would still apply if $(\alpha_k)_{k \ge 0}$ is generated in this way instead. 
This inequality is a strictly strong formulation. 


#### **Claim | Non-zero S-CNVX regret inequality**
> Repeat the same claim as the previous one but with assumption $\mu \ge 0$ instead. 

**Proof**

The easy parts are: 

$$
\begin{aligned}
    F(x_{k + 1}) &= 
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    R_{k + 1}
    &= 
    \frac{1}{2}\left(
        L^{-1} - \frac{\alpha_k^2}{\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left(
        \epsilon_k + R_k + 
        \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
        \Vert v_k - y_k\Vert^2
    \right), 
    \\
    \implies 
    F(x_{k + 1}) + R_{k + 1}
    &= 
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle
    - \frac{\alpha_k^2}{\gamma_{k + 1}}\Vert g_k\Vert^2
    \\
    &\quad 
        + 
        (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
            \Vert v_k - y_k\Vert^2
        \right). 
\end{aligned}\tag{1}
$$

Using $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu \alpha_k$, it gives: 

$$
\begin{aligned}
    \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^* \Vert^2
    &= 
    \frac{\gamma_{k + 1}}{2}\Vert 
        \gamma_{k + 1}^{-1}
        (
            \gamma_k(1 - \alpha_k)v_k - 
            \alpha_k g_k + \mu \alpha_k y_k
        )
        - x^* 
    \Vert^2
    \\
    &=  
    \frac{\gamma_{k + 1}}{2}
    \Vert 
        \gamma_{k + 1}^{-1}
        (
           \gamma_{k + 1} v_k + \mu \alpha_k(y_k - v_k)
            - \alpha_k g_k
        )
        - x^* 
    \Vert^2
    \\
    &= 
    \frac{\gamma_{k + 1}}{2}
    \Vert 
        v_k + \gamma_{k + 1}^{-1} \mu \alpha_k (y_k - v_k)
        - \gamma_{k + 1}^{-1}\alpha_k g_k
        - x^* 
    \Vert^2
    \\
    &= 
    \frac{\gamma_{k + 1}}{2}
    \Vert v_k - x^*\Vert^2 
    + 
    \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert \mu(y_k - v_k) - g_k\Vert^2 
    \\ &\quad 
        + 
        \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    \\
    &= 
    \left(
       \frac{(1 - \alpha_k)\gamma_k + \mu \alpha_k}{2} 
    \right)\Vert v_k - x^*\Vert^2
    \\ &\quad
        + 
        \frac{\alpha_k^2}{2\gamma_{k + 1}}
        \Vert \mu(y_k - v_k) - g_k\Vert^2 
        + 
        \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle. 
\end{aligned}\tag{2}
$$

First equality is by definition. 
The second equality considers 

$$
\begin{aligned}
    \gamma_k(1 - \alpha_k) v_k &= 
    (\gamma_{k + 1} v_k - \mu \alpha_k)v_k
    = \alpha_{k + 1} v_k - \mu\alpha_k v_k
    \\
    \iff 
    \gamma_k(1 - \alpha_k) v_k + \mu \alpha_k y_k
    &= 
    \gamma_{k + 1} v_k + \mu \alpha_k(y_k - v_k). 
\end{aligned}
$$

Focusing on the last two terms by the end of expression (2), we have  

$$
\begin{aligned}
    \frac{\alpha^2_k}{2\gamma_{k + 1}} 
    \Vert \mu(y_k - v_k) - g_k\Vert^2
    & = 
    \frac{\alpha_k^2\mu}{\gamma_{k + 1}}
    \left(
        \frac{\mu}{2}\Vert y_k - v_k\Vert^2 
        - \langle y_k - v_k, g_k\rangle
    \right)
    + \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2, 
    \\
    \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    &= 
    \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle 
    - \alpha_k \langle v_k - x^*, g_k\rangle. 
\end{aligned}\tag{2.1*}
$$

Adding the LHS of both equations above together gives: 

$$
\begin{aligned}
    & \quad 
    \frac{\alpha^2_k}{2\gamma_{k + 1}} 
    \Vert \mu(y_k - v_k) - g_k\Vert^2
    + 
    \langle v_k - x^*, \mu \alpha_k(y_k - v_k) - \alpha_k g_k\rangle
    \\
    &= 
    \left\langle g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\gamma_{k + 1}}(y_k - v_k)
    \right\rangle
    + \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
    + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}
$$


With the above we can conclude that (2) simplifies to 

$$
{\small
\begin{aligned} 
    & 
    \left(
       \frac{(1 - \alpha_k)\gamma_k + \mu \alpha_k}{2} 
    \right)\Vert v_k - x^*\Vert^2
    + 
    \left\langle g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\gamma_{k + 1}}(y_k - v_k)
    \right\rangle
    \\
    & \quad 
        + \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}\tag{2.2}
}
$$

Quick facts: 

$$
\textcolor{red}{
\begin{aligned}
    (Q1): 
    y_k - v_k &= 
    \frac{\gamma_{k + 1}}{\alpha_k \gamma_k}(x_k - y_k),
    \\
    (Q2): 
    y_k - x_k &= 
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
}
$$

Ok that is a lot, we list the following equations to assist things: 

$$
\begin{aligned}
    &\quad  - \alpha_k(v_k - x^*) - \frac{\alpha_k^2 \mu}{\gamma_{k + 1}}(y_k - v_k) - (x_k - y_k)
    \\
    \text{use Q1}: & =
    -\alpha_k(v_k - x^*) -
    \frac{\alpha_k^2}{\gamma_{k + 1}}\frac{\gamma_{k + 1}}{\alpha_k \gamma_k}(x_k - y_k)
    - (x_k - y_k) 
    \\
    &= 
    -\alpha_k(v_k - x^*) -
    \frac{\alpha_k \mu}{\gamma_k}(x_k - y_k)
    - (x_k - y_k) 
    \\
    &= 
    -\alpha_k(v_k - x^*) -
    \left(
        1 + \frac{\alpha_k \mu}{\gamma_k}
    \right)(x_k - y_k)
    \\
    \text{use Q2}: 
    &= 
    -\alpha_k(v_k - x^*) - 
    \frac{\alpha_k \mu + \gamma_k}{\gamma_k}
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}(x_k - v_k)
    \\
    &= 
    -\alpha_k(v_k - x^*)
    - \alpha_k(x_k - v_k)
    \\
    &= \alpha_k(x^* - x_k). 
\end{aligned}\tag{Q3}
$$

Adding (2.2) to (1) gives: 

$$
\begin{aligned}
    &
    F(x_k) - \epsilon_k - \langle  g_k, x_k - y_k\rangle
    - \frac{\alpha_k^2}{\gamma_{k + 1}}\Vert g_k\Vert^2
    \\
    &\quad 
        + (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
            \Vert v_k - y_k\Vert^2
        \right)
    \\
    &\quad 
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma_k + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
        + 
        \left\langle g_k, 
            - \alpha_k(v_k - x^*) 
            - \frac{\alpha_k^2\mu}{\gamma_{k + 1}}(y_k - v_k)
        \right\rangle
    \\
    & \quad 
        + \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \epsilon_k 
    + \left\langle 
        g_k, 
        - \alpha_k(v_k - x^*) 
        - \frac{\alpha_k^2\mu}{\gamma_{k + 1}}(y_k - v_k)
        - (x_k - y_k)
    \right\rangle
    \\
    &\quad 
        + (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
            \Vert v_k - y_k\Vert^2
        \right)
    \\
    &\quad 
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma_k + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
    \\
    & \quad 
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    \text{Use Q3}&= 
    F(x_k) - \epsilon_k 
    + \alpha_k\left\langle 
        g_k, 
        x^* - x_k
    \right\rangle
    \\
    &\quad 
        + (1 - \alpha_k)
        \left(
            \epsilon_k + R_k + 
            \frac{\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
            \Vert v_k - y_k\Vert^2
        \right)
    \\
    &\quad 
        + 
        \left(
        \frac{(1 - \alpha_k)\gamma_k + \mu \alpha_k}{2} 
        \right)\Vert v_k - x^*\Vert^2
    \\
    & \quad 
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \alpha_k\epsilon_k + \alpha_k\langle g_k, x^* - x_k\rangle
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\&\quad 
        + \frac{(1 - \alpha_k)\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2
        + (1 - \alpha_k)\left(
            R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
        \right)
    \\&\quad 
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle. 
\end{aligned}\tag{3}
$$


Taking a page break, continuing on (3) we have

$$
\begin{aligned}
    &
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\&\quad 
        + \frac{(1 - \alpha_k)\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2
    \\&\quad 
        + \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}\Vert y_k - v_k\Vert^2
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    &= 
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        \left(
            \frac{(1 - \alpha_k)\mu\alpha_k\gamma_k}{2\gamma_{k + 1}}
            + 
            \frac{\alpha_k^2 \mu^2}{2\gamma_{k + 1}}
        \right)\Vert y_k - v_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2 
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\
    & =
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        \frac{\mu \alpha_k}{2}\Vert y_k - v_k\Vert^2
        + \frac{\mu \alpha_k}{2}\Vert v_k - x^*\Vert^2 
        + \langle v_k - x^*, \mu\alpha_k(y_k - v_k)\rangle
    \\ &=
    F(x_k) - \alpha_k(\epsilon_k + \langle g_k, x_k - x^*\rangle)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\ &\quad 
        +
        \frac{\mu\alpha_k}{2} \Vert y_k - x^*\Vert^2
    \\&= 
    F(x_k) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}\tag{3.1}
$$

That was adding (1) and (2.2) together, which is the same as adding (1) and (2) together. 
So that was all equal to (1) + (2), therefore we get: 

$$
\begin{aligned}
    & F(x_{k + 1}) + R_{k + 1} + 
    \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &= 
    F(x_k) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    \iff & 
    \\
    & F(x_{k + 1}) - F(x^*) + R_{k + 1} + 
    \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    \\
    &= 
    F(x_k) - F(x^*) - \alpha_k\left(
        \epsilon_k + \langle g_k, x_k - x^*\rangle
        - \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    + 
    (1 - \alpha_k)\left(
        R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right)
    \\
    &= (1 - \alpha_k)(F(x_k) - F(x^*))
    + \alpha_k\left(
        F(x_k) - F(x^*) - \epsilon_k - \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \right)
    \\ &\quad 
        + 
        (1 - \alpha_k)\left(
            R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
        \right). 
\end{aligned}
$$

Focusing on the second term, we simplify the multiplier inside: 

$$
\begin{aligned}
    & F(x_k) - F(x^*) - \epsilon_k - \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \\
    &= 
    F(x_k) - F(x^*) - \left(
        F(x_k) - F(T_L y_k) - \langle g_k, x_k - y_k\rangle - \frac{1}{2L}\Vert g_k\Vert^2
    \right)- \langle g_k, x_k - x^*\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    \\
    &= F(T_L y_k) - F(x^*) + \langle g_k, x^* - y_k\rangle + \frac{\mu}{2}\Vert y_k - x^*\Vert^2
    + \frac{1}{2L}\Vert g_k\Vert^2 \le 0. 
\end{aligned}
$$

We used the fact that $F$ is $\mu$ strongly convex here! 
Beautiful, therefore we can conclude: 

$$
\begin{aligned}
    F(x_{k + 1}) - F(x^*) + R_{k + 1} + 
    \frac{\gamma_{k + 1}}{2}\Vert v_{k + 1} - x^*\Vert^2
    &\le 
    (1 - \alpha_k)\left(
        F(x_k) - F(x^*) + R_k + \frac{\gamma_k}{2}\Vert v_k - x^*\Vert^2
    \right). 
\end{aligned}
$$

We now quickly justify equation (Q1), (Q2). 
In the proof of APG using Nesterov's estimating sequence, we touched and proved the equality (Q1). 
To show (Q1) we use the definition of the algorithm which has updates 
$$
\begin{aligned}
    -(\alpha_k \gamma_k\gamma_{k + 1}^{-1} + 1)y_k
    &= 
    - \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k - x_k
    \\
    y_k &= 
    \frac{
        \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k + x_k
    }{1 + \alpha_k \gamma_k \gamma_{k + 1}^{-1}}
    \\
    &=  
    \frac{\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k}{\gamma_k + \alpha_k \mu}.
\end{aligned}
$$

To see (Q2), this is directly from 

$$
\begin{aligned}
    y_k &= (\gamma_k + \alpha_k \mu)^{-1}(\alpha_k \gamma_k v_k + \gamma_{k + 1} x_k)
    \\
    \iff
    y_k - x_k &= 
    (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k - (\gamma_k + \alpha_k \mu)x_k + \gamma_{k + 1}x_k)
    \\
    \iff 
    (\gamma_k + \alpha_k \mu)(y_k - x_k)
    &= 
    \alpha_k\gamma_k v_k + 
    (\gamma_{k + 1} - \gamma_k - \alpha_k \mu) x_k
    \\
    &= \alpha_k \gamma_k v_k - \alpha_k \gamma_k x_k = \alpha_k \gamma_k(v_k - x_k)
    \\
    \iff 
    y_k - x_k &= 
    \frac{\alpha_k \gamma_k}{\gamma_k + \alpha_k \mu}(v_k - x_k). 
\end{aligned}
$$

On the second equality of the second $\iff$ we just substituted $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 


**Remarks**

(Q1), (Q2) implies that all $y_k, v_k, x_k$ are collinear. 

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

The new relations on the canonical give: 

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


