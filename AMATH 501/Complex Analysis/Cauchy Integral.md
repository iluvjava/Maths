We can figure out the value of the function at a point by just walk around the function, with a pole in the middle. 
Prereq: 
[[Cauchy Riemann Conditions (Analyticity)]]
[[Complex Integration (CG)]]: We need Cauchy Goursat 

---

### Cauchy Integral

> $$
> f(a) = \frac{1}{2\pi i} \oint \frac{f(z)}{z - a} dz
> $$

Assuming the function is analytic inside and on the contour of C. 

#### Proof

Assuming a function is** analytical for all points inside and on the contour**. 

For any Contour containing the point $a$, choose a disk that is strictly inside the contour $C$ containing the point $a$ with a radius: $\rho$, denote the infinitely small disk as $B$

Then we can simplify the Line Integral a bit and get: 

$$
\oint_C\frac{f(z)}{z - a} dz
=
\frac{1}{2\pi i}\left(
	\oint_C\frac{f(a)}{z - a}dz + 
	\oint_C\frac{f(z) - f(a)}{z - a}dz
\right)
$$
Notice: 
$$
\oint_{C}\frac{f(a)}{z - a} dz = 2\pi if(a)
$$
By the **Cauchy Goursat theorem**, and the unit** disk integral around the pole is always** $2\pi i$

By the fact that the function is Analytic, we know that it's going to be continuous, since applying the theorem for continuity on the function $f(z)$ around the point $a$ we have that: 

$$
\forall \epsilon > 0 \; \exists\;\delta |z - \delta| \implies |f(z) - f(a)| < \epsilon
$$

Denote that epsilon as $\delta(\epsilon)$, as a function. 

Notice that, according to the Gaussian Goursat theorem, the disk around the ball has the same line integral as any Counter containing the ball, hence we have: 

$$
\oint_C \frac{f(z) - f(a)}{z - a} dx = \oint_B \frac{f(z) - f(a)}{z - a} dx
$$

And then the disk contour integral is going to be bounded because: 

$$
\left\vert 
	\oint_{B} \frac{f(z) - f(a)}{z - a}
\right\vert
\leq
\oint_B\frac{|f(z) - f(a)|}{z - a}dz
$$

But notice that: 

$$
|f(z) - f(a)| < \epsilon(\delta)
$$

And this will mean that: 

$$
\oint_B \frac{|f(z) - f(a)|}{z - a} dz
\leq
i2\pi\epsilon(\delta)
$$

Then, this will means that, as the disk around the point $a$ decreases to zero. We want to do this so that the $B$ get small, and the whole, "Key hole" integral will approach the complete line integral, then we will have the conclusion that: 

$$
\oint_B\frac{f(z) - f(a)}{z - a} dz = 0
$$

And then we will have the formula that: 
$$
\oint_C\frac{f(z)}{z - a} dz
=
\frac{1}{2\pi i}\left(
	f(a)2\pi i+ 
	0
\right)
= \frac{f(a)}{2\pi i}
$$

The extension is crucial for showing that an function that is Entire on the complex plane is going to have a infinite power series representation that converges everywhere, centered at any points. 

### Extension

The Cauchy's Integral has connection to derivative and ti reveals the infinitely differentiable nature of analytical functions and this is it: 

> $$
> f^{(n)}(a) = \frac{n!}{2\pi i}\oint_{C} \frac{f(z)}{(z - a)^{n + 1}}dz
> $$

The proof is an inductive proof by considering derivative of $f(a)$ with respect to $a$. Notice that this is applicable because the integral is proper, and by **Leibniz Integral Rule**, it can go inside the integral and act on the $(z - a)$ component. 

### Examples and Applications
#### Example 0

$$
\oint_{|z|=\rho < 1}
\frac{1}{z^n} dz \quad n \in \mathbb{N}
$$

This will get evaluates to: 

$$
\frac{2\pi i}{n!} \frac{d^{n - 1}(1)}{dx^{n - 1}}
$$

It can also be viewed as a corollary, and this is big brain, and when $n\leq 2$ this thing is going to be zero. 

#### Example 1

Solve:
$$
\oint_C\frac{e^{-z}}{z + 2}dz 
$$

Along the contour defined as $|z| = 3$. 

With the formula we get:

$$
\frac{1}{2\pi i}\oint_C\frac{e^{-z}}{z + 2}dz  = \exp(-(-2))
$$

And this is giving us: $i2\pi\exp(2)$.

Solve

$$
\oint \frac{z^2 + 1}{z^2 - 1} dz
$$

(a) Consider the following contour for the function: $C = \{|z - 1| = 1\}$. 

Notice that the function has 2 poles, and one of them are in $C$ which is not a problem because we have: 

$$
\oint \frac{z^2 + 1}{z + 1} \frac{1}{z - 1}dz
$$

And then notice that the pole at $z = 1$ has been isolated, and then we can apply the Cauchy Integral theorem and then we can get: 

$$
\frac{1}{i2\pi}\oint \frac{z^2 + 1}{z + 1} \frac{1}{z - 1}dz = \frac{(1)^2 + 1}{1 + 1}
$$

And then we have the line integral equals to $2\pi i$

(b)
Similarly if we were given another contour that contains the other pole $z + 1$ of the function, then we have the chose to do another separation and then evaluate the integral using Cauchy Goursat theorem. 

(c)
If there is a contour involving both the poles $\pm 1$, then we need to use partial fraction to evaluate it, so that we separate the poles and each component is the line integral with one pole inside of it. 


