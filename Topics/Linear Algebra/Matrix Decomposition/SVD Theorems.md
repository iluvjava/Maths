There are a lot of theorem relevant to the Singular Value decomposition and they are really important to understanding on numerical Linear Algebra. 

prereq: [[SVD]], [[Hermitian Adjoint]]


---

### Theorems on Singular Values

#### SVD Theorem 1:
> The nonzero singular values of A are the square roots of the nonzero eigenvalue of $AA^H$ or $A^HA$

Proof sketch: 
1. The matrix $A^HA$ and $AA^H$ share the same nonzero eigen values. 
2. Using the (1.), we know that the eigen decomposition of the the Hermitian matrix will have the diagonal matrix with the same non zero scalars. (By properties of the Hermitian Adjoin Operator)
3. Link the singular values with the Eigen Decomposition of the $A^HA$ and the $AA^H$

Proof on (1.0): 

Suppose that $\lambda\neq 0$ is an eigen value for the matrix $A^HA$, say that $x$ is the corresponding eigen vector for that eigen value. Then we can say the following: 

$$A^HAx = \lambda x$$

Now consider: 

$$AA^H(Ax) = A(\lambda x) = \lambda Ax$$ 

And then we will know that, the value $\lambda$ is also an eigen value for the matrix $AA^H$ and the corresponding eigen vector is $Ax$

Notice that, we can also start with $AA^Hy = \gamma y$, then we can prove in the other direction and find the equivalence. 

Therefore, The matrix $A^HA$ and the matrix $AA^H$ has the same set of non-zero eigen values. 


(2.0)

$$A^HA \in \mathbb{C}^{m\times m}$$ and $$AA^H \in \mathbb{C}^{n\times n}$$

The rank of the matrix $A^HA$ will be the same as the rank of the matrix $A$, this is the case because for any vector $x: Ax = \mathbb{0}$, $A^HAx = \mathbb{0}$. 

Otherwise, if $Ax\ne \mathbb{0} \wedge x \ne \mathbb{0}$, then it will be the case that: 
$$x^HA^HAx \ne \mathbb{0}$$
Implying that $$A^HAx \ne \mathbb{0}$$

Therefore: 
> $$\text{rank}(A^HA) = rank(A)\leq m$$

Similarly, if we substitute $A$ as $A^H$, then we will have: 

>  $$
>  rank(AA^H) = rank(A^H) \leq n
>  $$

And hence we can deduce that:

The number of eigen values for $A^HA$ and $AA^H$ is less than or equals to $\min(m, n)$ and for none-zero eigen values, they are the same. 
(2.1)

Consider the Eigen decomposition of the matrix $A^HA$ and $AA^H$

$$
	A^HA = Q_1\Lambda_1Q_1^H
$$

$$
	AA^H = Q_2 \Lambda_2 Q_2^H
$$

Where $\Lambda_1 \in \mathbb{C}^{n\times n}$, and $\Lambda_2\in \mathbb{C}^{m\times m}$ And we sort all the eigen values in descending order, then all the non zero diagonal will match on the 2 matrices. 

(3.0) Using the idea of SVD, we can get $A^HA$ and $AA^H$ related to the matrix $A$ if we assume that $A = U\Sigma V^H$, and this will give us that: 

$$
	A^HA = V\Sigma^2V^H
$$

And then: 

$$
	AA^H = U\Sigma^2 U^H
$$

Then, we can sort all the Singular Values in $\Sigma^2$ and then match it with the first non zeros entry in the $\Lambda_1$ and the $\Lambda_2$ matrix. 

Therefore, The singular values are the squared nonzero eigen values of $A^HA$ and $AA^H$.  $\blacksquare$

**Note**:  It's after this proof that I realized that, statement (2.0) might not be directly relevant to the proof. 

---

#### SVD Theorem 2: 

> $A = A^H \implies$ the singular values are the absolute values of the eigen values of A. 

Proof: 

The the eigen decomposition of matrix A be represented as $A = Q \Lambda Q^H$ where $\Lambda$ is a diagonal matrix of real numbers. (by properties of Hermitian matrix and the matrix $A$ is Hermitian)

Consider the product $A^HA$ if the eigen decomposition is given: 

$$A^HA = (Q\Lambda Q^H)^H(Q\Lambda Q^H) = (Q\Lambda Q^H)(Q\Lambda Q^H) = Q\Lambda^2 Q^H$$

On the other hand we also know that the  Eigen decomposition of the matrix $A^HA$ is linked to the singular values of the matrix $A$ by the formuta(By SVD of matrices): 

$$A^HA = V\Sigma^2 V^H$$

And both expression are the Eigen decomposition of the matrix $A^HA$, and here we will be able to obtain the following relationship: 

$$\sqrt{\Lambda^2} = \Sigma = |\Lambda|$$

And hence, the statement "The Singular Value are the absolute values of the eigen values of A" is proven. 

---
#### SVD Theorem 3

> The absolute value of the determinant of a matrix is the product of all its singular values. 

To proof this problem we need to use the following properties of matrices determinant

$$\det(AB) = \det(A)\det(B)$$ $$
\det(U) = \pm 1 \quad \text{Where U is unitary}$$ $$
\det(A^H) = \det(A)$$

Where the last one can be proved with the QR decomposition of the matrix. 

Another property we are going to use is the fact that: 

$$\det(A) = \prod_{i}\lambda_i$$

Consider: 
$$\det(A^H)\det(A) = \det(A)\det(A) = (\det(A))^2$$

But by SVD, we know that $\det(A^HA) = \det(V\Sigma^2 V^H)$ which is telling us that: 

$$\det(A^HA) = \det(V\Sigma^2 V^H) = \det(\Sigma)^2$$

This is true by properties of the matrix determinant. In addtion, the determinant of a diagonal matrix is the product of all of it's diagonal enties, and hence we have: 

$$\det(A)^2 = \det(\Sigma)^2 = \prod_i{\sigma_i^2}$$ $$\det(A) = \prod_i{|\sigma_i|}$$
Note: $\Sigma$ is a real matrix. 

We have shown that the absolute value of the matrix determinant is the product of all of the absolute values of the singular values. 