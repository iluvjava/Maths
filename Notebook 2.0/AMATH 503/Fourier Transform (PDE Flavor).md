[[Complex Fourier Series (PDF Flavor)]]
Here, we will  derive a very important tools for: 
1. Solving PDEs on finite domain. 
2. Making a basis for the Laplace Transform
3. Representing function in the Frequency domain. 

---
### **Intro**

We are not going to use the table to read for the Fourier Transform, and we are going to derive it from the ground up and know what exactly going on with the table for the fourier transform. 

Recall the complex Fourier Series from last time: 

$$
F(x) = \sum_{n = -\infty}^{\infty}
    c_n \exp\left(
        \frac{-in\pi x }{L}
    \right)
    \quad 
c_n = \frac{1}{2L}\int_{-L}^{L} 
    f(y)\exp\left(
        \frac{i n \pi y}{L}
    \right)
dy \quad \forall x\in[-L, L]
$$

And recall the Dirichlet Theorem: [[Dirichlet Theorem]]

Simply speaking, the Dirichlet theorem: converge at points of piecewise continuity and takes the average for the jump discontinuities. 

**Note**: The Dirichlet theorem is still valid for complex fourier series as well. 

**Note**: $y$ is used for the variable in the Fourier Domain, because we will use $\omega$ for other stuff. 

If the function is periodic based on $[-L, L]$, then, the series is going to converge to it globally. 

If not, then that is a big bummer. 

Questions: 

Can we approximate the function over the interval of all reals? $\mathbb{R}$. Can we do it? 

Answer: 

Yes, but we need to consider the Complex Fourier Series, for $[-L, L]$ and then we take the limit $L\rightarrow \infty$ and watch what happens. 

Let's make things simplier by using $\omega_n$

> $$
> \omega_n = \frac{n\pi}{L} \quad \Delta\omega = \frac{\pi}{L}
> $$

This is our discritized frequency variable, and we will show that, in the case of fourier transform, this frequency variable become continuous. Which is very interesting. 

---
### **Derivation**

This is the frequencies coefficients for ous basis functions. And then it's not hard to see that we have: 



$$
f(x) = \sum_{n = -\infty}^{\infty}
    c_n \exp\left(
       -i\omega_n x
    \right)
    \quad 
c_n = \frac{1}{2L}\int_{-L}^{L} 
    f(y)\exp\left(
        i\omega_n y
    \right)
dy \quad \forall x\in[-L, L]
$$


And notice that, for the coefficients for the fouer series, we have: 

$$
F(\omega_n) = 2Lc_n =
\int_{-L}^{L} 
    f(y)\exp\left(
        i\omega_n y
    \right)
dy
$$

**Note** $F(x)$ has been redefined as the convolution between the original function and the Fourier Kernel for some given frequency $w_n$: 

Then, we have an expression for $f(x)$ in terms of function of $F(\omega_n)$, and then we have: 

$$
f(x) = \sum_{n = -\infty}^{\infty}
    \frac{F(\omega_n)}{2L}\exp(-i\omega_n x)
$$

Recall the fact that $\Delta\omega$ is $\frac{\pi}{L}$. 

$$
f(x) = \sum_{n = -\infty}^{\infty}
    \frac{2}{\pi}\frac{F(\omega_n)\pi}{L}\exp(-i\omega_n x)
    =
    \frac{2}{\pi}
    \sum_{n = -\infty}^{\infty}
    \underbrace{F(\omega_n)\Delta\omega_n\exp(-i\omega_n x)}_{G(\omega_n)\Delta\omega_n}
$$

And then, observe that it starts to look like a Riemann Sum wrt to $\omega_n$. 

Visually, this is an integral with to $\omega_n$ on the all real number lime $\mathbb{R}$. Also take note that, we are taking the limit as $L \rightarrow \infty$, and this means that: 

$$
\lim_{L\rightarrow\infty} \frac{\pi}{L} = \lim_{L\rightarrow \infty} \Delta\omega = 0
$$

And this means that, the sum is decaying into an integral, by the Riemann Sum interpretation of the sum: 

$$
f(x) = 
\lim_{L\rightarrow \infty} \frac{2}{\pi} \sum_{n=-\infty}^{\infty}
    G(\omega_n)\Delta\omega_n = \int_{-\infty}^{\infty} G(\omega)d\omega
$$

Take not that, if we want $L\rightarrow \infty$, then $\Delta\omega \rightarrow 0$, and then, the discrete sums is becoming an integral over the $\mathbb{R}$. 

