The curl is a vector field over a vector field that measure sthe amount of swirls involved in a given vector field. 

[Ortho Curvillinears Coord](Ortho%20Curvillinears%20Coord.md)

---

Using the abuse of notation we will be able to get the definition of curl as: 

For a given function that $\mathbb{R}^{n} \mapsto \mathbb{R}^{n}$, 

And the function is like: 

$$F(x, y, z) = \begin{bmatrix} 
	F_1(x, y, z)\\[0.5em]
	F_2(x, y, z)\\[0.5em]
	F_3(x, y, z)
\end{bmatrix}$$

> $$\nabla\times F $$

And this this is literally just: 

$$\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}$$

> $$\begin{vmatrix}
\uvec{I} & \uvec{J} & \uvec{k} \\[0.5em]
\partial_x & \partial_y & \partial_z\\[0.5em]
F_1(x, y, z) & F_1(x, y, z) & F_1(x, y, z)
\end{vmatrix}$$

Remember, the direction is the **anti-clockwise**, and the direction of the orthogonal vector is given by the: "**Right Hand Rule**"

Observe that, by abusing the notation, the curl is literally the cross product of the Nebla operator and  the the vector field. 

In fact under the case of curvilinear coordinate, the curl of a vector field is simply: 

---
### Curvilinear Curl 

$$
\frac{1}{h_1h_2h_3}
\begin{vmatrix}
h_1\uvec{e}_1 & h_2\uvec{e}_2 & h_3\uvec{e}_3 
\\[0.5em]
\partial u_1 & \partial u_2 & \partial u_3
\\[0.5em]
h_1F_1 & h_2F_2 & h_3F_3
\end{vmatrix}
$$

Cool, please observe that the gradient operator remains unchanged, the vector field and the unit vectors for the field has been scaled by the same Lame Coefficient, and in addition to that there is a $1/(h_1h_2h_3)$ in front of the matrix. 

**Note** if we want to multiply the term $1/(h_1h_2h_3)$ in, we can only do that for one of the row, by the property of the matrix determinant. 

So another interpretation of will be dividing each of the column byu the Lame Coefficient, and then we will be able to get rid of the multiplier outside of the matrix determinant: 

$$
\begin{vmatrix}
\uvec{e}_1 & \uvec{e}_2 & \uvec{e}_3 
\\[0.5em]
\frac{\partial u_1}{h_1} & \frac{\partial u_2}{h_2} & \frac{\partial u_3}{h_3}
\\[0.5em]
F_1 & F_2 & F_3
\end{vmatrix}
$$


This has application to test the conservative vector field in ortho linear coordinates