Here we are going to discuss in details about the LU decomposition, so that we have a better understanding of it. 

This part of the book looks at some of the stuff behind the idea of an LU decomposition and find some exploit of it, so that it's easier to understand. 

Most of this is coming from the Trefethen's book, numerical Linear Algebra. 

[[LU Theorems]]

---
### **Introduction** 

The idea behind the $LU$ decomposition is to encode the process of Gaussian Eliminations into 2 matrix, the $L$ as an lower triangular matrix and the $U$ as an upper triangular matrix. 

The LU decomposition applies to square matrix $A$, both complex and real, let's assume that $A\in \mathbb{C}^{m \times m}$

$$L_{m - 1}L_{m - 2} \cdots L_{2}L_{1}A = U$$

Where each $L$ represents a row eliminations process during the Gaussian Elimination (For now assume no pivoting is needed during the elimination process).  And then we would like to find the inverse of those sequence of row operations matrix. 

$$
L = L_1^{-1} L_2^{-1} L_3^{-1} \cdots L^{-1}_{m - 2}L^{-1}_{m - 1}
$$

and then The matrix $A = LU$. 

**Note**: This algorithm is used to compute the determinant of a matrix in matlab codes. 


---
### **LU Without Pivoting** 

The illustrative process of triangularizing the $A$ matrix is much similar to the Householder Triangularization, but instead of producing a Unitary Matrix, we produce a sequence of a special type of Lowe Triangular matrix for the Transformation, and it's looking like this: 


#### Example

The matrix that we are going to decompose is: 

$$
A = 
\begin{bmatrix}
	2 & 1 & 1 & 0 \\
	4 & 3 & 3 & 1 \\
	8 & 7 & 9 & 5 \\
	6 & 7 & 9 & 8 \\
\end{bmatrix}
$$

The first row operation matrix $L_1$ is going to cancel out the first column except for the first element, then it's like: 

$$
L_1 = 
\begin{bmatrix}
	1 & & & \\ 
   -2 &1& & \\
   -4 & &1& \\
   -3 & & &1
\end{bmatrix}
$$

Then the row operation matrix is going to make the transformation on $A$, giving us that: 

$$
L_1 A = 
\begin{bmatrix}
	2 & 1 & 1 & 0 \\
	  & 1 & 1 & 1 \\
	  & 3 & 5 & 5 \\
	  & 4 & 6 & 8
\end{bmatrix}
$$

Then, the new row operation matrix is going to make a transformation on the inner sub matrix, and terminates other elements on the second column to make the matrix upper triangular, the matrix $L_2$ is going to be like: 

$$
L_2 = 
\begin{bmatrix}
	1 &   &   & \\ 
      & 1 &   & \\
      &-3 & 1 & \\
      &-4 &   & 1 
\end{bmatrix}
$$

Then: 

$$
L_2L_1A = 
\begin{bmatrix}
	2 & 1 & 1 & 0 \\
	  & 1 & 1 & 1 \\
	  &   & 2 & 2 \\
	  &   & 2 & 4
\end{bmatrix}
$$


And $L_3$ is literally just $R_4 \leftarrow R_4 - R_3$, and it's gonna be like: 

$$
L_3L_2L_1A = 
\begin{bmatrix}
	2 & 1 & 1 & 0 \\
	  & 1 & 1 & 1 \\
	  &   & 2 & 2 \\
	  &   &   & 2
\end{bmatrix}
$$

And Conveniently, the Inverse of the matrix $L_3L_2L_1$ is pretty trivial to get, it's just taking the negative sign on all the non-diagonal elements of the matrix: 

--- 
### **A General Formulation**

For this part, we are still going to be assuming that the matrix $A\in \mathbb{C}^{m\times m}$. And we are looking at one of the row operation matrix, $L_k$

The $L_k$ matrix is the matrix that operates on the $k^{th}$ column of the matrix, and aims to eliminates the entry zero for all rows that are below $k$. 

The $L_k$ matrix experience the following structure: 

