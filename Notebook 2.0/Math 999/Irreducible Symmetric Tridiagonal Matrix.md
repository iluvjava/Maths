
### **Intro**
> An irreducible real symmetric tridiagonal matrix is a symmetric tridiagonal matrix that doesn't have any zeros in its upper and lower subdiagonals. 


1. The matrix is invertible
2. The matrix has all unique eigenvalues
3. [[Lanczos Iteration]] generates such matrix, always. 


**Remark**:
The term irreducible refers to the fact that if the matrix is representing a graph (after normalizatoins), then it will be a graph that is all connected. Which basically means that it's impossible to permuate the matrix in such a way that makes it into a block diagonal matrix, and it's a result of the fact that the sub and super diagonal of the matrix are all non-zeros. 


---
### **Proof**

1. Characteristic polynomial of $T_k$ has all simple roots without repetitions.
2. The matrix is diagonalizable because it's symmetric. 

(1.) AND (2.) IMPLIES

3. For contradictions, If the matrix has repeated roots, we know it's diagonalizable, then it vialates (1.) because the characterstic polynomial will have roots with more than 1 algebraic multiplicity.  Therefore, such a matrix must have all distinct eigenvalues. 
 
---
### **Characteristic Polynomial of $T_k$ has Simple Roots**

Let $T_k$ be symmetric tridiaognal $k\times k$ matrix, its all sub/super diagonals are nonzeros. Consider the submatrix $(T_k - \lambda I)_{2:k, 1:k-1}$ with the first row and last column removed. Regardless of $\lambda$, $(T_k - \lambda I)_{2:k, 1:k-1}$ whose diagonals are the sub diagonals of $T_k$, which is all non-zero. Hence $\text{det}((T_k - \lambda I)_{2:k, 1:k-1})\neq 0$. 

The determinant of $(T_k - \lambda I)_{2:k, 1:k-1}$ is always full rank implies that the full matrix $T_k - \lambda I$ has a rank of at least $k - 1$ for all $\lambda$; which implies that all roots of $\det(T_k - \lambda I)$ has algebraic multiplicity of strictly 1. 

