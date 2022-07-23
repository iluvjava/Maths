What kind of conditions are necessary for an input of an function. 
[[Jacobian and Hessian]]


---
### **Optimality Conditions Characterized by Jacobian and Hessians**

**Definition 2**
A function $f:\mathbb{R}^n\mapsto\mathbb{R}$ is differentiable at a point x if there exists a gradient vector for the function at the point of derivative. The gradient is just: $\nabla f(x)$, which is a column vector by default.

**Definition 3**
A function, $f:\mathbb{R}^n \mapsto \mathbb{R}^m$ is differentiable at an given point $x_0$ if the Jacobian of the function exists for the point $x_0$. 

**Definition 4**
The **Hessian** is the Jacobian of the gradient. 

Properties: 
1. When the Hessian is a continuous mapping, meaning that $x\mapsto H$ is a continuous function, then the $H$ is Symmetric. (Notice that, it's symmetric, we are not sure what happens with complex functions, which might be vary different)

**Definition 5**

A symmetric matrix $A$ is **Positive Semi-definite** when $x^TAx \geq 0$ for any x. Equivalently, **all eigenvalues of matrix $A$ are Non-Negative**. 

**Definition 6**

A symmetric matrix $A$ is **Positive Definite** when $x^TAx > 0$ for $x\neq 0$. Equivalently, **all eigenvalues of the matrix $A$ are positive**.

**Definition 7**

A function $f$ is twice differentiable at $x$ if we have: 

$$
f(x + h) = f(x) + \nabla f(x)^T h + \frac{1}{2}h^T\nabla^2 f(x)h + o(||h||^2)
$$

#### Optimality Conditions

**Definition 8**: 
$\bar{x}$ is a local minimal for f if $\exists$ a small ball $B_\epsilon$, with $f(\bar{x}) \leq  f(x)$ for all $x\in B_\epsilon$. 

**Theorem 1**: First order Optimality Condition
if $\bar{x}$ is a local min for $f$, then $\nabla f(\bar{x}) = \mathbf{0}$. 

*Proof*: 

By the fact the the point $\bar{x}$ is local minimum and the definition 8, we know that: 

$$
0 \leq \frac{f(\bar{x} - t\nabla f(\bar{x})) - f(\bar{x})}
{t}
$$
for $t$ that is sufficiently small. 

At the same time, by linear approximation of the function at $\bar{x}$, we know that: 

$$
f(\bar{x} - t\nabla f(\bar{x}))
= f(\bar{x}) + \nabla f(\bar{x})^T(-\nabla f(\bar{x}))t + o(||h||)
$$
Simplifying and we have: 

$$
f(\bar{x} - t\nabla f(\bar{x}))
= f(\bar{x}) -t||\nabla f(\bar{x})||^2 + o(||h||)
$$

And this will mean that: 
$$
0\leq
\frac{f(\bar{x} - t\nabla f(\bar{x})) - f(\bar{x})}
{t}
=
-||\nabla f(\bar{x})||^2 + \frac{o(||h||)}{t} \leq \frac{o(||h||)}{t}
$$

Then by the definition of the small o notations, we have  the fact that: 

$$
||\nabla f(\bar{x})|| = 0
$$ 
$\blacksquare$


**Theorem 2**: Second order Optimality _Necessary_ Conditions

Note that: it's Necessary, not all, there might be additional stuff needed for the if the conclusion of the theorem were to be true. 

 Read: **The Course Reader Theorem 2.8**

> If f is twice differentiable, then
> 1. $\bar{x}$ a local mean for f --> $\nabla f(\bar{x}) = \mathbf{0}$ and $\nabla^2 f(\bar{x})$ is **positive semi-definite**. 

*Proof*: 
By previous theorem 1, the first component of the conclusion is automatically true. 

The second order approximation is: 
$$
f(\bar{x} + tv) = f(\bar{x}) + 0 + \frac{t^2}{2} v^T \nabla^2f(\bar{x}) v + o(t^2)
$$

By the fact that the point $\bar{x}$ is a local minimum, then: 

$$
0 \leq f(\bar{x} + tv) - f(\bar{x}) = \frac{t^2}{2}v^T\nabla^2 f(\bar{x}) v + o(t^2)
$$

Boom, then dividing both side of the equation by $t^2$, we have: 

$$
0 \leq \frac{1}{2} v^T \nabla^2 f(\bar{x}) v + \frac{o(t^2)}{t^2}
$$

Taking the limit, we will know that: 

$$
\frac{1}{2} v^T \nabla^2 f(\bar{x}) v \geq 0
$$

#### Extra Comments

The **Hessian** is **positive semi-definite**. And a **positive Semi-definite** Hessian Matrix is going to give us a Positive Concavity. 

$\blacksquare$

**The Converse of The Statement:**
If the Hessian is Symmetric Positive Definite (Stronger than positive semi-definite), and the gradient is zero, then there is a local minimum. 

**Why Positive Semi-definite means optima for the given points? **

The intuitive understanding comes from the fact that, the Jacobian of the gradient is Symmetric (or the Hessian). 

By spectral theorem ([[Hermitian Adjoint]]), the matrix is diagonalizable with an orthogonal basis: $H = QDQ^T$. 

If the matrix is positive definite (Semi or Full), The eigenvalues are all positive. This means that, for every unite vector I put into it, $H$will scale the vector up. 

Which means that Jacobian is describing a function in which, for every direction I walk in space, all of its output in the output space increases. 

Which means that the gradient (The Hessian is the Jacobian of the Gradient) is getting larger regardless of where I move. 

With the assumption that the point I am at now has a gradient of zero, then the objective value will get larger regardless what direction I move away from the point I am at now. 

Therefore the point is a local minimum. $\blacksquare$



