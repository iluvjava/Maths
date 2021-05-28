Make sure to read [[Greens Function]] in advance to reading this file 

---
### **Intro**

Last time we had the problem of the Gravitational Density and potential PDE as an example where Green's Function is used. 

Here we will be modeling another PDEs, that is non-homogeneous over an unbounded domain. 

Here we consider the **Non-Homogeneous Green's Function:**

$$
\begin{cases}
    \partial_t[u] - D\nabla^2u &= Q(x, t)
    \\
    u = 0 &\text{ at } t = 0
    \\
    u\rightarrow 0 \text{ as } \Vert \Vert \rightarrow \infty
\end{cases}
$$
 
Here, we consider $x\in \mathbb{R}^3$. And under the context of the heat equation, $u(x,t)$, $u$ is a scalar function of $x$ the vector and $t$ the time. 

Now, let's consider the Green's Function for this PDE, and it must satisfies the following PDEs:[^1] 

$$
\begin{cases}
    \partial_t[G] - D\nabla^2[G] = \delta(x - \xi)\delta(t - \tau) & x\in \mathbb{R}^3 \quad t > 0
    \\
    G = 0 & \text{ at }t = 0
    \\
    G \rightarrow 0 &\text{ as } \Vert x\Vert \rightarrow \infty
\end{cases}
$$

Notice that, there are 2 $\delta$ function, which is indicating that there is a point heat source at a particular point $\xi$ and a particular time moment $t = \tau$. So the Greens function $G$ actually takes 3 inputs $x, t, \xi, \tau$, where $x, \xi$ are 3D vectors in space. 

To reconstruct the original Heat equation using the Greens function, we would need to consider: 

$$
u(x, t) = \int_{0}^{\infty} 
    \iiint_{\Omega}
        G(x, t, \xi, \tau)Q(\xi, \tau)d\xi d\eta d\mu 
d\tau
$$

We can check this by condiering: 

$$
\begin{aligned}
    \partial_t[u] - D\nabla^2\cdot u &= \int_{0}^{\infty} 
        \left(
            \partial_t[G] - D\nabla^2 G
        \right)d\xi d\eta d\mu
    d\tau
    \\
    &= \int_{0}^{\infty} 
        \delta(x - \xi)\delta(t - \tau)Q(\xi, \tau)
        d\xi d\eta d\mu
    d\tau
    \\
    \underset{\text{properties of delta}}{\implies}
    &= Q(x, t)
\end{aligned}
$$

Now, we know that, the superposition argument works, and if we use it to represent the heat function $u(x, t)$, using the principal of super position (the Triple Integral thing), then plugging it will satisfy the original equation. 

Now, let's solve for $G(x, t, \xi, \tau)$ 


---
### **Solving the Green's System**


$$
\begin{cases}
    \partial_t[G] - D\nabla^2[G] = \delta(x - \xi)\delta(t - \tau) & x\in \mathbb{R}^3 \quad t > 0
    \\
    G = 0 & \text{ at }t = 0
    \\
    G \rightarrow 0 &\text{ as } \Vert x\Vert \rightarrow \infty
\end{cases}
$$

This is the equation that we are considering. 

Let's find a location where the $\delta$ is zero. And when that happens, we have a Homogeneous PDE, but at the point where it's not, we have a non-homogeneous PDE. 

When $t\ne \tau$, $\delta(t - \tau) = 0$, then we have a homogenous equation like: 

$$
\partial_t[G] - D\nabla^2G = 0
$$







[^1]: The Dirac Delta function is a vector function in 3D. 