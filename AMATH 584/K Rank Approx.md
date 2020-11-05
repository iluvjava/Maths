The Krank Approximation theorem is also stated as the Eckart Young theorem. 
prepreq: [[SVD]]

The cool thing here is, cropping off the some of the singular values from an SVD decomposition of a matrix is not going to ruin the matrix by a lot, and most of the information is going to be preserved. 

Wiki: [Low-Rank Approximation](https://www.wikiwand.com/en/Low-rank_approximation)

---

### So What is going on here? 

Given any matrix, we figure out the singular value decomposition of such a matrix. Which is getting that $A = U\Sigma V^T$ for any matrix. 

Given that all the sigular values in $\Sigma$ are sorted in descending order, we have the choice reduce the sigular values and crop of the corresponding columns in $U$ and rows in$V^T$. 

This is reducing the rank of the matrix $A^TA$ and $AA^T$. By the way, the rank of the matrix $A$ has the following: 
$$\text{rank}(A) \leq \min(\text{rank}(A^TA), \text{rank}AA^T)$$

And this, is also the solution to the following problem: 

Given a matrix $A$, we want to find another matrix $A'$ with rank less than the matrix $A$, so that, it's the closest approximation to the matrix $A$. 

---

Let's denote the matrix $A\in \mathbb{R}^{m\times n}$ to be the matrix which we are trying to approximate using the SVD: $A = U\Sigma V^T$

Then the number of non-zero sigular value will determine the size of the matrix $\Sigma$, in this case the size will be $k = \min(m, n)$. 

The approximated expression can be expressed as $$\hat{A} = \hat{U}\hat{\Sigma}\hat{V}^H$$

After the rank approximation with the first $p$ principal values, we have to make sure that the size of $\hat{A}$ and $A$ stays unchanged. Hence we are doing the following things: 
* Keep the first $p$ columns of matrix $U$
* Keep the first $p$ rows and column of matrix $\Sigma$
* Keep the first $p$ rows of matrix $V^T$, or equivalently the first $p$ columns of $V$

So the mapping before the approximation is going to be: 

$$\mathbb{R}^{n\times k} \mapsto \mathbb{R}^{k\times k} \mapsto\mathbb{R}^{k\times m} $$

And then the reduced mapping is going to be: 

$$\mathbb{R}^{n\times p} \mapsto \mathbb{R}^{p\times p} \mapsto\mathbb{R}^{p\times m} $$

Then we can confidently say that: 

$$\hat{A} = \text{argmin}_{rank(M) \leq p}\left( \Vert A - M \Vert_F\right)$$
