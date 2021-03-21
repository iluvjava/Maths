Let's use the residue theorem to evaluate some of the scary looking series. 

prereq: [[Calculus of Residual (Res Shortcut)]]

---

### Intro

We can use the Residue theorem to figure out the infinite series. 

Let's consider a really special function which is going to help us with that: 

$$
F(z): = \pi \cot(\pi z)f(z) = \frac{\pi f(z)\cos(\pi z)}{\sin(\pi z)} 
$$

* ** Observations**
The multiplier, the fraction part with: $\pi\cot(\pi z)$ has singularities on all the integers, and they are all simple poles. And when we design the contour, it's going to avoid the singularities of this one, and the function $f(z)$. 

Where $f(x)$ can be any functions really, meromorphic preferably. 

Now we are going to consider the following contour integral: 

> $$
> \oint_{C}\frac{\pi \cos(\pi z)}{\sin(\pi z)} f(z)\;dz
> $$

Let's take a look at the Contour: 

$$
\text{Vertices: }
{
\pm\left(N + 1\frac{1}{2}\right)
\pm i\left(N + \frac{1}{2}\right)
}
$$
And it's a square that goes counter-clock wise, avoiding all the singularities on the integers.

Now, let's figure out all the residues at the integers: 

$$
\sum_{k\in \mathbb{Z}} \text{Res}(F(z), k)
$$

And for each of the one, we have: 

Because the singularities on the integer set are all simple poles, (And we did't show it here but it's true), we can use the limit theorem to find the value for the residue. 

$$
\lim_{z \rightarrow n} 
\frac{(z - n)\pi \cos(\pi z)f(z)}
{\sum_{n = 1}^\infty
(-1)^{n - 1}\frac{((z-n)/\pi)^{2n - 1}}{(2n-1)!}}
$$

Where I put the $\cos(\pi z)$ into a series on the denominator, and then we will have: 

$$
\lim_{z \rightarrow n} 
\frac{\pi \cos(\pi z)f(z)}
{\sum_{n = 1}^\infty
(-1)^{n - 1}\frac{((z-n))^{2n - 2}}{\pi^{2n - 1}(2n-1)!}}
$$
The $z - n$ on the numerator canceled out with the $z-n$ on the denominator, and then we also take out the $\pi$ from the terms in the series. 

And then at this point, we will be able to do a direct substitution for the $z = n$. which is going to give us: 

$$
(\pi\cos(\pi z)f(n))/\pi = f(n)
$$

**Now, let's denote all the singularities of the function $f(z)$ to be a set, name it $S$**, then we can phrase the contour integrals in terms of singularities using the residue, giving us: 

$$
\oint_{C}F(z) dz = 2\pi i\sum_{n=-N}^{N}f(n) + 2\pi i\sum_{\alpha \in S} \text{Res}(F, \alpha)
$$

Now let's make an **additional assumption so that the outer contour integral will become zero as the size of the square approaches $\infty$. the assumption is: **

> $$\lim_{|z|\rightarrow  \infty}|zf(z)| = 0$$

And then, we will be able to say that the contour integral will be zero as $N\rightarrow \infty$, this is the case by considering the exponential form of $\cot$ which is going to give us: 



$$
\cot(z) = i\frac{\exp(iz) + \exp(-iz)}{\exp(iz) - \exp(-iz)}
$$

Take note that, as $|z|\rightarrow \infty$, this quotient is approaching 1, and this will imply that $F(z)$ is approaching zero as the contour grows to infinity. 

And then we have: 

$$
2\pi i\sum_{n=-N}^{N}f(n) + 2\pi i\sum_{\alpha \in S} \text{Res}(F, \alpha) = 0
$$
Which is giving us: 
$$
\sum_{n=-\infty}^{\infty}f(n) =- \sum_{\alpha \in S} \text{Res}(F, \alpha)
$$

And  this is fucking perfect. 

#### Complications

What if the poles of $f(z)$ and $\pi\cot(\pi z)$ overlapped with each other? 


### Example 1

Let's figure out the series: 

$$
\sum_{n = -\infty}^\infty \frac{1}{n^2 + 1}
$$

Take notice of the recurrence relationship: 

$$
\sum_{n=-\infty}^{\infty}\frac{1}{n^2 + 1} = 1 + 
2\sum_{n = 1}^{\infty} \frac{1}{n^2 + 1}
$$

