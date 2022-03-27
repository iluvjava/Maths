[[Conjugate Gradient for Advanced Readers]]
[[Lanczos Algoritm]]

---
### **Intro**

The Lanczos algorithm creates a tridiagonal factorizations of the matrix $A$, suppose that $T_k = Q^H_kAQ_k$, then, take the following statement for granted: 

$$
\text{spancol}(Q_k) = \mathcal{K}_k(r_0)
$$

Assume that the Lanczos algorithm had the fix choice for its initialization vector, in this case: $r_0$. This is needed to fit the Krylov Minimization Framework of the Conjugate Gradient Algorithm.

Our ultimaet goal here is to: 

1. Use the energy norm minimizaton frameworks of the conjugate gradient over the krylove subspace to establish an interpretation of the algorithm based on the Quantites from the Lanczos Algorithm. 
2. Use the Lanczos Algorithm to find the conjugate vectors from the Conjugate Gradient Algorithm. 
3. Use the LU decomposition of the SymTridiagonal matrix to figure out the recurrences of the step size into the conjugate direction. 

---
### **Solving the System from the Tridiagonal Matrix**

We see to verify these claims: 

> $$
> \begin{cases}
>     y_k = T^{-1}_k \beta\xi_1
>     \\
>     x_k = x_0 + Q_k y_k
>     \\
>     r_k = -\beta_{k}\xi_k^T y_k q_{k +1}
> \end{cases}\tag{0}
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
    Q^H_kr_{k + 1} &= Q_k^H r_0 - Q_k^HAQ_k y_k
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

**Claim:** 

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

**However**, we also have the choice to decompose the $T_k$ using LDL decomposition. Using that method, we would have made the additional assumption that $T_k$ is symmetric positive definite, however, in the above formulation, no such assumption has been made, and it has the pontential of pointing to other algorithms for definite symmetric system. There are a lot of questions to ask, let's skip that in this exerp. 

---
### **The Building up of Recurrences**

The Conjugate Gradient uses conjugate vector, which relates back to the $LU$ decomposition of the Tridiagonal Matrix from the Iterative Lanczos Algorithm. Here, we assume that the matrix $A$ is symmetric positive definite, and The lanczos Algorithm commits to the following Decomposition of matrix: 

$$
\begin{aligned}
    Q^T_kAQ_k &= T_k
\end{aligned}
$$

Where the matrix $T_k$ is symmetric Tridiagonal and positive definite as well. All the quantities inside $T_k$ should be real positive numbers, even if the matrix $A$ is complex, this is from the fact that $A$ is SPD, and the properties of Iterative Lanczos Algorithm. 

From the conjugate Gradient Objective we obtains: 

$$
\begin{cases}
    y_k = T^{-1}_k \beta\xi_1
    \\
    x_k = x_0 + Q_k y_k
    \\
    r_k = -\beta_{k}\xi_k^T y_k q_{k +1}
\end{cases}\tag{6}
$$
And we define the conjugate vectors and the lanczos vector matrix using the conventions: 

$$
P_k = \begin{bmatrix}
    p_1 & p_2& \cdots & p_k
\end{bmatrix} \quad
Q_k = \begin{bmatrix}
    q_1 & q_2 & \cdots & q_k
\end{bmatrix}
$$



The Decomposition of the Symmetric Tridiaognal Factorizations asserts the following structures: 

$$
T_k = L_k U_k =
\begin{bmatrix}
    1 & & & \\
    l_1 & 1 & & \\
    & \ddots& \ddots & 
    \\
    & & l_{k - 1} & 1
\end{bmatrix}\begin{bmatrix}
    u_1& \beta_1 & & \\
    & u_2 &\beta_2 & \\
    & &\ddots & \beta_{k - 1}\\
    & & & u_k
\end{bmatrix}
$$

At this time, take it for granted that the super diagonal of $U_k$ are indeed the same as the super diagonal of the SymTridiagonal matrix $T_k$. 

And from expression (4), we have: 

