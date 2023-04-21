- [[Complex Functions]], 
- [Complex Differential](Complex%20Differential.md). 

---
### **Intro**

It's not true that among all the complex functions, that we can take the derivative directly on it, because, they are multi functions, they have multiple outputs. The existence of derivative wrt to one complex variable is strong. Surprisingly,  the normal rule of differentials applies to complex functions, and it applies for an open region along that point, then Analyticity is true for that functions. 

#### **Def-1 | Analytical Complex Functions**
> An analytical complex function is a function that is infinitely differentiable, and it has a Taylor series that converges pointwise at an epsilon region around any point in the domain of the function. 

---

###  **Cauchy Riemann Conditions**

The Cauchy Riemann Conditions is a quick way of checking whether a complex function satisfies Analyticity at a point on the complex plane, with the following assumptions: 

#### **Assumptions-1**
> - The partial derivative of the function $u(x,y), v(x, y)$ **have continuous derivatives**. Which are t he real and imaginary parts of the complex function. 
> - The function $f$ is in the form of $f(x, y) = u(x, y) + iv(x, y)$. 

This condition is a necessary conditions, meaning that if it's differentiable then the condition is satisfied and the converse of it is not true.

**Thm-1 | The Cauchy Riemann Conditions (CR)**
> Function is complex differentiable if: $\partial_x u = \partial_y v, \partial_x v = - \partial_y u$. 

**Demonstrations**:  

We model complex differentiation using partial derivative along the imaginary and real axis of the complex plane. We want the limit from both imaginary and the real direction for a certain point to be the same.  

$$
\begin{aligned}
    \lim_{\Delta x \rightarrow 0}
    \frac{f(x + \Delta x, y) - f(x)}
    {\Delta x} = f'(z) &= \partial_x u + i\partial_x v
    \\
    \lim_{\Delta y \rightarrow 0}\frac
    {f(x, y + \Delta y) - f(x, y)}
    {i \Delta y} = f'(z) &= \partial_y v - i \partial_y u
\end{aligned}
$$

Then, a function is differential at a point $z_0$ if the Cauchy-Riemann equations is satisfied, so it has to be the following: 

$$
\begin{cases}
    \partial_x u= \partial_y v
    \\
    \partial_x v = - \partial_y u
\end{cases}
$$

**Thm-2 | The Cauchy Riemann Sufficient Condition**
> The function is complex differentiable when The necessary condition is true, and the partial derivative of $u, v$ along $x, y$ are continuous function.  


**Note**: 

Substitute the value of $z_0$ in the end, after we have the derivative, because some pathological function can have limit at the x, y direction when approaching a point, but failed to have the same limit when it approaches that points along some kind wacky curve or shit like that. Additionally, this condition is slightly weaker than the complex differential definition since we only consider approaching the limit from 4 directions in total. 

---
### **Conjugate Differential | A Short Cut**

So, for the Analyticity of a function, there is a shortcut, the condition is:

#### **Condition-1 | Complex Conjugate Derivative**
> $$\frac{\partial f}{\partial z^*} = 
> \frac{1}{2}\left( 
\partial_x f + i \partial_y f
\right) = 0
> $$

This is just the above Cauchy Riemann Conditions, but expressed in terms of partial the derivative of the function wrt the conjugate of the complex number. This can be very simple to do if the function can be expressed as some conjugate and the number itself. 

**Under Polar Coordinates**

yes, we are going to talk about how the Cauchy Riemann conditions feels like in the polar coordinates. Suppose we have a complex function expressed with the polar parameters in the following form: 

> $$
>   w = f(z) = u(r, \theta) + i v(r, \theta)
> $$
> And then the CR is like: 
> $$
>   u_r = \frac{v_\theta}{r} \hspace{2em} u_\theta = -rv_r
> $$

Yes, so each time the $\partial_r$ appeared, we are going to attach a Lame Coefficients to it and then it should be fine. 

**References**: 
Theorem 6.4, Theorem 6.5 in [Introduction to Complex Analysis](../Introduction%20to%20Complex%20Analysis.pdf). 

---
### **CR and Null Space of The Laplacian**

For any function that is analytic (Cauchy Riemann is True), it's going to be a solution for the Laplacian (In the null space of the Laplacian Operator). Directly from the CR conditions we have:

$$
\begin{aligned}
    u_x &= v_y \implies u_{xx} = v_{xy}
    \\
    u_y &= - v_x \implies u_{yy} = -v_{yx},
\end{aligned}
$$

then $u_{xx} + v_{yy} = 0$ by the fact the the partial derivative are symmetric, notice that this is also the trace of t he Jacobi. These type of functions, in the null space of the Laplacian is called: **Harmonic Functions**.For example, $\sin$ and $\cos$ are Harmonic Functions. 

#### **Fact-1**
> If a function is analytic, then the function is going to be harmonic and it satisfied the Laplacian Operator. This is directly from the Cauchy Riemann Conditions. 


