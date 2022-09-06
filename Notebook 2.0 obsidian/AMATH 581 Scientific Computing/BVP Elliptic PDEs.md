So we are still looking at the PDEs problem but this time a time variable is going to be introduced. 

Prereq: [[Advection Diffusion]] This is a great example of a system of PDEs, and it's also elliptic.
Prereq: [[IVP]] This is used for the temporal evolution of the system of discretized system. 

---
### **Intro**

Elliptic PDEs are like elliptic curves in Precalc, and let's take a look at 2d case, let's assume that the function we are looking at takes the form: $u(x_1, x_2, t)$

$$
\sum_{i = 1}^2\sum_{j = 1}^2 a_{i, j}u_{i,j} + \sum_{i = 1}^2 a_iu_{i} = f
$$

Note that $u_{i, j}$ is $\partial_{j, i}(u)$. 

Of course, we are going to denote the boundary as $\Omega$. 

Solutions to the Elliptic PDEs are non-unique, and this means that we need to use the **boundary conditions** to reduce the solution to a unique solution for computations. 

**Note**: The Periodic boundary conditions with an initial conditions will eliminate the $x$, linear solution. However the constant solution will survive. 

In addition the constant won't matter if the solution we want is concerned with $u_{xi}$ where the constants are gonna be gone after the derivative. 

It's not time dependent. 

--- 
### **Boundary Conditions**
For the following discussion, we will be only focusing on boundary conditions in the region of a rectangle on the grid. 
> $$\Omega = [a, b]\times [b,c]$$

Let's also assume that the functions is in 2d and it's time depend, expressed as $\psi(x, y, t)$ to be precise. 

**Dirichlet Boundary**: 

$$
\psi(a, y) = d \quad
\psi(b, y) = g
\quad \forall \; y\in [b, c]
$$

Where $d$ and $g$ are constants, and the same could be applied to the line where $y = b, c$

**Neuman Boundary**: 
$$
\partial_y \psi(a, y) = d \quad \partial_y\psi(b, y) = g \quad \forall y\in [b, c]
$$

So it involves some kind of derivatives. 

**Robin Boundary**: 

Any Linear combination of the Dirichlet Boundary conditions and the Robin Boundary conditions. 

**Periodic Boundary**

$$
\psi(a, y) = \psi(b, y) \quad \forall \; y\in [c,d]
$$
And the same thing for the other 2 boundary and it's like: 

$$
\psi(x, c) = \psi(x, d) \quad \forall \; x\in [a,b]
$$

And it can be repeated with derivative as the boundary conditions too. 

**Invalid Boundary Conditions**

$$
\psi(x, a) = g(t)
$$

This is not allowed because the boundary is time dependent, and in that case this course materials is not going to help with solving this type of boundary conditions. 

$$
\psi_{xyy}
$$

Cannot appear in the Boundary Conditions, because it has more derivatives than the initial problems and this is not allowed, similarly, second derivative also cannot be involved for the boundary conditions (stuff like $\partial^2_x$). This is very similar to IVPs problems. 
 