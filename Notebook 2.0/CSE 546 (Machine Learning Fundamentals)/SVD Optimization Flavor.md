SVD has been discussed before. 

[[SVD Theorems]], [[K Rank Approx]]

Where, we discussed some of the properties of the Hermitian Matrix, and then we also discussed some of the interpretation of it, however, the optimization interpretation of the SVD is cut short, and we are only left with the Ekart Young's Theorem. And the computational part, it's also cut short. 

---
### **Minimizations and Equivalent Symmetric Eigen Problem**

The following 2 problems are actually equivalent: 

$$
\min_{U^T U = I} \Vert X - UU^TX\Vert_F^2 
\quad 
\max_{\Vert u\Vert = 1} u^TX X^T u
$$

Where, $U$ is usually a skinny matrix that is orthogonal. For better interpretation we assume that the matrix $X$ is a column data matrix. And one of the important assumptions is that **all samples have zero mean**. Minimizes the projection onto the orthogonal matrix under the Frobenius Norm. Ok, interestingly: 

$$
\begin{aligned}
    & \Vert X - UU^TX\Vert_F
    \\
    =& 
    \sum_{i}^{} \Vert x _i - UU^T x_i\Vert_2^2
    \\
    =&
    \sum_{i}^{} \Vert x_i\Vert_2^2 - 2x_i^TUU^Tx_i - x_i^TUU^TUU^Tx_i
    \\
    =& 
    \sum_{i}^{} \Vert x_i\Vert_2^2 - 2 \Vert x_i\Vert_2^2  - x_i^TUU^Tx_i
\end{aligned}
$$

And notice that, we can switch the objective, and change this into a maximization problem, which maximizes the only negative term $\sum_i x_i UU^Tx_i$. Which is essentially $\Vert UX\Vert_F^2$: 

$$
\max_{U^TU = I} \Vert U^TX\Vert_F = \max_{U^TU = I}\sum_{i}^{} \Vert u_i^TX\Vert_2^2
$$

**The Interpratation is**: get all the data point, projected it onto all the orthogonal subspace we had, and we want to maximize the variance alone the orthogonal subspace $U$. Note: $U^TU$ is the covariance matrix of the alternate subspace. Now: 

$$
\max_{U^TU = I}\sum_{i}^{} \Vert u_i^TX\Vert_2^2 = \max_{U^TU = I} \sum_{i}^{}
    u_i^TXX^Tu_i
$$

Now, we we only focuses on optimizing one component of $u_i$, then we have: 

$$
\max_{\Vert u\Vert = 1} u^TX X^T u
$$

And... this is looking like Fisher's LDA. The expression is only maximized when $u$ is an eigen vector of the matrix $XX^T$ (Dot product of the same vector!). And this is cool because it just so happen that $XX^T$ is Hermitian, and therefore, it has real Orthogonal Eigen Basis, omitting the orthogonality constraints still retain the same optimization. And this is how an optimizaiton point of view lead to the SVD. And the list of $u_i$ that maximizes the expression are the eigen values of the matrix $XX^T$.

**Symmetry**: 

Change the $X$ to $X^T$ to get a different proof, and as a result, attaining $V$ matrix for the SVD decomposition by solving the symmetric eigen problem for $XX^T$. 




---
### **Matrix Completion for Recommendation System**

Let a matrix's column be the rating of a particular user on all the movies. Let row be a particular movie.$X[:, i]$ gives all the rating of a user of all movies and $X[i, :]$ gives all the rating of a particular movie. Obviously, a row is going to be full of `NaNs` because a user can't just rate all the movies in the database. This matrix is very sparse, most of them are `NaNs`, and we only have a few data points for each movie. 

Goal: Can we fill in the missing entries so that we can know what a movie a particular use might like, even they haven't rated the movie yet. 

The key is to identify the sparse rank structure of the columns of the matrix, so we can predict what set of movies a particular user might like. 

Let this data matrix be $d\times n$, so that are $n$ users and there are $d$ movies and there are $n$ users. 

**If we decompose the column space into orthogonal matrix $U$, what could be the columns of $U$ represents?**

Well, it represents particular subset of movies that always got rated together, and never rated with other groups. People who like MLP movie probably don't like something say, horror movie (Maybe...? ), then these 2 types of watching habits are going to be represented by different columns of $U$. 

And for some users, when they watch across different genres, it's likely that they are a composition of different types of $u_i$, different components. 

**We only have some subset of the entries of matrix $X$, what should be do?**

This is where we get creative, where we try to construct the $U$ matrix such that, we minimizes the errors on the known samples from the matrix $X$. Unknown entries are masked out and excluded from the Loss Metric. 

As we sample more and more data, depending on the threshold of the low-rank structure of the data, at some level of samples, we will reconstruct the whole matrix (The full matrix, not the sparse, like, it contains all the rating that the user haven't rated yet). [^1]


[^1]: This is like random linear algebra! Where we only uses a subset of entries to get the SVD of a low rank matrix. 

