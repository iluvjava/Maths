Here, we will be summarizing the following: 
1. Boundary Conditions
2. Basis Function 
3. Overview on Solution Process
for: 
Heat Equation, Wave Equation. 

---
### **Intro**

Why? 

For midterms. 

What? 

A quick place for looking up, and which will be referencing other files as well, for solving PDEs problems. 

A majority of them comes from lectures and HW, some of them might bot be covered because I don't write HW problems in my notebook. 

Because this is for midterm, we will only include that 1D PDEs. 

---
### **The Heat Equation**

PDE Form: 

$$
\partial_t[u]= c^2\partial_x^2[u]
$$

$c$ is relavent to conductivity. 

#### **Dirichlet Boundary Condition**

Let's also call it: **Homogenous Type I** Boundary condition. 

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

The coefficients the coefficients of Fourier Sine Series. [[Fourier Sine Series (PDEs Flavor)]]	of the initial condition. 

#### **Neumann Boundary Conditions**

Simulates when both ends of the rod is not conducting, meaning that now flow of heat is happening there. 

$$
\partial_x[u](0, t) = \partial_x[u](L, t) = 0
$$

And in this case, the basis function for spectial domain is: 

$$
X_n(x) = \cos\left(
    \lambda_n x
\right) \quad \lambda_n = \mathbb{Z}_{\ge 0}
$$ 

And the coefficients is given by the Coefficients of the Fourier Series Cosine of the initial conditions. 

#### **Periodic Boundary Condition**

Simulates heat condution in a ring, so that both ends of the rod connect to itself. Meaning that the temperate equals and the flow of the heat also has to be equaled. 

This is also the best type of boundary conditions to work with. 

$$
u(0, t) = u(L, t) \wedge \partial_x[u](0, t) = \partial_[u](L, t) 
$$

And the basis functions will be like: 

$$
X_n(x) = A_n\sin(\lambda_n x) + B_n\cos(\lambda_n x) \quad \lambda_n = \frac{n\pi }{L}\quad n\in \mathbb{Z}
$$

Where, the coefficients $A_n$, $B_n$ are the Fourier Coefficients. [[Fourier Series (PDE Flavor)]]

There is another basis function that people can choose to use. Which is [[Complex Fourier Series (PDF Flavor)]]. 

Basis function: 

$$
X_n(x) = \exp \left(
    i\lambda_n x
\right) \quad \lambda_n = \frac{n\pi}{L} \quad n \in \mathbb{Z}
$$

And the coefficient is given by: 

$$
c_n = \frac{1}{L}\int_{0}^{L} 
f(x) \exp \left(
    i\lambda_n x
\right)
dx
$$

The function $f(x)$ is the initial condition. 

See: [[Complex Fourier Series (PDF Flavor)]]. 

### **Non-Homogenous Dirichlet**

Simulates the ends are set to constant temperate but they are not the same temperate. 

$$
u(0, t) = T_1 \wedge u(0, t) = T_2
$$

And it's not hard to see that the steady state solution will be: 

$$
u_s(x, t) = \frac{T_2 - T_1}{L}x + T_1
$$

And this is the homogenous solution of the system, it will set $\partial_t$ into zero. 

And it's not hard to see that the solution is a decomposition of 2 functions: 

$$
u(x, t) = u_n(x, t) + u_s(x, t)
$$

And notice that $u(x, t) - u_n(x, t)$ is Dirichlet boundary conditions, therefore, we can solve it with Dirichlet boundary conditions and add back the Homogenous solution to get the full solution of the Equation. 

---
### **Wave Equation**

Simulates: A vibrating string. 

$$
\partial_t^2[u] = c^2\partial_x^2[u]
$$




