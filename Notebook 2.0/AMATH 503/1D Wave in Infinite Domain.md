[[Fourier Transform (PDE Flavor)]]
One of the very important application of Fourier Transform is its application to Solving PDEs in the infinite domain. 


---
### **Intro**

We are going to solve the **wave equation** on the **infinite domain** using the **method of Fourier Transform**. 

Yes, the only thing we changed is the boundary conditions, because now it's on infinite domain. 

Suppose that that we are modeling the guitar string with: 

$$
\begin{cases}
    u_{tt} - c^2u_{xx} = 0 & x\in \mathbb{R}
    \\
    \lim_{x\rightarrow \pm \infty }u = 0
    \\
    u(x, 0) = f(x) & u_t(x, 0) = \underbrace{0}_{g(x)}
\end{cases}
$$


This is the wave equation on infinite domain. 

**Separating the Initial Conditions**

Notice that, the PDE problem is linear, hence we can separate the problem into 2 parts. Let's separate the initial conditions into 2 parts by thinking of the following: $u = u_1 + u_2$

$$
\begin{cases}
    u_1(x, 0) = f(x) & \partial_t[u_1](x, 0) = 0
    \\
    u_2(x, 0) = 0 & \partial_t[u_2](x, 0) = g(x)
\end{cases}
$$

This is in the general cases where, the initial conditions contains both the initial conditions and the derivative information, and in that case that is why we need the above separations for the general case. 

**Note**:

$f(x)$ must be: **Absolutely Integrable**. So that means that integral over the whole domain of the solution must be some finite number. And the boundary at infinite is still going to reach zero because the function we are integrating is absolutely integrable, and shifting it left and right by finite amount of $t$ is not going to break Fourier Transform. 

---
### **Fourier Transform**

**DO NOTE USE: Separation of Variables** for these type of PDE on an infinite domain. 

Engenfunctions for the SV is because there is a boundary, the barrier, and it forces the shape of those eigen functions. However, under infinite domain, they are not discrete anymore, because we are considering limits for the boundary conditions. And the results is expressed in term of the initial conditions. 

**Introducing**: d' Alembert's method: 
It's made for just the above PDE equation, not applicable to anything else. 

**Back onto topic**: Fourier Transform

Here is the list of procedures we use to get the solution for the PDE: 
1. Take the equation to the Fourier Domain so it's an ODE in term of $t$ and $w$. 
2. Use the $u_t(x, 0) = 0$ get the solution format, in the Fourier Domain. 
3. Use the $u(x, 0) = f(x)$ to get the undetermined coefficients for the system, in the fourier domain. 
4. Do the Inverse Fourier Transform to get the solution in the original spatial domain. 

**Questions**: 

What is the Fourier Transform for the $u(x,t)$ function? Notice that we have a function of 2 variables here instead of one, but the FT we did is univariate function. 

Transform along the spatial dimension, on variable $x$ to frequency domain with variable $w$. 

$$
\mathcal{F}[u(x, t)](w, t) = \int_{-\infty}^{\infty} 
    u(x, t)\exp(iwx)
dx = \hat{u}(w, t)
$$

And hence the Inverse Fourier Transform is also defined. It's not hard to see that: 

$$
u(x,t) = \mathcal{F}^{-1}[u(w, t)] = 
\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \hat{u}(w, t)\exp(-iwx)
dw
$$

We are going to use the inverse Fourier on the Frequency domain to simplify the PDEs. 

Now are going to represent the differential from the original PDE in terms of the Transformed function in the $w$ domain: 

$$
\partial_t^2[u](x, t) = \partial_t^2
\left[\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \hat{u}(w, t)\exp(-iwx)
dw\right] = 
\int_{-\infty}^{\infty} 
    \partial_t^2[\hat{u}](w, t)\exp(-iwx)
dw \tag{1}
$$

The derivative moves in because the integrator is not wrt to the variable $t$. 

At the same time if we take the derivative wrt to $x$ we have: 

$$
\partial_x[u](x, t) = \partial_x
\frac{1}{2\pi}\int_{-\infty}^{\infty} 
    \hat{u}(w, t)\exp(-iwx)
