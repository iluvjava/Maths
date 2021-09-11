Time series 3. 
prereq: [[Lecture 2 Ch 13.2 (Filtering)]]

---
### Intro

So here we are considering a lot of signals receives over a time frame. And we are still using the assumption that we have a target that is not moving in front of us. 

The expectation value for the white noise is zero after making a lot of observations. And this is going to be exploited. 

So... if we add all the signal over a time range for each time frame, we would expect the noisy part of the signal gets canceled out.

---
### MATLAB CODE

Let's define some of the basic things: 
* Domain Length
* Frequencies Resolution 
* Time Domain Vector 
* Frequency Domain Vector, shifted
* Noise Level

```matlab
L = 30;
n = 512; 
t2 = linspace(-L, L, n + 1); t = t2(1: n);
k = (2*pi/(2*L))*[0:n/2 -1 -n/2:-1]; ks = fftshift(k);
noise = 10;
```

* Define the signal. Which is a Hermite function. 

```matlab
u = sech(t); 
ut = fft(u);
realize = 1;
```

Let's assume that we keep processing this kind of impulse signal for a fixed time length, over several time. This is called: **Realization**. 

```matlab
uave = zeros(1, n);

for j = 1: realize
	utn = ut + noise*(rand(1, n) + i*randn(1, n));
	un = ifft(utn); 
	uave = uave + utn; 
	subplot(3, 1, 1), plot(t, un); 
	subplot(3, 1, 2), plot(ks, fftshift(abs(un)));
	subplot(3, 1, 3), plot(ks, fftshift(abs(uave)), ... 
		ks, fftshift(abs(ut)/max(abs(ut)));
	pause(1); 
end
```

If we keep adding the frequencies together, then, we should have the white noise part to go to zero. 

And after a lot of trials, we will have the noise canceled. 

**NOTE**: 
It doesn't matter if we are summing up in the signal domain or the frequency domain, but summing them up in the end will cancel out the noise regardless. 

---
### Moving Target

*What happen in the time domain, the thing is moving around? *

> When the thing is moving around, the signal will get shifted in the signal domain, left and right.  

*What about the Frequency domain? Is it also moving?*

> Take notice that, because we are sending out the same signal frequencies for each impulses, we know that the in the frequencies domain, the signal should look the same. 

*How should we detect it?*

> If we average on the signal space, then there will be blurred because the impulses in the signal over the time series are at different place. 
> 
> However, because the impulse is consistent on the frequencies domain, summing them up will cancel out the noisy part in the frequencies domain. 

> We cannot detect if with FT, because we only have the spectral information and we have no idea when we have detected that particular frequencies (reflected from our objects) in the signal. 

---
### Limitation of Fourier

The Fourier Transform limitations arises with the resolution in the frequency domain. 

When we have a very good resolution in the time domain, there will be more noise to pick up in the frequency domain. 