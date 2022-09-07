Matrices: Shapes, Properties, basically matrices that has some kind of name or tag attatch to it. 

---
* Diagonal Matrix
	* Non Diagonal entries are all zeroes.
* Normal Matrix
	* A matrix is normal if it commute with its Conjugate Transpose which means that $$A^HA = AA^H$$
	* [Normal Matrix](Normal%20Matrix.md)


* Similar Matrix
	* $A$ and $B$ are squared matrices
	* $A$ and $B$ are similar if there eixsts $M$ such that $B = M^{-1}AM$, relation is symmetrical. 
		* It's also transitive
	* Similar Matrices have the same eigen values.

* Diagonalizable Matrices
	* Matrices that are similar to the diagonal matrix, where the eigen values are in the diagonal. 

* Unitary Matrix
	* $Q^{-1} = Q^T$ when it's a square matrix $QQ^T = I$, in the case where $Q\in \mathbb{C}^{n\times n}$, then $Q^HQ = I = QQ^T$.
	* See [Unitary Matrix](Unitary%20Matrix.md) for more

* Symmetric Matrices/Hermitian Matrices
	* $A^T = A$ or $A^H = A$
	* Diagonalizable
	* Has only real eigenvalues
	* The $A^*$ and $A$ are adjoint operators of each other. 
	* Has a orthogonal Eigen basis
	* This matrix is exploited for: 
		* [SVD](Matrix%20Decomposition/SVD.md)
	* Read more on [Hermitian Adjoint](Hermitian%20Adjoint.md), which talks about the Hertian matrix in more details 
* Legendre Matrix
* DFT Matrix
* Gramian Matrix 
	* This is the inner product matrix, where each of the entry is representing the inner product of 2 elements. 
* Projector
	* A projector matrix is $P^2 = P$
	*  See more here: [Projector](Projector.md)

* Penrose Psuedo Inverse 
	* $A^\dagger = (A^HA)^{-1}A$
	* And we assume that the matrix $A$ is full-ranked matrices, meaning that all the columns of the matrix is linearly independent. 
			