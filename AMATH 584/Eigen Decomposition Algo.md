This file will give some overview on the algorithmic approach to the Eigen Decomposition. 
prereq: [[Eigen Decompose]]

---

### Introduction

Eigen decomposition is not easy, but we will start with some easier matrix to do Eigen decomposition before going to the most general matrices, which is usually very hard. 

For Eigen decomposition, there are only iterative method, and it's solved as a Optimization Problem instead, instead of a direct computations (like SVD, LU etc). 

---

### Special Hermitian Matrix

Let's assume the following properties of the Hermitian matrix for our Eigenvalue decomposition: 
* $A \in \mathbb{R}^{m\times m}$

* The matrix is Hermitian 
	* The Eigenspace are orthogonal for each Eigenvalue. 
* The matrix has unique Eigenvalues (Not an inherent property of the Hermitian)
	* Let's sort then like this: $\lambda_1 < \lambda_2 < \lambda_3... \lambda_m$
	* let's assume that the Eigenvalues are like this: $q_1, q_2... q_m$

#### Rayleigh Quotient

> $$
> r(x) = \frac{x^TAx}{x^Tx}
> $$

Notice that $r(q_i) = \lambda_i$ because: 

$$
\frac{q^TAq}{x^Tx} = \frac{\lambda ||q||_2^2}{q^Tq} = \lambda
$$

Ok, here is the magic, the input that gives the minimum of this function is the Eigenvector. And that, is very cool. 

Firstly, we need to take the derivative on this thing, so let's get the preliminaries for that prat done. 

$$\nabla (x^TAx) = (A^T + A)x =  2Ax$$

Because the matrix is Hermitian, and this is all we need to find the Jacobian of the Rayleigh Quotient. 

$$
\nabla r(x) = \lambda\left(
\frac{x^TAx}{x^Tx}
\right)
$$

$$
\nabla r(x) = \nabla(x^TAx) \left(
	\frac{1}{x^Tx}
\right)
- x^TAx\left(
\frac{1}{(x^Tx)^2}\nabla(x^Tx)
\right)
$$

$$
\nabla r(x) = \frac{2Ax}{x^Tx} - x^TAx\left(
\frac{2x}{(x^Tx)^2}
\right)
$$

$$
\nabla r(x) = \frac{2Ax}{x^Tx} - 2x\left(
\frac{x^TAx}{(x^Tx)^2}
\right)
$$

$$
\nabla r(x) = \frac{2}{x^Tx}(Ax - r(x)x)
$$

Cool, notice  that $\nabla r(q) = \mathbb{0}$

And the Rayleigh Quotient is going to have all minimums because of the numerator where $x^Tx$ is involved, and hence, the minimum solutions of the Rayleigh Quotient is all the Eigenvectors. 

The corresponding minimization problem is stated as: 
$$
\min_{\alpha}\Vert Ax - \alpha x\Vert_2^2
$$

And the minimum values are the Eigenvalues, which also gives zero for the gradient of the Rayleigh's Quotient. 

---

### Eigen Decomposition Algorithm (Rayleigh Quotient Iteration)

The most naive way of doing it is the **Power Iterations** which looks for the Eigenvectors with the largest Eigenvalues. 

The other one that we are going to introduced here is the Rayleigh Quotient Iteration method, which has a cubic convergence rate, very impressive. 

* Initialize: Pick $\Vert v^{(0)}\Vert = 1$, estimate $\lambda^{0} = v^{(0)}Av^{(0)}$
* Iterate with: 
	* solve for $w$ using: $$(A - \lambda^{(k - 1)}I)w = v^{(k - 1)}$$
	* $$v^{k} := \frac{v^{(k - 1)}}{\Vert v^{(k - 1)}\Vert}$$
	* $$\lambda^{(k)} := v^{(k)T}A v^{(k)}$$

This is fast because when the value of $\lambda$ is close, the matrix $(A - \lambda I)$ is stretching along the direction of the Eigenvector aggressively. 

#### Key to Understanding 
$\forall \mu \in \mathbb{R}$ that is not an Eigenvalue of $(A - \mu I)^{-1}$ are the same as the eigenvectors of $A$. 

Let $x$ be $Ax = \lambda x$, then: 

$$
(A - \mu I) x = (\lambda - \mu)x
$$

And notice that, for any nonzero Eigenvector $\lambda$ of matrix $A$, $A^{-1}$ has $\lambda^{-1}$ as their Eigenvalue. 

Assuming $(A - \mu I)$ is invertible, then the Eigenvector is the same from $A$, but the Eigenvalue will be $(\lambda - \mu)^{-1}$. So when $\mu$ is close to the true Eigenvalue, the matrix $(\lambda - \mu)^{-1}$ will have a really huge Eigenvalue, making the Iterations converges very fast. 

**Comment**: 
This is a classic algorithm, and it's used when we were given an Eigenvalue that is close, and then this algorithm is very much recommended. 

It might be tempting to think that the some bad conditioning might affect the algorithm when the matrix is near singular, but I assure you that is not the case. 

