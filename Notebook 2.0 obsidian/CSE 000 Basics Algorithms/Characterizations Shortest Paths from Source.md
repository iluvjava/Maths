### **Intro**

We assume that: 
1. The cost of the functions can all be integers. 
2. The graph is directed.
3. The graph is connected.
4. There is no directed cycle with a costs that is negative. 

Then, we will be able to find the shorts path between 2 vertices with algorithms that are not too complicated. 

---
### **Shortest Subpath**

choose some node $u, v \in N$ such that $u\neq v$ and there exist at least $u-v$ path on the graph. Then we consider the following: 

**Theorem: Subpath Optimal**

> Let $\hat P(u, v)$ denote a list of arcs/vertices that is of the shortest cost path going from $u$ to $v$, then the subpath $P(u, k), P(k, v)$ for some $k \in \hat P(u, v)$ satisfies the property that, $P(u, k), P(k, v)$ are also paths of shortest costs that links between. 

**Proof**

Firstly, let $\hat P(s, t)$ be a shortest path that consists of $k\in P(s, t)$ with $P(s, k)\cup P(k, t) = \hat P(s,t)$. Suppose for contradiction that the path $P(s, k)$ is not the shortest, hence there exists $P'(s, k)$ with lower costs. Consider a walk in the form of $P'(s, k) + P(k, t)$ ($+$ is concatenation), this is a walk because $P'(s, k)$ and $P(k, t)$ are both paths, and they can crosses with each other. Then, the walk $P'(s, k) + P(k, t)$ has 2 cases: 
1. It contains cycles, then those cycles cannot have negative cost, hence removing the cycles on the walk reduces/unchange the total costs of the walk, but this makes $P'(s, k) + P(k, t)$ a path, contradicting the fact that $\hat P(s, t)$ is a path of the shortest length. 
2. It doesn't contain a cycle, then it's a shortest path that has strictly fewer cost than $\hat P(s, t)$, creating a contradiction. 

**Remarks**: 

The converse might not be true, in general the distance in graph satisfying properties in the introduction has $d(i, j) \le d(i, k) + d(k, j)$, the triangular inequality for a metric space. But, we would have $d(i, j) = \min_{k\in N}\{d(i, k), d(k, j)\}$ to be true, because there always exists some $k\in P(i, j)$, and $k = i\vee k = j$ is also accepted here. 


---
### **Distance Functions from Source**

> Fixed some vertex $s$ in a graph, $d(t)$ be  shortest path cost going from $s$ to $t$ if and only if $\forall i, j \in V: d(i) \le d(i) + d(j)$

This is a direct application of the previous theorem. 


**References**: Chapter 4 of the book: Network Flows, theory, Algorithms and Applications. Shortest subpath is property 4.2. 

---
### **In Relations to Linear Programming**

The shortest path problem is related to the linear programming problem. The above conditions just an application of strong duality. Visit [[../AMATH 514 Combinatorics Optimizations/Everything Network Flow/LP for Source Tree Shortest Paths]] for more information. 
