- [PPM APG Forms Analysis](PPM%20APG%20Forms%20Analysis.md)
- [FISTA Made Simple Part IV](FISTA%20Made%20Simple%20Part%20IV.md)

---
### **Intro**

We declare a non-dimensionalized description of Nesterov's accelerated gradient, and analyze the relations between its iterates. 
The similar triangle form is produced via a valid estimating sequence approach for Nesterov's accelerated gradient method. 

We first do that without using the relaxed momentum sequence, we next do that with the
knowledge of the sequence. 

**Notations**.
$T_B(x)$ is the proximal gradient operator for a smooth plus non-smooth objective. 
$\mathcal G_B(x) = B^{-1}(x - T_B(x))$ is the proximal gradient mapping. 




#### **Definition | similar triangle form of accelerated proximal gradient (nondimensionalize)**
> The definition is about $((\alpha_k)_{k \ge 0}, (q_k)_{k \ge 0}, (B_k)_{k \ge 0}, (y_k)_{k \ge 0}, (x_k)_{k \ge -1}, (v_k)_{k \ge -1})$. 
> Define the following. 
> - $x_{-1}, y_{- 1}\in \R^n$ are arbitrary initial condition of the algorithm. 
> - $(q_k)_{k \ge 1}$ be a sequence such that $q_k \in [0, 1)$ for all $k \ge 1$. 
> - $(\alpha_k)_{k \ge 1}$ be a sequence such that $\alpha_0 \in (0, 1]$, and for all $k \ge 1$ it has $\alpha_k \in (q_k, 1)$
> - The sequence $(B_k)_{k \ge 0}$ has $B_k \ge 0$. 
> 
> Then an algorithm satisfies the similar triangle form of Nesterov's accelerated gradient if it generates iterates $(y_k, x_k, v_k)_{k \ge 1}$ such that for all $k\ge 0$: 
> $$
> \begin{aligned}
>     y_k &= \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} 
>     + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1},
>     \\
>     x_k &= T_{L_k}(y_k), D_f(x_k, y_k) \le \frac{B_k}{2}\Vert x_k - y_k\Vert^2, 
>     \\
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1}). 
> \end{aligned}
> $$

**Observations**
- $y_k$ is a convex combination of $x_{k - 1}, v_{k - 1}$, if $1 \ge \alpha_k \ge q_k$. 
- $v_k$ is an extrapolation term between $x_{k - 1}$, $x_k$, in the direction of $x_k - x_{k - 1}$. 


#### **Definition | Relaxed Momentum Sequence Relations**
> The following definition is about sequences $((\alpha_k)_{k \ge 0}, (q_k)_{k \ge 0}, (\rho_k)_{k \ge 0})$. 
> Let 
> - $(q_k)_{k \ge 0}$ is a sequence such that $q_k \in [0, 1)$ for all $k \ge 0$. 
> - $(\alpha_k)_{k \ge 0}$ be such that $\alpha_0 \in (0, 1]$, and for all $k \ge 1$ it has $\alpha_k \in (q_k, 1)$
> - $(\rho_k)_{k \ge 0}$ is a strictly positive sequence for all $k \ge 1$. 
>
> The sequences $q_k, \alpha_k$ are considered relaxed momentum sequence if for all $k \ge 1$ it satisfies the relation that: 
> $$
> \begin{aligned}
>     \rho_{k - 1} &= \frac{\alpha_k(\alpha_k - q_k)}{(1 - \alpha_{k})\alpha_{k - 1}^2}. 
> \end{aligned}
> $$

---
### **Choices of the parameters**

Different choices of parameters for the Similar Triangle Form yields different variants of Nesterov's accelerated proximal gradient method in practice. 

---
### **Equivalent representations of its iterates**

This section explores alternative representations of the iterates from the similar triangle form of the algorithm. 

#### **Theorem | Equivalent representations of $v_k$**
> Suppose that the sequences of $\alpha_k, q_k, y_k, v_k, x_k, B_k$ satisfy the similar triangle form, then for all $k \ge 0$ the iterates $v_k$ admits the following equivalent representations: 
> $$
> \begin{aligned}
>     v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1})
>     \\
>     &= v_{k - 1} + \alpha_k^{-1}q_k(y_k - v_{k - 1}) - \alpha_{k}^{-1}B_k^{-1}\mathcal G_{B_k}(y_k). 
> \end{aligned}
> $$

**Proofs**

Consider all $k \ge 1$. 
The relations is direct, immediately from the update rule of $y_k$ we have
- (a): $(\alpha_k - 1)x_{k - 1} = (\alpha_k - q_k)v_{k - 1} - (1 - q_k)y_k$. 
- (b): $x_k = y_k - B_k^{-1}\mathcal G_{B_k}(y_k)$. 

