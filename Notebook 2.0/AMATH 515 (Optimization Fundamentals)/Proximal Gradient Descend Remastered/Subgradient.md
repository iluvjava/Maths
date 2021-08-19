
This concept is used for derivative of non-smooth function. 

---
### **Intro**

Sub gradient generaize gradient to nonsmooth function. And it's the type of, **piecewise continuous and Lipschitz Smooth function**, bounded fractal functions are out of the discussion, e.g: The Weistrass Function. 

**Definition of Subgradient**

> $v$ is a subgradient of the function $f$ at point $x$ if $v$ is a convex set of vector such that: 
> 
> $$
> f(x) \ge \langle v, (x - y) \rangle + f(x) \quad \forall v
> $$
> 
> Then we denote $v$ as $\partial f$, to disambiguous, I will use $\bar{\partial}_x$, and it really depends on the context. 


**Consequences**: 

the set is basically: 

$$
v_i \in [a_i, b_i]
$$

Where each element of $v$ will be bounded by a closed interval, therefore, we can apply addition and subtract as horizontal shifting of the interval of each element of the vector $v$. 

Optimality

$$
\mathbf{0}\in \bar{\partial}[f](x^+)
$$

let $g(x)$ be smooth and $h(x)$ be non-smooth then: 

$$
\bar{\partial}[h(x) + g(x)] = \nabla g(x) + \bar{\partial}[h](x)
$$

And this is the subgradient of a smooth plus non-smooth function. 


