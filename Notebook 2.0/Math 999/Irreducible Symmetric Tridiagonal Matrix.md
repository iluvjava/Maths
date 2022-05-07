
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

3. If the matrix has repeated roots, and it's diagonalizable, then it vialates (1.) because the characterstic polynomial will have roots with more than 1 algebraic multiplicity. Therefore, such a matrix must have all distinct eigenvalues. 
 



