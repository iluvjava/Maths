[[Lanczos Algoritm]], [[Krylov Subspace]]

Here we made heavy reference to the Iterative Method for Linear System by Anne Greenbaum.

---
### **Intro**

The Bi-conjugate Gradient algorithm uses the 2-side Lanczos algorithm for non-symmetric matrix, constructing 2 arthogonal subsapces during the iterations. 

$$
\begin{aligned}
    \left(
        \text{span} \leftarrow \text{col}
    \right)(V_k) = \text{K}_k(A, r_0)
    \\
    (\text{span}\leftarrow \text{col})(W_k) = \text{K}_k(A^H, \hat{r}_0)
\end{aligned}
$$

Such that: 

$$
W_k^TV_k = I 
$$


**Algorithm:**

$$
\begin{aligned}
    & \text{Given: } r_0, \hat{r}_0 \text{ s.t: } \langle r_0, \hat{r}_0 \rangle \neq 0
    \\
    & \text{set: } v_1 = \frac{r_0}{\left\Vert r_0\right\Vert}; w_1 = \frac{\hat{r}_0}{\langle \hat{r}_0, v_0\rangle}
    \\
    & \text{set: } \beta_0 = \gamma_0 = 0, v_0 = w_0=0
    \\
    & \text{For } j = 1, 2, \cdots 
    \\
    & \hspace{1.1em}
    \begin{aligned}
        & \text{compute: }Av_j, A^Hw_j
        \\
        & \text{set: } \alpha_j = \langle Av_j, w_j \rangle
        \\
        & \widetilde{v}_{j + 1} = Av_j - \alpha_j v_j - \beta_{j - 1} v_{j - 1}
        \\
        & \widetilde{w}_{j + 1} = A^H w_j - \bar{\alpha}_jw_j - \gamma_{j - 1}w_{j - 1}
        \\
        & \text{set: }\gamma_j = \Vert \widetilde{v}_{j + 1} \Vert; 
        v_{j +1} = \widetilde{v}_{j + 1}/\gamma_j
        \\
        & \text{set: } \beta_j = \langle v_{j + 1}, \widetilde{w}_{j + 1}\rangle;
        w_{j + 1} = \widetilde{w}_{j + 1}/\bar{\beta}_j
    \end{aligned}
\end{aligned}
$$

Important Quantities: 

$$
\begin{aligned}
    V_k &= \begin{bmatrix}
        v_1 & v_2 & \cdots & v_k
    \end{bmatrix}
    \\
    W_k &= \begin{bmatrix}
        w_1 & w_2 & \cdots & w_n
    \end{bmatrix}
    \\
    T_k &= \begin{bmatrix}
        \alpha_1 & \beta_1 & & 
        \\
        \gamma_1 &  & &
        \\
        &\ddots & \ddots &  
        \\
        &  &   &\beta_k
        \\ 
        & & \_{k - 1} & \alpha_k
    \end{bmatrix}
\end{aligned}
$$

Where the matrix $T_k$ is Tridiagonal. The algorithm asserts the following recurrences: 

$$
\begin{aligned}
    AV_k &= V_kT_k + \gamma_k v_{k + 1} \xi_k^T = V_{k + 1}T_{k+1, k}
    \\
    A^H W_k &= W_k T^H_k + \bar{\beta}_k w_{k + 1} \xi_k^T = W_k \hat{T}_{k + 1, k}
\end{aligned}
$$

Where: 

$$
\begin{aligned}
    T_{k +1, k} &= \begin{bmatrix}
        T_k \\ \gamma_kv_{k + 1}\xi_k^T
    \end{bmatrix}
    \\
    \hat{T}_{k + 1, k} &= \begin{bmatrix}
        T^H_k \\ 
        \bar{\beta}_k w_{k + 1} \xi_k^T
    \end{bmatrix}
\end{aligned}
$$

And it asserts the relations that: 

$$
V^HW_k = I_k \quad W_k^HV_k = I_k
$$

The matrix whose columns are spanning the krylov Subsapce are perpendicular to each other. 


---
### **The Algorithm Asserts the Recurrences**

let the Inductive Hypothesis be: 

$$
\left\langle v_i, w_j \right\rangle = 0 \; \forall i \neq j \le k \quad 
\langle v_i, w_j\rangle = 1 \; \forall i = j \le k
$$

Claim by claim, we will show that the strong inductive hypothesis holds. 

**Claim 1**

> The algorithm assert $\langle v_{k + 1}, w_{k + 1}\rangle$. 

**Proof**

The algorithm firstly, asserts the following quantities and we can infer that: 

$$
\begin{aligned}
    \gamma_k &= \left\Vert
        \tilde{v}_{k + 1} 
    \right\Vert \quad \beta_k = \langle v_{k + 1}, \tilde{w}_{k + 1} \rangle
    \\
    v_{k + 1} &= \frac{\tilde{v}_{k + 1}}{\gamma_k} \quad w_{k + 1} = \frac{\tilde{w}_{k + 1}}{\bar{\beta}_j}
    \\
    \implies
    \langle v_{k + 1}, w_{k + 1}\rangle &= 
    \left\langle 
        \frac{\tilde{v}_{k + 1}}{\Vert \tilde{v}_{k + 1}\Vert}, 
        \frac{\tilde{w}_{k + 1}}{\langle \overline{v_{k + 1}, \tilde{w}_{k + 1}}\rangle}
    \right\rangle
    \\
    &= 
    \left\langle 
        \frac{\tilde{v}_{k + 1}}{\Vert \tilde{v}_{k + 1}\Vert}, 
        \frac{\tilde{w}_{k + 1}}{\langle \tilde{w}_{k + 1}, v_{k + 1}\rangle}
    \right\rangle
    \\
    &= 
    (\Vert \tilde{v}_{k + 1}\Vert \langle \tilde{w}_{k + 1}, v_{k + 1}\rangle)^{-1} \langle \tilde{v}_{k + 1}, \tilde{w}_{k + 1}\rangle
    \\
    &= 
    (\langle \tilde{w}_{k + 1}, \tilde{v}_{k + 1}\rangle)^{-1} 
    \langle \tilde{v}_{k + 1}, \tilde{w}_{k+ 1}\rangle
    \\ 
    \langle v_{k + 1}, w_{k + 1}\rangle &= 1
\end{aligned}
$$

**Claim 2**

> $$\langle v_{k + 1},w_k \rangle = 0 \quad \langle v_k, w_{k + 1}\rangle = 0$$




**Claim 3**

> $$
> \langle \tilde{v}_{k + 1}, w_{k -1}\rangle = 0 \quad \langle \tilde{w}_{k + 1}, v_{k - 1}\rangle = 0
> $$




**Claim 4**

> $$
>     \langle \tilde{v}_{k + 1}, w_j\rangle = 0 \quad \forall j < k - 1
> $$


