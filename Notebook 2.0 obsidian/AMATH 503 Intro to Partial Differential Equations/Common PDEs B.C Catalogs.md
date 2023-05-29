Here, we will be summarizing the following: 
1. Boundary Conditions
2. Basis Function 
3. Overview on Solution Process
for: 
Heat Equation, Wave Equation. 

And, one of the most important concept we put into practice for the first part of the quarter seems to be: 
[[Separation of Variables for Heat and Waves in 1D]]

---
### **Intro**
We talk about the boundary conditions for common PDEs and their physical interpretations. 

---
### **The Heat Equation**

Consider $\partial_t[u]= c^2\partial_x^2[u]$, a PDE in the form of a heat equation, $c$ is conductivity. We consider boundary conditions on the domain $[0, L]$. 

#### **Dirichlet Boundary Condition | Same Fixed Temp at both Ends**

We introduce *Homogeneous Type I* Boundary condition. It simulates when both ends of the rod is at the same fixed temperature: $u(0, t) = u(L, 0) = 0$. Then via separation of variables we have basis functions

$$
X_n(x) = \sin\left(
    \lambda_n x
\right)
\quad \lambda_n = \frac{n\pi}{L} \quad n\in \mathbb{N},
$$

Fourier consine series is required, see [[Fourier Sine Series, PDEs Flavor]] on how to fill in the fourier Sine series coefficients from the initial conditions. 

#### **Neumann Boundary Conditions | Insulated Both Ends**

Simulates when both ends of the rod is heat insulated, B.C written as $\partial_x[u](0, t) = \partial_x[u](L, t) = 0$. And in this case, the basis function for spatial domain is: 

$$
X_n(x) = \cos\left(
    \lambda_n x
\right) \quad \lambda_n = \mathbb{Z}_{\ge 0}, 
$$ 

And the coefficients is given by the Coefficients of the Fourier Series Cosine of the initial conditions. 

#### **Periodic Boundary Condition**

Simulates heat conduction in a ring, so that both ends of the rod connect to itself. Meaning that the temperate equals and the flow of the is the same at both sides. The ring is model by an closed  symmetric interval: $[-L, L]$, where $x = \pm L$ represent the same point on the rod, we write the boundary conditions: $u(-L, t) = u(L, t) \wedge \partial_x[u](L, t) = \partial_x[u](-L, t)$, and we have the basis functions

$$
X_n(x) = A_n\sin(\lambda_n x) + B_n\cos(\lambda_n x) \quad \lambda_n = \frac{n\pi }{L}\quad n\in \mathbb{Z}
$$

Where, the coefficients $A_n$, $B_n$ are the Fourier Coefficients. See [[Fourier Series, PDE Flavor]] on how to get the ceofficients from the initial conditions. There is another basis function that people can choose to use. Which is [[Complex Fourier Series, PDF Flavor]], it's the same thing but using complex numbers to simplify the mathematics. We have basis functions: 

$$
\begin{aligned}
    X_n(x) &= \exp \left(
        i\lambda_n x
    \right) \quad \lambda_n = \frac{n\pi}{L} \quad n \in \mathbb{Z}    
    \\
    \text{where }
    c_n &= \frac{1}{2L}\int_{-L}^{L} 
    f(x) \exp \left(
        i\lambda_n x
    \right)
    dx,
\end{aligned}
$$

assuming that the function $f(x)$ is the initial condition. 

#### **Non-Homogeneous Dirichlet | Different Constant Temp on Boundary** 

It simulates the ends are set to a constant temperate but they are not the same temperate. B.C given as $u(0, t) = T_1 \wedge u(0, t) = T_2$. A steady state solution can be computed by setting $\partial_t u(x, t) = 0$, and then solve for the function $u(x, \cdot)$ using the boundary conditions, which gives us: $u_s(x, t) = \frac{T_2 - T_1}{L}x + T_1$. To solve it, we need to decompose the solution into 2 functions, the steady state solutions, and the solutions on top of the steady state solution, we do $u(x, t) = u_n(x, t) + u_s(x, t)$ by the fact that differential operators are linear operators. Notice that $u(x, t) - u_n(x, t)$ not has Dirichlet boundary conditions, with fixed temperature, reducing the problem to a previous case. 

---
### **Wave Equation**

The wave equation simulates a vibrating string, PDE is given as $\partial_t^2[u] = c^2\partial_x^2[u]$. Differs from the heat equation, the wave equation requires 2 initial conditions, it needs $\partial_x u(x, 0), u(x, 0)$ for $x\in(0, L)$, it represents the initial position and velocities for particles on the string. 

#### **Dirichlet Boundary Condition**

The boundary conditions corresponds to the physical interpretation of a string which both ends are fixed, at the same height $0$. The initial conditions contain both the velocity and position, which means that both $u(x, 0), \partial_t[u](x, 0)$ needs to be defined for as a function of $x$ on the interval $(0, L)$. The B.C is written as: $u(0, t) = u(L, t) = 0$. The basis function for the spatial domain is: 

$$
X_n(x) = \sin(\lambda_n x) \quad \lambda_n = \frac{n\pi }{L} \quad n \in \mathbb{N}
$$

The full solution this boundary conditions for the dimensionless form is discussed in: [[Separation of Variables for Heat and Waves in 1D#Wave Equation Example 1D fixed Ends]].


#### **One end Fixed Boundary Condition**

This is explored in HW 2, where one end of the string is fixed while the other end is free to move. Such a system has boundary conditions $u(0,t) = \partial_x[u](L, t) = 0$. With the basis function in the spatial domain: $X_n(x) = \sin(\lambda_n x)$. The lambda is different, and please consult HW2 Questions 4 to know why, lambda is: 

$$
\lambda_n = \frac{n\pi}{L} + \frac{\pi}{2L} = \frac{(2n + 1)\pi}{2L}\quad \lambda_n = \mathbb{Z}_{\ge 0},
$$


which will assert that $\cos(\lambda_n L) = 0$. And for the time domain, the basis function must be compared with the initial conditions. 

$$
\begin{aligned}
    \frac{T''}{T} &= -\lambda_n^2\implies T = A_n \sin(\lambda_n t) + B_n\cos(\lambda_n t)
    \\
    \text{with I.C: }& 
    \\
    u(x, 0) &= f(x) \quad \partial_t[u](x, 0) = g(x), 
\end{aligned}
$$

Givin g use the following form of the for the time domain eigen components: 

$$
\begin{aligned}
    \sum_{n = 0}^{\infty}
    T_n(0)\sin(\lambda_n t) &= f(x)
    \\
    \sum_{n = 0}^{\infty}
        T_n'(0)\sin(\lambda_n t) &= g(x)
    \\
    \text{where: }  
    T_n(0) = B_n \quad T'(0) &= A_n\lambda_n
\end{aligned}
$$

And hence, $B_n$ is the *ODD Fourier Sine Coefficients* of $f(x)$ and $A_n\lambda_n$ over an larger interval of $[0, 2L]$. If the initial conditions cannot be represented with only odd indices for the Fourier Sine Series, we have a problem, and it's probably some physical scenario that is impossible. Yes, this is weird. But if $f(x) = 1$ and $g(x) = 0$ we are saved because that means $A_n = 0$ and $B_n$ is defined because $1$ only needs the odd harmonics of sine. 

