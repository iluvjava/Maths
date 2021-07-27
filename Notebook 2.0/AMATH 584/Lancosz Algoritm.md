[[Hessenberg Transform with HR Reflector]],
[[Eigen Decomp (Hessenberg Transform)]]

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

The Hessenberg zeros below the sub-diagonal, if $H^H = H$, then $H$ is a Tria-diagonal Matrix and it's Symmetric: 

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
    (AQ)_{:, 1< k < n} &= \beta_{k - 1}q_{k - 1} + \alpha_{k}q_k + \beta_{k}q_{k + 1}
\end{aligned}
$$




