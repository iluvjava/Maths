SVD has been discussed before. 

[[SVD Theorems]], [[K Rank Approx]]

Where, we discussed some of the properties of the Hermitian Matrix, and then we also discussed some of the interpretation of it, however, the optimization interpretation of the SVD is cut short, and we are only left with the Ekart Young's Theorem. And the computational part, it's also cut short. 
 
Here, we will see how another way of viewing the singular value decomposition. We assume reader has some indept understanding of the topic SVD. 

---
### **Intro**

The optimization problem we are solving is not convex, and it's als a constrained optimization prolem, it can be phrased as: 

$$
\min_{U^T U = I} \Vert X - UU^TX\Vert_F^2 
$$

Where, $U$ is usually a skinny matrix that is orthogonal, spanning the column space of the matrix $X$. And we assume that the matrix $X$ is a column data matrix. And one of the important assumption is that **all samples have zero mean**. 

Minimizes the projection onto the orthogonal matrix under the Frobebius Norm. 

Ok, interestingly: 

$$
\Vert X - UU^TX\Vert_F
= 
\sum_{i}^{} \Vert x _i - UU^T x_i\Vert_2^2
$$

$$
=\sum_{i}^{} \Vert x_i\Vert_2^2 - 2x_i^TUU^Tx_i - x_i^TUU^TUU^Tx_i
$$

$$
=\sum_{i}^{} \Vert x_i\Vert_2^2 - 2 \Vert x_i\Vert_2^2  - x_i^TUU^Tx_i
$$

And notice that, we can swtich the objetive, and change this into a maximization prolem: 

$$
\max_{U^TU = I} \Vert U^TX\Vert_F = \max_{U^TU = I}\sum_{i}^{} \Vert u_i^TX\Vert_2^2
$$

Get all the data point, projected it onto all the orthogonal subspace we had, and we want to maximaize the variance alone the orthogonal subspace $U$. 

Note: $U^TU$ is the covariance matrix of the alternate subsapce. 

Now: 

$$
\max_{U^TU = I}\sum_{i}^{} \Vert u_i^TX\Vert_2^2 = \max_{U^TU = I} \sum_{i}^{}
    u_i^TXX^Tu_i
$$

Now, we we only focuses on optimizing one component of $u_i$, then we have: 

$$
\max_{\Vert u\Vert = 1} u^TX X^T u
$$

And... this is looking like Fisher's LDA. The expression is only maximized when $u$ is an eigen vector of the matrix $XX^T$ (Dot product of the same vector!). And this is cool because it just so happen that $XX^T$ is Hermitian, and therefore, it has real Orthogonal Eigen Basis. 

And this is how an optimizaiton point of view lead to the SVD. 

And the list of $u_i$ that maximizes the expression are the eigen values of the matrix $XX^T$.


---
### **Matrix Completion for Recommendation System**

Let a matrix's column be the rating of a particular user on all the movies. 

Let row be a particular movive. 

$X[:, i]$ gives all the rating of a user of all movies and $X[i, :]$ gives all the rating of a particular moive. 

Obviously, a row is going to be full of Nans because a user can't just rate all the movies in the database. 

This matrix is very sparse, most of them are nans, and we only have a few data points for each movie. 

Goal: Can we fill in the missing entries so that we can know what a movie a particular use might like, even they haven't rated the movie yet. 

The key is to identify the sparse rank structure of the columns of the matrix, so we can predict what set of movies a particular user might like. 

Let this data matrix be $d\times n$, so that are $n$ usres and there are $d$ movies and there are $n$ users. 

**If we decompose the column space into orthogonal matrix $U$, what could be the columns of $U$ represents?**

Well, it represetns particular subset of movies that always got rated together, and never rated with other groups. People who like MLP movie probably don't like something say, horror movie (Maybe...? ), then these 2 type of watching habits are going to be represented by different columns of $U$. 

And for some users, when they watch across different generes, it's likely that they are a composition of differnt types of $u_i$, different components. 

**We only have some subset of the entires of matrix $X$, what should be do?**

Ah... 

This is where we get creative, where we try to construct the $U$ matrix such that, we minimizes the errors on the known samples from the matrix $X$. 

As we sample more and moer data, depending on the thredshold of the low-rank structure of the data, at some level of samples, we will reconstruct the whole matrix (The full matrix, not the sparse, like, it contains all the rating that the user haven't rated yet). [^1]



[^1]: This is like random linear algebra! Where we only uses a subset of entries to get the SVD of a low rank matrix. 

