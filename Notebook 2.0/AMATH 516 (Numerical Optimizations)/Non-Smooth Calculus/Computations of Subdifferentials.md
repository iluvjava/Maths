[[Subgradient and Subdifferential Definition]]

---
### **Intro**

We introduce a simple theorem and then we are going fully hardcore about it using materials in \<Firt Order Method in Optimizations\> by SIAM. 

**Theorem: Sperable Subdifferential for Summations**

> Suppose a function is in the form of $f: \mathbb E_1 \times \mathbb E_2 \cdots \mathbb E_n \mapsto \mathbb {\bar R}$, written as $\sum_{i =1}^{n}f_i(x_i)$ where $x_i\in \mathbb E_i$, then the subdifferential of the function is: 
> 
> $$
> \partial[f]_{(x_1, x_2, x_3,\cdots, x_n)} = \partial[f_1](x_1)\times \partial [f_2](x_2)\times \cdots \times \partial [f_n](x_n)
> $$


**Theorem: Smooth Plus Nonsmooth**

> Let $f, g$ be 2 proper functions, and suppose that $f$ is smooth and differentiable at the point $x$, then: 
> $$
>   \partial [f + g](x)  = \nabla [f](x) + \partial [g](x)
> $$


**Source**

Unassigned exercise from AMATH 516. 


