Let's learn the method of separation of variable and apply to the heat equation. 
The heat equation is introduced here: [[ODEs, PDEs Intro]], and we are using the same set up in this file as well. 

See more about it here: [[Heat Equations]], which is introduced in amath 501 before. 

And, the procedure of using Separation of variables involves the usage of Fourier Series, then we need: [[Fourier Transform Fourier Series]] to hep us out. 

Reference Materials: Chapter 4 of the Course Notes. 

---
### **Intro**

This is chapter 3 in the lecture notes, you **must read** it. 

Separation of Variable, it works in the case when the boundary conditions is zero. 

If a solution is not separable, but we did it anyway, we might get infinitely many solutions such that the super position of such solution is going to give us the true solution, which is non-separable. 

**Note**: 
For the class, you don't have to show everything when solving ODEs, it's assumed that you know it so well that you can do it with eyes closed. Just stated he results and it will be fine. 

---
### **Separation of Variables: Setting things up (Dirichlet Boundary Conditions, Heat Equation)**

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

>$$
>u(0, t) = u(L, t) = 0
>$$

For the separation variable to work, the boundary will have to be zero. 
**What if we are using fahrenheit**? The method of separation of variable won't work for this boundary conditions. If, the boundary condition is fixed with the same value, then we can make a substitution, say $v = u - 32$, so the boundary condition is fixed at zero. 

Let's summarize the procedure: 

1. Assume that $u$ is the product of 2 functions like: $X(x)T(x)$, for this PDE, it works well.
2. Substitute the separation form into the equation. 
3. After separation, set everything to an undetermined constant. Try different cases for the constant. 


---
### **Dirichlet Boundary Conditions (Heat Equation)**
#### **Separation and Substitution**

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
\tag{1}
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
\tag{2}
$$

Solving the other boundary condition, we have: 

$$
A\sin(\lambda L) = 0
$$

Assuming non-trivia solution, then $A\ne 0$, then we have: 

$$
\sin(\lambda L) = 0 \implies \lambda_n = \frac{n\pi}{L} \forall \; n\in \mathbb{N}
$$

And $\lambda_n$ are called the eigenvalues, and for each value of $\lambda_n$ there is a Basis Function associated with it. The function will be like: 

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
F(x) = u(x,0) =
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


---
### **Neumann Boundary Conditions (Heat Equation)**

Here, we are assuming the **Neumann Boundary** conditions for the system. And it's used to represent the rods that has both ends insulated, so the heat is trapped here. 

Boundary Conditions: 

>$$
>u_x(x = L, t)=u_x(x=0, t) = 0 \quad \forall t > 0
>$$

And the initial conditions stays the same. When the derivative of the function is zero, it's saying that there is no diffusion of heat going on.

Let's just grab the results from expression (2), and then we can mix them with the above boundary conditions, so that is taking the derivative: 

$$
A\lambda\cos(\lambda x) - B\lambda\sin(\lambda x) = X'(x)
$$

So then we have: 

$$
X'(0)T(t) = 0
$$

So then $A = 0$, and then: 

$$
-B\lambda\sin(\lambda x) = 0 \implies \sin(\lambda x) = 0 \implies \lambda = \frac{n\pi}{L}\quad \forall n\in \{0, 1, 2, \cdots\}
$$

**However, there is another case where** $B\lambda = 0$...? 

If $\lambda != 0$, and the $B = 0$, then $A = 0$, hence we have the trivial solution of $X(x) = 0$. When $\lambda =0$, $X(x) = B$, we have a constant function for the spatial solution, which is not a trivial solution, therefore, the case where $\lambda = 0$ is included.  

We had the same set of eigenvalues, but where is the eigen functions for the system? 

It's there because: 

$$
X(x) = B\cos(\lambda x)
$$

And then, we have the Basisfunction To be $\cos$ in this case. And we are normalizing it as just $\cos$.

By principal of super position, the solution is going to take the form: 

$$
u(x, t) = 
\sum_{n = 0}^{\infty}
T_n(0)\exp
\left(
    - \frac{-n^2t}{\tilde{t}}
\right)
\cos\left(
        \frac{n\pi x}{L}
    \right)
$$


---
### **Periodic Boundary Conditions (Heat Equation)**


let's pick up from the ODEs system from expression one, right after the assumption of the separation of variables. 

he **Boundary Condition** is: 

> $$
> u(L, t) = u(-L, t) \quad \forall t > 0 \tag{4}
> $$

And because heat is going to flow through the point, the derivative will also has to be equal to each other: 

$$
u_x(L, t) = u_x(-L, t) \qquad \forall t > 0 \tag{5}
$$

let's connect it back to the system of ODEs, together with the combined boundary conditions, we will have: 