Wait a minute the right and side is like a function wrt to $x$ but on the left hand side is a func wrt to $\omega$, so we have to consider what happend to $F(\omega_n)$ as $L \rightarrow \infty$, and this will be giving us: 

$$
\lim_{L\rightarrow \infty}F(\omega_n) 
= 
\lim_{L\rightarrow \infty}\int_{-L}^{L}f(y)\exp(i\omega_n y)dy
$$

As the Length $L$ approaches $\infty$, the quantity $\Delta\omega$ gets smaller, and the variable $\omega_n$ change from a discrete variable to a continuous variable, at the same time bounds of the integral are approaching infinity giving us:[^1]  

$$
F(\omega) 
= 
\int_{-\infty}^{\infty}f(y)\exp(i\omega y)dy
\tag{Fourier Transform}
$$

And this is the Fourier Transform of the function $f(y)$, take note that, the For the full Fourier series after taking the limit has the Fourier Transform inside of it and it's represented as: 

$$
f(x) = \frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    \left(
        \int_{-\infty}^{\infty} 
            f(y)\exp(i\omega y)
        dy
    \right)
    \exp\left(
        -i\omega x
    \right)
d\omega
$$

**How does this make sense intuitively**? 

The variable $\omega_n$ denotes the frequencies of the trig basis function that is used for reconstructing the function in interval. In general, we always need infinitely such integral to reconstruct the original function. 

When the interval $L$ gets larger and larger, the change in frequencies, $\pi/L$, gets smaller and smaller, the variable is approaching a continuous variable. Therefore, transforming the series coefficients $c_n$ into an integral, and transforming fourier series into an integral too. 

---
### **Fourier Transform**

Then, it's not hard to see that the Fourier Transform of a given function, is a function that represent the continuous frequencies coefficients that makes up the Fourier series of the function, as the interval of the Fourier approaches infinity. 

Here is the Fourier Transform Extracted from the above: 

$$
F(\omega) = \mathcal{F}[f(x)] = 
\int_{-\infty}^{\infty} 
    f(x)\exp(i\omega x)
dx
$$

Then, the inverse Fourier Transform is defined to be: 

$$
f(x) = \mathcal{F}^{-1}[F(\omega)] = \frac{1}{2\pi}
\int_{-\infty}^{\infty} 
    F(\omega) \exp(-i\omega x)
d\omega
$$

However, this is only possible when: 

> The function $f(x)$ is absolutely integrable. This means that integral of $|f(x)|$ over all reals has to be bounded by some number. 

And, for a function to be absolute integrable, we will have the constraint that: 

> $$
> f(x) < \frac{M}{|x|^{1 + \delta}} \quad \delta > 0
> $$

And function that blows up in the real realm is not going to have a Fourier Transform because the integral is just not converging. 

However, there is a very hard proof that show that function of THIS can also be Fourier Transformed: 

$$
|f(x)| < \frac{M}{|x|^{\frac{1}{2} + \delta}} \quad \delta >0
$$

---
### **Theorems From Books**

**Theorem Statement**: 

If $f(x)$ is L2, i.e the function is square integrable, (the integral of $|f(x)|^2$) is integrable.) Then, the fourier transform is tell defined and is in L2, In addition, if F(x) is continuously differentiable, at a point $x$, then the inverse Fourier Transform equals its value $f(x)$. 

[^1]: Notice that the exponent is positive for the kernel used for Fourier Transform, this is not consistent with what we usually have on other sources but it really doesn't matter just swap the sign for $\omega$ and it will work. 

---
### **Why is it Different from other Fourier Transform?**

There are multiple ways to do the Fourier Transform, and there could be different multiplier on the Fourier Transform, but I will summarize it in a much simpler way where I believe, it encapsulates all of the potential ways of doing Fourier Transform. 

Let $u(x)$ be a funtion with spetial domain, denoted by the parameter name $x$. 

$$
\mathcal{F}[u](w) = A\int_{-\infty}^{\infty} 
    f(x)\exp \left(
        \pm iwx
    \right)
dx
$$

Then: 

$$
\mathcal{F}^{-1}[u](w) = B\int_{-\infty}^{\infty} 
    f(x)\exp \left(
        \mp iwx
    \right)
dx
$$

Where $AB = \frac{1}{2\pi}$

Like that. The freuencies in the kernels should have opposite signs, and then the constant must has a product that equals to $\frac{1}{2\pi}$. And when this is true, we can make sure that it perserves the properties of the Fourier Transform, and the inverse Fourier Transform on the Fourier Transform is going to be the identity transform. 