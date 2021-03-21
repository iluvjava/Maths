In this part we review some of the calculus that is useful 


---

### Jacobian, Hessian

Consider $F: U \mapsto Y$. F is differentialble at $x\in U$ if there exists a linear mapping taking $E$ to $Y$ satisfying: 

> $$
> F(x+ h) = F(x) + \nabla F(x)h+o(||h||)
> $$

If $\nabla F(x)$ is continuous, then it's called $C^1$ smooth, and then $\nabla F(x)$ will be a mapping from $\mathbb{R}^n$ to $\mathbb{R}^m$. 

And $\nabla F(x)$ is the Jacobian of the function, giving us: 

$$\nabla F(x)=\left(\begin{array}{c}
\nabla F_{1}(x)^{T} \\
\nabla F_{2}(x)^{T} \\
\vdots \\
\nabla F_{m}(x)^{T}
\end{array}\right)=\left(\begin{array}{cccc}
\frac{\partial F_{1}(x)}{\partial x_{1}} & \frac{\partial F_{1}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{1}(x)}{\partial x_{n}} \\
\frac{\partial F_{2}(x)}{\partial x_{1}} & \frac{\partial F_{2}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{2}(x)}{\partial x_{n}} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial F_{m}(x)}{\partial x_{1}} & \frac{\partial F_{m}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{m}(x)}{\partial x_{n}}
\end{array}\right) .$$

Taking derivative on $x_i$ for the $i$th column of the Jacobi we get the **Hessian**: 

$$
\nabla^{2} F(x)=\left(\begin{array}{cccc}
\frac{\partial^{2} f(x)}{\partial x_{1}^{2}} & \frac{\partial^{2} f(x)}{\partial x_{1} \partial x_{2}} & \cdots & \frac{\partial^{2} f_{1}(x)}{\partial x_{1} \partial x_{n}} \\
\frac{\partial^{2} f(x)}{\partial x_{2} \partial x_{1}} & \frac{\partial^{2} f(x)}{\partial x_{2}^{2}} & \cdots & \frac{\partial^{2} f(x)}{\partial x_{2} \partial x_{n}} \\
\vdots & \vdots & \ddots & \vdots \\
\frac{\partial^{2} f(x)}{\partial x_{n} \partial x_{1}} & \frac{\partial^{2} f(x)}{\partial x_{n} \partial x_{2}} & \cdots & \frac{\partial^{2} f(x)}{\partial x_{n}^{2}}
\end{array}\right)
$$

Take note of on the following: 

The Hessian, $\nabla^2 F(x)$ is continuous, then the original function $F(x)$ will be $C^2$ smooth, and if that is true, then the Hessian will be **Hermitian Adjoint**. 

In addition, take notice that by abusing the notations, we will have: 

$$
\nabla^2 F(x) = \nabla F(x) (\nabla F(x))^T
$$

Using language: "The outer produce of the gradient operator is the Hessian Matrix of the function. "

Please don't confuse it with $\nabla\cdot\nabla$ which is the **Laplacian Operator**. 

---

### Approximations

For any 2 points $x,y\in E$, define the close segment to be: 

$$
(x, y) := \{
	\lambda x + (1 - \lambda)y: \lambda \in[0, 1]
\}
$$

Any subset $Q$ is convex if for any $x,y\in Q$: $(x, y) \in Q$ . 

Let $U$ be an open, convex subset of $E$, then let the function $f: U\mapsto R$, and a point $x\in U$. Then best first order approximation of the function will be: 

$$
l(x; y) = f(x) + \langle \nabla f(x), y - x\rangle 
$$

And if the given function is $C2$ smooth, then the there exists a quadratic approximation written as: 

$$
Q(x; y) = f(x) + \langle\nabla f(x), y - x \rangle + \frac{1}{2}\langle 
	\nabla^2f(x)(y - x), y - x
\rangle
$$

And in the context, the approximation is centered at $y$, (as you might already be able to tell)

Take note the for the second expression, it can be put into a more familiar form: 

$$
Q(x; y)  = f(x) + \nabla f(x) \Delta x + \frac{1}{2}(\Delta x)^T \nabla^2 f(x)(\Delta x)
$$
 
Let's connect 2 of the points with a linear function that goes between them: $\varphi: [0, 1] \rightarrow \mathbb{R}$, where 

$$
\varphi(t) = f(x + t(y-x))
$$

Where its basically the output of the function $f(x)$ as we go from the point $y$ to the point $x$ in the convex domain of the function. 

And the path can be linearized as: $x(t) = x + t(y - x)$. 

Then the derivative is just $\nabla f(x(t))^Tx'(t)$. Observe that $x'(t)$ is actually $(y - x)$, and hence we will get: 

$$
\varphi' (t) = \nabla f(x(t))^T(y - x)
$$

And it's equivalent to the above inner product form. 

---
#### Fundamental Theorem of Multi-Variable Calculus
From the first order approximations of the multi-variable functions, we can derive the fundamental theorem of calculus for multi-variable functions (Which should be covered in Analysis class)

$$
f(y) - f(x) = \int_{0}^1 
\langle 
\nabla f(x + t(y - x)), y - x
\rangle dt
$$

For any parametric function that goes between the point $x, y$. And this is the integral form of the FTC. 

---
### Common Terms, Concepts and it's Definition 
For this class, we need some kind of language as the preliminaries to describe what is happening. 


**Definition 1**
$r(t)$ is called $o(t)$ if: 
> $$
> \lim_{t\rightarrow 0}\frac{r(t)}{t} = 0
> $$

The function is approaching zero in a way faster than linear. Similarly, another other type of function can also be involved with the $o$ notation, augment the argument by yourself. 


