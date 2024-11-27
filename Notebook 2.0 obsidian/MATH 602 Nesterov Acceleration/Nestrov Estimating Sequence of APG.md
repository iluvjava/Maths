---
alias: Nesterov's Estimating Sequence derivations of Accelerated Proximal Gradient Method
---
- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Fundamental Proximal Gradient Inequality](Fundamental%20Proximal%20Gradient%20Inequality.md)

--- 
### **Intro**

To begin, define 
1. $f$ to be convex, $L$ Lipschitz smooth and $\mu \ge 0$ strongly convex. 
2. $g$ is convex. 
3. $h = f + g$
4. $T_L = (I + L^{-1} \partial g)^{-1}(I - L^{-1}\nabla f)$, which is the proximal gradient operator. 

Consider the following definitions for $k \in \N$ and any sequence $(y_k)_{k \in \N}$ and $(\alpha_k)_{k \in \N}$ where $\alpha_i \in (0, 1)$ for all $i \in \N$, we define: 

$$
\begin{aligned}
    & g_k := L(y_k - T_L y_k) \quad \text{Gradient mapping }, 
    \\
    & l_h(x; y_k) := h(T_L y_k) + \langle g_k, x - y_k\rangle + 
    \frac{1}{2L}\Vert g_k\Vert^2, 
    \\
    & 
    \phi_{k + 1}(x)
    := (1 - \alpha_k)\phi_k (x) + 
    \alpha_k (l_h(x; y_k) + \mu/2\Vert x - y_k\Vert^2). 
\end{aligned}
$$

Where $\phi_k: \R^n \mapsto \R$ is called the Nesterov's estimating sequence. 
Here, $l_h(x; y_k)$ is a linearized lower bound using the gradient mapping. 
Next we assume further that $\phi_k$ admits canonical form, parameterized by sequences of $(\phi_k^*)_{k \in \N}, (\gamma_k)_{k \in N}$ and vector $(v_k)_{k \in N}$ satisfying: 

$$
\begin{aligned}
    \phi_k^* 
    & := \min_x \phi_k(x), 
    \\
    \phi_{k + 1}(x) 
    &:= \phi_{k + 1}^* + \frac{\gamma_k}{2}\Vert x - v_k\Vert^2, 
    \\
    \phi_0(x) &:= \phi_0^* + \frac{\gamma_0}{2} \Vert x - v_0\Vert^2. 
\end{aligned}
$$



---
### **The convergence rate directly from the Nesterov's estimating sequence**

Assume that there exists some sequence $\{x_k\}_{k \in \N}$ such that $f(x_k) \le \phi_k^*$.
We call that relation the implicit descent relation.  
Assume that $x_0$ is a minimizer and $f_* = f(x_*)$ then it assists with proving the convergence rate of $f(x_k) - f_*$. 

From the fundamental proximal gradient inequality, for all $x \in \R^n$: 

$$
\begin{aligned}
    l_h(x; y_k) + \frac{\mu}{2}\Vert x - y_k\Vert^2 
    &\le 
    f(x) \quad  (\forall x)
    \\
    \phi_{k + 1}(x) - \phi_k(x)
    &= 
    - \alpha_k 
    \left(\phi_k(x) - l_h(x; y_k) - \frac{\mu}{2} \Vert x - y_k\Vert^2\right)
    \\
    \implies 
    &\le 
    - \alpha_k (\phi_k(x) - f(x)). 
\end{aligned}
$$

now, choose $x$ to be any minimizer $x_*$ then: 

$$
\begin{aligned}
    \phi_{k + 1}(x_*) - \phi_k(x_*) 
    & \le \alpha_k(\phi_k(x_*) - f_*)
    \\
    \phi_{k + 1}(x_*) - f_* - \phi_k(x_*) + f_*
    & \le \alpha_k(\phi_k(x_*) - f_*)
    \\
    \phi_{k + 1}(x_*) - f_*
    &\le 
    (1 - \alpha_k) (\phi_k(x_*) - f_*)
    \\
    \implies 
    f(x_{k + 1}) - f_* 
    &\le 
    \left(
        \prod_{i = 0}^{k} \left(1 - \alpha_i\right)
    \right)
    (\phi_0(x_*) - f_*). 
