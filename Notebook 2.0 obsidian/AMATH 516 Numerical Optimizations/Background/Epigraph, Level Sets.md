[[Topological Basics for Optimizations]]

---
### **Intro**

Epigraph and level sets are entities that used in the characterizations of the function for various properties. 
Some of these properties are 
- Lower semi-continuity. 
- Coersivity. 

#### **Definition | Epigraph**

> Let $\mathbb E$ be a finite Euclidean space and a function $f$ is a mapping $\mathbb E \mapsto \mathbb {\bar R}$, we define the epigraph to be
> $$
> \begin{aligned}
>     \text{epi}(f) := 
>     \left\lbrace
>         (x, r)\in \mathbb{E}\times \mathbb{R}: f(x) \le r
>     \right\rbrace
> \end{aligned}
> $$

**Observations**

It's the set of all points in the graph of function $f$ such that it's above the curve. 
We emphasize that the point $r \in \mathbb R$ and it's not $\mathbb {\bar R}$. 
We also emphasize that the point $x \in \mathbb E$, hence it must be bounded if it were to be a membr of the epigraph of any function $f$. 

#### **Def | Level Sets**

> Let $\mathbb E$ be a finite Euclidean space and a function $f$ is a mapping $\mathbb E \mapsto \mathbb {\bar R}$, we define the level set based on $\alpha > 0$ and $\alpha \in \mathbb R$ to be: 
> $$
> \text{lev}_\alpha f = \{x\in \mathbb E : f(x) \le \alpha\} \subseteq \mathbb E 
> $$

**Observations**

It's the pre-image of the function on the set $[-\infty, \alpha]$. 
With $\mathbb E$ being $\mathbb R^n$. 
The level set of any $\alpha \in \mathbb R$ can be represented by 
$$
    \text{lev}_\alpha f\times \{\alpha\} =  
    \text{epi} f \cap \{(x, \alpha): x \in  \mathbb R^n\} = \text{epi} f\cap (\mathbb R^n \times \{\alpha\}), 
$$
which says that a horizontal slice from level $\alpha$ of the epigraph is the same as lifting up the epigraph for $\alpha$.  


