This is about Lipschitz Continuum of functions, one of the concept that is going to help us with placing a bound on the functions that we are trying to optimize. 

[[Closed, Proper, Level Bounded, Strong Convex]]
Just before everything, I want to draw the parallel between the the Beta smoothness and the alpha strong convexity of the function. 

The **Beta smoothness** is the quadratic global bound for the function, while t he **alpha strong convexity** is the global lower bound  for the function. both is quadratically bounding the objective function. 

---
### Definition 1: Lipschitz Continuity

$f: \mathbb{R}^n \mapsto \mathbb{R}^m$, is $\beta$ Lipschitz Continuum if: 

$$
\Vert f(x) - f(y)\Vert  \le \beta \Vert x - y\Vert 
$$
Where $\beta > 0$

This is saying that, the the changes in the objective value of the function induced by the changes in the domain is always bounded by some constant. 

### Definition 2: Beta Smoothness
A function is call **Beta smooth** if the gradient is Lipschitz Continuum, which means:

$$
\Vert\nabla f(y) - \nabla f(x) \Vert \le \beta \Vert x - y\Vert
$$

---
### Theorem 1

If $f$ is $\beta$ smooth, then: 

$$
|f(x + h) - f(x) + \nabla f(x)^Th| \le \beta \frac{\Vert h\Vert^2}{2}
$$

This is saying that the function is going to bounded by the $\beta$ term, and the affine approximation at some given point around $y$. 

Notice that under the assumption of doing minimization problem the quadratic function will have to curve up, and  that means that it can be writtend as: 
$$
f(y) \le f(x) + \left\langle \nabla f(x), y - x \right\rangle + \frac{\beta}{2}\Vert y - x\Vert^2
$$

---
### Theorem 2

$f$ is $C^2$ smooth and $\beta$ smooth *if and only if*: 

$$
\beta I \succeq \nabla^2 f(x)
$$

Which is say that: The maximal absolute value of the eigenvalues of the Hessian matrix of the function $f$ is always going to be $\le \beta$. 

---
### Example 1

Consider the classic Linear Least square problem: 

$$
\frac{1}{2}\Vert Ax - b\Vert^2
$$
We know that this is $C^2$ smooth, while at the same time we also know that the $\beta$ is going to be the maximal eigenvalues of the matrix $A^TA$ because $\nabla^2[\frac{1}{2}\Vert Ax - b\Vert]$ is $A^TA$

And it's not hard to see the $\beta$ is the maximal eigenvalue of the matrix $A^TA$, and the gradient is given by: $A^T(A - b)$. Which means that we can use gradient descent to solve the matrix vector problem (Given that $A$ is full ranked). When $A$ is not full-rank, we might want to place regularizer to make the problem well-posed. 

---

### Theorem 1 Partial Proof

Proving Theorem 1 carefully will require non-trivial amount of mathematics, however the single variable case is much easier to reason with it and it provides insights about the general case. And also there are some caveats. 

Starting with Lipschitz continuity of the differential, we have: 
$$
|f'(x + h) - f'(x)| \le \beta h
$$
Without Generosity, here we assume that $h > 0$. Getting rid of the absolute value we have: 

$$
f'(x) - \beta h\le f'(x + h) \le f'(x) + \beta h
$$
Taking the integral
$$
\int_{0}^{h} f'(x) + \beta h dt \le \int_{0}^{h} f(x + t)dt \le \int_{0}^{h}  f'(x) + \beta h dt
$$

Taking the derivative which gives us: 
$$
f'(x)h - \frac{\beta h^2}{2} \le 
f(x + h) - f(x) 
\le f'(x)h + \frac{\beta h^2}{2}
$$
Moves stuff around and we have: 
$$
|f(x + h) - f'(x)h - f(x)| \le \frac{\beta h^2}{2}
$$
And this is the case under 1D $\blacksquare$