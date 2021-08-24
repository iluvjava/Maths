Let's see how we can use characteristic of the differential of a function can help us understand the convexity of the function 

prereq: [[AMATH 515 (Optimization Fundamentals)/Basic Convexity/Convexity]]

---
### **Preparation**
Linking 2 points parametrically in a convex set: 
Assuming that $x, y \in \mathbb{R}^n$ with $x \ne y$
$$
\lambda x + (1 - \lambda)y \quad \forall \lambda \in [0, 1]
$$
Which equivalent to 
$$
x + (1 - \lambda)(y - x) \quad \forall \lambda \in [0, 1]
$$
As $x : 0\rightarrow 1$ , we travels from the point $y$ to the point $x$. 

---
And if we want to travel in the reverse direction, we have: 
$$
x + (1 - \lambda)(x - y) \quad \forall \lambda \in [0, 1]
$$
Which is the same as: 
$$
\lambda y + (1 - \lambda)x \quad \forall \lambda \in [0, 1]
$$
As $\lambda: 0 \rightarrow 1$ , we travels from $x$ to $y$. 

---
### **Differential Characterization of Convexity**

**Intro, Background, Statements, Comments**

If the function is convex, then there will be some signs that shows regarding the derivative of the function. And these characteristics are **important for determining whether a given function is convex or not.** 

The following list is a list of statements are equivalent if: $f: T\mapsto R$ is a $C1$ smooth function. 

1. (**Convexity**) $f$ is a convex function. 
2. (**Gradient Inequalities**) $f(y)\geq f(x) + \langle \nabla f(x), y - x\rangle$ for all $x, y\in U$. (The actual value of the function is always larger than the linear approximation of that point)
3. (**Monotonicity**) $\langle \nabla f(y) - \nabla f(x), y - x\rangle \geq 0$ for all $x, y\in U$.

With the **additional assumption that the function is $C2$ smooth**, then we can say that: $\nabla^2 f(x)$ is a **Positive Semi-Definite Matrix**. 

**Intuitive Understanding:**
1. If a function is convex, then the line connecting 2 points will always lies above the function, this characteristics implies the **(2.)** condition in the above list. 
2. The gradient is always an under estimation of the change of the function over a line in the domain. 
3. The change in gradient and the change in the function, if represented via 2 vectors, they will point to approximately the same direction. It's also saying that, the first derivative, (The gradient) is increasing. 
4. If the function has a continuous second derivative, then the Hessian of the function is Positive Semi-Definite. 

**Observe:**
If the function is linear, then all above relations are going to be equals, so the inequalities are strict when the function is linear. 

**Proof Strategies**:
To proof a list of states are equivalent, we will have to do **a cyclic proof** for them. 
(1) --> (2) --> (3)--> --> 1
This should be the route we take. 
Now, let's take (3) --> (2) --> (1), just like the hero's journey.
And after the Journey, we have the additional part where **(1)<-->(2)** relation. 

---
### **Proofs**
**Proof of (2) using (1)**

Assume that the function is convex, and then we use the property of the convex function for the coming proofs: 

For any $t\in (0, 1)$, convexity implies that: 
$$
f(x + t(y - x)) = f(ty + (1 - t)x) \leq tf(y) + (1 - t)f(x)
$$

For any points that are on the line (Going from y to x or x to y), we can say that the it's larger than the function value. At the same time, using the fact that the function is $C1$ smooth, we can say that: 
$$
f(x + t(y - x)) = f(x) + t\nabla f(x)^T(y - x) + o(t)
$$

Moving the derivative part of the function into it and then we get: 
$$
f(x) + t\nabla f(x)^T(y - x) + o(t) \leq tf(y) + (1 - t)f(x)
$$

Cancel out $f(x)$: 
$$
t\nabla f(x)^T(y - x) + o(t) \leq tf(y) - tf(x)
$$
divides both side by $t$. 
Taking the limit: 
$$
\nabla f(x)^T(y - x) \leq f(y) - f(x)
$$

And this is saying that, the predicted change using the first derivative is going to be an underestimation of what actually happened, the same result as **(1)**. 

$\blacksquare$
**Proof (2) --> (3)**

To prove **(3)**, we assume that **(2)** is true and so is convexity definition: 
The statement from the first part is **symmetric** and can be reinterpreted as: 
$$
f(y) \geq f(x) + \nabla f(x)^T(y - x)
$$
And if we swap x, y, then it should still hold true: 
$$
f(x) \geq f(y) + \nabla f(y)^T(x - y)
$$
Adding these 2 together we have:
$$
f(x) + f(y) \geq f(x) + f(y) + (\nabla f(y)^T - \nabla f(x)^T)x + (\nabla f(x)^T - \nabla f(y)^T)y
$$
$$
0 \geq  \nabla (f(y)^T - \nabla f(x)^T)x + (\nabla f(x)^T - \nabla f(y)^T)y = (\nabla f(y)^T - \nabla f(x)^T)(x - y)
$$
$$
(\nabla f(y)^T - \nabla f(x)^T)(y - x) \geq 0
$$

Which is saying that the discrete change in the gradient between 2 points is point approximately to the same direction as the vector connecting these 2 points. This is refer to as the **monotoniticity** of the gradient of the function, the change in the gradient is mono. 
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

**Proof (WTF Moment)**:

Define $\varphi (t) = f(x + t(y - x))$, and then $x_t := x + t(y - x)$ as the auxiliary function. 

Explanation: $\varphi(t)$ is the put of the function as we travels on the line that connects x, y, from x to y. 

Goal: Show that $\phi'$ is non-decreasing using **(3)**, then we use some tricks to finish this up. No decreasing meaning that 
$$
t \ge s \implies \varphi'(t) \le \varphi'(s) 
$$

Using chain rule: 
$$\varphi'(t) = t\nabla f(x_t)^T(y - x)$$ 

$$\varphi'(s) = t\nabla f(x_s)^T(y - x)$$

**Exercise**: show that: 
$$
y - x = \frac{x_t - x_s}{t - s}
$$

Use the result, then we have: 

$$
\varphi'(t) - \varphi'(s) = \frac{1}{t - s}
[\nabla f(x_t) - \nabla f(x_s)]^T (x_t - x_s)
$$

Notice that, the mess on the RHS excluding the fraction, is going to be positive, because that part is just **(3)**. 

Using the assumption that, $t \ge s$, the whole RHS of the expression is going to be positive. 

Apply the fundamental theorem of calculus: 

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