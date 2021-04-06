## Shur's Decomposition
[Course Notes](http://pfister.ee.duke.edu/courses/ecen601/notes_ch8.pdf)

prereq: [[SVD]] When the matrix happens to be normal, then the Shur decomposition is the the same as the SVD decomposition for the normal matrix (possibly with different signs), not only that, it will also be the Eigen Decomposition of the matrix too, which is really cool. 
prereq: [[Matrices]] read about normal matrix. 


---

### Intro 
The Schur decomposition is applicable to **all square matrices** even if when the matrix is defected. 

> $$A = QTQ^H$$ 

Where the matrix A is expressed using the unitary matrix $Q$ and a Upper Triangular Matrix $T$

This is the **KEY** to Eigenvalue problems. 

#### Proof 

The proof is inductive. 

#### Inductively: 

Let the matrix $A$ be an $m\times m$ complex matrix. 

Let the matrix $U$ be a unitary matrix but with the first $n$ element be the orthogonal eigenspace with egenvalue of $\lambda$. 

Augment the matrix $U$ such that from column $n$ to $m$, all of them are orthogonal and unitary. 

Consider the following way of write the matrix A: 

$$U^H A U$$

It's not hard to see that the it can be decomposed into: 

$$
U^H A U = \begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & C
\end{bmatrix}
$$

Where $B$ and $C$ are submarices and the matrix $I$ is $n\times n$, relevant to the dimension of the eigenspace of the given vector. 

For induction, assume that there also exists an Shcur decomposition for the submatrix $C$ then, for example let's say that: 

> $$C = VTV^H$$

Then the $U^HAU$ can be expressed as: 

$$
U^H A U = \begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}
$$

Ok, so amazingly, I have a matrix $A$ that can prof this inductive hypothesis. The matrix $Q$ is going to be: 

> $$
> Q = U \begin{bmatrix} 
I & \mathbf{0}\\ \mathbf{0} & V
\end{bmatrix}
> $$

Consider: 

$$
A = U\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}U^H
$$

And then let's multiply left hand side by $Q^H$

$$
Q^HA =
\begin{bmatrix} 
I & \mathbf{0}\\ \mathbf{0} & V^H
\end{bmatrix}U^H
U\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}U^H
$$

$$
Q^HA =
\begin{bmatrix} 
I & \mathbf{0}\\ \mathbf{0} & V^H
\end{bmatrix}\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}U^H
$$
Multiply the right hand side by the matrix $Q$ then we have: 
$$
Q^HA =
\begin{bmatrix} 
I & \mathbf{0}\\ \mathbf{0} & V^H
\end{bmatrix}\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}U^H
U \begin{bmatrix} 
I & \mathbf{0}\\ \mathbf{0} & V
\end{bmatrix}
$$

$$
Q^HA =
\begin{bmatrix}
	I & \mathbf{0}\\ \mathbf{0} & V^H
\end{bmatrix}\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}
\begin{bmatrix} 
	I & \mathbf{0}\\ \mathbf{0} & V
\end{bmatrix}
$$

And after multiplying these component into the matrix, we have: 

$$
Q^HAQ =
\begin{bmatrix}
	I & \mathbf{0}\\ \mathbf{0} & V^H
\end{bmatrix}\begin{bmatrix} 
	\lambda I & B 
	\\ 
	\mathbf{0} & VTV^H
\end{bmatrix}
\begin{bmatrix} 
	I & \mathbf{0}\\ \mathbf{0} & V
\end{bmatrix}
$$

$$
Q^HAQ = \begin{bmatrix} 
	\lambda I & BV
	\\
	\mathbf{0} & T
\end{bmatrix}
$$

Notice that the matrix is upper triangular. 

#### Demonstrating the Base Case

For base case we are going to consider when the matrix is $2 \times 2$, it's not hard to prove it, and the V matrix is literally just a scalar, and that will automatically make the decomposed $2 \times 2$ a upper triangular matrix. 

---
### Corollary: Spectral Theorem

When the matrix $A$ is Hermitian, the the matrix $T$ in the middle will become a diagonal matrix, hence **Hermitian are Diagonalizable** . This is the case because let's say that: 

$$A = Q^H TQ$$

And $A$ is Hermitian so that $A^H = A$, then applying the Hermitian to the 3 matrices we will have: 
$$
A^H = Q^H T^HQ = A = Q^HTQ
$$

Which is saying that $T^H = T$. 

Schur's decomposition assures that the $T$ is upper-triangular, therefore, it has to be the case that $T$ is diagonal. 

Therefore, for all Hermitian matrix are diagonalizable because they are similar to a diagonal matrix. 
