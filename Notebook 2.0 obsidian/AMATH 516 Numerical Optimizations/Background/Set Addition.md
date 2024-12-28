[[Topological Basics for Optimizations]]


---
### **Intro**
Set addition is not union. 


### **Addition**

Choose subset $A, B \subset \mathbf{E}$ of the Euclidean space, then consider real number $\lambda \in \mathbb{R}$ then we have: 

$$
\begin{aligned}
    & \lambda A := \left\lbrace
        \lambda a: a \in A
    \right\rbrace
	\\
    & 
    A + B = \left\lbrace
        a + b: a\in A, b \in B 
    \right\rbrace
\end{aligned}
$$

Where the first is scaling the subspace by a real number $\lambda$ and the second is the Minkowski Addition on sets. 
Sometimes $A + A$ causes confusion, because $A + A$ means $x + y$ with $x, y \in A$, and it's not $2A$, which would means $x = y$. 
Hence, $A + A\subseteq 2A$. When the same set is used to encode memebership of elements, assume that they are different elements from the same set doing additions. 

