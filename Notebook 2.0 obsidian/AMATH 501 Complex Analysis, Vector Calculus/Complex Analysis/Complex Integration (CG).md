Prereq: [[Complex Functions]]
prereq: [[Line Integral]]
prereq: [[Cauchy Riemann Condition]]

---

### Intro

Integration on complex functions are line integral. 

Let $\gamma$ be the line between 2 points, $z_0, z_1$. And let's parameterize a curve that links between these 2 paths, and it will be like the following: 

$$
z(t) = x(t) + i y(t)
$$

And then the integral of on the complex plane will be the following: 

> $$
> \int_{z_0}^{z_1} zdz = \int_{x_0}^{z_1}z(t)z'(t)dt
> $$

This is the starting point. 

#### Comment: 

A **smooth curve** means that the derivative of the curve is continuous, and the derivative at the end point $t = a$, or $t = b$ cannot be zero. 

A piece-wise smooth curve means that: It's joined together by finitely many smooth curve, end to end, no space in between. 

The above theorem is applicable for both smooth and piece-wise smooth curve. 

---
### Fundamental Theorem of Contour Integration (FTCI)

> If the function is analytic, then $\int_{a}^{b} = F(b) - F(b)$

Notice that, this is the same as the Fundamental Theorem of Calculus. 

This is the case because $f(z) = u(x, y) + iv(x, y)$ can be viewed as 2 functions: 

$$\text{Re}(f(z)) = u(x,y) \quad \text{Im}(f(z)) = v(x, y)$$

Ok, the proof here is obvious, if we do enough algebra that is, the line integral on this complex function can be implicitly stated as the following: 

$$
\int_{z_0}^{z_1} (u(x, y) + i v(x, y))(x' + iy')dt
$$

$$
\int_{z_0}^{z_1} (u(x, y)x' - v(x, y)y') + i(v(x, y) + u(x, y)y')dt
$$

Observe that, the vector field: $(u, -v)$ has a curl of $-u_y - v_x$, and by Cauchy Riemann conditions, this is zero. 

Similarly, the vector field $(v, u)$ has a curl of $\partial_x u - \partial_y v$ which is zero according to Cauchy Riemann Conditions. 

Then, both line integrals on the Real and Imaginary part of the function will be a **conservative field**, and in that case, we know that: 

$$
\int_{x_0}^{x_1} zdz = F(z_1) - F(x_2)
$$

---
### Cauchy Goursat Theorem 

> If $f(z)$ is analytic **inside and on** a simple closed curve C, then the integral around the closed C is zero. 

This is followed from the FTCI theorem, and definitely true because of that Conservative Field Argument. 

Note: $1/z$ is not applicable for Cauchy Goursat Theorem if the closed path include the origin because the function is not differentiable at the origin, and this breaks the preconditions of the theorem. 

#### Corollary

> If $f(z)$ is analytic between C1 and C2, then the line integral on C1 and C2 gives the same value. 

Here is what is happening: 

![[Cauchy-Goursat.png]]

Which is giving us that: 

> $$\oint_C f(z) dz = 0 = \oint_{C1}f(z) dz - \oint_{C2} f(z)dz$$

And hence, the Line integral of $C1, C2$ are equal. Notice that, the negative sign is there because the line integrals on $C1, C2$ has different direction that it's integrating on the path. 

**Important Comment**

$$\int_{\theta = 0}^{\theta = 2\pi}\frac{1}{z}dz = i2\pi$$

So this will be key for solving many other problems. 

This formula is going to be augmented with the usage of Cauchy Integral. 


---

### Simple Example

Let's take a look at some of the simple example that uses the idea of a line integral. 

