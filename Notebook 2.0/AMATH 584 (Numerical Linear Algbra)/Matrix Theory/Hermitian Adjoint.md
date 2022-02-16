### **Hermitian Adjoin**

**Definition of Hermitian Adjoin**

> Let $A: H_1\mapsto H_2$ where $H_1, H_2$ are hilbert space, then the operator $A^* : H_2 \mapsto H_1$ is consider to be the adjoint operator of $A$, and it's given by the property of: 
> 
> $$
> \left\langle A h_{1}, h_{2}\right\rangle_{H_{2}}=\left\langle h_{1} , A^{*} h_{2}\right\rangle_{H_{1}}
> $$

**Explanation**:

This is saying that, if the matrix is a Hermitian matrix, then the above statement will be true. And after some math, it's easy to show that it has to be the case that, the operator is the Conjugate Transpose Operator. 

Link to: [wiki](https://www.wikiwand.com/en/Hermitian_adjoint) for Hermitian Adjoint. 

Link to: [Hilbert Spaces](https://en.wikipedia.org/wiki/Hilbert_space). 

Prereq of reading this part is to understand the adjoin of vectors's dot product, see more: [[Complex Inner Product]]

**Example**

> When the hilbert space is $\mathbb{R}^n$, and the opearor is a real matrix, then the adjoint of matrix $A$ is $A^T$. 

> When we are looking at Hilbert space $\mathbb{C}^n$, and the matrix is complex, then the adjoint is the Conjugate Transpose of the matrix, usually denoted using $A^H$. (Order of applying the conjugate or the transpose doesn't matter.) 

**Self Adjoint Operator**

The adjoint of the operator is the operator itself. $A = A^*$. When matrix is real, it would be symmetric, when matrix is complex, it would be Hermitian. 

---
### **Properties of Adjoin for Matrices**
* It's not hard to get from **(2)** to the following about matrices. Assume that $A\in \mathbb{C}^{m\times n}, B\in \mathbb{C}^{n\times k}$, then the following will be true: 

$$(AB)^H = B^HA^H$$

* Some of the other propertyes of adjoint involves 
    $$A^{-H} = (A^H)^{-1} = (A^{-1})^H$$

---
### **Hermitian Matrix**

* The hermitian matrix is forms a self-adjoin Hermitian operator for the complex+ vector space. 
* A Hermitian matrix has to be a square matrix, and the Conjugate Transpose of the matrix is simply itself, or it's like: $$A^H = A$$
* It is implied that the matrix is a square matrix. 

**Properties**: 
* Eigen values are real
* Eigen vectors are orthogonal to each other
* It's Diagonalizable

**Theorem**
> Hermitian Product implies communtability
> $$(AB)^H = AB \iff AB = BA$$

Matrix Commutability is exactly the same as whether the matrix as a product is Hermitian matrix. Now this is obvious and it's demonstrating the property of what we showed in complex vector dot product.  

**Proof**

Consider 2 vector from the $\mathbb{C}^n$: 
$$
(x^Hy)^H = x^Hy
$$

Then it's saying that it must be the case that: 
$$
x^Hy = y^Hx
$$

 and the only way this can be true is when 2 vectors are actually from $\mathbb{R}$, so that conjugate of the vector is the vector itself. 
 
 
# TODO: Proof not good, fix this later. 
 
 --- 
### **Properties with Proofs**
 
 > Eigen Values of a Hermitian Adjoin is real. (P1)

Assume: $Ax = \lambda x$ and $\lambda \neq 0$
$$(Ax)^Hx = (x^HAx)^*$$
$$
x^HA^Hx = x^HAx = (x^HAx)^*
$$
$$
\lambda\Vert x\Vert_2^2 = \lambda^*\Vert x\Vert^2_2
$$

Which is giving us: 

$$
\lambda \in \mathbb{R}
$$
Because Norm of vector are always real and the conjugate of the eigen values is itself. $\blacksquare$

> A Hermitian Adjoint has Orthogonal Eigen Vectors given that the corresponding eigen values are not and they are different. 

Assuming that we have 2 eigen vectors that share distinct eigen values, $Ax = \alpha x$ and $Ay =\beta y$ then consider the following: 

$$
x^HAy = ((Ay)^Hx)^*
$$

$$
x^HAy = (y^HAx)^*
$$

$$
\beta x^Hy = \alpha (y^Hx)^* = \alpha(x^Hy)
$$

Using the previous (P1), and the assumption that eigen values are distinct, then it must be the case that $(y^Hx) = 0$. $\blacksquare$

> A Hermitian adjoint is diagonalizable. 

Refers to: [[Schur Decomposition]], where it proves the spectral theorem. 
