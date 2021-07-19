Krylov Subspace is used in a lot of places: 
* Eigenvectors related stuff
* Solutions for the system. 

---
### **Intro**


**Claim 1:**

> If a matrix is invertible, then it can be represented via vectors in the Krylov Subspace. 

Suppose we have $A$ as a square matrix that is invertible. Then: 

**Characteristic Polynomial** 

$$
p(\lambda) = \sum_{i = 0}^{n}
    c_0 \lambda^i = |A - \lambda I|
$$

**Claim 1.1**

> A matrix satisfies it's own characteristic quation 
> $$p(A) = \mathbf{0}$$ 
> The polynomial outputs a matrix. 

**Full proof is not given, but this is true for diagonalizable matrices.** 

Let the eigen decomposition(Jordan Decomposition) for matrix $A$ to be $X\Lambda X^{-1}$

$$
\begin{aligned}
    p(A) &= \sum_{i=0}^{n}c_iA^i
    \\
    p(A) &= \sum_{i=0}^{n}c_i(X\Lambda X^{-1})^i
    \\
    p(A) &= \sum_{i=0}^{n}c_iX\Lambda^iX^{-1}
    \\
    p(A) &= X \left(\sum_{i = 0}^{n}
        c_i\Lambda^{i}
    \right)X^{-1}
\end{aligned}
$$

Consider $\Lambda$ to be the Jordan Decomposition matrix for the matrix. 

**Note**: $c_0 = (-1)|A|$, this quantity tells us whether the matrix is going to be invertible or not. 


---
### **Computationally Relevant to Inverse of the Matrix**

$$
\begin{aligned}
    \mathbf{0} &= 
        c_0I_n + c_1A + c_2A^2 \cdots c_nA^n
    \\
    -c_0I_n &=  
    c_1A + c_2A^2 \cdots c_nA^n
    \\
    I_n &= \frac{c_1}{c_0}A + \frac{c_2}{c_0}A^2 \cdots \frac{c_n}{c_0}A^n
    \\
    A^{- 1} &= \frac{c_1}{c_0}I_n + \frac{c_2}{c_0}A \cdots \frac{c_n}{c_0}A^{n - 1}
\end{aligned}
$$

The inverse of $A$ can be expressed using another matrix polynomials, using the coefficients from the characteristic polynomials. 