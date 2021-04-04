# Singular Value Decomposition

Notations: * is the complex conjugate transpose

Relevant Resources: [link1](http://pfister.ee.duke.edu/courses/ecen601/notes_ch8.pdf)
Mit Lecture Notes on SVD: [link2](https://math.mit.edu/classes/18.095/2016IAP/lec2/SVD_Notes.pdf), 
* Singular eigen vector of $A$ and $A^TA$ 


---

* Applied to matrix of all sizes, real and complex, $M = U\Sigma V$ sometimes it's written differently as $M = U\Sigma V^*$, but it's the same thing and it's one conjugate transpose away. 
	* $U, V$ are ortho matrices. $\Sigma$ is a diagonal matrix, don't have to be squared, and that is how we can get full SVD. 
	* $M\in \mathbb{R}^{m \times n}$
	* $U\in \mathbb{R}^{m \times m}$
	* $\Sigma \in \mathbb{R}^{m \times n}$
	* $V\in \mathbb{R}^{n \times n}$
* A bit of a intuitions
	* It's like eigen decomposition, but we have 2 ortho matrices that "adapts" vector from intput subspace and output subspace. 

---

## Ideas Behind
* Facts about Symmetric Matrices (Or Hermitian): 
	* Has Only real Eigen values
	* Always Diagonalizable 
	* Has orthogonal Eigenvectors
* Then, using this property, we can say the following about the eigen decomposition of $M$ and the SVD decomposition of M. 
* Consider $M^*M$
	* $M^*M =(U\Sigma V)^*(U\Sigma V) = (V^*\Sigma^* U^*)(U\Sigma V)$
	* $M^*M =V^*(\Sigma^*\Sigma) V$
* Similarlly, we can Harmitant the other way and get: 
	* $MM^* = U(\Sigma\Sigma^*)U^*$
* Now, we use the properties of **Symmetric/Harmitian Matrices**:
	* $V^*$, as a Ortho Matrix, is the Eiven space of $M^*M$ and similarly, $U$ is the Ortho Matrix, of Eigen Space of $MM^*\;$
	* $\Sigma = \sqrt{D}$ where D is the Diagonal Matrix of the  Eigen values of $M^*M$ or $MM^*$ (Depending on whether it's Skinnier or Fat...?) Also, agumentation padded with zeroes are needed to get non-squared $\Sigma$ matrix.
	* More on Symmetric/Hermitian Matrices: [[Hermitian Adjoint]]
* Geometric Interpretations: 
	* The matrix does nothing but the following: It rotates and stretches the inputs vector and that is all what it does, and hence, the unitary matrix $U$ and the unitary matrix $V$. 
	* The transformation is literally, decompose any vector into an ortho basis, rotates the bases and the stretch the vector along the directions of the basis vector, and then deform the hypershphere from the input space into a eclipse in the hyper space. 
* Subspace Interpretations 
	* $V^*$ Describes the inputs in alternative ortho subspace under the input space $\mathbb{R}^n$. 
	* $\Sigma$ Takes in the description from $V^*$ and then scaled it a bit. 
	* $U$ Rotates, change orietation, on the output space $\mathbb{R}^m$
* Something Interesting to Notice: 
	* Observe that, one the third step of the derivation, it is implied that $A^*A$ and $AA^*$ are sharing the same set of eigen values (ginore zeroes), if such a decomposition exists, this will be a good way to check things which I don't know why yet but its interesting.

---
## SVD
$$
A = U\Sigma V^* = \sum_{i = 1}^{\min(m, n)}\sqrt{\sigma}u_iv_i^T
$$
Where $u_i$ and $v_i$ are just column vectors for matrix $U$ and $V$. Cool, we have outer product of vectors again.

---
## How To do SVD
* Find the eigen vec and values for $A^TA$
* Order the Eigen values in decreasing order for $\Sigma$, and remember to take the square root of those eigen values of $A^TA$
* Get $U$ matrix using $AV = U\Sigma$
### Full SVD
* Just pad $\Sigma$ with zeroes so that the matrix $U$ can be a square matrix. 

---

## Simple Demo
We are just going to use a simple 2 by 2 diagonal matrix
$$
A = \begin{bmatrix}
3 & 0 \\
4 & 5
\end{bmatrix}
$$
Getting something about the eigen values
$$
(3 - \lambda)(5 - \lambda) = 0
$$
Giving us: $\lambda_1 = 3$ and $\lambda_2 = 5$, which is, going to be used for comparison for the eigen values for the Symmetric Semite Definite matrix later. 
$$
A^TA = \begin{bmatrix}
25 & 20\\ 
20 & 25 
\end{bmatrix}
\quad 
AA^T = \begin{bmatrix}
9 & 12 \\ 
12 & 41
\end{bmatrix}
$$
**Observe**: $Tr(A^TA) = Tr(AA^T); \quad Tr(\Sigma)=|A|$, let's try to find the eigen vectors: 
  * $(25 - \lambda)(25- \lambda) - 200 = 0$
  * $\lambda^2 - 2\lambda + 625 - 200 = 0$
  *  $\lambda^2 - 2\lambda + 425 = 0$
  *  $\sigma_1^2 = 45 = \lambda_1 \quad \sigma_2^2 = 5 = \lambda_2$
  * The eigen vectors for $A^TA$ is: 
$$
v_1 = 
\begin{bmatrix} 
	1\\ 1
\end{bmatrix}
\quad 
v_2
\begin{bmatrix}
	-1 \\ 1
\end{bmatrix}$$
* After this step, we are going to use the fact that $AV = \Sigma U$, where  we already computed the vector in the $V$ matrix. 
* Therefore we can obtain the following: 
$$
\begin{bmatrix}
3 & 0 \\
4 & 5
\end{bmatrix}
\frac{1}{\sqrt{2}}
\begin{bmatrix}
	1 & 1 \\
	-1 & 1
\end{bmatrix}
=
U
\begin{bmatrix}
\sqrt{45} & \\
& \sqrt{5}
\end{bmatrix}
$$
Which is giving us the way to solve for the $U$ matrix in the problem. **Observe** The vector in the $V$ matrix are unitized. After solving for $U$, then we just conugate transpose the matrix $V$ to get the SVD for the matrix.

---
## Things to Take Notice
It's not that easy we still need to take care of somethings when doing SVD. 
#### Ordering of the Eigen Values
* The values on the entry for the $\Sigma$ matrix is in descending order, re-ordering of rows in $V^*$  and the columns in $U$ won't change the transformation, because the $V^*$ will be able to find the correct representation on the ortho basis. More specifically: 
	* $(\Sigma)_{i, i}$ is the $i$ th eigen values, in desceding order, of the matrix $A^TA$
	* $(V)_{:,i}$ is the eigen vector for the corresponding eigen value $(\Sigma)_{i, i}$ for $A^TA$
---
### Connection to Schur's Decomposition

When the matrix under SVD is normal, the decomposition changed into [[Schur Decomposition]]'s Decomposition 

--- 

### SVD Theorems
Important Theorems related the SVD Decomposition are listed here: 

[[SVD Theorems]]