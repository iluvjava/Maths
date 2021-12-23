The following content is loosely related to this topic of discussions.
[[Generalized Eigenspaces]]
[[Krylov Subspace]]

References: 
[Applied Numerical Linear Algebra](https://epubs.siam.org/doi/book/10.1137/1.9781611971446?mobileUi=0&) [Chapter 4](https://epubs.siam.org/doi/abs/10.1137/1.9781611971446.ch4)


----
### **Introduction** 

Here we introduce extremely useful concepts and lemma that will assist with the understanding of Nonsymmetric algorithms.

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







