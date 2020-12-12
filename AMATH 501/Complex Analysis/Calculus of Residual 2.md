prereq: [[Calculus of Residual]]
And in this file, we are going to how to actually compute it, demonstrated with some examples, and then we will apply for some special type of real integrals. 

---

### Intro

Previously we have shown that: 

$$
\oint_Cf(z)dz = i\pi\sum_{n = 1}^N \text{Res}(f, z_n)
$$

The contour integral on a function that contains some poles in it is the sum of all the residual of the functions at those poles. 

However, the evaluation itself will use the Laurent Series of the function because the residual needs a series centered at the poles and the coefficient $a_{-1}$ is needed. 

However, there are some shortcut here were $a_{-z}$ can be found by derivatives and some limit operations. 

### Shortcut: Simple Pole

The key here is to quickly find the value of $\text{Res}(f, z_0)$ without expanding the laurent series of the function at the simple pole. 

Let's assume that $z_0$ is a simple pole of the function $f(z)$, which means that the Laurent Series is going to be: 

$$
\sum_{n = -1}^{\infty}a_{n}(z - z_0)^n
$$

And now consider the limit: 

$$
\lim_{z \rightarrow z_0}(z - z_0)f(z) = \lim_{z\rightarrow z_0} (z - z_0)\sum_{n = -1}^\infty a_n(z - z_0)^n
$$


$$
\lim_{z\rightarrow z_0}\sum_{n = -1}^\infty a_n(z - z_0)^{n + 1} = \lim_{z\rightarrow z_0}\sum_{n = 0}^\infty a_{n - 1}(z - z_0)^{n}
$$

$$
\lim_{z\rightarrow z_0}\sum_{n = 0}^\infty a_{n - 1}(z - z_0)^{n} = \lim_{z\rightarrow z_0} a_{-1} + \sum_{n = 1}^\infty a_{n - 1}(z - z_0)^n
$$

And note that this limit evaluates to: 

$$
\lim_{z\rightarrow z_0} a_{-1} + \sum_{n = 1}^\infty a_{n - 1}(z - z_0)^n = a_{-1} = \text{Res}(f, z_0)
$$

And, let's repeat, assuming that the pole is a simple pole at the point $z_0$

### ShortCut: Higher Order Poles 

let's consider the case where the order of the pole is $N$ and we are interested in finding the Residual of the function at that pole. And, first, start with the Laurent series expansion of the function at the pole, we will have: 

$$
f(z) = \sum_{n = -N}^\infty a_{n}(z - z_0)^n 
$$

Now, consider multiplying this expression with the term $(z - z_0)^N$ so that all the negative power got shifted to the positive and it's: 

$$
(z - z_0)^Nf(z) = \sum_{n = -N}^\infty a_{n}(z - z_0)^{n + N} = \sum_{n = 0}^\infty a_{n - N}(z - z_0)^{n} 
$$

Ok, but we want to get the coefficient: $a_{-1}$, and that is when $n = N - 1$, and the way to do this is via derivative on the series, so that we expose that term and it helps with the residual. 

Let's take the derivative on this thing, and then we will have: 

$$
\frac{d^{N-1}}{dz^{N-1}} \left(
	\sum_{n = 0}^\infty a_{n - N}(z - z_0)^{n} 
\right)
$$

$$
\sum_{n = N - 1}^\infty \frac{n!a_{n - N}(z - z_0)^{n - N + 1} }{(n -N + 1)!}
$$

$$
(N - 1)!a_{-1} + \sum_{n = N}^{\infty} \frac{n!a_{n - N}(z - z_0)^{n - N + 1} }{(n -N + 1)!}
$$

And the cool thing here is that, if I divide the whole thing by the quantity: $(N - 1)!$, then the first constant term is the residual of the function at the pole of Order N. 

Now, this will mean that, the limit of the whole thing multiplied by the quantity is the residual of the function at the $N$ th order pole, meaning that: 

$$
\lim_{z \rightarrow z_0} (N- 1)!
\frac{d^{N-1}}{dz^{N-1}} \left(
	\sum_{n = 0}^\infty a_{n - N}(z - z_0)^{n} 
\right) = a_{-1} = \text{Res}(f, z_0)
$$

Or we collapse the series and have: 

$$
\lim_{z \rightarrow z_0} (N- 1)!
\frac{d^{N-1}}{dz^{N-1}}\left[
(z - z_0)^Nf(z)
\right] = a_{-1} = \text{Res}(f, z_0)
$$

And this is the general way of looking for the Residual of the function at any poles.

And then we can apply Residual Theorem to look for Contour Integrals of the complex around around any finitely many poles that are not clustered too tight together. (The set of poles cannot have the topology of limit set)


### No Shortcut: Essential Singularity

No it doesn't exist, you can take the limit on Essential Singularity, and you will need to find the Laurent series centered at the singularity to locate the multiplier, or coefficient $a_{-1}$, and that will be the Residual. 
