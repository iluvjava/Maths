Let's see how we can use characteristic of the differential of a function can help us understand the convexity of the function 

prereq: [[Introduction to Convexity]]

---
### **Differential Characterization of Convexity**


> The following list is a list of statements are equivalent if: $f: T\mapsto R$ is a $C_1$ smooth function. 
> 
> 1. (**Convexity**) $f$ is a convex function. 
> 2. (**Gradient Inequalities**) $f(y)\geq f(x) + \langle \nabla f(x), y - x\rangle$ for all $x, y\in U$. (The actual value of the function is always larger than the linear approximation of that point)
> 3. (**Monotonicity**) $\langle \nabla f(y) - \nabla f(x), y - x\rangle \geq 0$ for all $x, y\in U$.

With the **additional assumption that the function is $C2$ smooth**, then we can say that: $\nabla^2 f(x)$ is a **Positive Semi-Definite Matrix**. 

**Remarks:**
* Intuitive Understanding:
	1. If a function is convex, then the line connecting 2 points will always lies above the function, this characteristics implies the **(2.)** condition in the above list. 
	2. The gradient is always an under estimation of the change of the function over a line in the domain. 
	3. The change in gradient and the change in the function, if represented via 2 vectors, they will point to approximately the same direction. It's also saying that, the first derivative, (The gradient) is increasing. 
	4. If the function has a continuous second derivative, then the Hessian of the function is Positive Semi-Definite. 
* (1) and (2) are absolutely not the same thing. 
	* A function is convex, if, its value at any convex combinations of points is less than the convex combinations of the function values at those points, which, was never characterized by the gradient of a function at those points, and hence, proving it should not be viewed as a trivial task. 

**Observe:**

If the function is linear, then all above relations are going to be equals, so the inequalities are strict when the function is linear.

**Proof Strategies**:

To proof a list of states are equivalent, we will have to do **a cyclic proof** for them. (1) --> (2) --> (3)--> (1). This should be the route we take. Now, let's take (3) --> (2) --> (1), just like the hero's journey. And after the Journey, we have the additional part where **(1)<-->(2)** relation. 

---
### **Proofs**
**Proof (1) --> (2)**

Assume that the function is convex, By secant line inequality, for any $t\in (0, 1)$, convexity implies that: 
$$
f(x + t(y - x)) = f(ty + (1 - t)x) \leq tf(y) + (1 - t)f(x)
$$

Applying the calculus and c1 smoothness of the function, multiple parameters inside the function call can be expanded out as:  
$$
f(x + t(y - x)) = f(x) + t\nabla f(x)^T(y - x) + o(t)
$$

Moving the derivative part of the function into it and then we get: 

$$
\begin{aligned}
	f(x) + t\nabla f(x)^T(y - x) + o(t) &\leq tf(y) + (1 - t)f(x)
	\\
	\implies 
	t\nabla f(x)^T(y - x) + o(t) &\leq tf(y) - tf(x)
	\\
	\implies
	\nabla f(x)^T(y - x) + o(t)/t &\leq f(y) - f(x)
	\\
	[1]\implies
	\nabla f(x)^T(y - x) &\leq f(y) - f(x)
\end{aligned}
$$

At \[1\], we take the limit of $t\rightarrow 0$, then it's saying that, the predicted change using the first derivative is always going to be an underestimation of what the actual function value is, the same result as **(2)**. $\blacksquare$

**Proof (2) --> (3)**

To prove **(3)**, we assume that **(2)** is true and so is convexity definition. The statement from the first part, the convexity inequality is **symmetric**, then: 
$$
\begin{aligned}
	& 
	\begin{cases}
		f(y) \geq f(x) + \nabla f(x)^T(y - x)
		\\
		f(x) \geq f(y) + \nabla f(y)^T(x - y)	
	\end{cases}
	\\\text{Sum up both}\implies
	& f(x) + f(y) \geq f(x) + f(y) + (\nabla f(y)^T - \nabla f(x)^T)x + (\nabla f(x)^T - \nabla f(y)^T)y	
	\\
	& 0 \geq  \nabla (f(y)^T - \nabla f(x)^T)x + (\nabla f(x)^T - \nabla f(y)^T)y
	\\
	& 0 \ge (\nabla f(y)^T - \nabla f(x)^T)(x - y)
	\\
	\implies & 
	(\nabla f(y)^T - \nabla f(x)^T)(y - x) \geq 0
