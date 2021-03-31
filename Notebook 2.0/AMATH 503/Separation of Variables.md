Let's learn the method of separation of variable and apply to the heat equation. 
The heat equation is introduced here: [[ODEs, PDEs Intro]], and we are using the same set up in this file as well. 

See more about it here: [[Heat Equations]], which is introduced in amath 501 before. 

And, the procedure of using Separation of variables involves the usage of Fourier Series, then we need: [[Fourier Transform Fourier Series]] to hep us out. 

---
### **Intro**

This is chapter 3 in the lecture notes, you **must read** it. 

Separation of Variable, it works in the case when the boundary conditions is zero. 

If a solution is not separable, but we did it anyway, we might get infinitely many solutions such that the super position of such solution is going to give us the true solution, which is non-separable. 

**Note**: 
For the class, you don't have to show everything when solving ODEs, it's assumed that you know it so well that you can do it with eyes closed. Just stated he results and it will be fine. 

---
### **Separation of Variables: Setting things up**

Let's say that the solution is the product of 2 functions, then it will be like: 

$$
u(x, t) = X(x)T(t)
$$

It's like, there is a function that evolves with along the time dimension, and then scaled by another function, as the time variable changes. 

The PDE is: 

$$
u_t = c^2u_{xx} \quad 0 < x < L \quad t> 0
$$

The initial condition is: 

$$
u(x, 0) = F(x) 
$$

Where we keep the generality by assuming the initial condition distribution function $F(x)$. 

And the boundary condition is:

$$
u(0, t) = u(L, t) = 0
$$

For the separation variable to work, the boundary will have to be zero. 
**What if we are using fahrenheit**? The method of separation of variable won't work for this boundary conditions. If, the boundary condition is fixed with the same value, then we can make a substitution, say $v = u - 32$, so the boundary condition is fixed at zero. 

Let's summarize the procedure: 

1. Assume that $u$ is the product of 2 functions like: $X(x)T(x)$, for this PDE, it works well.
2. Substitute the separation form into the equation. 
3. After separation, set everything to an undetermined constant. Try different cases for the constant. 


---
### **Separation and Substitution**

$$
u_t = T'(t)X(x) \quad u_{xx} = X''(x)T(t)
$$

Then the PDE is going to be: 

$$
T'(t)X(x) = c^2X''(x)T(t)
$$

$$
\frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)}
$$

The LHS, and the RHS are solely expressed wrt to $T(t), X(t)$, and means, it has been separated. 

Notice that, this is function equality, a function of time equals to a function of space for all possible value of $t, x$, and this means that they both equals to a constant, giving us: 

$$
\frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)} = K
$$

When it's separated, this statement can be applied. Notice that $K$ can be positive, negative, or zero. Hint: try $K = -\lambda$ where $\lambda$ is real. We assume that $K < 0$, this is the one that works and gives us non-trivial solution to the system. 

Solving it we should be able to get: 

$$
\begin{cases}
    X''(x) + \lambda^2 X(x) = 0
    \\
    T'(t) + c^2\lambda^2T(t) = 0
\end{cases}
$$

And we have 2 ODEs. $c^2$ is the thermal conductivity. However, we need to determine what $\lambda^2$ is to get the solutions for the system. Solve the first one to get $\lambda^2$ and then we solve the second one with known $\lambda^2$. 

**Solving the first ODEs**

The boundary conditions said that: 

$$
X(0)T(t) = X(L)T(t) = 0 \quad \forall \;t
$$

Which means that: 

$$
X(0) = X(L) = 0
$$

Assuming **non-trivial solution** (The solution is not all zeros). 

Solving the first ODE, we will have the solution: 

$$
X(x) = A\sin(\lambda x) + B\cos(\lambda x)
$$

**Applying Boundary Conditions**

$$
X(0) = 0 \implies A\sin(0) = B\cos(0) = 0 \implies B = 0
$$

Solving the other boundary condition, we have: 

$$
A\sin(\lambda L) = 0
$$

Assuming non-trivia solution, then $A\ne 0$, then we have: 

$$
\sin(\lambda L) = 0 \implies \lambda_n = \frac{n\pi}{L} \forall \; n\in \mathbb{N}
$$

And $\lambda_n$ are called the eigenvalues, and for each value of $\lambda_n$ there is a eigenfunction associated with it. The function will be like: 

$$
\sin \left(
    \frac{n\pi x}{L}
\right)
$$

Yeah, it's just a bunch of harmonics, and there are a lot of them, depending on the initial conditions, which determine the initial harmonics. 

**Solving for The Time Function**

$$
T'(t) + c^2\lambda^2T(t) = 0
$$

For each $\lambda_i$, there is a solution for $T(t)$, and there will be a lot of them, hence we have: 

$$
T_n'(t) + c^2\lambda_n^2T_n(t) = 0
$$

And then we should get: 

$$
T_n(t) = T_n(0)\exp\left(-
    \left(
        \frac{cn\pi}{L}
    \right)^2t
\right)
$$

use the substitution that 

$$
\tilde{t} = \left(
    \frac{L}{c\pi}
\right)^2 \implies T_n(\tilde{t})
=
T_n(0)\exp \left(
    \frac{-n^2t}{\tilde{t}}
\right)
$$

**Combining the Time and Space Solutions**

$$
u_n(x,t) = T_n(0)\exp\left(
    \frac{-n^2t}{\tilde{t}}
\right)
\sin \left(
    \frac{n\pi x}{L}
\right)
$$

And this is the solution for the given equation, however, this is just one of them, a more generation solution for the PDE will be summing up for all the possible $\lambda_n$, which is just: 

$$
u(x,t) =
\sum_{i = 1}^{\infty}
 T_n(0)\exp\left(
    \frac{-n^2t}{\tilde{t}}
\right)
\sin \left(
    \frac{n\pi x}{L}
\right)
$$


**Taking in the Initial Conditions**

To satisfy the initial conditions, we have initial conditions gonna be like: 

$$
F(x) = u(x,t) =
\sum_{i = 1}^{\infty}
 T_n(0)\exp\left(
    \frac{-n^2t}{\tilde{t}}
\right)
\sin \left(
    \frac{n\pi x}{L}
\right)
$$

And take notice that, if we decompose the initial conditions into a Fourier Sine Series, then we will have this. 
 
And, solving this with Fourier Series, we will get the solution, but we are skipping it here. 

**Notice that**, the exponent of the $\exp$ is getting super negative as $n\rightarrow \infty$ (very fast decay as $t\rightarrow \infty$), this means that, as time moves on, the shape of the solution is dominated by features of low frequencies harmonics, making the heat distribution getting smoother and smoother. 

