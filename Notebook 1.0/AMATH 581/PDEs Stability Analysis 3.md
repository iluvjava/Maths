This is a follow up for the previous modules for stability for different Schemes applied to partial differential equations. 

prereq: [[PDEs Stability Analysis 2]]

---

### Time Stepping Method

Assuming a general format for the PDEs in the following form: 

> $$
> u_t = f(\partial_x^2u, \partial_xu)
> $$

So it's second order, non time depend, but doesn't have to be linear, then we define the CFL numbers like the following: 

$$
\lambda = \frac{\Delta t}{\Delta x}
$$
#### Forward Euler

$$
u_n^{(m + 1)} = u_n^{(m)} + 
f\left(
	\frac{u_{n + 1}^{(m)}- u_{n - 1}^{(m)}}{2\Delta x},
	\frac{u_{n + 1}^{(m )} - 2u_{n}^{(m )} + u_{n - 1}^{(m)}}
	{\Delta x^2}
	\right)
$$

If $f$ is linear, then this is easier to analyze and can be put into a linear system for time stepping. 

Order: $\mathcal{O}(\Delta x^2\Delta t)$

* Wave Equation: Unconditionally Unstable 
* Heat Equation: 
	*  $$\frac{C\Delta t}{\Delta x^2} < \frac{1}{2}$$

#### Backward Euler

$$
u_n^{(m + 1)} = u_n^{(m)} + 
f\left(
	\frac{u_{n + 1}^{(m)}- u_{n - 1}^{(m)}}{2\Delta x},
	\frac{u_{n + 1}^{(m)} - 2u_{n}^{(m)} + u_{n - 1}^{(m)}}
	{\Delta x^2}
	\right)
$$

* Wave Equation: Unconditionally Stable
* Heat Equation: Unconditionally Stable

#### Leap Frog 

$$
u_n^{(m + 1)} = u_n^{(m - 1)} + f\left(
	\frac{u_{n + 1}^{(m)}- u_{n - 1}^{(m)}}{2\Delta x},
	\frac{u_{n + 1}^{(m )} - 2u_{n}^{(m )} + u_{n - 1}^{(m)}}
	{\Delta x^2}
	\right)
$$

* Heat Equation: Unconditionally Stable



