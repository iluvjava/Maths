[[Group Basics]], 
[[Factored Group, Cosets, Equivalence Relations]]. 

---
### **Intro**

Instead of diving into the definition, we consider 2 groups that can be classified as a cyclic group. We denote $\mathbb Z_n^+$ to be the group of integers under additions modulo $n$. Let's consider the case where $n = 5$, and we represent the group using it's operation table: 

|$+$| 0 | 1 | 2 | 3 | 4 |
|---|---|---|---|---|---|
| 0 | 0 | 1 | 2 | 3 | 4 |
| 1 | 1 | 2 | 3 | 4 | 0 |
| 2 | 2 | 3 | 4 | 0 | 1 |
| 3 | 3 | 4 | 0 | 1 | 2 |  
| 4 | 4 | 0 | 1 | 2 | 3 | 

By the symmetric properties we can see that the operator certainly commutes. At the same time observe that each row is just the previous row with the first element popped out and inserted to the back. This pattern is general to all cyclic group. 


**Definition: cyclic group** 

> The group $G$ is cyclic if there exists element $a\in G$ such that $\{a^n | n\in \mathbb Z\} = G$ . We denote the set $\langle a\rangle := \{a^n | n\in \mathbb Z\}$ and in this case, $a$ is called the generator of the set. 

**References**

Chapter 3 of the brown textbook \<Abstract Algebra\>. 