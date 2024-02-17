---
alias: General Topology Intro

---
### **Intro**

References were from Heinz's Monotone Book. 

### **Defining Topological Spaces**

> Let $\mathcal X$ be a set and $T \subseteq 2^{\mathcal X}$, the set $T$ is a collection of $\mathcal X$ which we refer to be a topology when 
> 1. $\emptyset, X \in T$. 
> 2. Let $I$ be an arbitrary index set with $U_i\in T$ for all $i\in I$ then $\bigcup_{i\in I}U_i \in T$. It's closed under union. 
> 3. Let $\{U_i\}_{i=1}^n$ be an arbitrary finite subset of $T$, then $\bigcap_{i=1}^n U_i \in T$. The set $T$ is closed under finite intersections. 
> 
> Then, $(\mathcal X, T)$ is a topological space. 


**Remarks**

A general index sets $I$ can go beyond countable infinity. The sets in the topology $T$ are the open sets. Convince yourself with the fact that open intervals on $\mathbb R$ is an example of a topology. Infinite intersection of open sets can however, close an open set. 


**Definition | Neighborhood**

> $\mathcal V(x)$ is a neighborhood of an element $x\in \mathcal X$ is a subset $V\subseteq \mathcal X$ such that $\exists U\in T$ with $x\in U \subseteq V$, or mathematically given as: 
> $$
> \begin{aligned}
>   \mathcal V(x):= \{V\subseteq \mathcal X| \exists U\in T: x\in U \subseteq V\}.
> \end{aligned}
> $$

**Observations**

A neighborbood is not necessarily from the topology $T$. If it is, then it's trivial since $V = U$ by $U$ is a subset of itself. The set containing $x$,  $U\in T$ is from the topology, with $x$ being an element of $U$. On the real line, the neighborhood of $x$ is $(x - \epsilon, x + \epsilon)$, an open set containing $x$, and it contains uncountably many open sets containing $x$ as well. 

**Base**

> A base $\mathbb B\subseteq T$ is when for all $x\in \mathcal X$, $V \in \mathcal V(x)$ there exists $B\in \mathbb B$ such that $x\in B \subseteq V$. 

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
In $\mathcal H$ spaces, 2 open half spaces will be able to separate 2 points in the topology of $\mathcal H$. 
