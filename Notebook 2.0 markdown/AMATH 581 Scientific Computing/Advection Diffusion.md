Building upon the direction method, we will have the finite difference method for the system of partial differential equations. 
prereq: [BVP](BVP.md), [Direct Method](Direct%20Method.md), [Div](../AMATH%20501%20Complex%20Analysis,%20Vector%20Calculus/Vector%20Calculus/Div.md)

---

### Advection-Diffusion

we will use 2d fluid motions as our example for solving this problem. Let's introduce the **stream function** $\psi(x, y, t)$. 

The stream function is a function is a field that is having a divergence of zero all over the place, representing the incompressible fluid. Therefore, by design the saclar function is going be like this: 

$$u = \frac{\partial\psi}{\partial y}$$ $$ v = - \frac{\partial \psi}{\partial x}$$

Then notice that, if the function is continuous and has symmetric second derivative, then it's going to produce a divergence free vector field. 

Let's also introduce the **vorticity**: $\omega(x, y, t)$

The system of equations can be presented as: 

$$\frac{\partial w}{\partial t} + [\psi, \omega] = v\nabla^2 \omega$$ 
(Momentum)(eqn 1)
$$\nabla^2 \psi = \omega $$
(Vorticity)(eqn 2)

Because we are assuming that thing is in 2d, the triple product here actually represent: 

$$[\psi, \omega] = \partial_x \psi \partial_u \omega - \partial_y\psi \partial_x \omega$$

And the $\nabla^2$ is the 2d Laplacian operator. 

#### Observations

(...)
  
---

#### Initial Conditions

$$\omega_0(x,y,t=0) = \omega(x, y)$$

This is the only initial conditions because we can figure out the vorticity functions using (eqn 2). 

#### Periodic Boundary Conditions

Both the vorticity and the stream functions will have loop back boundary conditions. 
$$
\omega(-L, y, t) = \omega(L, y, t)
$$

$$
\omega(x, -L, t) = \omega(x, L, t)
$$

And the same for the stream functions
$$
\psi(-L, y, t) = \psi(L, y, t)
$$

$$
\psi(x, -L, t) = \psi(x, L, t)
$$

#### Numerical Approaches (Algorithm)

get $\omega_0$, solve for $\psi$ using (eqn 2) (This is call e Elliptic Solve); time stepping on (eqn 1) to get the next distribution for $\omega_1$, then repeat the process. 

For doing the elliptic solve, we need to in-cooperate the Laplacian Operator with Periodic Boundary value conditions into the matrix. 

#### Numerical Elliptic Solve

To set up the grid points for the Elliptic Matrix, we partition the xy plane: $B = [-L, L]\times[-L, L]$ with the value $\delta$. So the region will be equally spaced grids, each with a width of $\delta$. 


**Important Grid Discretization**
We also note that, the entire space is partitioned in to a grid (A Matrix) of $N\times M$, where, the origin is at the bottom right corner of $B$. The first index goes in the $x$ direction while the second index goes in the $y$ direction.  For the purpose off generality, we use $M, N$ to denotes the height and width of the matrix, but they can be the same. 

Remember the kernel for second order, second derivative central difference is has the kernel filter: 

$$
\partial_{xx} = 
\begin{bmatrix}
	1 & -2 & 1
\end{bmatrix}\delta^{-2}
$$

However, the kernel filter for the Laplacian $\nabla^2$ will use both the $\partial_{xx}$ and $\partial_{yy}$, and that means the kernel we want is actually: 

$$
\nabla^2 = 
\begin{bmatrix}
	0 & 1 & 0 \\ 
	1 & -4 & 1 \\ 
	0 & 1 & 0
\end{bmatrix}\delta^{-2}
$$

Then, to our interests, we need a matrix $A$ to represents the kernel filter of the Laplacian, and if we get that, then we can obtain the stream functions from the vorticity by solving the following linear system: 

$$
A\psi = \delta^2\omega
$$

#### Grid Vectorization

We need to put the whole grid which represents $\psi$ and $\omega$ into a vector for our linear system. 

so this is what the $\vec{\psi}$ is looking like if we discretize the uniform grid points: 

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

So each sub vector inside are sharing the same value of $x$ coordinates. And the vector has a length of $N\times N$, because $\delta$ is the same discretization for both spatial directions. 

This is a **flattened matrix**, we will refer to it as the **Flattened Grid**. 

#### Structured Matrix For Kernel Filter

Now, let's focus our attention again at the Laplacian Kernel Filter: 

$$
\nabla^2 = 
\begin{bmatrix}
	0 & 1 & 0 \\ 
	1 & -4 & 1 \\ 
	0 & 1 & 0
\end{bmatrix}\delta^{-2}
$$
Let's remove everything and only focus on the center piece: 

$$
\nabla^2 = 
\begin{bmatrix}
	0 & 0 & 0 \\ 
	0 & -4 & 0 \\ 
	0 & 0 & 0
\end{bmatrix}\delta^{-2}
$$

Notice that, the centered elements $4$ will be applied to all the elements on the grid, therefore it will also be applied to all the elements in the Flatten Grid, and that will mean, one of the **operational matrix** (The matrix A) will be like: 

$$A_D-4(I_N\otimes I_N)$$

Now, let's focus on the derivative of the Y direction, or the vertical parts of the kernel filter, without the center part, and it will be like: 

$$
\nabla^2 = 
\begin{bmatrix}
	0 & 1 & 0 \\ 
	0 & 0 & 0 \\ 
	0 & 1 & 0
\end{bmatrix}\delta^{-2}
$$

