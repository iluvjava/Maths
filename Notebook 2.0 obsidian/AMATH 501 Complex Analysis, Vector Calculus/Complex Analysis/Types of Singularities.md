The type of singularities is defined via the Laurent Series of the function at the point of singularity. Here we focuses on Isolated Singularities. 
prereq: [[Laurent Series]]

---

### Intro

There are 2 type of singularities: 
* Isolated
	* Removable
	* Poles (With some order, k)
	* Essential Singularity
* Non-Isolated. 

The type of singularities are identified by the largest power of on the Principal Parts of the Laurent Series expanded at the singularity (Or point under suspicion and there are 3 cases for the maximal power of the Principal Parts. 

* All Coefficients are zero. 
	* It's a **regular point**
* It has finite many terms, say $k$ terms. 
	* Then it's **kth order Pole**
	* When k = 1, then it's a **Simple Pole**
* It has infinitely many points. 
	* It's an **Essential Singularity**

#### Motivating Questions

* Is it possible to centered the expansion of the Laurent Series at a singularity? 
	* Yes, it's possible, but the series is not going to converge for values that are close to the singularities, More specifically, the Principal parts is going to blow up. 
	* It's possible because, The derivation of the Laurent series doens't enforce the conditions that, the function needs to be analytical in the inner contour: $C2$, and hence, it's possible to have the rings containing singularities of the functions in there. 
* What if center the Expansion at the Principal Parts? 
	* It will tell us what type of singularities we are dealing with. 


---
### Limit, Removable Singularity

> $$
> \lim_{z \rightarrow 0} \frac{\sin(z)}{z} = 0
> $$

And fortunately, the limit at the point exists, and even if the point is not in the domain of the function, this is sufficient to redefined the function, and hence this is an **Regularity Point**, a **Removable Singularity** is a **Regularity Point**. 

**Note**: The Laurent Approach is essentially the same. 

---

### Laurent Series: Simple Pole

The type of singularities is defined via the Laurent series at the singularity point. Let's take a look at an example for demonstration: 

> $$f(z) = \frac{1}{z(z + 1)}$$

Consider the expansion of the series at any point, then we know that the Laurent series is given as: 

$$
f(z) = \sum_{n=0}^\infty a_n(z - z_0)^n +  \sum_{n = -\infty}^{-1} a_n(z - z_0)^n
$$

And $$a_n = \oint_\gamma \frac{f(t)}{(t - z_0)^{n + 1}}dt$$ where $\gamma$ is some kind of fractal that is left for us to choose. 

Now say that we want to test what kind of point is $z_0 = 0$ for the function, make $|z|$ be as small as we want it to be, substituting it in, we should have: 

$$
a_n = \frac{1}{2\pi i}\oint_\gamma \frac{f(t)}{t^{n + 1}}dt
$$

And this gives: 

$$
\frac{1}{2\pi i}\oint_\gamma \frac{1}{t + 1}\frac{1}{t^{n + 2}}dt = \frac{f^{(n+1)}(1)}{(n + 1)!} \quad \forall n \geq -1
$$
and 

$$
\frac{1}{2\pi i}\oint_\gamma \frac{1}{t + 1}\frac{1}{t^{n + 2}}dt = 0 \quad \forall n < -1
$$
Because it's analytic. 

Choose $\gamma$ to be a infinitely small ball around the origin. 

Therefore by definition, the principal part of the Laurent Series is having only one term, which means that, this is a **simple pole**. 

Also, take note that, we only need to principal part of the series near the region of singularity, we don't need to analyze if for all the terms in the series. 

**Note**: This is hard, and we need an alternative approach of finding the series rather than looking at the Line Integral like a retard, cause this requires some engineering with the geometric series. We will outline this with this approach. 

Another way to do this is via series, I will just describe it as "Laurent Series by brute force". 

$$
\frac{1}{z(z + 1)}
$$

$$
\frac{1}{z}\frac{1}{1 - (-z)}
$$

$$
\frac{1}{z}\sum_{n = 0}^{\infty}(-1)^n(z)
$$

And boom, this is the Laurent series expanded at the point $z = 0$, and it's saying that, the point $z = 0$ is a **Simple Pole** of the function. Nice and Easy. 

---
### Laurent Series: Essential Singularity


> $$
> e^{1/z}
> $$

has an essential singularity at $z = 0$

$$
e^{1/z} = \sum_{n = 0}^\infty \frac{1/z^n}{n!} = \sum_{n = -\infty}^{0} \frac{z^n}{n!}
$$

And notice that, this has pole with infinitely order, an this type of singularity is called "**Essential Singularity**". 

---
### Epilogue
The Laurent series expanded at isolated singularity will have a Principal parts, and it will define different types of singularities for a complex function. 