$$(L_k)_{i, i}= 1 \quad \forall \; 1 \leq i \leq m$$
This is for the diagonal entries, and for the row operational elements, it's gonna looking like: 

$$
(L_k)_{i, k} = \frac{x_{j, k}}{x_{k, k}} \quad \forall \; k < j \leq m
$$

Ok... too much indexing, let's try if we can leverage the power of the matrix by representing it as something else. 

Let the vector $l$ be negative of the $k^{th}$ column of the matrix $L_k$, but with the $k$ element set to 1 instead of zero. 

$$
l_k = \begin{bmatrix}
	0 \\ 
	\vdots \\ 
	0 \\
	(L_k)_{k + 1, k} \\
	\vdots \\ 
	(L_k)_{m, k}
\end{bmatrix}
$$

Guess what this vector is special because: 

$$
L_k = I - l_k e_{k}^H
$$

Where the outer product of the $l_k$ vector and the $e_k$ vector actually makes up the matrix $L_k$ 

Observe that: 

$$
	e_k^H l_k =  0
$$

This is the case because the $(l_k)_k$ is zero and it's not present, and hence the dot product is going to be zero. 

Now let's consider the following express and see what it implies for the Row Operation Matrix: 

$$
	(I - l_ke_k^H)(I + l_ke_k^H)
$$

and expanding it we have: 
$$
	I - l_ke_k^Hl_ke_k^H
$$
and using the observation that $e_k^Hl_k = 0$, the expression equals to $I$, therefore, we have spotted the inverse matrix of the matrix $L_k$we simply swap the signs of all the non-diagonal elements in the matrix to get the inverse of the matrix $L_k$. 

In addition, the block structure of the matrix allows us to easily multiply together a sequences of the inverse matrices, more specifically: 

$$
	L = L_1^{-1}L_2^{-1} \cdots L^{-1}_{m-2}L^{-1}_{m-1}
$$

And this is the formula to get the Lower Triangular matrix $L$ for the LU decomposition. With pivoting. 

**Note:**
Also the sum of all the Lower Triangular Matrices are looking the same as the final results of the Lower Triangular Matrix. 

--- 

### **Algorithm 20.1 LU without Pivoting** 

Pseudo Codes: 

```codes
U = A, L = I
for k = 1: m - 1
	for j = k + 1: m
		l(j, k)    = u(j, k)/u(k, k)
		u(j, k: m) = u(j, k: m) - l(j, k)*u(k, k: m)
	end
end
```


---
### **LU Decomposition Partial Pivoting**

When eliminating the columns to get the matrix $U$ we might consider choosing the row where on the $k$ th column we can have the element such that it's the largest.

We achieve this using a permutation matrix at each step of the decomposition, during this discussion, without much loss of generality, we will be assuming the the matrix we want to decompose is 4 by 4. 

And this will be giving us the following: 

$$
L_3P_3L_2P_2L_1P_1A = U
$$

Now, spoiler: 

$$
L_3P_3L_2P_2L_1P_1A = L_3'L_2'L_1'P_3P_2P_1
$$

Where the prime notation on the lower triangular matrix denotes matrices of the following form: 

$$
L_3' = L_3 
$$
$$
L_2' = P_3L_2P_3^{-1}
$$
$$
L_1' = P_3P_2L_1P_2^{-1}P_3^{-1}
$$

Notice that, the matrix $P_3$, $P_2$ are not acting on the first column of the matrix $L_1$, it leaves it alone, and this is recursively true for the sub-matrices. 

