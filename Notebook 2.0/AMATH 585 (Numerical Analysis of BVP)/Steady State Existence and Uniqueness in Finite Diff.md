Prereq: [[Finite Difference]], [[Direct Method]]

---
### **Intro**

We are interested in how the existence and uniqueness of some type of problems are manifested in solving equations using the Finite Difference Method. Here, we will be using an example involving the steady state 1D Non-Homogenous Heat equation with Neuamn Boundary Conditions. 

The physical problem of the steady steady heat equation with neuman boundary condition is not well posed. The initial distribution and the total energy of the heat source function determines the long term distribution. However, the initial distribution is not involved in the finite difference method. 

For such a problem that is not well-posed, we can still try solving it and see what is expected for the RHS source function that makes the problem solvable. 

Steady State of BVP problem: 

$$
\begin{cases}
    u''(x) = f(x)
    \\
    u'(0) = \sigma_0, u'(1) = \sigma_1
\end{cases}\tag{1}
$$

Neuman conditions specifies the rate of heat flow at the boundary, zero means insulated, positive means heat is floating in, negative means floating out. 

---
### **Both Ends Insoluated**

The finite difference scheme proposed for (1) can be expressed as: 

$$
\begin{aligned}
    \frac{1}{h^2}
    \begin{bmatrix}
        -h & h & & & & \\
        1 & -2 & 1 & & & \\[0.7em]
        & \ddots & \ddots & \ddots  & & \\[0.7em]
        & & & 1& -2& 1 \\
        & & & & h& - h
    \end{bmatrix}\begin{bmatrix}
        u_0 \\ u_1 \\ \vdots \\ u_{m} \\ u_{m + 1}
    \end{bmatrix} = 
	\begin{bmatrix}
        \sigma_0 + f(x_0)\\ f(x_1) \\ \vdots \\ f(x_m) \\ -\sigma_1 + 
        \frac{h}{2}f(x_{m + 1})
    \end{bmatrix}
\end{aligned} 
$$

Where the boundary conditions are using first derivative second order central 

**Handling of Neuman Boundary Conditions** 

Consider the second order central first order finite diference. 





