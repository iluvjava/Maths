prereq: [[Arnoldi Iterations]]

---

### Intro
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

Take note the that matrix $K_n$ is going to be Numerically Unstable especially when there is a Dominating Eigenvalue in the matrix. 

### Key Take-away

The $Q$ matrix of the $QR$ on Krylov Matrix provides the same $Q$ matrix for Similarity Transform to the Hessenberg form for matrix $A$. 
