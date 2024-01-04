### **Intro**
- See [link](http://www.ee.ic.ac.uk/hp/staff/dmb/courses/E1Fourier/00300_ComplexFourier.pdf) for materials on Complex Fourier series. 

---
### **Intro to Fourier Transform**

The Fourier transform is a more advanced form of Fourier series where we are going to focus on the infinite domain for a function, and we are interested in expanding the Fourier coefficients from the set of natural number to all the real numbers. 
In this section define what it is and avoid going into the detailed analysis of the transform. 
We list what is expected for a function to be suitable for a Fourier Transform. 

For simplicity we denote $f$ to be the function of interest and $F$ to be the Fourier transform of $F$. 
Let $f\in L^2(\mathbb C)$, meaning that $|f|^2$ is integrable over its domain $\mathbb R$. 
To do Fourier transform, we assume that $f(x): \mathbb R\mapsto \mathbb C$, a function mapping from the space of real to complex. 

#### **Def | Fourier transform**

> $$
> F(k) = 
> \frac{1}{\sqrt{2\pi}}
> \int_{-\infty}^{\infty} e^{-ikx}f(x)dx
> $$

**Observations**

The process of Fourier transform is an application of complex inner product, but paramaterzed by a continuous variable $k$. For specifically we observe that function $F(k)$ in the frequencies domain is just 

$$
\begin{aligned}
    \sqrt{2\pi}F(k) &= \langle f, \exp(ik x)\rangle
    \\
    &= \int_{-\infty}^{\infty} f\; \overline{\exp(ikx)}dx
    \\
    &= \int_{-\infty}^{\infty} f\exp(-ikx)dx. 
\end{aligned}
$$

The fourier transform is demonstrated as a linear mapping between the space of functions $\mathbb R \mapsto \mathbb C$ to the space of $\mathbb R\mapsto C$. 
Orthogonality condition no longer holds as in the case of fourier series for function on $L^2(\mathbb C)$ that has a compact domain over it. 


#### **Def | Inverse Fourier transform**

> $$
> f(x) = \frac{1}{\sqrt{2\pi}}
> \int_{-\infty}^{\infty}
> F(k)e^{ikx}dk
> $$

**Obervations**

It's not entirely obvious that this is the inverse transform of the previous transform. 
This is unlike Fourie series. 


**Remarks**

Take note that there are many different weight can be attached to the integral, but the key here is after a Fourier and the Inverse transform, the weight should allowed it transform back to the original function. 
Additionally, some other transform may use $k = 2\pi \omega$  so that the frequency domain parameter can be interpreted the same as a full period. 
In practice, people use $\hat f$ to denote the Fourier transformed $F$ function. 

---
### **Introduction to Fourier Series**


We presented the Fourier Series in trigonometric form below


$$
\begin{aligned}
    f(x) &\approx 
    b_0 + \sum_{n = 1}^Na_n\sin\left(\frac{n\pi x}{L}\right) + b_n\cos\left(\frac{n\pi x}{L}\right)
\end{aligned}
$$

This is a transformation where we want to express the function in terms of it's Fourier Coefficients, and it's like, they are all smoothed out by the integral taken at the beginning. 
This is the complex form of Fourier Series: 

$$
f(x) = \sum_{n = -\infty}^{\infty}
c_n \exp\left({\frac{in\pi x}{L}}\right)
$$
Where coefficients are given by: 
$$
c_n = \frac{1}{2L} \int_{-L}^{L}f(x)
	\exp\left(\frac{-in\pi x}{L} \right) dx
$$

**Remarks for the Complex Fourier Series and MATLAB** 

$f$ it's on the interval: $[-L, L]$, and the index $n$ is symmetric along zero. 
The available list of indices for $n$ for the complex fourier series are $0, \pm 1, \pm 2, \pm 3 \cdots$. 

When using DFT in MATLAB, it returns the value of approximated $c_n$ in the complex form of fourier series in swapped order.
The list of Fourier coefficients are returned in an array in an order that differs from the odering of the coefficients in the complex fourier series expansion. 
This is the ordering of the vector returned by MATLAB. 

$$
c_{-N}, c_{- N + 1}, \cdots c_{-1}
c_{0}, c_{1}, c_{2} \cdots c_{N - 1} c_{N}
$$

There is the Matlab `fftshift` command in, it will swap the left and right so that the Fourier coefficients are ordered by their respective frequencies. 
Please observe that, if we take the $L$ to infinity, then this formula is looking very similar to the Fourier Transform.

---
### **Properties of the Fourier Transform**

In this section we list a set of useful properties about the Fourier Transform. 
Each of these properties are specific to different type of functions. 

#### **Claim | Representation of Derivative of Fourier Domain**. 

> Let $f:\mathbb R \mapsto \mathbb C$ be a function that is absolutely integrable. 
> Then the Fourier transform of the $n$ derivative can be represented as multiplying by $(ik)^n$ in the Fourier domain. 
> $$
> \widehat{f^{(n)}}(k) = (ik)^n\widehat{f}(k)
> $$

**Example**

Say we want to solve the ODE:  $y''(x) - \omega^2y(x) = -f(x)$ where $x\in [-\infty, \infty]$
Apply Fourier Transform to both side of the equation, we have

$$
\begin{aligned}
    -k^2\widehat{y} - \omega^2\widehat{y} &= -\widehat{f}
    \\
    \widehat{y} &= \frac{\widehat{f}}{k^2 + \omega^2}
\end{aligned}
$$

If we can apply the inverse Fourier Transform then we have a representation for $\widehat{y}$ as a solution to the ODE. 

**NOTE:**

This derivative property **only applies if the function is absolutely integrable on the whole $\mathbb{R}$ domain**, meaning that the absolute value of the function is finite over the whole real realm.  

#### **Claim | Convolution Theorem**

> The Fourier transform on the product of functions $f, g$ is the convolution of $\hat f, \hat g$ in the Fourier domain. 
> $$
>   \mathcal{F}(fg|k) = \mathcal{F}(f|k) * \mathcal{F}(g|k)
> $$
> where * is the convolution operator where it's defined like: 
> $$
>   (f*g)(x) = \int_{-\infty}^{\infty} f(y)g(x - y)dy
> $$

See [Convolution](https://www.wikiwand.com/en/Convolution_theorem) for more information about the theorem. 


---
#### **The Discrete Fourier Transform**

In practice, we use Discrete Fourier transform on a signal, represented by an ordered list of floating points.
See [[MATLAB]] for a list of MATLAB command. Let's denote that $n$ is the index in $x$ (of the vector $f$), and $k$ is the index in $k$ (of the vector $F$). 
We present the formula that is being used for the discrete Fourier transform. 
Here the domain of the function is $\{1, \cdots, N\}$ because it's an array of numbers. 

$$
\widehat{f(n)} = F(k) = 
\sum_{n = 1}^N f(n)\exp\left({\frac{-i2\pi(k - 1)(n - 1)}{N}}\right) \quad 1 \leq k \leq N,
$$

with the inverse being

$$
\widetilde{F(k)} = f(n) = \frac{1}{N}
\sum_{k = 1}^N F(k) \exp\left( 
	\frac{i2\pi(k - 1)(n - 1)}
	{N}
\right) \quad 1 \leq n \leq N
$$

**Observations**

It's a linear transformation conducted by a $N\times N$ matrix. 

---
### **FFT in MATLAB**

This algorithm is fast and it will be the thing we will leverage. 
1. $\mathcal{O}(N\log{N})$
2. $x\in[-L, L]$, periodic B.C
3. $2^n$ points
4. Spectral accuracy

### **Odd and Even Extension**

We can move the function to a $[0, L]$ domain and only uses the $\sin$ or $\cos$ expansion for the function. 
These are the commands in MATLAB `fft`, `dct`, `dct`. 


### **MATLAB Example**
```matlab
L = 20;
n = 128; 
x2 = linspace(-L/2, L/2, n + 1);
x = x2(1:n);  %  Exclude one of the boundary points. 
u = exp(-x.^2);
ut = fft(u);  % To foruier domain 
plot(ut);
```

Please note that there is a shifting for the frequencies domain, and we need to use `fftshit` command to bring it back to match the frequencies domain defined in the Fourier Transform. 
This is the case due some of the subtleties involved in the Discrete Fourier Transform Algorithm.

**NOTE**: 

The Fourier Transform of the Gaussian is the Gaussian. 
To compute the shifted multiplier for FFT derivative, this is the procedures for doing so. 
```matlab
k = (2*pi/L)*(-N/2: N/2 - 1);  % The lower infinite and upper inifity on the fourier transform. 
k = fftshift(k);               % Must shift this or it's not working. 
```

---
### **Applications** 
Stationary Time Series Analysis: 
1. [[Lecture 2 Ch 13.2, Filtering]]
2. [[Lecture 3 Ch 13.3, Freq Denoise]]

