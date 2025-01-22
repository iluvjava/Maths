- [Topological Spaces](../Topological%20Spaces.md). 
- [Real Analysis Basics](Real%20Analysis%20Basics.md). 
---
### **Intro**

The theorem is rooted in topology and it defines compactness in topological spaces, and it only becomes closed and bounded in finite Euclidean spaces. 
See [here](https://en.wikipedia.org/wiki/Heine%E2%80%93Borel_theorem) for more info. 
In Metric space, the theorem states the equivalence between closed and bounded condition, and existence of sub-sequential convergence. 
For information regarding the last claim, see [Compactness in Metric Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Compactness%20in%20Metric%20Spaces.md) for more details. 

**References**

These materials were covered in an undergraduate friendly textbook: **Measure, Integration, and Real Analysis by Sheldon Axler.** 

#### **Def-1 | Open Cover**
> A set $A$ has open cover $C_A$ means that $C_A = \bigcup_{i\in I} G_i$, where $I$ is the index set with some type of cardinality, and $G_i, i\in I$ are all open sets. 

#### **Def-2 | Finite Sub Cover**
>  Let $C_A$ be a cover of the set $A$.
>  A finite sub-cover is subset $C'_A\subseteq C_A$ such that it's a finite set and it's a cover of the set $A$. 


---
### **Heine Borel in the Reals**

We consider the equivalence of compactness and the Heine Borel theorem in the real line. 
We show that, any closed intervals in $\mathbb R$ can be covered using finite many open covers, and then we use this fact to generalize the result to all closed and bounded sets. 

#### **Lemma | Finite Subcover for Closed and Bounded Interval**
> The closed and bounded interval $[a, b]\subseteq \mathbb R$  has a finite sub cover to it. 

**Observations and Context**

This lemma is involved in the proof for the equivalence of closed and compactness and Finite Sub Covers for all ope Covers for the set. 
We observe the fact that, trivially if a set of points in a topology is finite, then for every open covers for the set (finite or not), there is a finite sub cover for that set by simply choosing one set the covers each of the point. 

**Proof**

$[a, b]$ is a closed interval, Let $C_{[a, b]}$ be any open cover of the closed interval. We define $D$, a set containing all the closed sub interval that has finite sub covers from $C_{[a, b]}$

$$
\begin{aligned}
    D:= \left\{
            d \in [a, b]
            \left|
                [a, d] \subseteq \bigcup_{i\in J \subseteq I} G_i, 
                |J|\in \mathbb N
            \right.
        \right\}, 
\end{aligned}
$$

We make the observations that: 

1. $a\in D$, because $\{a\}$ is a singleton, using $C_{[a, b]}$ there exists some $G\in C_{[a, b]}$ such that $a \in G$. Therefore, $D\neq \emptyset$. 
2. By completeness of $\mathbb R$, there exists $s = \sup D$. 


Since $D\subseteq [a, b]$, we have $\sup D \le b$, and by closure of the closed interval and definition of $D$ we must have $s \in [a, b]$. Then, using $C_{[a, b]}$ there exists $G_s\in C_{[a, b]}$ such that $s\in G_s$. $G_s$ is open then $\exists \delta > 0 : (s - \delta, s + \delta)\subseteq G_s$. We now partition the set, cutting it from the middle with $s$, and consider some elements from these sets. Consider 

$$
\begin{aligned}
    & d\in (s - \delta, s) \implies \exists d^* > d , d^* < s , d^*\in (s - \delta, s + \delta) \text{ s.t: }
    d^* \in D
    \\
    & d^* \in D \implies [a, d^*] \text{ has finite open cvr from} C_{[a, b]}
    \\
    \implies & [a, d] \text{ has finite open cvr } C_{[a, b]}, \text{ by }d < d^*
    \\
    \implies & d \in D, 
\end{aligned}
$$

then, let $\bigcup_{i\in J^*}G_i$ be the finite sub cover for $[a, d]$, with $J^*$ being a countable subsets of the index $I$. Next consider another element from the other partition of the epsilon vicinity of $s$, giving us 

$$
\begin{aligned}
    & d'\in [s, s + \delta) \implies d'\in (s - \delta, s + \delta)
    \\
    & \text{by }d' \in [s - \delta, s) \subseteq (s - \delta, s + \delta), d'\in G_s
    \\
    \implies & 
    [a, d']  = [a, d] \cup (s - \delta, d']= 
    G_s \cup \bigcup_{i \in J^*}G_i, \text{ has a finite cvr from }C_{[a, b]}
    \\
    \implies & 
    d' \in D
\end{aligned}
$$

finally, we exam the possibility of $d' \in D$, by $D\subseteq [a, b]$, it has to be the case that $d' \in [s, s + \delta) \cap [a, b]$, since for any $s < d'$, we have $d' \in D$, it has to be the case that $d' \ge s$, but by $s = \sup D$, it has to be that $d' = s$. By the previous argument, we can take the sup over $[s, s + \delta)\cap [a, b]$, giving us the singleton $\{d\}$, which means that $d' = s = b$, and the limit assures that $[a, d
'] = [a, b]$ and the whole closed interval has a finite sub cover from $C_{[a, b]}$. By the fact that the open cover is arbitrary, the lemma is proven. 


#### **Thm-1 (2.12) | Heine-Borel in Reals**
> Every open cover of a closed bounded subsets of $\mathbb R$ has a finite subcover. 

**Proof**

Using the previous lemma, we are ready to prove the theorem in $\mathbb R$. 
