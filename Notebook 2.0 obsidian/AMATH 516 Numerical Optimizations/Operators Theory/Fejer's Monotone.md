[[Introduction to Operators for Optimizations]]


---
### **Intro**

Fejer monotone is a type of strong generalization to a monotone sequence in Banach Spaces. 

**Definition: Fejer Montone Sequence**
> A sequence $(x_n)_{n\in N}$ is fejer monotone wrt to the set $\emptyset \neq C \subseteq X$ when: 
> $$\forall c \in C, k \in \N: \Vert x_{k + 1} - c\Vert \le \Vert x_k - c\Vert. $$

**Observations**: 

The points in the sequences, is getting closer, to very elements in the set $C$. This is a very strong type of convergence, especially for the set $C\subseteq X$. We explicitly assume that, the set $X$ is some type of Banach space. Traditionally, in the realm of real analysis, a monotone increasing sequence $x_n$ approaches $\sup_{n\in N}x_n$, but observe that, a monotone increasing sequence approaches $C = [\sup_{n\in \N}x_n, \infty)$. We hence showed that our observation is ok. 

**Theorem: Convergence of Fejer Monotone Sequence**

> Let $(x_k)_{k\in \N}$ be Fejer-Monotone w.r.t a nonempty subset $C$ of $X$, then $(x_k)_{k\in \N}$ is bounded; moreover, $(x_k)_{k\in N}$ converges to some point in $C\iff (x_k)_{k\in \N}$ has a cluster point. 

**Observations**: 

The theorem, decomposes monotone convergence into some set $C$ into 2 conditions, the existence of a cluster point, and the property of Fejer Monotone. And the existence of the cluster point inside of $C$ ensures that the limit of the sequence is in the set $C$. 
