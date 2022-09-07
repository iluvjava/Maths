The Householder Triangularization is one of the numerical algorithm that can perform a QR decomposition on any given full rank matrix. 

prereq: [QR](../Matrix%20Theory/Matrix%20Decomposition/QR.md); give an over view about the the structure of the R matrix. 
prereq: [Modified GS Process](../QR%20Decomposition/Modified%20GS%20Process.md); the content in the about the orthogonal projector.  
prereq: [HS Reflector](../QR%20Decomposition/HS%20Reflector.md); Provides some background on why the reflection is a legit transformation the reflect the vector $v$ to $||v||e_k$

---

#### **Intro**
The Gram Shimtz Process has a different view to it. 

When the algorithm is computing the matrices, it choose to Orthogonalize the matrix $A$ while producing a triangular matrix. 

$AR_1R_2R_3\cdots = Q$

So it's looking for a sequence of continuous product of special matrices (I am not sure the exact shapes of the matrices yet) such that it will orthogonalize the matrix $A$.

The House Holder Triangularization take the approach of **Triangularizing a matrix using unitary transformation**. And the unitary transformation in this case is the reflection of a hyper plane between the vector, and the resulting vector after the transformation. 

Here is some assumption to our set up of the matrix, the matrix is full rank and it's skinny meaning that $A \in \mathbb{C}^{m\times n}$ where $m\leq n$

---
### **Householder Triangularization** 

>$$ Q_nQ_{n - 1}\cdots Q_2Q_1A= R$$

And the objective now it's too look for the matrices $Q_k$ such that it's always a unitary transformation (reflection in this case), while at the same time, transforming the matrix $A$ into a upper triangularization matrix.

Now, the thing here is that each multiplication of the $R$ matrix will take one of the column to fit the triangular form of the matrix.

![HS Triangularization R Matrix](../../Assets/HS%20Triangularization%20R%20Matrix.png)

Notice that such a matrix will has special struture to it. The $Q$ matrix is the matrix that operates on the colums of the matrix $A$, it will try to triangularize the columns of $A$ one by one.   

$$
Q_k = 
\begin{bmatrix}
	\underset{k\times k}{I} &  0 \\[0.5em]
	0 & \underset{m - k \times m - k}{F} 
\end{bmatrix}
$$

The Identity matrix on the top right corner will leave the previous Trianularize operations from the other matrices of $Q_j$ along so they won't chage.

This is done recursively, therefore, we can focus on the $k$ th columns, and then only focus sub-part of the matrx $A$ where $F$ had an effect on operating. 

First, the transformation can be summarized as the following: 


![House holder reflector transformation](../../Assets/House%20holder%20reflector%20transformation.png)

And this process will have to be a unitary transformation. First, let's see how we can get the vector $v$ as the base of the triangle. $v = ||v||e_1 - x$, and this will be the base of the reflector. 

**Notes**, the reflector transformation is going to be define with one vector that is orthogonal to the reflecting hyper plane, and it's using the idea of an orthogonal projector. For example, if we were going to find a matrix that codes the reflection on the hyperplane perpendicular to the vector $v$, then the matrix will be defined with respect to the matrix in the following way: 

$$
P_x = \left(I - 2\frac{vv^H}{v^Hv}\right)
$$

Notice the only different between the reflector and the projector is the difference constant value 2. 

So what it does is, it project itself to the subspace, and then instead of subtracting one vector, it substract 2 vectors to reach the other end of the Hyper Plane. 

And this is how the matrix $F$ as an unitary transformation, operates on vectors of the subspace. 

By defining the $v = ||v||e_1 - x$, then we will have the formation the matrix $F$, which is going to be: 
$$P_x = F$$

---
### **Numerical Stability**

So far we cannot immediately see the reasons why this method is having better numerical stability. But the key here is about the vector $v$. 

The key here is the choice of the pojected vector, it can be $|\lambda|e_1$ where $\lambda \in \mathbb{C}$ and it has the unity modulus. 

