In this file, we are going to consider the idea of a complex function and this is going to be the foundations for us. 

prereq: [[Complex Number]]

--- 

### Introduction

A complex single variable function is like: 

> $$f(z): \mathbb{C} \mapsto \mathbb{C}$$


However, this is actually a function that takes in 2 variables and out put 2 variables (Holy shit it's just a 2d vector field), so it's perfectly fine to interpret it this way: 

$$
f(x + yi) = Re(f(x + yi)) + i\; Im(f(x + y i))
$$

And then this can be rephrase as if this function is defined via 2 parts, so it's like: 

$$
	f(x, y) = u(x, y) + i v(x, y)
$$

Where the function $u, v$ are mapping from the reals to the reals. 

### Differential 

The function can be treated as a real function, **only if** we know that the function is differentiable. We can't trust it when the function is not differentiable. This can be revealed even with very simple functions. 

All the old rules for derivatives on real functions are applicable here. 

For the basic part, a complex function is differentiable if the following is true: 

> $$\lim_{|z| \rightarrow 0} 
> \frac{f(z + z_0) - f(z)}{z}
> $$

And notice that if we are treating this as a multi-variable functions, then it has to be true that: 



#### Analyticity
Def: 

> If $f(z)$ is differentiable at a point at $z_0$ and everywhere in an open neighborhood  of $z_0$, $f(z)$ is said to be analytic at $z = z_0$. 

---

