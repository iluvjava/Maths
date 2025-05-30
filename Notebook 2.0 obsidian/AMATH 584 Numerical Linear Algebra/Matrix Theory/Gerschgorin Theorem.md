[[Matrix Decomposition/Eigen Decomposition]]

---
### **Intro**

All the eigenvalues of a square matrix lies within the union of a series of Gerschgorin Disks. This method allows a way for checking whether a matrix is positive definite or not. 


#### **Def | Gershchgorin Disk**
> let $A \in \mathbb{R}^{n\times n}$, the Gerschgorin Disk is 
> $$R_i(A) = \sum_{j = 1, j \neq i }^n |a_{i, j}| \quad i = 1, \cdots n$$
> The sum of the absolute value of all the non-diagonal entries of the ith row. 

**Theorem Statement**

> $$
> \bigcup_{i} \left\lbrace
>     x \in \mathbb{C}: 
>     |x - a_{i, i}| \le R_i(A)
> \right\rbrace
> $$
> All the eigenvalues of matrix $A$ are in the union of disks in the above set. 

---
**Proof**

Choose eigenvector $v$ as the eigen vector for $n\times n$ square matrix $A$. 

Let $v_p$ be the maximal element in absolute value for vector $v_p$, which means that $|v_p| = \max_{i} |v_i|$ 

**Consider**: 

$$
\begin{aligned}
    (Av)_p &= \lambda v_p
    \\
    \lambda v_p &= \sum_{j = 1}^{n}a_{p, j} v_j
    \\
    \lambda v_p - a_{p, p}v_p &= \sum_{j = 1, j\neq p}^{n}
        a_{p, j} v_j
    \\
    v_p (\lambda - a_{p, p}) &= \sum_{j = 1, j\neq p}^{n}
        a_{p, j} v_j
\end{aligned}
$$

Then using triangle inquality: 

$$
\begin{aligned}
    |v_p||\lambda - a_{p, p}| &= 
    \left|
    \sum_{j = 1, j\neq p}^{n}
        a_{p, j} v_j
    \right|
    \\
    |v_p||\lambda - a_{p, p}|
    &\le 
    \sum_{j = 1, j\neq p}^{n}
        |a_{p,j}||v_j|
    \\
    |v_p||\lambda - a_{p, p}|
    &\le 
    |v_p|\sum_{j = 1, j\neq p}^{n}
        |a_{p,j}|
    \\
    |\lambda - a_{p, p}| &\le \underbrace{\sum_{j = 1,j\neq p}^n|a_{p, j}|}_{R_p(A)}
\end{aligned}
$$

Repeat the argument for all $\lambda$ of matrimx $A$, then we can conclude that all the eigen values are inside each of their own Gerschogorin Disk, and hence, all of them will be inside the union of all these disks. 

---
### **Corollary 1** 

$A, A^H$ has the same eigenvalues, and therefore: 

> $$
> \lambda\in \bigcup_j \left\lbrace
>     z \in \mathbb{C}: |z - a_{j, j}|\le \sum_{i = 1, i\neq j}^{n}
>     |a_{i, j}|
> \right\rbrace
> $$


---
### **Corollary 2**

If, the diagonal is larger than the absolute sum of all the non-diagonal elements, then the disck doesn't involve the origin for all the eigen value, which means that the matrix will be invertible. 

> If $a_{i, i} > \sum_{k = 1, k \neq i}^{n}|a_{i, k}|$ for all $i$ then the matrix is invertible. This is the cause because zero is not not in the Gerschgorin's disk. 

**Discussion**:

A Hermitian Matrix that is diagonally Dominance will be invertible, meaning that it will be positive definite. 

---
### **Other Useful Facts**

* Each disk contains exactly one eigenvalue of the matrix. If 2 subset of size $a, b$ of disks are disjoint, then the union of each group contains exactly $a, b$ eigenvalues. 
* If a disk $D$ overlaps with other disks, then it may not contain any eigenvalues. 
* When $A$ is real, $A^T$ has the same eigenvalues, hence the Gorschogrin's Disk for $A$ is the same for $A^T$. The Gorschogorin's Disk for $A, A^T$ would contain the same set of eigenvalues. 

