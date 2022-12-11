No prerequisite. 

---
### **Intro**

Wiki for a Group [here](https://en.wikipedia.org/wiki/Group_(mathematics)). A group is a set $G$ associated with a binary operator $\leftarrow$. Suppose any 2 elements $a, b,c \in G$, then it has to satisfy that axioms: 

1. Associative $(a\leftarrow b) \leftarrow c = a \leftarrow (b\leftarrow c)$. 
2. There exists an element $e\in G$ such that $e \leftarrow a = a \leftarrow e = a$. 
3. There exists inverse element for $a^{-1}\in G$ such that $a\leftarrow a^{-1} = a^{-1}\leftarrow a = e$. 

**The cancelation property**: 
$$
\begin{aligned}
    \forall a, b, c & \in G: a\leftarrow  b = a\leftarrow c
    \\
    \implies &
    \exists a^{-1}: 
    a^{-1} \leftarrow a \leftarrow b = 
    a^{-1} \leftarrow a \leftarrow c
    \\
    e \leftarrow b &= e \leftarrow c
    \\
    b &= c.
\end{aligned}
$$

The order can be swapped and one can prove the right cancelation property where $b\leftarrow a = c\leftarrow a \implies b = c$ as well. 

**Identity is unique**: 

As a consequence, we know that for each element $a\in G$, the inverse exists for the element $a$ is unique, and the identity elemet is also, unique. Let $\bar e, e$ be 2 identity element then choose any $a \in G$ we have $e\leftarrow a = \bar e = \leftarrow e\implies e = \bar e$ by the existence of the inverse of $a$. 

**Inverse is unique**: 

The inverse of each element is also unique. Let $\bar a^{-1}, a^{-1}$ both be the inverse of the element $a$, then $a\bar a^{-1}= a a^{-1}\implies a^{-1} = \bar a^{-1}$ by the cencellation property. 

**Why the arrow?**

Group operator $*, +, \cdot$ are symmetric, which gives the impression that order of the element doesn't matter, meaning that the elements can commute with each other. But this is rarely the case, hece we are using the operator $\leftarrow$ to emphasize the fact that group operator **is not commutative**. 

---
### **Examples**

Group has rigit structure but it still arises everywhere. $\mathbb R, \mathbb C, \mathbb Z$ equipped with additions, they are the field but also a group. With multiplications, the zero element will have to be removed. They are examples of Albelian Group. An Aleblian group allows commutative property for its element. 


---
### **The Symmetric Group**

A symmetric group should be kept into the brain whenever thinking about groups, especially when the group is finite. Symmetric group, denoted as $S_n$ is defined as all bijective functions that maps $[n]$ to $[n]$ $[n] = \{0, 1, 2, \cdots, n - 1\}$). Let $\circ$ be the operator, then $S$ definies a set of functions $f_i : S_n\mapsto S_n$. 
1. $id$ exists and it's the identity mapping on the set $[n]$. 
2. $f^{-1}$ exists for any $f\in S_n$ because it's a bijection. 
3. Functional composition is associtive (obvious!), because each function doesn't know whether the input comes directly into the function or it's being passed as an output of another function. 

Symmetric groups for countable and uncountable sets exist too. 