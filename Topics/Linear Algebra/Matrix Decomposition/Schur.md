## Shur's Decomposition

[Course Notes](http://pfister.ee.duke.edu/courses/ecen601/notes_ch8.pdf)

prereq: [[SVD]]
prereq: [[Matrices]] read about normal matrix. 

---
$A \in \mathbb{C}^{n\times n}$, this is a square matrix with complex entries and it's a normal matrix. 

Now we also assume that the matrix is normal so that: 

$$A^HA = AA^H$$

Now consider the SVD decomposition of such a matrix, we will get that: 

$$V\Sigma^2V^H = U\Sigma^2U^H$$

For the Eigen value decomposition of the product, and it's implied that $U = V$

And then in this case, we  will know that, the matrix can be decompose into: 

$$A = U\Sigma U^H = V\Sigma V^H$$

Where $U$, $V$ are unitary matrices and the $\Sigma$ is the matrix with all the singular values. 

Notice that, if a matrix is normal, then it has to be diagonalizable and at the same time it will have an orthogonal basis as its eigen basis. 

--- 

### Interesting Fact: 

When the matrix is normal, the singular values of the matrix are the absolute eigen values of the original matrix. 

This is followed from the theorems from SVD, [[SVD Theorems]]



