Prereq: [[Fourier Transform Fourier Series]]
The spectral method is using the FFT to solve PDEs with periodic boundary conditions. 

---

### **DFT (Discrete Fourier Transform)**

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

**Comment:**
Notice that, the constant in front of the $DFT$ transform is going to be a bit **fickle**, there are different ways to do it, but the key is that, FFT and then inverse FFT will take it back to the original, which is all we need. 

### **Matrix Representation**

And DFT can be represented as a matrix multiplications too, and this is how this is gonna look like: 

Let the roots of unity be denoted by: 

> $$
> \omega_N^k = \exp\left(
\frac{i2\pi k}{N}
\right)
> $$

Then the DFT matrix is going to be like: 

> $$
> (W_N)_{i, j} = (\omega_N^{j - 1})^{i - 1}
> $$

And this is how it looks like for a $8\times 8$ DFT matrix: 

$$
W_8 = 
\left[\begin{array}{cccccccc}
\omega^{0} & \omega^{0} & \omega^{0} & \omega^{0} & \omega^{0} & \omega^{0} & \omega^{0} & \omega^{0} \\
\omega^{0} & \omega^{1} & \omega^{2} & \omega^{3} & \omega^{4} & \omega^{5} & \omega^{6} & \omega^{7} \\
\omega^{0} & \omega^{2} & \omega^{4} & \omega^{6} & \omega^{8} & \omega^{10} & \omega^{12} & \omega^{14} \\
\omega^{0} & \omega^{3} & \omega^{6} & \omega^{9} & \omega^{12} & \omega^{15} & \omega^{18} & \omega^{21} \\
\omega^{0} & \omega^{4} & \omega^{8} & \omega^{12} & \omega^{16} & \omega^{20} & \omega^{24} & \omega^{28} \\
\omega^{0} & \omega^{5} & \omega^{10} & \omega^{15} & \omega^{20} & \omega^{25} & \omega^{30} & \omega^{35} \\
\omega^{0} & \omega^{6} & \omega^{12} & \omega^{18} & \omega^{24} & \omega^{30} & \omega^{36} & \omega^{42} \\
\omega^{0} & \omega^{7} & \omega^{14} & \omega^{21} & \omega^{28} & \omega^{35} & \omega^{42} & \omega^{49}
\end{array}\right]
$$

### **Derivative With FFT**
Using the properties of the Fourier Transform, we can perform a transformation in the Frequencies domain to take the derivative of the given function. 

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

$$
\mathcal{F}(f|\zeta) = 
\int_{-\infty}^{\infty} 
\exp\left(
	-2\pi i \zeta x
\right)f'(x)\; dx
$$

Where $k$ is replaced by $2\pi \zeta$. This form is closer to the Discrete, FFT algorithm. It's stated here because it can created confusion on the multiplier of the derivative put into the discrete Fourier Transform. 

And when it's DFT, the multiplier for derivative on the Fourier Domain is gonna look like: 

* Assume periodic boundary conditions on the interval $[-L/2, L/2]$
* Assuming Spatial Discretization with $N$ number of evenly distributed points. 
Then the derivative coefficients under the Fourier Domain is going to be expressed as: 

$$k = \frac{2\pi}{L}\left(\frac{N}{2}:\frac{N}{2}- 1\right)$$

And before applying this vector to the Fourier Domain, we need to shift  (`fftshift`) the lower frequencies domain to the center so it matches the format with the Fourier Series. 

#### Comment: 
It's tempting to do the integration via dividing by the multiplier $ik$, but please take note that we will have a **divide by zero** problem when doing that. 

---
### **2D DFT**

Assuming Periodic transform conditions, consider an $M\times N$ grid of data points, the 2d DFT can phrased by the following formula: 

> $$
> F(k, l) = 
> \sum_{m = 0}^{M - 1}\sum_{n = 1}^{N - 1}
> f(m, n)\exp\left(
> -i2\pi\left(
> 	\frac{km}{M} + \frac{ln}{N}
> 	\right)
> \right)
> $$

Ok, looks complicated but it's actually something like this: 

$$
F(k, l) =
\sum_{m = 0}^{M - 1}
\left(
	\exp \left( 
		-2i\pi\frac{km}{M}
	\right)
	\sum_{n = 0}^{N - 1}f(m, n)\exp \left( 
		-i2\pi\frac{ln}{N}
	\right)
\right)
$$

And the operations are nested, and it will be something like this: 

$$
F(k, l) =
\sum_{m = 0}^{M - 1}
\left(
	\exp \left( 
		-2i\pi\frac{km}{M}
	\right)
	F_l(f(m, \_)|m)
\right)
$$

Ok, let's phrase this in term of matrix instead. 

The 1d DFT is a matrix vector multiplications and can be phrased in the following way: 

> $$F = W_Nf$$

Where the W is the DFT matrix, and $W$ will be $N\times N$ in our case. 

Let's use this to make the above expression better and see what is going on here: 

$$
F(k, l) = 
\sum_{m = 0}^{M - 1}
\left(
	\exp \left( 
		-2i\pi\frac{km}{M}
	\right)
	(W_Nf[m,\_])_l
\right)
$$

$$
F(k, l) =
(W_M
	(W_Nf[M = m,N = n])_l)_k
$$

The $(k, l)$ is gotten by: 
* Take 1D DFT on all the columns and take out the $l$ th columns. 
* Take 1D DFT on the $l$ th columns and take out the $k$ th element from that $l$ th column. 

Cool, now let $f$ be a $M\times N$ data matrix, and write it like $f[i, j]$, then the above 2D DFT should be able to summarized as: 
$$
W_M((W_Nf^T)^T)
$$

And I think there is also a Kronecker way of representing the 2D DFT. Yeah... 


### Partial XY in Fourier Domain
Sometimes, when solving the PDEs, we apply Fourier Transform on both the x direction, and the y direction. And analytically, this is as simple as multiplying it by $ik_x$, $ik_y$, however when doing it with DFT, we need to know how to do it. 

### Advection Diffusion Example

As we see in the [[Advection Diffusion]] example, we need to solve a linear system to get the stream function before doing the time-stepping. 

So the math goes something like this: 

$$
\partial_x^2 \phi + \partial_y^2 \phi = \omega
$$

Take Fourier transform on $\partial_x$ and $\partial_y$ on both side we have: 

$$
\widehat{\omega} = -k_x^2 \widehat{\phi} - k_y^2 \widehat{\phi}
$$

$$
\widehat{\phi} = -\frac{\widehat{\omega}}{k_x^2 + k_y^2}
$$

After this, we can use the DFT to compute the right hand side and then take the  inverse Fourier to get the stream function. 

### A Generic Example

When it's linear, it's super easy to apply the Fourier Transform (Or DFT) on the given equations. 

For this, please see [[Spectral Method 2]] for more information. 

