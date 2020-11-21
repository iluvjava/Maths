This is a more general formulation of a special type of transformation on the cartesian space. 

---

### Introduction
Consider a bijective mapping function that maps between 2 different coordinates. 

This is trasforming coordinates point of $(u_1, u_2,, u_3)$ into a coordinate point in $(x, y, z)$: 

$$\begin{bmatrix}
x  = x(u_1, u_2, u_3) \\ 
y  = y(u_1, u_2, u_3) \\ 
z  = z(u_1, u_2, u_3) \\ 
\end{bmatrix}
$$

And simiarly the reverse transformation of representing a coordinate points $(x, y, z)$ in the ortho curvilinear space will be: 

$$
u_1 = u_1 (x,y, z) \quad u_2 = u_2(x, y, z) \quad u_3 = u_3(x, y, z)
$$

What is a coordinate curve? 

$$\begin{bmatrix}
x(u_1, u_2, u_3) \\ 
y(u_1, u_2, u_3) \\ 
z(u_1, u_2, u_3) \\ 
\end{bmatrix} = 
\begin{bmatrix}
c_1 \\ c_2 \\ c_3
\end{bmatrix}
$$

Where $c_1, c_2, c_3$ are constants. 

**Definition**

> The curvilinear coordinates $(u_1, u_2, u_2)$ are said to be orthoganal if the $u_1$, $u_2$, $u_3$ coordinates curves are perpendicular to each other in every point in space. 


What this is saying is that, if I use a point $(u_1, u_2, u_3)$  to represent a point $(c_1, c_2, c_3)$ in the cartesian coordinate, then the curved surfaces represented by the curvilinear space will interact at the point, in addition to that, all the normal vector are orthogonal, and all the tangence vectors at that point is also orthogonal. 

---
#### Alternate Basis Vectors

So, we need to represent the curvilinear coordinate system as coordinate embedded into the cartesian coordiante, and we are going to use the above defintion to get them. 

Suppose we have the given vector (It's actually a transformation): 
$$\newcommand{\uvec}[1]{\boldsymbol{\hat{\textbf{#1}}}}$$

$$\vec{r} = x(\vec{u})\uvec{i} + y(\vec{u})\uvec{j} + z(\vec{u})\uvec{k}$$

Given the fact that the curvilinear coordinate is the ragent vector o the level curves, we know that: 

$$\uvec{e}_1 = \frac{\partial \vec{r}/\partial u_1}{||\partial \vec{r}/\partial u_1||}$$

And similarly we have the other 2 of the coordinates as: 

$$\uvec{e}_2 = \frac{\partial \vec{r}/\partial u_2}{||\partial \vec{r}/\partial u_2||}$$    $$\uvec{e}_3 = \frac{\partial \vec{r}/\partial u_3}{||\partial \vec{r}/\partial u_3||}$$

And the numerators are referred to as the **Lame coefficients**, for example: 

$$h_1 =\left\Vert \frac{\partial\vec{r}}{\partial u_1} \right\Vert$$

However, if the transformation given is in term of $(x,y, z)$, and we only know the inverse mapping: 

$$r = u_1(x, y, z)\uvec{i} + u_2(x, y, z)\uvec{j} + u_3(x, y, z)\uvec{k}$$

Then the alternative coordinates will become: 

$$\uvec{e}_1 = \frac{\nabla u_1}{||\nabla u_1||}$$

Simiarly for the other coordinates directions we have: 

$$\uvec{e}_2 = \frac{\nabla u_2}{||\nabla u_2||}$$

$$\uvec{e}_3 = \frac{\nabla u_3}{||\nabla u_3||}$$

Then this is the steps to get all the coordinate vectors when we have $(x, y, z)$ and the inverse mapping. 

This is also related to the **Lame Coefficient** by the following relations: 

$$\uvec{e}_1 =  \frac{\nabla u_1}{||\nabla u_1||} = h_1\nabla u_1$$

