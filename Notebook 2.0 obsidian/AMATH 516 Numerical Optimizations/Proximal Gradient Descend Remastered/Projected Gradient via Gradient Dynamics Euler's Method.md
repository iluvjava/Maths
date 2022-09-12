* [[Moreau Envelope and Proximal Mapping]]
* [[Gradient System]]

---
### **Intro**

Here, we consider the projected gradient algorithm for composition of 2 functions $f(x), h(x)$ where $h(x)$ is convex, lsc but non-smooth, but $f(x)$ is smooth convex and it has gradient defined everywhere in it's domain. Then the projected gradient performs the following updates that converges to the minimum

$$
x^{(t + 1)} = \text{prox}_{h, \gamma}(x^{(t)} - \gamma\nabla f(x)), 
$$

and we want to show that it's equivalent to an euler methods that is based on operator splitting. To do that let's consider the gradient dynamics: 

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

I am suspecting using different formula for the finite difference term might produce the Douglas–Rachford Envelope scheme?

Convergence rate might be related to the Lyaponouv function for this given dynamical system. 

---
### **Backwards Euler and Proximal Point**

We consider $f(x)$ to be a convex, lsc function that is proper, then the proximal point method considers the following update scheme: 

$$
\begin{aligned}
    x^{(t + 1)} \in \text{prox}_{f, \gamma}(x^{(t)}), 
\end{aligned}
$$

which is equivalent to the backwards Euler methods on the gradient dynamics: $X'(t) = -\partial f(X(t))$. To derive we starts by assuming the following approximation via first order forward finite differences: 

$$
\begin{aligned}
    \frac{X(t + \Delta t) - X(t)}{\Delta t} &= -\partial f(X(t  + \Delta t))
    \\
     - X(t) &= 
    - X(t + \Delta t)-\Delta t\partial f(X(t + \Delta t))
    \\
    X(t) &= 
    [I + \Delta t\partial f](X(t + \Delta t))
    \\
    X(t + \Delta t) &= [I + \Delta t\partial f]^{-1}(x(t))
\end{aligned}
$$

**Remarks**

We abuse the notation and use subgradient dispite the fact that it's a set value mapping not a single value mapping as in the traditional derivation for the backwards Euler method. 
