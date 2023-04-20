oPlease read: [Duality Preparation](Duality%20Preparation.md) before reading about this.
A list of contents we will be going over for this document is: 

1. Definition of the Conjugacy --> Frenchel's Inequality
2. Fenchel's Inequality 
3. Conjugacy of the Constraint Functions.

---

### **Intro**

Remember that the definition of a conjugate function is like: 

$$
f^*(z) = \sup_x\{
	z^Tx - f(x)  
\}
$$

And the expression: 

$$
f^{**} \le f(x)
$$ 

is strictly equals when the function $f(x)$ is a closed and convex function. 

---
### **Fenchel's Inequality, Fenchel's Identity**

From the definition of conjugate function: 

$$
f^*(z) = \sup_x \{z^Tx - f(x)\} \ge z^Ty - f(y) \quad \forall y
$$
$$
z^Tx - f(x)\ge z^Ty - f(y) \quad \forall y
$$
$$
f(y) \ge z^T(y - x) + f(x) \quad \forall y
$$

From 1 to 2: $x$ is fixed by the sup. 

From 2 to 3: Just algebra.

Assume: **f is closed and convex**
then 
> $$
> z \in \partial f(x) \tag{1}
> $$

True by the definition of sub-gradient, cauchy sub-gradient inequality

The argument is reversible, which means that: 

$$
f^*(z) = \sup_x \{z^Tx - f(x)\} \iff z \in \partial f(x) \quad \text{f is closed and convex}
$$

Keep using the $x$ as the optimal $x$ from the sup, we will have equality: 

$$
f^*(z) + f(x) = z^Tx
$$

Using the fact that double conjugate function is the same for closed and convex function, we have: 

$$
f^*(z) + f^{**}(x) = z^Tx
$$
Which is
$$
f^{**}(x) = \sup_z\{z^Tx - f^*(x)\} = f(x)
$$

Notice that, this time, $z, x$ swapped, and we have $f^*(x)$ instead of $f(x)$.

Go through the same proof for (1) but with $f(x)$ as $f^{**}(x)$, then we will have:

> $$
> z\in \partial f(x) \iff x \in \partial f^*(z) \tag{2}
> $$

---
#### **Example: Least Square**

Expression (2) the best when the function is smooth, this is the case because the sub-gradient will get decay into gradient and equality. 

Let's apply expression (2) for the linear least square: 

$$
f(x) = \frac{1}{2} \Vert Ax - b\Vert^2 
$$

And we are interested in the function $f^*$, what is it? 

Firstly, the gradient of $f$: 
$$
\nabla f(x) = A^T(Ax - b)
$$

Using the LHS of (2), and the fact that $f$ is smooth: 

$$
z = \nabla f = A^T(Ax - b)
$$

Solving for $x$, we can have: 

$$
x = (A^TA)^{-1} (z + A^Tb)
$$

By RHS of (2), we have: 

$$
x = (A^TA)^{-1} (z + A^Tb) = \nabla f^*(z)
$$

Then take the integral on the gradient defined here, we will have: 

$$
f^*(z) = \frac{1}{2}(z + A^Tb)^T(A^TA)^{-1}(z + A^Tb)
$$

Which we assume that $A^TA$ is invertible, or else this is not going to work out, and we will be missing a constant that holds some information. 

**Note**: 
The variable $z$ for the conjugate function is the decision variables for th dual problem. 

--- 
### **Conjugacy of the Constraint Functions**

Here, we use the trick of the including the constraints from the optimization problem into the objective function using the indicator function. 

Consider the **zero indicator function**, a vector function, a pivotal example of all: 

$$
\delta_0(x) =\begin{cases}
    0 & x = 0\\
    \infty & x \ne 0
\end{cases}
$$

When constraint is good, the function is well-behaved and it has a value of zero. 

Consider the conjugate of the function by definition: 

$$
\delta^*_0(z) = \sup_x\{
        z^Tx - \delta_0(x)
    \}
$$

Notice that, the only way to NOT get negative infinity from the sup operator is to set the value of $x$ to be the zero vector. Which means that: 
$$
\delta_0^*(z) \equiv 0
$$

And if we take the conjugate on the zero function, we will have the zero indicator function. This is not hard to see because $\sup_x(z^Tx)$ goes to infinity whenever the value $z\neq 0$, and when it's zero, then the $\sup$ can't change things by much.

Consider the constraint function for the positive quadrant, multi-variable function: 

$$
\delta_{+}(x) := \begin{cases}
    0 & x \in \mathbb{R}^n_+ 
    \\
    \infty & \text{else}
\end{cases}
$$

Then in this case, we can find out the conjugate of the function using the definition: 

$$
\delta_+^*(z) = \sup_x \left\lbrace
    z^Tx - \delta_+(x)
\right\rbrace
$$

1. Whenver any of the component of the vector $z_i$ is larger than zero, then we can pick any $x$ with $x_i > 0$, drive this $x_i$ to inf, then that will be the upper limit. 
2. Otherwise if all $z_i < 0$, then we have no choice to let $x_i = 0$  for all i, which sets the value of $\delta_+$ to be zero as well. 

Therefore by pure reasoning, we have the dual of the function to be expressed as: 

$$
\delta_+^*(z) = \begin{cases}
    0 & x_i \le 0 \quad \forall i
    \\
    \infty & \text{else}
\end{cases}
$$


