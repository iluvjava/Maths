Finite Element Method: For problem with a very very general domain, that is not a square, not a grid, but like, sphere and stuff.  

prereq: Background in Numerical Analysis and Lagrange Interpolations. 
Wiki: [Link](https://www.wikiwand.com/en/Finite_element_method)


---

### Intro

The domain of simulations is very general. Thinking about finite difference, if we are talking about that, then we have to excludes some points that are not in the domain in order to fit the domain of simulations, and that is not easy to do. 

So Finite different method cannot handle the problem in general. 

### Motivating Example

**Put nodes on the perimeter of the domain**. 

Then the nodes are going to linked by lines, which are approximation to the curvy domain. (No Fancy Fractal Domains here). 

Define Nodes all round the domain and they don't have to be uniform. 

$$
l_{i,j} 
$$

as the length length of the line segment connected the $i$, $j$ th nodes for the domain. 

$$
L = \sum_{i = 1}^N l_{i, i + 1}
$$

Then the $L$ is going to be the perimeter of the domain, as more points are introduced, we will have more and more points and the approximation will get better.

 #### Finite Elements: PDEs 
 
1. Discretized the domain into nodes. 
2.  Interpolate the elements. 
3.  Formulate the PDEs into Integral form on the elements. (Weak Formulations)
4. Formulate PDEs as a linear system: $Ax = b$
5. The solution for the system is the solution to the PDEs. 

### Interpolation: 1D 

Lines. Use lines to interpolate the points in the domain. 
* Linear: Simplex 
* Non-Linear: Complex

In 1D it's very similar to Lagrange Polynomial 

---

### Interpolations: 2D

Consider the **Simplex Triangularization** of the domain, we have: 

$$
\phi(x,y) = a + bx + cy
$$

**Complex Interpolation** can be formulated as: 

$$
\phi(x, y) = a + bx + cy + dxy + ex^2 + fy^2
$$

Is all we need for the quadratic interpolation of domain.   

When we unite several of these triangles in the domain, we will get the **Multiplex** for the domain. 

* Why are we using Complex? "It's for higher order derivative"

---
#### 2D interpolation

Choose 3 nodes and we have: 

* $\phi_i \leftarrow (x_i, y_i)$
* $\phi_j \leftarrow (x_j, y_j)$
* $\phi_k \leftarrow (x_k, y_k)$

Now we need to determine the coefficients: $a, b, c$

$$
\phi(x, y) = N_i(x, y)\phi_i + N_j(x, y)\phi_j  + N_k(x, y)\phi_k
$$

And the $N_i(x, y)$ are the Columns of $A^{-1}$, where $A$ will be the 2d Vandermonde Matrix, And they are also the coefficients of Lagrange Polynomial Coefficients. 

When using 2D interpolation, we want to maximize the area of the triangle, minimizes the number of triangles, and then uses: "**Delaunay Triangulation**"

Let's take a look at the interpolation matrix and coefficient matrix: 

$$
\begin{bmatrix}
	\phi_i \\ \phi_j \\ \phi_k
\end{bmatrix}
= 
\begin{bmatrix}
	1 & x_i & y_i \\ 
	1 & x_j & y_j \\
	1 & x_k & y_k 
\end{bmatrix}
\begin{bmatrix}
	a \\ b \\ c 
\end{bmatrix}
$$

Solve the system and then we will have the coefficients for interpolations on these 3 points for $\phi$. 

And We can solve it to have the following: 

$$
\mathbf{a}=\mathbf{A}^{-1} \phi=\frac{1}{2 S}\left(\begin{array}{ccc}
x_{j} y_{k}-x_{k} y_{j} & x_{k} y_{i}-x_{i} y_{k} & x_{i} y_{j}-x_{j} y_{i} \\
y_{j}-y_{k} & y_{k}-y_{i} & y_{i}-y_{j} \\
x_{k}-x_{j} & x_{i}-x_{k} & x_{j}-x_{i}
\end{array}\right)\left(\begin{array}{c}
\phi_{i} \\
\phi_{j} \\ 
\phi_{k}
\end{array}\right)
$$

Where $S$ is the area of the triangle that got projected down the xy plane. 

Note: Everything outside of the domain are defined as zero. 

#### Weak Formulation of Poisson Equations

Let's take the example of the Poisson Equation: 
> $$
> -\nabla^2u = f(x, y)
> $$

On the Smiley face domain, denoted by: $\Omega$ And the boundary condition will be Naumann Boundary with: 

$$
\frac{\partial u}{\partial n} = h(x,y)
$$

Where the $n$ means that: The derivative of the equation **on the normal direction** will be equal to some function. And let's denote the boundary condition with: $\Gamma$.   

Integral the Poisson equation over the $\Omega$ over the domain. (This is called **The Variation Principal**)

$$
\iint_{\Omega}( -\nabla^2 u)v \;dx dy = \iint_{\Omega} f(x, y) v\;dx dy
$$

Where $v$ is a test function, sometimes call the "**Modifier Function**" using integral by parts, we will have: 

$$
\iint_{\Omega} \nabla u \cdot \nabla v \; dxdy - \int_\Gamma 
\frac{\partial u}{\partial n} dx dy 
= 
\iint_{\Omega} f(x,y) v\;dx dy \quad \forall v
$$

The equation will be true for all the function $v$

Let's also denote the following quantities: 

* N - The number of elements. 
* P - The number of elements that is touching the boundary. 

 The $u(x,y)$ as the solution function, will be expressed as the following: 
 
$$
u(x, y) = \sum_{n = 1}^{N} r_n \phi(x,y)
$$

$$
v(x,y) = \phi_m(x, y)
$$

$\phi_m$ is just another function on the domain, any function. 

Then: 

$$
\iint_\Omega \sum_{n = 1}^N r_n(\phi_{nx}\phi_{mx} + \phi_{my}\phi_{ny}) dydx
-
\int_{\Gamma} n(x, y)\phi_m\; dydx
=
\iint_{\Omega} f(x, y) v dxdy 
$$

We can take out the sum an then we will have a matrix linear system here, taking then out we will have the following linear system: 

$$
A_{mn} = 
\iint_\Omega \phi_{nx}\phi_{mx} + \phi_{my}\phi_{ny}d\Gamma 
+ 
\int f \phi_m dxdy
$$

Then we have: 

$$
A\vec{\gamma} = \vec{b}
$$

Where the vector $b$ is going to be: 

$$
b_m = \int_{\Gamma}h(x, y)\phi_m(x, y) dx dy + 
\iint_{\Omega} f(x, y)\phi_m(x, y) dxdy
$$

### Implementations

* Discretized the domain. 
* Interpolate nodes into elements. 
	* Simplex or Complex. 
	* Zeroes out side the domain. 
	* $u(x, y) = \sum_{n = 1}^N r_n \phi_n(x,y)$
* Weak Formulation, integration by parts, test function. 
	* Getting the $A_{m, n}$


In matlab, type in $pdetool$ for solving 2d PDEs equations. 


