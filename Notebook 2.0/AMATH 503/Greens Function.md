[[Eigenfunction Expansion]]. 
In addition of using the Eigenfunction Expansion method, we have another alternative for solving the None-Homogeneous PDEs. 

But this time, it's used for Solving None-Homogeneous equation in the infinite domain. 

Let's take a look. 

---
### **Intro**

It's used in Aeo-dynamics and Quantum Field Theory. 

It's used for solving Non-Homogeneous PDEs under the Infinite Domain. 

**Warning**: 

We will be dealing with the Dirac Delta Function 

---
### **Example: Gravitational Potential Due to a Distribution of Mass in the Galaxy**

$$
\nabla^2\cdot u = f(x) \quad u\rightarrow 0 \text{ as } \Vert x\Vert\rightarrow 0
$$

Which is just the Poisson Equation (Something We dealt with as a sub-routine for the Holmholtz Equation)

We consider $x$ to be a vector in 3D. 

$f(x)$: This is the mass distribution of the Galaxy. 

$u(x, t)$: This is the Gravitational Potential 

$F(x)$: The force. This is just $\nabla u = F$, the gradient of the potential is the force. 

Instead of solving the Poisson equation directly, we are going to solve the Greens Function Problem. 

**This is the Greens Function Problem:**

$$
\begin{aligned}
\nabla^2 \cdot G &= \delta_3(\xi - x)
\\
\delta_3(\xi - x) &= \delta(\xi - x)\delta(\eta - y)\delta(\mu - z)
\end{aligned}
$$

$\delta_3$ is just the 3D delta function. 

So then: $\xi = [\xi, \eta, \mu]^T$ and $x = [x, y, z]^T$. These are the vectors. 

The Boundary condition is: 

$$
G\rightarrow 0 \text{ as } \Vert x\Vert \rightarrow \infty
$$

$G(x, \xi)$, and this is representing the gravitational potential for a point mass that is located at $\xi$, with the observer at $x$. 

Notice that, $G$ is radially symmetric, therefore, we can consider $G(r)$ where $r = \Vert x - \xi \Vert$

Once $G$ is found, then $u(x, t)$ can be reconstructed by superposition as: 

$$
u(x) = \iiint_V G(x, \xi)f(\xi) d\xi d\eta d\mu
$$

This is adding the point mass, weighted by the gravitational potential distribution function.

Let's check: 

$$
\begin{aligned}
\nabla^2\cdot u(x) &= \nabla^2 \iiint_V G(x, \xi)f(\xi)d\xi d\eta d\mu
\\
\nabla^2\cdot u(x) &= \iiint_V \nabla^2 \cdot G(x, \xi)f(\xi)d\xi d\eta d\mu
\\
\nabla^2\cdot u(x) &= \iiint_V \delta_3(\xi - x)f(\xi)d\xi d\eta d\mu    
\end{aligned}
$$

By the property of the Dirac Delta function: 

$$
\implies = f(x)
$$

This is not rigorous enough for the mathematician, but it works for the physicists. 

Since $G\rightarrow 0$ as $\Vert x\Vert \rightarrow 0$ 

(...)