Now consider the similar triangle form: 

$$
\begin{aligned}
    v_k &= x_{k - 1} + \alpha_k^{-1}(x_k - x_{k - 1})
    \\
    &= (1 - \alpha_k^{-1})x_{k - 1} + \alpha_k^{-1}x_k
    \\
    &= \alpha_k^{-1}(\alpha_k - 1)x_{k - 1} + \alpha_k^{-1}x_k
    \\
    &\underset{\text{(a)}}{=} \alpha_k^{-1}(\alpha_k - q_k)v_{k - 1} - \alpha_{k}^{-1}(1 - q_k)y_k 
    + \alpha_k^{-1}x_k
    \\
    &\underset{\text{(b)}}{=} (1 - \alpha_k^{-1}q_k) v_{k - 1} - (\alpha_k^{-1} - \alpha_k^{-1}q_k)y_k
    + \alpha_k^{-1}(y_k - B_k^{-1}\mathcal G_{B_k}(y_k)). 
    \\
    &= 
    (1 - \alpha_k^{-1}q_k) v_{k - 1} + \alpha_k^{-1}q_ky_k
    - \alpha_k^{-1}B_k^{-1}\mathcal G_{B_k}(y_k)
    \\
    &= v_{k - 1} + \alpha_k^{-1}q_k(y_k - v_{k - 1}) - \alpha_{k}^{-1}B_k^{-1}\mathcal G_{B_k}(y_k). 
\end{aligned}
$$

$\blacksquare$

#### **Theorem | Equivalent representations of $y_k$**
> Suppose the sequences of $\alpha_k, q_k, y_k, v_k, x_k, B_k$ satisfy the similar triangle form, then for all $k \ge 0$ the iterates $v_k$ admits the following equivalent representations: 
> $$
> \begin{aligned}
>     y_k &= 
>     x_{k -1} + (1 - q_k)^{-1}(\alpha_{k - 1} - 1)(\alpha_k - q_k)(x_{k - 1} - x_{k - 2})
>     \\
>     &= \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1}. 
> \end{aligned}
> $$

**Proof**

For all $k\ge 1$ it has 

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

Multiplying $(1 - q_k)$ on both sides and continue simplifying gives: 

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


---
### **Relations between the iterates**

This section is exclusively about the relationship between the iterates of the similar triangle form. 


#### **Theorem | the same line relation**
> Suppose the sequences of $\alpha_k, q_k, y_k, v_k, x_k, B_k$ satisfy the similar triangle form. 
> Suppose in addition that the sequence $(\alpha_k)_{k \ge 0}$ is a generalized momentum sequence. 
> Then for all $k \ge 0$, the iterates $y_k, x_{k - 1}, v_{k - 1}$ are on the same line and, they satisfy: 
> $$
> \begin{aligned}
>     y_k - v_{k - 1} &= 
>     \left(
>         \frac{1 - \alpha_k}{1 - q_k}
>     \right)(x_{k - 1} - v_{k - 1}), 
>     \\
>     y_k - x_{k - 1} &= 
>     \left(
>         \frac{\alpha_k - q_k}{1 - q_k}    
>     \right)(v_{k - 1} - x_{k - 1}). 
> \end{aligned}
> $$

**Proof**

The proof is super direct from the fact that $y_k$ is a convex combination of $x_{k - 1}, v_{k - 1}$ because: 

$$
\begin{aligned}
    y_k &= 
    \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} 
    + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1}
    \\
    &= 
    \left(
        1 - \frac{1 - \alpha_k}{1 - q_k}
    \right)v_{k - 1} 
    + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1}
    \\
    \iff 
    y_k - v_{k - 1}
    &= \left(
        \frac{1 - \alpha_k}{1 - q_k}
    \right)(x_{k - 1} - v_{k - 1}). 
\end{aligned}
$$

Similarly: 

$$
\begin{aligned}
    y_k &= 
    \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} 
    + \left(\frac{1 - \alpha_k}{1 - q_k}\right) x_{k - 1}
    \\
    &= 
    \left(\frac{\alpha_k - q_k}{1 - q_k}\right)v_{k - 1} 
    + \left(1 - \frac{\alpha_k - q_k}{1 - q_k}\right) x_{k - 1}
    \\
    \iff 
    y_k - x_{k - 1} &= 
    \left(
        \frac{\alpha_k - q_k}{1 - q_k}
    \right)(v_{k - 1} - x_{k - 1}). 
\end{aligned}
$$
$\blacksquare$

