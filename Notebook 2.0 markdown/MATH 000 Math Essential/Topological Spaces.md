### **Defining Topological Spaces**

> Let $\mathcal X$ be a set and $T \subseteq 2^{\mathcal X}$, with $\mathcal X, \emptyset \in T$ and $T$ contains all *arbitrary unions* and *finite intersection* of its element. Then $(\mathcal X, T)$ becomes a topological space and $T$ is a topology. 

1. Elements of $T$ are the open sets. The complement of any of its element is a closed set. 

**Neighborhood**

> $\mathcal V(x)$ is a neighborhood of an element $x\in \mathcal X$ is a subset $V\subseteq \mathcal X$ such that $\exists U\in T$ with $x\in U \subseteq V$, or mathematically given as: 
> $$
> \begin{aligned}
>   \mathcal V(x):= \{V\subseteq \mathcal X| \exists U\in T: x\in U \subseteq V\}.
> \end{aligned}
> $$

In real analysis, the neighborhood of a real number is the open epsilon ball around that number.  

**Base**

> A base $\mathbb B\subseteq T$ is when for all $x\in \mathcal X$, $V in \mathcal V(x)$ there exists $B\in \mathbb B$ such that $x\in B \subseteq V$. 

$\mathbb  B$ is a base for topology $B$, then every set in $T$ can be written as a union of elements using elements from $\mathbb B$. 

**Interior**

> Let $C\subseteq \mathcal X$, then $\text{int}(C)$ is the largest opened set contained in $C$ such that $x\in \mathcal X\wedge \text{int}(C)$ iff $\exists V \in \mathcal V(x)$ with $V\in C$. 

**Closure of C**

> A close $C\subseteq \mathcal X$ is the the smallest closed set contained in $C$, denoted as $\text{cl}(C)$. 

For example, when $\text{cl}(C) = \mathcal X$, then the set $C$ is dense. And $x\in \text{cl}(C)$ iff $\forall V\in \mathcal V(x)$ we have $V \cap C\neq \emptyset$. 

**Boundary:**

> The boundary of a set $C$ is $C\setminus \text{int}(C)$. 

---
### **Hausdorff Space**

> $x_1, x_2 \in \mathcal X$, with $x_1 \neq x_2$, then exists $V_2 \in \mathcal V(x), V_2\in \mathcal V(x)$ such that $V_1\cap V_2 = \emptyset$. 

Almost all spaces involved in analysis is Hausdorff space. 
