[[Lanczos Algoritm]]



--- 
### **Intro**

The Lanczos algorithm for symmetric matrices are generating orthogonal polynomials under the a sapce weighted by finitely many eigevalues of the matrix.

To introduce, I make heavy references to Yousaf Saad's book in iterative methods, on section 6.2.2, Lanczos & Orthogonalizations. 

Suppose a tridiagonalizations for the Symmetric Matrix $A$:

$$
V_k^HAV_k = T_k
$$

Then for any matrix polynomial with degree less than $k - 1$ gives the property: 

$$
q_{m}(A)v_1 \in \mathcal{K}(A|v_1) \quad \forall\; m \le k - 1
$$

The Lanczos Algorithm generates a vector $v_i$, which is basically: 

$$
\exists q_i \in \mathcal{P}_i: v_i = q_{i - 1}(A) v_i
$$

This is true from how the Krylov Subspace works and how the Lanczos Iterations works. Refers back to Arnoldi Iterations to get how it's related to the Krylov Subspace. 

Suppose 2 vector $v_i, v_j$ proposed and each corresponds to polynomial $\phi, \varphi$ in the Krylov subspace, then: 

$$
\begin{aligned}
    \langle v_i, v_j\rangle &= 0 
    \\
    \langle\phi(A)v_1, \phi(A)v_1 \rangle &= 0
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

**Extra Comments**: 

The polynomials generated to describes the $i^{th}$ orthogonal vectors from the Lanczos algorithm is also the characteristic polynomial for the Tridiagonal Matrix.

Justifications won't be given here, but the mechanism behind is related to the Companion Matrix, and relavent to [[Krylov Matrix QR and Arnoldi Iterations]], the proof is very analogous to what had been done there. 