We can use the recurrence to get some discount for our infinite series. 

Therefore, the residue of the function $F(z)$ will be evaluated via the form: 

$$
\text{Res}(F, \pm i) = \lim_{z\rightarrow \pm i}
(z \mp i)\frac{\pi\cot(\pi z)}{(z - i)(z + i)}
=\lim_{z\rightarrow \pm i}
\frac{\pi\cot(\pi z)}{(z\pm i)}
$$

And then we have: 

$$
\text{Res}(F, \pm i) = -\frac{\pi}{2}\coth(\pi)
$$

And then we can use the Exponential form of the $\cot$ to cancel out the imaginary unit at the denominator, and take not that the $\cot$ function is odd, so the Operator Superposition canceled out. 

Therefore, the infinite series has the representation that: 

$$
\sum_{n=-\infty}^\infty \frac{1}{n^2 + 1} =\pi 
\coth(\pi)
$$

And then we get another one for free using the relation: 

$$
\sum_{n = 1}^{\infty}  \frac{1}{n^2 + 1} = 
\frac{1}{2}(\pi\coth(\pi) - 1)
$$

### Example 2: Complications

Let's take a look at the example where the function could have overlapped singularities. 


> $$
> \sum_{n = 1}^{\infty}\frac{1}{n^2}
> $$

We have $f(z) = \frac{1}{z^2}$ then: 

$$
F(z) = \frac{\pi \cot(\pi z)}{z^2}
$$

Note that, at $z = 0$ we have a pole of order 3. And this will mean that: 

$$
\lim_{N\rightarrow \infty} 
\oint F(z)dz = 2\pi i\left(
\sum_{n = 1}^\infty \frac{1}{n^2} + 
\sum_{n = -1}^{-\infty}\frac{1}{n^2}
+\text{Res}(F, 0)
\right)
$$
**Take note that**, the Order 3 Pole is moved to the Residual instead of the infinity series. Take note of the symmetry of the infinite series here. 

And then this means that: 

$$
2\sum_{n = 1}^\infty \frac{1}{n^2} = -\text{Res}(F, 0)
$$

And then we need to take care of the third order pole in this case, which is kinda annoying. 

$$
\sum_{n = 1}^\infty \frac{1}{n^2} = 
\frac{-1}{2}\text{Res}(F, 0)
= \frac{-1}{2}
\lim_{z \rightarrow 0} \frac{1}{2!}\frac{d^2}{dz^2}
\left(
z^3\frac{\pi \cot(\pi z)}{z^2}
\right)
$$

Which is going to give us: 

$$
\frac{-1}{2}
\lim_{z \rightarrow 0} \frac{1}{2!}\frac{d}{dz}
\left(
	\cot(\pi z) - \pi z\csc^2(\pi z  )
\right)
$$

And then it's annonying: 
$$
\frac{-1}{2}
\lim_{z \rightarrow 0} \frac{\pi}{2}
\left(
	(\pi z \cot(\pi z) - 1)\csc^2(\pi z)
\right)
$$
And then we can substitute and get: 
$$
\frac{-1}{2}\frac{-\pi^2}{3} = \frac{\pi^2}{6} 
$$

Boom! We solved with, using mathematics that Euler didn't know back at his time!!! 

**Note** 
This is applicable in the general case, and this is also used to find out the values for the Riemann Zeta function. 

However, take not that: 
$$
\sum_{n = 1}^{\infty} \frac{1}{n^3}
$$

Cannot be computed using the residue calc, this is the case, because the **Bi-infinite-series Expansion** got canceled out by the. 

Also take not that, there are freedom for us to choose the $F(z)$ multiplier function. Seriously, there are infinite many of these function, and sometimes, we have to come up with some very smart functions to take care of the sign changes there. (Patterns like: -1, -1, +1)

Consider: 

$$
F(z) = \frac{\pi f(z)}{\sin(\pi z)}
$$

And take note that: 

$$
\text{Res}(F, n) = \lim_{z\rightarrow n}(z - n)\frac{\pi f(z)}{\sin(\pi z)} = \frac{f(n)}{\cos(\pi n)} = (-1)^nf(n)
$$

Boom, now for Series that Alternate, we have another way of figuring it out using the POWER OF Residue. FUCKING DOPE.
