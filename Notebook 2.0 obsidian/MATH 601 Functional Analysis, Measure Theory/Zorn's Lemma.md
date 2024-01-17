[Relations](../MATH%20000%20Math%20Essential/Relations.md)

---
### **Intro**

Zorn's lemma is equivalent to the Axiom of Choice. We introduce the terminologies first and then we start talking about the lemmas. There is no proof because this is an axiom level math stuff. 

#### **Def | Partial Ordering**
> A partial ordering on a set $M$, denote by $\preceq$, is a relation between two elements $a, b\in M$ satisfying: 
> 1. $a\preceq a$. Reflexivity. 
> 2. $a\preceq b, b\preceq a \implies a= b$. Anti-Symmetry. 
> 3. $a\preceq b, b\preceq c \implies a \preceq c$. Transitive. 
>
> If we introduce the condition that $\forall a, b \in M$ we have $a \preceq b \vee b \preceq a$, then it becomes a *total order*. 

**Observations**

1. A graph with self arcs on all the vertices that doesn't contain any cycle will form a partial ordering. 
2. The $\subseteq$ operator between sets is a type of partial odering. Let $S$ be any set then $M = 2^{S}$, the power set and $\subseteq$ forms a partial relations. The reader should varify that. 
3. If such a relation is represented by a matrices, where each entry $(i, j)\in M\times M$ represent whether 2 element satisfies the relation, then it's similar to a triangular matrix with a full diagonal, up to a permutation transform. 
4. In $\R^n$, $a\preceq b$ is a partial order relation between $a, b$ if, $a_i \le b_i$ for all $1\le i \le n$. 

**Remarks**

A total order is just a partial ordering where every element in the set are in the partial relations. 
For example, subsets of real numbers are always a total ordering. 

#### **Def | A Chain in a Partial Oreder**
> A chain $C\subseteq M$ is a subset of a partially order set such that it's totally ordered. 


#### **Def | Maximal Element, Upper Bounds**
> Let $M\subseteq X$ be a subset of a partial ordering: $X$, then: 
> 1. $u\in X$ is a upper bound element of $M$ if for all $a \in M$, $u \succeq a$
> 2. $m\in M$ is a maximal element of $M$ when $a\in M$ has $a\succeq u$ implies $a = u$. 

**Observations**

Maximal element $m$ comes from the subset of the partially ordered set $X$, and the upper bound element for the $M$ may not come from the chain. 

---
### **Illustrative Example**

We illustrate the above definitions with some illustrative examples. 

#### **Examples of Partial/total order relations**

1. The set $(\mathbb R, <)$ dosen't form a partial order because $a < a$ is false. 
The other 2 conditions are trivially true. 
2. $(\mathbb R, =)$ is a partial order, but it's not a total order. 
3. $(\mathbb R, \le)$ is a partial order and a total order. 
4. Let $W$ be any set, then define $S = 2^W$, then $(S, \subseteq)$ forms a partial order. 
And only when $|S| \le 1$, this relation is a total order. 

#### **Example of a Chain**

Well suppose that we have the power set $\{\emptyset, \{1\}, \{2\}, \{1, 2\}\}$, generated from the set $\{1, 2\}$ and with the relation $\subseteq$ it forms a partial order. 
Then a chain could be the sequence of sets 

$$
\empty \subseteq \{1\} \subseteq \{1, 2\}, 
$$

and removing $\{1\}$ freom the above chain forms another chain. 
This chain has an upper bound and the upper bound is $\{1, 2\}$, the upper bound exists in the power set and in this case, it also a member of the chain. 



---
### **Axiom | Zorn's Lemma**
> A partially ordered set containing upper bounds on every chain, necessarily contains at least one maximal element. 

**Fact**
This is technically, an axiom. And it's equivalent to the axiom of choice. 

