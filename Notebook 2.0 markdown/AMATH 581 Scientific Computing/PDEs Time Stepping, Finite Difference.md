Prereq: [Finite Difference](Finite%20Difference.md), [BVP](BVP.md)

--- 

### **Finite Difference Method**

Used for solving one of the elliptic problem concerning the stream function where: 

> $$\nabla^2 \psi = \omega$$

And then the operation matrix: 

$$
(P_{\partial^2}\otimes I + I \otimes P_{\partial^2})\Delta t^{-2}
$$
is going to have a null space, and that is the constant term, assuming periodic conditions for the PDEs. 	

---

### **Finite Difference Method with Time Stepping**

Here we are going to use the heat equation as the example for the demonstrating the finite difference method. The 1d heat equation is listed as: 

> $$
> \frac{\partial u}{\partial t} = k \frac{\partial^2 u}{\partial x^2} 
> $$

* Discretized the spatial dimension of the heat equation. Make the function $u$ into a vector, even discretized with $\Delta x$. 
	* Figure out the 1D Laplacian with periodic conditions (Or some other but it must limit the solutions of the Elliptic equations and make it unique)
	* Let's name that matrix operator $\widetilde{A}$
	* And then we obtained a system of linear ODEs, which is: 
	> $$\partial_{t}\vec{u} = k \widetilde{A} \vec{u}$$
 * Get the initial condition of the problem, remember with the Periodic Condition, **one of the end point on will be lost during** the discretization process. 
 * Plug in the right hand side of the system of ODEs, and then use the ODEs solver (stuff like `ode45`) in matlab to solve the equation on the time dimension. Boom. This is nice and easy to solve and it's fast. 

**NOTE**
This method tends to get really slow as we decrease the value of $\Delta x$. 

--- 

### **Finite Difference in Space and Time**

Here we are going to see how to make use the finite difference on both the space and time for the PDE evolution. 

Here we are going to use the wave equations for demonstration on this method. 

> $$\partial_t u = c\partial_x u$$

Let's also assume that the boundary conditions for the given equation is periodic and the PDE is in 1d. 

**Notations**
Let's consider the notation where the subscript is represent the spatial discretization and the superscript represents the time discretization of the PDEs. 

$$
u_{i}^{(j)} = u(x_0 + i\Delta x, t_0 + j\Delta t)
$$

This is representing the $i$ th point in the x axis grid point and the $j$ th time frame at the moment we are interested in. 

#### **Central Diff**
Apply second order finite difference on both time and space and we have: 

$$
\frac{u_{n}^{(m + 1)} - u_{n}^{(m - 1)}}
{2\Delta t}
=
\frac{u_{n + 1}^{(m)} - u_{n - 1}^{(m)}}{2\Delta x}
$$

And notice the the time and space dimension are centered at $u_{n}^{(m)}$, and then we used the finite difference to derive the scheme. Now let's make it into a full explicit scheme: 

$$
u_n^{(m+1)} = u_{n}^{(m - 1)} - \frac{\Delta t}{\Delta x}\left( 
u_{n + 1}^{(m)} - u_{n - 1}^{(m)}
\right)
$$

And this will be the time stepping the scheme using finite difference, and the parameter $\frac{\Delta t}{\Delta x}$ is super important for stability and we won't discuss it here. 

**Comment**: You can apply as many degree of finite difference as you want for the spatial discretization. 

**Courant-FriedrichsLevy (CFL)**  refers to the term that plays a big role to the  stability and condition of the given scheme and problem, in this case the CFL is $$\lambda = \frac{\Delta t}{\Delta x}$$ 

#### **Taylor Expansion **

Taylor Series on the time dimension: 
$$
u_n^{(m + 1)} = u_n^{(m)} + \Delta t\partial_t u_n^{(m)} + \frac{\Delta t^2}{2}\partial^2_t u_n^{(m)} + \mathcal{O}(\Delta t^3)
$$


Substitute then apply finite difference operator to this scheme to obtain the scheme, so it will look like this: 

$$
u_n^{(m + 1)} = u_n^{(m)} + \Delta t (c \partial_xu_n^{(m)}) + \frac{\Delta t^2}{2}\partial^2_t u_n^{(m)} + \mathcal{O}(\Delta t^3)
$$
Ok let's figure second derivative on time: 
$$
\partial_t\partial_t(u) = \partial_t(c\partial_xu) = c\partial_x\partial_t u = c^2 \partial_x^2 u
$$

And then the time derivatives are all decomposed into spatial derivatives which allows us to use finite difference schemes, and there will involves second derivative or even more, but the key here is that they have to be on the same order when choosing the finite difference. 

Then: 
$$
u_n^{(m + 1)} = u_n^{(m)} + \Delta t (c\partial_x u_n^{(m)}) + \frac{\Delta t^2}{2}c^2 \partial_x^2 u_n^{(m)} + \mathcal{O}(\Delta t^3)
$$

and then we are going to use finite difference on the formula giving us: 

$$
u_n^{(m + 1)} =
u_n^{(m)} + 
\frac{c\Delta t}{\Delta x}\left(u_{n + 1}^{(m)} - u_{n - 1}^{(m)}\right) + 
\frac{\Delta t^2c^2}{2\Delta x^2} \left(u_{n + 1}^{(m)} - 2u_{n}^{(m)} + u_{n - 1}^{(m)}
\right) + 
\mathcal{O}(\Delta t^3)
$$

This is the scheme, which has a $\mathcal{O}(\Delta t^2\Delta x^2)$ and it has the name of "**Lax Wenderoff**"
#### Implicit Stepping

$$
u^{(m)} = f(u^{(m + 1)})
$$

Notice that the next step will require to solve a system of equation to get the next step in the temporal evolution of the PDEs. 