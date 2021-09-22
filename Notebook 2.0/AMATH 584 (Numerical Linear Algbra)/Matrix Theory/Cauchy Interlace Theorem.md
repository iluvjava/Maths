[[Eigen Decompose]]
This is a weird theorem. Currently not sure what the proof is, and where it's applied. 


---
### **Intro**

Stated in \<Iterative Methods for Linear System\>, it's also stated as theorem 4.3.17 in the book: \<Matrix Analysis\>. 

**Theorem Statement**

$A\in \mathbb{M}_n(\mathbb{C})$, let $A$ be a square matrix over the field of complex numbers. with eigenvalues: $\lambda_1 \le \lambda_2 \le \cdots \le \lambda_n$. 

Let $H$ be a principal sub matrix of $A$. This means that $H = A[\alpha, \alpha]$ where $\alpha \subset [n]$, a strict subset of indices that index both the columns and the rows on the matrix $A$. We also say that $|\alpha| = m$, so that $H$ is $(n - m)\times (n - m)$ matrix. 

Then, let $\mu_1 \le \mu_2 \le \cdots \le \mu_m$ be the list of eigenvalues for the matrix $H$, the it has the following relation with eigenvalues of matrix $A$: 

> $$
> \lambda_i \le \mu_i \le \lambda_{i + n -m}
> $$

The eigenvalues of matrix $H$ are interlaced between the eigenvalues of the matrix $A$. 
