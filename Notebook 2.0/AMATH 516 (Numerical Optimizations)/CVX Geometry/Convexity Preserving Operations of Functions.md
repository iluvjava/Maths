[[Convexity Preserving Operations of Sets]]

---
### **Intro**

Using the convexity theories for sets, we apply it to the epi-graph of the function so that it translates to the convexity of the functions. These results will be listed here: 

Let $\{f_i\}_{i}^m, f$ be a listed of augmented real functions mapping between euclidean spaces $\mathbb E, \mathbb V$, with $\mathcal A$ be a linear mapping between $\mathbb M\mapsto \mathbb E$, then

* $f(\mathcal Ax + b)$ is a convex function. (By linear mapping of convex sets)
* $\sum_{i = 1}^{m}\alpha_if_i(x)$ with $\alpha_i \; \ge 0 \forall i$ then the sum is convex as well. (By sets addition, where the sets are the epigraph of $f$)
* $\max_i\{f_i(x)\}$ is convex too. (By intersection of convex epigraph of $f_i$)

For more complicated ones, see what is below. 

---
### **Convexity Under Partial Minimizations**

> Let $f$ be $\mathbb E_1 \times \mathbb E_2 \rightarrow (-\infty, \infty]$ and *convex*, so that the function is a proper augmented real function, and it has the property that is: 
> 
> $$
> \forall x \in \mathbb E_1 \exists y \in \mathbb E_2: f(x, y) < \infty
> $$
> 
> Then define: 
> 
> $$
> g(x) \equiv \min_{y\in \mathbb E_1} f(x, y) < \infty
> $$
> 
> Then $g(x)$ is a convex function. 