$$
\begin{aligned}
    x_k &= x_0 + P_k L_k^{-1}\beta \xi_1 \\ 
    x_{k} - x_{k - 1} &= 
    P_k L_k^{-1} \beta \xi_1 - P_{k - 1}L^{-1}_{k - 1}\beta \xi_1
    \\
    &= P_k \beta(L^{-1}_k)_{:, 1} - P_{k - 1}\beta(L^{-1}_{k - 1})_{:, 1}
    \\
    &= \beta(L^{-1}_k)_{k, 1}P_k
    \\
    \implies x_k &= x_{k - 1} + \beta(L^{-1}_k)_{k, 1}p_k
\end{aligned}
$$

Next, we wish to derive the recurrence between $p_{k + 1}$ and $p_k$. Which is: 

$$
\begin{aligned}
    P_k &= Q_k U^{-1}_k
    \\
    P_kU_k &= Q_k
    \\\implies
    \beta_{k - 1}p_{k - 1} + u_k p_k &= q_k 
    \\
    u_k p_k &= q_k - \beta_{k - 1}p_{k - 1}
    \\
    p_k &= u^{-1}_k(q_k - \beta_{k - 1}p_{k - 1})
\end{aligned}\tag{7}
$$

Next, we wish to seek for the recurrences of the parameters $u_k, l_k$. Let's consider the recurrence: 

$$
\begin{aligned}
    T_k &= L_kU_k
    \\
    T_{k + 1} &= \begin{bmatrix}
        T_k & \beta_k \xi_k \\
        \beta_k \xi^T_k & \alpha_{k + 1}
    \end{bmatrix} = 
    \begin{bmatrix}
        L_k & \mathbf{0} \\ l_k \xi_k^{-1} & 1
    \end{bmatrix}
    \begin{bmatrix}
        U_k & \eta_k \xi_k \\
        \mathbf{0} & u_{k + 1}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        L_kU_k & \eta_k L_k \xi_k 
        \\
        l_k \xi_k^TU_k & \eta_k l_k \xi_k^T \xi_k + u_{k + 1}\alpha_k
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        T_k & \eta_k (L_k)_{:, k} \\ 
        l_k(U_k)_{k, :} & \eta_k l_k + u_{k + 1}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        T_k & \eta_k \\
        l_k u_k & \eta_k l_k + u_{k + 1}
    \end{bmatrix}
\end{aligned}
$$

**Reader please observe that** 

$\eta_k = \beta_k$, as expected, and $l_k = \beta_k/u_k$, $u_{k + 1} = \alpha_{k +1} - \beta_{k}l_k$, and hence, to sum up the recurrence relation we have: 

$$
\begin{cases}
    u_{k + 1} &= \alpha_{k + 1} - \beta_k^2/u_k
    \\
    l_k &= \beta_k/u_k
\end{cases}\tag{8}
$$

The base case is $u_1 = \alpha_1$. 

And to figure out the recurrence relations of $(L^{-1}_k)_{:, 1}$, consider: 

$$
\begin{aligned}
    L^{-1}_k L_k &= I 
    \\
    \begin{bmatrix}
        L^{-1}_k & \mathbb{0} \\
        s_k^T & d_{k + 1}
    \end{bmatrix}
    \begin{bmatrix}
        L_k & \mathbf{0} \\
        l_k \xi_k^T & 1
    \end{bmatrix} &= I
    \\
    \begin{bmatrix}
        I & \mathbf{0} \\ 
        s^TL_k + d_{k + 1}l_k \xi_k^T &d_{k + 1}
    \end{bmatrix} &= I
\end{aligned}\tag{9}
$$

**Reader please observe that**

$d_{k + 1} = 1$, and it has to be that the the lower diagonal sub vector in the results has to be zero. For the bi-lower unit diagonal matrix $L_k$, we cannot predict the structure, most of the time it's likely to be dense and unit lower  triangular. We are interested in look for the first element of the vector $s_k^T$, the equality will assert: 

$$
\begin{aligned}
    s^TL_k + d_{k + 1}l_k \xi_k^T &= \mathbf{0}
    \\
    L_k^{T}s_k + d_{k + 1}l_k \xi_k &= \mathbf{0}
    \\
    s_k + L^{-T} d_{k + 1}l_k \xi_k &= \mathbf{0}
    \\
    (s_k)_1 + d_{k + 1}l_k (L^{-1}_k)\xi_k &= 0
    \\
    (s_k)_1 + d_{k + 1}l_k(L^{-1}_k)_{k , 1} &= 0
    \\\implies
    (s_k)_1 &= - l_k(L^{-1}_k)_{k, 1} 
    \\
    (s_k)_1 &= (L^{-1}_{k + 1})_{k + 1, 1}
    \\
    \implies
    (L^{-1}_{k + 1})_{k + 1, 1} &=
    -l_k(L^{-1}_k)_{k, 1}
