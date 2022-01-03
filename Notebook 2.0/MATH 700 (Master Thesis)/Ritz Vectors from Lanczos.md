Prereq: Basic Linear Algebra. 

[[Lanczos Algoritm]]

---
### **Intro**

The ritz vectors/values are the approximations of the eigenvectors of a matrix. Consider the Hessenberg Decomposition of a matrix $A$. The system of the Hessenberg matrix of a Hessenberg Decomposition of a Matrix $A$ are an approximation of eigensystem for the matrix $A$. 

In a much similar way, the eigensystem of the Tridiagonal matrix $T$ (Where T is Generated from the Lanzos Algorithm) is an approximation for the eigensystem of the original Hermitian Matrix $A$. 

---
### **How Close are the Ritz Vectors?**

Consider the t-ridiagonal decomposition of a Hermitian Matrix $Q_k^kAQ_k = T_k$, where $Q_k$ is $k \times n$ and $T_k$ is $k\times k$ where $k \le n$. Then Consider the Eigen vector/value: $T$: $\theta v = Tv$. Then, $\theta, v$ are the ritz value and the ritz vector of the matrix $A$. 

Consider: 

$$
\begin{aligned}
    AQ_k &= Q_k T_k + q_{k + 1}\beta_k\xi_k^T
    \\
    AQ_kv &= \theta Q_k v + q_{k + 1}\beta_k \xi_k^Tv
    \\
    AQ_kv &= \theta Q_k v + \beta_kq_{k + 1}(v)_k
\end{aligned}
$$

And the quantity $\beta_kq_{k + 1}(v)_k$ tells use how close the vector $v$ is to one of the eigenvectors to the matrix $A$ with eigenvalue of $\theta$. 
