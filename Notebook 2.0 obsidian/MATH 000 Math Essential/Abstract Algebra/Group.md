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

The order can be swapped and one can prove the right cancelation property where $ba = ca \implies b = c$ as well. 

**Identity is unique**: 

As a consequence, we know that for each element $a\in G$, the inverse exists for the element $a$ is unique, and the identity elemet is also, unique. Let $\bar e, e$ be 2 identity element then choose any $a \in G$ we have $e\leftarrow a = \bar e = \leftarrow e\implies e = \bar e$ by the existence of the inverse of $a$. 

**Inverse is unique**: 

The inverse of each element is also unique. Let $\bar a^{-1}, a^{-1}$ both be the inverse of the element $a$, then $a\bar a^{-1}= a a^{-1}\implies a^{-1} = \bar a^{-1}$ by the cencellation property. 