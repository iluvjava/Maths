Here, we will look at the fourier Series at its full glory, when it comes to solving some basic differential equations. 
[[Fourier Sine Series (PDEs Flavor)]], [[Fourier Cosine Series]]
[[Separation of Variables]]
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
\sum_{i = 0}^{\infty}
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
### **Any function is the sum of a even and odd function**

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

