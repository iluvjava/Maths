We are going to analyze the stability of different scheme for the 1D wave equations. 
[[PDEs Time Stepping, Finite Difference]]: Basics stuff about spacial and temporal discretization on a given system of PDE, CFL, FE etc. 

[[Introduction to Fourier Transform Fourier Series]]: Because we are modeling the solution as a Fourier Series here. 

---

### **Intro**

Here we are going to keep looking at the wave equation example: 

> $$u_t = cu_x$$

Where $u(x, t)$ should be a one dimension wave function. 

### **Von-Neumann Stability Analysis**
Assume that the solution is separable, and using separation of variables we have: 

$$
u(x, t) = G(t)F(x)
$$
The key here is to analyze a solution of this form: 
$$
u_n^{(m)} = \sum_{k = -\infty}^\infty g^mc_k\exp
\left(
	\frac{ik\pi x_n}{L}
\right)
$$

This is like the classic solution to elliptic PDEs, and under this case, all the Fourier Coefficients will cancel out after plugging them into the scheme, simultaneously, all the trigs with the same frequencies can be collected together, giving us a really nice form for stability analysis. 

#### **Stability Criterion**

$|g| < 1$ --> Stable
$|g| \leq 1$ --> Unstable 

So, we are basically investigating how the wave changes if we were to use some kind of scheme. It's very much similar to stability analysis of the ODEs equations, where we use the exponential model for the analysis. 

---

### **FE Scheme on Wave Equation**

So the key here is to analyze the stability is to substitute the Fourier Series into the scheme and see how the multiplier grows. If it explodes, then the scheme is going to be unstable. 

The FE is: 

> $$
> u^{(m + 1)}_n = u^{(m)}_n + \frac{\lambda}{2}(u^{m}_{n + 1} - u_{n - 1}^m)
> $$

And now, let's focus on the Fourier Series representation, and it will be like: 

$$
u_n^{(m)} = \sum_{k = -\infty}^\infty g^mc_k\exp
\left(
	\frac{ik\pi x_n}{L}
\right)
$$
substituting it, collect the like terms, and cancel out the Fourier Coefficients, we will have: 
$$
\forall k \in \mathbb{Z}: \quad 
g^{m + 1}\exp
	\left(
		\frac{ik\pi x_n}{L}
	\right)  = 
	g^m\exp\left(
		\frac{ik\pi x_n}{L}
	\right)
	+ 
	\frac{\lambda}{2}
	\left( 
		g^m\exp \left(
			\frac{ik\pi x_{n + 1}}{L}
		\right)
		-
		g^m\exp\left( 
			\frac{ik\pi x_{n - 1}}{L}
		\right)
	\right)
$$

And then we make it look better using: 

$$
\zeta_n = \frac{ik\pi x_n}{L}
$$

So we have it put into a nicer form and it's like: 

$$
g^{m + 1} \exp\left( 
	\zeta_n
\right) = g^m \exp\left(
	\zeta_n
\right)
+ \frac{\lambda}{2}
\left( 
	g^m\exp(\zeta_{n + 1}) - g^m\exp(\zeta_{n - 1})
\right)
$$

Let's divide both side by this quantity: $g^m\exp(\zeta_n)$, which should give us: 

$$
g = 1 + \frac{\lambda}{2}\left( 
	\exp(\zeta_{n + 1} - \zeta_n) - \exp(\zeta_{n - 1} - \zeta_{n})
\right)
$$

Note that $\zeta_{n + 1} - \zeta_{n} = \frac{ik\pi\Delta x}{L}$ denote this as $\Delta\xi$

then we have: 

$$
g = 1 + \frac{\lambda}{2}(\exp(\Delta\xi) - \exp(-\Delta \xi))
$$

Which is: 

$$
g = 1 + \frac{2i\lambda}{2}\sin(\Delta \xi)
$$

And notice that $$|g|^2 > 1$$ will be true regardless of what we choose for $\lambda$, there fore this **scheme is always going to be unstable**. 

---
### **Backwards Euler on Wave Equation**

This is what the backward Euler Scheme looks like for the wave equation with Temporal Discretization: 

> $$
> u_n^{(m + 1)} = u_n^{(m)} + \frac{\lambda}{2}{(u_{n + 1}^{(m + 1)} - u_{n - 1}^{(m + 1)}})
> $$

Where we need to solve for the future time step $u_n^{(m + 1)}$

And this will give us this when we substitute the Fourier Series for Analysis: 

$$
g^{m + 1}\exp(\zeta_n) = 
g^{m}\exp(\zeta_{n}) + \frac{\lambda}{2}(
g^{m + 1}\exp(\zeta_{n + 1}) - g^{m + 1}\exp(\zeta_{n - 1}))
$$

And diving both side by $g^{m}\exp(\zeta_n)$ and then the right hand side will be  $g$, then we have: 

$$
g = 1 + \frac{\lambda}{2}(
	g\exp(-\Delta \xi) - g\exp(\Delta \xi)
)
$$

$$
g = 1 + \frac{g\lambda}{2}(
	\exp(-\Delta \xi) - \exp(\Delta \xi)
)
$$

$$
g = 1 - ig\lambda\sin(\Delta \xi)
$$
Which means that: 
$$
g = \frac{1}{1 + i\lambda\sin(\Delta\xi)}
$$

Notice that, this is** unconditionally stable**, because: 
$$
|g|^2 = \frac{1}{1+ \lambda^2\sin^2(\Delta \xi)} \leq 1 \quad\forall\; k, \lambda
$$

### **Leap Frog on Wave Equation (More Common)**
Skipping the math part, here is the scheme for leapfrog method on the wave equation: 

> $$
> u_n^{(m + 1)} = u_n^{(m - 1)} + \lambda(u_{n + 1}^{(m)} - u_{n - 1}^{(m)})
> $$

And after some simplification, we will have: 

$$
g^2 = 1 + ig2\lambda\sin(\Delta \xi)
$$

This is an equation we need to solve for, and solving it should give us: 

$$
g = i\lambda\sin(\Delta\xi) \pm \sqrt{-\lambda^2\sin^2(\Delta \xi) - 1}
$$

Consider $|g| < 1$, and we consider the worse case scenario for this equation containing multiple solutions. 

And we will have $|g| < 1$ for $\lambda < \lambda_{max} = 1$

Then we will need to have the criteria that: 

$$
\lambda = \frac{C\Delta t}{\Delta x} < 1 \implies \Delta t < \frac{\Delta x}{C}
$$

And this is the criteria for $\Delta t$, we have to change the $\Delta t$ whenever we are given a space discretization 


---
### **Comment, Summary**

The FE for 1d Wave equation is unconditionally unstable.
The BE for 1d wave equation is unconditionally stable. 

Predictor Corrector methods can also be used to increase the stability properties of the scheme.