\end{aligned}
$$

Which is saying that the discrete change in the gradient between 2 points is point approximately to the same direction as the vector connecting these 2 points. This is refer to as the **monotonicity** of the gradient of the function, the change in the gradient is mono. 
$\blacksquare$

**Proof (3) --> (2)**: 
> $$(\nabla f(y)^T - \nabla f(x)^T)(y - x) \geq 0$$ 
> implies that fact that the function is convex. 

**Proof**:

Define $\varphi (t) = f(x + t(y - x))$, and then $x_t := x + t(y - x)$ as the auxiliary function. It represent the function value of $f$ along the line $[x_1, x_2]$, where $t\in [0, 1]$ specify the where we are on the line segment. Take notice that taking the derivative on the function gives us the following: 

$$
\begin{aligned}
	& \varphi'(t) = t\langle \nabla f(x_t), y - x\rangle
	\\
	& \varphi'(s) = s\langle \nabla f(x_s), y - x\rangle
	\\
	[1]\implies &
	\varphi'(s) - \varphi'(t) = (s - t)\langle \nabla f(x_s) - \nabla f(x_t), y - x \rangle \ge 0 
	\\
	\implies & 
	(t\le s \implies \varphi'(t) \le \varphi'(s))
\end{aligned}
$$

\[1\] We make use of monotonic property of the gradient in statement hypothesis. Please observe that by definition $(t - s)(y - x) = x_t - x_s$. Therefore, the derivative of a convex function monotonically increases in any line segment in its domain. Let's consider the fundamental theorem of calculus on the line segment, applied to the function $\varphi (t)$: 

$$
\varphi(1) = \varphi(0) + \int_0^1 \varphi'(\tau)d\tau \ge \varphi(0) + (1)\varphi'(0)
$$

We use the monotonicity to justify the $\ge$, resulting a lower bound for the integral. Next we consider substituting in the following parameters for the equation: $\varphi(1) = f(y)$, $\varphi (0) = f(x)$, $\varphi'(0) = \nabla f(x)^T (y - x)$, 
Therefore: 

$$
f(y) \ge f(x) + \nabla f(x)^T(y - x)
$$

This statement is true for all $x$, equivalent to statement **(2)**. Taking the supreme of all $x$ we obtain:
$$
f(y) \ge \sup_x\{ f(x) + \nabla f(x)^T(y - x)\}
$$

Due to monoticity of the gradient, we obtain the monotone increasing property of function over a line segment.

---
### **Corollary 2.19**

For a given function that is $C^1$ smooth and convex, the following are equivalent: 
1. $x$ is a global minimizer for f. 
2. $x$ is a local minimizer for f
3. $x$ is a stationary point ($\nabla f(x) = 0$)

Proof: 1 --> 2 Trivial, 2 --> 3, already did in [[Optimality Conditions, Jacobian Hessian]] 
What remains to be verified is: 3 --> 1 

$$
f(y) \le f(x) + \nabla f(x)^T(y - x)
$$
At the local minimum, we know that it's going to set the gradient to be zero, and therefore: 
$$
f(y) \ge f(y) \quad \forall y
$$

So if the function is convex, and there exists a local minima, then it's going to be a global minima. Notice that, it's possible to have infinity as a minima in the case of the funtion: $e^x$, or $-x$. 

And even better, the indicator function $\sigma_{(-1, 1)}(x)$, and then he interval is open, and then we can say that $g(x) + x + \sigma_{(-1, 1)}$. This function is going to be convex but it doesn't really have a minimizer because we cannot read that point (The point is at $x >> 1$).  We can get infinitely close to $x = -1$, but we can never reach there because the set is open and convex. **READ PG 5 - 11 FOR VARIATIONAL ANALYSIS**, This is the in the course folder. 
