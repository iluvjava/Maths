Make sure to read [[Greens Function]] in advance to reading this file 

---
### **Intro**

Last time we had the problem of the Gravitational Density and potential PDE as an example where Green's Function is used. Here we will be modeling another PDEs, that is non-homogeneous over an unbounded domain. Here we consider the **Non-Homogeneous Green's Function:**

$$
\begin{cases}
    \partial_t[u] - D\nabla^2u &= Q(x, t)
    \\
    u = 0 &\text{ at } t = 0
    \\
    u\rightarrow 0 \text{ as } \Vert x \Vert \rightarrow \infty
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

Notice that, there are 2 $\delta$ function, which is indicating that there is a point heat source at a particular point $\xi$ and a particular time moment $t = \tau$, this is true because the non-homogenous condition of the PDE, and it requires 2 delta function to model it sufficiently.  The Greens function $G$ actually takes 3 inputs $x, t, \xi, \tau$, where $x, \xi$ are 3D vectors in space. 

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
\tag{1}
$$

This is the equation that we are considering. 

Let's find a location where the $\delta$ is zero. And when that happens, we have a Homogeneous PDE, but at the point where it's not, we have a non-homogeneous PDE. 

When $t\ne \tau$, $\delta(t - \tau) = 0$, then we have a homogenous equation like: 

$$
\partial_t[G] - D\nabla^2G = 0
\tag{2}
$$

**Let's assume that $t < \tau$**. 

Consider $\partial_tG - D\nabla^2G = 0$, in this case, the solution is just $G = 0$, because the boundary assert that there is no heat at the beginning. And becacuse there is no heat source (Non-homogeneous part), them $G$ stays at $0$. Let's assume that $t > \tau$, take note that in this case, we would **need a new initial condition** for $t = \tau$. Now the differential equation we would be looking at will be like: 

$$
\partial_t[G] - D\nabla^2 G = 0 \quad G = ? \text{ at } t= \tau
$$

**Under the case where $G = 0$ at $t = \tau$, then $G = 0$ throughout. This cannot happend at all, beacuse there is a delta function on the right hand side. There has to be a jump for the function $G$ at $t = \tau$.** In which it then get translated into the initial conditions for the PDE the model what happened after, when $t > \tau$. 

What do do? 

We integral over the tiny region where the delta function is involved. Let's integrate the non-Homogeneous differential equation satisfied by $G$, but within a small neighbourhood around $t = \tau$. (Similar to the Epsilon Ball for the Gravitation Density problem). let's denote $(\tau_-, \tau_+)$, which is a delta neighbourhood of $\tau$. 

$$
\begin{aligned}
    \int_{\tau_-}^{\tau_+} 
        \partial_t[G]
    dt - \int_{\tau_-}^{\tau_+} 
        \nabla^2\cdot G
    dt &= \int_{\tau_-}^{\tau_+} 
        \delta(x - \xi)\delta(t - \tau)
    dt
    \\
    \left.
        G
    \right|_{\tau_-}^{\tau_+} - 
    D\nabla^2\cdot \int_{\tau_-}^{\tau_+}
        G
    dt &= \delta(x - \xi)
    \\
    G(\tau_+) -
    D\nabla^2\cdot \int_{\tau_-}^{\tau_+} 
        G
    dt &= \delta(x - \xi)
\end{aligned}
\tag{3}
$$

We can move the Laplacian out of the integral because it's a spatial operator and has nothing to do with time. 

There is a nasty integral for expression (3).

Can $G$ be a delta function in the time dimension? 

$\partial_t[G]$ will not be a delta function, and it will have more singularities [^2], but on the RHS there is the delta function. This can't be possible. Therefore $G$ is not a delta function on the time dimension. 

Then $G$ is not a delta function in time. then the integral $\int_{\tau_-}^{\tau_+}Gdt$ is the area over the delta neighbourhood of the function $G$. 

**Ok, take this for granted: $G$'s integral over the Delta Region is going to be zero.**

Then $G(\tau_+) = \delta(x - \xi)$, and taking the limit will yield: $G(\tau) = \delta(x - \xi)$. And the the boundary condition still applies here. Now, with this information, we are ready to solve Greens Function in the spatial domain. 

$$
\begin{cases}
    \partial_t[G] - D\nabla^2 G = 0
    \\
    G = \delta(x - \xi) & t = \tau
    \\
    G \rightarrow 0  & \text{as} \Vert x\Vert\rightarrow \infty
\end{cases}
$$

And this is called the: Heat Kernel. This is the same as the Drunken Sailor Problem. And in the case of the Drunken sailor problem, we have $x - \xi$, and t: $t - \tau$. 

What is happening is that, the problem is just the drunken sailor problem, basically everything before $\tau$, the system is just a regular zero, A and then for everything after $\tau$ the system becomes a drunk sailor problem after the introduction of some instantaneous heat via the non-homogeneous right hand side of the equation. 

see: [[The Drunken Sailor Problem (PDE Problem)]] for more. And in this case, have the solution: 

$$
G(t, x, \tau, \xi) = \frac{1}{(4\pi D(t - \tau))^{3/2}} \exp \left(
    -\frac{\Vert x - \xi\Vert^2}{4D(t - \tau)}
\right)
$$


---
### **Extra Comments**

I think there needs to be extra argument for results derived for expression (3). 

This is the original equation we are trying to solve

$$
\partial_t[G] - D\nabla^2[G] = \delta(x - \xi)\delta(t - \tau) \quad x\in \mathbb{R}^3
$$

Here, we make the assumption that, $G$ is bahaving like a Generalized Function. And here is a list of generalized functions in mathematics: 

1. Ramp Function 
2. Heaviside Function 
3. Delta function 
4. Derivative on delta
5. Second derivative on delta ... 

The Idea here is that, we have a function that has discontinuity for some derivative, and the derivative vanishes. 

This is a good assumption, becase PDE involves derivative, and if the RHS of the PDE has delta function, which is a certain type of generalized function, then it's safe to assume that the Green's Function $G$ has similar behavior. 

Consider: 

1. Function $G$ is a ramp like function wrt to $t$, then this will imply that $\partial_t[G]$ has a discontinuity like the Heaviside function. But the RHS is a delta function. Hence it's not a delta function. 
2. Function $G$ is a Heaviside function wrt to $t$, then it will imply that 



[^1]: The Dirac Delta function is a vector function in 3D. 
[^2]: Prof said this and I have no idea what it means. 