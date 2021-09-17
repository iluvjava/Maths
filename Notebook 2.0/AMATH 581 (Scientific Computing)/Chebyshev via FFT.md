prereq: [[Fourier Transform Fourier Series]], [[Cheb Differential Matrix]]

---

This is the Chebyshev Nodes. 
$$
x_j:= \cos\left(\frac{j\pi}{N}\right) \quad x\in[-1, 1]
$$

Let's define the angle as: 

$$
\theta_j:= \frac{j\pi}{N}  \quad \theta \in [-\pi, \pi]
$$

Then: 

$$
x_j = \cos(\theta_j)
$$

Let's say we where given a real function as $f(x): [-1, 1]\mapsto \mathbb{R}$. 

and then : 

$$
F(\theta) = f(\cos(\theta))
$$

Where these are the outputs of $F(\theta)$ for $\theta \in [-\pi, \pi]$. **And the function will be $2\pi$ periodic.**, and it's going to interpolated on the points around the Unit Circle. 

Let $P(\theta)$ interpolates $F(\theta)$, let's also assume that $p(x)$ interpolates $f(x)$. 

This the idea behind using FFT for the cheb derivative. 

$f(x)$ --> $F(\theta)$ --> $P(\theta)$ with FFT --> $P'(\theta)$ --> $p'(x)$ 

Take notice that: $x=\cos(\theta)$. And hence if we try to take the derivative on $P(\theta)$, then we will use the chain rule and get: 

$$
\frac{d}{dx}P(\theta) = \frac{P'(\theta)}{-\sqrt{1 - x^2}}
$$

---

Interpolating the real part of the polynomials with the Chebyshev Polynomials. 
$$
p(x) = \sum_{n=0}^{N} a_nT_n(x) \quad x \in [-1, 1]
$$

For the interpolations that happened in the complex realm, we have; 

$$
P(\theta) = \sum_{n = 0}^N a_n\cos(n\theta) \quad \theta \in [0, 2\pi]
$$

Take notice that: 

$$
T_n(x) = \Re(z^n) = \frac{1}{2}(z^n + z^{-1})
$$

And this is an important link where we have $P(\theta)$ <-->$p(x)$ because: 

$$
p(x) = \sum_{n=0}^{N} a_nT_n(x) = \sum_{n=0}^N a_n \Re(z^n) = \sum_{n = 0}^Na_n\cos(n\theta)
$$

Which is basically saying that: 

$$
p(\arccos(\theta)) = P(\theta) = \frac{dp}{dx}
$$

Then 
$$
\frac{d}{dx}P(\theta) = -\frac{P'(\theta)}{\sqrt{1 - x^2}} \quad x\neq \pm 1
$$
And $$P'(\theta)$$ can **be computed via the FFT** 

However, for the edge cases, we need to take the limit as $x\rightarrow \pm 1$ to get the derivative at the boundary points.  

**Question**: How do we find the polynomial $P(\theta)$ efficiently? 

Take notice that, $x=\cos(\theta)$, take $\theta$ even spaced in range $[-\pi, \pi]$, we will have the corresponding chebyshev nodes in $[-1, 1]$ because of the function $\cos(x)$. And this is saying that, if we use cosine to interpolate the function as if it's in $[-\pi, \pi]$, then we have the function $P(\theta)$. 

---
### Procedures

Say we were given input vector $v$ has has $0\rightarrow N$ points, along the chebyshev nodes. 

1. Mirror the vector so we have the $V$, and the vector is going to be periodic. 

$$
V = \begin{bmatrix}
	v_0 \\ v_1 \\ 
	\vdots\\
	v_{N - 1}\\v_{N}\\ v_{N - 1} \\ v_{N - 2} \\
	\vdots \\ 
	v_1
\end{bmatrix}
$$

2. Compute FFT on the vector $V$ get $\widehat{V}$. 
$$
P(\theta) = \sum_{n = 0}^N a_n\cos(n\theta) \quad \theta \in [0, 2\pi]
$$

3. Take the derivative on the vector $\widehat{V}$, which is basically $ik\odot \widehat{V}$

4. Apply IFFT on the vector $\widehat{V}$, obtain the vector $W$. 

5. Get the value via the expression: 
$$
\frac{W_j}{\sqrt{1 -x_j^2}}
$$
for all the interior points. 

