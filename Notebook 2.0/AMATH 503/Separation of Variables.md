Let's learn the method of separation of variable and apply to the heat equation. 
The heat equation is introduced here: [[ODEs, PDEs Intro]], and we are using the same set up in this file as well. 

See more about it here: [[Heat Equations]], which is introduced in amath 501 before. 

---
### **Intro**

This is chapter 3 in the lecture notes, you **must read** it. 

Separation of Variable, it works in the case when the boundary conditions is zero. 

If a solution is not separable, but we did it anyway, we might get infinitely many solutions such that the super position of such solution is going to give us the true solution, which is non-separable. 

---
### **Separation of Variables**

Let's say that the solution is the product of 2 functions, then it will be like: 

$$
u(x, t) = X(x)T(t)
$$

It's like, there is a function that evolves with along the time dimension, and then scaled by another function, as the time variable changes. 

The PDE is: 

$$
u_t = c^2u_{xx} \quad 0 < x < L \quad t> 0
$$

The initial condition is: 

$$
u(x, 0) = F(x) 
$$

Where we keep the generality by assuming the initial condition distribution function $F(x)$. 

And the boundary condition is:

$$
u(0, t) = u(L, t) = 0
$$

For the separation variable to work, the boundary will have to be zero. 
**What if we are using fahrenheit**? The method of separation of variable won't work for this boundary conditions. If, the boundary condition is fixed with the same value, then we can make a substitution, say $v = u - 32$, so the boundary condition is fixed at zero. 

Let's summarize the procedure: 

1. Assume that $u$ is the product of 2 functions like: $X(x)T(x)$, for this PDE, it works well.
2. Substitute the separation form into the equation. 
3. After separation, set everything to an undetermined constant. Try different cases for the constant. 


---
### **Separation and Substitution**

$$
u_t = T'(t)X(x) \quad u_{xx} = X''(x)T(t)
$$

Then the PDE is going to be: 

$$
T'(t)X(x) = c^2X''(x)T(t)
$$

$$
\frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)}
$$

The LHS, and the RHS are solely expressed wrt to $T(t), X(t)$, and means, it has been separated. 

Notice that, this is function equality, a function of time equals to a function of space for all possible value of $t, x$, and this means that they both equals to a constant, giving us: 

$$
\frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)} = K
$$

When it's separated, this statement can be applied. Notice that $K$ can be positive, negative, or zero. Hint: try $K = -\lambda$ where $\lambda$ is real. We assume that $K < 0$, this is the one that works and gives us non-trivial solution to the system. 

Solving it we should be able to get: 

$$
\begin{cases}
    X''(x) + \lambda^2 X(x) = 0
    \\
    T'(t) + c^2\lambda^2T(t) = 0
\end{cases}
$$

And we have 2 ODEs. $c^2$ is the thermal conductivity. However, we need to determine what $\lambda^2$ is to get the solutions for the system. 