dw
\tag{2}
$$

The $\partial_x$ goes into the integral and act on the exponential function:

$$
\partial_x[u](x, t) = 
\frac{1}{2\pi}\int_{-\infty}^{\infty} 
    (-iwx)\hat{u}(w, t)\exp(-iwx)
    dw
= 
(-iw)\hat{u}(w, t)
\tag{3}
$$

Taking the differential is the same as applying a scalar multiplication of $-iw$ on the Fourier domain function. 

A very similar things can be said about the double differential which is just

$$
\mathcal{F}[\partial_{xx}[u]](w, t) = w^2\hat{u}(w, t) 
\tag{4}
$$

The key here is that, under the Fourier domain, the time derivative is still just a derivative wrt to time, but the spatial derivative, we have a constant multiplier instead of derivative. 

Hence in the frequency domain we obtain the expression that:[^1]

$$
\partial_{t}^2[\hat{u}](w, t) + c^2w^2\hat{u}(w, t) = 0
\tag{5}
$$

If we fix the quantity $w$, we have a ODE that is purely in term of time. Notice that, we can get the solution form for the function $\hat{u}(w, t)$, which is: 

$$
\hat{u}(w, t) = 
A\sin(cwt) + B\cos(cwt)
$$

**Note**: The constant $A, B$ are both functions of $w$, this part is important, and because we are not solving for coefficients for each natural numbers like we did for the separation of variables anymore, here we will be solving for a function that is wrt to $w$. 


**Time Derivative Initial Conditions**: 

$$
u_t(x, 0) = 0
$$

$$
\mathcal{F}^{-1}[\hat{u}_t](w, 0) = 0
$$

$$
\implies \hat{u}(w, 0) = 0
$$

And at the same time, we have the solution form for $\hat{u}(w, t)$, which means that: 

$$
\hat{u}(w, t) = Acw\cos(cwt) - Bcw\sin(cwt) = 0\implies A = 0
$$

So then: 

$$
\hat{u}(w, t) = B\cos(cwt)
$$

**Displacement Initial Condition**

But at the same time, the other part of the initial conditions is informing us that: 

$$
u(x, 0) = f(x)
$$

And it's been show that: 

$$
\mathcal{F}^{-1}[\hat{u}](x, t = 0) = f(x)
$$

So then we can take the Fourier transform on both side and we have: 

$$
\hat{u}(w, 0) = \underbrace{\mathcal{F}[f](w)}_{F(w)}
$$

And this is why we want to function $f(x)$ to be absolutely integrable just to be safe. We assume that the Fourier Transform has been applied and the function turns out to be $F(w)$. 

So then we know that: $\hat{u}$ equals to the Fourier transform of $f(x)$ and at the same time, we know that it's $B\cos(cwt)$. 

Take notice of the following: 

$$
\hat{u}(w, 0) = \mathcal{F}[f](w) \quad \hat{u}(w, 0) = B\cos(cwt) \implies 
B_w = \mathcal{F}[f](w)
$$

Now, we have the solution the Fourier Domain, but, we want the solution in the original space, which is just one inverse Fourier Away: 

$$
u(x, t) = \mathcal{F}[\hat{u}](x,t) = 
\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    F(w)\cos(cwt)\exp(-iwx)
dw
$$

Take note that we can use the Euler Formula to help us to write the trig function in a different form for this problem, at the same time, notice that $F(w)$. 

So this is like: 

$$
\cos(cwt) = \frac{1}{2}\left(
    \exp(icwt) + \exp(-icwt)
\right)
$$

Multiplying it into the expression we have: 

$$
u(x, t) = \frac{1}{4\pi}\int_{-\infty}^{\infty} 
    F(w)\exp(\underbrace{iwx + icwt}_{iw(x + ct)})
dw 
+ \frac{1}{4\pi}\int_{-\infty}^{\infty} 
    F(w)\exp(\underbrace{iwx - icwt}_{iw(x - ct)})
dw
$$

And notice that, this is the inverse Fourier Transform which can be expressed like (After some non-trivial math): 

