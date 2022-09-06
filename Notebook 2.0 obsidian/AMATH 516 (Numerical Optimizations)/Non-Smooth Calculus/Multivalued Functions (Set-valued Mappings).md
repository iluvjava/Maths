[[Characterizing Functions for Optimizations]]
[[Relations]]

---
### **Intro**

A multifunction is a special time of relations. Let $F(x)$ be a multifunction, we denote $R$ to be a relations then: 

$$
F(x) = y \iff (x, y)\in R
$$

$F$ is an operator that maps $\mathbb E$ to $\mathbb E$, back to itself, denoted as $F: \mathbb E\rightrightarrows\mathbb E$. Here is a list of concepts for the operators we defined consequently: 

$$
\begin{aligned}
    & \text{dom}(F) := \{x: \exists y: (x, y)\in R\}
    \\
    & \text{ran}(F) := \{y: (x, y)\in R\}
    \\
    & \text{gph}(F) := \{(x, y): (x, y) \in R\}
\end{aligned}
$$

The graph of the operator is literally the multi-function visualized on a higher dimensions of the cross product space. 

---
### **Composition and Additions**

Let $T, S$ be 2 set-valued operators, then the composition between the 2 operator 

$$
\text{gph}(T(S))= \{(x, y)| (x, z)\in \text{gph}(S), (z, y)\in \text{gph}(T)\}. 
$$

Let $T, S$ be 2 set-valued operators, then their additions is taking the same domains for both operators, but performing Minkowski summations for the output, giving us: 

$$
\text{gph}(T + S) = \{(x, y + z)|(x, y)\in T, (x, z)\in S\}, 
$$

For simplicity we denotes $(x, y)\in T$ as $(x, y)\in \text{gph}(T)$. When thinking about the set-valued operators, we might treat then directly as their graph instead. 