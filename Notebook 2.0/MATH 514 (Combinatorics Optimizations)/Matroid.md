### Intro

**Definition**

> Let $M=(X, \mathcal B)$, be a matroid. Then $X$ is a set of elements, and $\mathcal B$ is a collection of subssets of $X$. Often refers to as the basis. Matroid satisfies: 
> $$
> \begin{aligned}
>     & X \neq \emptyset
>     \\
>     & 
>     \forall A, B\in \mathcal B: 
>     \forall a \in A\setminus B \implies \exists b \in B\setminus A: B\cup \{a\}\setminus \{b\} \notin \mathcal B
> \end{aligned}
> $$

The conclusion part of the second conditions indicate what often refers to as the exchange lemma. It's saying that it's possible to exchange element that are in this but not the other while keeping its property of still being a basis. 

**Terminologies**:

* Rank: The size of basis is the *rank*, all basis has the same rank and this is somewhat immediate from the definition of a matroid. 
* Basis: $\mathcal B$, the maximal attainable independent sets. 
* Independent: A subspace $S$ is independent if $\exists B\in \mathcal B$ such that $S\subseteq B$. 

A basis can be interpreted as a maximal independent set too. Reader please observe that the matroid is literally describing sets of vectors in a space, their axiomatical structure is similar. 

---
### **Put it Under Context**

There are 2 mathematical entities that experience the behaviors of matroid. Sets of basis vectors and sets of Spanning Tree of a graph. 

**Spanning Tree of a graph**
* $X = E$, $X$ is the set of all edges in the graph. 
* $\mathcal B$: Sets of all possible spanning tree on the graph. 

**Basis of a set of Vectors**
* $X = \{v_i\}_{i = 1}^n$, $n$ vectors in $\mathbb R^d$
* $\mathcal B$ is all possible basis that spans $\mathbb R^d$ from the set of vectors of $X$. 

---
### **Equal Cardinarlity of the Basis Sets**

Take notice that the second conditions of the Matroid can be written as:$\forall A\neq B \in \mathcal B: A \leftrightarrow \mathcal B$. For every every basis that is not equaled to each other, there is a way of exchanging the elements between then. The exchange lemma stated that $a \in A\setminus B$ implies that $\exists b\in B \setminus A$, such that $B \cup \{a\} = \mathcal B$. Which means that we can always find a basis that allows an exchange of elements from $B$ to the set $A$. During this process, the cardinality of the basis is kept, therefore, all basis must have the same cardinality. 

