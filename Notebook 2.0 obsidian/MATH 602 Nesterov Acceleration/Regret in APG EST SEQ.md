---
alias: The Regret Residual Definitions of the Estimating Sequence used in Deriving Accelerated Proximal Gradient Method
---

- [Nestrov Estimating Sequence of APG](Nestrov%20Estimating%20Sequence%20of%20APG.md)

---
### **Intro**


The word "**regret**" is from online learning literatures in machine learning. 
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

It's not exactly clear what $R_k$ is but it simplifies under some assumptions. 
Listing several possibilities here, we have 

1. $1/(2L) - \alpha_k^2/(2\gamma_{k + 1}) = 0$. 
2. $\mu = 0$.


**Both 1, 2 are true**

When both true, it has $R_{k + 1} = (1 - \alpha_k)(\epsilon_k + R_k)$. 
So it gives a new representation of $\phi_k^*$ that made use of $F(x_k)$ if we expand the recurrence relation: . 

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
    l_F(x; y_k) &= F(T_Ly_k) - \langle g_k, x - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2, 
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


