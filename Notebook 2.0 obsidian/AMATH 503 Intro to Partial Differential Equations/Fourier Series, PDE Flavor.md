
- [Fourier Sine Series, PDEs Flavor](Fourier%20Sine%20Series,%20PDEs%20Flavor.md)
- [Fourier Cosine Series](Fourier%20Cosine%20Series.md)
- [Separation of Variables for Heat and Waves in 1D](Separation%20of%20Variables%20for%20Heat%20and%20Waves%20in%201D.md)
Here, we are combining both the Fourier Sines and Fourier Cosine series. 

---
### **Intro**

The Fourier Series is Periodic. 
It can model heat conduction in a metal ring. 
Let it be a metal has both ends connected to itself, it loops back, giving us a boundary periodic boundary conditions in $[0, L]$. 
A function over such a domain can model the temperature of the metal ring. 

---
### **Representing the Rod in an Interval**

The circumference of the ring is $2L$. 
Pick any point on the ring and let it be $0$. 
Let the function $f$ model the temperature of the metal ring. 
Positive direction goes clockwise and negative number goes counter clockwise on the ring. An open interval of $(-L, L)$ represents every points on the ring.
It's the interior and doesn't include $L$ because we want $f(L) = f(-L)$ to be a boundary condition. 
Assume that the ring is insulated. 
Then the solution function exists on the interior of the interval, it models temperature on the rod. 
The function can be extended onto the whole reals, by making it a periodic function extended by its value on $[-L, L]$. 

---
### **Setting up the Heat PEDs**

The set up of the PDE is
* The PDE is: $u_t = \alpha^2 u_{xx}$. 
* The **Boundary Condition** is: $u(L, t) = u(-L, t)\; \forall t > 0$. 
And because heat is going to flow through the point $x = L$, the derivative at $x = L$ will also has to be equaled, imposing the condition $u_x(L, t) = u_x(-L, t) \;\forall t > 0$. 
* The **Initial condition** is $u(x, 0) = F(x)$. 

To represent the initial condition $F(x)$ of the PDEs, we are looking for a Fourier series representation of the function in the form of: 

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
Our goal is to solve for the Fourier Coefficients $a_n, b_n$. 

**Facts**: 

If the function $F(x)$ is odd, then it will be represented purely by the $\sin$ functions. If The function $F(x)$ is even, then it will be represented purely by the $\cos$ functions. 

**Remarks**

Please observe that $n = 0$, which might make it different from Fourier series from the internet because they have a separate case of $b_0$ when $n = 0$. 
This may be necessary because when $n = 0$, the formula for Fourier series $a_0, b_0$ are different from the case of any generic $n\in \mathbb N$ by a constant multiplier. 

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
    \frac{1}{2}(F(x) - F(-x))}_{\text{Odd}}. 
$$

Therefore, the function has been represented as the sum of even and odd function. 


As a consequence, The function $\frac{1}{2}(F(x) + F(-x))$ can be represented by $\cos$ series, over the interval $[0, L]$. The function $\frac{1}{2}(F(x) - F(-x))$ can be represented by $\sin$ series, Over the interval $[0, L]$. Then, when we combines them together, we will have the function $F(x)$ represented using both $\cos$ and $\sin$. Let's use the following notation for the odd and even sumee of $f$: 

$$
\begin{aligned}
    F_o(x):=\frac{1}{2}(F(x) - F(-x)) 
    \\
    F_e(x):= \frac{1}{2}(F(x) + F(-x))
    \\
    F(x) := F_e(x) + F_o(x). 
\end{aligned}
$$

To compute the coefficients for the fourier series, we compute the consine and sine series expansion of $F$ on the even part $F_e$ and the odd parts $F_o$. 
The comming parts explain the process. 

---
### **Handling the Odd Parts**

We represent the function $F_o(x)$ by the Fourier Sine Series. 
Because the Furier sine series is applicable for an odd and periodic function on the interval $[-L, L]$. 
Using the fact that $\sin$ and $F_o$ are both odd function, their product is even and hence simplifying the Fourier coefficients $a_n$: 

