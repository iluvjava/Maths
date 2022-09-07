Wavelets. 

Topics: 
1. Wavelets Transform
2. Its mathematical properties
3. Formal architecture for multi-resolution analysis

The term wavelet comes from "Little Wave". The wavelet transform is an improvement over the Gobar Transform, where it solve the problem of decreasing balancing between Frequencies and Time resolution of the signal. 

[Gabor Transform](Gabor%20Transform.md)

---
### Wavelets 
Problem Statement: We have a signal over time: $s(t)$, we want to understand: 
1. The frequency content of the signal. 
2. The frequencies content at different moment in time. 

Previously we have the Gobar Transform. 

If the Gobar window is small, we will not have enough information about the low frequencies, they are lost. If the window size is too big, we are throwing away the information about the time frame for each frequencies (Lost of Time localization for frequencies)

#### Gabor Extension
- Short time Window: 
	- $a$ --> Scaling of the window
- Translation in Time: 
	- $\tau$--> Translation in Time

We we can also slide the window size around too, this is what wavelet is going to do. It's going to tweak the window size as well as the filter offset, along with the domain of time localization. 
 
 
 ### A Mother Wavelet: Little Wavelet
 
$$
\psi_{a, b}(t) = \frac{1}{\sqrt{a}}\psi
\left( 
\frac{t - b}{a}
\right)
$$

The type of wavelet is very specific for different domain, when actually doing this seriously, we need Domain Specific Knowledge about the wavelets people use for the signal. 

Parameters:
1. $a$ filter scaling
2. $b$ translation in time

#### Haar Wavelet $\psi(t)$: 1910
 ![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Haar_wavelet.svg/1280px-Haar_wavelet.svg.png?1610063537958=600)

* Sliding in the time domain of the signal 
* Changing  the width of the wavelet 
* Transforming on different frequencies of the spectrum
 
And the function is like: 
 
$$
 \begin{cases}
 1 & 0 < t \leq  1/2
 \\[0.5em]
 -1 & 1/2 \leq t < 1
 \\[0.5em]
 0 & \text{else}
 \end{cases}
$$
Properties: 
 
$$
\int_{-\infty}^{\infty} \psi(t) dt\int_{-\infty}^{\infty} |\psi(t)| dt = 0 \quad 
$$

And Substituting it we have: 

$$
\psi_{a, b}(t) =
\frac{1}{\sqrt{a}}
\psi\left(
\frac{t - b}{a}
\right)
=
\begin{cases}
\frac{1}{\sqrt{a}} & 0 < t - b \leq \frac{a}{2} \\[0.5em] 
-\frac{1}{\sqrt{a}} & \frac{a}{2} \leq t - b < 1 \\[0.5em]
- 0 & \text{else} \\
\end{cases}
$$

$a/2$ width of upper half and lower half of the wavelet centered around the parameter $b$. 

**How to use it**

Fix the width -> Find where in time the frequencies are -> Change the length to find the best width. 

### Wavelet Transform and Its Procedures
A divide by conquer approach. Cut the time domain in half again and again, shrink down the wave let to smaller and smaller width. And this is the algorithm for the wavelet. 

### Comment and Intuitive Comparison

1. Raw Signal: We have all information about the signal behavior in time, the Time Resolution is High. 
2. Fourier Transform: We have a very good idea about all the Frequencies in the signal, but we have no idea where it is in time inside of the signal. We are doomed if we want the time information for the signal.
3. Gobar Transform: The window gives some time information and the frequencies information. We are able to query for a specific time fractions and the frequency information for the time fractions. 
4. WaveLet: Spectral transform the whole damn thing, and then we divide and conquer on the signal time domain and do the Fourier Transform. **BOOM!** We get the best of both worlds. 

---
### Continuous Wavelet Transform: Generic
Mother wavelet as the transform kernel for the signal 

**Define**: 

$$
\widehat{\psi}_{a, b} = \frac{1}{\sqrt{|a|}}
\exp(-ib\omega)\widehat{\psi}(a\omega)
$$

And for any wavelet that can work, we will expect the property that: 

$$
C_\psi = \int_{-\infty}^{\infty}\frac{|\widehat{\psi(\omega)}|}{|\omega|^2}d\omega < \infty
$$

It has to be bounded, it's called: **Admissibility**. 

$$
W_{\psi}[F\;](a, b) = \langle f, \psi_{a, b}\rangle
=
\int_{-\infty}^{\infty}f(t)\bar{\psi}_{a, b}(t )dt
$$

And the inverse is gonna be like: 

$$
f(t)=\frac{1}{C_{\psi}} \int_{-\infty}^{\infty} \int_{-\infty}^{\infty} \mathcal{W}_{\psi}(f)(a, b) \psi_{a, b}(t) \frac{d b d a}{a^{2}}
$$

Which is kind of similar to what we have for the Gobar transform. 


**Note:** The Complex Conjugate here is needed for Generic Reasons, and it's left there because the wavelet doesn't have to be the Baar Wavelet. The Bar wavelet is very nice. 

---
### Other Wavelets 

$\psi$ is a wavelet, $\phi(t)$ is a bounded integrable function, then $\psi\phi$ is another wavelet. 

 So, we can create crazy wavelet and a lot of different options for choosing these kind of things. 
 
 ---
### Mexican Hat Wavelet 
 
$$
\psi(t) = (1 - t^2) \exp(-t^2/2)
$$
	 
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/MexicanHatMathematica.svg/640px-MexicanHatMathematica.svg.png)

And the Fourier Transform is gonna be: 

$$
\widehat{\psi}(\omega)\sqrt{2\pi}\omega^2\exp(-\omega^2/2)
$$

### Time Frequencies Localization (Variance)

$$
\sigma_t^2 = \int_{-\infty}^\infty
(t - \langle t\rangle)^2|\psi(t)|^2dt
$$
How much energy is around a specific time. 
$$
\sigma_{\omega}^2 = \int_{-\infty}^\infty
(\omega - \langle \omega\rangle)|\widehat{\psi}(\omega)|^2d\omega
$$

---