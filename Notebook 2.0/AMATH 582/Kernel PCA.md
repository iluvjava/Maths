[[SVM]], [[PCA (Principal Components Analysis)]], [[SVD]]

Here we talk about another extension of the PCA method. The Kernel PCA which performs the PCA at a non-linear subspace compare to the original dimension where the data lies in. The same kernel trick used for SVM. 

Reference: [Link](http://www.cs.haifa.ac.il/~rita/uml_course/lectures/KPCA.pdf)

---

### **Intro**
When the features are not necessarily separable under the linear subspace, we will use the kernel tricks to get a better separations in a new dimension. 

Note: The assumption is not the same as the low-rank assumption for the data set.

---
### Linear PCA

When computing the singular value decomposition for $X$, one of the approach is to find the Co-variance matrix for $X$. 

$$
V\Lambda V^T = XX^T \quad U\Omega U^T = X^TX
$$

This is feasible because symmetric matrix (Or Hermitian) has orthogonal Eigenvector. 


