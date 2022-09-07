[Eigenfunction Expansion](Eigenfunction%20Expansion.md). 
In addition of using the Eigenfunction Expansion method, we have another alternative for solving the None-Homogeneous PDEs. 

But this time, it's used for Solving None-Homogeneous equation in the infinite domain. 

This method is described in chapter 8 of the lecture, and it's a pretty recent method to be honest. 

Let's take a look. 

---
### **Intro**

It's used in Aeo-dynamics and Quantum Field Theory. 

It's used for solving Non-Homogeneous PDEs under the Infinite Domain. 

**Warning**: 

We will be dealing with the Dirac Delta Function 

Let $\mathbb{L}$ be Sturm Loiuville Operator, which means that: 

$$
\mathbb{L}[u](x) = \partial_x[p(x)\partial_x[u]] + q(x)
$$

Consider the folling Non-homogeneous PDE: 

$$
L[u](x) = f(x) \quad x\in[a, b]
$$

Let's consider another probem: 

$$
\mathbb{L}[G](x) = \delta(x - \xi)
$$


And let's assume that the solution for $G$ is better than the original problem, then the solution to the original problem can be recovered by:[^1] 

$$
\begin{aligned}
    u(x) &= \int_{a}^{b} 
        f(\xi)G(x, \xi) 
    d\xi  
    \\
    \implies \mathbb{L}(u)[x] &= 
    \mathbb{L}
    \left[
        \int_{a}^{b}
            f(\xi)G(x, \xi)
        d\xi
    \right](x)
    \\
    &= 
    \int_{a}^{b} 
        f(\xi)\mathbb{L}[G(x, \xi)](x)
    d\xi
    \\
    &= 
    \int_{a}^{b} 
        f(\xi)\delta(x - \xi)
    d\xi
    \\
    &= f(x)
\end{aligned}
$$

**Interpretation**? 

We assume that the solution for the whole non-homoegenous is a super position of many infinitely many tiny solution, as in the case of the equation for $G$. 

And solving the system wrt to $G$ and delta function, and then make a super position of all of them using the RHS of the Non-homogeneous solution will provide us with the full solution to the original problem. 


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

> Instead of focusing on a gravitational density function $u(x)$, The green's Function problem is simplifying it by just having one point mass in space, represented by the delta function. In spherical coordinate, this problem won't have 3 variables involved. 

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

Boom! Using the Green's function to reconstruct the Gravitational density function seems to work because it still solves the PDEs if we substitute it into the equation. 

This is not rigorous enough for the mathematician, but it works for the physicists. 

Since $G\rightarrow 0$ as $\Vert x\Vert \rightarrow 0$ 


---
### **Green's Function**

Notation Confusion Warning: 

$\xi$ is used to denote a scalar, but it's also used to denote the position of the point mass which $G$ is trying to model. 

$$
\begin{aligned}
    & \nabla^2\cdot G = \delta(x-\xi)    
    \\
    & G\rightarrow 0 \text{ as }\Vert x\Vert\rightarrow \infty
\end{aligned}
$$

Let's consider $r = x-\xi$, so that variable $r$ is a function between the point $x$, and the point $\xi$. The former is the point in the gravitational field and the later is the point mass. 

From now on, $G(r), G(x, \xi)$ will be used and they are equivalanet. 

The, the gravitational density function is given as: 

$$
u(x) = \iiint_\Omega G(x, \xi)F(\xi)d\xi d\eta d\mu
$$

**Now, we are going to solve for G**

Rewriting the PDE in term of $r$: 

$$
\begin{aligned}
    & \nabla^2\cdot G = \delta(r)    
    \\
    & G\rightarrow 0 \text{ as }\Vert r\Vert\rightarrow \infty
\end{aligned}
$$

Using the Spherical Coordinate, the Laplacian will be like: 

$$
\nabla^2\cdot G = \frac{1}{r^2}\partial_r[r^2\partial_r[G]]
$$

**Why is the Laplacian only relevant to $r$?**

> The function $G(x)$, is representing the gravitational potential of a point mass, and therefore, it's radially symmetric and changing $\phi, \theta$ won't change the value of the function. Hence we are just going to have the radius part. 

