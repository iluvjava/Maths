prereq: [[Fourier Transform Fourier Series]]


---

### Intro

The Fourier transform is a more advanced Fourier series where we are going to focus on the infinite domain of a function. 

Firstly, the function goes from an infinite sum of the weighted Trigs functions into a continuous mapping from the input domain to the Frequencies domain of the function.  

This is the Transformation Formula: 

$$
F(k) = 
\frac{1}{\sqrt{2\pi}}
\int_{-\infty}^{\infty} e^{-ikx}f(x)dx
$$

And the inverse transform is gonna be: 

$$
f(x) = \frac{1}{\sqrt{2\pi}}
\int_{-\infty}^{\infty}
F(k)e^{ikx}dk
$$

Take note that there are many different weight can be attached to the integral, but the key here is after a Fourier and the Inverse transform, the weight should allowed it transform back to the original function.  

**What is this**
It transform something from the data domain to the Frequencies Domain. 

**Properties**
Derivative, ODEs, Please refer to the prereq. 


**NOTE**
Fourier transform on the infinite domain is only possible for function that is bounded on the infinite domain. 

### FFT

This algorithm is fast and it will be the thing we will leverage. 
1. $\mathcal{O}(N\log{N})$
2. $x\in[-L, L]$, periodic B.C
3. $2^n$ points
4. Spectral accuracy

### Odd and Even Extension

We can move the function to a $[0, L]$ domain and only uses the $\sin$ or $\cos$ expansion for the function. 

`fft`, `dct`, `dct`. 


### MATLAB Implementations 
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

This is the case due some of the subtleties involved in the Discrete Fourier Transform Algorithm .

**NOTE**: 
The Fourier Transform of the Guassian is the Guassian. 

To compute the shifted multiplier for FFT derivative, this is the procedures for doing so. 
```matlab
k = (2*pi/L)*(-N/2: N/2 - 1);  % The lower infinite and upper inifity on the fourier transform. 
k = fftshift(k);               % Must shift this or it's not working. 
```



