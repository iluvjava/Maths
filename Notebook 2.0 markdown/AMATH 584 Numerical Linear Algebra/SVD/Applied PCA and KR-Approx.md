This is an example of applied PCA and Low rank Approximation

Here we will be interested in examing some kind of data set

prereq: [PCA](PCA.md), [K Rank Approx](K%20Rank%20Approx.md)

---

Here is the set up for the problem. Given a set of multi-demensional data that has been carefully processed (meaning that all the variances that are caused by unitary transformation has been voided), put them into a matrix $X$ and each data object from the set is a column on the data matrix $X$. 

Performs a SVD on the matrix, so that we obtain the decomposition of the matrix, wrritten as $X = U\Sigma V^T$. 

Perform PCA analysis and choose the the first $p$ singular values that best explain the variance of the data. Which will provides us with a lower rank approximation using the matrices $\hat{U}\hat{\Sigma}\hat{V}^T$

Now assume that we are given a new data that doesn't belong to the columns of $X$. 

Then the rank approximation for that data using the basis of our decomposition will be $XX^Ty$ where y is the column vector representing the data that we don't know. 

And the output of the expression will be an reconstruction of the data using the given basis. 

#### Interpretation 

> The singular values(diagonal of the matrices) explains variance of the data set and each of the basis in $U$ is associated with a given singular value. The first singular value is associated with the first column in $U$ and it explains the most variance on our data set, and the second one corresponds to the second column in matrix $U$ and the amount of variance explained by it is second to all the other singular values and so on. 

> The matrix $U$ is the eigen data set, the columns of the matrix $U$ is used to reconstruct data in the training set, or data that are not in the training set. 

Note that, in the case where the raining set mannage to span the whole  dimension of the data set, then the $U$ is going to span $\mathbb{R}^m$ and in that case, $U$ can be used to represent everything. 

> The rows of the matrix $V$ (columns the matrix $V^T$) is like the finger print of that data that is in the matrix $X$, it's the best combinations of singular values and its corresponding columns in $U$ such that it can be used to reconstruct the columns in the original matrix as much as possible. 


For a given data that is not in the trainning set, the finger print, with the principal conponents inside of it, it's simply $U^Ty$. 

Now suppose that the given $y$ is in the data set, and it's very close to one of the data object, then we can do the following: 

$$U^Ty$$

Will gives us some the projection of the data object $y$ onto the ortho basis. And then, among all the rows of the matrix $V$ find the  $v_i$ such that $\Sigma v_i$ is closest to $U^Ty$, and then, we use the index $i$ to get the closest match of data in $X$ to the given data $y$. 

 In addition, we can also do this under the most must singnificant basis for the data set instead of the full data set, this will reduce the computational recourses immensely. 

