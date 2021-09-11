This is continuation of [[Von Neuman Stability Analysis]]

And we are going over some more intriguing examples, and we are going to see when stiffness happens for our partial differential equations. 

---
### Heat Equation + Leapfrog

> $$
> u_t = Cu_{xx}
> $$

Assuming that we are going to use the Leapfrog $\mathcal{O}(\Delta x^2\Delta t^2)$. 


$$
u_n^{(m + 1)} = u_n^{m - 1} + \frac{2C\Delta t}{\Delta x^2}
\left(u_{n + 1}^{(m)} - 2 u_{n}^{(m)} + u_{n -1}^{(m)}\right)
$$

And the stability analysis will produce the results that: 

$$
g^{m + 1} \exp(\zeta_n) = g^{m - 1}\exp(\zeta_n) + 2\lambda(\exp(\zeta_{n + 1}) - 2\exp(\zeta_n) + \exp(\zeta_{n - 1}))
$$

Where $\lambda$ is denoting the CFL and it's like: 

$$
\lambda = \frac{C\Delta t}{\Delta x^2}
$$

And then this will be giving us the following by multiplying both side by $g^{-m+ 1}\exp(-\zeta_n)$ to get: 

$$
g^2 = 1 + 2\lambda g(\cos(\Delta \xi) - 2)
$$

And then notice that right term in the sum will always contribute to the value of $g$ while at the same time, there is a $1$ already there for $g^2$, therefore The Leapfrog Scheme for the Heat Equation is going to be: "**Unconditionally Unstable**"

#### Comment: 
We see that the Leapfrog for the wave equation works, but for the heat equation, this is not working anymore. 

---

### Heat Equation + FE (Forward Euler)

Let's see the time-stepping scheme for the Forward Euler, and it's going to be like: 

$$
\frac{u_n^{(m + 1)} - u_n^{(m)}}{\Delta t}
=
\frac{C}{\Delta x^2}\left( 
	u_{n + 1}^{(m)} - 2u_{n}^{(m)} + u_{n + 1}^{(m)}
\right)
$$

And then we have the explicit scheme as: 

$$
u_{n}^{(m + 1)} = u_n^{(m)} + \frac{C\Delta t}{\Delta x^2}
\left(
u_{n + 1}^{(m)} - 2 u_{n}^{(m)} + u_{n - 1}^{(m)}
\right)
$$

Let CFL be the same as the previous part for the heat equation, and then we can perform the analysis: 

$$
g^{m + 1} \exp(\zeta_n) = g^m\exp(\zeta_n) + \lambda g^m
(\exp(\zeta_{n + 1}) - 2\exp(\zeta_n) + \exp(\zeta_{n - 1}))
$$

And then we divides both side by the quantity $g^m \exp(\zeta_n)$, and then after some algebra we will have: 

$$
g = 1 + \lambda (\cos(\Delta\xi) - 2)
$$

And then we will have the condition that $\lambda < 1/2$ then $|g| < 1$. 

Weird, for the wave equation the FE scheme doesn't work at all, but for the heat equation it has a stability region.

And notice that, the CFL is limited in the following way: 

$$
\frac{C\Delta t}{\Delta x^2}  < \frac{1}{2}
$$

Notice that, we need to decrease the time discritization in space quadratically  as we decrease the spatial discretization, which is not good. 

#### Comment 
This is when thing get stiff, where we have to bound the value of the $\Delta t$ much more aggressively to maintain the stability of the problem. 

This is especially salient when high order off derivatives exists in the partial differential equation. 

### Stiff PDEs System 

This happens when the CFL has extreme properties where we need to decrease the spatial stepping $\Delta t$ much faster than the Spatial Discretization, and that is when it's called a stiff system. 

And example of the stiff system is: 

$$
u_t = -Cu_{xxxx}
$$

And for the 4th order equation, $\lambda$ will make the relation that: 

$$
\Delta t < \frac{\Delta x^4}{C}
$$
And this is not good because $\Delta t$ will get too small to compute. 

**This is still a big problem in the case of Spectral Method**. This is the case because $kx^4$ is a huge number, depending on the spatial discretization of $N$. An ODEs system with a huge huge numbers inside is still a **stiff** system, and the stability and accuracy will remain similar. 





