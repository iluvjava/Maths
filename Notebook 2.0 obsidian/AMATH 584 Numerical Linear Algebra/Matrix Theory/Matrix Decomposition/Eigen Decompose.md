The Eigenspace decomposition is really useful for SVD and raising power on the matrix in an efficient way. 
Read more on wiki: [link](https://www.wikiwand.com/en/Eigenvalue_algorithm)


---
### **Intro**

The Eigen decomposition is the one everyone got introduced in their beginner class. 

> $$A = X \Lambda X^{-1}$$

Notice that we are talking about the generalized Eigen decomposition. 


When the Eigendecomposition of a matrix exists, then it's a **diagonalizable** matrix. 

And the Eigenvalues are called the **Spectrum** of the matrix. 

But also, if the matrix is not diagonalizable, then we will have to use the Jordan Decomposition to do it. Which is kinda hard to do numerically. 

---
### **Geometric Multiplicity**

> $$
> \text{rank}(\text{null}(A - \lambda_i I))
> $$

---
### **Algebraic Multiplicity**

The multiplicity of the $(\lambda - \lambda_i)^k$, in the characteristic equation. 

---
### **Defective Matrix**

When there is an eigenvalue where, its geometric multiplicity and the algebraic multiplicity doesn't match, so the span of the $A - \lambda_iI$ matrix is not enough. 

One example of the defected matrix is the following: 

$$
\begin{bmatrix}
2 & 1 & 0 \\
0 & 2 & 1 \\ 
0 & 0 & 2
\end{bmatrix}
$$

This is a matrix that has an **Eigenvalue**, $\lambda= 2$  with geometric multiplicity of 3 but with a algebraic multiplicity of 2. And it's **defective**.

 --- 
### **Similarity Transform**

So, given a matrix, we want to see what is the matrix that is similar to it, luckily, we have a way to do that: 

$$
B = X A X^{-1}
$$

Where the $X$ matrix is the eigenspace of the matrix A. This is just a more specific case of matrix similarity where the matrix $X$ happens to be the Eigen space of the matrix $A$. 

---
### **Comments**

This is very useful when the matrix is Hermitian, it's a super good news because we have a stable algorithm to do the decomposition, and the matrix is guaranteed to be diagonalizable. 

However, when there are 2 eigenvalues that are super close to each other, then it's going to be a bad news because it could be a result due to numerical instability, or it will trigger that sometimes too. 
