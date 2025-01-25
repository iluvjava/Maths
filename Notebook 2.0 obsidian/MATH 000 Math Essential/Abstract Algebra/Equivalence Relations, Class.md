[Relations](../Relations.md)

---
### **Intro**

Equivalence relation is a relation that generalizes the idea of equality. 

**Keywords**
1. Equivalence Relation, Equivalent class. 
2. Factor set. 

**References**



#### **Definition 1 (2.2.1) | Equivalence Relation**
> For a set $R \subseteq S \times S$, where the equivalence relation is generated on, it has the properties that: 
$$
\begin{aligned}
    \text{Reflexive: }& (a, a) \in R
    \\
    \text{Symmetric}: & (a, b) \in R \wedge (b, a) \in R
    \\
    \text{Transitive}: & (a, b) \in R \wedge (b, c) \in R \implies
    (a, c) \in R
\end{aligned}
$$

#### **Definition 2 (2.2.2) | Equivalent Class**
> Let $\sim$ be an equivalence relation on the set $S$, for any $a \in S$. 
> For a given element $a \in S$, we define the *equivalent class* of $a$ to be the set of all elements of $S$ such that are equivalent to $a$, it's denoted using notation $[a]$, in symbols $[a] := \{x \in S | x \sim a\}$. 
> The notation $S/\sim$ denotes the collection of equivalence classes of $S$ defined by the equivalence relation $\sim$. We say that $S/\sim$ is the *factor set* of the relation $\sim$. 

----
### **Enlightening Examples**

I think the equality after mapping the elements over a function is the canonical ways of looking at equivalence relations. 

#### **Example 2 (2.2.2 in ref) | Function on elements in S**
> Let $f : S \mapsto T$ be any function. For $x_1, x_2 \in S$, we define $x_1 \sim_f x_2$ if $f(x_1) = f(x_2)$. Then for all $x_1, x_2, x_3 \in S$, we have: 
> 1. $f(x_1) = f(x_1)$ for sure. 
> 2. $f(x_1) = f(x_2)$ then $f(x_2) = f(x_1)$ easily, 
> 3. $f(x_1) = f(x_2) \wedge f(x_2) = f(x_3) \implies f(x_1) = f(x_3)$ obviously, 
> therefore, this is indeed  an equivalence relation on the set $S$. 

**Observations**

This is a way of partitioning the domain of the function and reminds me of the construction behind Lebesgue Integral. 

#### **Example 1 (2.2.1 in ref) | Congruence of on Modulo n**
> It's not hard to see that, the equivalence relation under modulo-n is using a mapping $f(x) = \text{mod}(x, n)$ on the set $\Z$, and hence, using the previous example, this function will induce an equivalence relation on the set $\Z$. 

**Observations**
By definition of an equivalent class, choose any $y \in \{0, 1, \cdots, n\}$, for some $n \ge 1$, then the equivalent class represented by $y$ is 

$$
\begin{aligned}
    [y] &:= \{x \in \mathbb Z : \text{mod}(x, n) = y\}
    \\
    [y] &:= \{y + kn : k \in \mathbb Z\}. 
\end{aligned}
$$


---
### **Theorems and Propositions**

We introduce some basic theorems followed from the above definitions. 

#### **Prp 1 (2.2.3 in ref) | Equivalent classes partitions the set**

> Let $S$ be a set, and let $\sim$ be an equivalence relation on $S$. Then each element of $S$ belongs to exactly one of the equivalence classes of $S$ determined by the relation $\sim$. 

**Observations**

Each element of $S$ belongs to exactly one equivalent class of $S$, this means that, the equivalent classes of $S$ is partitioning the set $S$. 

**Proof**
#UNFINISHED 

