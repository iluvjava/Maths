In this file we are going to see some modern approach to the Eigen Decomposition algorithms, which should give us better perspective on things. 
[[Eigen Decomposition Algo]]
[[Schur Decomposition]]

---

### Intro

Modern computing methods for the Eigenvalue/EigenVector problem uses the following computing architecture: 

* Reducing the matrix to Hessenberg Upper Triangular Form, and tridiagonal form for Hermitian Matrix. 
	* Preserving similarity transform during the process. 
* Iteratively reduce the Hessenberg form into a diagonal form. 

---

### Hessenberg Upper Triangular Form

$$
\begin{bmatrix}
	? & ? & ? & \cdots
	\\
	? & ? & ? & \cdots 
	\\
	  & ? & ? & \cdots
	\\
 	  &   & ? & \cdots
	\\
	  &   &  \vdots &
\end{bmatrix}
$$

Instead of upper triangular, we have to adapt the structure of the matrix to Hessenberg form where a diagonal that is one level lower than the triangular one is added to the matrix. 

This is needed for decomposition because of the similarity transform, which is the only way to adapt for the left and multiplications of a Unitary Transformation matrix. 

Similarity Transform to Hessenberg Form with Unitary Matrix is like: 

$$
Q_j^HQ{j - 1}^H \cdots Q_1A Q_1Q_2\cdots Q_q = H_j
$$

And this is how the j $th$ step looking like for the A matrix, and $H_j$ is partially Hessenberg form. Observe that, unlike OR, we have to multiply on both side to retain the similarity transform of the matrix $A$ to the $H$, Hessenberg Matrix. 


#### Algorithm Approach

read: [[Householder Triangularization]]

The same matrix $Q$ for the household transformation is recursively applied to the matrix to reduce it to Hessenberg Form. 

![[Householder Reduction to Hessenberg Form.png]]

From: Trefethen's Book page 198

**Comment**
A similar approach is used for the SVD decomposition algorithm, but instead of operating on one bases, that algorithms is operating on 2 basis, and it's reducing the matrix with diagonal form with only one upper sub diagonal, and then it starts iteratively reducing that matrix to a diagonal matrix to form the $\Sigma^2$ in the SVD decomposition. 

---
### Iterative Diagonalization

This process is usually very diverse, after the construction of the Hessenberg form, we iterate and get to the Triangular form, and that will give us the Schur Decomposition of the matrix. 

Consider the case when the matrix is **Hermitian**, the Hessenberg reduction will give a Tridiagonal Form matrix, which will speed up the iterations process. And there are a lot of good properties associated with the Tridiagonal Matrix. 



[[The QR Algorithm]]