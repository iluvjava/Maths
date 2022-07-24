In this part we review some of the calculus that is useful. It's too basic to have any type of prerequisites. 


---

### **Jacobian, Hessian**

**Definition of Jacobian**: 
> Consider $F: U \mapsto Y$ be a mapping from one Euclidean space to the other. $F$ is differentiable at $x\in U$ if there exists a linear mapping $\nabla F(x)$ taking $E$ to $Y$ satisfying: 
> $$
> F(x+ h) = F(x) + \nabla F(x)h+o(||h||)
> $$
> Then $\nabla F(x)$ is referred to as the Jacobian. 
> If $\nabla F(x)$ is continuous, then it's called $C^1$ smooth, and then $\nabla F(x)$ will be a mapping from $\mathbb{R}^n$ to $\mathbb{R}^m$. The Jacobian is give as: 
> $$
> \nabla F(x)=\left(\begin{array}{c}
> \nabla F_{1}(x)^{T} \\
> \nabla F_{2}(x)^{T} \\
> \vdots \\
> \nabla F_{m}(x)^{T}
> \end{array}\right)=\left(\begin{array}{cccc}
> \frac{\partial F_{1}(x)}{\partial x_{1}} & \frac{\partial F_{1}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{1}(x)}{\partial x_{n}} \\
> \frac{\partial F_{2}(x)}{\partial x_{1}} & \frac{\partial F_{2}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{2}(x)}{\partial x_{n}} \\
> \vdots & \vdots & \ddots & \vdots \\
> \frac{\partial F_{m}(x)}{\partial x_{1}} & \frac{\partial F_{m}(x)}{\partial x_{2}} & \ldots & \frac{\partial F_{m}(x)}{\partial x_{n}}
> \end{array}\right)
> $$

**Definition of Hessian**: 

> Let $\nabla^T\nabla f$ to be the hessian applied to a $f: \mathbb R^n \mapsto \mathbb R$, giving us: 
> 
> $$
> \begin{aligned}
> 	\nabla^T\nabla f(x) = 
> 	\begin{bmatrix}
> 		\frac{\partial^2f}{\partial x_1^2} & \frac{\partial^2f}{\partial x_1x_2} &
> 		\cdots &
> 		\frac{\partial^2 f}{\partial x_1\partial x_n}
> 		\\
> 		\frac{\partial^2f}{\partial x_2x_1} & \frac{\partial^2f}{\partial x_2^2} &
> 		\cdots &
> 		\frac{\partial^2 f}{\partial x_2\partial x_n}
> 		\\
> 		\vdots & \vdots & \ddots & \vdots
> 		\\
> 		\frac{\partial^2f}{\partial x_nx_1} & \frac{\partial^2f}{\partial x_nx_2} &
> 		\cdots &
> 		\frac{\partial^2 f}{\partial x_n^2}
> 	\end{bmatrix}(x)
> \end{aligned}
> $$


**Remarks**:

The Hessian, $\nabla^T\nabla f(x)$ is continuous, then the original function $f(x)$ will be $C^2$ smooth, and if that is true, then the Hessian will be a matrix of type [[Hermitian Adjoint]]. In some literature, the Hessian operator might be denoted as $\nabla^2$, please don't confuse it with $\nabla\cdot\nabla$ which is the **Laplacian Operator**. 

The gradient of gradient is the Hessian, it can be seemed as the outer product of 2 gradient operator combined together. Abusing the notations we define the following operator 

---

### **Affine, Quadratic Approximations of Smooth Functions**

Let $U$ be an open, convex subset of euclidean space $\mathbb E$, then let the function $f: U\mapsto R$, and a point $x\in U$. Then best first order approximation is an affline linear: 

$$
l_x(y) = f(x) + \langle \nabla f(x), y - x\rangle 
$$

And if the given function is $C2$ smooth, then the there exists a quadratic approximation written as: 

$$
\begin{aligned}
   	Q_x(y) &= 
   	f(x) + \langle\nabla f(x), y - x \rangle + \frac{1}{2}\langle 
	\nabla^2f(x)(y - x), y - x
	\rangle
	\\
	y := x + \Delta x
	\implies Q_x(x + \Delta x)  &= f(x) + \nabla f(x) \Delta x + \frac{1}{2}(\Delta x)^T \nabla^2 f(x)(\Delta x)
\end{aligned}
$$


---
### **Fundamental Theorem of Multi-Variable Calculus**
From the first order approximations of the multi-variable functions, we can derive the fundamental theorem of calculus for multi-variable functions by considerin takingthe integral of the function's value over a straight straight line connecting $x, y$, paramaterized by variable $t\in [0, 1]$. 

$$
f(y) - f(x) = \int_{0}^1 
t
\langle 
	\nabla f(x + t(y - x)), y - x
\rangle dt = 
\int_0^1(f(x + t(y - x)))'dt
$$


---
### **Small o Notation**

**Definition 1**
$r(t)$ is called $\in o(t)$ if: 
> $$
> \lim_{t\rightarrow 0}\frac{r(t)}{t} = 0
> $$