$$
\begin{aligned}
    a_n &= 
    \frac{2}{L}\int_{0}^{L} F_o(x)\sin\left(
        \frac{nx\pi}{L}
    \right)dx \quad \forall n\in \mathbb{N}
    \\
    &= 
    \frac{1}{L}\int_{-L}^{L} F_o(x)\sin\left(
        \frac{nx\pi}{L}
    \right)dx 
    \\
    \text{by}: 
    \int_{-L}^{L} 
    F_o(x)
    \sin\left(
        \frac{n\pi x}{L}
    \right)
    dx
    &=
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
    \\
    \implies 
    a_n &= 
    \frac{1}{L}
    \int_{-L}^{L} 
    F_o(x)
    \sin\left(
        \frac{n\pi x}{L}
    \right)
    dx
\end{aligned}
$$


Take note that one of the integral is zero because it's an product of an even and odd function, which is odd, and it's zero when integrated over the symmetric interval. 

---
### **Handling the Even Parts**

We represent the even parts $F_e$ of the function using the Fourier cosine series. 
Because $F_e$ is even and $\cos$ is even as well, we can use the integral trick switching the domain from $[0, L]$ to $[-L, L]$ therefore: 

$$
\begin{aligned}
    b_n &= \frac{2}{L}\int_{0}^{L} 
    F_e(x) \cos\left(
        \frac{n\pi x}{L}
    \right)
    dx\; \forall n\in \mathbb{N}
    \\
    &= \frac{1}{L}\int_{-L}^{L}
    F_e(x)\cos\left(
        \frac{n\pi x}{L}
    \right)
    dx
    \\
    &= 
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
\end{aligned}
$$
At the last line, we use the substitute of $F_e(x) = F(x) - F_o(x)$. 
Finally, in the case of $n = 0$, we have the formula for the coefficient

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
Therefore, we have all the coefficients for the Fourier Series, expressed using function $F(x)$.

---
### **Series Calculus**: 


#### **Claim | We can do Integration on Fourier Series**
> We can do Fourier series if we can identify the conditions when the Fourier series converges uniformly. 
> There are many such conditions. 
> We list some of the sufficient conditions when the Fourier series converges uniformly. 
> 1. When the function is Holder continuous. 
> 2. When the function is continuous, and the Fourier coefficients is absolutely summable. 


#### **Differentiation**

Take the integral on Fourier seris is fine, but taking the derivative could be problematic. 

#### **Claim | We May not be able to Take Derivative on Fourier Series**

> We may not be able to take derivative on a convergent Fourier series. 

**Justification**

Let's consider the following example of a Fourier series. 
$$
x = 2
\sum_{n = 1}^{\infty}
\frac{L}{n\pi}(-1)^{n + 1}\sin\left(
    \frac{n\pi x }{L}
\right)
\quad x \in [0, L) \tag{1}
$$
This is the saw wave. 
The reader should try plotting it out for a good view and check the correctness of our claim. 
Observe that, the coefficients of the series is having a harmonic series like convergence. 
The saw wave is not continuous. 
Consider at the behavior of the curve at the point of discontinuity, and remember the **Gibbs Phenomena**. 

When $a_n \rightarrow \mathcal(\frac{1}{n})$, when the convergence of the Fourier series is behaving like harmonic series, it's always the case that this series has a discontinuity. 
This is noted by the professor of the class, wihtout much explaination. 
When we take the derivative on the above series, we have: 
$$
1 \underset{?}{=} 
2 \sum_{n = 1}^{\infty}
(-1)^{n + 1}\cos\left(
    \frac{n\pi x}{L}
\right)
$$

The aboe claim would be false because the series never converge. 
It doesn't equal to one. 
Depending on how the terms are arranged in the sum, we can sum them up to be any kind of number. 
This series is undetermined. 

Note that, the Fourier cosine series for $1$ is just 1. 
They are not equal to each other, be careful when we take the derivative on the fourier series. 
Notice that, when the coefficient is not decreasing fast enough, we might have problem with the derivative of the series. 