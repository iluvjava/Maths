[Finite Difference with Errors Term](Finite%20Difference%20with%20Errors%20Term.md)
Readers are required to read th above source in advanced because that parts defines most of the notations thta we are going to use. 

---
### **Intro**

The nightpoint Laplacian is concerned with the following stencil operations: 

$$
\vec{f}_{\mathcal{I}(i, j)} = 
\frac{1}{6h^2}\text{sum}
\left(
    \begin{bmatrix}
        u_{i-1, j +1}& 4u_{i, j + 1}& u_{i + 1, j + 1}\\
        4u_{i - 1, j}& -20 u_{i, j}& 4u_{i + 1, j} \\
        u_{i - 1, j -1}& 4u_{i, j - 1} & u_{i + 1, j - 1}
    \end{bmatrix}
\right)
$$

This stencil is then applied as the discrete Laplacian Operator to solve the Steady stead in-homogeneous Poisson Equation. We skip the bounary part. Let the matrix $A$ denotes the above stencil operations on the function $u$ over the unit equally spaced grid $[0, 1]^2$ using natural ordering. 

---
### **The Error Terms and Method of Deferred Corrections**

Use $\nabla^2_{(5)}[u(x, y)]_{x, y}$ be the 9 point stencil operation on a function at point $(x, y)$, then the error term of the operation is given as: 

$$
\nabla_{(9)}^2[u(x, y)]_{(x_i, y_j)}
= 
\nabla^2[u(x, y)]_{(x_i, y_j)} + 
\frac{h^2}{12}
\underbrace{(\partial_x^4[u(x, y)]_{(x_i, y_j)} + \partial_y^4[u(x, y)]_{(x_i, y_j)} + 2\partial_x^2\partial_y^2[u(x, y)]_{(x_i, y_j)})}_{\nabla^2f(x_i, y_j)} + \mathcal{O}(h^4)
$$

Take note that, the error term is also the Laplacian of the RHS function in the Poisson Equation, this is by the definition of te Poisson Equation, because $\nabla^2[\nabla^2[u(x, y)]_{(x, y)}] = \nabla^2[f(x, y)]_{(x, y)}$. 

**Note**: The error term can be derived via the stencil definition and considering the Multi-variable expansion of the tayler series. More info: [Taylor Series](../MATH%20000%20Math%20Essential/Calc/Taylor%20Series.md). Here we skip the math for the peace of mind. Leave it for another day. 

Observe the the stencil itself DOES NOT produce an order of accuracy higher than $\mathcal{O}(h^2)$, to obtain an higher order for the finite difference method, we use the method of *Deferred Correction*. The method is deferred correction is used, and more precisely, we denote the error vector: 

$$
\begin{aligned}
    \tau_{i, j} &:= \nabla^2[f(x,y)]_{(x_i, y_j)} \quad \gamma_{i, j}:= \mathcal{O}(h^4)
    \\
    \vec{\tau}_{\mathcal{I}(i, j)} &= \tau_{i, j} \quad \gamma_{\mathcal{I}(i, j)} = \gamma_{i, j}
\end{aligned}
$$

Suppose that we solve the system $A\vec{u} = \vec{f} + \vec{\tau}$ as the approximation to the true solution vector denoted as $\hat{u}$, then: 

