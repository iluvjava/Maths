prereq: [Calculus of Residual 3](Calculus%20of%20Residual%203.md)
EXTREME INTEGRAL: 
* Unbounded Trigs and Rational
* Bounded Rational Trigs in $[0, 2\pi]$
* Fourier Integrals

---

### Intro
We are going to use the Residual Theorem to solve more classes of function in an exact way. 

> $$\int_{0}^{2\pi} g(\sin(\theta), \cos(\theta))\;d\theta$$

The key here is to convert the problem to an complex contour integral problem, and we will use the following facts about the trigs to guide us for the substitutions of the integrals. 

Let: 
$$
z = \exp(i\theta)
$$
Then 

$$
\cos(\theta) = \frac{1}{2}(\exp(i\theta) + \exp(-i\theta))
$$

And then this is actually: 

$$
\cos(\theta) = \frac{1}{2}(z + z^{-1})
$$

And hence we actually have a a lot of substitutions here for the trigs functions: 

$$
\cos(\theta) = \frac{1}{2}(z + z^{-1}) \quad \sin(\theta)\frac{1}{2i}\left(
z + z^{-1}
\right)
$$

and 

$$
\cos(n\theta) = \frac{1}{2}(z^n + z^{-n}) \quad \sin(\theta)\frac{1}{2i}\left(
z^n + z^{-n}
\right)
$$

And then we also have: 

$$
\cos^n(\theta) = \frac{1}{2^n}(z + z^{-1})^n
$$

The same for the $\sin$: 

$$
\sin^n(\theta)  = \frac{1}{(2i)^n}(z + z^{-1})^n
$$

Which might needs some binomial expansion to help us when we actually need the individual terms for analysis. 

### Example: $\int_{0}^{2\pi} \frac{1}{2 - \cos(\theta)}\;d\theta$

Let's take a look at the following integral: 

> $$
> \int_{0}^{2\pi} \frac{1}{2 - \cos(\theta)}\;d\theta
> $$

The function is rational and there are no singularities in the domain of integral, consider the substitutions of the trigs using the complex variable $z$: 

$$
\cos(\theta)  = \frac{1}{2} (z + z^{-1})
$$

For the integrator: 

$$
dz = d(\exp(i\theta)) = i\exp(i\theta)d\theta = izd\theta
$$

So

$$
d\theta = \frac{dz}{iz}
$$

And as $\theta: 0\rightarrow 2\pi$, we know it's drawing the contour on the complex plane, and the contour is: $|z| = 1$, let $C$ denotes that contour. 

And then we have the following contour integral: 

$$
\oint_C \frac{1}{2 - 1/2(z + z^{-1})}\frac{dz}{iz}
$$

Simplifying it we can get: 

$$
\frac{2}{i}\oint_C \frac{dz}{-z^2 + 4z - 1}
$$

And the negative sign can move by multiplying the fraction at the front with $-i$, and then we will have: 

$$
2i \oint_C \frac{dz}{z^2 - 4z + 1}
$$

And then we look for the **Singularities** of the function that are **inside** the contour $C$, and in this case, the roots of the quadratic equations in the numerator is giving us: 

Solution to $z^2 - 4z + 1$ are $2 \pm \sqrt{3}$, and notice that only the $2 - \sqrt{3}$ lies in the contour $C$, and this means that the contour integral for the function is: 


$$
2i \oint_C \frac{dz}{z^2 - 4z + 1} = 2i(2\pi i)\text{Res}
\left (
\frac{1}{z^2 - 4 + 1}, 2 - \sqrt{3}
\right)
$$

$$
-4\pi\lim_{z\rightarrow (2 - \sqrt{3})} 
\left(
	\frac{1}{z - 2 - \sqrt{3}}
\right) = \frac{2\pi}{\sqrt{3}}
$$

### Example  $\int_{-\infty}^\infty\frac{\cos(kx)}{x^2 + 1}dx$

This is another integral that can be solve with the Residual Theorem: 

$$
\int_{-\infty}^{\infty}\frac{\cos(kx)}{x^2 + 1}dx
$$

Note that, this is actually the real part of the another integral: 

$$
\int_{-\infty}^{\infty}\frac{\cos(kx)}{x^2 + 1}dx
\underset{?}{\quad =\quad }
\Re\left( 
\oint_C\frac{\exp(ikz)}{z^2 + 1}\;dz
\right) 
$$

Where the Contour is an upper semi-circle when $k > 0$ and lower semi-circle when $k < 0$, and when $k = 0$, the integral can be solve with both type of Contour. 

**NOTE:** These type of integral appears a lot when we do Fourier Transform, or Fourier Analysis. I hope you can notice this. 

For the next part, we are going to show the as the $R$, radius of the lower/upper semi-circle is zero as the limit $R\rightarrow 0$, which means that, the contour integral can be evaluated easily with the Residual Theorem. 

**Consider Upper Semi-Circle Contour**

Let's make the Counter $C1$ to be the arch, which means that: 

$$
C1(\theta) = R\exp(i\theta)
$$

Let's consider $\exp(ikz)$, and consider the complex variable $z = x + yi$, which means that: 

$$
\exp(ik(x + yi)) = \exp(ikx - ky)
$$

Note that, **when** $k > 0$, and with the **upper semi-circle contour**, we have: 

$$
\exp(ik(x + yi)) = |\exp(ikx)| |\exp(-ky)|
$$

And as $R \rightarrow \infty$, we have: $|\exp(-ky)| \rightarrow 0$, well then, we will have: 

$$
|\exp(ikx)| |\exp(-ky)| < 1 
$$

And then: 

$$
\frac{|\exp(ikx)||\exp(-ky)|}{1 + z^2} < \frac{1}{z^2 + 1}
$$

And this means that: 

$$
\left|
\oint_{C1}
	\frac{\exp(ikx)\exp(-ky)}{1 + z^2}dz
\right| 
< 
\left|
	\oint_{C1}\frac{dz}{z^2 + 1} 
\right|
\leq
\left|
	\oint_{C1}\frac{dz}{z^2} 
\right|
$$

With the inequality, we have: 

$$
\frac{|\exp(ikx)||\exp(-ky)|}{|1 + z^2|} < \frac{1}{|z^2 + 1|}
$$

And then after taking the limit on the right hand side, we have: 

$$
\lim_{R \rightarrow \infty} \left|
	\oint_{C1}\frac{d(R\exp(i\theta))}{R^2\exp(i\theta)} 
\right| \leq \lim_{R\rightarrow \infty}
\int_{0}^{\pi}
\left|
	\frac{1}{R}
\right|d\theta = 0
$$

And Hence, know that: 

$$
\int_{-\infty}^{\infty}\frac{\cos(kx)}{x^2 + 1}dx
=
\Re\left( 
\oint_C\frac{\exp(ikz)}{z^2 + 1}\;dz
\right) 
$$

Then we know that, this is equal and then we cause use the residual theorem to evaluate the contour integral in the complex plane to obtain the value for the integral in the real realm. 

**Comments**

So, the questions remains know, is the look for a shortcut on identifying functions in the real such that the complex arch approaches zero when we take a trip into the complex plane. 

There is a lemma that can help us to determine the limit of the upper arch quicker, see [Jordan's Lemma](Jordan's%20Lemma.md) for more. 
