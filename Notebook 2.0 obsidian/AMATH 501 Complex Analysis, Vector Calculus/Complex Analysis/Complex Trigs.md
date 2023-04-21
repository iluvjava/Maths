So, the trig functions and  the hyperbolic Trig Functions can be extended to the complex numbers too. 
prereq: [[Analytic Functions, Polynomials and Exponentials]]

---

### Intro

The complex trig function is an analytic extension of the real trig functions, and in this case, it preserves all of the properties of the real Trigs function, and it's derived from the complex extension of the exponential function. However, it has interesting connection to the hyperbolic functions. 

---
### Def 

> $$\cos(z) = \frac{1}{2}\left(\exp(iz) + \exp(-iz)\right)$$

where the $\exp$ function is the exponential function we derived earlier. 

> $$
> \sin(z) = \frac{1}{2i}\left(\exp(iz) - \exp(-iz)\right)
> $$

Yeah, this is literally taking out the real and the complex part of the complex number, but this time, we do it on the polar form with the complex conjugate. Easy. 

### Properties Preserved: 

* Derivative still follows the same rules. 
* The symmetry where $\cos(z) = \cos(-z)$ and $\sin(z) = -\sin(z)$, so the function is still odd, and even for the $\sin$ and the $\cos$ function. 
* Pythagorean Theorem:  $\sin(z)^2 + \cos(z)^2 = 1$ is true. 
* $\tan(z) = \frac{\sin(z)}{\cos(z)}$, still true, and hence, all other trigs functions are going to be defined too after the $\sin$ and $\cos$. 

### New Properties: 
* $\cos(z) = 4$ is something that has a solution to now, so that is kinda cool. 

### Hyperbolic 
Let's investigate the connections between these 2 things. So it's like: 

> $$\cosh(x) = \frac{e^z + e^{-z}}{2}$$

> $$\sinh(x) = \frac{e^z - e^{-z}}{2}$$

So then we can also express the trig function with the hyperbolic functions, and it's like: 

> $$\cos(iz) = \cosh(z)$$

> $$\sin(iz) = i\sinh(z)$$

#### A More Scary Variation

$$\cos(z) = \frac{1}{2}(\exp(ix - y) + \exp( -ix + y))$$

$z = x + yi$ as a direct substitution. 

$$
\frac{1}{2}(e^{-y}(\cos(x) + i\sin(x)) + e^{y}(\cos(x) - i\sin(x)))
$$

Collect the like terms: 

$$
\frac{1}{2}(\cos(x)(e^{y} - e^{-y}) + i\sin(x)(e^{-y} - e^y))
$$

$$
\frac{1}{2}(\cos(x)(e^{y} - e^{-y}) - i\sin(x)(e^y - e^{-y}))
$$

$$
\cos(x)\sinh(y) - i\sin(x)\sinh(y)
$$

Let's Frame it with a MD quote like this: 

> $$\cos(z) = \cos(x)\sinh(y) - i\sin(x)\sinh(y)$$

This is saying the following: 
* If I go in the $x$ direction, then we are introducing oscillation in the real component and the imaginary component of the number. 
* If I go in the $y$ direction, then I am introducing an exponential growth/decay into the real and the complex component. 

**Comment**:  Interesting. 

Similarly we can also express the $\sin(z)$ in terms of the Hyperbolic Function, and it will be like: 

$$
\sin(x) = \frac{1}{2i}(\exp(ix - y) - \exp(-ix + y))
$$
(...) after some math we have: 
> $$
> \sin(z) = (i\cos(x)\sinh(y) + \sin(x)\cosh(y))
> $$

