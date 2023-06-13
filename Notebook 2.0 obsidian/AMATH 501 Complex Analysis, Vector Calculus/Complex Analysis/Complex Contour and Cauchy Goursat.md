- [[Complex Functions]]
- [[Line Integral]]
- [[Cauchy Riemann Condition]]

---
### **Intro**

Integration on complex functions are line integral. Let $\gamma$ be the line between 2 points, $z_0, z_1$. And let's parameterize the <mark style="background: #FF5582A6;">*smooth curve*</mark> that links between these 2 paths, represented as $z(t) = x(t) + i y(t)$. The integral of on the complex plane will be the following: 

> $$
> \int_{z_0}^{z_1} zdz = \int_{x_0}^{z_1}z(t)z'(t)dt. 
> $$


#### **Comment**: 

A <mark style="background: #FF5582A6;">*smooth curve*</mark> means that the derivative of the curve is continuous, and the derivative at the end point $t = a$, or $t = b$ cannot be zero. At the end point, it the derivative is a directional derivative. A piece-wise smooth curve means that: It's joined together by finitely many smooth curve, end to end, no space in between. The above theorem is applicable for both smooth and piece-wise smooth curve. 

---
### **FTCI | Fundamental Theorem of Contour Integration**

> If the function is analytic, then $\int_{a}^{b} f(z(t))d(z(t)) = F(b) - F(b)$. 

This is the same as the Fundamental Theorem of Calculus.  Let $f(z) = u(x, y) + iv(x, y)$ which then it can be viewed as 2 functions: $\text{Re}(f(z)) = u(x,y), \text{Im}(f(z)) = v(x, y)$. The line integral on this complex function can be implicitly stated as the following: 

$$
\begin{aligned}
	& \int_{z_0}^{z_1} (u(x, y) + i v(x, y))(x' + iy')dt
	\\
	& 
	\int_{z_0}^{z_1} (u(x, y)x' - v(x, y)y') + i(v(x, y) + u(x, y)y')dt.
\end{aligned}
$$

Observe that, the vector field: $(u, -v)$ has a curl of $-u_y - v_x$,  by Cauchy Riemann conditions, this is zero. Similarly, the vector field $(v, u)$ has a curl of $\partial_x u - \partial_y v$ which is zero according to Cauchy Riemann Conditions. Then, both line integrals on the Real and Imaginary part of the function will be a *conservative field* (See [Conservative Vector Field Extra](../Vector%20Calculus/Conservative%20Vector%20Field%20Extra.md) for more info about curl-free vector field), then by conservative vector field, we there exists potential $F$ such that

$$
\int_{x_0}^{x_1} zdz = F(z_1) - F(x_2). 
$$

---
### **Cauchy Goursat Theorem** 

> If $f(z)$ is holomorphic/Analytic *inside and on* a simple closed curve C, then the integral around the closed C is zero. 

**Proof**

This is a result from the FTCI theorem, and definitely true because of that Conservative Field Argument. 

**Note**: 

$1/z$ is not applicable for Cauchy Goursat Theorem if the closed path include the origin because the function is not differentiable at the origin, and this breaks the preconditions of the theorem. 

#### **Corollary-1 | Key hole Isolation for Non-Analytical Region**

> If $f(z)$ is analytic between C1 and C2, then the line integral on C1 and C2 gives the same value. 

Consider the contour

![Cauchy-Goursat](../../Assets%20By%20Hands/Cauchy-Goursat.png)

We first close the corridor of width $h$, then we will have 2 contour integrals with the relation that

$$\oint_C f(z) dz = 0 = \oint_{C1}f(z) dz - \oint_{C2} f(z)dz$$

The negative sign is due to inner circular contour rotates close-wise. Hence, the Line integral of $C1, C2$ are equal. 


---
#### **Application | Differential Quotion**

Let $f$ be analytical/holomorphic on an region $\Omega$ containing the closure of a disk $D$, centering at $z_0$. Observe that 

$$
\begin{aligned}
	g(z) = \frac{f(z) - f(z_0)}{z - z_0}
\end{aligned}
$$

is continuous over the region $\mathbb C \setminus \{z_0\}$, since it's analytical, we can redefine $g(z_0) = f'(z_0)$, then the function $g(z)$ is going to be analytical. This is true by considering the Taylor series expansion centered at $z_0$, we have

$$
\begin{aligned}
\end{aligned}
$$


