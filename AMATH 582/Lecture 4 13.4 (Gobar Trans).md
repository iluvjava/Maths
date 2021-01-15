Continuing on Time series for non-stationary signals. 
[[Lecture 3 Ch 13.3 (Freq Denoise)]]
Topics: 
1. Limitations of the Fourier Transform
2. Gabor Transform and it's properties
3. Discrete Gabor Transform

---

### Limitations 
Given a signal $s(t)$, with a certain length. 

The Fourier Transform of the whole signal over the over all time domain, we lost the information when: 
1. When did the signal with a certain frequencies appeared? 

So our previous method, it's analyzing what we call: 
* Stationary Signal

A **Stationary Signal** has unchanged spectral content. 

A **Non-Stationary Signal** is a signal that change in time, and the frequency content will also change. The spectral looks very different depending on which part of the song we are looking at. 

* Fourier Transform is useless under this context. 

---
### Options and other Ideas : Gabor Transform
* We open a small window on the signal and then use the Fourier Transform. 

**How do we open the window?**

Let a function $g$ be a function that filter the signal (Like how we use the Guassian Distribution to filter out the signal before), let the function be associated with the parameter $a$, representing the length of the filter. 

And then we apply a variable $\tau$, which represents the **shift** of the filter along the signal. 

**Gabar in 1946**
$$
g_{\tau, w}(\tau) = \exp(i\omega \tau)g(\tau - t)
$$

And this is our new Fourier Kernel. Observe the following about this new expression: 
1. The Omega is changing the frequencies basis. 
2. The $\tau$ is shifting the Kernel function $g$ along the time in the signal domain. 
3. The $t$ is just time. 

And then this time, there will be 2 parameters associated with our Fourier Transform, the $\tau$, time offset, and the $t$, the time. 

And then the Fourier Transform is gonna be like: 

$$
G\;[f](t, \omega) = \widetilde{f_g} = \int_{-\infty}^{\infty}
f(\tau)\exp(-i\omega\tau)\bar{g}(\tau-t)d\tau
$$

Where the $\bar{g}$  is taking the Complex Conjugation. 
Observe that, with the function $g$ set to 1, we have the definition of the Fourier Transform. 

* Moving the t: Taking the Kernel with Offset $\tau$, multiplying it with the signal and then take the Fourier Transform on that. 
* Moving the $\tau$ : Changing the offset of the Kernel Function. 

**What is the Function g?**
1. Generically it can be anything. 
2. But pratically we want the function to be symmetric around a vertical axis. 
3. By default we use the Guassian Function, but the reason behind it is complex. It has the best resolution on both the space and time domain. 
4. If $g$ is real and symmetric with $||g|| = \int_{-infty}^\infty |g|^2d\tau = 1$ 
	Then the definition will changed into this: 
$$
\widetilde{f_g}	(t, w) = \int_{-\infty}^{\infty}f(\tau)g(\tau - t)\exp(-i\omega t)d\tau
$$

Notice that the complex conjugate is gone. This is called: **Short Time Fourier Transform**

Properties: 
* The Energy is bounded (Shcarwz) $|\widetilde{f_g}(\tau, \omega)| \leq ||f||||g||$
* Energy around $(t, \omega)$: $|\widetilde{f_g}(t, \omega)|^2 = |\int_{-\infty}^{\infty}f(\tau)g(\tau - t)\exp(-i\omega t)d\tau|$, which is the mean of the energy. 
* And the Variance is gonna be computed by: 
$$
\sigma_t^2=\int_{-\infty}^\infty(\tau - t)^2|g_{\tau, \omega}(\tau)|^2 d\tau$$
This is the variance along the signal domain where $g_{t, \omega} = \exp(i\omega\tau)g(\tau - t)$ .
$$
\sigma_\omega^2 =
\frac{1}{2\pi}
\int_{\infty}^\infty(\mu - \omega)^2|\hat{g}_{\tau, \omega}(\mu)|^2d\mu
$$
These 2 will compute how localized a signal is. 

* Linearity $G[af_1 + bf_2] = aG[f_1] + bG[f_2]$

* Inverse 
$$
\widetilde{f_g}	(t, w) = \int_{-\infty}^{\infty}f(\tau)g(\tau - t)\exp(-i\omega t)d\tau
$$
And the inverse of the transform is: 

$$
f(\tau) = \frac{1}{2\pi||g||^2}\iint_{-\infty}^\infty
\widetilde{f_g}(t, \omega)g(\tau - t)\exp(i\omega t)d\omega dt
$$

#### Extra Links: 
[Wiki: Short Time Fourier Transform](https://www.wikiwand.com/en/Short-time_Fourier_transform)

#### Extra Comments About the Variance

The variance is for the Gabor Window, in which, information regarding the original window is not there. 

**Note**: The $\sigma_t, \sigma_\omega$ of $t$ and $\omega$ is governed by the **Heisenberg Uncertainty Principle**. 


---

### Discrete Gobar Transform
Computationally the thing is going to be discrete and it's looking like this: 

$$
g_{m, n}(t) = \exp(i2\pi m\omega_0 t)g(t - nt_0)
$$

So this is a 2D Kernel, and notice that, $m$ is shifting the frequencies while the $n$ is shifting the position of the kernel. 

The component $t - nt_0$ moves the kernel on the signal in a discrete manner, fixing the frequencies. 

The component $m\omega$ shifts the frequencies we are trying to project for the, fixing the kernel. 

---

### For Completeness
- Zak Transform 
- Weiner Wille Transform