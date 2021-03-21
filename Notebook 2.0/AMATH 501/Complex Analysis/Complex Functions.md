In this file, we are going to consider the idea of a complex function and this is going to be the foundations for us. 

prereq: [[Complex Number]]

--- 

### Introduction

A complex single variable function is like: 

> $$f(z): \mathbb{C} \mapsto \mathbb{C}$$


However, this is actually a function that takes in 2 variables and out put 2 variables (Holy shit it's just a 2d vector field), so it's perfectly fine to interpret it this way: 

$$
f(x + yi) = \Re(f(x + yi)) + i\; \Im(f(x + y i))
$$

And then this can be rephrase as if this function is defined via 2 parts, so it's like: 

$$
	f(x, y) = u(x, y) + i v(x, y)
$$

Where the function $u, v$ are mapping from the reals to the reals. 

---
### Differential 

The function can be treated as a real function and apply the rules of derivative, **only if** we know that the function is differentiable. We can't trust it when the function is not differentiable. This can be revealed even with very simple functions. 

All the old rules for derivatives on real functions are applicable here. 

For the basic part, a complex function is differentiable if the following is true: 

> $$\lim_{|z| \rightarrow 0} 
> \frac{f(z + z_0) - f(z)}{z}
> $$

And notice that if we are treating this as a multi-variable functions, then it has to be true that: 

$$
\lim_{\Delta x \rightarrow 0} \frac{u(x + \Delta x, y) - u(\Delta x, y)}{\Delta x} + i\frac{v(u + \Delta x, y) - v(u, y)}{\Delta x}
$$
Which is: 
$$
\partial_x u + i\partial_xv
$$
And it exists. So this is saying that if I approach the point in the real direction then the function is going to be differentiable.

$$
\lim_{i\Delta y \rightarrow 0} \frac{u(x, y + \Delta y) - u(x, y)}{i\Delta y} - i\frac{v(x, y + \Delta y) - v(x, y)}{i\Delta y} 
$$

Also exists, and it's like: 

$$
-i\partial_yu + \partial_yv
$$

And they have to be equal, giving us: [[Cauchy Riemann Conditions (Analyticity)]]

#### Geometrical Interpretation of Differential
Let's write the limit in a different form and it will reveal something about the differential of a complex number: 

> $$
> \lim_{z\rightarrow a} \frac{f(z) - f(a)}{z - a}
> $$

And it's like: 
$$
\lim_{z\rightarrow a} \frac{(f(z) - f(a))(z - a)^*}{|z - a|^2}
$$
Taking the modulus on the limit we have: 
$$
\lim_{z\rightarrow a} \frac{|f(z) - f(a)|}{|z - a|} = |f'(a)|
$$

**The modulus** of $f'(z)$ has very similar meaning in as the real differential, basically if I go any direction around the point a, what kind of changes in magnitude I will get for the output of the function. 

**The argument** of the number $f'(z)$ is actually the difference between $\text{Arg}(z - a)$ and and $\text{Arg}(f(z) - f(a))$. 

**Note**
There are some complications regarding how the argument of the changes and its differential for a complex multi-valued function, see [[Complex Logarithm (The Key)]], [[Branch Cut]] for more. 


---

### Analyticity
Def: 

> If $f(z)$ is differentiable at a point at $z_0$ and everywhere in an open neighborhood  of $z_0$, $f(z)$ is said to be analytic at $z = z_0$. 

This also means that a Taylor Series expansions exists for the function and it converges for a radius that is as large as the circle is not hitting a singular point, or the boundary of analyticity of the function. 

**Note**: Notice that, this is different from the real function's derivative definition, this is saying that if the **first derivative exists, then it has derivatives of all order.** 

---