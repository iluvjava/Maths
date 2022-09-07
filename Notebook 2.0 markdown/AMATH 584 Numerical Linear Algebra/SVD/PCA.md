### PCA: Principal Components Analysis 

prereq: [SVD](../Matrix%20Theory/Matrix%20Decomposition/SVD.md) This is an application of the idea of singular value decomposition, take a read before understanding this. 

The principal components analysis looks at a covariant matrix and find out alternative basis that minimizes the non-diagonal values of the covariance matrix, reducing the linearity on the predictors in a multi-variable Gaussian model.

This a **Data Transformation Technique**

Here are more resources relevant to PCA: 

[Link](https://www.youtube.com/watch?v=8BTv-KZ2Bh8&ab_channel=AMATH301): PCA for Face Recognition
[Link](https://www.youtube.com/watch?v=TJdH6rPA-TI&ab_channel=Computerphile): PCA Computerphile

---

### Intro
The PCA is a data transformation techniques that look for a set of basis vectors for the given data point such that, the basis minimizes the spread of the data point. 

Using the new sets of the basis, we eliminated as many collinearity as possible for the set of data points. 

### Standing Assumptions 

Let's assume that a list of data points on measures of different attributes has been given as a Row Data Matrix, more specifically: 
$$X = \begin{bmatrix}
\quad & v_1^T & \quad \\ 
\quad & v_2^T & \quad \\
\quad & \vdots& \quad \\
\quad & v_n^T & \quad
\end{bmatrix}$$

Cool, Now, there is a quick and dirty way of computing the covariance matrix out of this thing. We have the choice to either normalize, or to not normalized that data, but normalization is definitely preferable for large amount of data set with spreads that are in hugely different magnitudes. 

The Covariance Matrix can be quickly computed as: 

$$C_x = \frac{1}{n - 1}XX^T$$

Notice This is the squared version, so each individual entries will have the following meaning: 

$$(C_x){i, j} = \text{Cov}(v_i, v_j)$$

Cool, now, this Cov matrix is a symmetric matrix, and this will mean that the matrix is: 

* Diagonalizable with real eignen values 
* The eigen space of the matrix will be orthogonal, giving us unitary matrix for the eigen decomposition of the matrix. 


Suppose an Eigen decomposition is applied to the matrix $XX^T$ and say that 

$$XX^T = Q\Lambda Q^T$$

And then we are interested in describing the data in the new alternative basis, say that the new transformed data is: 

$$
Y = S^TX
$$

And hence the Covariant Matrix of this new transformed data will be: 

$$
(n - 1)C_Y = YY^T = (Q^TX)(Q^TX)^T
= Q^TXX^TQ
$$
$$
(n - 1)C_Y = \Lambda
$$

Therefore under the new coordinates, the matrix is diagonal, meaning that under this transformation, we have found the "view" of the data points such that, each of the new combined attributes will not be correlated with each other. 

The other interpretation will be: 

> As there are as many principal components as there are variables in the data, principal components are constructed in such a manner that the first principal component accounts for the** largest possible variance** in the data set.

Ok, There are something new adding in, let's do more to explain that. 

Let's Give $X$ a SVD decomposition and get $XV = U\Sigma$, and obviously 
$$
XX^T = (U\Sigma V^T)(U\Sigma V^T)^T = U\Sigma^2 U^T
$$

And hence $Q = U$ and $\Lambda = \Sigma^2$, and we have the alternate basis and the variance for each components. 


So, if you get the new basis, you basically know what kind of "shape" the "Gaussian Cloud" looks like. 

#### Notes

This assumes Gaussian distribution of the data points in the space. 

If we change the covariance matrix to a metric matrix, then under the principle components analysis, we will be **Multi-Dimensional Scaling**. 

If the matrix represents an image like a media file of some sort, then the SVD decomposition of the Hermitian becomes a compressed version of that file. 

--- 

