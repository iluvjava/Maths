[[Lanczos Iteration]]
[[Krylov Subspace]]
[[Symmetric Tridiagonal Matrices Recursive Det]]

---
### **Intro**

**TLDR (Theorem Statement)**:

> The Iterative Lanczos Algorithm gives orthogonal polynomials under the weighted space $U^Hv_1$ and measured at discrete points $\lambda_i$, the eigenvalue of the matrix $A$. However, the polynomial is hidden as the polynomials of the minimization polynomials inside the span of Krylov Subspace. 

The Lanczos algorithm for symmetric matrices are generating orthogonal polynomials under the a sapce weighted by finitely many eigevalues of the matrix. To introduce, I make heavy references to Yousaf Saad's book in iterative methods, on section 6.2.2, Lanczos & Orthogonalizations. 

---
### **Proof**
Suppose a tridiagonalizations for the Symmetric Matrix $A$:

$$
V_k^HAV_k = T_k
$$

Then for any matrix polynomial with degree less than $k - 1$ gives the property: 

$$
\begin{aligned}
    v_{m + 1} &= q_{m}(A)v_1 \in \mathcal{K}(A|v_1) \quad \forall\; m \le k - 1
    \\
    \exists\; q_{i} &\in \mathcal{P}_{i - 1}: v_i = q_{i - 1}(A) v_1
\end{aligned}
$$

$\mathcal P_i$ denotes a polynomial with highest degree of $i$. Refers back to Arnoldi iterations to get how it's related to the Krylov Subspace. Suppose 2 vector $v_i, v_j$ and each corresponds to polynomial $\phi, \varphi$ in the Krylov subspace, then: 

$$
\begin{aligned}
    \langle v_i, v_j\rangle &= 0 
    \\
    \langle\phi(A)v_1, \varphi(A)v_1 \rangle &= 0
    \\
    \langle U\phi(\Lambda)U^Hv_1, U\varphi(\Lambda)U^Hv_1\rangle &= 0
    \\
    \text{Let: }f_1 &= U^Hv_1 \text{ Then: }
    \\
    \langle U\phi(\Lambda)f_1, U\varphi(\Lambda)f_1\rangle &= 0
    \\
    \langle \phi(\Lambda)f_1, \varphi(\Lambda)f_1\rangle &= 0
    \\
    \sum_{i = 1}^{n} (f_1)_i^2\phi(\lambda_i)\varphi(\lambda_i) &= 0
\end{aligned}
$$

Where, under the discrete weight sum using the vector $f_1$, the polynomial are orthogonal. 

---
### **Consequences and Its Applications**

Orhotogonal Polynomial Recurrences: 

> The $q_{j + 1}$ vector represented under the Krylov Subspace is an orthogonal polynomial under some discrete weighted measure, they also have a short recurrence. More specirically: 
> $$
> \begin{aligned}
>     & \forall 1 \le i \le n: 
>     \beta_j \varphi_{j + 1}(\lambda_i) = \lambda_i \varphi(\lambda_i) - \alpha_j\varphi_j(\lambda_i) - \beta_{j - 1}\varphi_{j - 1}(\lambda_i)
> \end{aligned}
> $$

And we define the following quantities for the statement of the theorem

$$
\begin{aligned}
    & A = U\Lambda U^H \quad \text{Eigen decomposition of A}
    \\
    & Q_k^TAQ_k = T_k
    \\
    & \overline q_j = U^Hq_j
    \\
    & \exists \varphi_{j}\in \mathcal P_{j - 1}: \varphi_j(A)q_1 = q_j
\end{aligned}
$$

The third line specify that $\varphi_j$ as a $j - 1$ degree polynomial represent the lanczos vector $q_j$ as a matrix polynomial multiplied by $q_1$. 

**Proof**

Let $U\Lambda U^H$ be the eigen decomposition for the Hermitian matrix [[Hermitian Adjoint]] $A$. Then consider the lanczos recurrence: 

$$
\begin{aligned}
    \beta_j q_{j + 1} &= Aq_j - \alpha_jq_j - \beta_{j - 1}q_{j - 1}
    \\
    \beta_j q_{j + 1} &= U\Lambda \underbrace{U^Hq_j}_{=:\overline q_j} - \alpha_jq_j - \beta_{j - 1} q_{j - 1}
    \\
    \beta_jU\overline q_{j + 1} &= U\Lambda \overline q_j - \alpha_j U \overline q_j - \beta_{j - 1}U\overline q_{j - 1}
    \\
    \beta_j \overline q_{j + 1} &= \Lambda \overline q_{j} - \alpha_j \overline q_{j} - \beta_{j - 1}\overline q_{j - 1}
\end{aligned}\tag{1}
$$

Using the fact that $q_j$ from the Lanczos algorithm comes from the Krylov subspace, we can write it as a matrix polynomial multiplied by $q_1$, consider: 

$$
\begin{aligned}
    \varphi_j(A)q_1 &= q_j
    \\
    U\varphi_j(\Lambda)U^Hq_1 &= q_j
    \\
    U\varphi_j(\Lambda) \overline q_1 &= U \overline q_j
    \\
    \varphi(\Lambda)\overline q_1 &= \overline q_j
\end{aligned}\tag{2}
$$

And we have the opportunity to rewrite (1) using (2) to get: 

$$
\begin{align}
    & \beta_j \varphi_{j + 1}(\Lambda)\overline q_1 = 
    \Lambda\varphi_j(\Lambda)\overline q_1 
    - \alpha_j\varphi_j(\Lambda)\overline q_1 
    -\beta_{j - 1}\varphi_{j - 1}(\Lambda)\overline q_1
    \\
    & \forall i, (\overline q_i)_i \neq 0: 
    \beta_j \varphi_{j + 1}(\lambda_i) - \alpha_j\varphi_j(\lambda_i) - \beta_{j - 1}\varphi_{j - 1}(\lambda_i)
\end{align}
$$

And that, is how we translate the recurrence of the Lanczos vector to the polynomials, which are going to be orthogonal over the discrete measure along the eigenvalues of $A$ weighted by $(\overline q_1)_i^2$. 

> The characteristic polynomial of the Tridiagonal matrix $T_k$ is also orthogonal from iterations to iterations. 




---
### **Remark**

The idea can be translated to orthogonal polynomials in other continuous type of measure, over some continuous linear operators. 
