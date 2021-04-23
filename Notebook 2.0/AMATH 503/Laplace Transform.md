[[Fourier Transform]]
It's just Fourier, but it's along the imaginary axis. 

---

### **Intro**

Laplace generalized Fourier to a much larger class of functions. 

It's a weighted one sided Fourier Transform 

This is the Fourier: 

$$
\mathcal{F}[f](w) = \int_{-\infty}^{\infty} 
    f(x)\exp \left(
    iwx
    \right)
dx
\tag{1}
$$

And the Laplace Transform is given as: 

$$
\mathcal{L}[f](s) = 
    \int_{0}^{\infty} 
        f(t)
        \exp \left(
        -st
        \right)
    dt
\tag{2}
$$

The diferences between them are: 
1. The bounds. 
2. The kernel. 

It's not hard to see that, a substitution on expression (1) will give the solution that: 
$$
\mathcal{F}[f_+](is) = 
\mathcal{L}[f](s) =
\int_{0}^{\infty} 
    f_+(t)\exp \left(
    -st
    \right)
dt
\tag{3}
$$

Where $f_+(x)$ is the $f$ but we all the negative side of the function has been set to zero. It's a one sided function. On the positive side. 

To summarize: The Fourier Trransform on the positive side of the function $f$ along the imaginary axis equals to the Laplace Transfrom of the positive side of the function. 

---
### **Why**?

If the function is blowing up on the negative side, we can apply the Laplace Transfrom. 

---
### **Inverse Laplace Transform**

The idea is to use the Inverse Foutier Transform. 

Given that the function $f$ is **one-sided**. Then the inverse Foutier Transform is given by: 

$$
f(t) = 
\frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \underbrace{F(w)}_{\mathcal{F}[f](w)}
    \exp \left(
        -iwt
    \right)
dw
\tag{4}
$$

The original function is the inverse Fourier on the Fourier of the function. 

Let's consider $w = is$, then: 

$$
f = 
\frac{i}{2\pi}
\int_{i\infty}^{-i\infty} 
    F(is)\exp \left(
        st
    \right)
ds
=
\frac{1}{2\pi i}
\int_{-i\infty}^{i\infty} 
    F(is)\exp \left(
        st
    \right)
ds
\tag{5}
$$

Notice that I also changed $x$ into $t$.  


However, notice that, the function $F(w)$ can be attained through Fourier Transform, and in that case we have the expression that:

$$
F(w) = \mathcal{F}[f](w) \underset{w = is}{\implies} F(is) = \mathcal{L}[f](s)
$$

And this is doable because the funciton is $f$ is onsided function. And therefore, we can have the inside of the expression (5) to be related to the Lapalce Transform and it wil be like: 

$$
f(t) = 
\frac{1}{2\pi i}
\int_{-i\infty}^{i\infty} 
   \mathcal{L}[f](s)\exp \left(
        st
    \right)
ds
\tag{6}
$$

We have recovered the original function and hence, we integral above will perform an inverse Laplace transform. 




