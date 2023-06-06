[Relations](../MATH%20000%20Math%20Essential/Relations.md)

---
### **Intro**

Zorn's lemma is equivalent to the Axiom of Choice. We introduce the terminologies first and then we start talking about the lemmas. There is no proof because this is an axiom level math stuff. 

**Partial Ordering**
> A partial ordering on a set $M$, denote by $\preceq$, is a relation between two elements $a, b\in M$ satisfying: 
> 1. $a\preceq a\implies a = b$, 
> 2. $a\preceq b, b\preceq a \implies a= b$, 
> 3. $a\preceq b, b\preceq c \implies a \preceq c$. 

**Observations**
1. A graph with self arcs on all the vertices that doesn't contain any cycle will form a partial ordering. 
2. The $\subseteq$ operator between sets is a type of partial odering. 
3. If such a relation is represented by a matrices, where each entry $(i, j)\in M\times M$ represent whether 2 element satisfies the relation, then it's similar to a triangular matrix with a full diagonal, up to a permutation transform. 
4. In $\R_n$, $a\preceq b$ is a partial order relation between $a, b$ if, $a_i \le b_i$ for all $1\le i \le n$. 

**Remarks**

A total order is just a partial ordering where every element in the set are in the partial relations. For example, subsets of real numbers are always a total ordering. 

**A Chain**
> A chain $C\subseteq M$ is a subset of a partially order set such that it's totally ordered. 


#### **Def | Maximal Element, Upper Bounds**
> Let $M\subseteq X$ be a subset of a partial ordering: $X$, then: 
> 1. $u\in X$ is a upper bound element of $M$ if for all $a \in M$, $u \succeq a$
> 2. $m\in M$ is a maximal element of $M$ when $a\in M$ has $a\succeq u$ implies $a = u$. 

**Observations**

Maximal element $m$ comes from the subset of the partially ordered set, and the upper bound for the subset is not from the subset. 

---
### **Axiom | Zorn's Lemma**
> A partially ordered set containing upper bounds every chain, necessarily contains at least one maximal element. 

