Boundary Value Problems
prerq: [[IVP]] IVP is just a special case of the BVP where we are not really aiming for anything in particular on the boundary. 

---

> $$\frac{d^2y}{dt^2} = f\left(\frac{dy}{dt}, y, t\right) \quad t \in [a, b]$$

Second order, with a predefined time frame for the system. 

However the conditions for the problem will be different: 

> $$\alpha_1 y(a) + \beta_1\frac{dy}{dt}(a) = \gamma_1$$ $$\alpha_2 y(b) + \beta_2\frac{dy}{dt}(b) = \gamma_2$$

And we want a particular solution to the problem to satisfy a system of linear equations with unknown parameters where it involves the value of the function at $a, b$ and the value of the derivative at those points too. 

These kind of problems are called the boundary value problems. 

#### Notes: 
There could be many solutions to the problem, looking for one particular solutions doesn't mean that the solution is gonna be unique to the Boundary Values. 

#### How 
Consider the conditions for both of the IVPs and the BVPs problems, here is the initial conditions for this particular problem if we were solving the IVPs: 

$$y\;(a) = \alpha \quad y\;'(a) = \beta$$

But the BVP is going to solve something like this; 

$$y(a) = \alpha \quad y(b) = \beta$$

So here, with the initial value at $t = a$ we will be able to phrase the problem as an optimization problem where we adjust the value of the derivative at the point of $t = a$ and then we try to minimize the errors at the other end of the simulation $t = b$. Some of the method we can use are "Newton's Raphson" or the "Bisection Method" but this is not very idea, and the Newton's method is going to use the derivative information. 

##### Shooting Method

This is the approach we are going to implement for some of the BVPs 

---
#### Eigen Value Problems (Example)

A boundary value problem is said to be eigen value problem when it can be represented by a linear differential operator with the right hand side of the equation set to zero. 

> $$\frac{d^2\phi_n}{dx^2} + (\overline{n}(x) - \beta_n)\psi_n = 0$$

Consider the following boundary conditions for the problem: 

$$\psi_n \rightarrow 0,  \quad x \rightarrow \pm\infty, \quad [-\infty, +\infty]$$

And here is the value for $\overline{n}(x)$

$$
\overline{n}(x)=\left\{\begin{array}{ll}
1-x^{2} & |x|<1 \\
0 & |x| \geq 1
\end{array}\right.$$
Which is just a piece-wise function. 


Consider the case where it's outside of the little range we will have: 

$$
\frac{d^2\psi_n}{dx^2} - \psi_n\beta_n = 0
$$ 
(1)

So the boundary conditions asserts that the boundary value of the function decays to zero as the time progresses, $\psi \rightarrow 0$ as $x\rightarrow \pm \infty$

Now when we consider the solution, we want the solution that has the parameters $\beta_n > 0$, where (1) can actually decays to zero. 

So the solution of the problem will be super-positioned	 by: 

$$\psi_n = c_1 e^{-\sqrt{\beta_n}x} + c_2 e^{\sqrt{\beta_n}x}$$

The solution has to approaches zero as $x\rightarrow \infty$, and notice that the term with $c_2$ will grows, and hence we have $c_2 = 0$

Now for the other case where $x\rightarrow-\infty$, we will have the term with $c_1 = 0$. 

And this will give use the expression for $\psi\;'$

$$\psi\;'(\infty) = -\sqrt{\beta_n}\psi_n(\infty)$$ $$\psi\;'(-\infty) = \sqrt{\beta_n}\psi_n(-\infty)$$
(2)

This is a expression that can be interpreted computationally. What we did is we transformed a boundary conditions that cannot be interpreted computationally into a conditions that is suitable for computational purposes. 

This is the boundary conditions such that, once put into the simulations, the function will decay to zero at both end of the function. 

For this particular case, we just need to replace the boundary to be a really large number to get the boundary conditions for this problem 


#### Example Continued

> $$\frac{d^2\phi_n}{dx^2} + (100 - \beta_n)\psi_n = 0$$

And in this case, the boundary conditions: 

$$x \in [-1, 1] \;\quad \psi(\pm 1) = 0$$ 

For simplicity $a = (100 - \beta_n)$ and then we have: 

$$\frac{d^2\phi_n}{dx^2} + a\psi_n = 0$$

In this case, it has to be the case that $a > 0\implies \beta_n < 100$, so we are interested in sine and cosine function that meets zero when at the boundary value on the interval. 

And in this case, we need to specify the derivative to shoot for the boundary on the other hand. In this case, we need to transform it to canonical form so that it has the derivative information for the shooting method. 

 Y| Y'
---|---
$y_1 = \psi_n$ |  $y_1\;' = y_2$
$y_2 = \psi_n\;'$ |  $y_2\;' = -ay_1$

And the right side of the table is the Canonical representation of the Linear System. The initial value will be represented as: $y_1(-1) = 0$ and  $y_2'(-1) = A$. 

And our optimization formulation will be to choose $A$ such that $y_1(1) = 0$. 


---

