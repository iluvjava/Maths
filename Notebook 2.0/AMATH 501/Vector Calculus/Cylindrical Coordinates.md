Here we talk about the Cylindrical Coordinates so we have a quick reference to it when we are taking the integrals of things. 
[[Ortho Curvillinears Coord]]: The Cylindrical Coordinates is one of the coordinate system that is Orthogonal Curvilinear. 

$$\newcommand{\uvec}[1]{\hat{\textbf{#1}}}$$

---

#### Def

> $$u(r, \theta, z) = 
> \begin{bmatrix}
>     r\cos{\theta} \\
>     r\sin{\theta} \\ 
>     z
> \end{bmatrix}
> $$

Then we will have the Jacobian looking like this: 

$$
\begin{bmatrix}
	\cos{\theta} & -r\sin{\theta} & 0\\ 
	\sin{\theta} & r\cos{\theta} & 0\\
	0 & 0 & 1
\end{bmatrix}
$$

Which is giving us the basis vector, if we normalized each of the column to get 
$\hat{\textbf{e}}_r, \hat{\textbf{e}}_\theta, \hat{\textbf{e}}_z$. 

And they are like: 
$$\uvec{e}_r = (\cos\theta, \sin\theta, 0)$$ $$\uvec{e}_\theta = (-\sin{\theta}, \cos\theta, 0)$$ 

$$\uvec{e}_z = (0, 0, 1)$$

At the same time, the magnitude of the columns of the coordinates will be the Lame Coefficients: 

$$h_r = 1$$ 

$$h_\theta = r$$

$$h_z = 1$$


---
#### Gradient Operator

The gradient operator, $\nabla$ is gonna be like: 

> $$\nabla = \frac{1}{h_r}\frac{\partial}{\partial r}\uvec{e}_r + \frac{1}{h_\theta}\frac{\partial}{\partial \theta}\uvec{e}_\theta + \frac{1}{h_z}\frac{\partial}{\partial z}\uvec{e}_z$$

Substituting the values in we should have the nablua operator like: 

> $$\nabla = \frac{\partial}{\partial r}\uvec{e}_r + \frac{1}{r}\frac{\partial}{\partial \theta}\uvec{e}_\theta + \frac{\partial}{\partial z}\uvec{e}_z$$

---