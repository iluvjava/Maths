[[Modified GS Process]]
[[Conjugate Gradient for Dummy]]


---
### **Intro**

This routine is brought up under the general context of generatin short recurrences for the Conjugate Gradient Algorithm. 

Given a basis set, the algorithm generate another basis of vector that is $A$ orthogonal. Here we assume that the matrix $A$ is A-Orhogonal. The formula is given as: 

$$
\begin{aligned}
    p^{(k)} &= u_{k} + \sum_{i = 1}^{k - 1}
        \beta_{k, i} p^{(i)}
    \\
    p^{(m)T}Ad^{(k)} &= p^{(m)T}Au_{k} + p^{(m)T}A 
        \sum_{i = 1}^{k - 1}\beta_{k, i}p^{(i)}
    \\
    0 &= p^{(m)T}Au_{k} + \beta_{k, m}p^{(m)T}Ap^{(m)}
    \\
    \beta_{k, m} &= 
    - \frac
    {
        p^{(m)T}Au_{k}
    }
    {
        \Vert p^{(m)}\Vert_A^2
    }
\end{aligned}
$$

We are using subscript instead of super script. One can write it in matrix form, let $D_k$ dentoes the diagonal matrix of $\langle p_i, Ap_i\rangle$. Let $P_{k - 1}$ be the matrix whose columns are the basis set: $\{p_1, p_2, \cdots,p_{k - 1}\}$, and $U_{k - 1}$ in a smilar way for the basis $\{u_i\}_{i = 1}^{k - 1}$ then: 

$$
\begin{aligned}
    p_k &= u_{k} - P_{k - 1}D_{k - 1}^{-1}P_{k - 1}^TAU_{k - 1}
\end{aligned}
$$

Use a new vector $u_k$ for getting the next A orthogonal vector. Next, we check whether $p_k$ is orthgonal too all previous directions $P_{k - 1}$. 






