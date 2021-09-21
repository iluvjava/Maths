[[Fields of Values]]

---
### **Intro**

Here we are going to prove this statement: 

> The eigenvalues of a **normal matrix** is the convex hull of the Fields of values of the matrix. 


$A$ is a square normal matrix then: 

$$
A = Q\Lambda Q^H 
$$

Where $Q$ are unitary and $R$ is diagonal. This is the Corollary of the [[Schur Decomposition]]. Let's consider the field of values on this matrix which is: 

$$
\begin{aligned}
    \mathcal{F}(A) &=  \left\lbrace
        \frac{y^HQ\Lambda Q^Hy}{y^Hy}: y \in \mathbb{C}
    \right\rbrace
    \\
    & =  \left\lbrace
        \frac{y^HQ\Lambda Q^Hy}{y^HQQ^Hy}: y \in \mathbb{C}
    \right\rbrace
    \\
    &= \left\lbrace
        \frac{z^H\Lambda z}{z^Hz} : z = Q^H y \in \mathbb{Q}
    \right\rbrace
\end{aligned}
$$

Take note that, $\Lambda$  is a diagonal matrix consits of all the Eigenvalues for the matrix $A$. 

Which is basically: 

$$
\sum_{j = 1}^{n}\lambda_i|z_i|^2 \text{ Where: } \Vert z\Vert_2^2 = 1
$$

Notice that, this is the convex combinations of all the Eigenvalues of $A$, and becaus the equality, it's the convexhull of all the eigenvalues of the matrix $A$. 


---
### **Corollary**

> $$
> \Re(\mathcal{F}(A)) = \mathcal{F}(\mathbb{H}(A))
> $$ 
> where $\mathbb{H}(A) = \frac{1}{2}(A + A^H)$

The proof is kinda obvious, just remember that $y^H A y$ and $y^HA^Hy$ are conjugate of each other, using the properties of: [[Complex Vec Dot]]. Nice and easy. 