Signal filtering with Fourier Transform

---

### Intro

Send out radio wave with frequencies $\omega_0$, and then it hit the object and come back. 

The radar receives all the frequencies in the radio wave. 

Our objective is to identify the object. 


```matlab
clear all; close all; 
L  = 30;    % The total mount of signal. 
n  = 512;   % These are the Fourier nodes 
t2 = linspace(-L, L, n + 1); t = t2(1:n); 
k  = (2*pi/(2*L))*[0:(n/2 - 1) -n/2:-1];
u  = sech(t);
ut = fft(u);   % Fourier Domain
utn = ut + noise*(randn(1, n) + i*randn(1, n));  % domain

plot(fftshit(k), fftshift(abs(ut))/max(abs(ut)))  % The strengh of the freqiencies

```

So far, we just plotted the frequencies domain against the **normalized**, **absolute value** of the frequencies on the given signal: `u`.

**Why is it normalized?** 
Because we are only interested in the magnitude of the wavelength, instead of the entire coefficient, which contains imaginary unit and phase information. 

However, the presence of the noise gives us difficulty for identifying the frequencies that has a significant level of strength. 

**Why is Hyperbolic Secant?** 
This is the case because the function is own Fourier Transform and it belongs to a class of functions call: Hermite function. 

### Time Series 

If we take the observation of the signal across a time frame, and making the assumption that the noise are not going to be correlated to the time series. 

However, for the non-noisy part of the signal, it's not going to be correlated to the time parameter. 

### Filtering 

Notice that we know the frequencies of the signal we are sending out, and what we did is we filter out the signal at the frequencies using a Gaussian Filers. 

```matlab
filter = exp(-0.2*k.^2)  # note that the k is the same from above.
```

It's like opening out a window at the frequencies domain, and extract out the frequencies. 

```matlab
utnf = utn.*filter  % that is how you filter out the signal. 
```

After filtering out the frequencies, we inverse fft the filter signal. Then we **compare** it to the expected form of the signal that should be reflected. 

**What if we filter around another signal that is different from the signal we sent out?**

We do the same thing, and then we will find that, there will not be a bump after the inverse FFT. 

**Why?**
Because white noise are out of phase, and when they recombined after inverse transform, a bit deal of them will get phase cancellation, reducing the signal strength. 

**Is it possible to miss detect?**
Yes, but over the time frame, it will still get cancel out, this is the case because white noise won't persist for too long. 

#### Changing the Filter Width

As we **decreases** the frequencies window of the frequency, the sensitivity because cutting out the frequencies reduces the ability to reconstruct the original signal we are interested in. 

As we increases it, we will bring the noise level much closer to the threshold. 



