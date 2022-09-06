
This is the major reference for this lecture note.
[Reference](https://www.youtube.com/watch?v=a9jdQGybYmE&ab_channel=AMATH301)

The principal component analysis is one of the applications of the SVD decomposition on the covariance matrix. And Here are some other notes that talks about the same idea: [[Applied PCA and KR-Approx]]

---

### Intro

The central theme here is to use SVD for PCA. 

The problem is set up to be a harmonic oscillator in some kind of orientation in 3D space. However, the coordinate system is knd fucked up. So the function is looking like: 

$$
f(t) = A\cos(\omega t + \omega_0)
$$

Where the quantity $A$ is just the magnitude of oscillation and this is a 1 Degree system. 

Now, we are measuring the displacement.

---
### A Data driven Approach

Measurements: 

* 3 cameras are placed at arbitrary position in space, point at the harmonic oscillator, and it records 2D motions in its coordinate system, while viewing the object that is moving. 

1. Camera 1: $(x_a, y_a)$, where it's a set of tuples that describes the point that is moving in the 2D system that is within the camera. 

2. Camera 2: $(x_b, y_b)$
3. Camera 3: $(x_c, y_c)$

The data matrix is defined to be a row data matrix for all six observations over the time frame. 

So it will look like this for the Data matrix: 

$$
X = \begin{bmatrix}
    x_a \\ y_a \\ x_b \\ y_b \\ x_c \\ y_c
\end{bmatrix}
$$

Where, each element presented in the vector is a row vector containing all the continuous record position of the oscillator in the 2D reference frame of the camera. 

Notice that following: 
1. Noise are in the system, representation is not perfect. 
2. Redundancy are made, because there are 3 camera recording a physical system that has only one deg of freedom. 

What is happening is that, the motion in all six sets of data are related, which is very similar to the idea of **Collinearity in Statistics**, and if 2 random variable are linear dependent on each other, that will mean that it's going to give some covariance between these 2 random variables.

---
### Stats Ideas

1. Variance
2. Covariance

Give to column data vector, $a$, the variance is defined to be: 

$$
\sigma_a^2 = \frac{1}{n - 1}\Vert a\Vert^2 = \frac{a^Ta}{n - 1} 
$$

Suppose that another column data vector is given as $b$. 

Then we can measure the statistical relationship between these 2 data vector, and this is defined to be: 

$$
\sigma_{ab}^2 = \frac{a^T b}{n - 1} 
$$

Obviously, this is just the dot product which is telling use the how much of these data points are in the same direction. 

For a statistically independent variable, we will have the covariance that is closed to zero. The more observations, the closer that is going to be zero. 

---
### Low Rank Structure

The motion observed from the harmonic oscillator is only having one degree of freedom, but in this case, 6 sequencies of data are observed. Here, let's take a look at the **Covariance Matrix**. 

$$
C_x = \frac{1}{n - 1} XX^T
$$

Notice that, this is the row data matrix, and that is one the matrix in the second product is transposed instead of the first one. 

The matrix $C_x$ is calculating, which of the observations on each rows are correlated to which, in this case the matrix is going to be $6 \times 6$ matrix. 

$$
(C_x)_{i, j} = \sigma_{X_{\text{row}(i)}, X_{\text{row(j)}}}^2
$$

Diagonals: The variances for each sequencies of observation. 
Off-Diagonals: This is the the measurements on the covariance between each of the rows of observations. 

What if: 
1. Covariance are very small on the off diagonal? This means that the 2 rows of observations are not dependent on each other. 
2. What if they are big? These 2 rows are probably describing the same thing. 

In matlab: 
```matlab
cov(X)
```

Boom, you get the covariance matrix for the row data matrix. 

---
### Change of Basis and Diagonalization of the Cov Matrix

Somehow, we want to look for an alternative basis such that it gives another Covariance Matrix, under the new reference frame, where the off diagonal elements of the new covariance matrix is minimized. 

And this will gives us the correct reference frame that describes the low rank structure of the observations. 

How do we get that? 

SVD. We would need that because, it has the diagonal matrix part, and it's ordering the singular values from big to small. 

---
### Eigen Decomposition Approach

$XX^T$ Is a symmetric matrix, and applied eigenvalue decomposition, it can be decomposed into the form of: 

$$
C_X = XX^T = S \Lambda S^{-1}
$$

And, $S$ is unitary, with $\Lambda$ containing only real eigenvalues. 

Let $Y$ be a new observation matrix, which is basically describing the old data matrix with the alternative eigen basis: 

$$
Y = S^T X
$$

What is the Covariance? 

$$
C_Y = \frac{1}{n - 1} YY^T
$$
$$
C_Y = \frac{1}{n - 1}S^TXX^TS
$$
$$
C_Y = \frac{1}{n - 1} S^TS\Lambda S^TS = \frac{\Lambda}{n - 1}
$$

---
### SVD Approach

Choose the $X$ row data matrix, and use SVD on it, with: $X = U\Sigma V^T$

Then, $Y = U^TX$, and the $Y$ matrix is the data in the new frame of reference. And: 

$$
C_Y = \frac{1}{n - 1} YY^T = \frac{\Sigma^2}{n - 1}
$$

The principal components are in the $U$ matrix. That is the alternative basis where, it describes the data with minimal amount of covariance.