This algorithm is not following from what we had before, and hence we are going to need some new basis for the algorithm 

---

### **Rank one Diagonal Problem (Secular Equation)**

Here we consider a special problem which will be relevant to an divide and conquer algorithm for the Irreducible Symmetric Eigenvalue problem. 

Let's define $D$ to be a $m\times m$ Diagonal matrix with **distinct diagonal entries**. 

And then let $w$ be a vector with all **non-zero entries**.

Let our objective to be looking for the Eigenvalues for the system: 

$$
D+ ww^T
$$

And the assumption that the problem irreducible lies in the fact that the vector $w$ has all non-zero entries. 

**Statement:**

> The Eigenvalues for the matrix $D + ww^T$ are the roots of the rational function: 
> $$
> f(\lambda) = 1 + \sum_{j = 1}^m\frac{w_j^2}{d_j - \lambda}
> $$
> And vice versa. The equation is called the Secular Equation. Assuming that all diagonals of the matrix $D$ are distinct real numbers and $w$ is not the zero vector. 

First, we need to show that, the Eigenvalue for the matrix $D + ww^T$ is indeed the roots of the above expression, and then we prove the converse. 

**Proof**: 

Let $q$ be the Eigenvalue of the matrix $D + ww^T$, then $(D + ww^T)q = \lambda q$ where $\lambda \neq 0$ and $q \neq \mathbb{0}$. 

$$ 
\begin{aligned}
	(D+ ww^T)q &= \lambda q
	\\
	Dq + ww^Tq &= \lambda q
	\\
	(D - \lambda)q + ww^Tq &= \mathbf{0}
	\\
	q + (D - \lambda)^{-1}ww^Tq &= \mathbf{0}
\end{aligned}
$$
Now the right hand side is zero vector, but we would like to have a zero scalar on the right hand side so it fits with the expression we have framed above. 

$$
\begin{aligned}
	w^Tq + w^T(D - \lambda)^{-1}ww^Tq &= 0
	\\
	\text{Where: } w^T(D - \lambda)^{-1}w &= \sum_{j = 1}^{m}\frac{w^2}{d_j - \lambda}
	\\
	w^Tq + \left( \sum_{j = 1}^{m}\frac{w^2}{d_j - \lambda}\right) w^Tq &= 0
	\\
	\left(
		1 + \sum_{j = 1}^{m}\frac{w^2}{d_j - \lambda}
	\right)w^Tq &= \mathbf{0}
	\\
	f(\lambda)w^Tq = \mathbf{0}
\end{aligned}
$$

Therefore, if $q$ is the eigenvalues of the matrix $D + w^Tw$, assuming that $w^Tq$ is non zero, it's also the roots of the secular equations. The converse is true and we skip the proof for that. 

**Question**: How do we solve the Secular Equation and find the Eigenvalues for the Diagonal matrix with rank one modifications? 

**Answer**: 
Using the assumptions that the diagonals of the matrix $D$ is unique, and they are poles of the rational function, we can take the guesses that: $d_i \leq \lambda_i \leq d_{i + 1}$ to be the guessed roots. And in that case, we can then use the Newton's iterations to locate the Eigenvalue of this matrix. 

**Question**: 
We get the Eigenvalues but what about the Eigenvectors? 

**Answer**: 
Don't know. May be inverse iterations. 

---
### **A Divide by Conquer Approach to Symmetric Eigenvalues Problems (Incomplete)**

![[symmetric-eigen-divide-and-conquer.png]]

We **assume that the eigenvalues for the matrices:** $\widehat{T}_1$ and $\widehat{T}_2$ are known recursively, and our objective is to figure out the Eigenvalues for matrix $T$. 

Firstly, the $T_1$ and $T_2$ Matrices: 

1. Partition the matrix $T$ approximately in half, and let $T_1$ and $T_2$ to be the sub-matrices for the $T$ matrix. 
	* Suppose that the size for matrix $T_1$ is $n\times n$
2. Then, we will have 2 extra entries, $(T)_{n + 1, n}$, since it's hermitian, the entry $(T)_{n, n + 1}$ are going to be the same, and now let's denote these 2 entries with the same value as $\beta$

Secondly, the $\widehat{T}_1$ and the $\widehat{T}_1$ matrices. 

1. For the $\widehat{T}_1$, the lower right entries is replaced to be: $(T)_{n, n} - \beta$

