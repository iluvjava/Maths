- [Nesterov Original Conception of Momentum Method](Nesterov%20Original%20Conception%20of%20Momentum%20Method.md)
- [Fundamental Proximal Gradient Inequality](Fundamental%20Proximal%20Gradient%20Inequality.md)

--- 
### **Intro**

To begin, define 
1. $f$ to be convex, $L$ Lipschitz smooth and $\mu \ge 0$ strongly convex. 
2. $g$ is convex. 
3. $h = g + g$
4. $T_L = (I + L^{-1} \partial g)^{-1}(I - L^{-1}\nabla f)$, which is the proximal gradient operator. 

Consider the following definitions for $k \in \N$ and any sequence $(y_k)_{k \in \N}$ and $(\alpha_k)_{k \in \N}$ where $\alpha_i \in (0, 1)$ for all $i \in \N$, we define: 

$$
\begin{aligned}
    & g_k := L(y_k - TL y_k) \quad \text{Gradient mapping }, 
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
Assume that $x_0$ is a minimizer and $f_* = f(x_*)$ then it assists with proving he convergence rate of $f(x_k) - f_*$. 

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

hence, it creates a convergence rate parameterized recurrence parameter $\alpha_k$ used for the estimating sequence $\phi_k$. 


---
### **Solving the Recurrence of the canonical form of the estimating sequence**

Parameterizing the canonical form recursively and couple it with $(y_k)_{k \in \N}$ is very useful for solving $x_k$ that satisfies the implicit descent relation. 

#### **Lemma 1 | Closed form recurrence**
> Let $(y_k)_{k \in \N}, \alpha_k$ be any sequenced used to parameterize the estimating sequence $\phi_k: \R^n \mapsto \R$, then the recursive definition of $\phi_k$ in cannonical form satisfies recurrence relationship for all $k \in \N$: 
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

**Proof**


#### **Lemma 2 | Looking for the descent sequence**
> Let $(y_k)_{k \in \N}$, and $(\alpha_k)_{k \in \N}, \alpha_i \in (0, 1)\;\forall i \in \N$, suppose that there exists estimting sequence $\phi_k: \R^n \mapsto \R$ defined via cannonical form parameters $(\phi_k^*, v_k)_{k \in \N}, (\gamma_k)_{k \in \N}$ satisfying recurrence relations 
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
> If there exists choice of the sequences $(\alpha_k)_{k \in \N}, (\gamma_k)_{k \in \N}$ and vector sequences $$satisfying inequalities: 
> $$
> \begin{aligned}
>     \frac{1}{2L} - \frac{\alpha_k^2}{2 \gamma_{k + 1}} &\le 0, 
>     \\
>     \frac{\alpha_k \gamma_k }{\gamma_{k + 1}} 
>     (v_k - y_k) + (T_L y_k - y_k) &= \mathbf 0. 
> \end{aligned}
> $$
> Then $(T_Ly_k)_{\in \N}$ is a vector sequence satisfies implicit descent condition $f(T_L y_k) \le \phi_k^*$. 
> Therefore, the Nesterov's descent sequence exists and it's possible. 

**Proof**
