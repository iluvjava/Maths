We are interested in writing a function as a sum of cosine series. 
[[Fourier Sine Series (PDEs Flavor)]]


---
### **Intro**

We are interested in writing a function over the interval: $[0, L]$ in the form of finite cosine series. 

This is in the format of: 

$$
F(x) = 
\sum_{n = 0}^{\infty}
b_n\cos \left(
    \frac{n\pi x}{L}
\right)
\tag{1}
$$

Notice that, we are string the index with $1$. 

This is only possible over the interval: $[0, L]$. 

Assume that the representation does exists, and it's true over the interval. 

Important Questions: 
1. Why do have a $\sin$ series representation when we already had the $cos$ series representation of function? 

A useful digression: 

$$
\int_{a}^{b} \bar{f}(x)g(x)dx = 0
\tag{2}
$$
Where, the $\bar{f}$ denotes the complex conjugate of a function. 

Then, these 2 function $f, g$ are said to be orthogonal with each other. 


---
### **Looking for the Coefficients**

Consider multiplying my another frequencies of cosine series and then take the integral[^1], this will give us: 

$$
\int_{0}^{L} 
F(x) \cos\left(
    \frac{m\pi x}{L}
\right)
dx
=
\sum_{n = 0}^{\infty}
b_n 
\underbrace{
\int_{0}^{L} 
    \cos \left(
        \frac{n\pi x}{L}
    \right)
    \cos\left(
        \frac{m\pi x}{L}
    \right)
dx}_{I_{mn}}
\tag{3}
$$

Let's take a closer look at the inner integral, $I_{mn}$. 

Consider the case that $m = n = 0$, then we have the inside of the integral set to be $1$, hence the value of the integral is: $L$. 

Consider the cast that $m = n \ne 0$, then we have the integral that: 

$$
\int_{0}^{L} 
    \cos\left(
        \frac{n\pi x}{L}
    \right)
    \cos\left(
        \frac{n\pi x}{L}
    \right)
dx
\tag{4}
$$

The trig identity used is: 

$$\cos A \cos B = \frac{\cos(A + B) + \cos(A - B)}{2}
\tag{5}
$$

Under the special case when $A = B$, which is what (4) is, we have: 

$$
\int_{0}^{L} 
    \frac{1}{2}\left(
        \cos\left(
            \frac{2n\pi x}{L}
        \right)
        + 
        1
    \right)
dx
\tag{6}
$$

Taking the integral is essentially giving us: 

$$
\frac{1}{2}
\left.
\left(
    L + \frac{\sin
        \left(
            \frac{2n\pi x}{L}
        \right)
    }{\frac{2n\pi}{L}}
\right)\right|_{0}^L = \frac{L}{2}
\tag{7}
$$

And hence, the value of the integral is $\frac{L}{2}$. 

And for the last case: $m\ne n$ and it's non-zero, then the integral is going to be zero, because there are 2 $\cos$ in the integral, and we are taking the integral of the function over its periodic range, and that will result in zero (Which says that the $\cos$ are orthogonal to each other). 

Now we had everything, we can say that the coefficient of the Cosine Series 

Continue from expression (3), we have: 

$$
\int_{0}^{L} 
F(x)\cos\left(
    \frac{m\pi x}{L}
\right)
dx
=
\sum_{n = 0}^{\infty}
b_nI_{mn} 
\tag{8}
$$

When $m = n = 0$, we have: 


$$
b_0 = \frac{1}{L}\int_{0}^{L} 
F(x)\cos\left(
    \frac{m\pi x}{L}
\right)
dx
\tag{8.1}
$$

And then, when $m\ne 0$, we have a bunch of terms in the infinity sum set to be zero, and then we only have $b_m$ left, and then we know that is when $m = n$, which is giving us the expression for $b_m$: 

$$
b_m
= \frac{2}{L}
\int_{0}^{L} 
F(x)\cos\left(
    \frac{mnx}{L}
\right)
dx
$$

And then we have all the coefficient figured out. 

---
### **Resolving the Question Asked**: 

Why are we bothering with the $\cos$ series again? When we already had the $\sin$ series for the separation of variable? 

We are going to keep using the heat equation, the same example we showed for [[Separation of Variables]]. 

Let's insulate the end of the rods. And then, we will have the **Neuman Boundary conditions**, which is giving us: 

$$
u_x(0, t) = u_x(L, t) = 0 \quad \forall t > 0
$$

And this is how we insulate it. The initial conditions is still going to be the same initial distribution function: $F(x)$ in this case. 

And in order to use this conditions, we have to use the basis function of $\cos(x)$. 

And this is introduced in [[Separation of Variables]]. 

---
### **What lies Beyond**?
Depending on the physical context, we choose the appropriate basis function. For example in the case of Spherical Geometry, a basis function Legendre Functions are chosen. 

And under the case where we have Cylindrical Geometry, we have Bassel functions. 

### **At the Boundary**

In the discussion of the Cosine Fourier series, we know that the representation of a $\sin$ series is going to take the average at the boundary. This is the [[Dirichlet Theorem]]. 

However, when representing a constant of $y = 100$, the cosine series will be OK, both inside and outside of the interval. 

**So the Reasoning is gonna ble like this**: 

* By the symmetric property of the basis function, the cosine function is exactly the same as $y = 100$, and it's the same on the interval $[-L, L]$. 
* Hence, the series takes value 100 on the interval $[-L, L]$. 
* And then, by the periodicity of the function, we have that the series the same everywhere. 
* Therefore, the cosine series is just gonna give us: $b_0 = 100$, and then all the other terms are zeros. 


[^1]: We not only make the assumption that the infinite series converges, but also that, it converges uniformly, and then, that is how we try to get the coefficients for the $\cos$ series.