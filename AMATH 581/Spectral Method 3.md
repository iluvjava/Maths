Prereq: [[Spectral Method 2]]
Continues the talk about different type of basis for the Spectral method. 

---


### Alternative Basis

* DCT, DST
* Bessel Functions: For Circulate Domain. 
* Legendre Polynomials, This is for 3d Laplacian 
* Gauss-Hermite Polynomial: Harmonic Oscillator. 
* Spherical Harmonics: 3D sphere.  
* Chebyshev Polynomial

But in this file, we are interested in: "Checbyshev Polynomial", and this is another method that can be computed within $\mathcal{O}(N\log{N})$, and this is going to relate to the FFT method. 

### Chebyshev Polynomial

Chebyshev is the solution to the following equations: 
$$
\sqrt{1 - x^2}\frac{d}{dx} \left( 
	\sqrt{1 - x^2} \frac{d T_n(x)}{dx}
\right)
+
n^2 T_n(x) = 0
$$

* The eigen values of the problem are reals. 
* The eigenfunction of the polynomials are reals. 
* The eigenfunctions are going to be orthogonal. 

The orthogonality property will make a weighted inner product to be zero, and it's this: 

$$
\int_{-1}^1\sqrt{1 - x^2} T_n(x) T_m(x) = \delta_{n, m}c_n
$$

The orthogonality property is going to give us the **inverse transform**. 

#### Def The Chebyshev

> $$
> T_n(\cos(\theta)) = \cos(n\theta) \quad \theta \in [0, \pi]
> $$

$$
T_0(x) = 1
$$

$$
T_1(x) = x
$$

$$
T_2(x) = 2x^2 - 1
$$ 

$$
T_3(x) = 4x^3 - 3x
$$

$$
\cdots
$$

 Recursively we have: 
 
$$
T_{n + 1}(x) = 2xT_n(x) - T_{n - 1}(x) 
$$

![[ChebeshevPolynomial.png]]

**What are the Boundary Conditions? What is the Discretizations?**

$$
f(x) = \sum_{n=1}^N a_nT_n(x)
$$
And as we all know it, the inner product for the Chebyshev looks like: 

$$
a_k = \int_{-1}^{1}\frac{f(t)T_k(t)}{\sqrt{1 + x^2}}\;dt
$$

And **after some fancy math** which I am skipping, we have: 

$$
f'(\theta = 0) = f'(\theta=\pi) = 0
$$

And hence, this is saying  that the **Boundary conditions** are going to be **Neumann** Boundary Conditions. ($\partial_x u = 0$ at the boundary)

And the grid discritization for $T_n$ is going to be the x-axis projection of the semi-arch on the unit circle in 2d. And hence the points are given by: 

$$
\cos\left( \frac{(2m - 1)\pi}{2n}\right) \quad \forall m = 1, 2, \cdots, n
$$

Where $n$ is going to be uniformly discretized on the interval $[0, \pi]$, and this is like: $n_k = k\pi/N$

#### The Heat Equations

Consider the equation: 
$$
u_t = \nabla^2 u
$$

And consider the boundary conditions: $$u = 0$$ the Dirichlet Boundary conditions. 

#### Spectral Diff Matrix 

So, we can repackage the DFT matrix together with the linear scaling factor and the IFFT operations into a giant matrix product. And the good things here is that everything is going to be in the solution space, however this is not good because we are losing the FFT algorithm for fast computations, and we are back to the original problem and it will be really slow to compute it because the matrix is pretty dense. 

$$
u_x = D_{cheb} u
$$

Let's figure out the Cheb matrix that can take the derivative on our points on space. 

First, let's take a look at how this is working if we were going to code it, the theoretical aspect of things is going to be harder tho. 

Given an interval in `[-1, 1]` we want to discretize it using the Chebyshev Nodes, and within matlab, it's given as: 

```matlab
x2      = -1: 0.01: 1; 
N       = 20
[D, x2] = cheb(N - 1)
```

So, we are taking 20 points in for the interpolations. And the quantity `x2` is the discretization points and the `D` is the Chebyshev matrix that can take the derivatives on the discretized grid points. 

And taking the derivative is as simple as taking the Matrix vector products. 

**When in 2D**, we can borrow the idea from [[Finite Difference]] method, and use the kron product which is giving us: 

$$
D\otimes I + I\otimes D
$$

And the boundary conditions are set with the following command: 

```matlab
D(1, :) = zeros(1: n); 
D(N, :) = zeros(1, n);  % This is extra. 
```

And then this is the **Dirichlet boundary** where $u = 0$. Note that we append the last row as the boundary conditions. 

And if you want 

**Note**
I am just gonna write it here, prof state something I don't understand yet: 
Prof: "That is why we are using semi-spectral method and not fully spectral, otherwise we will have Naumann Boundary conditions here."

This is **Semi-Spectral** because we still need to evaluate the thing using the cheb operator. 


### Domain Scaling

The Chebeshev operator is always defined under the domain $[-1, 1]$, let's assuming that we have the problem in $[-L/2, L/2]$. 

$$
z = \frac{2x}{L}
$$

$$
u(x, t) \rightarrow u(z, t) 
$$
So then: 

$$
u_x = u_z\frac{dz}{dx} = \frac{2}{L}u_z
$$

$$
u_{xx} = \frac{4}{L^2}u_{zz}
$$
(...) etc

---
### THEOREY

(Refer to Trefethen's Book: Spectral Method in Matlab : chapter 6)

How is the Cheb Matrix derived? 

Ok, so you interpolate the function with a polynomial, and it should be with this basis, like what we have for the Newton Interpolation: 

??? Lagrange Basis

Where $1\leq j\leq N - 1$ and $N$ is the number of discretization on the axis. 

And then we take the derivative and see how the coefficients (The Values of Discrete points) propagates, and then we will take make it into a matrix. 

**NOTE**: The Chebyshev Derivative can be done via FFT method. 
