[[Exact Conjugate Gradient Convergence]]
[[From Lanczos to Conjugate Gradient]]


---
### **Intro**

Floating point changes the expected behavior of the conjugate algorithm. It's significant and it will affect the algorithm by a huge margin. And it's behaviors are closely related to [[Lanczos Projection onto Ritz Under Floats]]. Because the residual vectors are chose in the same way as the Lanczos Vector, and the loss of orthogonality between the residual vectors affects the way Conjugate Gradient computes the results. 

The lanczos Algorithm will produce a recurrence with round off errors on: $Q, \tilde{Q}_k$ the orthogonal vectors, and hence, producing errors on the Recurrence formula itself as well. Consider: 

$$
\begin{aligned}
    A\tilde{Q}_k &= \tilde{Q}_k T_k + \beta_k\tilde{Q}_{k + 1} \xi_k^T
    \\
    &\text{Approximated by: }
    \\
    A\tilde{Q}_k &= \tilde{Q}_k T_{k + 1, k} + F_k
\end{aligned}
$$

$F_k$ is the floating error that makes the equal true, and $\tilde{Q}$ are perturbed slightly resulting in loss of orthogonality, hence we cannot assume $\tilde{Q}_k$ to be orthogonal in any kind of ways 

And we assume that $k$ is much less than the dimension of $A$, in a sense, the tridiagonal matrix is perturbed as well, as an intro, we are going to show that he Residual Error vector from this formulations with floating ponts error is: 

$$
\begin{aligned}
    r_k^C &= r_0 - A\tilde{Q}_k y_k^C
    \\
    r_k^C &= r_0 - (\tilde{Q}_k T_{k + 1, k} + F_k)y_k^C
    \\&= 
    r_0 - \tilde{Q}T_{k, k + 1} y_k^C - \beta_k q_{k + 1} \xi_k^T - F_k y_k^C
    \\&=
    r_0 - \tilde{Q}_k\beta \xi_1 - \beta_k q_{k + 1} \xi_k^T - F_k y_k^C
    \\&= 
    - \beta_k q_{k + 1} \xi_k^T - F_k y_k^C
    \\
    \frac{r_k^C}{\Vert r_0\Vert} &= 
    -q_{k + 1}\xi_k^T - F_k \frac{y_k^C}{\beta}
\end{aligned}
$$

Which, as we see, **doesn't involve any $\tilde{Q}_k$ in the expression** for the floating point rel residual error under 2 norm. The $T_k$ for the floating point version of CG is still the same one we are solving by the CG algorithm, therefore, $T_ky_k^C = \beta \xi_1$, which allows the above conclusion to be true. 


