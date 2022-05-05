[[Lanczos Algoritm]]
[[Krylov Subspace]]
[[Symmetric Tridiagonal Matrices Recursive Det]]

---
### **Intro**


**TLDR(Theorem Statement)**: 

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






