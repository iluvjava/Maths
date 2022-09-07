Quick reference for the Shpherical Coordinates
prereq: [Ortho Curvillinears Coord](Ortho%20Curvillinears%20Coord.md)

---

#### Def

The spherical coordinate is like: 

> $$u(r, \theta, \phi)
> =\begin{bmatrix}
> r\sin{\theta} \cos{\phi} \\ 
> r\sin{\theta} \sin{\phi} \\
> r\cos{\theta}
> \end{bmatrix}
> $$

Here are the ranges for the variables: 
$$r \geq 0$$

$$ 0 \leq \theta \leq \pi$$ 

$$0 \leq \phi \leq 2\pi $$

Notice that, if we set the $\phi$ into a constant, then this is looking similar to a cylindrical coordinates. 

This is the Jacobian of the function and it's giving us: 

$$
\begin{bmatrix}
\sin{\theta} \cos{\phi} & r\cos{\theta} \cos{\phi} & -r\sin{\theta}\sin{\phi}\\ 
\sin{\theta} \sin{\phi} & r\cos{\theta} \sin{\phi} & r\sin{\theta}\cos{\phi}\\ 
\cos{\theta} & -r\sin{\theta} & 0
\end{bmatrix}
$$

And this is the Lame Coefficients for the coordinates: 

$$h_r = 1$$ 

$$h_\theta = r$$ 

$$h_\phi = r\sin{\theta}$$

This is the basis for the spherical coordinates: 

$$
\begin{bmatrix}
\mathbf{\widehat{e}_r} & \mathbf{\widehat{e}_\theta} &\mathbf{\widehat{e}_\phi} 
\end{bmatrix}
= \begin{bmatrix}
	\sin{\theta} \cos{\phi} & \cos{\theta} \cos{\phi} & sin{\phi}\\ 
	\sin{\theta} \sin{\phi} & \cos{\theta} \sin{\phi} & \cos{\phi}\\ 
	\cos{\theta} & \sin{\theta} & 0
\end{bmatrix}
$$

That is all you need to solve math problems. 



