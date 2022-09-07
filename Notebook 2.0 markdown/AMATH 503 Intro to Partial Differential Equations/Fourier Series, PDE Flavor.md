Here, we will look at the fourier Series at its full glory, when it comes to solving some basic differential equations. 
[Fourier Sine Series, PDEs Flavor](Fourier%20Sine%20Series,%20PDEs%20Flavor.md), [Fourier Cosine Series](Fourier%20Cosine%20Series.md)
[Separation of Variables](Separation%20of%20Variables.md)
Here, we are combining both the Fourier Sines and Fourier Cosine series. 

---
### **Intro**

The Fourier Series is Periodic. 

Heat conduction in a metal ring. 

This is an interesting problem, be a metal has both ends connected to itself, it loops back, giving us a new boundary conditions that is neither Fourier Sine series, nor Fourier Cosine Series. 



---
### **Representing the Rod in an Interval**

The circumference of the ring is $2L$. 

Pick any point on the ring and let it be $0$. 

Positive direction goes clockwise and negative number goes counter clockwise on the ring. 

Then, an interval of $(-L, L)$ can represent every points on the ring. 

Assume that the ring is insulated, there is no heat escaping it. 

**Here is the Gist of it**

Split any function into an even and odd parts. The odd parts is handle by the $\sin$ series and the even part is handled by the $\cos$ series. 



---
### **Setting up the Heat PEDs**

The PDE is: 

$$
u_t = \alpha^2 u_{xx}\tag{1}
$$

The **Boundary Condition** is: 

$$
u(L, t) = u(-L, t) \quad \forall t > 0 \tag{2}
$$

And because heat is going to flow through the point, the derivative will also has to be equal to each other: 

$$
u_x(L, t) = u_x(-L, t) \qquad \forall t > 0 \tag{3}
$$

And then, the **Initial condition** is going to be: 

$$
u(x, 0) = F(x) \tag{4}
$$


Now, the problem is, how exactly are we going to represent the initial conditions ($F(x)$) of the PDEs, we are looking for a representation like this: 

$$
F(x) = 
\sum_{n = 0}^{\infty}
a_n\sin\left(
    \frac{n\pi x}{L}
\right)
+ 
b_n\cos\left(
    \frac{n\pi x}{L}
\right)
$$

Over the interval of: $(-L, L)$. 

And then we are solving for the coefficients. 

**Facts**: 

If the function $F(x)$ is odd, then it will be represented purely by the $\sin$ functions. 

If The function $F(x)$ is even, then it will be represented purely by the $\cos$ functions. 

---
### **Any function is the sum of an even and odd function**

For any given function $F(x)$, the function $F(x) + F(-x)$ is even. 

The function $F(x) - F(-x)$ is odd. 

Consider the expression that: 

$$
F(x) = 
    \underbrace{
    \frac{1}{2}(F(x) + F(-x))}_{\text{Even}}
     +
    \underbrace{
    \frac{1}{2}(F(x) - F(-x))}_{\text{Odd}}
$$

Boom, the function has been represented as the sum of even and odd function. 

**Therefore**

The function $\frac{1}{2}(F(x) + F(-x))$ can be represented by $\cos$ series, over the interval $[0, L]$. 

The function $\frac{1}{2}(F(x) - F(-x))$ can be represented by $\sin$ series, Over the interval $[0, L]$. 

Then, when we combines them together, we will have the function $F(x)$ represented using both $\cos$ and $\sin$. 

Denotes that: 

$$
F_o(x):=\frac{1}{2}(F(x) - F(-x)) \quad F_e(x):= \frac{1}{2}(F(x) + F(-x))
$$

And hence we know that:

$$
F(x) = F_e(x) + F_o(x)
$$

Which will be useful when we are using it in the integral. 

---
### **Handling the Odd Parts**

The function $F_o(x)$ is going to be represented by the Fourier Sine Series. 

According the Fourier Sine series, the coefficients is given by: 

$$
a_n = 
\frac{2}{L}\int_{0}^{L} F_o(x)\sin\left(
    \frac{nx\pi}{L}
\right)dx
$$

And, the produce of 2 odd function is even, and hence we can change the bound of the integral and get: 

