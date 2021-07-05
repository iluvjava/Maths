prereq: [[Arnoldi Iterations]]
[Reference Materials](http://www.math.iit.edu/~fass/477577_Chapter_14.pdf)


---
### **Intro**
The Krylov subspace is spanning the same space as the $Q$ matrix of the Hessenberg Similarity Transform. 

The Arnoldi Iterations assert this fact, and it can be consider the that Krylov Matrix written as the following: 

$$
K_n = 
\begin{bmatrix}
	\\[1em]
	b & Ab & Ab^2 & \cdots A^{n - 1}b
	\\[1em]
	\\
\end{bmatrix}
$$

Is spanned by the orthogonal subspace: 

$$
K_n = Q_nR_n
$$

The Krylov matrix is given by the product of the $Q$ matrix from the Arnoldi Iterations and the $R$ Matrix can be computed after we produced the $Q$ matrix from the Arnoldi Iterations. 

**Warning**: 

Usually, $K_n$ is very numerically unstable, and hence we only use the matrix in theoretical analysis, not actual implementation of numerical algorithm. 

**Observation**:

Representing $b$ using eigenvectors of $A$, and this $K_n$ will tell use a lot about the Eigenvectors of the matrix $A$. 


---
### **In Relations to Arnoldi Iterations**

**Claim 1**

> The matrix $\tilde{H}_{n}$ from the Arnoldi iterations either by Modified GS, or the Householder Triangularization, will have the same eigenvector as the matrix $A$. 

**Claim 2**

> Using QR on Krylov Subspace can also directly give us the Hessenberg form of matrix $A$, which then makes the $Q_n$ matrix from Anoldi Iterations the same as the $Q_n$ matrix from applying QR factorization on $A$. [^1]

**Consider:**

$$
\begin{aligned}
	K_n &= \begin{bmatrix}
	b & Ab & A^2b & \cdots & A^{n - 1}b
	\end{bmatrix}
	\\
	\implies 
	AK_n &= K_{n + 1}[:, 2:] = \begin{bmatrix}
		Ab& A^2b & A^3b & \cdots & A^nb
	\end{bmatrix}
	\\
	AK_n &= K_n \begin{bmatrix}
		e_2 & e_3 & e_4 \cdots e_n & c
	\end{bmatrix}
\end{aligned}\tag{1}
$$

Now, we make the assumption that $K_n$ is invertable, so that means the matrix is full rank by my instinct. Then the following can be said: 

$$
\begin{aligned}
	(AK_n)[:, -1] &= K_nc
	\\
	A^{n}b &= K_n c
	\\
	c &= K_n^{-1}A^nb
\end{aligned}
\tag{2}
$$

**Define:** 

$$
C_n = \begin{bmatrix}
	e_2 & e_3 & \cdots & e_n & c
\end{bmatrix}
\tag{3}
$$

This is $C_n$ famous and it's called the **Companion Matrix**

**Claim 4 Without Proof**

> The Characteristic polynomial of the matrix $C_n$, the $|(C_n - \lambda I)| = 0$ is : 
> $$
> 	|C_n - \lambda I| = z^n + \sum_{i = 1}^{n} c_iz^{i - 1}
> $$
> Where $c_i$ is from the vector $c$. 


continue from part (2) we have: 

$$
\begin{aligned}
	AK_n &= K_nC_n
	\\
	K_n^{-1}AK_n &= C_n
\end{aligned}\tag{4}
$$

Since $A$ is similar to $C_n$ they share the same eigenvalues, therefore, we can find the eigenvalues for matrix $C_n$, then we find the eigenvalues for $A$. We are on our way to **claim 1**. 

Consider applying QR factorization on $K_n$, then we have the following argument: 

$$
\begin{aligned}
	K_n^{-1}AK_n &= C_n	
	\\
	(QR)^{-1}AQ_nR &= C_n
	\\
	R^{-1}Q_n^HAQ_nR &= C_n
	\\
	Q_n^HAQ_n &= \underbrace{RC_nR^{-1}}_{\tilde{H}_n}
\end{aligned}\tag{5}
$$

**Observe**
$C_nR^{-1}$ is Hessenberg form, multiplying on $R$ keeps the Hessenberg form. By definition, this is a hessenberg transform on matrix $A$. 


Therefore, $\tilde{H}_n$ has the same eigenvalues as $C_n$, therefore, $\tilde{H}_n$ has the same eigenvectors as $A$. 

Therefore, the $\tilde{H}_n$, Hessenberg matrix for $A$ has the same eigenvalue as the matrix $A$. **Claim 1** is proven. $\blacksquare$. 

In part (5), the $Q_n$ is from the QR factorization on $K_n$, And it's the same unitary transformation that gives the Hessenberg, **Claim 2** is proven $\blacksquare$. 



[^1]: My instinct is that, we can choose the $b$ matrix in arnoldi iterations to produces the same $\tilde{H}_n$ as the one created by HS reflector.  