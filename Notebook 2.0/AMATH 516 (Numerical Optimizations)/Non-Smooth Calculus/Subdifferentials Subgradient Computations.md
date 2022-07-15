[[Subgradient and Subdifferential Definition]]
[[Characterizing Functions for Optimizations]]


---
### **Intro**

We introduce a simple theorem and then we are going fully hardcore about it using materials in \<Firt Order Method in Optimizations\> by SIAM. Before we start, there are 2 types of subgradient: 

* **Strong Subgradient**: All the possible subgradient at a point given the function. 
* **Weak Subgradient**: Just a subset of all the possible subgradient. 

The weak subgradient is relative easier to find. 


**Theorem: Sperable Subdifferential for Summations**

> Suppose a function is in the form of $f: \mathbb E_1 \times \mathbb E_2 \cdots \mathbb E_n \mapsto \mathbb {\bar R}$, written as $\sum_{i =1}^{n}f_i(x_i)$ where $x_i\in \mathbb E_i$, then the subdifferential of the function is: 
> 
> $$
> \partial[f]_{(x_1, x_2, x_3,\cdots, x_n)} = \partial[f_1](x_1)\times \partial [f_2](x_2)\times \cdots \times \partial [f_n](x_n)
> $$

Source: Unassigned Exercises in AMATH 516 FALL 2021

**Theorem: Smooth Plus Nonsmooth**

> Let $f, g$ be 2 proper functions, and suppose that $f$ is smooth and differentiable at the point $x$, then: 
> $$
>   \partial [f + g](x)  = \nabla [f](x) + \partial [g](x)
> $$

**Source**: Unassigned exercise from AMATH 516. 

**Theorem: Subgradient of Pointwise Maximum of Functions**

> Suppose a function is in the form of a pointwise maximum of countably many function: $f(x):= \max_{i\in [n]}f_i(x)$ for all $f_i$ that are convex. Then the strong subgradient of the function is: 
> $$
> \begin{aligned}
>     & I(x):= \{i\in[n]: f_i(x) = f(x)\}
>     \\
>     & \partial [f](x) = \text{cvxh}
>     \left(
>         \bigcup_{i\in I(x)}\partial [f_i](x)
>     \right)
> \end{aligned}
> $$
> The weak subgradient is to choose any $i\in I(x)$, and choose any $g\in \partial[f_i](x)$ and that will work: $g\in \partial[f](x)$. 

**Source**: [Stack Exchange Discussion](https://math.stackexchange.com/questions/229025/subgradients-of-function). Original course notes is: [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf). 

**Theorem: Subgradient of Affine Transformation**

> The subgradient of the function $f(Ax + b)$ wrt to x is: 
> $$
>   \partial[f(Ax + b)|x](x) = A^T\partial[f](Ax + b)	
> $$

**Tools for Analysis**

Before we go further, we need to make the point that subdifferential on augmented real function is not simple businesses, and we would like to meet one of the pathological instances to show it. The instance comes from Dimitry's Notes for AMATH 516 FALL 2021, and it illustrate that adding subgradient together could be problematic. 

---
### **Computation Rule: Summation**



