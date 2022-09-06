[[Bi-Lanczos]]

---
### **Intro**

The Bi-Lanczos Algorithm is mathematical equivalent to the BiConjugate Gradient Algorithm. 

The relation between the BiCG and Bi-Lanczos is very similar to the relationships between CG and Lanczos, just without the Hermitian Matrix part. 

---
### **Algorithm Statement**

The bar minumum of the BiCG method involves the following routine for using the left and right bi-subspace for minimization of the 2 norm. 

2 residuals are given. 

$$
\begin{aligned}
    & \text{Given: }x_0
    \\
    & \text{Compute: } r_0 = b - Ax_0
    \\
    & \text{Set: } p_0 = r_0
    \\
    & \text{Choose: }\hat{r}_0: \langle r_0, \hat{r}_0\rangle \neq 0
    \\
    & \text{Set: } \hat{p}_0 = \hat{r}_0
    \\
    & \text{For }k = 1, 2, \cdots 
    \\
    & \hspace{1.1em}
    \begin{aligned}
        & a_{k - 1} := 
        \frac{\langle r_{k - 1}, \hat{r}_{k - 1}\rangle
        }{
            \langle Ap_{k - 1}, \hat{p}_{k - 1}\rangle
        }
        \\
        & x_k := x_{k - 1} + a_{k - 1}p_{k - 1 }
        \\
        & r_k := r_{k - 1} - a_{k - 1}A_{k - 1}
        \\
        & \hat{r}_k := \hat{r}_{k - 1} - \bar{a}_{k - 1}A^H\hat{p}_{k - 1}
        \\
        & b_{k - 1} = \frac{\langle r_k, \hat{r}_k\rangle}{
            r_{k - 1}, \hat{r}_{k - 1}
        }
        \\
        & p_k := r_k + b_{k - 1}p_{k - 1}
        \\
        & \hat{p}_k := \hat{r}_k + \hat{b}_{k -1}\hat{p}_{k -1}
    \end{aligned}
\end{aligned}
$$

Implicity, the Residuals $r_k$ comes from the column subspace of $V_k$ and the residual $\hat{r}_k$ comes from the column span of $W_k$, residual are in an bi-orthogonal basis. 

---
### **In relations to Bi-Lanczos Algorithm**

The Bi-Lanczos Algorithm generated a bi-orthogonal subspace with the following recurrence relations: 

$$
\begin{aligned}
    AV_k &= V_kT_k + \gamma_k v_{k + 1}\xi_k^T
    \\
    A^HW_k &= W_kT_k^H + \bar{\beta}_k w_{k + 1}\xi_k^T
\end{aligned}
$$

The solution $x_k$ is taken from the subspace $V_k$, one of the subspace, so that $x_k = x_0 + V_k y_k$. And we wish to minimize the quantity: $r_k$, given as: 

$$
\begin{aligned}
    r_k &= b - Ax_0 - AV_k y_k 
    \\
    r_k &= r_0 - AV_k y_k
    \\
    \text{Make }r_k \perp& \text{colspan}(W_k) 
    \\
    W^H_k r_k &= \mathbf{0}
    \\
    W^H_k(r_0 - AV_ky_k) &= \mathbf{0}
    \\
    W^H_kr_0 - W^H_kAV_ky_k &= \mathbf{0}
\end{aligned}
$$

However notice that $W_k^HAV_k = T_k$, this is from the recurrence relationship assert by the Bi-Lanczos Algorithm multiply $W_k^H$ on the left hand size of the recurrence for subspace $V_k$ then we obtained the relation. Therefore, the above statement changed into: 

$$
\begin{aligned}
    W_k^H r_0 - T_k y_k &= 0
    \\
    \text{Notice: }W_k^Hr_0 &= \Vert r_0\Vert \xi_1
    \\
    \Vert r_0\Vert \xi_1 &= T_k y_k
\end{aligned}
$$

Because, $r_0$ is from $V_k$, and it's the first element of $V_k$, The columns of these 2 matrices, $V_k, W_k$ are bi-orthogonal (asserted by the Lanczos Algorithm), in the sense that $V_kW_k^H = I$, therefore, $r_0$ is orthogonal to all the rows of matrix $W_k^H$ except for the first row. 

Assume exact arithmetic, then the quantity $y_k$ is computed as $T_k^{-1} \Vert r_0\Vert \xi_1$. 

**Comment**

Via LDU decomposition of the $T_k$ matrix during the runtime of the Bi-Lanczos Algorithm, one can construct Bi-Conjugate vector for the system, ultimately deriving the implementations of the BiCG algorithm listed above. 

Here, observe that, we are manipulating $x_k$ based on the subspace $v_k$, but we are minimizing it on another subspace $W_k$ after putting it through the linear operator $A$. Under this sense, we are doing an oblique projection. See [[Deeper Look into Projector]] and [[Taxonomy and Frameworks of Subspace Projection Method]]. 

---
### **Implict Dual System**

The Bi-Conjugate Gradient algorithm is implcitly solving another system involving $A^H$, and the residual is $\hat{r}_0$, which is used to assist the generation of the subspace $W_k$. The implicity system has $\hat{x}_k$ comming from subspace $\hat{x}_0 + W_k\hat{y}$, and $\hat{r}_k = \hat{r}_0 - A^HW_ky$, which would implies the relations that $\hat{r}_0 = b - A^H\hat{x}_0$. 


---
### **Matrix Factorizations and Blique Conjugate Vectors**

