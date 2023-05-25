Let's learn the method of separation of variable and apply to the heat equation. 
The heat equation is introduced here: [[ODEs, PDEs Intro]], and we are using the same set up in this file as well. See more about heat equation here: [[Heat Equations]], which is introduced in AMATH 501 before. And, the procedure of using Separation of variables involves the usage of Fourier Series, then we need: [[Fourier Transform Fourier Series]] to hep us out. 

**Reference Materials**: Chapter 4 of the Course Notes. 

---
### **Intro**

Separation of Variable, it works in the case when the boundary conditions are fixed to zero. If a solution is not separable, but we did it anyway, we might get infinitely many solutions such that the super position of such solution is going to give us the true solution, which is non-separable. 

---
### **Separation of Variables | Setting things up (Dirichlet Boundary Conditions, Heat Equation)**

Assume solution is the product of 2 functions in form of $u(x, t) = X(x)T(t)$, depicts a function that evolves along the time dimension, scaled by another function that is parameterized by a point in space. we are interested in solving the PDE: 

$$
\begin{aligned}
    \begin{cases}
        u_t = c^2u_{xx} \quad \forall  0 < x < L \quad t > 0, & \text{PDE}
        \\
        u(x, 0) = F(x)  \quad \forall 0 < x < L ,& \text{Initial Conditions}
        \\
        u(0, t) = u(L, t) = 0.& \text{Boundary Condition}
    \end{cases}
\end{aligned}
$$

**Constraints for Using the Method of Separations of Variables**
> The initial conditions in the interior of the domain is generic. For the separation variable to work, the boundary will have to be zero. Below we explain ways of handling constant boundary conditions.

Realistically, *What if we are using fahrenheit*, meaning that changing the unit will change the temperature at the boundary. Then the method of separation of variable won't work for that boundary conditions directly. In this case the boundary condition is fixed with the same value, then we can make a substitution, say $v = u - 32$, so the boundary condition is fixed at zero. Hence, for all boundary conditions of a constant variable, we may use this method. 

**Summary**

1. Assume that $u$ is the product of 2 functions like: $X(x)T(x)$, for this PDE, it works well.
2. Substitute the separation form into the equation. 
3. After separation, set everything to an undetermined constant. Try different cases for the constant. 


---
### **Demonstrations with the Dirichlet Boundary Conditions | Heat Diffusion**

The Eigen Components of the Heat kernel is described via the boundary conditions for the PDEs. Directly observe
$$
\begin{aligned}
    & u = T(t)X(x)
    \implies 
    \begin{cases}
        u_t = T'(t)X(x)  
        \\
        u_{xx} = X''(x)T(t)
    \end{cases}
    \\
    & T'(t)X(x) = c^2X''(x)T(t)
    \implies 
    \frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)},
\end{aligned}
$$

ignore trivial solutions, and solutions with zeros in it, we divides $X(x)$ for all $x\in (0, L)$ above. The LHS, and the RHS are solely expressed wrt to $T(t), X(t)$, it has been separated. This equality holds for  $(x, t) \in ((0, L), (0, \infty))$, which means that they both equals to a constant.  

