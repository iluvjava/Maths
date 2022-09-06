This is mentioned as 0.7.5 in book \<Matrix Analysis\>


---
### **Intro**

We wish to investigate the ranks of submatrices by assuming a matrix is invertible. 

**Theorem Statement**

> $$
> (\text{dim} \leftarrow \text{null})(A[\alpha, \beta]) =(\text{dim} \leftarrow \text{null})(A^{-1}[\alpha^C,  \beta^C])\tag{1}
> $$

**Explanation:** 

Let's assume that matrix $A$ is invertible. 

$\alpha, \beta$ is a set of indices that index the rows and the columns of the matrix $A$, in this case $A[\alpha, \beta]$ is the submatrix where rows are index by set from $\alpha$ and columns are index by indices in set $\beta$. $\alpha^C, \beta^C$ are the complementary sets. 

Alternative equivalent statement is: 

> $$
> \text{rank}(A[\alpha, \beta]) = \text{rank}(A^{-1}[\beta^C, \alpha^C]) + |\alpha| + |\beta| - n \tag{2}
> $$


---
### **Proof**

Partition the matrix $A$ into block matrix so that the first $|\alpha|$ rows and the first $\beta$ columns are indexed by $\alpha$, and $\beta$. This is assumed without the loss of generality. 

$$
A::\mathbb{F}^{n\times n} = 
\begin{bmatrix}
    A_{1,1}::\mathbb{F}^{|\alpha| \times |\beta|} & A_{1, 2}
    \\
    A_{2,1} & A_{2,2} 
\end{bmatrix}
\quad 
A^{-1}::\mathbb{F}^{n\times n} = 
\begin{bmatrix}
    B_{1,1}::\mathbb{F}^{|\beta|\times |\alpha|} & B_{1,2}
    \\
    B_{2,1} & B_{2,2}
\end{bmatrix}
$$
 
Where $::$ is like a type annotation for elements in here. Infer the type yourself like a true programmer. I didn't annotate all of them for simplicity. 

Consider $x \in (\text{dim}\leftarrow \text{null})(A_{1,1})$ then it means that: 

$$
\begin{aligned}
    A 
    \begin{bmatrix}
        x \\ \mathbf{0}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf{0} \\ A_{2, 1}x
    \end{bmatrix}
    \\
    \underset{A^{-1}\exists}{\implies} 
    A_{2, 1} x &\neq \mathbf{0} \quad \forall x
\end{aligned}
$$

By invertiblity, the vector $A_{2, 1}x$ will not be zero, for all such a choice of vector $x$. 

Now also consider that: 

$$
A^{-1}A \begin{bmatrix}
    x \\ \mathbf{0}
\end{bmatrix}
= A^{-1} 
\begin{bmatrix}
    \mathbf{0}
    \\
    A_{2, 1} x
\end{bmatrix}
=
\begin{bmatrix}
    B_{1, 2}A_{2, 1}x
    \\
    B_{2, 2}A_{2, 1}x
\end{bmatrix} = 
\begin{bmatrix}
    x \\ \mathbf{0}
\end{bmatrix}
$$
In this case, we have to deduce the statement that: 

$$
\forall x \in (\text{dim} \leftarrow \text{null})(A_{1, 1})
: 
B_{2, 2}A_{2, 1}x = \mathbf{0} \implies (\text{dim}\leftarrow \text{null})(B_{2,2})\ge (\text{dim}\leftarrow \text{null})(A_{1,1})
$$

Consider another fact: $y\in (\text{dim}\leftarrow \text{null})(B_{2,2})$, then we can say: 

$$
\begin{aligned}
    A^{-1} \begin{bmatrix}
        \mathbf{0} \\ y
    \end{bmatrix}
    & = 
    \begin{bmatrix}
        B_{1, 2}y \\ 
        \mathbf{0}
    \end{bmatrix}
    \\
    \underset{A^{-1}, A\exists}{\implies} 
    B_{1,2}y &\neq \mathbf{0} \quad \forall \; y
\end{aligned}
$$

And by a similar to toek, we say that: 

$$
\begin{aligned}
    AA^{-1}\begin{bmatrix}
        \mathbf{0} \\ y 
    \end{bmatrix}
    &= 
    A
    \begin{bmatrix}
        B_{1, 2}y \\ 
        \mathbf{0}
    \end{bmatrix}
    \\
    \begin{bmatrix}
        A_{1, 1}B_{1, 2}y
        \\
        A_{2, 1}B_{1, 2}y
    \end{bmatrix}
    & = 
    \begin{bmatrix}
        \mathbf{0}
        \\
        y
    \end{bmatrix}
    \\
    \implies 
    A_{1, 1}B_{1, 2}y &= \mathbf{0} \quad \forall y
    \\
    \implies 
    (\text{dim} \leftarrow \text{null})(A_{1,1}) 
    &\ge 
    (\text{dim}\leftarrow \text{null})(B_{2,2})
\end{aligned}
$$

Then it has to be the case that: 

> $$
> (\text{dim}\leftarrow\text{null})(A_{1,1}) = (\text{dim}\leftarrow\text{null})(B_{2,2})
> $$

The first part of the theorem statement is proven

$\blacksquare$


In the second prove of the statement we are going to show that expression (1) and expression (2) are equivalent. 

Using the rank nulity theorem we can convert both size of the expression (1) into the following: 

$$
\begin{aligned}
    \min(|\alpha|, |\beta|)  - \text{rank}(A[\alpha, \beta]) &= 
    \min(n - |\lambda|, b - |\beta|) - \text{rank}(A^{-1}[\beta^C, \alpha^C])
    \\
    \min(|\alpha|, |\beta|) - \min(n - |\lambda|, b - |\beta|) &= 
    \text{rank}(A[\alpha, \beta]) - \text{rank}(A^{-1}[\beta^C, \alpha^C])
    \\
    \text{assuming: }|\alpha| & < |\beta| 
    \\
    |\alpha| - (n - |\beta|) &= |\alpha| + |\beta| - n
    \\
    \text{assuming: }|\alpha| & > |\beta| 
    \\
    |\beta| - (n - |\alpha|)| &= |\beta| + |\alpha| - n
    \\
    \implies 
    |\beta| + |\alpha|- n &= \text{rank}(A[\alpha, \beta]) - \text{rank}(A^{-1}[\beta^C, \alpha^C])
\end{aligned}
$$


