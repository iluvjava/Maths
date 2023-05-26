[[Fourier Transform, PDE Flavor]] One of the very important application of Fourier Transform is its application to Solving PDEs in the infinite domain. Materials referenced from [PDEchapter8](references/PDEchapter8.pdf), 8.4, additional information were presented by the instructor for the course. 

---
### **Intro**

We are going to solve the *wave equation* on the *infinite domain* using the *method of Fourier Transform* and *D'Alambert's Method*. The IVBP has the following form: 

$$
\begin{cases}
    u_{tt} - c^2u_{xx} = 0 & x\in \mathbb{R},
    \\
    \lim_{x\rightarrow \pm \infty }u(x, y) = 0 & \forall t \ge 0,
    \\
    u(x, 0) = f(x) & \forall x \in \mathbb R, 
    \\
    u_t(x, 0) = 0 & \forall x \in \mathbb R. 
\end{cases}
$$

it models waves in the domain of $(-\infty, \infty)$. The initial condition $f(x)$ describes the location of the particles at $t = 0$, the derivative information $u_t(x, 0)$ describes the speed the particles are moving at. 

**Separating the Initial Conditions**

Notice that, the PDE problem is linear, hence we can separate the problem into 2 parts: $u = u_1 + u_2$, such a substitution allows us to have simple to handle initial condtions: 

$$
\begin{cases}
    u_1(x, 0) = f(x) & \partial_t[u_1](x, 0) = 0
    \\
    u_2(x, 0) = 0 & \partial_t[u_2](x, 0) = g(x)
\end{cases}
$$

This is in the general cases where, the initial conditions contains both the initial conditions and the derivative information, and in that case, we separate the initial conditions to make the problem easier. 

**Note**:

$f(x)$ must be: **Absolutely Integrable**. So that means that integral over the whole domain of the solution must be some finite number. And the boundary at infinite is still going to reach zero because the function we are integrating is absolutely integrable, and shifting it left and right by finite amount of $t$ is not going to break Fourier Transform. 

---
### **Fourier Transform**


> [!warn]-
> DO NOTE USE separation of Variables for these type of PDE on an infinite domain. See [Separation of Variables for Heat and Waves in 1D](Separation%20of%20Variables%20for%20Heat%20and%20Waves%20in%201D.md) for more information. 

Eigenfunctions for the SV is because there is a boundary, the barrier, and it forces the shape of those eigen functions. However, under infinite domain, they are not discrete anymore, because we are considering limits for the boundary conditions. And the results is expressed in term of the initial conditions. 
We introduce the d' Alembert's method, It's made for just the above PDE equation, not applicable to anything else. 

Here is the list of procedures we use to get the solution for the PDE: 
1. Take the equation to the Fourier Domain so it's an ODE in $t$, for all $w$. 
2. Use the $u_t(x, 0) = 0$ get the solution format, in the Fourier Domain. 
3. Use the $u(x, 0) = f(x)$ to get the undetermined coefficients for the system, in the Fourier domain. 
4. Do the Inverse Fourier Transform to get the solution in the original spatial domain. 

---
### **Solution Method Demonstrations**

#### **Step One | Take it to Fourier Domain**

We use $x$ denote the spatial domain, and $w$ denotes the Fourier domain. 

$$
\begin{aligned}
    \hat{u}(w, t) &:=  \mathcal{F}[u(x, t) | x](w) = \int_{-\infty}^{\infty} u(x, t)\exp(iwx) dx
    \\
    \implies u(x,t) &:= \mathcal{F}^{-1}[u(w, t) | w](x) = 
    \frac{1}{2\pi}
    \int_{-\infty}^{\infty} 
        \hat{u}(w, t)\exp(-iwx)
    dw. 
\end{aligned}
$$

We then represent the partial differentials in the Fourier doman. 

$$
\begin{aligned}
    \partial_t^2[u](x, t) 
    &= 
    \partial_t^2
    \left[\frac{1}{2\pi}
    \int_{-\infty}^{\infty} 
        \hat{u}(w, t)\exp(-iwx)
    dw\right] 
    \\
    &= 
    \int_{-\infty}^{\infty} 
        \partial_t^2[\hat{u}](w, t)\exp(-iwx)
    dw
    \\
    &= \mathcal F^{-1}[\partial_t\hat u(w, t) | w](x)
    \\
    \partial_x[u](x, t) 
    &= \partial_x
    \frac{1}{2\pi}\int_{-\infty}^{\infty} 
        \hat{u}(w, t)\exp(-iwx)
    dw
    \\
    &= 
    \frac{1}{2\pi}\int_{-\infty}^{\infty} 
        (-iw)\hat{u}(w, t)\exp(-iwx)
        dw
    \\
    \implies 
    \partial_x^2[u](x, t) &= 
    \frac{1}{2\pi}\int_{-\infty}^{\infty} 
        (-iw)^2\hat{u}(w, t)\exp(-iwx)
    dw
    \\
    &= -\frac{1}{2\pi}\int_{-\infty}^{\infty} 
        w^2\hat{u}(w, t)\exp(-iwx)
    dw
    \\
    &= \mathcal F^{-1}[w^2\hat u(w, t) | w](x)
