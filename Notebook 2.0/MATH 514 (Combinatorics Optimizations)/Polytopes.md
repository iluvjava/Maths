[[Convex Sets]]
[[Cone]]


---- 
### **Intro**

Finite many intersections of Halfspaces has the chancing of producing a polyhedron. The intersection of half spaces can be simply expressed as a linear inequality; as a result one can define the *polyhedra* in following way: 

$$
\begin{aligned}
    P := \{x| Ax \le b\}
\end{aligned}
$$

Where, $\le$ is an elementwise inequality. A closed polyhedra is referred to as a *polytope*. 



--- 
### **Vertices**

> Let $P$ be a polytope, then a point $z\in P$ is called a vertex when: there dosen't exist any $x, y\in P\setminus\{z\}, \lambda \in (0, 1): z = \lambda x + (1 - \lambda)y$. Graphically, a vertex is something on the convex set where it's impossible to wiggle it alone a line such that it stills remains inside of the convex set. 

---
### **Vertex Submatrix Rank Theorem**

> Let $P$ be a polydope. If $z\in P$ is a vertex and we assume that $A\in \mathbb R^{m\times n}$, then let $\mathcal I$ be the index sets for the tight constraints, $\mathcal I =\{i: a_i^Tx_i = b_i\}$, then the submatrix $A_{\mathcal I, :}$ has a rank equals to $n$. 





