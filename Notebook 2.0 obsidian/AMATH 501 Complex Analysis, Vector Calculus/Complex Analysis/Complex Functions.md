In this file, we are going to consider the idea of a complex function and this is going to be the foundations for us. 

prereq: [[Complex Number]]

--- 
### **Introduction**

A complex single variable function is like: 

> $$f(z): \mathbb{C} \mapsto \mathbb{C}$$
> However, this is actually a function that takes in 2 variables and out put 2 variables (Just a $\mathbb R^2\mapsto \mathbb R^2$), so it's perfectly fine to interpret it this way: 
> $$
> f(x + yi) = \Re(f(x + yi)) + i\; \Im(f(x + y i)) = u(x, y) + i v(x, y)
> $$
> Where, $u, v$ are $\mathbb R^2 \mapsto \mathbb R$. 

---
### **Complex Differentials**

For more, refers to [Complex Differential, Holomorphic](Complex%20Differential,%20Holomorphic.md) for a detailed overview of the concept. 


---
### **Def | Analyticity**

> If $f(z)$ is differentiable at a point at $z_0$ and everywhere in an open neighborhood  of $z_0$, $f(z)$ is said to be analytic at $z = z_0$. 

**Remarks**

This also means that a Taylor Series expansions exists for the function and it converges for a radius that is as large as the circle is not hitting a singular point, or the boundary of analyticity for the function. These 2 conditions are equivalent. Notice that, this is complete different from the real functions, this is saying that if the algebraic representation of a *first derivative exists around some region, then it has derivatives of all order.*