\end{aligned}
$$

Therefore the recurrence for the step size into the direction of the conjugate vector requires us to use the newest element $l_k$ from $L_{k + 1}$ and the previous step size in the direction of the conjugate vector $p_k$. 




---
### **The LU Conjugate Direction Algorithm**

We are intersted in figuring the base cause for the recursions that we highlighted above. 

At the start of the algorithm, the following quantities are established: 

$$
\begin{aligned}
    q^T_1Aq_1 &= \alpha_1 \quad p_1 = q_1
    \\
    T_1 &= \alpha_1 \implies u_1 = \alpha_1
    \\
    L_1 &= 1, U_1 = \alpha_1
    \\
    \beta_0 = 0, l_1 &= 0
\end{aligned}
$$

And, let's summarize the recurrence relations for the quantities we discussed: 

$$
\begin{aligned}
    & \begin{cases}
        x_{k} &= x_{k -1} + \beta(L^{-1}_k)_{k, 1} p_k
        \\
        (L^{-1})_{k, 1} &= -l_{k - 1}(L^{-1}_{k - 1})_{k - 1, 1}
        \\
        p_{k} &= u^{-1}_k(q_k - \beta_{k - 1}p_{k - 1})
    \end{cases}
    \\
    & \begin{cases}
        u_{k + 1} &= \alpha_{k + 1} - \beta^2_k/u_k
        \\
        l_k &= \beta_k/u_k
    \end{cases}
\end{aligned}
$$

And the base case of the algorithm is: 

$$
\begin{aligned}
    x_1 &= x_0 + \beta p_1 
    \\
    \text{where: } p_1 &= q_1 / \alpha_1
\end{aligned}
$$

Which is the quantities we need for the base case of the algorithm. However, the we getting a recurrence relations for the residual vectors for the conjugate gradient is somewhat more interesting and it's still under investigation. 

A more natural thing to do with this formulations of the algorithm is to use $\Vert x_k - x_{k - 1}\Vert \le \epsilon$ as a stopping condition(Estimatin the Gradient of the objective, which is actually the residual.) instead of explicitly computing the residual which is an extra computation overhead. 

**Extra Comments**: 

The residuals vectors are orthognals, and they are rescaled version of the Lanczos vectors, refers it back to expression (0) at the start of the section. 

---
### **The Conjugate Gradient Algorithm**

We are interesting in deriving the conjugate gradient algorithm from the relations and quantities we obtained above. 




---
### **Extra Comments**

When Lanczos Is applied to various type of SPD Matrice, there are some features that the users should observe from the algorithm. 

$T_k$ is a real positive matrix, and it's also symmetric(Hermitian Too). 

$T_k$ only has non zero positive eigenvalues (As a result of being positive and SPD), and **it has all unique eigenvalues**. This is true even if the matrix $A$ as repeating eigenvalues. The initial random vector, $q_1\in \text{span}(\{u_1, u_2\cdots u_m\})$ where $u_i, \lambda_i$  are the eigen system for the matrix $A$ and $u_i$ are all **unique**, then, the dimension of the Krylov Subspace is not going to exceed $\text{span}(\{u_1, u_2, \cdots u_m\})$, because it's invariant under $A$, and it has only $m$ dimensions. Therefore, if we assume that $T_n$ has 2 repeated ritz vectors and values, then it's also the the repeating eigen values and vectors for $A$, which means Lanczos terminates earlier than $n$, therefore, a contradiction is shown, therefore, $T_n$ in the end has to have all unique eigenvalues and vectors. 

The residual and solution computed by this algorithm is very different from the conjugate gradient algorithm due to errors in floating points. However, the solution produced by $x_0 + Q_ky_k$ will still converge, but $Q_k$ are not orthogonal, and huge errors are presented for $Q_k^TAQ_k = T_k$. 