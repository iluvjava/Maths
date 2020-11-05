Sometimes we want to use Fourier Transform to solve computational problem. This can be an even faster method compare to iterative solver combined with a direct method approach. 

background: [link](http://www.ee.ic.ac.uk/hp/staff/dmb/courses/E1Fourier/00300_ComplexFourier.pdf)

---

### Fourier Transform

Let's remind ourselves what the heck it is first: 

$$
F(k) = 
\frac{1}{\sqrt{2\pi}}
\int_{-\infty}^{\infty} e^{-ikx}f(x)dx
$$

Where the $e^{ikx}$ where it's like the kernel for a function convolution. 

And the **Inverse Fourier Transform** is gonna be like: 

$$
f(x) = \int_{\infty}^{\infty} e^{ikx}F(k) dk
$$
please notice that, the kernel is now the reciprocal of the previous one and we are taking the integral with respect to $k$ instead the old parameter $x$. 

And then this is the convolutional Kernel: 

$$
e^{ikx} = \cos(kx) + i\sin(kx)
$$

#### Fourier Series: 


This is the trig Form Fourier series: 

$$
f(x) \approx b_0 + \sum_{n = 1}^Na_n\sin(\frac{n\pi x}{L}) + b_n\cos(\frac{n\pi x}{L})
$$

And interestingly, the connection here is that: $F^{d}(k) = a_n, b_n$. This is a transformation where we want to express the function in terms of it's Fourier Coefficients, and it's like, they are all smoothed out by the integral taken at the beginning. 

This is the complex Form Fourier Series, and it's looking like: 

$$
f(x) = \sum_{n = -\infty}^{\infty}
c_n \exp\left({\frac{in\pi x}{L}}\right)
$$
Where coefficients are given by: 
> $$
> c_n = \frac{1}{2L} \int_{-L}^{L}f(x)
> 	\exp\left(\frac{-in\pi x}{L} \right) dx
> $$

Note that it's on the interval: $[-L, L]$, and the n is like symmetric along zero, so it's like: $0, \pm 1, \pm 2, \pm 3 \cdots$

**Note**
When using DFT, it actually returns the value of approximated $c_n$ in swapped order, so results are actually coefficients ordered like this: 

$$
c_{-N}, c_{- N + 1}, \cdots c_{-1}
c_{0}, c_{1}, c_{2} \cdots c_{N - 1} c_{N}
$$

And there is where the Matlab `fftshift` command comes in, it will swap the left and right so the low frequencies. 

Also, please observe that, if we take the $L$ to infinity, then this formula is looking very similar to the Fourier Transform.

#### DFT (Discrete Fourier Transform)

[[MATLAB]]: How we do FFT in Matlab. 

Let's denote that $n$ is the index in $x$ (of the vector $f$), and $k$ is the index in $k$ (of the vector $F$)

$$
\widehat{f(n)} = F(k) = 
\sum_{n = 1}^N f(n)\exp\left({\frac{-i2\pi(k - 1)(n - 1)}{N}}\right) \quad 1 \leq k \leq N
$$

And the inverse Fourier Transform is gonna be: 

$$
\widetilde{F(k)} = f(n) = \frac{1}{N}
\sum_{k = 1}^N F(k) \exp\left( 
	\frac{i2\pi(k - 1)(n - 1)}
	{N}
\right) \quad 1 \leq n \leq N
$$

This is how we use the DFT to find the derivative of some kind of periodic data: 

```matlab
L  = 5;
N  = 2^8;
x2 = linspace(-L/2, L/2, N + 1);  % Query points. 
x  = x2(1:N);  % Trim off the last point because of periodic conditions. 

u = exp(-x.^2) % cos(x).*exp(-x.^2/25);
U_Fourier = fft(u);

k = (2*pi/L)*(-N/2: N/2 - 1);  % The lower infinite and upper inifity on the fourier transform. 
k = fftshift(k);  % Must shift this or it's not working. 

figure(1);
plot(x, u); hold on;

% Taking derivative on the Fourier Space it's gonna be like: 

dU_F  = i.*k.*U_Fourier;
dU2_F = (i.*k).^2.*U_Fourier;
dU    = ifft(U_Fourier);
plot(x, real(dU));
plot(x, real(ifft(dU_F)));
plot(x, real(ifft(dU2_F)));


```

**Notice:** 

Notice the usage of the `fftshift` command, it has to be done for the derivative coefficients or the fft functions itself to. 


#### Notations:

$$
\widehat{F(x)}: \text{Fourier Transform}
$$
Remember it's going to change to a function of $k$, not a function of $x$ anymore. 

And sometimes this is not cool we can always use the Fourier Series notation to represent this so it's gonna be like: 

$$
\mathcal{F}(f\;|\;k): \text{Fourier Transform and wrt k}
$$


**Note:**
There are other ways of writing the same thing, the other major way of writing it it's like: 

$$
\mathcal{F}(f|\zeta) = 
\int_{-\infty}^{\infty} 
\exp\left(
	-2\pi i \zeta x
\right)f'(x)\; dx
$$

Where $k$ is replaced by $2\pi \zeta$. This form is closer to the Discrete, FFT algorithm. It's stated here because it can created confusion on the multiplier of the derivative put into the discrete Fourier Transform. 

---

#### Properties of the Fourier Transform 
$$
\widehat{f^{(n)}(x)} = (ik)^n\widehat{f(x)}
$$

Say we want to solve the equation: 

$$
y''(x) - \omega^2y(x) = -f(x)
$$
Where $x\in [-\infty, \infty]$

And then applying the Fourier Transform to both side of the equations we are going to have: 

$$
-k^2\widehat{y} - \omega^2\widehat{y} = -\widehat{f}
$$

 Solving for $y$, we are going to have this: 
 
$$
\widehat{y} = \frac{\widehat{f}}{k^2 + \omega^2}
$$

And then, we are literally one step away from getting the solution, applying an inverse Fourier Transform here to get the expression for the quantity $\widehat{y}$. 

**NOTE:**

This derivative property **only applies if the function is absolutely integratable on the whole $\mathbb{R}$ domain**, meaning that the absolute value of the function is finite over the whole real realm.  


#### Pros and Cons DFT

1. Operations is $\mathcal{O}(N \log(N))$
2. It's only suitable for Periodic Conditions, if not the boundary will be look really ugly and there will be oscillations. 
3. Discretization has to be $2^n$
4. The order of accuracy of the method is exponential, so it's pretty insane. 

[[MATLAB]]: How we do FFT in Matlab. 

Let's denote that $n$ is the index in $x$ (of the vector $f$), and $k$ is the index in $k$ (of the vector $F$)

$$
\widehat{f(n)} = F(k) = 
\sum_{n = 1}^N f(n)\exp\left({\frac{-i2\pi(k - 1)(n - 1)}{N}}\right) \quad 1 \leq k \leq N
$$

And the inverse Fourier Transform is gonna be: 

$$
\widetilde{F(k)} = f(n) = \frac{1}{N}
\sum_{k = 1}^N F(k) \exp\left( 
	\frac{i2\pi(k - 1)(n - 1)}
	{N}
\right) \quad 1 \leq n \leq N
$$