\end{aligned}
$$

We now substitute the derivative's representation in the Fourier domain back into the PDEs, and then we take the fourier transform to cancle out with the inverse fourier transform. 

$$
\begin{aligned}
    \mathcal F^{-1}[\partial_t^2\hat u(w, t) | w](x) - c^2 \mathcal F^{-1} [-w^2 \hat u(w, t) | w](x) &= 0
    \\
    \partial_t^2\hat u(w, t) + c^2 w^2 \hat u(w, t) &= 0.
\end{aligned}
$$

Fixing $w$, the above is an ODE wrt $t$, solving it yields $\hat{u}(w, t) = A(w)\sin(cwt) + B(w)\cos(cwt)$. 

**Note**: 

The constant $A, B$ are both functions of $w$, because for each value of $w$, we solve the above system for all $t$, hence, the parameters corresponds to all possible values of $w$, resulting in the function $A(w), B(w)$. They will be determined by the initial conditions of for the problem. 

**Incooperating Initial Conditions**: 

$$
\begin{aligned}
    & u_t(x, 0) = 0
    \\
    & \mathcal{F}^{-1}[\hat{u}_t](w, 0) = 0
    \\
    \implies & 
    \hat{u}(w, 0) = 0,
\end{aligned}
$$

using the form of the solution we had from the ODE in the Fourier domain, we conclude

$$
\begin{aligned}
    & u(x, t) = f(x)
    \\
    & \hat u(w, t) = \hat f(w) \quad \text{Apply Fourier}
    \\
    & \hat{u}(w, 0) = A(w)\sin(cw0) - B(w)\cos(cw0) = \hat f(w)
    \\
    \implies &
    B(w) = \hat f(w)
    \\
    \implies &\hat{u}(w, t) = \hat f(w)\cos(cwt) + A(w)\sin(cwt)
\end{aligned}
$$

additionally, we can determine $A(w)$ using the initial condition $\partial_x u(x, 0) = 0$, consider for all $w$: 
$$
\begin{aligned}
    \partial_t \hat u(w, 0) &= 0 
    \\
    cw (A(w)\cos(cw0) - B(w)\sin(cw0)) &= 0
    \\
    cw(A(w)) &= 0
    \\
    \implies A(w) &\equiv 0, 
\end{aligned}
$$

and therefore, we $A(w)$ is, identically zero. The final solution in the Fourier domain takes the form $B(w)\cos(cwt)$. 

**Transforming Back to Spatial Domain**

We transform it back to spatial domain. Consider

$$
\begin{aligned}
    & u(x, t) = \mathcal{F}[\hat{u}](x,t) = 
    \frac{1}{2\pi}
    \int_{-\infty}^{\infty} 
        \hat f(w)\cos(cwt)\exp(-iwx)
    dw
    \\
    \text{using: }
    \cos(cwt) &= \frac{1}{2}\left(
        \exp(icwt) + \exp(-icwt)
    \right)
    \\
    & u(x, t) = \frac{1}{4\pi}\int_{-\infty}^{\infty} 
    \hat f(w)\exp(\underbrace{-iwx + icwt}_{-iw(x - ct)})
    dw 
    + \frac{1}{2\pi}\int_{-\infty}^{\infty} 
        \hat f(w)\exp(\underbrace{-iwx - icwt}_{-iw(x + ct)})
    dw
    \\
    \implies  &
    u(x, t) = \frac{1}{2}(f(x + ct) + f(x - ct)) \quad \text{by inverse Fourier}
\end{aligned}
$$


And that, is the solution to the PDE. 

**Remarks**: 

Why we didn't use the Boundary Conditions? Because the initial condition helped us to satisfies that part, we assume that the function $f(x)$ is absolutely integrable, it will have to have limit that approaches zero as it goes to infinity, which can be interpreted as a type of boundary condition. 

---
### **An Alternative** | D Alambert's method

Let's consider a more general formulations of the wave equation under the infinite domain, and it's: 
 
$$
\begin{cases}
    u_{tt} - c^2u_{xx} = 0 & x\in \mathbb{R}
    \\
    u(x, 0) = f(x) & u_t(x, 0) = \underbrace{0}_{g(x)}