$$
u(x, t) = \frac{1}{2}(f(x + ct) + f(x - ct))
$$

And that, is the solution to the PDE. 

**Questions**: Why we didn't use the Boundary Conditions? 

Because the initial condition helped us to satisfies that part, the function is absolutely integrable, so whatever Fourier Transformations that are involved for this PDEs, it's going to keep that part. And for a function that is absolutely integrable, it will have to have limit that approaches zero as it goes to infinity.

---
### **An Alternative**: D Alambert's method

Let's consider a more general formulaitons of the wave equation under the infinite domain, and it's: 
 
$$
\begin{cases}
    u_{tt} - c^2u_{xx} = 0 & x\in \mathbb{R}
    \\
    u(x, 0) = u_0(x) & u_t(x, 0) = v_0(x)
\end{cases}
\tag{6}
$$

General solution is: 

$$
u(x, t) = \underbrace{f(x + ct)}_{\text{Backward traveling wave}} + \underbrace{g(x - ct)}_{\text{Forward Traveling wave}}
$$

Let's determine what is $f, g$ in the general solution. 

Consider the differential operator in a more flexible way: 
$$
\begin{aligned}
    (\partial_t^2 - c^2\partial_x^2)[u] &= 0
    \\
    (\partial_t - c\partial_x)(\partial_t + c\partial_x)[u]
    &= 0
\end{aligned}
$$

Consider a change of variable: 

$$
\xi = x - ct \quad \eta = x + ct
$$

Consider experssing $\partial_t, \partial_x$ using the new variable giving us: 

$$
\begin{aligned}
    \partial_t &= \frac{\partial\xi}{\partial t}\frac{\partial}{\partial\xi}
    + 
    \frac{\partial \eta}{\partial t}\frac{\partial }{\partial\eta}
    \\
    & =-c \frac{\partial}{\partial \xi} + c \frac{\partial}{\partial \eta}
    \\
    &= (\partial_\eta - \partial_\xi)
\end{aligned}
$$

This is just using multi-variable chain rule. Similarly for $\partial_x$. And remember that differential operator are reduced using $\xi = x - ct, \eta = x + ct$. 

$$
\begin{aligned}
    \partial_x &= \frac{\partial \xi}{\partial x}\frac{\partial}{\partial \xi} + \frac{\partial \eta}{\partial x}\frac{\partial }{\partial \eta}
    \\
    &= \partial_\xi + \partial_\eta
\end{aligned}
$$

Using these we can make simplification and get: 

$$
\begin{aligned}
    (\partial_t - c\partial_x)(\partial_t + c\partial_x)[u]  &= 0
    \\
    -4c^2\partial_{\xi\eta}[u] &= 0
    \\
    \implies \partial_\eta u &= h_1(\eta)
    \\
    \implies \int \partial_\eta [u] d\eta 
    &= \underbrace{\int_{}^{}h_1(\eta) d\eta}_{q(\eta)} + p(\xi)
    \\
    u(\xi, \eta) = q(\eta) + p(\xi)
\end{aligned}
$$

And here we are just taking the integral wrt to $\xi, \eta$, in that order. And then the constant is a function wrt to $\eta$ for the first integral and $\xi$ for the second. Because, $p(\eta)$ independently wrt to $\xi$. 

Now, incooperating the initial conditions we have: 

$$
\begin{cases}
    u(x, 0) = f(x) = q(x) + p(x) &
    \\
    \partial_t[u](x, 0) = 0 = c(q'(x) - p'(x))& 
\end{cases}
$$

Try solving it. Starting it with taking the derivative on the first expression and then solving it like linear system of equation wrt to $p'(x)$ and $q'(x)$. 

$$
q(x) = \frac{1}{2}f(x) + B \quad p(x) = \frac{1}{2}f(x) - B
$$

And then the final expression will be: 

$$
u(x, t) = P(x + ct) + q(x - ct) = \frac{1}{2}(f(x + ct) + f(x - ct))
$$




[^1]: Just adds up all the above equations (1), (3), (4), and then using the fact that the fourier transform is linear, then we can have the expression (5). Don't forget the negative sign of $(iw)^2$ there. 