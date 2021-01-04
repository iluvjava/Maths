In this part we review some of the calculus that is useful 


---

### Jacobian, Hessian

Consider $F: U \mapsto Y$. F is differentialble at $x\in U$ if there exists a linear mapping taking $E$ to $Y$ satisfying: 

$$
F(x+ h) = F(x) + \nabla F(x)h+o(||h||)
$$

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

Taking derivative on $x_i$ for the $i$th column of the jacobian we get the **Hessian**: 

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