And then we have: 

$$
\frac{1}{r^2}\partial_r[r^2\partial_r[G]] = \delta(r) \tag{1}
$$

Most of the time, the $\delta$ function is going to be zero, and for most of the values of $r$, or $r\ne 0$, the PDE is homogeneous. And only when $r = 0$, we get an non-homogeneous PDE. 


$$
\begin{aligned}
    \partial_r[r^2\partial_r[G]] &= 0     
    \\
    r^2\partial_r[G] &= A
    \\
    \partial_r[G] &= \frac{A}{r^2}
    \\
    G &= \frac{-A}{r} + B
\end{aligned}
\tag{2}
$$

The first constant come from the fact that there is a zero on the RHS of the homoegenous equation. 

And th second constant is just taking the anti-derivative on the LHS of the equation. 

**We can determine $B$ here and right now:** 

if $\Vert x\Vert\rightarrow \infty \implies r\rightarrow \infty$ so them $g\rightarrow 0$ as $\Vert x\Vert\rightarrow \infty$, so then $G\rightarrow 0$ as $r\rightarrow 0$. 

Therefore, to make sure that the boundary conditions are statisfied, we have to force this: 

$$
B = 0
$$


Now, we want to determine $A$ such that: 

$$
\nabla^2\cdot G = \nabla^2\cdot \left(
    \frac{-A}{r}
\right) = \delta(r)
$$

Integrate the DE that $G$ solves over a small solid ball of radius $\epsilon$. And it's the same $\epsilon$ from real analysis. 

The epsilon ball is: 

$$
B_\epsilon = \{\Vert r\Vert\le \epsilon\}
$$

Consider this: 

$$
\begin{aligned}
    \iiint_{B_\epsilon}\nabla^2\cdot G dV &= \underbrace{\iiint_{B_\epsilon}\delta(r)dV}_{=1}
    \\
    1 &= \iiint_{B_\epsilon}\nabla^2\cdot G dV=\iiint_{B_\epsilon}\nabla\cdot \nabla G dV
    \\
    \underset{\text{Div Theorem}}{\implies} &= \iint_{\text{Boundary}(B_\epsilon)}
    \nabla G\cdot \hat{n} dS
\end{aligned}
\tag{3}
$$

$\hat{n}$: The norm vector on the Epsilon Ball, which is just $\frac{r}{\Vert r\Vert}$. 

$\text{Boundary}(B_\epsilon)$ is just going to be the surface of the Epsilon Ball. 

In spherical Coordinate gradient is like: 

$$
\begin{aligned}
    \nabla G &= \partial_r[G]\cdot \hat{n}    
    \\
    \nabla G\cdot \hat{n} &= \partial_r[G] = \frac{A}{r^2}
\end{aligned}
$$

Going back to expression (3), we have: 

$$
\begin{aligned}
    1 &= \iint_{\text{Boundary}(B_\epsilon)}\frac{A}{r^2}dS
    =
    \frac{A}{\epsilon^2}4\pi \epsilon^2
    \\
    \implies A &= \frac{1}{4\pi}
\end{aligned}
\tag{4}
$$

So then going back to (2), we would have determine the function $G$ to be: 

$$
G = -\frac{1}{4\pi r} = \frac{-1}{4\pi \Vert x - \xi\Vert} = 
\frac{-1}{4\pi}\left(
        (x - \xi)^2 + (y - \eta)^2 + (z - \mu)^2 
    \right)^{-1/2}
$$

Now, by the principal of super position of point mass. 

$$
\begin{aligned}
    u(x) &= \iiint_\Omega G(x, \xi)F(s)d\xi d\eta d\mu
    \\
    &= -\frac{1}{4\pi}\iiint_\Omega F(\xi)\frac{1}{\left\Vert
        x - \xi
    \right\Vert} d\xi \eta d\mu
\end{aligned}
$$



[^1]: The green's function is symmetrical, $G(x, \xi) = G(\xi, x)$, and this is called Maxwell Reciprocity. It's complicated and it's skipped. 

