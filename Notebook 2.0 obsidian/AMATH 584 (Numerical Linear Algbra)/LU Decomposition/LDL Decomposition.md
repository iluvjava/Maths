[[LU Decomposition Remastered]]


---
### **Intro**

The LDL decomposition is a general decomposition for symmetric matrices. 

> $$A = LDL^T$$ 
> Where $L$ is lower triangular with ones on the diagonal and $D$ is a diagonal matrix. 

When the symmetric matrix is positive definite, this decomposition is applicable. 

**Feasibility of such a thing**

**Claim 1**

> LDL decomposition is possible, when the matrix A is positive definite, or semi-definite. This will mean that $A = MM^T$

Take note that: 

$$
\begin{aligned}
A &= M^TM
\\
A &= (QR)^T(QR)
\\
A &= (R^TQ)(QR)
\\
A &= R^TR
\end{aligned}
$$

It's possible to find a $RD$ where $D$ is a diagonal matrix for every given strict upper triangular matrix $R$. More specifically: $D_{i, i} = R_{i, i}$, then in that case, we have $A = R^TD^2R$, this is the form anticipated by the $LDL$ decomposition. 

**Claim 2**

> $LDL$ decomposition is just LU decomposition performed at 2 sides of the matrix. 




