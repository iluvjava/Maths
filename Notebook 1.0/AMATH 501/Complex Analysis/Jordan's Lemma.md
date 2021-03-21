prereq: [[Calculus of Residual 3.1]]

For the Fourier type of integral, When does the integral of the upper arch Vanish after the limit?

In this note, we introduce the idea of Jordan's lemma, which will be a shortcut for figuring out the limit of some cases of Fourier Integral. 

---


### Jordan's Lemma 

Let $C^+ = \{z = R\exp(i\theta), 0 \leq \theta \leq \pi\}$ be an arch on the positive half of the complex plane, with radius R. 

Suppose we are interested in the integral: 
$$
J = \int_{C^+} f(z) \exp(ikz)dz
$$
Assuming $k > 0$

And we know that: 
$$
\lim_{R\rightarrow \infty} |f(z)| = 0 \quad \forall \theta \in [0, 2\pi]
$$

Then the contour: 

$$
\lim_{R\rightarrow 0} |J| = 0
$$

#### Proof

Consider the integrand and integrator and we have: 

$$
f(z)\exp(ikz) \quad dz
$$

Letting $z = R(\cos(\theta) + i\sin(\theta))$

$$
f(R\exp(i\theta))\exp(ikR\cos(\theta))\exp(-kR\sin(\theta))
$$

$$
d(R\exp(i\theta))
$$

Taking the Modulus we have: 

$$
|f(z)\exp(ikz)| = |f(R\exp(i\theta))\exp(-kR\sin(\theta))|
$$

And hence we are solving the contour integral: 

$$
\int_{0}^\pi R|f(R\exp(i\theta))\exp(-kR\sin(\theta))|d\theta
$$

Using the fact that limit exists for $f(z)$ on $C^+$, we then know that it's bounded: 

$$
M(R) = \max_{z\in C^+}(|f(R\exp(i\theta))|)
$$

And this limit, will exist as a finite number by hour lemma. and we also know that $M(r)\rightarrow 0$ as $R\rightarrow \infty$. 

let's go back to the integral: 

$$
\int_{0}^\pi RM(R)|\exp(-kR\sin(\theta))|d\theta
$$

$$
|J| \leq RM(R)\int_{0}^\pi |\exp(-kR\sin(\theta))|d\theta
$$

**Note the following fact** (Out of no Where but very Handy): 
$$
\sin(\theta) \geq \frac{2\theta}{\pi} \implies -\sin(\theta) \leq -\frac{2\theta}{\pi} \quad \forall \theta \in [0, \pi/2]
$$
Which then means that: 

$$
|\exp(-kR\sin(\theta))| \leq 
\left\vert \exp\left( 
	\frac{-2}{\pi}kR\theta
\right)\right\vert \quad \forall \theta \in [0, \pi/2]
$$


$$
RM(R)\int_{0}^\pi |\exp(-kR\sin(\theta))|d\theta 
= 
2RM(R)\int_{0}^{\pi/2} |\exp(-kR\sin(\theta))|d\theta
$$

Because $\sin$ it's symmetric there. 
Then: 

$$
2RM(R)\int_{0}^{\pi/2} |\exp(-kR\sin(\theta))|d\theta \leq 
2RM(R)
\int_{0}^{\pi/2}
\left\vert \exp\left( 
	\frac{-2}{\pi}kR\theta
\right)\right\vert d\theta
$$

Ok, let's see if we can cancel out the $R$, also notice the absolute value can be removed now, the quantity on the right hand side of the inequality is going to be positive whatsoever. 

The integral on the right hand side is finite and it's: 

$$
\int_{0}^{\pi/2}
\left\vert \exp\left( 
	\frac{-2}{\pi}kR\theta
\right)\right\vert d\theta = 
\left[ 
\frac{-\pi}{2kR}\exp 
	\left( 
		\frac{2}{\pi}kR\theta
	\right)
\right]_{\theta = 0}^{\theta = \pi/2}
$$

And note that, there is $R$ on the numerator, and this means that it will get cancel  out with the $R$ that appears as the multiplier of in front of the integral. And then in the end it will give us: 

$$
\frac{\pi M(R)}{k}(1 - \exp(-kR)) = 0 \quad \text{as } R \rightarrow \infty
$$

Boom, we have bounded the $|J|$ in integral from the right hand side and shown that: 

$$
\lim_{R \rightarrow \infty} |J| = 0 
$$

And this means that, if the Jordan's Lemma is satisfied, then the Fourier Integral of function $F$ is going to converge zero for the contour that travels in the semi-circle on the positive half of the Complex Plane. $\blacksquare$


**Note**
It's possible when $k < 0$, and when that happens, we just take the Contour to be $C^{-} := \{ R\exp(i\theta): \theta \in [-\pi, 0]\}$ and the proof will follow in the similar manner as shown above, proving the Jordan's Lemma will hold true. 

### Example: $\int_{-\infty}^\infty \frac{x\sin(x)}{x^2 + 1}dx$

This is a Fourier Integral under disguise, and it's the complex part of the Fourier Integral: 

$$
\Im\left( 
\int_{-\infty}^{\infty} \frac{x\exp(ix)}{x^2 + 1}dx
\right) 
$$

Let's take this to another level, and then we will have the contour integral: 

$$
\Im \left( 
	\int_{C+} \frac{z\exp(iz)}{z^2 + 1}dz
\right)
$$

Where the contour is the positive semi-circle on the complex plane with radius $R$. 

$$C^{+}\{\exp{i\theta}: \theta \in [0, \pi]\}$$

Note that: 

$$
\lim_{R\rightarrow \infty}
\left|
	\frac{R\exp(i\theta)}{R^2\exp(2itheta) + 1}
\right| = 0 \quad \forall \theta \in [0, \pi]
$$

Is a true statement, and therefore, the Jordan's Lemma apply and the contour integral on the complex plane equals to the integral on the real axis. 

Therefore, we have: 

$$
\oint_{C} \frac{z\exp(iz)}{z^2 + 1} dz = 2\pi i \text{Res}\left(
\frac{1}{z^2 + 1}, i
\right)
$$

Because only one of the singularities lies within the positive semi-circle. 

What follows is trivial with the knowledge using Residual Theorem. 