#### In General
So in general, we will have the following: 
$$
(L_{m-1}'\cdots L_2'L_1')(P_{m - 1}\cdots P_2P_1)A = U
$$
Where $L_k$ is defined by: 
$$
L_k' = P_{m - 1}\cdots P_{k+1}L_kP_{k + 1}^{-1} \cdots P_{m - 1}^{-1}
$$

And  then in the end, we would love to figure out the inverse of all the stuff that multiplied on the LHS of the matrix $A$ and this is going to give us something like this: 

$$
PA = LU 
$$

Where: 
$$
L = (L'_{m -1}L'_{m - 2}\cdots L'_2L'_1)^{-1}
$$
Where the inverse of the matrix is trivial. 
And 
$$
P = P_{m - 1}P_{m - 2}\cdots P_{2}P_1
$$

Notice that, the $L_k'$ matrix is like the original $L_k$ matrix if there is no pivoting involved in the algorithm 

---

### **Algorithm 21.1** 

This algorithm with partial pivoting is from Trefethen's Book. 

```Matlab
function [L, U, P] = LuDecompose(A)
    % This function performs a LU matrix decomposition with the pivoting.
    % This is the  for midterm of AMATH 584. 
    [m, n] = size(A); 
    if m ~= n
        error("Matrix must be squared. ")
    end
    U = A; L = eye(m); P = eye(m);

    for K = 1: n - 1
        [MaxEntry, I] = max(abs(U(K:end, K)));
        if MaxEntry < 1e-16
           error("Matrix Hardly Invertible");
        end
        I  = I + K - 1;
        [U(K, K:m), U(I, K:m)] = swap(U(K, K:m), U(I, K:m));
        if K >= 2
            [L(K, 1: K - 1), L(I, 1: K - 1)] = ... 
                swap(L(K, 1: K - 1), L(I, 1: K - 1));
        end
        
        [P(K, :), P(I, :)] = swap(P(K, :), P(I, :));
        
        for J = K + 1: m
           L(J, K) = U(J, K)/U(K, K); 
           U(J, K:m) = U(J, K:m) - L(J, K)*U(K, K: m);
        end
    end
    U = triu(U);
    function [a, b] = swap(b, a)
    end
end
```

```python
from numpy import identity, array, triu,set_printoptions, argmax
from numpy.random import rand
from math import isclose
eye = identity
arr = array

def lu_decompose(A):
    """
        Function will performs a LU decomposition on the given matrix
    :param A:
        A invertible matrix.
    :return:
        P, L, U such that PA = LU
    """
    M, N = A.shape
    if M != N:
        raise Exception("Matrix must be squared. ")
    U = A.copy().astype("float64"); L = eye(M); P = eye(M)
    for K in range(N - 1):
        I = argmax(abs(U[K:, K])) + K
        assert not isclose(U[I, K], 0), "Hardly Invertible Matrix"
        U[[K], K:], U[[I], K:] = U[[I], K:], U[[K], K:]
        if K >= 1: L[[K], :K], L[[I], :K] = L[[I], :K], L[[K], :K]
        P[[K], :], P[[I], :] = P[[I], :], P[[K], :]
        # Cancellations
        L[K + 1:, K] = U[K + 1:, K]/U[K, K]
        for J in range(K + 1, M):
            U[J, K:] = U[J, K:] - L[J, K]*U[K, K:]
    return P, L, triu(U)

```

This is a very well-optimized algorithm, the $P$ permutations matrices are never represented as an actual matrix multiplication! But the operations will be felt by these matrices because of the use of <--> on these matrices. 

How is the $L$ matrix constructed? This part of the algorithm is the most fascinating part. 

$$L_1^{-1} \quad P_1$$

The is the first 2 row operational matrix and the row permutation matrix. 

$$
L_2^{-1}P_2L_1^{-1} \quad P_1P_2
$$

Notice that, the P2 Matrix actually acts on both $L_1^{-1}$ and $L_2^{-1}$ matrix, and that is kinda dope. 

$$
L_3^{-1}P_3L_2^{-1}P_2L_1^{-1} \quad P_3P_1P_2
$$

The matrix $(L_1)$ is going to feel the aggregate all the affects from the permutations matrix $P_3P_2P_1$ and the row operation matrices $L_2^{-1}L_3^{-1}$

And that is what the algorithm is doing. 

---
### **Extra**

When matrix is Symmetric, positive semi-definite, one can use Cholesky decomposition. [[Cholesky]]