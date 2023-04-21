Here we are going to just brief over some of the geometry of conformal mapping and the geometry of a function that is entire analytical on the complex plane. 
prereq: [[Cauchy Riemann Condition]]

---

**Intro**

So, if a complex function is Analytical on the entire complex plane, it actually has some really beautiful geometry behind it. Let's talk about it: 

Assume that we have the following way to express the complex functions: 

> $$f(z) = u(x, y) + iv(x, y)$$

In terms of the geometry, all the contour lines associated with $u, v$ are going to be perpendicular to each other. 

Let's take a dot product on the gradient of the 2 functions, $u(x,y)$ and $v(x,y )$

$$
\begin{bmatrix}
	u_x \\ u_y
\end{bmatrix}^T
\begin{bmatrix}
   v_x \\ v_y
\end{bmatrix}
 = u_xv_x + u_yv_y
$$
Now, because we are assuming  that the function is Analytical, and hence it must satisfy the Cauchy Riemman conditions, and it will mean that: 

$$
u_x = v_y \; \wedge \; u_y = - v_x
$$

Substituting it back to the dot product, so that everything is expressed by $u$'s derivative, we will have: 

$$
u_x(-u_y) + u_yu_x = 0
$$

And hence, we have the statement that: 

> If a complex function $u(x, y) + iv(x, y)$ is analytical, then $\nabla u\perp \nabla v$

---

### A Beautiful Geometry

The contours:

$$
\begin{cases}
	v(x, y) &=& \alpha \\ 
	u(x, y) &=& \beta
\end{cases}
$$

Are going to cross each other in an orthogonal manner. 

This is called a: **Conformal Mapping**

---

### Comment
Note that all the functions that are analytic in the complex plane is going to be a curvillinear coordinate system in 2d. 