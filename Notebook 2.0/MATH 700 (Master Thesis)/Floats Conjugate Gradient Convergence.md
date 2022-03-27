[[Exact Conjugate Gradient Convergence]]
[[From Lanczos to Conjugate Gradient]]
[[Conjugate Gradient Convergence Statmemt of Results]]

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

$F_k$ is the floating error that makes the equal true, and $\tilde{Q}$ are perturbed slightly resulting in loss of orthogonality, hence we cannot assume $\tilde{Q}_k$ to be orthogonal in any kind of ways . $T_k$, without the ~ is also perturbed. All 2 quantities $Q_k, T_k$ are pretty much perturbed with errors in it. 

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

Hence the error is expressed as: 

$$
\begin{aligned}
    \Vert r_k^C\Vert/\Vert r_0\Vert &\le \Vert q_{k + 1}\Vert |\beta_k\xi^T_kT_k^{-1}\xi_1| + \Vert F_k\Vert \Vert y_k^C\Vert/\beta
    \\
    \Vert r_k^C\Vert/\Vert r_0\Vert &\ge 
    \Vert q_{k + 1}\Vert |\beta_k\xi^T_kT_k^{-1}\xi_1| - \Vert F_k\Vert \Vert y_k^C\Vert/\beta
\end{aligned}
$$

Now, let me invoke another theorem, stated in [[The Energy Norm and the 2-Norm]], which can provides us with an upper bound of the relative error for the algorithm. 

> $$
> \frac{\Vert A x\Vert}{\Vert Ay \Vert} \le \kappa(A)\frac{\Vert 
> x\Vert_A}{\Vert y \Vert_A}
> $$

Applying it in our case, we have: 

$$
\begin{aligned}
    \frac{\Vert e_{k}\Vert_A}{\Vert e_k\Vert_A} \le 
    \kappa(A) \frac{\Vert Ae_k\Vert}{\Vert Ae_0\Vert} &= 
    \kappa(A)\frac{\Vert r_k^C\Vert}{\Vert r_0\Vert}
    \\
    \implies 
    \frac{\Vert e_{k}\Vert_A}{\Vert e_0\Vert_A}
    &\le
    \kappa(A)\left(\Vert q_{k + 1}\Vert |\beta_k\xi^T_kT_k^{-1}\xi_1| + \Vert F_k\Vert \Vert y_k^C\Vert/\beta\right)
\end{aligned}
$$
Which, is infact, not easy to estimate at all due to the fact that, $\kappa(A)$ is involved and $A$ is a assumed to be an extremely large and sparse matrix, sometimes this is not directly attainable if $A$ is a blackbox. The convergence of the relative optimality gap: ($\frac{\Vert r_k^c\Vert}{\Vert r_0\Vert}$), however, is not directly related to $\Vert A\Vert$, but indirectly via $T_k$. 

---
### **Paige's Theorem**

Paige state the relations of the Floating Point Tridiagonal Matrix in relations to the eigenvalues/eigenvectors of the original matrix $A$. (Listed as [110] in professor Greenbaum's Book, stated as theorem 4.1.1 in the textbook.)

The eigenvalues for the $T_k$ we got from lanczos under floating points has it's ritz vectors and ritz values bounded in this way: 

$$
\begin{aligned}
    \lambda_1 - j^{5/2}\epsilon_2\Vert A\Vert 
    \le 
    \theta^{(j)}_i \le \lambda_n  + j^{5/2}\epsilon_2\Vert A\Vert
    \quad \epsilon_2 = \sqrt{2}\max\{6\epsilon_0, \epsilon_1\}
\end{aligned}
$$

Which basically stated that the $i^{th}$ eigenvalue of $T_j$ is bounded within the spectrum of $A$, with some extra margine that is paramaterzied by $\Vert A\Vert$. 


---
### **Backwards Analysis**

We are interested in looking for an original, Unpreturbed problems of CG such that it produces the perturbed Tridiagonal matrix $T_k$, and hence, completing the process of backwards analysis. 

To Drive the intuition further into the matter, recall that: 

### TODO: Finish this!