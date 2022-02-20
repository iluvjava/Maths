[[Finite Difference with Errors Term]]
Readers are required to read th above source in advanced because that parts defines most of the notations thta we are going to use. 

---
### **Intro**

The nightpoint Laplacian is concerned with the following stencil operations: 

$$
\vec{f}_{\mathcal{I}(i, j)} = 
\frac{1}{6h^2}\text{sum}
\left(
    \begin{bmatrix}
        u_{i-1, j - 1}& 4u_{i, j + 1}& u_{i + 1, j + 1}\\
        4u_{i - 1, j}& -20 u_{i, j}& 4u_{i + 1, j} \\
        u_{i - 1, j -1}& 4u_{i, j - 1} & u_{i + 1, j - 1}
    \end{bmatrix}
\right)
$$

This stencil is then applied as the discrete Laplacian Operator to solve the Steady stead in-homogeneous Poisson Equation. We skip the bounary part. 

---
### **The Error Terms and Method of Deferred Corrections**