However, in the book \<Numerical Linear Algebra\>, another approach is used, instead the vector v is represented as: $v = -\text{sign}(x_1)||x||e_1 - x$. 

And this will prevent the vector x from being too close to the vector $e_1$, so that, the magnitude of the vector $v$ stays in control. 

![Householder  double hyperplane](../../Assets/Householder%20%20double%20hyperplane.png)

So when the vector lies close with $e_1$, then the hyperplane $H^-$ will be chosen and vice versa. 

---
#### **Pusedo Codes**

precondition: The matrix is a full rank matrix. 

```matlab
function [Q, R] = QRFactor(A)
	[m, n] = size(A);
	Q = eye(m)
	
	for k = 1: n
		z = A(k:m, k)  % Choose first vector from the submatrix of A. 

		v = [-sign(z(1))*norm(z) - z(1); 
			 -z(2:end)];
		% Vector perpendicular to the reflecting hyperplane. 

		v = v/sqrt(v'*v);  % Eliminate the numerator v'*v to make thinges easier.

		for j = 1:n
			% Triangularize the sub matrix of A
			A(k: m, j) = A(k:m, j) - v * (2 * (v' * A(k: m, j))); 
		end

		for j = 1:m 
			% Accumulates transformation on the sub matrix of Q, 
			Q(k: m, j) = Q(k:m, j) - v * (2 * (v' * Q(k: m, j)));
		end

		% Don't forget the inverse. 
		Q = Q';
		R = triu(A);  % exact triangularity, trim of the small errors. 
	
	end
end
```

Observe how that we are able to accumulate the changes on the matrix A so that the matrix A will be the R matrix in the end. 

However, during actual implementations of the codes, we have to take notice on some of the details, notice that, if `z(1)` is zero, then the algorithm breaks because 


```python
# Must run this. 
from numpy import sign, identity, array, vstack, zeros, triu, tril, sqrt, set_printoptions
from numpy.linalg import norm
from numpy.random import rand
from math import isclose
from statistics import mean
import numpy as np
eye = identity
arr = array

def full_qr_factor(R):
    """
        Performs a Householder Transformation on the given matrix A, 
        full QR Decomposition. 
    """
    R = R.copy().astype("float64")
    assert len(R.shape) == 2
    m, n = R.shape[0], R.shape[1]
    Q = eye(m)
    for K in range((n - 1) if n == m else n):
        z = R[K:m, [K]]
        v = zeros((z.shape[0], 1))
        NormZ = norm(z)
        if isclose(NormZ, 0): continue
        v[0, 0] = (1 if z[0] < 0 else -1)*NormZ
        v = v - z
        v = v/norm(v)
        J = list(range(n))
        P = v@v.T
        R[K: m, :n] = R[K: m, J] - 2*P@R[K: m, J]
        J = list(range(m))
        Q[K: m, :m] = Q[K: m, J] - 2*P@Q[K: m, J]
    return Q.T, triu(R)
```

---
### **Key Implementation Details**

When implementing the algorithm in practice, there will be several important things to take notice, they are: 
* Squared Matrices
* Reflecting Orthogonal Vectors 
* Rank Deficient Matrices

For squared matrices, we ignore the last column, because when there is only one column left and the first `n - 1` columns are triangular, then the whole matrix is automatically triangular. 

When reflecting the vector, if the first element of the vector $z$ is zero, then we cannot use `sign(z)` to do hyper plane reflection, this will ruin everything, and hence, we just skip that part and use $||z||e_1$. 

When the matrix is rank deficit there will be columns full of zeros when triangularizing the matrix $A$, in that case, we just need to ignore that column completely and pretend it doesn't exist. If we made the choice of doing that, then the resulting upper triangular matrix $R$ will not be **Triangular anymore**. 


Fact: This algorithm is supreme when it comes to numerical accuracy and numerical stability. 