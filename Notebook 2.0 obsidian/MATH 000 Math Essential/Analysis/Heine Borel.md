- [Topological Spaces](../Topological%20Spaces.md). 
- [Real Analysis Basics](Real%20Analysis%20Basics.md). 
---
### **Intro**

The theorem is rooted in topology and it defines compactness in topological spaces, and it only becomes closed and bounded in finite Euclidean spaces. 
See [here](https://en.wikipedia.org/wiki/Heine%E2%80%93Borel_theorem) for more info. 
In finite dimensional Banach space, the theorem states the equivalence between closed and bounded condition, and existence of sub-sequential convergence. 
For information regarding sequential compactness, see [Compactness in Metric Spaces](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Compactness%20in%20Metric%20Spaces.md) for more details. 

This files demonstrate the principle of Heine Borel in the context of real anlaysis on the set $\R$. 

**References**

These materials were covered in an undergraduate friendly textbook: **Measure, Integration, and Real Analysis by Sheldon Axler.** 


#### **Def | Open cover on $\R$, finite subcover**
> Let $A \subseteq \R$. 
> 1. A collection of $\mathcal C$ of open subsets of $\R$ is called an **open cover** if, $A \subseteq \bigcup_{C \in \mathcal C} C$, i.e: A is contained in the union of all the sets in $\mathcal C$. 
> 2. An open cover is said to have **finite sub cover** if there exists $|I| < \infty$ such that $C_i \in \mathcal C$ for all $i \in I$ and $A \subseteq \bigcup_{i \in I}C_i$; i.e: The set $A$ is contained within a finite subsets of open cover $\mathcal C$. 


---
### **Heine Borel in the Reals**

We consider the equivalence of compactness and the Heine Borel theorem in the real line. 
We show that, any closed intervals in $\mathbb R$ can be covered using finite many open covers, and then we use this fact to generalize the result to all closed and bounded sets. 

#### **Lemma | Closed and bounded interval has finite sub cover for all coverings**
> The closed and bounded interval $[a, b]\subseteq \mathbb R$ has a finite sub cover to it. 

**Observations and Context**

1. If the set of points in a topology (i.e: The interval $[a, b]$) is finite, then for ever open covers of the set, will have a finite sub cover that also covers the set. 

**Proof**

$[a, b]$ is a closed interval, Let $C_{[a, b]}$ be a any open cover of $[a, b]$. 
Define $D$, a set containing all the closed sub interval that has finite sub covers from $C_{[a, b]}$, i.e: 

$$
\begin{aligned}
    D:= \left\{
        d \in [a, b]
        \left|
            [a, d] \subseteq \bigcup_{i\in J \subseteq I} G_i, 
            |J|\in \mathbb N
        \right.
    \right\}.
\end{aligned}
$$

Then, the followings are true: 

1. $D\neq \emptyset$ because $a\in D$. Choose any open $G$ s.t: $a \in G$, then $a \in G \in C_{[a, b]}$ so $a \in D$. 
2. By completeness of $\mathbb R$ and $D \neq \emptyset$, there exists $s = \sup D$. 

By the construction of $D$, $s \le d$. The proof follows shows that $s < d$ gives contradiction hence $s = d$. 

Since $D\subseteq [a, b]$, we have $s = \sup D \le b$. 
For contradiction let $s < b$. 
There exists $s\in G_s$ where $G_s$ is an open set by property of $\R$, then $G_s \in C_{[a, b]}$ is valid.
Since $G_s$ is open, $\exists \delta > 0 : (s - \delta, s + \delta) \in G_s$. 
For any $d \in G_s$, there are two cases. 

There exists $d \in (s - \delta, s]$ then $d \in [a, s] \subseteq D$ hence finite open cover exists and it follows: 
$$
\begin{aligned}
    \exists n \in \N: [a, d] \subseteq \bigcup_{i = 1}^n G_i. 
\end{aligned}
$$

There exists $d \le d'\in [s, s + \delta)$ also, and it follows: 

$$
\begin{aligned}
    [a, d'] \subseteq \left(
        \bigcup_{i = 1}^n G_i
    \right)\cup G_s. 
\end{aligned}
$$

Hence $d' \in D$ as well. 
If $s < b$, then $s < d'\in D$ exists and it breaks $s = \sup D$. 
Therefore it has to be that $s = b$. 


**Remarks**

Proofs may be extended to finite dimensional Banach space using the construction of hypercubes. 
Without loss of generality a unit hypercube can be used because things can be rescaled. 


#### **Thm-1 (2.12) | Heine-Borel in Reals**
> Every open cover of a closed bounded subsets of $\mathbb R$ has a finite subcover. 

**Proof**

Using the previous lemma, we are ready to prove the theorem in $\mathbb R$. 
