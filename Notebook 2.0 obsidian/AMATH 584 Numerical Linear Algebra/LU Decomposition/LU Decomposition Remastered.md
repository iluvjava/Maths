The exact same materials has been covered by [[LU Decomposition]] before, but this time I need to point out something new about it, and hopefully it can lead us to something that new. 

---

### **Intro**

LU looks complicated, but under the lenses of sub-matrices, or structure matrices, along with the idea of recursion, it becomes pretty simple. 

**Goal**: 

> Recursively we want to eliminate entries of the first column of the matrix, for all the rows below the first row, and we wish to do it by considering the following: 

$$
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    l & 
    \begin{matrix}
        I
    \end{matrix}
\end{bmatrix}
\begin{bmatrix}
    a_{1, 1} & u^T
    \\
    v & A^{(1)}
\end{bmatrix}
=
\begin{bmatrix}
    a_{1, 1} & u^T 
    \\
    a_{1, 1}l + v & lu^T + A^{(1)}
\end{bmatrix}
$$

Where the matrix $A$ is the matrix we wish to LU decompose and $A^{(1)}$ is $A[2:, 2:]$. 

In this case, it's not hard to solve for $l$: 

$$
a_{1, 1}l = -v\implies l = -v/a_{1,1}
$$

This process is then repeated recursively for the matrix $A^{(1)}$. 

**Claim 1**

> For matrix $L$ that operates on $[k:, k:]$ sub matrices, it can commute with a matrix that operates on a $[k:, k:]$ sub matrix. 

$$
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    l & I
\end{bmatrix} \begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    \mathbf{0}& M
\end{bmatrix} = 
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    \mathbf{0}& M
\end{bmatrix}
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    l & I
\end{bmatrix}
$$

And the order can be reversed if the matrix only consists of a certain sub-structure. 

**Claim 2**

> For row operation matrix $L$, it's inverse is just adding negative sign to the non-trivial columns, which is going to be like: 

$$
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    l & I
\end{bmatrix}
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    -l & I
\end{bmatrix} = 
\begin{bmatrix}
    1 & \mathbf{0}^T
    \\
    \mathbf{0}& I
\end{bmatrix}
$$


---
### **Partial Pivoting**

This is the LU decomposition process using partial Pivoting, let's consider the case of 3 by 3 matrix where 2 pivoting is involved: 

$$
\begin{aligned}
    L_2P_2L_1P_1 A &= U
    \\
    L_2L_1P_2P_1A &= U
    \\
    P_1P_2A &= L_1^{-1}L_2^{-1}U
    \\
    P_2P_1A &= L_1^{-1}L_2^{-1}U
\end{aligned}
$$


Here, the matrix $P_2$ and matrix $L_1$ can swap is because of **claim 1**.  $P_2$ is acting on the identity part of the matrix $L_1$, therefore they can swap position. 


> The computations is now made simple I believe. 

The above argument can be easily made into an inductive argument and the base case is trivial, we skipped the proof here. 

---
### **Julia Implementations**

This is the julia implementations of this particular interpretations of the LU decomposition without partial pivoting: 

```julia

function LU(A::Matrix{T}) where {T<:Number}
    m, n = size(A)
    @assert m == n "Matrix is not squared, can't be LU decomposed. "
    
    L = similar(A)
    U = similar(A)
    LU!(A, L, U)
    return L, U
end

function LU!(A::Matrix{T}, L::Matrix{T}, U::Matrix{T}) where {T<:Number}
    m, n = size(A)
    @assert m == n "Matrix is not squared, can't be LU decomposed. "
    @assert size(A) == size(L) "size of A and L should be the same."
    @assert size(A) == size(U) "size of A and U should be the same. "
    U .= A
    for k = 1:n - 1
        L[k, k] = 1
        L[k, k + 1:end] .= 0
        L[k + 1:end, k] = U[k + 1:end, k]/U[k, k]
        U[k + 1:end, k + 1:end] -= L[k + 1:end, k]*U[k, k + 1:end]'
        U[k + 1:end, k] .= 0
    end
    L[end, end] = 1
end
```

With Partial Pivoting, here is the implementations for it: 

```julia
function PLU!(A::Matrix{T}, L::Matrix{T}, U::Matrix{T}, P::Matrix{T}) where {T<:Number}
    m, n = size(A)
    @assert m == n "Matrix is not squared, can't be LU decomposed. "
    @assert size(A) == size(L) "size of A and L should be the same."
    @assert size(A) == size(U) "size of A and U should be the same. "
    @assert size(A) == size(P) "size of A and P should be the same. "
    U .= A
    P .= 0
    for II in 1:size(P, 1)
        P[II, II] = 1
    end
    for k = 1:n - 1
        L[k, k] = 1
        L[k, k + 1:end] .= 0
        m = argmax(abs.(U[k:end, k]))
        P[:, m], P[:, k] = P[:, k], P[:, m]
        U[k, :], U[m, :] = U[m, :], U[k, :]
        L[k + 1:end, k] = U[k + 1:end, k]/U[k, k]
        U[k + 1:end, k + 1:end] -= L[k + 1:end, k]*U[k, k + 1:end]'
        U[k + 1:end, k] .= 0
    end
    L[end, end] = 1
end

function PLU(A::Matrix{<:Number})
    P = similar(A)
    L = similar(A)
    U = similar(A)
    PLU!(A, L, U, P)
    return P, L, U
end

```