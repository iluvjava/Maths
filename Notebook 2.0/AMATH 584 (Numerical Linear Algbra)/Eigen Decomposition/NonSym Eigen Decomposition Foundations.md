The following content is loosely related to this topic of discussions.
[[Generalized Eigenspaces]]
[[Krylov Subspace]]

References: 
[Applied Numerical Linear Algebra](https://epubs.siam.org/doi/book/10.1137/1.9781611971446?mobileUi=0&) [Chapter 4](https://epubs.siam.org/doi/abs/10.1137/1.9781611971446.ch4)


----
### **Introduction** 

Here we introduce extremely useful concepts and lemma that will assist with the understanding of Nonsymmetric algorithms.

### **Lemma: Block Triangular Matrices**

Consider a matrix $A$ that is squared real matrix consisting of block of square matrices in the following form:

$$
\begin{aligned}
    A = \begin{bmatrix}
        B_{1, 1} & B_{1, 2} & \cdots 
        \\
        & B_{2, 2}& \cdots 
        \\
        & & \vdots 
        \\ 
        & & B_{m, m}
    \end{bmatrix}
\end{aligned}
$$

Then:

$$
\text{det}(A) = \prod_{i = 1}^m \text{det}(B_{i, i})
$$

Therefore, the eigenvalues of the matrix $A$ is the union of all the eigenvalues of block diagonals of the matrix $A$.

---
### **Invariant Subspace: Proposition 4.3**

> A subspace $\mathcal{X}$ is invariant to the matrix $A$ if and only if there exists $B\in \mathbb{R}^{m\times m}$ such that $AX = XB$ where $X$ is a matrix that has columns spanning the subspace $\mathcal{X}$. 
> 
> Quantities are like: 
> 
$$
\begin{aligned}
    & A \in \mathbb{R}^{n\times n}
    \\
    & X = [x_1  \; x_2 \; \cdots \; x_m] \in \mathbb{R}^{n\times m}
    \\
    & \text{spancol}(X) =\mathcal{X} 
\end{aligned}
$$

**Proof**

Proving $\implies$, if $X$ is invariant to the matrix $A$, then $AX = XB$.

The proof is straightforward from the definition of things and using basic linear algebra. 

Proving $\impliedby$, if $AX = XB$, then span of the columns of $X$ is invariant to the matrix $A$.

Assume: 

$$
AX = XB \quad n \ge m
$$

Choose Any: 

$$
\widetilde{X} \in \mathbb{R}^{n\times (n -m)}: \widehat{X} = [X \; \widetilde{X}] \text{is Non-singular}
$$

The chosie is obvious, we can just choose the complementary subspace spanned by columns of the matrix $X$. Then I make the claim that:

$$
A \sim \widehat{X}^{-1}A \widehat{X}
$$

The matrix $\widehat{X}$ gives a similarity transform to the matrix $A$.

Let's choose $\widehat{X}^{-1}$ be in the form of:

$$
\widehat{X}^{-1} = \begin{bmatrix}
    Y \\ \widetilde{Y}
\end{bmatrix} \implies \widehat{X}^{-1}\widehat{X} = I
$$

Whih means:

$$
\begin{aligned}
    \widehat{X}^{-1}X &= 
    \begin{bmatrix}
        Y \\ \widetilde {Y}
    \end{bmatrix} \begin{bmatrix}
        X & \widetilde{X}
    \end{bmatrix}
    \\
    &= \begin{bmatrix}
        YX & Y \widetilde{X} 
        \\
        \widetilde{Y}X & \widetilde{Y} \widetilde{X} 
    \end{bmatrix}
    \\
    &= 
    I 
    \\
    \implies 
    \widetilde{Y}X &= \mathbf{0} = Y\widetilde{X}
    \\
    \implies 
    \widetilde{X}\widetilde{Y} &= I = XY
\end{aligned}
$$

Then, consider the quantity:

$$
\begin{aligned}
    & \widehat{X}^{-1}A\widehat{X}
    \\
    &= 
    \begin{bmatrix}
        Y \\ \widetilde{Y}
    \end{bmatrix}
    \begin{bmatrix}
        AX & A\widetilde{X}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        YAX & YA\widetilde{X}
        \\
        \widetilde{Y}AX & \widetilde{Y}A\widetilde{X}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        YXB & YA\widetilde{X}
        \\
        \widetilde{Y}XB & \widetilde{Y}A\widetilde{X}
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        B & YA\widetilde{X}
        \\
        \mathbf{0} & \widetilde{Y}A\widetilde{X}
    \end{bmatrix}
\end{aligned}
$$

Observe that, the block triangular matrix contains all the eigenvalues of the block matrix $B$. Take this claim for granted, and it's also not hard to chech that this is true.

### Importance of the Idea

Notice that, $X$ can be some kind of generalized Eigenspaces, or the kyrlov subspace with grade $m$. In the case of Jordan form, the matrix $B$ is the jordan block, and the matrix $X$ is the eigen matrix. 

---
### **Schur Decomposition** 

Here we are going to sate the results, for the proof for it, consult: [[Schur Decomposition]] for more information.

For any Matrix $A$, There eixsts a Unitary Matrix $V$ such that:

$$
V^TAV = T 
$$

Where $T$ is upper triangular.

**Reader please observe**:

We assume that the matrix $A$ is real,and in that sense, the matrix might have complex eigenvalues, which implies that the size of $T$ is larger than $A$. When $A$ is real and we are only decomposing with real eigenvalues, then it's called a "Quasi-Upper Triangular form".


---
### **Real Schurform and Quasi-Upper Triangular Form**

We are considering real matrix that has pairs of conjugate Eigenvaues. 

> $$V^TAV = T$$

Where $V$ is unitary.

**Def: Quasi-Upper Triangular Form**

A matrix $V$ is said to be Quasi-Upper Triangular if the matrix has blocks of 2 by 2 matrices on the diagonals, and they contain pairs of conjugate eigenvalues for the matrix. 

**Let's Define the Following Quantities**

$$
\begin{aligned}
    A &:: \text{Square Real Matrix}
    \\
    \lambda &:: \text{Complex Eigenvalues}
    \\
    u &:: \text{Eigen vector of $\lambda$}
\end{aligned}
$$
 
**Proof**:

The proof is inductive, if the first eigenvalue we choose for the matrix $A$ is not complex, then this goes back to the Schur's form. If not consider: 

$$
(Au)^H = u^HA^T = Au^* = \lambda^*u^*
$$

Therefore, if the eigenvector is an eigenvalue of matrix $A$ with eigenvalue $\lambda$, then it's conjugate is an eigenvector of the matrix $A$ with $\lambda^*$.

Then, we can consider the linear combinations of these 2 eigen vectors $u, u^*$: 

$$
    u_R = \frac{1}{2}(u + u^*) \quad 
    u_i = \frac{1}{2i}(u - u^*)
$$

Where both $u_I, u_R$ are real eigenvectors conveniently. Which means that:

$$
\text{span}(u_R, u_I) = \text{span}(u, u^*)
$$

Where, the span can use complex weights for vectors from the set. Notice that because both $u$ and its conjugate are the eigenvector for the matrix, this subspace is invariant to the matrix $A$. In that case, consider: 

$$
\begin{aligned}
    \widetilde{U} &= \begin{bmatrix}
        u_R & u_I
    \end{bmatrix}
    \\
    &= QR
    \\
    \text{span}\{Q\} &= \text{span}\{u_R, u_I\}
    \\
    \text{choose: } U &= \begin{bmatrix}
        Q, \widetilde{Q}
    \end{bmatrix}
\end{aligned}
$$

We consider the matrix $\widetilde{U}$, with QR decomposition, then the matrix $Q$ (Which it will be complex.), a 2 by n matrix will represent the invariant subspace $\{u_R, u_I\}$,then, we can choose matrix $U$ consisting of $Q$ and its perpendicular subspace $\widetilde{Q}$.

Now, we may consider:

$$
\begin{aligned}
    U^TAU &= \begin{bmatrix}
        Q^T \\ \widetilde{Q}^T
    \end{bmatrix}
    A
    \begin{bmatrix}
        Q & \widetilde{Q}
    \end{bmatrix}
    \\
    &= \begin{bmatrix}
        Q^TAQ & Q^TA\widetilde{Q}
        \\
        \widetilde{Q}^TAQ & \widetilde{Q}A\widetilde {Q}
    \end{bmatrix}
    \\ 
    \text{using: } AQ &= QB 
    \\
    U^TQU &= \begin{bmatrix}
        B & Q^TQ \widetilde{Q}
        \\
        \mathbf{0} & \widetilde{Q}^TA\widetilde{Q}
    \end{bmatrix}
\end{aligned}
$$

Then, the matrix $B$ is a 2 by 2 matrix whose eigenvalues are a subset of the eigenvalues of the matrix $A$, the equation $AQ = QB$ is using **Proposition 4.3** because $Q$ is invariant.

Applied the prove and the Schur Decomposition recursively to the sub matrix $\widetilde{Q}^TA\widetilde{Q}$ to complete the proof. The Base case is 1 by 1 matrix and it's trivial to prove.

Done. $\blacksquare$

---
### **Getting A Simple Eigenvector From the Real Schur Form**

Suppose that $T = Q^HAQ$ is the Schur's form of the matrix $A$, Consider that $Tx = \lambda x$, we have $AQx = QTx = \lambda Qx$, so then $Qx$ is an eigenvector of matrix $A$.

Suppose that $\lambda = t_{ii}$ which is a simple eigenvalue, then consider $(T - \lambda I)x = 0$, we have: 

$$
0 = \begin{bmatrix}
    T_{1,1} - \lambda I & T_{1, 2} & T_{1, 3}
    \\
    0 & 0 & T_{2, 3}
    \\
    \mathbf{0} & \mathbf{0} & T_{3, 3} - \lambda I
\end{bmatrix}
\begin{bmatrix}
    x_1 \\ x_2 \\ x_3
\end{bmatrix}
= 
\begin{bmatrix}
    (T_{1, 1} - \lambda I)x_1 + T_{1, 2}x_2 + T_{1, 3}x_3
    \\
    T_{2, 3}x_3
    \\
    (T_{3, 3} - \lambda I)x_3
\end{bmatrix}
$$

Where, $T_{1, 1}$ is $(i - 1) \times (i - 1)$ and $T_{2, 2}$  is $\lambda$, and $T_{3, 3}$ is $(n - i)\times (n - i)$. Using the fact that the eigenvalue $\lambda$ has elgebraic multiplicity of 1, because it's simple, we know $T_{1, 1} - \lambda I$ and $T_{3, 3} - \lambda I$ are non-singular.

Therefore, $x_3 = 0$ and $(T_{1, 1} -\lambda I)x_1 = T_{1, 2}x_2$, Then we choose arbitrary value for $x_2$ to get the value of $x_1$, then we all $x_1, x_2, x_3$ figured out for our eigenvector of the matrix. 