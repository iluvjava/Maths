prepreq: [[Bifurcation 1D]]
More on the Normal form of the system. 

---

### Normal Form
![[Bifurcation 1D#Bifurcation Normal Form]]

Take notice that, when we are speaking of the local behavior of some function, we think of [[Jacobian and Hessian]], which will encapsulate some of the features of the function in that local region. 

Let's restrict ourselves to $f(x, r)$, and hence we have: 
$$
\begin{align}
	\nabla f(x_c, r_c) &= \begin{bmatrix}
		\partial_x f(x_c, r_c) \\ 
		\partial_r f(x_c, r_c)
	\end{bmatrix}
	\\
	\nabla^2 f(x_c, r_c) &= 
	\begin{bmatrix}
		\partial_{xx}f(x_c, r_c) & \partial_{rx}f(x_c, r_c)
		\\
		\partial_{xr}f(x_c, r_c) & \partial_{rr}f(x_c, r_c)
	\end{bmatrix}
\end{align}
$$

And as we observe, the critical point will set the first derivative to be zero, and it's the solution to the system, and the derivative with respects to $r$
$$
\begin{align}
	\nabla f(x_c, r_c) &= \begin{bmatrix}
		0\\ 
		\partial_r f(x_c, r_c)
	\end{bmatrix}
	\\
	\nabla^2 f(x_c, r_c) &= 
	\begin{bmatrix}
		\partial_{xx}f(x_c, r_c) & \partial_{rx}f(x_c, r_c)
		\\
		\partial_{xr}f(x_c, r_c) & \partial_{rr}f(x_c, r_c)
	\end{bmatrix}
\end{align}
$$

And therefore, we can simplify the local behavior of the function a bit, and get: 

$$
\begin{align}
	f(x, r) &\approx f(x_c, r_c) + 
	\nabla f(x_c, r_c)^T\begin{bmatrix}
	(x - x_c) \\ (r - r_c)
	\end{bmatrix}
	+
	\begin{bmatrix}
	(x - x_c) \\ (r - r_c)
	\end{bmatrix}^T
	\nabla^2 f(x_c, r_c) 
	\begin{bmatrix}
	(x - x_c) \\ (r - r_c)
	\end{bmatrix} 
\end{align}
$$

And that is not very helpful, it's just that I love to do differential this way. 

Yeah, there doen't seem to be an obvious link with the normal form and the matrices that describes the differential. 