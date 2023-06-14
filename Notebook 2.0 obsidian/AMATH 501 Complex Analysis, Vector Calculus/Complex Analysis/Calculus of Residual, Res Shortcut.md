prereq: [[Calculus of Residue]], [[Type of Singularities (Limit Shotcut)]]
And in this file, we are going to how to actually compute it, demonstrated with some examples, and then we will apply for some special type of real integrals. 

---

### Intro

previously, 

$$
\oint_Cf(z)dz = 2\pi i\sum_{n = 1}^N \text{Res}(f, z_n).
$$

However, the evaluation for the residual at isolated singularities will use the Laurent Series of the function because the residual needs a series centered at the poles and the coefficient $a_{-1}$ is needed. We introduce some cool tricks in this file to compute the residual for the function at points faster and easier. 

---
### **Shortcut | For Simple Pole**

**Trick**
> When $z_0$ is a simple pole of the function $f$, the residue is calculated by the limit $\lim_{z\rightarrow z_0}(z - z_0)f(z)$.


**Proof**

Ny the fact that we have a simple pole, the series power for $z - z_0$ goes to $-1$ for the lowest, the Laurent series is then given by: 

$$
\begin{aligned}
	\sum_{n = -1}^{\infty}a_{n}(z - z_0)^n. 
\end{aligned}
$$

we consider the limit 

$$
\begin{aligned}
	\lim_{z \rightarrow z_0}(z - z_0)f(z) 
	&= \lim_{z\rightarrow z_0} (z - z_0)\sum_{n = -1}^\infty a_n(z - z_0)^n
	\\
	&= \lim_{z\rightarrow z_0}\sum_{n = -1}^\infty a_n(z - z_0)^{n + 1} 
	\\
	&= \lim_{z\rightarrow z_0}\sum_{n = 0}^\infty a_{n - 1}(z - z_0)^{n}
	\\
	&=
	\lim_{z\rightarrow z_0} a_{-1} + \sum_{n = 1}^\infty a_{n - 1}(z - z_0)^n
	\\
	&= a_{-1} = \text{Res}(f, z_0). 
\end{aligned}
$$

and we are done. 

---
### **ShortCut: Higher Order Poles**

**Trick**
> Let $z_0$ be a pole for $f$ with order $N$, then the residue of the function at $z_0$ can be calculated by 
> $$
> \lim_{z \rightarrow z_0} (N- 1)!
> \frac{d^{N-1}}{dz^{N-1}}\left[
> (z - z_0)^Nf(z)
> \right] = a_{-1} = \text{Res}(f, z_0). 
> $$
> To memorize, the inner term $(z - z_0)^N$ "desingularize" the principal parts of the Laurent series, the derivative reduces the series to reveal the term with $N - 1$ power to be the constant in the analytical part, and the term $(N - 1)!$ cancles out the additional constant created by the differentiation. 

**Proof**

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

And this is the general way of looking for the Residual of the function at any poles. And then we can apply Residual Theorem to look for Contour Integrals of the complex around around any finitely many poles that are not clustered too tight together. (The set of poles cannot have the topology of limit set)


---
### **No Shortcut | Essential Singularity**

Haha no short cut goog luck fidning the Laurent series. 
