Let's see how we can use characteristic of the differential of a function can help us understand the convexity of the function 

prereq: [[AMATH 515 (Optimization Fundamentals)/Basic Convexity/Convexity]]

---
### **Differential Characterization of Convexity**


> The following list is a list of statements are equivalent if: $f: T\mapsto R$ is a $C1$ smooth function. 
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

**Observe:**
If the function is linear, then all above relations are going to be equals, so the inequalities are strict when the function is linear.

**Proof Strategies**:
To proof a list of states are equivalent, we will have to do **a cyclic proof** for them. (1) --> (2) --> (3)--> (1). This should be the route we take. Now, let's take (3) --> (2) --> (1), just like the hero's journey. And after the Journey, we have the additional part where **(1)<-->(2)** relation. 

---
### **Proofs**
**Proof of (2) using (1)**

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
	& f(x) + t\nabla f(x)^T(y - x) + o(t) \leq tf(y) + (1 - t)f(x)
	\\
	\implies &
	t\nabla f(x)^T(y - x) + o(t) \leq tf(y) - tf(x)
	\\
	\implies & 
	\nabla f(x)^T(y - x) + o(t)/t \leq f(y) - f(x)
	\\
	[1]\implies &
	\nabla f(x)^T(y - x) \leq f(y) - f(x)
\end{aligned}
$$

At \[1\], we take the limit of $t\rightarrow 0$, then it's saying that, the predicted change using the first derivative is alawys going to be an underestimation of what the actual function value is, the same result as **(1)**. $\blacksquare$

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

**Proof (3) --> (1) [Super Big Brain]**: 
> $$(\nabla f(y)^T - \nabla f(x)^T)(y - x) \geq 0$$ 
> implies that fact that the function is convex. 

**Strategy**: 
Show that **(3)**--> $f(y) = \sup_x\{ f(x) + \nabla f(x)^T(y - x)\}$
This is say that: The convex function just the supremum of the affine linear approximation of the function. 

* $f(x) + \nabla f(x)^T(y - x)$ is affine. 

If we lock $x$, then it's an affine function of $y$. 

**Big brain realization**: The Sup function is going to be convex because affine linear function itself is a convex function. 

**Proof**:

Define $\varphi (t) = f(x + t(y - x))$, and then $x_t := x + t(y - x)$ as the auxiliary function. Show that $\phi'$ is non-decreasing using **(3)**, then we use some tricks to finish this up. Non decreasing meaning that:

$$
t \ge s \implies \varphi'(t) \le \varphi'(s) 
$$

Using chain rule: 

$$
\begin{aligned}
	& \varphi'(t) = t\nabla f(x_t)^T(y - x)	
	\\
	& \varphi'(s) = t\nabla f(x_s)^T(y - x)	
\end{aligned}
$$

**Exercise**: show that: 

$$
	y - x = \frac{x_t - x_s}{t - s}
$$

Use the result, then we have: 

$$
\varphi'(t) - \varphi'(s) = \frac{1}{t - s}
[\nabla f(x_t) - \nabla f(x_s)]^T (x_t - x_s)
$$

Notice that, the mess on the RHS excluding the fraction, is going to be positive, because that part is just **(3)**. Using the assumption that, $t \ge s$, the whole RHS of the expression is going to be positive. Apply the fundamental theorem of calculus:

$$
\varphi(1) = \varphi(0) + \int_0^1 \varphi'(\tau)d\tau \ge \varphi(0) + (1)\varphi'(0)
$$

By the fact that $\varphi'$ is a non decreasing function. 

**Plugging in**: 

$\varphi(1) = f(y)$,

$\varphi (0) = f(x)$

$\varphi'(0) = \nabla f(x)^T (y - x)$

Therefore: 
$$
f(y) \ge f(x) + \nabla f(x)^T(y - x)
$$

This statement is true for all $x$. **This**, is statement **(2)**. 

Therefore: 
$$
f(y) \ge \sup_x\{ f(x) + \nabla f(x)^T(y - x)\}
$$

Due to monoticity, if we set $x = y$, then the left hand side equals to the right hand side, therefore, it's a strict equality that makes the **supremum** idea works here, and if that is the case, since the function is larger than another affine linear function (**which is convex**, proven the preq part of the note), therefore, $f(y)$ is going to be another convex function as well. $\blacksquare$

---
### **Corollary 2.19**

For a given function that is $C^1$ smooth and convex, the following are equivalent: 
1. $x$ is a global minimizer for f. 
2. $x$ is a local minimizer for f
3. $x$ is a stationary point ($\nabla f(x) = 0$)

Proof: 1 --> 2 Trivial, 2 --> 3, already did in [[Optimality Conditions (Jacobian Hessian)]] 
What remains to be verified is: 3 --> 1 

$$
f(y) \le f(x) + \nabla f(x)^T(y - x)
$$
At the local minimum, we know that it's going to set the gradient to be zero, and therefore: 
$$
f(y) \ge f(y) \quad \forall y
$$

So if the function is convex, and there exists a local minima, then it's going to be a global minima. 

Notice that, it's possible to have infinitely many minima ($e^x$), or it's just decreasing and there is never any minimizer ($-x$) for the function over the whole domain. 

And even better, the indicator function $\sigma_{(-1, 1)}(x)$, and then he interval is open, and then we can say that $g(x) + x + \sigma_{(-1, 1)}$. This function is going to be convex but it doesn't really have a minimizer because we cannot read that point (The point is at $x >> 1$).  We can get infinitely close to $x = -1$, but we can never reach there because the set is open and convex. 

**READ PG 5 - 11 FOR VARIATIONAL ANALYSIS**
This is the in the course folder. 

---
### **The missing Part: Exercise** 

Trying to show that: 

$$
y - x = \frac{x_t - x_s}{t - s}
$$
With the assumption that, $t > s$, and that the parametric line is going from x to y, so it's like: 
$$
x(t) := x + t(y- x)
$$

Then we know that: 
1. $x_t = x + t(x - y)$
2. $x_s = x+ s(x - y)$

And then: $x_t - x_s = (t - s)(x - y)$, 
therefore: 
$$
\frac{x_t - x_s}{t - s} = y - x
$$

Which is what we want. $\blacksquare$