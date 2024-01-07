- [Introduction to Fourier Transform Fourier Series](Introduction%20to%20Fourier%20Transform%20Fourier%20Series.md)

---
### **Introduction**

We take the content of this file from the video by Professor Nathan Kutz [here](https://www.youtube.com/watch?v=ViZYXxuxUKA). 

**Topics:** 
1. Wavelets Transform
2. Its mathematical properties
3. Formal architecture for multi-resolution analysis

The term wavelet comes from "Little Wave". 
The wavelet transform is an improvement over the Gobar Transform. 
To understand wavelet transform, we need to understand what is wavelets. Recall that [Gabor Transform](Gabor%20Transform.md) is a method that can take out the local frequencies information over a specific time domain on the signal. 

---
### **Wavelets**

We have a signal over time: $s(t)$, we want to understand: 
1. The frequency content of the signal. 
2. The frequencies content at different moment in time. 

Previously we have the Gobar Transform. 
If the Gobar window is small, the low frequencies information will be lost.
If the window size is too big, we lost the time locality of the frequencies we measured. 

#### **Gabor Extension**
Let's suppose that a window has 2 parameters. 
- Short time Window: 
	- $a$ --> Scaling of the window
- Translation in Time: 
	- $\tau$--> Translation in Time

That would be a wavelet. 
 
 
### **A Mother Wavelet**

We present the generic representation of a mother wavelet. 
$$
\psi_{a, b}(t) = \frac{1}{\sqrt{a}}\psi
\left( 
\frac{t - b}{a}
\right)
$$


**Parameters:**
1. $a$ horizontal scaling. 
2. $b$ horizontal location.

The multiplier $1/\sqrt{a}$ ensures that the integral of $|\phi_{a,b}(t)|^2$ stays the same for different choices of $a, b$. 
However, there are limits to what a wavelet can be. 
The following definition defines properties of a wavelet that were to be expected when applying the wavelets to wavelet transform. 

#### **Def | Admissibility of Wavelets**
> A mother wavelet of the form $\psi_{a,b}(t) = (1/\sqrt{a})\psi((t-b)/a)$ is admissible if 
> $$
>	C_\psi = 
> 	\int_{-\infty}^{\infty}\frac{|\widehat{\psi}(\omega)|^2}{|\omega|}d\omega < \infty.
> $$
> $\widehat\psi$ is the fourier transform of the mother wavelet $\psi_{a,b}(t)$. 

**Observations**

There are other characterizations of admissibility, which should be equivalent. 

---
### **Example | Haar Wavelet $\psi(t)$, 1910**

Below is an illustration of Haar Wavelet. 

![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Haar_wavelet.svg/1280px-Haar_wavelet.svg.png?1610063537958=600)


Mathematically, this is the Haar Wavelet
 
$$
	\psi(t) =
	\begin{cases}
		1 & 0 < t \leq  1/2
		\\[0.5em]
		-1 & 1/2 \leq t < 1
		\\[0.5em]
		0 & \text{else}
	\end{cases}
$$

Normalized mother wavelet would be: 

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




---
### **Example | Mexican Hat Wavelet** 

The Mexican hat wavelet is $\psi(t) = (1 - t^2) \exp(-t^2/2)$, below is a plot of $\psi$. 
	 
![](https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/MexicanHatMathematica.svg/640px-MexicanHatMathematica.svg.png)

And the Fourier Transform is gonna be: 

$$
\widehat{\psi}(\omega)\sqrt{2\pi}\omega^2\exp(-\omega^2/2)
$$

---
### **Generic Continuous Wavelet Transform**

#### **Def | Continuous Wavelet Transform**

> Given $\psi$ such that it is an admissible wavelet the Continuous wavelet transform is defined as
> $$
> 	W_{\psi}[f](a, b) = \langle f, \psi_{a, b}\rangle
> 	=
> 	\int_{-\infty}^{\infty}f(t)\bar{\psi}_{a, b}(t)dt.
> $$
> And the inverse transform:
> $$
> 	f(t)=
> 	\frac{1}{C_{\psi}} \int_{-\infty}^{\infty} 
> 	\int_{-\infty}^{\infty} 
>		\mathcal{W}_{\psi}[f](a, b) \psi_{a, b}(t) \frac{d b d a}{a^{2}}. 
> $$



**Note:** 

$\bar\psi$ denotes the complex conjugate of $\psi$. 
This is due to the semi-inner product for the complex vector spaces of functionals. 
Observe the fact that a 1D signal has a 2D representation under the continuous wavelet transform. 


---
### **Convolutions Of Wavelets**

#### **Thm | Convolutions of Wavelets**
> Let $\psi$ be an admissible wavelet, let $\phi$ be a bounded and integrable function, then $\psi\star\phi$ is a wavelet. 

**Remarks**
We state the theorem as a fact. 