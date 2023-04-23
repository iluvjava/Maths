[[Subgradient Intro]]. 

---
### **Intro**

When the function is convex, the subgradient has epigraphical interpretation based on convexity, and theorems are nicer to prove. 

**Defintion: Convex Subgradient**

> Let $f$  be convex proper function mapping from $\mathbb E$ to $\mathbb {\bar R}$, a vector $g$ is referred to as sub-differential to the point $x\in \text{dom}(f)$ when: 
> 
> $$
>     f(y) \ge f(x) + \langle g, y - x\rangle \quad \forall y\in \mathbb E
> $$
> 
> Define the set of all Sub-gradient at $x$ to be: $\partial[f]_{x}$And when $x\not\in \text{dom}(f)$ we defined $\partial [f]_x = \emptyset$. 

**Observations**
Immediately observe that $(x, f(x)), (\partial(x), -1)$ gives a separations plane for set $\text{epi}(f)$ for every point that is on the boundary of the epigraph. 

**Domain of the Subgradient**
> The domain of the subgradient of a function $f$ denoted as $\text{dom}\partial f = \{x\in \partial f(x)| \partial f(x) \neq \emptyset\}$.

**Remarks**

The definition in this case is inconsistent with the definition of gradient of smooth function when $f$ nonconvex. For instance, the function $x^3$ has $\emptyset$ at $x = 0$ for subgradient, but the function has a well defined gradient at $x = 0$. Recall the epigraphical interpretation that, when the function is not convex, it might not be possible to separate the epigraph using a plane and a point on the boundary of the epigraph. 

For convenience of notation, one has the choice of writing the definition of subgradient directly with: 

$$
\begin{aligned}
    f(y) \ge f(x) + \langle \partial[f]_x,y - x\rangle
\end{aligned}
$$

And that is enough to understand what people are saying. Finally, please observe that a subgradient is a type of multivalued function: [[Multivalued Functions, Set-valued Mappings]]), and it inherit some properties from multi-valued mappings. 

---
### **Differentiable Function Yields Singleton Subgradient**

Recall that a function is F-differentiable at some point $x$, in the interior of its domain then there exists $g \in X$ such that: 

$$
\begin{aligned}
    \lim_{h\rightarrow 0} \frac{f(x + h) - f(x) - \langle h, g\rangle}{\Vert h\Vert} = 0
\end{aligned}
$$

**Thm: Singleton Convex Subgradient**

Assuming that $f$ is convex and proper on $X$, suppose that $x\in \text{int.dom}(f)$, Then
$$
\begin{aligned}
    f\text{ is differentiable }\iff \partial f(x) \text{ is a singleton}, 
\end{aligned}
$$


**Reference**: 

Proposition 17.3, Heinz, Combettes, Monotone Convex Textbook. 


---
### **Optimality Conditions Characterized by Subgradient of Convex Functions | Fermat's Theorem**

One almost trivial results from the above definition is that if $x^+$ is a minimizer for the convex function $f(x)$, then $\mathbf 0 \in \partial [f]_{x^+}$ because: 

$$
f(y) \ge f(x^+) \quad \forall y\in \mathbb E
$$

And it can be viewed that $g = \mathbf 0$, directly interpreted from the definition of the subgradient. 


---
### **Cousin Concept**

Convex directional derivative, see [[Convex Directional Derivatives]] for full information. 