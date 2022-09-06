[[SVM]], [[PCA (Principal Components Analysis)]]

Here we talk about another extension of the PCA method. The Kernel PCA which performs the PCA at a non-linear subspace compare to the original dimension where the data lies in. The same kernel trick used for SVM. 

Reference: [Link](http://www.cs.haifa.ac.il/~rita/uml_course/lectures/KPCA.pdf), and wikipedia 

In practice, people can use [Kernel PCA](https://scikit-learn.org/stable/auto_examples/decomposition/plot_kernel_pca.html#sphx-glr-auto-examples-decomposition-plot-kernel-pca-py) from the `sklearn` library. 

---
### **Intro**
When the features are not necessarily separable under the linear subspace, we will use the kernel tricks to get a better separations in a new dimension. 

Note: The assumption is not the same as the low-rank assumption for the data set.

---
### **Linear PCA**

When computing the singular value decomposition for $X$, one of the approach is to find the Co-variance matrix for $X$. 

$$
V\Lambda V^T = XX^T \quad U\Omega U^T = X^TX
$$

This is feasible because symmetric matrix (Or Hermitian) has orthogonal Eigenvectors, and in addition, the non-zero diagonals of the matrix $\Lambda, \Omega$ are having the same non-zero entries, and they the singular values of the matrix $X$.[^1]

And the principal components, are the $V$ matrix and the profile matrix is the $U$ matrix.  

And the focus here is that, the idea of an inner product matrix, or the co-variance matrix can be generalized here, just like the kernel trick used for the SVM model. 

Here is a note from wikipedia, about the larger over all theme of the kernel PCA method: 

>Because we are never working directly in the feature space, the kernel-formulation of PCA is restricted in that it computes not the principal components themselves, but the projections of our data onto those components

---
### **Kernel PCA**

The key idea is to simplify and use the kernel function $K(x_i, x_i)$ for the given function $\phi$ to describe the kernel PCA. 

Consider a mapping function from the linear feature space to the non-linear feature space: 

$$
x_i \mapsto \phi(x_i) 
$$

Where, $x_i$ is one of the samples in the feature space. 

The kernel PCA will be treating the non-linear space as the new feature space and then apply PCA algorithm in here instead. 

First assume that the data is: 

$$ \mu = \frac{1}{n}\sum_{i = 1}^{n}\phi(x_i) $$

The covariance in the non-linear space is given by: 

$$
C = \frac{1}{n}\sum_{i = 1}^{n}\phi(x_i)\phi(x_i)^T
$$

Where: the matrix is described by a rank one outter produce of the features under the new non-linear space. 

Then the eigenvector of the co-variance matrix is given by: 

$$
Cv = \lambda v
$$

The eigenvector is a linear combination of all the features, giving us: 

$$
v = \sum_{i = 1}^{n}\alpha_i\phi(x_i)
$$

The vector v exists in the non-linear subspace, in the alternative basis.

Then the product $Cv$ is: 

$$
Cv = \frac{1}{n}\sum_{i = 1}^{n}\phi(x_i)\phi(x_i)^Tv = \lambda v
\tag{1}
$$

assuming that $\lambda\neq 0$, then the quantity $v$ will be represented as: 

$$
v = \frac{1}{\lambda n}\sum_{i = 1}^{n}
\phi(x_i)\phi(x_i)^Tv
\tag{2}
$$

The eigenvector of the covariance matrix is now represented as a linear combination of the kernel vector. Next we want the matrix to be expressed as a linear combination of $\phi(x_i)^T$. 

$$
\phi(x_i)\phi(x_i)^Tv = \phi(x_i)(v^T\phi(x_i))^T = v^T\phi(x_i)\phi^T(x_i)
$$

Then we have: 

$$
v = \sum_{i = 1}^{n}
v^T\phi(x_i)\phi(x_i)^T \quad \alpha_i = v^T\phi(x_i)
$$

Substitute expression (2) into expression (1), then: 

$$
Cv = 
\frac{1}{n}
\sum_{i = 1}^{n}
\phi(x_i)\phi(x_i)^T
\sum_{l = 1}^{n}
\alpha_{i, l}\phi(x_l)
$$

$$
\frac{1}{n}
\sum_{i = 1}^{n}
\phi(x_i)
\sum_{l = 1}^{n}
\alpha_{i, l}\phi(x_l)\phi(x_i)^T
$$

$$
\frac{1}{n}
\sum_{i = 1}^{n}
\phi(x_i)
\sum_{l = 1}^{n}
\alpha_{i, l}K(x_l, x_i)
$$

Now, we choose any sample's non-linear representation, say: $\phi(x_k)$, then we have: 

$$
\frac{1}{n}
\sum_{i = 1}^{n}
\phi(x_k)
\phi(x_i)
\sum_{l = 1}^{n}
\alpha_{i, l}K(x_l, x_i)
= 
\frac{1}{n}
\sum_{i = 1}^{n}
K(x_k, x_i)
\sum_{l = 1}^{n}
\alpha_{i, l}K(x_l, x_i)
\tag{3}
$$

Now, let the matrix $\mathbf{K}$ all the inner products $K(x_i, x_j)$ packed together, then we have: 

$$
\mathbf{K} = \begin{bmatrix}
    K(x_1, x_1) & K(x_2, x_1) & \cdots & K(x_1, x_n) 
    \\
    K(x_2, x_1) & K(x_2, x_2) & \cdots & K(x_2, x_n) 
    \\
    \vdots & & & 
    \\
    K(x_n, x_1) & K(x_n, x_2) & \cdots & K(x_n, x_n) 
\end{bmatrix}
=
\mathbf{K}^T
$$

The matrix is assumed to be symmetric. 

Then, we can reconsider the expression above, with this matrix: 

$$
(\mathbf{K}\alpha_j)_j = 
\sum_{l = 1}^{n}
\alpha_{j, l}K(x_l, x_j)
$$

The j th element of the vector $\mathbf{K}\alpha$ is identified as above expression. 

$$
\frac{1}{n}(\mathbf{K}^2\alpha_j)_k
=
\frac{1}{n}
\sum_{i = 1}^{n}
K(x_k, x_i)(\mathbf{K}\alpha_j)_i
$$

Now, go back to expression (3), choose $k = 1, 2, 3\cdots n$, and then stack then vertically together, we will have the expression in terms of the Kernel Matrix, in the form as: 

$$
Cv = 
\frac{1}{n}\mathbf{K}^2\alpha_j
\tag{4}
$$

---
Take another branch from the expression for $Cv$, and then we know that: 

$$
Cv = \lambda v = \lambda \sum_{i = 1}^{n}\alpha_i\phi(x_i)
$$

Then, we apply the same thing: Multiply $\phi(x_k)$ on the expression, giving us: 

$$
\phi(x_k)Cv = \lambda \sum_{i = 1}^{n}
\alpha_i\phi(x_k)^T\phi(x_i) = \lambda
\sum_{i = 1}^{n}
\alpha_iK(x_k, x_i) = \lambda (\mathbf{K}\alpha)_k
$$

However, we are going to add a subscript for $\alpha$, and name it $\alpha_j$, so it's consistent with expression (4). Combining the expression above with expression (4) we have: 

$$
\frac{1}{n}\mathbf{K}^2\alpha_j = \lambda\mathbf{K}\alpha_j
\underset{(a)}{\implies} \mathbf{K} \alpha_j = n\lambda_j\alpha_j
\tag{5}
$$

(a): By removing matrix $\mathbf{K}$ from both side of the equation, we lost all the eigenvectors with zero eigenvalues. 

Normalization of the Eigenvectors (The principal components) implies that: 

$$
v^T_jv_j = 1\implies \alpha_j^T\mathbf{K}\alpha_j
$$

We skipped some math, but you can verify it yourself. 

And apply the normalization property with expression (5), we have: 

$$
\alpha_j\mathbf{K}\alpha_j = n\lambda_j\alpha_j^T\alpha_j \quad \forall \;j
$$

**Principal Component Projection**: 

For any new point, $x$, it's projection onto the principal component will be: 

$$
\phi(x)^Tv_j = 
\sum_{i = 1}^{n}\alpha_{i, j}\phi(x)^T\phi(x_i) = 
\sum_{i = 1}^{n}\alpha_{i, j}K(x, x_i)
$$

---
### **In practice**

Don't do this with a very large amount of dataset, it will slow things down tremendously. 


[^1]: $X^TX, XX^T$ has the same eigenvalues are showed in [[SVD Theorems]]. The fact that Hermitian Matrices are diagonalizable is proved in [[Hermitian Adjoint]](Referred as Spectral Theorem). 
