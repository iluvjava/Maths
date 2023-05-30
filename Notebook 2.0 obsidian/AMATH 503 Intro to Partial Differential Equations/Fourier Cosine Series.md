We are interested in writing a function as a sum of cosine series. 
[[Fourier Sine Series, PDEs Flavor]]


---
### **Intro**

Define the inner product for function $f, g$ that are integrable over the $[0, L]$ to be 

$$
\int_{a}^{b} f(x)g(x)dx = 0. 
$$

A function $f$ over the interval: $[0, L)$ has fourier series expansion: 

$$
F(x) = 
    \sum_{n = 0}^{\infty}
    b_n\cos \left(
        \frac{n\pi x}{L}
    \right) 
    \text{ where } b_n = 2/L \langle f, g\rangle \; \forall  n \in \N, b_0 = 1/L\langle \mathbf 1, f\rangle. 
$$

Here, we motivate the use of Fourier cousine series. We won't explain why all function in $L^2[0, L]$ can be represented using the Fourier basis, nor we will be showing the type of convergence for the Fourier Cousin series. The scope is limited.  

---
### **Looking for the Coefficients**

We assume that all $L^2$ functions on the interval $[0, L]$ can be represented by the cosine basis $\cos(n\pi x/L)$, it remains to show that the basis functions are orthogonal, and find the normalization constant. To show that, consider taking the dot product between 2 cosine frequencies that is different[^1]: 

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
dx}_{=: I_{mn}}
\tag{3}
$$

Let's take a closer look at the inner integral, $I_{mn}$. Consider the case that $m = n = 0$, then we have the inside of the integral set to be $1$, hence the value of the integral is $L$, the nromalization coefficient is $1/L$. Next, consider the case that $m = n \ne 0$, then we have the integral that: 

$$
\begin{aligned}
    \text{recall: } & \cos A \cos B = \frac{\cos(A + B) + \cos(A - B)}{2}
    \\
    \implies  & 
    \left\lbrace
    \begin{aligned}
        \int_{0}^{L} 
            \cos\left(
                \frac{n\pi x}{L}
            \right)
            \cos\left(
                \frac{n\pi x}{L}
            \right)
            dx &= \int_{0}^{L} 
            \frac{1}{2}\left(
                \cos\left(
                    \frac{2n\pi x}{L}
                \right)
                + 
                1
            \right)
                dx
            \\
            &= \frac{1}{2}
            \left.
            \left(
                L + \frac{\sin
                    \left(
                        \frac{2n\pi x}{L}
                    \right)
                }{\frac{2n\pi}{L}}
            \right)\right|_{0}^L = \frac{L}{2}
    \end{aligned}
    \right.
\end{aligned}
$$


And hence, the normalization constant is $\frac{L}{2}$, for all $n \ge 1$. Next, we show that the basis functions are orthogonal...

#UNFINISHED
 

---
### **Properties of the Cosine Basis**: 

As discussed in [[Separation of Variables for Heat and Waves in 1D]], for heat equation, insulating both ends of the rods gives the *Neuman Boundary conditions*: 

$$
u_x(0, t) = u_x(L, t) = 0 \quad \forall t > 0, 
$$

and it's not hard to notice that the derivative of the basis function are $\sin$ functions that takes zeros on both ends of the interval, hence, the cosine basis satisfies the boundary conditions automatically. 

---
### **Other Basis Functions**?
Depending on the physical context, we choose the appropriate basis function. For example in the case of Spherical Geometry, a basis function Legendre Functions are chosen. And under the case where we have Cylindrical Geometry, we have Bassel functions. 


[^1]: We not only make the assumption that the infinite series converges, but also that, it converges uniformly, and then, that is how we try to get the coefficients for the $\cos$ series. In some analysis that is not shown here, taking the inner product of the function against specific cosine basis component requires uniform convergence to carry out. 