3. For the $\widehat{T}_2$, the upper right entry is replaced to $(T)_{n+ 1, n + 1} - \beta$ 
Then, we have split the matrix $T$ into the sum of 2 matrices, 


**Inductively assumes that:**

$$
\widehat{T}_1 = Q_1 D_1Q_1^T \quad \widehat{T}_2 = Q_2 D_2Q_2^T
$$

Which are the Eigenvalue Decomposition of the sub-matrices $\widehat{T}_1$ and $\widehat{T}_2$. 

* Firstly, let's recover the rank-1 matrix with four $\beta$ in the center, name this matrix $B$. Spoiler first, and then we see how it works: 

$$
B = 
\begin{bmatrix}
Q_1 & \\ 
& Q_2
\end{bmatrix}
\beta zz^T
\begin{bmatrix}
Q_1^T & \\ 
& Q_2^T
\end{bmatrix}
$$

Where the $z$ vector are the **transpose** of the **last row** of matrix $Q_1$ and the **first row** of the matrix $Q_2$ vertically stacked together. 

By this definition of the vector $z$, it's pretty easy to see that: 

$$
\begin{bmatrix}
Q_1 & \\ 
& Q_2
\end{bmatrix} z =
\begin{bmatrix}
0 \\ \vdots \\ 1 \\ 1 \\ \vdots \\ 0
\end{bmatrix}
$$

So then we will know that the matrix  $B$ is in fact: 

$$
\beta
\begin{bmatrix}
0 \\ \vdots \\ 1 \\ 1 \\ \vdots \\ 0
\end{bmatrix}
\begin{bmatrix}
0 \\ \vdots \\ 1 \\ 1 \\ \vdots \\ 0
\end{bmatrix}^T = 
\beta
\begin{bmatrix}
	0 \cdots & 0 & 0 & \cdots  0
	\\
	\vdots & & & \vdots 
	\\
	0\cdots & 1 & 1 & \cdots 0
	\\
	0\cdots & 1 & 1 & \cdots 0
	\\
	\vdots & & & \vdots
	\\
	0 \cdots & 0 & 0 & \cdots  0
\end{bmatrix}
$$

And boom, then we can conclude that, the Eigen decomposition for the matrix $T$ knowing the recursive decomposition for the sub-matrices will be given by the following expression: 

$$
T = 
\begin{bmatrix}
	Q_1  & \\ 
	& Q_2
\end{bmatrix}
\begin{bmatrix}
	\widehat{T}_1  & \\ 
	& \widehat{T}_2
\end{bmatrix}
\begin{bmatrix}
	Q_1^T  & \\ 
	& Q_2^T
\end{bmatrix} + B
$$
Which is giving us: 

$$
T = 
\begin{bmatrix}
	Q_1  & \\ 
	& Q_2
\end{bmatrix}
\left(
\begin{bmatrix}
	D_1  & \\ 
	& D_2
\end{bmatrix}
+ \beta zz^T
\right)
\begin{bmatrix}
	Q_1^T  & \\ 
	& Q_2^T
\end{bmatrix}
$$

And hence, we have the Eigen decomposition for the matrix $T$ as well, the matrix in the center is diagonal, and the matrix around it are orthogonal, performing a similarity transform on the diagonal matrix. 

--- 
### **The Missing Details, Important Assumptions**

This algorithm came up by Cuppen, back in 1981, and it has a lot of subtleties that are missing in the above discussion. 

Here is the assumptions:
1. The matrix is Hermitian Tridiagonal. 
2. The matrix has non zero sub-diagonals, (Irreducible)
3. The matrix has Distinct Eigenvalues, (Which is the implied from the first part, the proof is omitted here)

Then we are left with some important questions here: 
1. What if there are 2 repeating Eigenvalues? 
2. What if they are sub-diagonals are non-zero? 
3. Does that above 2 facts means the same thing, or they are either, or relations, or they are OR relations? 
4. How do we get the $z$ vector? Which is coming from the $Q$ matrices recursively, and it's needed the eigenvalues for eigenvalues of $D + ww^T$. 
The problems needs to addressed in the actual implementations of the algorithms so that it can work with all Tridiagonal Hermitian Matrices. 


---
### Complexity Analysis

### Extra
Here are some of the links related to the method we talked about here, and they extend it with more practical details for actual implementations. 
[1995 A Divide and Conquer Algorithm for the Symmetric Eigenvalue Problem](https://zenodo.org/record/1236142/files/article.pdf)

This paper highlights more details about the algorithms discussed here. 