Then, for every elements $\psi_{m, n}$, it will be included in to the sum for 2 of its neighbors: $\psi_{m, n\pm 1}$, which means that, each row of the Operational Matrix will contains two ones and all the other values will be zeros. 

However, this part is getting hard because of the periodic boundary conditions, but ignoring the boundary conditions and only focuses in the interior points, we have the structure Operational Matrix: 

 define: $P$ matrix to be a Band matrix with ones with position $\pm 1$, then the Operational Matrix for the vertical components of the Filter Kernel will be: 
 
$$
 A_Y = P\otimes I_N
$$

Now, if we include boundary conditions into the Matrix $P$, then the corresponding Kron Product will include the correct boundary conditions too. 

Now let's focus on the horizontal components of the Filter Kernel matrix: 

$$
\nabla^2 = 
\begin{bmatrix}
	0 & 0 & 0 \\ 
	1 & 0 & 1 \\ 
	0 & 0 & 0
\end{bmatrix}\delta^{-2}
$$

This means that, for any $\psi_{m, n}$, it will be sum into it's neighbors: $\psi_{m\pm 1, n}$. Notice that, now it's cross the different inner blocks of the flattened vector, and in this case, because $\psi_{m, n}$ is in block $m$ while it's neighbors are in different blocks: $m\pm 1$. 

Now let's suppose that the matrix $P$ is the same band, then the Operation matrix will be represented as: 

$$
	A_X = I_N \otimes P
$$

Then as a whole, we have the operational matrix represented as: 

$$
P\otimes I_N -4(I_N\otimes I_N) + A_x = I_N \otimes P
$$

So the moral of the story is, with block crossing, then it's $P\otimes I_N$, but when it's not there, then it's going to be: $I_N\otimes P$. So the $I_N$ matrix is acting like a **Block separator** for the flattened matrix vector $\vec{\psi}$. 

And the resulting matrix will be in the size of: $N^2\times N^2$. 

**Note**
The boundary conditions are included into the $P$ matrix, so here, I will define the matrix $P$ in this way: 

$$
P_{i, i + 1} = 1 \quad \forall\; 2\leq i \leq N
$$ 
$$P_{i - 1, i} = 1 \quad \forall \; 2\leq i \leq N$$
And in addition, we will have the boundary conditions likle: 
$$
P_{1, N} = P_{N, 1} = 1
$$

---

#### Discrete Laplacian

Generally speaking, the Discrete Laplacian can be computed easily via a Kron product: 

$$
D_{\nabla^2} = 
I \otimes D_{xx} + D_{yy} \otimes I
$$
where the $D_{xx}, D_{yy}$ matrix is the matrix that takes the second derivative finite difference with boundary conditions. 

---

### Discrete Image Kernel 

Here we keep assuming that the grid discretization pattern for the 2d data is: 

$$
\begin{bmatrix}
	\phi_{1, :}
	\\
	\phi_{2, :}
	\\
	\phi_{3, :}
	\\
	\phi_{4, :}
\end{bmatrix}
$$

And we are looking at a 4 by 4 grid. This is a good place to start so that math doesn't get too complicated. 

And then we will be looking at the Kernel Filter, and it's generalized: 

$$
\begin{bmatrix}
	a_{1, 1} & a_{1, 2} & a_{1, 3} \\
	a_{1, 2} & a_{2, 2} & a_{2, 3} \\
	a_{1, 3} & a_{3, 2} & a_{3, 3}
\end{bmatrix}
$$

And this will be our tensor, and then let's find the transformation matrix on x, with only the first row, second, and last row separately and then we add then all together to get the overall structural matrix for the transformation. 


Let's $K_0$ be the kernel matrix for the 1d kernel with periodic conditions

$$
\begin{bmatrix}
	a_{2, 1}, a_{2, 2}, a_{2, 3}
\end{bmatrix}
$$

And then the matrix is gonna look like: 

$$
K_0 = \begin{bmatrix}
	a_{2, 2} & a_{2, 3} &  0 & a_{2, 1} \\ 
	a_{2, 1} & a_{2, 2} & a_{2, 3} &  0\\
	0 & a_{2, 1} & a_{2,2} & a_{2,3} \\
	a_{2, 3} & 0 & a_{2,2} & a_{2,3}
\end{bmatrix}
$$

And this is the transformation on the center row for the 3d kernel, it's just our regular old pal, the banded matrix. 

Obviously, if applied to the whole 4 by 4 image, we will have the following: 

$K_+$ will be the 1d kernel for $[a_{1, 1}, a_{1, 2}, a_{3,3}]$
$K_-$ will be the 1d kernel for $[a_{3,1}, a_{3,2}, a_{3,3}]$

And then, the over all transformation for this kernel can be represented with all these components: 

$$
\begin{bmatrix}
	K_0 & K_- & \mathbb{0} & K_+ \\ 
	K_+ & K_0 & K_- & \mathbb{0} \\
	\mathbb{0} & K_+ & K_0 & K_- \\
	K_- & \mathbb{0} & K_+ & K_0
\end{bmatrix}
\begin{bmatrix}
	\phi_{1, :}
	\\
	\phi_{2, :}
	\\
	\phi_{3, :}
	\\
	\phi_{4, :}
\end{bmatrix}
$$

And that! It's the kernel transform but written using the tensor product. 
Now assuming 2 special matrix $P_1$ and $P_2$, representing the identity matrix but with the first column append to last, and the last column append to first. 

$$P_1\otimes K_+ + P_2\otimes K_- + P_3\otimes K_0$$