\end{cases}
\tag{6}
$$

General solution is: 

$$
u(x, t) = \underbrace{f(x + ct)}_{\text{Backward traveling wave}} + \underbrace{g(x - ct)}_{\text{Forward Traveling wave}}
\tag{7}
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
\tag{8}
$$

Consider a change of variable: 

$$
\xi = x - ct \quad \eta = x + ct
\tag{9}
$$

Consider expressing $\partial_t, \partial_x$ using the new variable giving us: 

$$
\begin{aligned}
    \partial_t &= \frac{\partial\xi}{\partial t}\frac{\partial}{\partial\xi}
    + 
    \frac{\partial \eta}{\partial t}\frac{\partial }{\partial\eta}
    \\
    & =-c \frac{\partial}{\partial \xi} + c \frac{\partial}{\partial \eta}
    \\
    &= c(\partial_\eta - \partial_\xi)
\end{aligned}
\tag{10}
$$

This is just using multi-variable chain rule. Similarly for $\partial_x$. And remember that differential operator are reduced using $\xi = x - ct, \eta = x + ct$. 

$$
\begin{aligned}
    \partial_x &= \frac{\partial \xi}{\partial x}\frac{\partial}{\partial \xi} + \frac{\partial \eta}{\partial x}\frac{\partial }{\partial \eta}
    \\
    &= \partial_\xi + \partial_\eta
\end{aligned}
\tag{11}
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
    u(x, t) = q(\eta) + p(\xi)
\end{aligned}
\tag{12}
$$

And here we are just taking the integral wrt to $\xi, \eta$, in that order. And then the constant is a function wrt to $\eta$ for the first integral and $\xi$ for the second. Because, $p(\eta)$ independently wrt to $\xi$. 

Now, incooperating the initial conditions we have: 

$$
\begin{cases}
    u(x, 0) = f(x) = q(x) + p(x) &
    \\
    \partial_t[u](x, 0) = 0 = c(q'(x) - p'(x))& 
\end{cases}
\tag{13}
$$

Try solving it. Starting it with taking the derivative on the first expression and then solving it like linear system of equation wrt to $p'(x)$ and $q'(x)$. 

$$
q(x) = \frac{1}{2}f(x) + B \quad p(x) = \frac{1}{2}f(x) - B
\tag{14}
$$

And then the final expression will be: 

$$
u(x, t) = p(x + ct) + q(x - ct) = \frac{1}{2}(f(x + ct) + f(x - ct))
\tag{15}
$$

What if $g(x)$ doesn't equal to zero? 

Then we will need to revist expression 13, which will be: 

$$
\begin{aligned}
    &\begin{cases}
        u(x, 0) = f(x) = q(x) + p(x) &
        \\
        \partial_t[u](x, 0) = g(x) = c(q'(x) - p'(x))& 
    \end{cases}
    \\
    &\begin{cases}
        q'(x) + p'(x) &= f'(x) \quad (\text{Exp1})
        \\
        cq'(x) - cp'(x) &= g(x) \quad (\text{Exp2})
    \end{cases}
    \\
    &\frac{-\text{Exp2}}{c} + \text{Exp1}
    \\
    \implies 
    & 2p'(x) = f'(x) - \frac{1}{c}g(x)
    \\
    \implies & 
    p'(x) = \frac{1}{2}\left(
        f'(x) - \frac{1}{c}g(x)
    \right)
    \\
    \implies &
    p(x) = \frac{f(x)}{2} - \frac{1}{2c}\int_{0}^{x} 
        g(\tilde{x})
    d\tilde{x} + A
\end{aligned}
$$

At the same time: 

$$
\begin{aligned}
    q(x) &= f(x) - p(x)
    \\
    \implies 
    q(x) &= \frac{1}{2}f(x) + \frac{1}{2c}\int_{0}^{x} 
        g(\tilde{x})
    d\tilde{x} - A
\end{aligned}
$$

Then in the final stage we combine these 2 together and get: 

$$
\begin{aligned}
    u(x, t) &= p(x - ct) + q(x  + ct)     
    \\
    &= 
    \frac{f(x - ct) + f(x + ct)}{2}
    +
    \frac{1}{2c} \int_{x + ct}^{x - ct} g(\tilde{x})d\tilde{x}
\end{aligned}
$$

and this is the solution to the generla case were we have the initial conditions for both $u(x, 0)=f(x),  \partial_t[u](x, 0)= g(x)$. 
 








[^1]: Just adds up all the above equations (1), (3), (4), and then using the fact that the fourier transform is linear, then we can have the expression (5). Don't forget the negative sign of $(iw)^2$ there. 