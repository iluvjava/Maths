Prereq: [[SVD]]
 
Reference Materials: [Course Notes](http://pfister.ee.duke.edu/courses/ecen601/notes_ch8.pdf)

---
### **Intro**

Schur's Decomposition: Every square matrix is similar to a Upper triangular matrix, and it's possible to do it with an unitary transformation. 

> $$A = Q^TTQ$$

In the case when the original matrix $A$ is complex, we use the complex conjugation of the matrix instead of the transpose of the matrix. 

**Claim 1:** 

> All square matrices are similar to a upper triangular matrix and an unitary transform allows for the similarity. 


---
### **Proof**

* Let $A \in \mathbb{R}^{n\times n}$

* Let $x_1$ be an eigenvector of the matrix $A$, which means that $Ax_1 = \lambda_1 x_1$.

* Let $x_1$ be the first vector used for an orthogonalization procedures (GS orthogonalization for example). 

Now, Construct a set of unitary orthogonal vectors, starting with $x_1$: 

$$
\mathcal{D} = \langle u_1, u_2, u_3, \cdots, u_n\rangle \quad u_i \perp u_j \quad \forall \; i \neq j \text{ and } u_1 = \hat{x}_1
$$

$$
U = \begin{bmatrix}
    u_1 & u_2 & u_3 &\cdots & u_n 
\end{bmatrix}
$$

**Consider:** 

$$
\begin{aligned}
    AU &= \begin{bmatrix}
        \lambda_1 u_1 & Au_2 & Au_3 & \cdots & Au_n 
    \end{bmatrix}
    \\
    \forall \; 1 \le i \le n &: 
    Au_i \in \mathcal{D}
    \\
    \implies 
    \exists s_i : s_i^Tu_i &= Au_i \quad \forall 1 \le i \le n
    \\
    \implies 
    AU &= U \begin{bmatrix}
        \lambda & s_{1, 2} & \cdots & s_{1, n}
        \\
        0 & s_{2, 2} & \cdots & s_{2, n}
        \\
        \vdots & \vdots & \cdots & \vdots
        \\
        0 & s_{n, 2} & \cdots & s_{n, n}
    \end{bmatrix}
    \\
    U^TAU &= \begin{bmatrix}
        \lambda & s_{1, 2} & \cdots & s_{1, n}
        \\
        0 & s_{2, 2} & \cdots & s_{2, n}
        \\
        \vdots & \vdots & \cdots & \vdots
        \\
        0 & s_{n, 2} & \cdots & s_{n, n}
    \end{bmatrix}
\end{aligned}
$$

Let's consider an inductive hypothesis upon this formulation, let the bottom right corner of the matrix of $s_{i, j}$ be another square matrix that can be decompose the same wway as $A$ did. 

For induction, let $A_n$ denote an $A \in \mathbb{R}^{n\times n}$, denoting any square matrix and let $U_n$ denotes unitary matrix, designed the same way as the $U$ matrix from the previous part. 

Let the Inductive Hypothesis be: $A_n = U_{n - 1}^T T_{n - 1} U_{n - 1}$. 

The parameterized statement is: 

$$
\begin{aligned}
    U_{n}^TA_nU_n &= 
    \begin{bmatrix}
        \lambda & s^T 
        \\
        \mathbf{0} & A_{n - 1} 
    \end{bmatrix}
    \\
    \underset{\text{Inductive Hypo } (n - 1)}{\implies}
    U_{n}^TA_nU_n &= 
    \begin{bmatrix}
        \lambda & s^T
        \\
        \mathbf{0} & U_{n - 1}T_{n - 1} U_{n - 1}
    \end{bmatrix}
    \\
    \underset{(1)}{\implies}
    U_{n}^TA_nU_n &= 
    \begin{bmatrix}
        1 & \mathbf{0}
        \\
        \mathbf{0} & U_{n - 1}
    \end{bmatrix}
    \begin{bmatrix}
        \lambda & s^TU_{n - 1}
        \\
        \mathbf{0} & T_{n - 1}
    \end{bmatrix}
    \begin{bmatrix}
        1 & \mathbf{0}
        \\
        \mathbf{0} & U_{n - 1}^T
    \end{bmatrix}
    \\
    \begin{bmatrix}
        1 & \mathbf{0}
        \\
        \mathbf{0} & U_{n - 1}^T
    \end{bmatrix}
    U_n^TA_nU_n 
    \begin{bmatrix}
        1 & \mathbf{0}
        \\
        \mathbf{0} & U_{n - 1}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \lambda & s^T 
        \\
        \mathbf{0} & T_{n - 1}
    \end{bmatrix}  
\end{aligned}
$$

The last line proved that the inductive hypothesis for $n$ is true, based on $n - 1$. 

* (1): Some Non-trivial algebra. 

**Base Case**

Based case of a $2 \times 2$ matrix is trivial to prove/show. 

**Reader Please Observe**

The diagonal of the $T$ matrix is the eigenvalues of the original square matrix. 

The decomposition is non-unique, it's unitque up to permutatons of the eigenvalues on the diagonal of the matrix $T$. 

---
### **The Spectral Theorem**

Theorem 

> Hermitian Matrix (Complex Conjugate Transpose) are diagonalizable. 

$$
\begin{aligned}
    A & = U^TTU    
    \\
    A^T &= (U^TTU)^T
    \\
    A^T &= U^TT^TU
    \\
    A^T &= A 
    \\
    \implies 
    T^T &= T
\end{aligned}
$$

Hence $T$ is diagonal. 

---
### **Normal Matrices**

When a matrix is normal, (Recall from [[Normal Matrix]] on what it is.), the Shur's Decomposition of the matrix is the same as the [[SVD]]. 


 