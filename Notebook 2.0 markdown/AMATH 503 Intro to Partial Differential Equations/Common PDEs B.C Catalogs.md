Here, we will be summarizing the following: 
1. Boundary Conditions
2. Basis Function 
3. Overview on Solution Process
for: 
Heat Equation, Wave Equation. 

And, one of the most important concept we put into practice for the first part of the quarter seems to be: 
[Separation of Variables](Separation%20of%20Variables.md)

---
### **Intro**

Why? 

For midterms. 

What? 

A quick place for looking up, and which will be referencing other files as well, for solving PDEs problems. 

A majority of them comes from lectures and HW, some of them might bot be covered because I don't write HW problems in my notebook. 

Because this is for midterm, we will only include that 1D PDEs. 

**The General Strategies**

1. Separate the space and time function. 
2. Find the basis function for the spatial domain. 
3. Solve for the constant $\lambda$ that is associated with the solutions. 

---
### **The Heat Equation**

PDE Form: 

$$
\partial_t[u]= c^2\partial_x^2[u]
$$

$c$ is relevant to conductivity. 

All boundary conditions are on $[0, L]$, if we have problem with other boundary conditions, we either see if it's possible to augment the solution for the below boundaries to that one, or we need to translate it to that interval. 

#### **Dirichlet Boundary Condition**

Let's also call it: **Homogeneous Type I** Boundary condition. 

Simulates when both ends of the rod is at the same temperature and it's fixed. 

$$
u(0, t) = u(L, 0) = 0
$$

Basis Function: 

$$
X_n(x) = \sin\left(
    \lambda_n x
\right)
\quad \lambda_n = \frac{n\pi}{L} \quad n\in \mathbb{N}
$$

The coefficients the coefficients of Fourier Sine Series. [Fourier Sine Series, PDEs Flavor](Fourier%20Sine%20Series,%20PDEs%20Flavor.md)	of the initial condition. 

#### **Neumann Boundary Conditions**

Simulates when both ends of the rod is not conducting, meaning that now flow of heat is happening there. 

$$
\partial_x[u](0, t) = \partial_x[u](L, t) = 0
$$

And in this case, the basis function for spatial domain is: 

$$
X_n(x) = \cos\left(
    \lambda_n x
\right) \quad \lambda_n = \mathbb{Z}_{\ge 0}
$$ 

And the coefficients is given by the Coefficients of the Fourier Series Cosine of the initial conditions. 

#### **Periodic Boundary Condition**

Simulates heat conduction in a ring, so that both ends of the rod connect to itself. Meaning that the temperate equals and the flow of the heat also has to be equaled. 

The ring is model by an closed en symmetric interval: $[-L, L]$ and the point represented by $\pm L$ is the same point. 

Therefore the boundary conditions will be: 

$$
u(-L, t) = u(L, t) \wedge \partial_x[u](L, t) = \partial_[u](-L, t) 
$$

And the basis functions will be like: 

$$
X_n(x) = A_n\sin(\lambda_n x) + B_n\cos(\lambda_n x) \quad \lambda_n = \frac{n\pi }{L}\quad n\in \mathbb{Z}
$$

Where, the coefficients $A_n$, $B_n$ are the Fourier Coefficients. [Fourier Series, PDE Flavor](Fourier%20Series,%20PDE%20Flavor.md)

There is another basis function that people can choose to use. Which is [Complex Fourier Series, PDF Flavor](Complex%20Fourier%20Series,%20PDF%20Flavor.md). 

Basis function: 

$$
X_n(x) = \exp \left(
    i\lambda_n x
\right) \quad \lambda_n = \frac{n\pi}{L} \quad n \in \mathbb{Z}
$$

And the coefficient is given by: 

$$
c_n = \frac{1}{2L}\int_{-L}^{L} 
f(x) \exp \left(
    i\lambda_n x
\right)
dx
$$

The function $f(x)$ is the initial condition. 

See: [Complex Fourier Series, PDF Flavor](Complex%20Fourier%20Series,%20PDF%20Flavor.md). 

### **Non-Homogeneous Dirichlet (Different Constant on Boundary)** 

Simulates the ends are set to constant temperate but they are not the same temperate. 

$$
u(0, t) = T_1 \wedge u(0, t) = T_2
$$

And it's not hard to see that the steady state solution will be: 

$$
u_s(x, t) = \frac{T_2 - T_1}{L}x + T_1
$$

And this is the homogeneous solution of the system, it will set $\partial_t$ into zero. 

And it's not hard to see that the solution is a decomposition of 2 functions: 

$$
u(x, t) = u_n(x, t) + u_s(x, t)
$$

And notice that $u(x, t) - u_n(x, t)$ is Dirichlet boundary conditions, therefore, we can solve it with Dirichlet boundary conditions and add back the homogeneous solution to get the full solution of the Equation. 

---
### **Wave Equation**

Simulates: A vibrating string. 

$$
\partial_t^2[u] = c^2\partial_x^2[u]
$$

#### **Dirichlet Boundary Condition**

Simulates both ends of the string being fixed, and the string has a initial configurations to start with. 

The initial conditions contain both the velocity and position, which means that both $u(x, 0), \partial_t[u](x, 0)$ needs to be defined for as a function of $x$ on the interval $[0, L]$. 

$$
u(0, t) = u(L, t) = 0
$$

The basis function for the spatial domain is: 

$$
X_n(x) = \sin(\lambda_n x) \quad \lambda_n = \frac{n\pi }{L} \quad n \in \mathbb{N}
$$

The full solution this boundary conditions for the dimensionless form is discussed in: [](Separation%20of%20Variables.md#Wave%20Equation%20Example%201D%20fixed%20Ends).


#### **One end Fixed Boundary Condition**

This is explored in HW 2, where one end of the string is fixed while the other end is free to go. And the boundary condition is like: 

$$
u(0,t) = \partial_x[u](L, t) = 0
$$


The basis function in the spatial domain is: 

$$
X_n(x) = \sin(\lambda_n x)
$$

**However**: The lambda is different, and please consult HW2 Questions 4 to know why, lambda is: 

$$
\lambda_n = \frac{n\pi}{L} + \frac{\pi}{2L} = \frac{(2n + 1)\pi}{2L}\quad \lambda_n = \mathbb{Z}_{\ge 0}
$$


And this will assert that $\cos(\lambda_n L) = 0$. 

And for the time domain, the basis function must be compared with the initial conditions. 

$$
\frac{T''}{T} = -\lambda_n^2\implies T = A_n \sin(\lambda_n t) + B_n\cos(\lambda_n t)
$$

Let's assume that the initial conditions is in the most general form: 

$$
u(x, 0) = f(x) \quad \partial_t[u](x, 0) = g(x)
$$

Then it can be said that: 

$$
\sum_{n = 0}^{\infty}
    T_n(0)\sin(\lambda_n t) = f(x)
\quad 
\sum_{n = 0}^{\infty}
    T_n'(0)\sin(\lambda_n t) = g(x)
$$

Where 

$$
T_n(0) = B_n \quad T'(0) = A_n\lambda_n
$$

And hence, $B_n$ is the **ODD Fourier Sine Coefficients** of $f(x)$ and $A_n\lambda_n$ over an larger interval of $[0, 2L]$. 

If the initial conditions cannot be represented with only odd indices for the Fourier Sine Series, we have a problem. 

Yes, this is weird. But if $f(x) = 1$ and $g(x) = 0$ we are saved because that means $A_n = 0$ and $B_n$ is defined because $1$ only needs the odd harmonics of sine. 

