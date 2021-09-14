Krylov Subspace is used in a lot of places: 
* Eigenvectors related stuff
* Solutions for the system. 

---
### **Intro**

This is the Krylov Subspace initialized by $b$: 

$$
\mathcal{K}_k = \langle b, Ab, A^2b, \cdots A^{k - 1}b \rangle
$$

**Claim 0:**
> $$
> \langle \mathcal{K}_1 \rangle \subseteq  \langle \mathcal{K}_2 \rangle \subseteq \langle \mathcal{K}_3 \rangle \cdots 
> $$

It's trivial to justify claim 0. 

**Claim 1:**

> If a matrix is invertible, then it can be represented via vectors in the Krylov Subspace. 

Suppose we have $A$ as a square matrix that is invertible. Then: 

**Characteristic Polynomial** 

$$
p(\lambda) = \sum_{i = 0}^{n}
    c_0 \lambda^i = |A - \lambda I|
$$

**Claim 1.1**

> A matrix satisfies it's own characteristic equation 
> $$p(A) = \mathbf{0}$$ 
> The polynomial outputs a matrix. This is called the Cayley-Hamilton Theorem. 

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

**Note**: $c_0 = (-1)^n|A|$, this quantity tells us whether the matrix is going to be invertible or not. 


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
    -I_n &= \frac{c_1}{c_0}A + \frac{c_2}{c_0}A^2 \cdots \frac{c_n}{c_0}A^n
    \\\implies
    -A^{- 1} &= \frac{c_1}{c_0}I_n + \frac{c_2}{c_0}A \cdots \frac{c_n}{c_0}A^{n - 1}
    \\\implies
    -b &= \frac{c_1}{c_0}Ab + \frac{c_2}{c_0}A^2b \cdots \frac{c_n}{c_0}A^nb
\end{aligned}
$$

The inverse of $A$ can be expressed using another matrix polynomials, using the coefficients from the characteristic polynomials. 

Any vector, can be spanned by the Krylov Subspace, if we know that $A$ is invertible.  