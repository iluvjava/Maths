[[Fourier Series (PDE Flavor)]]
Here, we will introduce the idea of Complex Fourier Series. An easier way to compute the fourier Series, and it's more compact too, but it's the same as using the trig basis function. The only thing we need to tweak is the definition of Function Inner Product. Because the functions are complex, we will have to take the complex conjugate when taking the inner product between them. 

---
### **Intro**

This is a new way of getting the Fourier Series, it's the same thing but it's more beautiful and easier to compute. Let's take a look at the series: 

$$
f(x)= \sum_{n - \infty}^{\infty}
c_n \exp\left(
    \frac{-in\pi x}{L}
\right)
\quad \forall x\in [-L, L)
$$

And the coefficients $c_n$ is computed via: 

$$
c_n = \frac{1}{2L}\int_{-L}^{L} 
f(x)\exp\left(
    \frac{in \pi x}{L}
\right)
dx
$$

How is this coefficient related to the previous fourier Coefficients? 

If I don't know anything about it, can we start from scratch to get this series? 

---
### **Starting From Scratch**

$$
f(x)= \sum_{n - \infty}^{\infty}
c_n \exp\left(
    \frac{-in\pi x}{L}
\right)
\quad \forall x\in [-L, L)
\tag{2}
$$

Just like the Fourier Series, are these orthogonal? I mean the exponential Basis Function. 

Yes, but, because we have complex basis function here, to take their inner product, it's like: 

$$
\langle f, g\rangle = \int_{-\infty}^{\infty} 
\bar{f}(x)g(x)
dx
$$

Where, we need to take the complex conjugate. And, it's not hard to check that: 

$$
\langle \exp\left(
    \frac{-in\pi}{L}
\right), 
\exp\left(
    \frac{imnx}{L}
\right)
\rangle
= \int_{-L}^{L}
\exp\left(
    \frac{i(m - n)\pi x}{L}
\right)
dx
$$

let's consider the case where $m, n$ are integers, and then we have: 

$$
\int_{-L}^{L}
    \exp\left(
        \frac{i(m - n)\pi x}{L}
    \right)
    dx
=
\begin{cases}
    2L & m = n
    \\
    0 & m\ne n
\end{cases}
$$

Yes, **They are Orthogonal** functions. 

Let's try to multiply the conjugate of the basis function, which is associate with integer $m$, and this will be given by: 
$$
\int_{-L}^{L} \exp\left(
    \frac{im\pi x}{L}
\right)f(x)
dx
=
\sum_{n = -\infty}^{\infty}
c_n
\int_{-L}^{L} 
\exp\left(
    \frac{-in\pi x}{L}
\right)
\exp\left(
    \frac{im\pi x}{L}
\right)
dx
$$

$$
\implies c_m = 
\frac{1}{2L}\int_{-L}^{L} 
    f(x) \exp\left(
        \frac{im\pi x}{L}
    \right)
dx
$$

Note: The sign of the basis function is opposite when we use it in the Fourier Series and figuring out the Fourier Coefficients. 

The series is a good representation of the function over $[-L, L)$, **Dirichlet Theorem** applies and periodicity also happen to it. **This is not going to work for an open interval**. But to do it, we can take the limit as $L\rightarrow \infty$, and then we are getting into the territory of **Fourier Transform**. Very Very interesting and complicated stuff.