$$
\frac{T'(t)}{c^2} = \frac{X''(x)}{X(x)} = K,
$$

where $K$ can be positive, negative, or zero. we make the claim that we only need to try $K = -\lambda^2$ where $\lambda$ is real. We assume that $K < 0$, this is the one that works and gives us non-trivial solution to the system. Solving it we should be able to get: 

$$
\begin{cases}
    X''(x) + \lambda^2 X(x) = 0
    \\
    T'(t) + c^2\lambda^2T(t) = 0
\end{cases}
\tag{1}
$$

And we have 2 separable ODEs. $c^2$ is the thermal conductivity. However, we need to determine what $\lambda^2$ is to get the solutions for the system. Solve the first one to get $\lambda^2$ and then we solve the second one with known $\lambda^2$. 

**Remarks**

If we use other value for the constant $K$, then we can only get constant solutions, this is simply because solving it with $K \ge 0$ resulting in the trivial solution of exponential functions, which can never satisfies the given boundary conditions. 

#### **Solving the first ODEs | The spatial Domain**

Assuming non-trivial solution and using the boundary conditions, we have

$$
\begin{aligned}
    & X(0)T(t) = X(L)T(t) = 0 \quad \forall \;t    
    \\
    \implies & X(0) = X(L) = 0
    \\
    & \text{solves the first eqn in (1) }
    \\
    \implies 
    & X(x) = A\sin(\lambda x) + B\cos(\lambda x),
\end{aligned}
$$

where, $A, B$ are constants, we determine it by considering the boundary condition. It will be the case that $B = 0$, because
$$
\begin{aligned}
    & X(0) = 0 
    \\
    \implies &
    \sin(0) = B\cos(0) = 0 
    \\ 
    \implies & B = 0
    \\
    & X(L) = 0 
    \\
    \underset{B = 0}{\implies}
    & A\sin(\lambda L) = 0,
\end{aligned}
$$

then, it must be the cause that $\lambda L$ is a full period for $\sin$, if we assume nontrivial solution, and we index all solutions of $\lambda$ like $\lambda_n$, consider

$$
\begin{aligned}
    & \sin(\lambda_n L) = 0 \implies \lambda_n = \frac{n\pi}{L} \forall \; n\in \mathbb{N}
    \\
    \implies &
    X(x) = A_n\sin \left(
        \frac{n\pi x}{L}
    \right) \quad \forall x\in [0, 1]
\end{aligned}
$$

$\lambda_n$ are called the eigenvalues, and for each value of $\lambda_n$ there is a Basis Function associated with it. It's sometimes called the harmonics, their coefficient are determined by initial conditions, which determine the initial harmonics. 

#### **Solving for Second ODE | The Time Domain**

We index the coefficients $\lambda_n$, because it has already be paramaterized by the solutions for $X(x)$. For each $\lambda_n$, there is a solution for $T(t)$, and there will be a lot of them, hence we have: 


$$
\begin{aligned}
    & T_n'(t) + c^2\lambda_n^2T_n(t) = 0
    \\
    & T_n(t) = T_n(0)\exp\left(-
        \left(
            \frac{cn\pi}{L}
        \right)^2t
    \right)
    \\
    \text{let }&
    \tilde{t} = \left(
    \frac{L}{c\pi}
    \right)^2 \text{ then } T_n\left(\tilde{t}\right)
    =
    T_n(0)\exp \left(
        \frac{-n^2t}{\tilde{t}}
    \right)
\end{aligned}

$$

#### **Combining the Time and Space Solutions**

For each eigen components of $X(x)$, we have the individual solution $u_n(x, t)$, and the final full solution will be an super position of all such solution, by the linearity of the differential operators, therefore

$$
\begin{aligned}
    &
    u_n(x,t) = \exp\left(
    \frac{-n^2t}{\tilde{t}}
    \right)
    \sin \left(
        \frac{n\pi x}{L}
    \right)
    \\
    & 
    u(x,t) =
    \sum_{i = 1}^{\infty}
    T_n(0)A_n\exp\left(
        \frac{-n^2t}{\tilde{t}}
    \right)
    \sin \left(
        \frac{n\pi x}{L}
    \right)
    \\
    & 
    u(x, t) = 
    \sum_{i = 1}^{\infty}
        T_n(0)A_n
        u_n(x, t), 
\end{aligned}
$$

Name the constant parameters $T_n(0)A_n = C_n$, they are the constants for the eigen components, determined by the initial conditions of the PDE. 

**Taking in the Initial Conditions**

To satisfy the initial conditions, we solve

$$
\begin{aligned}
    F(x) = u(x,0) &=
    \sum_{i = 1}^{\infty} C_n\exp\left(
        \frac{-n^2 0}{\tilde{t}}
    \right)
    \sin \left(
        \frac{n\pi x}{L}
    \right)
    \\
    &= \sum_{ i = 1}^{\infty} 
    C_n \sin \left(
        \frac{n\pi x}{L}
    \right)
\end{aligned}
$$

And take notice that, if we decompose the initial conditions into a Fourier Sine Series, then we will have this. And, solving this with Fourier Series, we will get the solution, but we are skipping it here. 

**Physical Interpretation**

The exponent of the $\exp$ is getting super negative as $n\rightarrow \infty$ (very fast decay as $t\rightarrow \infty$), this means that, as time moves on, the shape of the solution is dominated by features of low frequencies harmonics, making the heat distribution getting smoother and smoother. 


---
### **Neumann Boundary Conditions | Heat Trap**

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
### **Periodic Boundary Conditions | Heat on a Ring**


let's pick up from the ODEs system from expression one, right after the assumption of the separation of variables. 

he **Boundary Condition** is: 

> $$
> u(L, t) = u(-L, t) \quad \forall t > 0 \tag{4}
> $$

And because heat is going to flow through the point, the derivative will also has to be equal to each other: 

> $$
> u_x(L, t) = u_x(-L, t) \qquad \forall t > 0 \tag{5}
> $$

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

It's distributed into the coefficients $A_n, B_n$, and we will see those coming in [[Fourier Series, PDE Flavor]]. 

---
### **Mixed Boundary Conditions (Heat Equation)**

The rod is isolated on one size and the temperature is fixed on the other side.

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

Now, the solution to the PDE can be written as an superposition of the steady states solution and some other harmonics upon that, hence: 

$$
u(x, t) = u_s(x, t) + u_h(x, t)
$$

And then for the Extra Harmonic parts, $u_h$, it will have Dirichlet Boundary condition. Solve for $u_h(x, t)$ and then use that add back the $u_s$ to get the full solution for the system. For the harmonic problem, the boundary condition is Dirichlet: 

$$
u_h(0, t) = u_h(L, t) = 0
$$

---
### **Heat Equation Infinite Domain** 

No, Separation of variable cannot do this, you will bee Fourier Transform and Laplace Transform for this one to work.


---
### **Only Heat Equation**? 

This is not true, heat equation is one of the example, and wave equation can also be solved using S.F.V. 

---
### **Quick Overview on Wave Equation**

Wave equation is in the form 

$$
\partial_t^2u = \alpha^2\lambda_n^2T = 0
$$

For Diricilet boundary conditions: 

$$
T_n(t) = A_n\sin(\alpha\lambda_nt) + B_n\cos(\alpha\lambda_nt)
$$

For Neumann: 

$$
T_n(t) = A_n\sin(\alpha\lambda_nt) + B_ncos(\alpha\lambda_nt)
\quad T_0(t) = A_0 t + B_0
$$

Where, the case within the constant equals to zero cannot not be dropped out. 

To find the constant $A_n, B_n$ for $T$, we would need the initial conditions for the problem. 

---
### **Wave Equation Example: 1D fixed Ends**

Here we consider a general case where both end of the rod is fixed and we have a distribution for the initial velocity and displacement for all the particles on the string. 

$$
\begin{cases}
    \partial_t^2[u] = \partial_x^2[u] & 0 < x < 1 \wedge t > 0
    \\
    u(0, t) = u(1, t) = 0 & t > 0
    \\
    u(x, 0) = f(x)\quad \partial_t[u](x, 0) = g(x) & 0 < x < 1
\end{cases}
$$

Notice that, this is the dimensionless version of the PDEs. And we have the choice to substitue some constant to scale the spatial and time domain parameter $x, t$. 

Suppose that $u(x, t) = \sum_{n = 1}^{\infty}X_n(x)T_n(t)$ is a solution to the PDEs system. then, consider $\tilde{u}(x,t) = \sum_{n = 1}^{\infty}X_n(\frac{x}{L})T_n(\alpha t)$. 

Then: 

$$
\partial_t^2[\tilde{u}]  = \partial_t^2\left[ \sum_{n = 1}^{\infty}X_n\left(
    \frac{x}{L}
\right)T_n(\alpha t)\right] 
= 
\alpha^2 \sum_{n = 1}^{\infty}
    X_n(x)T_n''(\alpha t)
$$

At the same time the spatial derivative will be like: 

$$
\partial_x^2[\tilde{u}] = \partial_x^2 \left[
    \sum_{n = 1}^{\infty}X_n\left(
        \frac{x}{L}
    \right)T_n(\alpha t)
\right] 
= 
\frac{1}{L^2}\sum_{n = 1}^{\infty}X_n''\left(
        \frac{x}{L}
    \right)T_n(\alpha t)
$$

With substitution $\frac{x}{L} = y$ and $\alpha t = \tau$, the above expression will be expressed like: 

$$
\partial_t^2[\tilde{u}] = \alpha^2 \sum_{n = 1}^{\infty}X_n(y)T_n''(\tau) 
\quad 
\partial_x^2[\tilde{u}] = \frac{1}{L^2}\sum_{n = 1}^{\infty}
    X_n''(y)T_n(t)
$$

As $y$ goes from $0\rightarrow 1$, $x$ goes from $0\rightarrow L$. And as $\tau = t\alpha$. 

And this will mean that $\tilde{u}$ is the solution to the following IBVP: 

$$
\begin{cases}
    \frac{\partial_t^2[\tilde{u}]}{\alpha^2} = L^2 \partial_x[\tilde{u}] & 0 < x < L \quad t > 0
    \\
    \tilde{u}(0, t) = \tilde{u}(L, t) = 0 & t > 0
    \\
    \tilde{u}(x, 0) = f(x)\quad \partial_t[\tilde{u}]= g(x) & t > 0, \quad 0 < x < L
\end{cases}
$$

Hence, the solution to the original equation can be rescaled appropriately to solve any other IBVP with different coefficients on it.  

By sepration of variables, we have: 

$$
\frac{T''}{T} = \frac{X''}{X} = -\lambda_n^2
$$

ODE on the spatial dimension will be: 

$$
X'' + \lambda_n^2 X = 0 \implies X = A_n\sin(\lambda_n x) + B_n\cos(\lambda_n x)
$$

The boundary conditions assert that: 

$$
X(0) = 0 \implies B_n = 0 \quad X(1) = 0 \underset{B_n = 0}{\implies} A_n\sin(\lambda_n) = 0 \underset{A_n\ne 0}{\implies} \lambda_n = n\pi\quad n\in \mathbb{Z}_{> 0}
$$

The basis on the spatial dimension will be like: $X_n(x) = \sin(n\pi x)$. 

The solution on the time domain will be like: 

$$
T(t) = C_n\sin(\lambda_nt) + D_n\cos(\lambda_nt)
$$

Now, we are ready to use the initial condition to solve for the indetermined constants.

The initial conditions suggests that: 

$$
u(x, 0) = \sum_{n = 1}^{\infty}
    X_n(x)T_n(0) = f(x) \implies \sum_{n = 1}^{\infty} X_n(x)D_n = f(x)
$$

$$
\partial_t[u](x, 0) = \sum_{n = 1}^{\infty} X_n(x)T_n'(0) = g(x) 
\implies \sum_{n = 1}^{\infty}\lambda_n C_nX_n(x) = g(x)
$$

Here, we an use Fourier Series to solve the problem. More specifically: 

$$
D_n = 2 \int_{0}^{1} f(x)\sin(\lambda_n x) dx \quad \lambda_n = n\pi
$$

And

$$
\lambda_nC_n = 2 \int_{0}^{1} 
    g(x)\sin(\lambda_n x)
dx \quad \lambda_n = n\pi 
$$

Then then, we have the general solution to the original equation. 

---
### **Wave Equation 1D One end Un-attached**


