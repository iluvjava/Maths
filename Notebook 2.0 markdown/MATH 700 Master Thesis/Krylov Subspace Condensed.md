[Krylov Subspace](Krylov%20Subspace.md)

--- 
### **Intro**

Last time we made it too complicated, this time we try making it deadly simple. 

**Definition**

$$
\mathcal{K}_k(A|b) = \text{span}( b, Ab, A^2b, \cdots A^{k - 1}b)
$$

Observe that, for every element in the subspace, it's a matrix polynomial, we write it as $p_{k-1}(A|w)$, a $k-1$ degree matrix polynomial where $A$ is the matrix and $w$ is a vector denoting the coefficients. 

### **The Grade of a Krylov Subspace**

> The grade of the krylov subspace is the the smallest $k - 1$ such that $\mathcal K_{k}(A|v)$ has linear dependent vectors, denoted as $\text{grade}(A|v)$. It's the degree of the minimal polynomial of $p(A)b$ such that $p(A)b = \mathbf 0$ and the polynomial doesn't have all zeros coefficients. 
>
> When the grade is reached, the subspace is linearly dependent and  becomes invariant under $A$. Meaning that for all $x \in \mathcal K_k(A|v)$, $Ax\in \mathcal K_k(A|v)$. 

**Proof**

For notation simplicity we denote $\mathcal K_k$ for short. Suppose that $A^kv \in \mathcal K_{k}$, then $\mathcal K_{k + 1}$ becomes linear dependence as well, subsequentlly, all $\mathcal K_{k + j}$ where $j\ge 1$ will all be linear dependent, because they are subspace of each other. 

> Once the subspace becomes linear dependent, the subspace becomes invariant. 

$$
\begin{aligned}
    & K_k = \begin{bmatrix}
        b & AB & \cdots & A^{k - 1}b
    \end{bmatrix}
    \\
    & K_k \text{ Lin Dep} \implies \exists c \in \mathbb R^{k - 1}: A^{k-1}b = K_{k - 1}c
    \\
    & \implies 
    AK_k = K_k
        \underbrace{\begin{bmatrix}
            e_2 & \cdots & e_k & c
        \end{bmatrix}}_{:= C_k}
    \\
    & \implies 
    A^2K_k = AK_kC_k = K_kC_k^2
\end{aligned}
$$

$A^2K_k$ will span the same sapce as the range of the matrix $K_k$. 

---
### **Grade is Determined by Eigenvalues and the Initial Vector**

Suppose diagonalizable matrix $A = V\Lambda V^{-1}$ has krylov subspace grade reached, then the subspace is linear dependent therefore: 

$$
\begin{aligned}
    \exists w\neq \mathbf 0 : \mathbf 0 &= \sum_{j = 0}^{k}
    w_jA^{j}u
    \\
    \mathbf 0 &= V\sum_{j = 0}^{k} w_j\Lambda^jV^{-1}u
    \\
    \forall i \quad 0 = \left(
        \sum_{j = 0}^{k} w_j\lambda_i^{j}
    \right)(V^{-1}u)_i
\end{aligned}
$$

When non trivial solution exists for some $w_j \neq 0$, it will be the case that whenever $(V^{-1}u)_i$ is not zero, then the a polynomial will have to interpolate $\lambda_i$. Therefore, minimum $k$ is the number of unique $\lambda_i$ such that $(V^{-1}v)_i\neq 0$


---
### **Nonzero Constant when Grade is reached**

> Let $k$ be the grade of Krylov Subspace $A$ initialized with $v$, then exists $p_{k}(A|w)v = x$ for all $x$ in the subspace  with $w\neq \mathbf 0$, and it must be the case that $w_0\neq 0$.

For contradiction suppose otherwise that such a polynomial exists then: 

$$
\begin{aligned}
    \exists w &\neq \mathbf 0 : p_{k}(A|w)v = \mathbf 0 
    \\
    \implies& w_0v + \sum_{j = 1}^{k - 1} w_jA^jv = \mathbf 0
    \\
    \mathbf 0 &=\sum_{j = 1}^{k - 1} w_jA^jv
    \\
    \mathbf 0 &= A\sum_{j = 0}^{k - 2} w_{j + 1}A^jv
    \\
    \implies \sum_{j = 0}^{k - 2} w_{j + 1}A^jv &= \mathbf 0 
\end{aligned}
$$

From the second line to the third, I susbstitute $w_0 = 0$ for contradiction. On the last line, it suggested that $k$ is not the smallest, and $k - 1$ might be the grade, contradicting the assumption that $k$ is the grade of the Krylov Subspace. Therefore, $w_0 \neq 0 $. 

The above property finds the minimal polynomial of a matrix wrt to initial vector $v$. 


---
