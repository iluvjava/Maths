* [Moreau Envelope and Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Proximal%20Mapping.md)
* [Gradient System](../../AMATH%20502%20Intro%20to%20Dynamical%20Systems%20and%20Chaos/Gradient%20System.md)

---
### **Intro**

Here, we consider the projected gradient algorithm for composition of 2 functions $f(x), h(x)$ where $h(x)$ is convex, lsc but non-smooth, but $f(x)$ is smooth convex and it has gradient defined everywhere in it's domain. Then the projected gradient performs the following updates that converges to the minimum

$$
x^{(t + 1)} = \text{prox}_{h, \gamma}(x^{(t)} - \gamma\nabla f(x)), 
$$

and we want to show that it's equivalent to an Euler methods that is based on operator splitting. To do that let's consider the gradient dynamics: 

$$
\begin{aligned}
    X'(t) = -\nabla f(X(t)) - v, \quad  v\in \partial h(X(t))
\end{aligned}
$$

To derive the scheme we make the approximation for the finite difference scheme and get that: 

$$
\begin{aligned}
    \frac{X(t + \Delta t) - X(t)}{\Delta t} &= 
    -\nabla f(X(t)) - \partial h(X(t + \Delta t))
    \\
    X(t+\Delta t) - X(t) &= -\Delta t\nabla f(X(t)) - \Delta t\partial h(X(t + \Delta t))
    \\
    X(t+\Delta t) + \Delta t\partial h(X(t + \Delta t)) 
    & = -\Delta t \nabla f(X(t))  + X(t)
    \\
    [I + \Delta t \partial h]X(t + \Delta t) &= 
    -\Delta t \nabla f(X(t)) + X(t)
    \\
    X(t + \Delta t) &= 
    [I + \Delta t \partial h]^{-1}(X(t) - \Delta t \nabla f(X(t))), 
\end{aligned}
$$

Which is equivalent to the proximal gradient algorithm with $\gamma = \Delta t$. For more context, see remarks. 

**Remarks**

This methods is an elementary methods where the dynamics can be separated into the sum of a stiff term and a non-stiff term. In the above case, the stiff term became the subgradient set, by abusing the notation. For more, there is a brief coverage from MATH 6324 in CMU, 2014 [here](http://runge.math.smu.edu/Courses/Math6321_Fall14/_downloads/imex.pdf) about the splitting methods based on Euler time stepping. 

I am suspecting using different formula for the finite difference term might produce the Douglas–Rachford Envelope scheme? No I don't think so, it's something totally different. 

Convergence rate might be related to the Lyaponouv function for this given dynamical system. 

---
### **Projected Proximal Gradient is fixed point iterations**

Here we wish to show that proximal gradient is a fixed point iterations on a maximal monotone operator. 

