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
    \mathcal J_{L^{-1}}y 
    &= \argmin{x}\left\lbrace
        g(x) + f(y) + \langle \nabla f(y), x - y\rangle 
        + 
        \frac{L}{2}\Vert x - y\Vert^2
    \right\rbrace,
    \\
    \mathcal G_{L^{-1}} y &= L(I - \mathcal J_{L^{-1}}). 
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


The following sequence showed the descent sequence from the Nesterov's estimating sequence that allows for the design of the accelerated proximal gradient algorithm. 

#### **Thm | The descent sequence conditions**