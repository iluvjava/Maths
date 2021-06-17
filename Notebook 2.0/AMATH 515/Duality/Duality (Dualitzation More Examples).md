This file is about more duality, so we need to know about 
[[Duality (Dualization)]], and then we need to know more.
[[Proximal Gradient Method]]

In addition, ideas used in 
[[Duality Preparation]], [[Duality Prepraration 2]] will be involved here too. 

Learning Goal: 
1. More intuition about duality. 
2. State the theorems and understand when the primal and the dual are going to equal to each other. 

---
### Intro

Last time, we viewed some examples of the dual problems. Using the idea of conjugate, and closed and convex function, we can get the dual problem. 

Lagrangian: The expression that is in side the min sup, appearing everywhere in our works last time. 

Let's take a look at the examples, for example, the 1-norm projection problem. 

To prepare, we will list the duel primal of a generalized form here: 

> $$
> \min_x \left\lbrace
> g(x) + h(Ax - b) + c^Tx 
> \right\rbrace
> =
> \sup_z \left\lbrace
> -b^Tz - h^*(z) - g^*(-A^Tz - c)
> \right\rbrace \tag{1}
> $$

Note that, this is equality here. We just tweaked it. 

---
### Example: Fun with Projection

projection onto the 1-norm ball. 

$$
\min_x \frac{1}{2}\Vert x - z\Vert^2 \text{ s.t } \Vert x\Vert_1 \le \lambda
$$

Dualize the constraint, so there dual variable for the constraint with many variable will be 1. 

The constraint is a indicator function: 

$$
\delta_{>0} \left(
     \lambda - \Vert x\Vert_1
\right) = \sup_\tau \left\lbrace
     (\lambda - \Vert x\Vert_1)\tau - \delta_{<0}(\tau)
\right\rbrace
$$

The constraint, in the form of double conjugate is: 

$$
\sup_{\tau\le 0} \left\lbrace
\tau \left(
 \lambda - \Vert x\Vert_1
\right)
\right\rbrace
$$

If the one norm is smaller than $\lambda$, then we can set $\tau$ to zero and everything will be zero, if not, we can drive this thing to infinity. The idea here is basically an indictor function for the constraints. 

$$
\min_x \sup_{\tau < 0}
\left\lbrace
\frac{1}{2} \Vert x - z\Vert^2 + \tau \Vert x\Vert_1 - \tau \lambda
\right\rbrace
$$

This is actually equal to (See later this page why this is the case)

$$
\underset{?}{\text{=}}
\sup_{\tau < 0} \min_x \left\lbrace
\underbrace{\frac{1}{2} \Vert x - z\Vert^2 + \tau \Vert x\Vert_1}_{\text{Soft Thresholding}}
     - \tau \lambda
\right\rbrace
$$

And then, we can use the proximal method to find the closed form solution of the inner minimization problem, after that, we will be left with the inner optimization problem. 

After soon math, we can show that the Huber loss function is the objective value coming out from the inside of the proximal operator. See more about Huber here: [Huber Loss](https://www.wikiwand.com/en/Huber_loss), which has a closed form solution. This means that, we have transformed the constrained projection function into a one variable optimization problem. 

---
### Perturbation, Sensitivity Analysis

> $$
> \min_x \left\lbrace
> g(x) + h(Ax - b) + c^Tx 
> \right\rbrace
> $$

We are assuming that, both $h, g$ are closed and convex function for this primal problem. 

That, is our primal problem, consider perturbing the $b$ vector inside the primal problem. Let the perturbation vector be $y$, then we have: 

$$
F(x, y) := g(x) + h(Ax - b + y) + c^Tx
$$

Note: This function is still a convex function. What happens if we wiggle the data here? 

Define: 

$$
p(y) = \min_x F(x, y)
$$

So, give me any kind of perturbations, for the primal problem, I will optimize it for the primal variable, and then the thing that gets out of it will be $p(y)$. Without any perturbations, we have: $p(0)$, which is the optimal of the original problem. 

**Duality is sensitivity to the data ($b$ vector)**. How sensitive is the optimization problem to the data we were given. 

Ok, Then, I want the gradient of $p$ at zero. $\nabla p(0)$, or sub-gradient.

Interpretation: Sensitivity of the optimal value, wrt perturbing the data. 

**Fact**: 
p is convex in y, we may not have unique gradient at zero, but we can work to get a sub-gradient of the function at $y = 0$. 

From Fenchel's Inequality, we have: 

$$
z \in \partial p(0) \iff 0 \in \partial p^*(z) \tag{2} \iff z = \min \{p^*(z)\}
$$

Dual decision in the sub-diff of the perturbation function at primal optimal solution if and only 0 is a member of the dual sub-gradient when evaluated at $z$. 

> Dual variable $z$ is the sub-gradient of the perturbations at primal optimal if and only if z is another optimal of the conjugate of the perturbation function. 

And, because we are assuming convexity from the function, the right side of the expression implies that we seek to solve for: 

$$
\max_z \left\lbrace
- p^*(z)
\right\rbrace = -\min_z \left\lbrace
p^*(z)
\right\rbrace = \max_z \left\lbrace
z^T \mathbf{0} - p^*(z)
\right\rbrace
 = p^{**}(0)
$$

To summarized, we want to characterize that: $\partial p(0)$, and that is just maximizing the negative of the conjugate function with the dual variables. 

When is $p(0) = p^{**}(0)$? 

$$
p(y) = \min_x F(x, y)
$$
Compute the conjugate (This is shown in HW3)
$$
p^*(z) = F^*(0, z)
$$
Then, we only need $F^*(0, z)$

**Proof**: 

$$
p(y) = \min_x F(x, y) \quad \text{Where: }F(x, y) = g(x) + h(Ax - b + y) + c^Tx
$$

Claim: 
> $$
> p^*(z) = F^*(0, z) \tag{3}
> $$

$$
F(x, y) = g(x) + h(Ax - b + y) + c^Tx
$$
by def
$$
F^*(w, z) = \sup_{x, y} \left\lbrace
     w^Tx + y^Tz - g(x) - h(Ax - b+y) - C^Tx
\right\rbrace
$$
Let: $u = ax - b + y \implies y = u - Ax + b$
$$
\sup_{x, u} \left\lbrace
     w^Tx + (u - Ax + b)^Tz - g(x) - c^Tx - h(u)
\right\rbrace
$$

$$
b^Tz + h^*(z) + 
\sup_{x} \left\lbrace
    (2 - c - A^Tz)^Tx - g(x)
\right\rbrace
$$

$$
b^Tz + h^*(z) + 
g^*(2 - c - A^Tz)
$$
And that thing is $F^*(w, z)$, by (3), we have: 

$$p^*(z) = b^Tz + h^*(z) + g^*(-A^Tz - c)$$

This is exactly the dual problem we have, please compare to expression (1) so it makes sense. 

---