$$
a_n = 
\frac{1}{L}\int_{-L}^{L} F_o(x)\sin\left(
    \frac{nx\pi}{L}
\right)dx \quad \forall n\in \mathbb{N}
$$

let's take a closer look and see what happen when we substitute the value for $F_o(x)$: 

$$
\int_{-L}^{L} 
F_o(x)
\sin\left(
    \frac{n\pi x}{L}
\right)
dx
=
\int_{-L}^{L} 
F(x)
\sin\left(
    \frac{n\pi x}{L}
\right)
-
\underbrace{
\int_{-L}^{L} 
F_e(x)
\sin\left(
    \frac{n\pi x}{L}
\right)
dx}_{\text{ = 0}}
$$

Take note that one of the integral is zero because it's an product of an even and odd function, which is odd, and it's zero when integrated over the symmetric interval. 

Ok it just got more complicated and I don't think switching variable is going to make things better. 

### **Handling the Even Parts**

The Even part of the function is going to represented by the Fourier Cosine Series: 

$$
b_n = \frac{2}{L}\int_{0}^{L} 
F_e(x) \cos\left(
    \frac{n\pi x}{L}
\right)
dx\quad\forall n\in \mathbb{N}
$$

And take note that both function is even, and hence we can switch the bounds of the interval to make it on $[-L, L]$ giving us: 

$$
b_n = \frac{1}{L}\int_{-L}^{L}
F_e(x)\cos\left(
    \frac{n\pi x}{L}
\right)
dx
$$

Ok, let's play a similar tricks here: 

$$
b_n = 
\frac{1}{L}\int_{0}^{L}
F(x)\cos\left(
    \frac{n\pi x}{L}
\right)
dx
-
\underbrace{
\frac{1}{L}\int_{0}^{L}
F_o(x)\cos\left(
    \frac{n\pi x}{L}
\right)
dx}_{=0}
$$

And one of the integral has an odd function inside of it, therefore it will be evaluated to $0$. 

And, for the special part $b_0$, the value will be given by: 

$$
b_0 = 
\int_{0}^{L} 
F_e(x)
dx
=
\frac{1}{2L}\int_{-L}^{L} 
    F_e(x)
dx
=
\frac{1}{2L}
\int_{-L}^{L} 
    F(x)
dx
$$

And that is just the average value of the function over the interval $[-L, L]$. 

Therefore, we have all the coefficients for the Fourier Series, expressed using function $F(x)$. Amazing. 

---
### **Series Calculus**: 

**Integration**: 

Can we integrate the Fourier Series Terms by Terms to get the integral of the function? 

Yes.

**Differentiation**: 

Can we differentiate terms by terms? 

No always, it depends, consider Fourier Sine Series: 

$$
x = 2
\sum_{n = 1}^{\infty}
\frac{L}{n\pi}(-1)^{n + 1}\sin\left(
    \frac{n\pi x }{L}
\right)
\quad x \in [0, L) \tag{1}
$$

This is the saw wave. Observe that, the coefficients of the series is having a harmonic series like convergence. 

The saw wave is not continuous. Consider at the behavior of the curve at the point of discontinuity, and remember the **Gibbs Phenomena**. 

When $a_n \rightarrow \mathcal(\frac{1}{n})$, when the convergence of the Fourier series is behaving like harmonic series, it's always the case that this series has a discontinuity. This is noted by the professor. 

When we take the derivative on the above series, we have: 

$$
1 \underset{?}{=} 
2 \sum_{n = 1}^{\infty}
(-1)^{n + 1}\cos\left(
    \frac{n\pi x}{L}
\right)
$$

This thing, has a coefficient that never decreases. 

This thing, doesn't equal to one. Depending on how it's arranged, we can make any kind of number. This series is undetermined. 

Note that, the fourier cosine series for $1$ is just 1. 

They are not equal to each other, be careful when we take the derivative on the fourier series. 

Notice that, when the coefficient is not decreasing fast enough, we might have problem with the derivative of the series. 

When the convergence rate is like: $\mathcal{O}(\frac{1}{n^2})$, yes, we will be able to take derivative on that. **BUT**, 2 derivatives might give us a problem. 