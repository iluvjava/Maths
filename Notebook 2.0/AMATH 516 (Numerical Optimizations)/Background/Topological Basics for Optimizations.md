In fact, we need a bit of topology to get identify the type of functions that can fit with first order optimizations. 
[[Linear Algebra Basics for Optimization]]

Please note that, some of the discussion will feel familiar to discussion spotted here: [[Closed, Proper, Level Bounded, Strong Convex]], which also concerns the topological properties of sets related to the family of convex functions. 

---
### **Intro**

The geometric properties of function classifies them, and their properties that are relevant to optimizations. We focuses on Finite Euclidean spaces for real numbers, which is most applicable to most of the optimizations theories. 

Set Topologies are particular useful for characterizing the behavior of functions that are $C1$, the rampy function. 

---
### **Notations**

$$
\begin{aligned}
    \limsup_{x\rightarrow y}
    \\
    \limsup_{x\rightarrow y}
\end{aligned}
$$

In which, the operator imposes the $\sup, \inf$ onto the tail of a sequence. Suppose that $a_i$ is a countable sequence the converges to $a$, then we can say that: 

**Limsup of a sequence**

> $$
> \limsup_{a\rightarrow a} a_i = \lim_{i\rightarrow \infty}  \left\lbrace
>     \sup_{j\ge i} \left\lbrace
>         a_i
>     \right\rbrace
> \right\rbrace
> $$
> The limit of the upper bound of the tail as the function goes up. Basically, how big can it bounce if I just snap it in the middle and look at its tail. 

And extending the argument to a Euclidean space, we have for example, a function that is a mapping from $\mathbf{E}$ to the set $\bar{\mathbb{R}}$, then we can say: 

**Liminf of a function on Euclidean space**

> $$
> \liminf_{y\rightarrow x} f(y) = \lim_{r\rightarrow 0} \left\lbrace
>     \inf_{y\in \mathbb{B}_r(x)\setminus\{x\}} f(y)
> \right\rbrace
> $$
> The liminf as $y\rightarrow x$ on a function is the limit of the lower bound of function value mapping an epsilon ball centered at $x$ (excluding $x$). 

**Epsilon Balls**

$$
\mathbb{B}_r(x) = \{y: \Vert y - x\Vert_2^2 \le r\}
$$


---
### **A List of Topics**

General Topology
[[Closure Topology]]
[[Convex Sets]]
[[Interior Topology]]
[[Affine Hull, Affine Span]]
[[Relative Interior And Relative Boundary]]

Sets and Geometry related
[[Convex Sets]]
[[Euclidean Space]]
[[Lower Semi-Continuous]]
[[Generating Cone of a Set]]
[[Convex Hull, Convex Span]]