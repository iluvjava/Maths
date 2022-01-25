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




