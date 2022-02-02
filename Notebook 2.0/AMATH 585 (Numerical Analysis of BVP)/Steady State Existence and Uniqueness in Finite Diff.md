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
\end{cases}
$$

Neuman conditions specifies the rate of heat flow at the boundary, zero means insulated, positive means heat is floating in, negative means floating out. 

---
### **Both Ends Insoluated**