\end{aligned}
$$

Hence, it creates a convergence rate parameterized recurrence parameter $\alpha_k$ used for the estimating sequence $\phi_k$. 


---
### **Solving the Recurrence of the canonical form of the estimating sequence**

Parameterizing the canonical form recursively and couple it with $(y_k)_{k \in \N}$ is very useful for solving $x_k$ that satisfies the implicit descent relation. 

#### **Key quantities used in the analysis**
There are several categories of quantities in the analysis for the convergence of the algorithm. 
1. For the estimating sequences canonical form: 
   1. $\phi_k^*$,
   2. $v_k$, 
   3. $\gamma_k$.
2. For the Lyapunov analysis: 
   1. $\alpha_k$, 
   2. $x_k$,
   3. $y_k$. 
3. For the estimating sequence's recursive form: 
   1. $y_k$, 
   2. $\alpha_k$. 

During the analysis, the recurrence form of the estimating sequence establishes relations between all the quantities: $\phi_k^*, v_k, \gamma_k, v_k, \alpha_k$. 
When searching for the implicit descent sequence, $x_k = T_L y_k$ turns out to be solution and the proximal gradient inequality plays a key role in the proof. 

#### **Lemma 1 | Closed form recurrence**
> Let $(y_k)_{k \in \N}, \alpha_k$ be any sequenced used to parameterize the estimating sequence $\phi_k: \R^n \mapsto \R$, then the recursive definition of $\phi_k$ in canonical form satisfies recurrence relationship for all $k \in \N$: 
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
>         h(T_L y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
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

**Proof**

Substitution to the recursive definition of $\phi_k$ yields: 

$$
\begin{aligned}
    \phi_{k + 1}(x) &= 
    (1 - \alpha_k)\phi_k(x) + \alpha_k (l_h(x; y_k) + \mu/2\Vert x - y_k\Vert^2)
    \\
    &= 
    (1 -\alpha_k)
    \left(
        \phi_k^* + \gamma_k/2\Vert x - v_k\Vert^2
    \right) 
    + 
    \alpha_k
    \left(
        l_h(x; y_k) + \mu/2\Vert x - y_k\Vert^2
    \right), 
    \rightarrow \textcolor{red}{(\text{eqn1})}
    \\
    \implies 
    \nabla \phi_{k + 1}(x) 
    &= 
    (1 - \alpha_k)\gamma_k(x - v_k) + \alpha_k(g_k + \mu (x - y_k));
    \\
    \implies 
    \nabla^2 \phi_{k + 1}(x) &= 
    \underbrace{((1 - \alpha_k)\gamma_k + \alpha_k \mu)}_{=\gamma_{k + 1}}I; 
\end{aligned}
$$

The recurrence relations for $\gamma_k$ is verified by considering the second order derivative to $\phi_k$. 
To see the recurrence relations for $v_{k + 1}$, we consider setting the gradient to $\mathbf 0$ and then solve for it. 
It's giving us: 

$$
\begin{aligned}
    \mathbf 0 &= 
    \gamma_k(1 - \alpha_k)(x - v_k) + \alpha_k g_k + \mu \alpha_k(x - y_k)
    \\
    &= (\gamma_k(1 - \alpha_k) + \mu \alpha_k)x - 
    \gamma_k(1 - \alpha_k)v_k + \alpha_k g_k - \mu \alpha_k y_k
    \\
    \iff 
    v_{k + 1} &= 
    \gamma_{k +1}^{-1} 
    \left(
        \gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k
    \right). 
\end{aligned}
$$

Substituting the canonical form of $\phi_{k + 1}$ back to `eqn1`, choose $x = y_k$, it gives the following 

$$
\begin{aligned}
    \phi_{k + 1}^* 
    &= (1 - \alpha_k)\phi_k^* + \frac{(1 - \alpha_k)\gamma_k}{2}\Vert y_k - v_k\Vert^2   
    \\
    & \quad 
    - \frac{\gamma_{k + 1}}{2}\Vert y_k - v_{k + 1}\Vert^2 
    + 
    \alpha_k\left(
        h(T_k y_k) + 
        \frac{1}{2L} \Vert g_k\Vert^2
    \right). 
    \rightarrow 
    \textcolor{red}{(\text{eqn2})}
\end{aligned}
$$

Next move from Nesterov was to simplify the term $\Vert v_{k + 1} - y_k\Vert^2$. 
With that it produces: 

$$
\begin{aligned}
    v_{k + 1} - y_k 
    &= 
    \gamma_{k + 1}^{-1}
    \left(
        \gamma_k(1 - \alpha_k) v_k - \alpha_k g_k + \mu \alpha_k y_k
    \right) - y_k
    \\
    &= 
    \gamma_{k + 1}^{-1}
    \left(
        \gamma_k(1 - \alpha_k)v_k - \alpha_k g_k 
        + (-\gamma_{k + 1} + \mu\alpha_k)y_k
    \right)
    \\
    &
    \textcolor{gray}{
        \begin{aligned}
            \gamma_{k + 1} &=    
            (1 - \alpha_k)\gamma_k + \mu \alpha_k
            \\
            -(1 - \alpha_k)\gamma_k
            &= - \gamma_{k + 1} + \mu \alpha_k
        \end{aligned}
    }
    \\
    &=
    \gamma_{k + 1}^{-1}
    \left(
        \gamma_k(1 - \alpha_k)v_k - \alpha_k g_k - 
        (1 - \alpha_k)\gamma_ky_k
    \right)
    \\
    &= 
    \gamma_{k + 1}^{-1}(
        \gamma_k(1 - \alpha_k)(v_k - y_k) 
        - \alpha_k g_k
    ).
\end{aligned}
$$

Next we have

$$
\begin{aligned}
    \Vert v_{k + 1} - y_k\Vert^2 
    &= 
    \Vert 
        \gamma_{k + 1}^{-1}(
            \gamma_k(1 - \alpha_k)(v_k - y_k) 
            - \alpha_k g_k
        )
    \Vert^2
    \\
    \frac{- \gamma_{k + 1}}{2}
    \Vert v_{k + 1} - y_k\Vert^2
    &= 
    - \frac{1}{2\gamma_{k + 1}}
    \Vert 
        \gamma_k(1 - \alpha_k)(v_k - y_k) - \alpha_k g_k
    \Vert^2
    \\
    &= 
    -\frac{\gamma_k^2 (1 - \alpha_k)^2}{2 \gamma_{k + 1}} 
    \Vert v_k - y_k\Vert^2 - 
    \frac{\alpha_k^2}{2 \gamma_{k + 1}} \Vert g_k\Vert^2
    + 
    \gamma_k(1 - \alpha_k)\gamma_{k + 1}^{-1} \langle v_k - y_k, \alpha_k g_k\rangle. 
\end{aligned}
$$

Substituting it back to `eqn2`, this produces: 

$$
\begin{aligned}
    \phi_{k + 1}^* &= 
    (1 - \alpha)\phi_k^* + 
    \alpha_k
    \left(
        h(T_ky_k) + 
        \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    \\
    &\quad 
    + \frac{(1 - \alpha_k)\gamma_k}{2}\Vert y_k - v_k\Vert^2
    - \frac{\gamma_k^2(1 - \alpha_k)^2}{2\gamma_{k + 1}}\Vert v_k - y_k\Vert^2
    - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    \\
    &\quad 
    + \alpha_k\gamma_k(1 - \alpha_k)\gamma_{k + 1}^{-1}\langle v_k -y_k, g_k\rangle
    \\
    &= 
        (1 - \alpha)\phi_k^* + 
        \alpha_k
        \left(
            h(T_ky_k) + 
            \frac{1}{2L}\Vert g_k\Vert^2
        \right)
        \\
        &\quad 
        + 
        \left(
            \frac{(1 - \alpha_k)\gamma_k}{2}
            - 
            \frac{\gamma_k^2(1 - \alpha_k)^2}{2\gamma_{k + 1}}
        \right)
        \Vert v_k - y_k\Vert^2
        - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
        \\
        &\quad 
        + \alpha_k\gamma_k(1 - \alpha_k)\gamma_{k + 1}^{-1}\langle v_k -y_k, g_k\rangle
    \\
    & \quad 
    \textcolor{gray}{  
        \begin{aligned}
            \frac{(1 - \alpha_k)\gamma_k}{2}
            - 
            \frac{\gamma_k^2(1 - \alpha_k)^2}{2\gamma_{k + 1}}   
            &= 
            \frac{(1 - \alpha_k)\gamma_k}{2}
            \left(
                1 - \frac{\gamma_k (1 - \alpha_k)}{\gamma_{k + 1}}
            \right)
            \\
            &= 
            \frac{(1 - \alpha_k)\gamma_k}{2}
            \left(
                \frac{\gamma_{k + 1} - \gamma_k(1 - \alpha_k)}{\gamma_{k + 1}}
            \right)
            \\
            &= 
            \frac{(1 - \alpha_k)\gamma_k}{2}
            \left(
                \frac{\mu \alpha_k}{\gamma_{k + 1}}
            \right). 
        \end{aligned}
    }
    \\
    \iff 
    &= 
        (1 - \alpha)\phi_k^* + 
        \alpha_k
        \left(
            h(T_ky_k) + 
            \frac{1}{2L}\Vert g_k\Vert^2
        \right)
        \\
        &\quad 
        + 
        \frac{(1 - \alpha_k)\gamma_k}{2}
        \left(
            \frac{\mu \alpha_k}{\gamma_{k + 1}}
        \right)
        \Vert v_k - y_k\Vert^2
        - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
        \\
        & \quad 
        + \alpha_k\gamma_k(1 - \alpha_k)\gamma_{k + 1}^{-1}\langle v_k -y_k, g_k\rangle
    \\
    &= 
        (1 - \alpha)\phi_k^* 
        + 
        \alpha_k
        \left(
            h(T_ky_k) + 
            \frac{1}{2L}\Vert g_k\Vert^2
        \right)
        \\
        &\quad 
        - 
        \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
        + 
        \frac{(1 - \alpha_k)\gamma_k\alpha_k}{\gamma_{k + 1}}
        \left(
            \frac{\mu}{2}\Vert v_k - y_k\Vert^2
            + \langle v_k - y_k, g_k\rangle
        \right). 
\end{aligned}
$$

The proof is now done. 
A recurrence relations based on the definition of the Nesterov's estimating sequence had been established upon the canonical form parameters: $(\phi_k^*, \gamma_k, v_k)$. 




#### **Lemma 2 | Looking for the descent sequence**
> Let $(y_k)_{k \in \N}$, and $(\alpha_k)_{k \in \N}, \alpha_i \in (0, 1)\;\forall i \in \N$, suppose that there exists estimating sequence $\phi_k: \R^n \mapsto \R$ defined via canonical form parameters $(\phi_k^*, v_k)_{k \in \N}, (\gamma_k)_{k \in \N}$ satisfying recurrence relations 
> $$
> {\small
> \begin{aligned}
>     & \gamma_{k + 1} = (1 - \alpha_k) \gamma_k + \mu \alpha_k
>     \\
>     & 
>     v_{k + 1} = \gamma_{k + 1}^{-1}
>     (\gamma_k( - \alpha_k)v_k - \alpha_k g_k + \mu \alpha_k y_k)
>     \\
>     & 
>     \phi_{k + 1}^* = 
>     (1 - \alpha_k)\phi_k^*
>     + \alpha_k\left(
>         h(T_k y_k) + \frac{1}{2L}\Vert g_k\Vert^2 
>     \right) 
>     - \frac{\alpha_k}{2 \gamma_{k + 1}} \Vert g_k\Vert^2 
>     + 
>     \frac{\alpha_k(1 - \alpha_k)\gamma_k}{\gamma_{k + 1}} 
>     \left(
>         \frac{\mu}{2}\Vert v_k - y_k\Vert^2 
>         + \langle v_k - y_k , g_k\rangle
>     \right). 
> \end{aligned}
> }
> $$
> If there exists choice of the sequences $(\alpha_k)_{k \in \N}, (\gamma_k)_{k \in \N}$ and vector sequences $(v_k)_{k \in \N}$ satisfying inequalities: 
> $$
> \begin{aligned}
>     \frac{1}{2L} - \frac{\alpha_k^2}{2 \gamma_{k + 1}} &\ge 0, 
>     \\
>     \frac{\alpha_k \gamma_k }{\gamma_{k + 1}} 
>     (v_k - y_k) + (T_L y_k - y_k) &= \mathbf 0. 
> \end{aligned}
> $$
> Then $(T_Ly_k)_{\in \N}$ is a vector sequence satisfies implicit descent condition $f(T_L y_k) \le \phi_k^*$. 
> Therefore, the Nesterov's descent sequence exists. 

**Proof**


To start, we inductively assume that $\phi_k^* \ge h(x_k)$ for our sequence $(x_i)_{i \le k}$. 

$$
{\small
\begin{aligned}
    \phi_{k + 1}^* &= 
    (1 - \alpha_k) \phi_k^*
    + 
    \alpha_k
    \left(
        h(T_Ly_k) + \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    + \frac{\alpha_k (1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \left(
        \frac{\mu}{2}\Vert v_k - y_k\Vert^2 + \langle v_k - y_k, g_k\rangle
    \right)
    \\
    \implies 
    &\ge 
    (1 - \alpha_k)h(x_k)
    + 
    \alpha_k
    \left(
        h(T_Ly_k) + \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    + \frac{\alpha_k (1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \left(
        \frac{\mu}{2}\Vert v_k - y_k\Vert^2 + \langle v_k - y_k, g_k\rangle
    \right)
    \\
    \implies
    &\ge 
    (1 - \alpha_k)h(x_k)
    + 
    \alpha_k
    \left(
        h(T_Ly_k) + \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    + 
    \frac{\alpha_k (1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \langle v_k - y_k, g_k\rangle. 
\end{aligned}
}
$$

The first inequality comes from the inductive hypothesis. 
The second inequality comes from the non-negativity of the term $\frac{\mu}{2}\Vert v_k - y_k\Vert^2$. 
Now, recall from the fundamental proximal gradient inequality in the convex settings, we have $\forall z\in \R^n$

$$
\begin{aligned}
    h(z) 
    &\ge 
    h(T_L y_k) + \langle g_k, z - y_k\rangle
    + 
    D_f(z, y_k) + \frac{1}{2L}\Vert g_k\Vert^2
    \\
    &\ge 
    h(T_L y_k) + \langle g_k, z - y_k\rangle
    + 
    \frac{\mu}{2}\Vert z  - y_k\Vert^2 
    + \frac{1}{2L}\Vert g_k\Vert^2
    \\
    &\ge 
    h(T_L y_k) + \langle g_k, z - y_k\rangle
    + \frac{1}{2L}\Vert g_k\Vert^2
    \\
    z = x_k \implies 
    h(x_k) 
    &\ge 
    h(T_L y_k) + \langle g_k, x_k - y_k\rangle
    + 
    \frac{\mu}{2}\Vert x_k  - y_k\Vert^2 
    + \frac{1}{2L}\Vert g_k\Vert^2. 
\end{aligned}
$$

Therefore, the RHS of $\phi_{k + 1}^*$ becomes

$$
\begin{aligned}
    \phi_{k + 1}^*
    &\ge 
    (1 - \alpha_k)
    \left(
        h(T_Ly_k) + \langle g_k, x_k - y_k\rangle + \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    \\
    &\quad 
    + 
    \alpha_k
    \left(
        h(T_Ly_k) + \frac{1}{2L}\Vert g_k\Vert^2
    \right)
    - \frac{\alpha_k^2}{2\gamma_{k + 1}}\Vert g_k\Vert^2
    + 
    \frac{\alpha_k (1 - \alpha_k)\gamma_k}{\gamma_{k + 1}}
    \langle v_k - y_k, g_k\rangle
    \\
    & =
    h(T_Ly_k)
    + 
    \left(
        \frac{1}{2L} - \frac{\alpha_k^2}{2\gamma_{k + 1}}
    \right)\Vert g_k\Vert^2
    + 
    (1 - \alpha_k)
    \left\langle 
        g_k, \frac{\alpha_k\gamma_k}{\gamma_{k + 1}}(v_k - y_k) + (x_k - y_k)
    \right\rangle. 
\end{aligned}
$$

If we assume exact equality of the form $x_k = T_L y_k$, then it requires to have conditions: 

$$
\begin{aligned}
    \frac{1}{2L} - \frac{\alpha_k^2}{2\gamma_{k + 1}} 
    &\ge 0, 
    \\
    \frac{\alpha_k \gamma_k}{\gamma_{k + 1}}(v_k - y_k) &= y_k - x_k. 
\end{aligned}
$$

These conditions can be simplified and written in a prettier way: 

$$
\begin{aligned}
    1 - \frac{L \alpha_k^2}{\gamma_{k + 1}}
    &\ge 0
    \\
    1 &\ge L \alpha_k^2 / \gamma_{k + 1}
    \\
    \gamma_{k + 1} &\ge L \alpha_k^2
    \\
    L\alpha_k^2 
    &\le
    \gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu \alpha_k. 
\end{aligned}
$$

For simplicity, people choose the equality case in the literature. 
For the other one it has 

$$
\begin{aligned}
    -(\alpha_k \gamma_k\alpha_{k + 1}^{-1} + 1)y_k
    &= 
    - \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k - x_k
    \\
    y_k &= 
    \frac{
        \alpha_k \gamma_k \gamma_{k + 1}^{-1}v_k + x_k
    }{1 + \alpha_k \gamma_k \gamma_{k + 1}^{-1}}
    \\
    & 
    \textcolor{gray}{
        \gamma_{k + 1} + \alpha_k \gamma_k 
        = 
        \gamma_k + \alpha_k \mu
    }
    \\
    &=  
    \frac{\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k}{\gamma_k + \alpha_k \mu}. 
\end{aligned}
$$


**Remarks**

1. $(\gamma_k)$ has a closed form. 
2. The alternative choice of $L\alpha_k \le (1 - \alpha_k)L \alpha_{k - 1}^2 + \mu \alpha_k$. 
3. $L\alpha_k^2 = \gamma_{k + 1}$ and $\mu = 0$ then $\phi_k^* = h(x_k)$. 

**Closed form sequence**

Furthermore, there is a closed form for the expression for scalar quantity $(\lambda_k)_{k \ge0}$: 

$$
\begin{aligned}
    \gamma_{k + 1} &= 
    (1 - \alpha_k)\gamma_k + \mu \alpha_k
    \\
    \gamma_{k + 1} - \mu 
    &= (1 - \alpha_k)(\gamma_k - \mu)
    = 
    \left(
        \prod_{i = 0}^{k} 
        (1 - \alpha_i)
    \right)(\gamma_0 - \mu)
    \\
    \gamma_{k + 1}
    &= 
    \left(
        \prod_{i = 0}^{k} 
        (1 - \alpha_i)
    \right)(\gamma_0 - \mu)
    + \mu. 
\end{aligned}
$$

If $\gamma_{k} \ge 0$, so that it make sense to have $\phi_k^*$ exists as the minimum of the estimating sequence, we have initially $\gamma_0 \ge \mu$. 

**The special inequality**

usually in the literature, people assume equality $\gamma_{k + 1} = L \alpha_k^2$, but a sufficient condition for the parameters $\alpha_k$ such that it works is: 

$$
\begin{aligned}
    (\forall k \ge 0) \quad 
    L \alpha_k^2 \le (1 - \alpha_k)L \alpha_{k - 1}^2 + \mu \alpha_k. 
\end{aligned}
$$

Because if $L\alpha_{k - 1}^2 \le \gamma_k$ inductively, then the above expression asserts $\alpha_k \le (1 - \alpha_k)\gamma_k + \mu \alpha_k$, so the inequality is satisfied. 
The convergence rate would still be upper bounded by a Big O of $\prod_{i = 0}^k(1 - \alpha_i)$. 
The fastest convergence rate is achieved by taking the equality, because we want $\alpha_i$ to be as large as possible to achieve good convergence. 


**The equality case**

When $\mu = 0$ and we adopt the equality of $L\alpha_k^2 = (1 - \alpha_k) L \alpha_{k - 1}^2$. 
If equality is adopted with $L \alpha_k^2 = (1 - \alpha_k)L \alpha_{k - 1}^2$, then starting with the Inductive hypothesis of $\phi_k^* = h(x_k)$ will result in $\phi_{k + 1}^* = h(x_{k + 1})$. 
We can't stop but wonder. 
What if we make strong inductive hypothesis and try to figure out what exactly is $\phi_k^*$ in the form of $\phi^*_k \ge h(x_k) + (?)$ or maybe even $\phi^*_k = h(x_k) + (?)$. 



---
#### **Simplifying the algorithm into a simpler form**

The procedures here are very similar to what is in the original accelerated gradient method using Nesterov's acceleration method. 
The simplifications of the algorithm is derived in [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md). 
The analysis is done under a different context. 
In here we will just list the results obtained from the analysis. 
All we need for results of this section is to assume that for all $k \ge 0$: 

$$
\begin{aligned}
    & L\alpha_k^{2} = (1 - \alpha_k) L \alpha_{k - 1}^{-1} + \mu\alpha_k
    \\
    & \alpha_k \in (0, 1). 
\end{aligned}
$$


#### **Proposition | Nes 2.2.19 Intermediate Form**
> The Nesterov 2.2.19 algorithm which is given by the following rules of updates for the sequence of vector $(y_k, x_k, v_k)$ and scalars $(\gamma_k, \alpha_k)$ with Lipschitz constant and strong convexity constant $L, \mu$ is given by:  
> $$
> \begin{aligned}
>     L\alpha_k^2 
>     &\le 
>     (1 - \alpha_k)\gamma_k + \alpha_k\mu = \gamma_{k + 1}, 
>     \\
>     y_k &= (\gamma_k + \alpha_k \mu)^{-1}
>     (\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k),
>     \\
>     x_{k + 1}&= 
>     y_k - L^{-1} g_k, 
>     \\
>     v_{k + 1} &= 
>     \gamma_{k + 1}^{-1}
>     \left(
>         (1 - \alpha_k)\gamma_k v_k + \alpha_k \mu y_k - \alpha_k  g_k
>     \right). 
> \end{aligned}
> $$
> Then the above iterates can be expressed without the sequence $(\gamma_k)_{k \ge0}$ if we assume the equality: $L\alpha_k^2 = \gamma_{k + 1}$, producing: 
> $$
> \begin{aligned}
>     y_k &= 
>     \left(
>         1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
>     \right)
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1}  g_k
>     \\
>     v_{k + 1} &= 
>     \left(
>         1 + \frac{\mu}{L \alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{\mu}{L \alpha_k - \mu}\right) y_k
>     \right) - \frac{1}{L\alpha_{k}} g_k
>     \\
>     0 &= \alpha_k^2 - \left(\mu/L - \alpha_{k -1}^2\right) \alpha_k - \alpha_{k - 1}^2. 
> \end{aligned}
> $$

#### **Proposition | Similar Triangle Representation of the intermediate form**

> The intermediate form also admits similar triangle representation for the iterates $v_{k +1}$ which is given by: 
> $$
> \begin{aligned}
>     v_{k + 1} &= 
>     x_{k + 1} + \left(
>         \alpha_k^{-1} - 1
>     \right)(x_{k + 1} - x_k). 
> \end{aligned}
> $$

#### **Proposition | Final Momentum Form**
> Let $x_k, v_k y_k, \alpha_k$ be given by the previous 2 propositions, we have the Momentum method to be given by: 
> $$
> \begin{aligned}
>     x_{k + 1} &= 
>     y_k - L^{-1}g_k
>     \\
>     y_{k + 1} &= 
>     x_{k + 1} + 
>     \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
> \end{aligned}
> $$
> And the sequence $(\alpha_k)_{k \in \N}$ satisfies $L\alpha_k^2 = (1 - \alpha_k)L \alpha_{k - 1}^2 + \mu \alpha_k$ for all $k \ge 0$. 

**Remark**

It's 2.2.20, 2.2.63 in Nesterov's book but with proximal gradient in our case. 


---
### **Rate of convergence**

The derivation for the rate of convergence is complicated. 
Here we found a proof in the literatures that is easier to work with than the other proofs found in the literature. 
There are 2 cases for the rate of convergence of the algorithm. 
1. $\mu = 0$. The convergence rate of the algorithm is sublinear. 
2. $\mu > 0$. The convergence rate of the algorithm is linear. 




