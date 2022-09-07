Let's review some ODEs for the class.

---
### **Intro**

Some common ways we learned before when it comes to solving ODEs:  

1. Separation of Variables 
2. Integrating Factor
3. Laplace Transform 
4. Eigenvalues
5. Variation of Parameters
6. Characteristic Equations

For this course, when it comes to ODEs, we will be dealing with **linear ODEs**, and we need nothing more than just guessing the exponential function as the solution to the system. And then determine the parameters of that. 

Solving it is easy, for example: 

$$
\frac{d^2u}{dx^2} + u = 0
$$

With a substitution of $u = A\exp(\alpha x)$, we have: 

$$
\alpha^2 + 1 = 0 \implies \alpha = \pm i
$$

Notice that for both, choice we have a solution, and any linear combinations of the solution will be another solution, therefore: 

$$
\exp(ix) = A_1\exp(ix) + A_2\exp(-ix) 
$$

Expending it with Euler's Formula and combining it we will have: 

$$
C_1\cos(x) + C_2\sin(x)
$$

This is all we need for this course. 

---
### **PDE**

The function is a multivariable function. Usually, it's $u(x, t)$, where $x$ is t e space and $t$ is the time. Space can be a vector, representing the 3D reality. 

Let's remind ourselves about derivative and what it actually represents: 

$$
\partial_t u = 
\lim_{\Delta t \rightarrow 0}
\frac{u(x, t + \Delta t) - u(x, t)}{\Delta t}
$$

And taking the derivative wrt to $x$ is the same thing, that is just the partial derivative. 

---
### **Example: The Heat Equation**

$$
\partial_t u = c^2\partial_xu \quad 0 < x < L \quad 0 < t < \infty
$$

The boundary conditions and the initial condition will govern the solutions of the PDEs (Most of the time).

This equation is also the diffusion equation as well. 

When it's a function wrt $x$ and $t$, both scalar, this can be used to model the heat on a rod. 

Solving the PDE tells us: What is the evolution of the heat on the rod.

Assume that the rod is kept insulated except both ends where the heat is fixed to 0 degree celsius. 

Assume that at the beginning the rod has 100 celcius of heat evenly distributed in on the whole rod. And the both end of the rod are set to $0$ celsius. 

Initial condition: 

$$
u(x, 0) = 100
$$

Boundary Conditions:

$$
u(0, t) = 0 \quad u(L, t) = 0
$$

Note: Solution might not work when $t$ goes to infinity. 

It might seem like that there is some kind of discontinuity at the time moment $t\rightarrow 0$, but the truth is, there will be some kind of oscillation at the boundary right after when time begins to progress. 


