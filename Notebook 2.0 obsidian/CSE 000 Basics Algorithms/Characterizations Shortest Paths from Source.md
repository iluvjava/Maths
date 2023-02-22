### **Intro**

We assume that: 
1. The cost of the functions can all be integers. 
2. The graph is directed.
3. The graph is connected.
4. There is no directed cycle with a costs that is negative. 

Then, we will be able to find the shorts path between 2 vertices with algorithms that are not too complicated. 

---
### **Shortest Subpath**

**Theorem: Shortest Subpath**

> Let $\hat P(u, v)$ denote a list of arcs/vertices that is of the shortest cost path going from $u$ to $v$, then the subpath $P(u, k), P(k, v)$ for some $k \in \hat P(u, v)$ satisfies the property that, $P(u, k), P(k, v)$ are also paths of shortest costs that links between. 

**Proof**

Firstly, let $\hat P(s, t)$ be a shortest path that consists of $k\in P(s, t)$ with $P(s, k)\cup P(k, t) = \hat P(s,t)$. Suppose for contradiction that the path $P(s, k)$ is not the shortest, hence there exists $P'(s, k)$ with lower costs. Conider a walk in the form of $P'(s, k) + P(k, t)$ ($+$ is just concatenations), this is a walk because $P'(s, k)$ and $P(k, t)$ are both paths, and they can crosses with each other. Then, the walk $P'(s, k) + P(k, t)$ has 2 cases: 
1. It contains a cycle, then that cycle cannot have negative cost, hence removing the cycles on the walk reduces the costs further, and making it a path, contradicting the fact that $\hat P(s, t)$ is a path of the shortest length. 
2. It doesn't contain a cycle, then it's a shortest path that is shorter than $\hat P(s, t)$, creating a contradiction. 


---
### **Distance Functions from Source**

> Fixed some vertex $s$ in a graph, $d(t)$ be  shortest path cost going from $s$ to $t$ if and only if $\forall i, j \in V: d(i) \le d(i) + d(j)$

This is a direct application of the previous theorem. 


**References**: Chapter 4 of the book: Network Flows, theory, Algorithms and Applications. Shortest subpath is property 4.2. 

---
### **In Relations to Linear Programming**

The shortest path problem is related to the linear programming problem. The above conditions just an application of strong duality. Visit [[../AMATH 514 Combinatorics Optimizations/Everything Network Flow/LP for Source Tree Shortest Paths]] for more information. 
