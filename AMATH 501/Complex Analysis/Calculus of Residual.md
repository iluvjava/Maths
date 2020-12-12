prereq: [[Meromorphic Functions]], [[Types of Singularities]], [[Cauchy Integral]], [[Laurent Series]]

This is one of the way we can take the contour integral of a Meromorphic function around a set of, finitely many singularities in the opened set $C$. 

---

###  Introduction 
The residual method is applied to the integral of Meromorphic Functions, and it provides a quick and dirty way to compute the exact integral of these functions with a pole, or poles inside of it, and the poles is denoted as: $z_0$. 

This is the Residual Formula: 

> $$
> \oint_C f(z)dz = 2\pi i \text{Res}_{z_0}(f)
> $$

Let's take a look: 

#### Proof: 

$$\oint_Cf(z)dz = \oint_{C\epsilon} f(z)dz$$

Where the contour $C$ is an contour that contains the pole $z_0$, and then we will have an "Inner Corridor", or a infinitely small circle that circles around the singularity $z_0$

Consider the Laurent Series of the expansion: 

$$
f(z) = \sum_{n -\infty}^\infty a_n z^n \hspace{2em} \text{Where: } a_n = 
\frac{1}{2\pi i} \oint_{C\epsilon} \frac{f(t)}{(t - z_0)^n}dt
$$

So, then, we can use the series, which will gives us the contour integral: 

$$
\int_{C}\sum_{n = -\infty}^{\infty} a_nz^ndz
$$

And we can split them into Analytic part, and the Principal Part of the function, giving us: 

$$
\oint_{C\epsilon}\sum_{n = 0}^{\infty} a_nz^ndz + \oint_{C\epsilon}\sum_{n = 1}^{\infty}\frac{a_{-n}}{z} dz
$$

The first integral contains only Analytic functions, and hence the sum is **zero**. 

The second integral is evaluated via **Cauchy Integrals**, which is giving us: 

$$
\oint_{C\epsilon} \frac{a_{-1}}{z}dz = 2\pi i a_{-n}
$$

And then we have the whole Contour Integral around the singularity evaluates to: 
$$
\oint_{C\epsilon} f(z)dz = 2\pi ia_{-n}
$$

Boom, magic, and we also know what the residual of a function is now. It's the only parts of the Laurent Series that produces something after a line Integral, and it's  also the most special function ever, the $1/z$ function. 

### Multiple Poles Inside Contour
 
Suppose that the Contour $C$ surrounds a set of Poles of the function: $\{z_n\}_{n = 1}^N$

Which is just the sum among all the corridors around each individual isolated poles, and it gives: 

$$
\oint_{C} f(z)dz = 2\pi i\sum_{k = 1}^{N} \text{Res}_{zk}(f)
$$

And this is the value for the Contour Integral. 


