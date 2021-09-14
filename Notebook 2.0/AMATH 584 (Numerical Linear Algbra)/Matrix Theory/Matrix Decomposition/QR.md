QR Decomposition 

---

## A = QR
* $Q$ is an ortho matrix
	* Or orthogonal projector
* $R$ is an upper triangular matrix 

### Notations
* $\langle a_1, a_2...\rangle$ denotes the subspace spanned by a set of matrices. 

### Factorization
* Consider the columns of the matrix $A$, it's certain that: 
	* $\langle a_11\rangle\subseteq \langle a_21, a_3\rangle \subseteq \langle a_1, a_2, a_3\rangle \cdots$
	* We want to construct a sequence of $q_i$ vectors that are all orthogonal and span the sequence of subspaces. 

* A Full QR looks like this: ![[fullQR.png]] where the Ortho matrix is squared, with the same height as the A matrix. 
* Those columns and rows of Q and R which doesn't play any roles are called the Silent Row/Columns. 


--- 

### Classical GS Scheme

Recursively, consider a set of orthogonal vectors, in the form of $q_1, q_2, \cdots q_n$ and a new vector $v$ which has some component that doesn't lie in the subspace spanned by those ortho normal vectors. 


### Householder Transformation

The householder Transformation is a numericall stable scheme, and it's also how Matlab implemented the `qr` function. It uses some very different ideas compare to CGS, see [[Householder Triangularization]] for more. 

### Modified GS 

This fixed some of the numerical insteability using the idea of orthogonal projector, preventing projecting on the existing basis which might have error, see [[Modified GS Process]] for details, algorithms, proofs, and pseudo codes. 