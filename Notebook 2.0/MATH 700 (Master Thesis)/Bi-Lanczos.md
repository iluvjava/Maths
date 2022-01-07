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
        & & \gamma_{k - 1} & \alpha_k
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

To prove, we want to show that $\langle v_i, w_{k + 1}\rangle = 0\; \forall i \le k$, and $\langle v_{k + 1}, w_{i}\rangle\;\forall i \le k$ and $\langle v_{k + 1}, w_{k + 1}\rangle$

Claim by claim, we will show that the strong inductive hypothesis holds. 

**Claim 1**

> The algorithm assert $\langle v_{k + 1}, w_{k + 1}\rangle = 1$. 

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

Prove. $\blacksquare$

**Claim 2**

> $$\langle v_{k + 1},w_k \rangle = 0 \quad \langle v_k, w_{k + 1}\rangle = 0$$

**Proof**

$$
\begin{aligned}
    \langle \tilde{v}_{k + 1}, w_k\rangle &= 
    \langle Av_k - \alpha_k v_k - \beta_{k - 1}v_{k - 1}, w_k\rangle
    \\
    &= \langle Av_k, w_k\rangle - \alpha_k \langle v_k, w_k\rangle - 
    \beta_{k - 1}\langle v_{k - 1}, w_k\rangle
    \\
    &= \underbrace{\langle Av_k, w_k\rangle}_{\alpha_k} - \alpha_k
    \\
    &= 0
\end{aligned}
$$

The inner product $\langle Av_k, w_k\rangle - \alpha_k = 0$ purely by how the quantity $\alpha_j$ is defined in the algorithm. Next, because $\tilde{v}_{k +1}$ is just $v_{k + 1}\gamma_{k}$, $\langle \tilde{v}_{k + 1}, w_k\rangle\implies \langle v_{k + 1}, w_k\rangle = 0$. 

By a similar token, we have: 

$$
\begin{aligned}
    \langle \tilde{w}_{k + 1}, v_k\rangle &= \langle A^Hw_k, v_k\rangle - \bar{\alpha}_k 
    \\
    &= \langle w_k, Av_k\rangle - \bar{\alpha}_k
    \\
    &= \overline{\langle Av_k, w_k \rangle} - \alpha_k
    \\
    &= 0
\end{aligned}
$$

We make use of the property of Complex Inner product. $\blacksquare$

**Claim 3**

> $$
> \langle \tilde{v}_{k + 1}, w_{k -1}\rangle = 0 \quad \langle \tilde{w}_{k + 1}, v_{k - 1}\rangle = 0
> $$

**Proof**

Firstly, we wish to show the first statement is true, and consider the expression: 

$$
\langle \tilde{v}_{k + 1}, w_{k - 1}\rangle = \langle Av_{k + 1}, w_{k - 1}\rangle - \beta_{k - 1} = 0
$$

The first equal sign is justified by: 

$$
\begin{aligned}
    \langle \tilde{v}_{k + 1}, w_{k - 1}\rangle &= \langle 
        Av_k - \alpha_kv_k - \beta_{k - 1}v_{k - 1}, w_{k - 1}
    \rangle
    \\
    &= \langle Av_k, w_{k -1}\rangle - \beta_{k- 1}\langle v_{k - 1}, w_{k - 1}\rangle
    \\
    &= \langle Av_k, w_{k -1}\rangle - \beta_{k- 1}
\end{aligned}
$$

The second equality is justified by: 

$$
\begin{aligned}
    \langle Av_k, w_{k - 1}\rangle &= \langle v_k, A^Hw_{k -1}\rangle
    \\
    &= \langle v_k, \tilde{w}_k + \bar{\alpha}_kw_{k - 1} + \gamma_{k - 1}w_{k - 2}\rangle
    \\
    &= \langle v_k, \tilde{w}_k\rangle + \bar{\alpha}_k \langle v_k, w_{k - 1}\rangle + \gamma_{k - 1}\langle v_k, w_{k - 2}\rangle
    \\
    &= \langle v_k, \tilde{w}_k\rangle
    \\
    &= \langle v_k, \bar{\beta}_{k-1}w_k\rangle
    \\
    &= \overline{\langle \bar{\beta}_{k -1}w_k, v_k\rangle}
    \\
    &= \beta_{k -1}\langle w_k, v_k\rangle = \beta_{k - 1}
    \\\implies 
    \langle Av_k, w_{k - 1}\rang - \beta_{k - 1} &= 0
