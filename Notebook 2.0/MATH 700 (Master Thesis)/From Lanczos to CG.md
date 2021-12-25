[[Conjugate Gradient and Krylov]]
[[Lanczos Algoritm]]

---
### **Intro**

The Lanczos algorithm creates a tridiagonal factorizations of the matrix $A$, suppose that $T_k = Q^H_kAQ_k$, then, take the following statement for granted: 

$$
\text{spancol}(Q_k) = \mathcal{K}_k(r_0)
$$

Assume that the Lanczos algorithm had the fix choice for its initialization vector, in this case: $r_0$. This is needed to fit the Krylov Minimization Framework of the Conjugate Gradient Algorithm.

---
### **Solving the System from the Tridiagonal Matrix**

We see to verify these claims: 

> $$
> \begin{cases}
>     y_k = T^{-1}_k \beta\xi_1
>     \\
>     x_k = x_0 + Q_k y_k
>     \\
>     r_k = -\beta_{k + 1}\xi_k y_k q_{k +1}
> \end{cases}
> $$

The quantities $\alpha, \beta$ are the diaognal and the sub or super diagonal of the matrix $T_k$ from the Iterative Lanczos Algorithm, and $r_k$ is the residual from the Conjugate Gradient Algorithm, and $Q_k$ is the orthogonal subsapce generated from the Lanczos Algorithm. 

**Notations**

Here, we use $\xi_i$ to denote the ith canonical basis vector. $\beta$  without the subscript for denoting $\Vert r_0\Vert$

**Proof**

Recall that the Lanczos Algorithm Asserts the following recurrences:


$$
AQ_k = Q_{k + 1} \begin{bmatrix}
    T_k
    \\
    \beta_k \xi_k^T
\end{bmatrix}\tag{1}
$$

Recall that the Conjugate Gradient algorithm takes the guesses from the affine span of $x_0 + \mathcal{K}_k(r_0)$, and that means: 

$$
\begin{aligned}
    x_{k + 1} &= x_0 + Q_ky_k
    \\
    r_{k + 1} &= r_0 - AQ_k y_k
    \\
    Q^H_kr_{k + 1} &= Q_K^H r_0 - Q_k^HAQ_k y_k
    \\
    \underset{[1]}{\implies}
    0 &= \beta\xi_1 - T_k y_k
    \\
    y_k &= T_k^{-1}\beta \xi_1
\end{aligned}\tag{2}
$$

[1]: Is asserted by the CG algorithm, derived via krylov subspace and minimization on the energy norm of the error, it asserts that $r_{k + 1} \perp \mathcal{K}_k(r_0)$.

Now, we are interested in the residual of the CG, and how it's related to the Lanczos Algorithm. Consider: 

$$
\begin{aligned}
    r_{k + 1} &= r_0 - AQ_k y_k
    \\
    &= r_0 - AQ_k T_k^{-1}\beta \xi_1
    \\
    \underset{[1]}{\implies}&= \beta q_1 - AQ_k T_k^{-1} \beta\xi_1
    \\
    &= \beta q_1 - Q_{k + 1}\begin{bmatrix}
        T_k \\ \beta_k \xi_k^T
    \end{bmatrix}T_k^{-1} \beta\xi_1
    \\
    &= \beta q_1 - 
    (Q_k T_k + \beta_k q_{k + 1}\xi_k^T)T_k^{-1} \beta\xi_1
    \\
    &= 
    \beta q_1 - (Q_k \beta \xi_1 + \beta_k q_{k + 1}\xi_{k + 1}T_k^{-1}\beta \xi_1)
    \\
    &= -\beta_k q_{k + 1}\xi_k^TT_k^{-1} \beta \xi_1
\end{aligned}\tag{3}
$$

[1]: Recall that the Iterative Lanczos starts with $q_1 = r_0$, and therefore, $r_0 = \beta q_1$

**Reader Please Observe**: 

**Claim:**
> The residuals are orthogonal

**Argument:**

The quantity $\xi_k^TT_k^{-1}\beta\xi_1$ is a scalar and it's equal to $\beta (T_k^{-1})_{k, 1}$, beta multiplied by the last element of the first column of the matrix $T_k^{-1}$. 

Therefore, we know that, the vector $r_{k + 1}$ is a scalar multiple of the vector $q_{k+ 1}$, and because the vectors $q_k$ are generated from the Lanczos algorithm and they have to be orthogonal, therefore, we know that the residuals vector from the CG algorithms are going to be orthogonal as well. 

Up to this point, the claims I made are proven. 


---
### **Where are the Conjugate Directions**? 

It won't be called conjugate Gradient if there are no conjugate directions from the algorithm. I want to make the claim that the conjugate directions are columns of the following matrix. 

Claim: 

> $$
> P_k = Q_k U_k^{-1}
> $$
> The columns of tha matrix are vectors in conjugate directions

**Proof**: 

Where, we consider a decomposition of the Symmetric Tridiagonal Matrix: $T_k = L_k U_k$, where $L_k$ is unit diagonal with on sub-diagonal, and the matrix $U$ is upper-bi-diagonal, with all the upper diagonal being $\beta_j$, the same as the upper diagonal of the matrix $T_k$.

$$
\begin{aligned}
    x_k &= x_0 + Q_k y_k 
    \\
    &= x_0 + Q_k T_{k}^{-1} \beta \xi_1
    \\
    &= x_0 + Q_k U_k^{-1}L_k^{-1}\beta \xi_1
    \\
    &= x_0 + P_k L_k^{-1}\beta\xi_1
\end{aligned}\tag{4}
$$

As we ca see, the solution vector $x_k$ consists of conjugate vectors, and it's a linear combinations of conjugate vectors. 

Next, we are going to prove that they are conjugate, they are conjugate because: 

$$
\begin{aligned}
    & P_k^TAP_k
    \\
    &= (Q_k U_k^{-1})^T AQ_kU_k^{-1}
    \\
    &= U_k^{-T}Q_k^{T}AQ_k U_k^{-1}
    \\
    &= U_k^{-T}T_kU_k^{-1}
    \\
    &= U^{-T}_kL_k
\end{aligned}\tag{5}
$$

$U_k$ is upper triangular, therefore, it's inverse it's also upper triangular, therefore, $U_k^{-T}$ is lower triangular, and because $L_k$ is also lower triangular, their product is a lower triangular matrix, and therefore, the resulting matrix above is lower triangular, however, given that $P_k^TAP_k$ is symmetric, therefore, $U_k^{-T}L_k$ will have to be symmetric as well, and a matrix that is lower triangular and symmetric has to be diagonal. Therefore, the columns of $P_k$ are conjugate vectors. 