Prereq: [[Eigen Decomp (The Pure QR)]], [[Eigen Decomp Algo (Baisc and Intro)]]
This time, we need to see how the QR algorithm that is shifted is related to the Inverse Power iterations. 

---

### Picking Stuff up From Before
We are still solving the symmetric Eigenvalue problem. And please note from our previous discussion about the problem. 


The $Q$ matrix from the Pure QR algorithm at the $k$ th step of the iterations is the same matrix as the $Q$ matrix from the Simultaneous iterations, but accumulated together. 

$$
\widehat{Q^{(k)}} = \prod_{j=0}^kQ^{(j)}
$$

And one of the "Loop invariance" of both algorithm is stated to be: 

$$
A^{k} = \widehat{Q^{(k)}}\widehat{R^{(k)}}
$$

But then we have: 

$$
A^{-k} \underset{(1)}{=} (\widehat{R^{(k)}})^{-1}(\widehat{Q^{(k)}})^T 
\underset{(2)}{=} \widehat{Q^{(k)}}(\widehat{R^{(k)}})^{-T}
$$

Where the first equality comes from directly taking the inverse of the matrix $A^{-k}$ and the second inequality comes from the fact that the matrix $A^{-k}$  is symmetric. *(Inverse of an Hermitian Adjoint is Hermitian Adjoint)*

Ok, let's check this shit out: 

Let $P$ be the matrix the reverse the order of columns and row in a matrix, (Reflecting the Identity Matrix)

$$
A^{-k}P = \left[ 
	\widehat{Q^{(k)}}P
\right]
\left[
	P(\widehat{R^{(k)}})^{-T} P
\right]
$$

Where in the first cell, the $P$ is Permuting the columns of the left multiplier matrix, and in the second cell, $P$ is permuting the rows of the left multiplier matrix, and whatever got multiplied by the matrix from the right side. 

Note the following fact using what we have: 

1. $\widehat{Q^{(k)}}P$ is still going to be an orthogonal matrix. 
2. $\widehat{R^{(k)}}$ is upper triangular, its inverse is lower triangular, and hence the transpose of the inverse is upper triangular. 

By these 2 facts, we have found the QR iterations for the matrix $A^{-k}P$ . 

**Key**: The simultaneous inverse iterations of $A$ is obtainable from the Pure QR iteration. 

### Shift QR and Accelerated Iterations

The inverse power iterations experience Cubic Convergence rate, and it's exploited here. 

And then, inside the for loop, we will have: 

1. $A^{(k - 1)} - \mu I = Q^{(k)}R^{(k)}$
2. $A^{(k)} = R^{(k)}Q^{(k)} + \mu^{(k)}I$

And the invariant is (Kinda Trivial to prove): 

$$
A^{(k)} = (Q^{(k)})^TA^{(k - 1)}Q^{(k)}
$$

And then inductively is giving us: 

$$
A^{(k)} = (\widehat{Q^{(k)}})^TA\widehat{Q^{(k)}}
$$

So the $A^{(k)}$ matrix is going to eliminate one pair of element in the sub-diagonal entry, and the element remains in the diagonal is going to be the eigenvalue. 

However, the other invariant is changed, and the matrix that is filled with Eigenvector will be given by: 

$$
(A - \mu^{(k)}I)(A - \mu^{(k - 1)}I)\cdots (A - \mu^{(1)}I) = \widehat{Q^{(k)}}\widehat{R^{(k)}}
$$

This is saying that, the accumulated product of the $Q, R$ matrices by the end of the algorithm is not $A^k$ anymore, but instead, the shifted version of that. 

**Question**: Where is the Matrix full of Eigenvectors? 

That matrix is in the first invariant. The accumulated product of $\widehat{Q^{(k)}}$ is the matrix, find the element $A^{(k)}_{j,j}$ such that its upper and lower element is sufficiently close to zero, then we will have the corresponding $j^{th}$ column in the matrix to be the corresponding Eigenvector. 
 
### Practical QR Algorithm
![[Practical QR Algorithm.png]]

**Question:**
How do we find the eigenvectors from the $\widehat{Q}$ that are coming from the recursive subroutine. 