\end{aligned}
$$

The first 3 equality follows direction from algebra and the algorithm, 5th equality comes from the end of each forloop then $w_{j + 1}$ is established, and the last 2 equalities uses properties of the complex dot product. Notice that $\langle u, av\rangle \neq a\langle u, v\rangle$ when things are complex, we must swap the inner produce to move the scalar to the first parameter and then uses the linearity, which means that we are taking the conjugate of the scalar $a$ when swapping the parameters in the inner product. 

By the same argument that $\tilde{v}_k$ is a scalar multiple away from $v_{k + 1}$, we conclude that also: $\langle v_{k + 1}, w_{k - 1}\rangle = 0$. 

Secondly, we wish th show that $\langle \tilde{w}_{k +1}, v_{k - 1}\rangle = 0$, the proof is similar to what we have above. 

$$
\begin{aligned}
    \langle \tilde{w}_{k +1}, v_{k - 1}\rangle &= \langle A^Hw_k, v_{k - 1}\rangle - \gamma_{k - 1} = 0 
\end{aligned}
$$

First equality is justified by: 

$$
\begin{aligned}
    \tilde{w}_{k + 1}&= A^Hw_k - \bar{\alpha}_kw_k - \beta_{k - 1}w_{k - 1}
    \\
    \implies 
    \langle \tilde{w}_{k + 1}, v_{k - 1}\rangle &= 
    \langle 
        A^Hw_k - \bar{\alpha}_k w_k- \beta_{k - 1}w_{k - 1},
        v_{k - 1}
    \rangle
    \\
    &= \langle A^Hw_k, v_{k - 1}\rangle - \gamma_{k - 1}
\end{aligned}
$$

And then consider: 

$$
\begin{aligned}
    \langle A^Hw_k, v_{k - 1}\rangle &= \langle w_k Av_{k - 1}\rangle
    &= 
    \langle w_k, \tilde{v}_k + \alpha_{k - 1}v_{k - 1}+ \beta_{k -1}v_{k - 1}\rangle
    \\
    &= \langle w_k, \tilde{v}_k\rangle
\end{aligned}
$$

From the algorithm, we know $\tilde{v}_k = v_k \gamma_{k - 1}$ which makes $\langle w_k, \tilde{v}_k\rangle = \gamma_{k -1}\langle w_k, v_k\rangle - \gamma_{k -1} = \gamma_{k - 1}$, where we used the inductive hypothesis. Observe that if that is true, then $\langle A^Hw_k, v_{k - 1}\rangle - \gamma_{k - 1} = 0$, and the claim is proven. $\blacksquare$


**Claim 4**

> $$
>     \langle \tilde{v}_{k + 1}, w_j\rangle = 0 \quad \forall j < k - 1
> $$

**Proof**

$$
\begin{aligned}
    \langle \tilde{v}_{k + 1}, w_j\rangle &= 
    \langle Av_k, w_j\rangle
    \\
    &= \langle v_k, A^Hw_j\rangle
    \\
    &= \langle v_k, \tilde{w}_{j + 1}\rangle = 0
\end{aligned}
$$

To justify the first line of inequality, consider: 

$$
\begin{aligned}
    \langle \tilde{v}_{k + 1}, w_j\rangle &= 
    \langle Av_k + \alpha_k v_k - \beta_{k - 1}v_{k - 1}, w_j\rangle
    \\
    &= \langle Av_k, w_j\rangle + \alpha_k \langle v_k, w_j\rangle - \beta_{k - 1}\langle v_{k - 1}, w_j\rangle
    \\
    &= \langle Av_k, w_j\rangle
\end{aligned}
$$

Where, we make use the indcutive hyptoehsis and the fact that $j \le k - 1$. $\blacksquare$

Therefore, the algorithm asserts the orthogonality where $W^HV_k = I_k$. Provided the the algorithm doesn't break down. 

---
### **Serious Breakdown**
The algorithm breaks down when during the iterations $j$, we have: 

$$
v_j, w_j \neq 0 \wedge \langle v_j, w_j\rangle = 0
$$

When this happens, $\beta_j = 0$, whic later, it's used as the Denominator, and then we will have a divides by zero problem. 