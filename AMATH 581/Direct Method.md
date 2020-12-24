The direct method uses finite difference and the idea of a an operation matrix to reduce a linear system of 2nd order ODEs into an equation which involving matrix multiplication on the domain of the function, and it  can solve Boundary Value Problem. 

Prereq: [[BVP]], [[Finite Difference]]

---


The Direct method applies to BVP with the following form: 

> $$y'' = p(t)y' + q(t)y + r(t)$$

Notice that this is a linear second order differential equation, where the boundary conditions can be written as: 

> $$y(t_0) = \alpha \quad y(t_N) = \beta$$

Where we even divides a finite interval into $N + 1$ piece, starting with $t_0$ and ending with $t_N$. 

The key here is to notice that, the finite difference of a function over range of a function is a linear operator that can be put into a band matrix. 

> $$y'(t) = \frac{y(t + \Delta t) - y(t - \Delta t)}{2\Delta t} + \mathcal{O}(\Delta t^2)$$

> $$y''(t) = \frac{y(t+\Delta t) - 2y(t) + y(t - \Delta t)}{\Delta t^2}$$

And that is a band matrix with a width of 3, and the bands are -1, 0, -1. 

In this case, we can accumulate the LHS of the equation into one big matrix that represents this equation: 

$$\left(\frac{d^2}{dt} - p(t)\frac{d}{dt} + q(t)\right)y = r(t)$$

**Note:**
When using finite difference, all of the scheme will have to be on the same order.

Aggregating them together into one operator, we actually have the following the 3 band matrix: 

first band: $1 + p(t)\frac{\Delta t}{2}$
second band: $-2 - q(t)\Delta t^2$
third band: $1 - \frac{p(t)\Delta t}{2}$

Boom, we have the band matrix for this shit, and this is the operator, however, not includeing the bondary conditions. 

The first and and the last row is for the boundary condition of the function. 

Top row: $[1\; 0\; 0 \cdots 0]$
Last row: $[0, 0\; 0\; \cdots 1]$

Notice that, the $b$ vector will the right hand side of the equation, which is given as: 


$$
b = 
\begin{bmatrix}
	\alpha \\ 
	r(t_1) \Delta t^2 \\ 
	t(t_2) \Delta t\\ 
	\vdots\\
	r(t_N)\Delta t^2\\
	\beta
\end{bmatrix}
$$

Nitice that, the $\Delta t^2$, which is coming from the finite difference of this vector! 

And this is giving us a function of the form $Ax  = b$, which is very easy to solve in matlab. 


---

#### More Involved Boundary Conditions

In general, there might be Boundary Conditions that involve some derivative of the function at that point, and let's see if we can incorperate that into the matrix. 

> $$\alpha_1 y(t_0) + \beta_1 y'(t_0) = \gamma_1$$ $$\alpha_2 y(t_N) + \beta_2 y'(t_N) = \gamma_2$$

Well, it's not hard, here we will substitute the finite second order difference back into the boundary conditions, but this time, we take the Forward and Backwards difference, so we can evaluate things on the boundary of the curve.

$$
\alpha_1 y(t) 
+
\beta_1 \frac{y(t + 2\Delta t) - 4y(t + \Delta t) + 3y(t)}{2\Delta t}
=
\gamma_1
$$

And the backwards difference substitute is very similar: 

$$
\alpha_1 y(t) 
+
\beta_1 \frac{- y(t + 2\Delta t) + 4y(t + \Delta t) - 3y(t)}{2\Delta t}
=
\gamma_1
$$

**Note:**
It has to be linear, or else direct method will become a non-linear method, which is harder to handle


---
#### When It's Non-Linear

When it's non linear, we need to model the BVPs problem as a single system of non-linear equations. This is the iteration scheme for the non-linear system: 

> $$x_{n + 1} = x_n + \Delta x_n$$

where the spatial stepping is going to be determined by the Jacobian of the function: 

$$\textbf{J}\Delta x_n = - F(x_n)$$

---
#### Higher Dimension


Direct method can be applied to higher dimension, using the Kronecker Product and vectorization of the high dimensional domain, we will be able to put a high dimension problem into a matrix vector system. 

Suppose that we were given a discrete partial differential operators $\partial_x$ fora 2 dimensional problem. And suppose that we pack the domain of the by discretizing along the columns (same x value) and then y value.

More specifically, suppose that $\psi(x_i, y_j) = \psi_{i, j}$, and the grid is uniformly discretized, then the vectorized domain can be described as: 

$$
  \vec{\psi} = 
	\begin{bmatrix}
		\vec{\psi}_{1, 1:N}
		\\
		\vec{\psi}_{2, 1:N}
		\\
		\vdots
		\\
		\vec{\psi}_{N, 1:N}
	\end{bmatrix}
$$
        
Then our $\partial_x$ differential operator for 2d is simply: 

$$

	\frac{d}{dx} \otimes I
$$
        
And conveniently, we will have the operator for $\partial_y$ as: 
        
$$
	I \otimes \frac{d}{dx}
$$
        
**Note**: This is very general and it encapsulate both the boundary conditions and it's applicable to infinite dimension. As long as the discretized differential operator for One dimension contains the correct boundary conditions, then the kron product will retain the boundary conditions into higher dimension. 