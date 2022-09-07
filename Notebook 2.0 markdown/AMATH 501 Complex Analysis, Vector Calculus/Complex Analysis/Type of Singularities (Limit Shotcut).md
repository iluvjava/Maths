prereq: [Types of Singularities](Types%20of%20Singularities.md)

A basic understanding for Singularity is needed for the discussion. 

---

### A Fact
Assuming that the function as a Pole (Isolated Singularity) with order $n$ at $z_0$ (not Essential Singularity), then the following statement regarding the function and the Pole is true: 

> $$ 
> \underset{n}{\text{argmin}}
\left(\lim_{z \rightarrow z_0} (z - z_0)^n f(z) < \infty \right)
> $$

Where n is the **minimum positive integer needed** such that the limit of the expression exists as a finite number. 

There is a limit defined there, if I give the function a multiplier $(z - z0)^n$ . 

#### Comment

When evaluating the limit, it's really common to use the Lopital's Rule for the evaluation of the fraction, if it's in the undetermined form. 

### Example: $\tan(z)$

Consider the poles of the function $\tan(z)$, where the poles of the function can be indexed as: 

$$
z_n = \frac{\pi}{2} + n\pi
$$

Then, let's see this: 

$$
\lim_{z \rightarrow z_0} \frac{(z - z_0)\sin(z)}{\cos{z}}
$$

Using Lopital's Rule we have: 

$$
\lim_{z \rightarrow z_0} \frac{(z - z_0)\cos(z) + \sin(z)}{-\sin(z)}
$$

Now, we substitute in the $z_n$, notice that we have: 

$$
\sin(z_n) = \pm 1 \quad \cos(z_n) = 0
$$

Therefor, essentially have: 

$$
\lim_{z \rightarrow z_0} \frac{(z - z_0)\cos(z) + \sin(z)}{-\sin(z)} = -1
$$

Notice that the limit exists as a finite number, and hence, $\tan(z)$ has a simple pole at the $z_n$. 

### Trickier Example

Notice that, we cannot just use this as a way to eliminate the numerator that is approaching zero and then claim that we have the poles of some kind order, that is just terrible because consider the following example: 

$$
\frac{\cos(z)}{(z - \pi/2)^4}
$$

And then consider the the point $z = \pi/2$. At first it will be really tempting to just claim that the point is a 4th order pole because multiplying it by $(z - \pi/2)$ will give us a limit that evaluates to a constant, but please also consider that the limit: 
$$
\lim_{z \rightarrow \pi/2} \frac{\cos(z)}{(z - \pi/2)^4}
$$

Is in undetermined form as $z \rightarrow \pi/2$, and then this means that taking the derivative on both numerator and denominator will give us the following: 

$$
\lim_{z\rightarrow \pi/2} \frac{-\sin(z)}{4(z - \pi/2)^3} = \infty
$$

So... This means that this limit is going to exists if I multiply the expression at hand with $(z - \pi/2)^3$, which means that: 

$$
\lim_{z \rightarrow \pi/2} \frac{\cos(z)}{(z - \pi/2)} = \lim_{z\rightarrow \pi/2} \frac{-\sin(z)}{1} = 0
$$

And limit exists and it's finite, and hence that point is a 3rd order pole of the function. 

#### Comment

Laurent Series expanded at the point $z_0 = \pi/2$ is going to give us the same answer. But sometimes this route can be harder than in this case. 