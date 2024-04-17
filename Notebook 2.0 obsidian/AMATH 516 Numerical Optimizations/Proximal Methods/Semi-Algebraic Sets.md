- [Kurdyka Lojasiewicz Inequality](Kurdyka%20Lojasiewicz%20Inequality.md)

---
### **Introduction**

The concept of a semi-algebraic sets are relevant to characterizing functions with Kurdyka Lojasiewicz property. 

#### **Def | Real Semi-Algebraic Set**
> $S \subseteq \mathbb R^n$ is Semi-Algebraic, denoted as $S \in \{\text{Semi-Alg}\}$, if there exists a finite numbre of polynomial functions $P_{i, j}, Q_{i, j}: \mathbb R^n \mapsto \mathbb R$ such that 
> $$
>     S = \bigcup_{j = 1}^q \bigcap_{i = 1}^q 
>     \left\lbrace
>         x \in \mathbb R^n : P_{i, j}(x) = 0, Q_{i, j} < 0
>     \right\rbrace. 
> $$


#### **Def | Semi-Algebraic Set Mapping, Function**
> Let $f: \mathbb R^n \mapsto \mathbb {\overline R}$, $F: \mathbb R^n \mapsto 2^{\mathbb R^m}$ be a function and a multi-valued mapping. 
> Then they are semi-algebraic, denoted as $F, f \in \{\text{Semi-Alg}\}$ if for them we have 
> $$
> \begin{aligned}
>     & \left\lbrace
>         (x, y) \in \mathbb R^{n + 1} : f(x) = \lambda
>     \right\rbrace \in 
>     \{\text{Semi-Alg}\}
>     \\
>     & \left\lbrace
>         (x, y) \in \mathbb R^{n + m} : 
>         y \in F(x)
>     \right\rbrace 
>     \in 
>     \{\text{Semi-Alg}\}. 
> \end{aligned}
> $$
> Where, for the multivalued mapping, $y\in F(x) \iff (x, y) \in \text{gph}(F)$. 

**Remark**

If a function is Real semi-algebraic, then it's a KL function. 
