Power Series but this time it's for complex functions and we need the [Cauchy Integral](Cauchy%20Integral.md) for the derivation of it. s

---
### Centered At Zero

Let's **start with the Cauchy Integral**, with the assumption that $f(z)$ is analytic inside and on the contour containing the point $z$. 

$$
f(z) = \frac{1}{2\pi i} \oint _{C}\frac{f(t)}{t}
\frac{1}{1 - \frac{z}{t}}dt
$$

The variable $t$ is going around the value $z$. 

In addition, also assume that the contour is designed such a that: 

> $$
> |z| < |t|
> $$

So that we can write the inner expression as an Uniformly Convergent series that everyone knows.

Then we have: 
$$
f(z) = \frac{1}{2\pi i}\oint_C\frac{f(t)}{t}
	\sum_{n = 0}^{\infty}\frac{z^n}{t^n}dt
$$

Moves around the line integral and the infinite sums a bit and we will get the expression that: 

$$
f(z) = \frac{1}{2\pi i}
\sum_{n = 0}^{\infty}z^n\oint_C\frac{f(t)}{t^{n + 1}} dt
$$

Notice that, the function is assumed to be analytic inside the contour parameterized by $t$, and hence, we can apply that extended version of the Cauchy Integral to get that for the High Order Singularity, we have: 

$$
f(z) = \sum_{n = 0}^{\infty}\frac{f^{(n)}(0)}{n!}z^n
$$

And in this case, we have gotten the Taylor Series for the Function $f$ centered at zero. 

#### Observe That

If there is singularities for the function $f(z)$, meaning that it's not analytical around some points on the complex domain,**then it will restrict the parametric contour $t$**, hence, reducing the radius of convergence for the Power Series of the function. 

### Centered At Any Points

It's the same thing but let's start with the following fraction and we will have: 

> $$
> \frac{1}{t - z_0} = \frac{1}{(t - z_0) - (z - z_0)} 
> = 
> \frac{1}{t - z_0} \frac{1}{1 - \frac{z-z_0}{t-z_0}}
> $$

As usual, we want some kind of Uniform Convergence series for the second fraction, and in that case, we will have: 

$$
\left\vert\frac{z - z_0}{t - z_0}\right\vert < 1
$$

And this means that, the larger contour we parameterize around the point $Z$ must be containing the disk $|z - z_0|$. With this, we can say that the expression equals to: 

$$
\frac{1}{t - z_0}\sum_{n = 0}^{\infty}
	\left( \frac{z - z_0}{t - z_0}\right)^n
$$

Cool, multiplying by an Analytical function, then we have the expression that: 

$$
f(z) = \frac{1}{2\pi i}\oint_C \frac{f(z)}{t - z_0}\sum_{n = 0}^{\infty}
	\left( \frac{z - z_0}{t - z_0}\right)^n dt
$$

Because of Uniform Convergence, we wan swap the Summation and the Line Integral, then we have: 

$$
f(z) = \frac{1}{2\pi i}\sum_{n = 0}^{\infty}
\oint_C \frac{f(z)}{t - z_0}
	\left( \frac{z - z_0}{t - z_0}\right)^n dt
$$

$$
f(z) = \frac{1}{2\pi i}\sum_{n = 0}^{\infty}
\oint_C \frac{f(z)}{(t - z_0)^{n + 1}}
	dt(z - z_0)^n
$$

And then for the inner Integration, with the assumption that the function is analytical inside the parameterized contour $C$, then we can use the extended Cauchy Integral and compute that:

$$
f(z) = \sum_{n = 0}^{\infty} \frac{f^{(n)}(z_0)(z - z_0)^n}{n!}
$$

Which is the Taylor Series centered at point $z_0$

---

### Entire Functions and Power Series

If the function $f(z)$ is Entire on the complex plane $\mathbb{C}$, then it has a **Taylor Series Everywhere**, and it will have a **radius of convergence of infinity**. This is true because for any point, we an draw a contour around that point that is large enough and it's without any singularity, so it's like: 

> Entire --> Super large Contour for any points without singularity --> Series Everywhere and converge for infinite radius

Here are some of the classic functions that are Entire on the complex plane: $e^z$, $\sin(z)$, $\cos(z)$. 

### Analytic With Singularities

The key here is that, a function with singularties is going to restrict the radius of convergence for the power series. 

For example: 
$$
\frac{1}{1 + x^2} = \sum_{n = 0}^{\infty}(-1)^nx^{2n}
$$

And it has a radius of convergence $|x^2| < 1$ because the $\pm i$ are the singularities of the function, and this is the factor that restricted the contour $C$ in our derivation of the power series. 


### Radius Of Convergence

This is hard to find, and it's tightly related to real analysis. Given a power series of some analytic function, it will exist a radius of convergence, and note the following facts: 

* The radius of convergence around the point $z_0$ (where the series centered at) **is not going to contain any points where the function is having singularities** (or points that the function is not analytic at). 
* We can also identify the radius of convergence using either, Ratio Test, or Root Test. 

Now assuming that we are given a power series is in the following form

$$
\sum_{n = 0}^{\infty} u_n
$$

#### Ratio Test

> $$\lim_{k\rightarrow \infty} \frac{u_{n + 1}}{u_{n}} < 1$$

Then the series is convergent, if it's strictly larger than one, then it's divergent, if it equals to one, then it's undetermined and we need Real Analysis stuff to help us.

#### Root Test: 

> $$
> \lim_{n\rightarrow \infty} |c_n|^{1/n} < 1
> $$

Then the series is converging absolutely, if it's larger than 1 then the series diverges, else it's undetermined. 