$$
\begin{cases}
    X''(x) - kX(x) = 0    \\
    X(L) = X(-L)  \\
    X'(L) = X'(-L)
\end{cases}\tag{6}
$$

The periodic Boundary conditions now has been included with a system equations.  

As usual connection of the Eigenvalues $\lambda$ and the constant $k$ is: 

$$
k = -\lambda^2
$$

We are interested in search for the non-trivial solutions for this boundary conditions, and related it to the Fourier Series. 

The solution we can draw from the first expression of (1) is: 

$$
X(x) = A\sin(\lambda x) + B\cos(\lambda x) \quad X'(x) = A\lambda \cos(\lambda x) + A\lambda \sin(\lambda x) \tag{7}
$$

**The temperature at the point equals**. 

Using the boundary conditions: $u(-L, t) = u(L, t)\forall t> 0$, we have: 

$$
(A\sin(\lambda L) + B\cos(\lambda L))T(t) = 
T(t)(-A\sin(\lambda L) + B\cos(\lambda L)) \quad \forall t> 0
\tag{9}
$$

The negative sign get ignored by $\cos$ because it's an even function. 

Assume that $T(t)\ne 0\;\forall t >0$, then we can divide by that and then get: 

$$
-2A\sin(\lambda L) = 0\underset{A\ne 0}{\implies} \lambda_n = \frac{n\pi}{L} \;\forall n\in \mathbb{Z}_{\ge0}
\tag{10}
$$

Take note that $n = 0$ is ignored because it's a trivial solution to the system, where $X(x) = 0$. 

For each solution to this system, we have a solution of $X_n(x)$. 

**Heat passes through at the point $x = \pm L$**

Using $u_x(-L, t)  = u_x(L, t)$, so then we have: 

$$
\lambda T(t) (A\cos(\lambda L) - B\sin(\lambda L)) = 
\lambda T(t) (A\cos(\lambda L) + B\sin(\lambda L)) \quad \forall t > 0
\tag{11}
$$

We get a similar result compare to expression (10), which is: 

$$
-2B\sin(\lambda L) = 0\underset{B\ne 0}{\implies} \lambda_n = \frac{n\pi}{L} \;\forall n\in \mathbb{Z}_{\ge0}
\tag{12}
$$


**Note**, the case where $\lambda = 0$ won't need the assumption that $A, B\ne 0$ to satisfy the boundary conditions. This is kinda weird. 

So then, we will have a lot of basis function, each associated with a positive integer $n$, and the solution will be a super position of all of them: 

$$
X_n(x) = A_n\sin\left(
    \frac{n\pi x}{L}
\right) + B_n\cos \left(
    \frac{n\pi x}{L}
\right)
\tag{13}
$$

Notice that, we are not taking the normalized version of this as the basis function, because this time, the basis functions consists of 2 function, so we are keeping the constant coefficients for both of them. 

Now we skip some steps that has already be covered in the separations of variable parts and solving for $T(t)$, then the solution is going to take the form: 

$$
\sum_{i = 0}^{\infty}
\left(
    A_n\sin\left(
        \frac{n\pi x}{L}
    \right) + 
    B_n \cos \left(
        \frac{n\pi x}{L}
    \right)
\right)\exp \left(
    \frac{-n^2 t}{\widetilde{t}}
\right)
$$


Where is the constant term: $T_n(0)$? 

It's distributed into the coefficients $A_n, B_n$, and we will see those coming in [[Fourier Series (PDE Flavor)]]. 

---
### **Mixed Boundary Conditions (Heat Equation)**

The rod is insolated on one size and the temperature is fixed on the other side. 

---
### **Nonhomogenous Dirichlet Boundary Conditions (Heat Equation)**

The boundary condition is: 

$$
u(0, t) = t_1 \quad u(L, t) = t_2 \quad \forall t
$$

In this case, we must transform the problem into a homogenous Dirichilet by identifying the steady state solution to be: 

$$
u_s(x, t) = \frac{(t_2 - t_1)}{L}x + t_1
$$

A straight line connecting between these 2. 

Now, the solution to the PDE can be written as an overposition of the steady states solution and some other harmonics upon that, hence: 

$$
u(x, t) = u_s(x, t) + u_h(x, t)
$$

And then for the Extra Harmonic parts, $u_h$, it will have Dirichlet Boundary condtion. 

Solve for $u_h(x, t)$ and then use that add back the $u_s$ to get the full solution for the system. 

For the harmonic problem, the boundary condition is Dirichilet. 

---
### **Heat Equation Infinite Domain** 





---
### **Only Heat Equation**? 

This is not true, heat equation is one of the example, and wave equation can also be solved using S.F.V. 

