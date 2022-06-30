[[Normal Cone]]
[[Polar Cone]]
[[Characterizing Functions for Optimizations]]

---

### **Intro**

Previous coverage of the same thing but for beginner: [[Subgradient]]. Materials take with reference from Chapter 3 of \<First Order Method for Optimizations\> by SIAM. 


**Defintion: Subgradient**

> Let $f$  be convex proper function mapping from $\mathbb E$ to $\mathbb {\bar R}$, a vector $g$ is referred to as sub-differential to the point $x\in \text{dom}(f)$ when: 
> 
> $$
>     f(y) \ge f(x) + \langle g, y - x\rangle \quad \forall y\in \mathbb E
> $$
> 
> Define the set of all Sub-gradient at $x$ to be: $\partial[f]_{x}$And when $x\not\in \text{dom}(f)$ we defined $\partial [f]_x = \emptyset$. 

**Remarks**

The definition in this case is not consistent with the definition of gradient of smooth function when $f$ nonconvex. To mitigate this, below is another definition of subgradient and **subdifferential** that generalize the idea to nonconvex, non-smooth functions. 

Geometrically, it's looking for a point that is on the boundary of $\text{epi}(f)$ and then separate the graph using a line defined via $g$. And if such a line is perpendicular, then there is no subgradient for the function for that point. And for all seriousness, it can happen convex function at the exterior of their domain. 

**Definition: Generalized Gradient**

> Let $f$ be $\mathbb E \mapsto \mathbb{\bar R}$, let $g$ be part of the sub-gradient, and let $x\in \text{dom}(f)$, then: 
> 
> $$
> \begin{aligned}
>     f(y) \ge f(x) + \langle g, y - x\rangle + o(\Vert y - x \Vert) \quad \forall y \in \mathbb E
> \end{aligned}
> $$
> 
> And if $x\not\in \text{dom}(f)$, then there is no gradient, and we define the set of generalized **subdifferential** to be the set of all sub-gradient, noted as: $\bar\partial[f]_x$. 

Where the little $o$ notation is a limit in disguise, in this case it has the property: $\lim_{x \rightarrow \infty}\frac{o(\Vert y - x\Vert)}{\Vert y - x\Vert} = 0$. 

**Remarks:**

The supporting tagent line is now only a limiting behaviors for the given function, and now it's consistent with the gradient definition for ordinary smooth function. 



