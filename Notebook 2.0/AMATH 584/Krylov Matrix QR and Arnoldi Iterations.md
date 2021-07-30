prereq: [[Hessenberg Transform with Arnoldi Iterations]], [[Hessenberg Transform intro (HS Reflector)]]

[IIT Math Lecture Notes](http://www.math.iit.edu/~fass/477577_Chapter_14.pdf)

[Tyler Chen's PDF](https://chen.pw/research/cg/cg.pdf)

---
### **Intro**

Major Objective: 

> There is a connection between the QR decomposition on Krylov Subspace and the Arnoldi iterations that puts the matrix into upper Hessenberg form. 

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

> Using QR on Krylov Subspace can also directly give us the Hessenberg form of matrix $A$, which then makes the $Q_n$ matrix from Anoldi Iterations the same as the $Q_n$ matrix from applying QR factorization on Krylov Subspace of $A$. [^1]

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

> The Characteristic polynomial of the companion matrix $C_n$, is $|(C_n - \lambda I)| = 0$ which is : 
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
$C_nR^{-1}$ is Hessenberg form, multiplying on $R$ keeps the Hessenberg form. By definition, this is a hessenberg transform on matrix $A$. [^2]


Therefore, $\tilde{H}_n$ has the same eigenvalues as $C_n$, therefore, $\tilde{H}_n$ has the same eigenvectors as $A$. 

Therefore, the $\tilde{H}_n$, Hessenberg matrix for $A$ has the same eigenvalue as the matrix $A$. **Claim 1** is proven. $\blacksquare$. 

In part (5), the $Q_n$ is from the QR factorization on $K_n$, And it's the same unitary transformation that gives the Hessenberg, **Claim 2** is proven $\blacksquare$. 


---
### **Another Proof for Claim 2**

Different from the previous proof, this claim consider the recurrence of the orthogonal vectors **without assuming that the Krylov Subspace of the matrix exists**. 

This proof is collected from Tyler Chen, a student who is in the same department as mine, [link](https://chen.pw/research/cg/arnoldi_lanczos.html) to his explanation. 

Start by assuming inductively that at the $k$ iterations of the Arnoldi iterations, the following facts hold: 

* $\langle q_1, q_2, \cdots, q_k\rangle = \langle b, Ab, \cdots A^{k - 1}b\rangle$, the subspace span by the vectors from the orthogonalization is the same as the Krylov Subspace. They have the alternative notations of $\langle Q_k\rangle$ and $\langle K_{k}\rangle$. 

By the assumption that $q_k$ is a vector in the subspace spanned by columns of $K_{k}$, we have the expression that:  

$$
\begin{aligned}
	q_k &= c_0 + c_1 Ab + c_2 A^2 b + \cdots + c_{k - 1}A^{k - 1}b
	\\
	Aq_k &= c_0Ab + c_1 Ab^2 + c_2 A^3 b + \cdots + c_{k - 1}A^{k}b
	\\
	Aq_k &= \underbrace{\sum_{i = 0}^{k - 2}\left(c_{i} A^{i + 1}b\right)}_{\in \langle K_{k - 1}\rangle}
	+ c_{k - 1}A^{k}b
\end{aligned}\tag{6}
$$

The arnodi iterations will orthogonalize the vector $Aq_k$ against the subpsace $\langle Q_{k - 1}\rangle$, or $\langle K_{k - 1}\rangle$. Consider: 

$$
\begin{aligned}
	q_{k + 1} &= \underset{\langle Q_k\rangle^\perp}{\text{proj}}
	(Aq_k) = \underset{\langle K_{k -1}\rangle^\perp}{\text{proj}}(Aq_k)
	\\
	&= \underset{\langle K_{k -1}\rangle^\perp}
	{\text{proj}}
	\left(
		\underbrace{\sum_{i = 0}^{k - 2}\left(c_{i} A^{i + 1}b\right)}_{\in \langle K_{k - 1}\rangle}
		+ c_{k - 1}A^{k}b
	\right)
	\\
	&= 
	\underset{\langle K_{k -1}\rangle^\perp}{\text{proj}}
	\left(
		c_kA^kb
	\right)
\end{aligned}\tag{7}
$$

**Notation** 

Here, the $\text{Proj}$ operator projects the vector into the subspace noted by the subscript and then describe the vector under the standard basis.

The above statement says that equivalence between orthogonalizing $Aq_k$ onto the previous QR Subspace ($Q_k$) and orthogonalizing $A^kb$ onto the previous Krylov Subspace $K_{k - 1}$. 

**Claim 2** $\blacksquare$ 


---
### **The Recurrences Between the $q$ Vectors**

This gives us a much general formulations of the matrix using the Hessenberg's forms and the vector orthogonalized using the Krylov Subspace. 

This is the recurrence relations: 

$$
\begin{aligned}
	AQ_k &= Q_kH_k + h_{k + 1}q_{k + 1}\mathbf{e}_k^T = Q\tilde{H}_k 
\end{aligned}
$$

This can also be interpreted directly from the algorithm, and remember $Q_k$ is literally the QR decomposition on the Krylov Subspace of the matrix $A$. 



[^1]: My instinct is that, we can choose the $b$ matrix in Arnoldi iterations to produces the same $\tilde{H}_n$ as the one created by HS reflector.  
[^2]: Eliminating the upper triangular part of the matrix $R$ calls for a upper triangular matrix $U$, whose diagonal are ones. Combining with another diagonal matrix, it will reduce the matrix $R$ into identity. Multiplying diagonal with an upper diagonal is still upper diagonal. Therefore, $R^{-1}, R$ are all upper diagonal matrices. But $C_nR^{-1}$ will shift down the diagonal, hence multiplying $C_nR^{-1}$ with $R$ is still upper Hessenberg form. 