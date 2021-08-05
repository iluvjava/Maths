[[Hessenberg Transform with Arnoldi Iterations]],
[[Hessenberg Transform intro (HS Reflector)]]

---
### **Intro**

Arnoldi Iterations, but this time for Hermitian Matrices. 

This has an intimate link to the Conjugate Gradient Algorithm. 

Let $A$ be a Hermitian Matrix and Consider it in Hessenberg Form:

$$
\begin{aligned}
    A &= QHQ^H
    \\
    A^H &= QH^TQ^H
    \\
    A &= A^H
    \\
    \implies H &= H^H
\end{aligned}
$$

The Hessenberg zeros below the sub-diagonal, if $H^H = H$, then $H$ is a Tri-diagonal Matrix and it's Symmetric: 

$$
H = \begin{bmatrix}
    \alpha_1 & \beta_1 & 0 & \cdots & 0
    \\
    \beta_1 & \alpha_2 & \beta_2 & \cdots & 0
    \\
    0 & \beta_2 & \alpha_3 & \cdots & 0
    \\
    \vdots & & & \ddots
    \\
    0 & \cdots & 0 & \beta_{n - 1} & \alpha_n 
\end{bmatrix}
$$

$$
\begin{aligned}
    AQ &= QH
    \\
    [AQ]_{:, 1< k < n} &= \beta_{k - 1}q_{k - 1} + \alpha_{k}q_k + \beta_{k}q_{k + 1}
    \\
    [AQ]_{:, 1} &= \alpha_1 q_1 + \beta_1 q_2
    \\
    [AQ]_{:, n} &= \beta_{n - 1}q_{n - 1} + \alpha_n q_n
\end{aligned}
$$

---
### **Algorithm**
With the assumption that $A$ is symmetric, or Hermitian, we can formulate the Lancosz algorithm as the following: 

> $$
> \begin{aligned}
>     &q_1 = \frac{b}{\Vert b\Vert}, \beta_0 = 0
>     \\
>     &\text{for } k = 1, 2, \cdots
>     \\
>     &\hspace{2em}
>     \begin{aligned}
>         & \tilde{q}_{k + 1} = Aq_k - \beta_{k - 1}q_{k - 1}
>         \\
>         & \alpha_k = \langle \tilde{q}_{k + 1}, q_k\rangle
>         \\
>         & \tilde{q}_{k + 1} = \tilde{q}_{k + 1} - \alpha_k q_{k}
>         \\
>         & \beta = \Vert \tilde{q}_{k + 1}\Vert
>         \\
>         & q_{k + 1} = \tilde{q}_{k + 1}/\beta_k
>     \end{aligned}
> \end{aligned}
> $$

Compare to Arnoldi algorithm, the complexity is smaller and it's much similar since we don't need to subtract the projections onto all previous $q_{i<k}$. 

**Hidden Conjugate Vectors**

Uroll the Algorithm, skipping some steps, we have the following relations between the new vector, $\tilde{q}_{k + 1}$, which is the new un-normalized vector from the Lancosz Algorithm, and previous 2 normalized eigenvector $q_{k}, q_{k - 1}$, giving us: 

$$
\begin{aligned}
    \tilde{q}_{k + 1} &= Aq_k - \langle q_k, Aq_k\rangle q_k - \langle Aq_k, q_{k - 1}\rangle q_{k - 1}
    \\
    \beta_j q_{k + 1} &= Aq_k - \langle q_k, Aq_k\rangle q_k - \langle Aq_k, q_{k - 1}\rangle q_{k - 1}
    \\
    Aq_k &= \langle q_k, Aq_k\rangle q_k + \langle Aq_k, q_{k - 1}\rangle q_{k - 1} + \beta_j q_{k + 1}
\end{aligned}
$$

Observe that $Aq_k$ will be conjugate vectors with $q_j$ where $j < k - 1$. 

