### **Intro**

We assume that: 
1. The cost of the functions can all be integers. 
2. The graph is directed.
3. The graph is connected.
4. There is no directed cycle with a costs that is negative. 

Then, we will be able to find the shorts path between 2 vertices with algorithms that are not too complicated. 

---
### **Subpaths of Shortest Paths**

choose some node $u, v \in N$ such that $u\neq v$ and there exist at least $u-v$ path on the graph. Then we consider the following: 

**Theorem: Subpath is Optimal**

> Let $\hat P(u, v)$ denote a list of arcs/vertices that is of the shortest cost path going from $u$ to $v$, then the subpath $P(u, k), P(k, v)$ for some $k \in \hat P(u, v)$ satisfies the property that, $P(u, k), P(k, v)$ are also paths of shortest costs that links between. 

**Proof**

Firstly, let $\hat P(s, t)$ be a shortest path that consists of $k\in P(s, t)$ with $P(s, k)\cup P(k, t) = \hat P(s,t)$. Suppose for contradiction that the path $P(s, k)$ is not the shortest, hence there exists $P'(s, k)$ with lower costs. Consider a walk in the form of $P'(s, k) + P(k, t)$ ($+$ is concatenation), this is a walk because $P'(s, k)$ and $P(k, t)$ are both paths, and they can crosses with each other. Then, the walk $P'(s, k) + P(k, t)$ has 2 cases: 
1. It contains cycles, then those cycles cannot have negative cost, hence removing the cycles on the walk reduces/unchange the total costs of the walk, but this makes $P'(s, k) + P(k, t)$ a path, contradicting the fact that $\hat P(s, t)$ is a path of the shortest length. 
2. It doesn't contain a cycle, then it's a shortest path that has strictly fewer cost than $\hat P(s, t)$, creating a contradiction. 

**Remarks**: 

The converse might not be true, in general the distance in graph satisfying properties in the introduction has $d(i, j) \le d(i, k) + d(k, j)$, the triangular inequality for a metric space. But, we would have $d(i, j) = \min_{k\in N}\{d(i, k), d(k, j)\}$ to be true, because there always exists some $k\in P(i, j)$, and $k = i\vee k = j$ is also accepted here. 

**Colollary: Path Optimality Conditions**

> Let $d(i)$ denotes the cost of some $s-i$ path then $d(i)$ is the least cost directed path function from $s$ to $j$ if and only if $d(j) \le d(i) + c_{i, j}\;\forall (i, j)\in A$. 

**Proof**

The $\implies$ direction of the proof is a direct application of the previous subpath optial theorem. 

Without lost of generality, chooes any $i, j \in N$, let it be the case that $i = n - 1, j = n$ where, so that the result is general up to a permutation of all the labels of the vertices. Consider: 
$$
\begin{aligned}
    d(v_n) &\le d(v_{n - 1}) + c_{v_{n - 1}, v_n} \quad \forall v_{n - 1}, v_{n} \in N, v_n \neq v_{n - 1}
    \\
    d(v_{n - 1}) &\le d(v_{n - 2}) + c_{v_{n - 2}, v_{n - 1}}
    \quad 
    \forall v_{n - 2} \in N, v_{n - 2} \not \in \{v_n, v_{n -1}\}
    \\
    (&\cdots)
    \\
    d(v_{2}) &\le d(v_{1}) + c_{1, 2} \quad \forall v_1 \in N, v_1 \not \in \{v_i\}_{i}^{n - 1}, v_1 \text{ is unique},
\end{aligned}
$$

using all these relations, and the fact that $d(j)$ is the cost of some $s-j$ path, then: 

$$
\begin{aligned}
    d(v_n) &\le d(v_{n - 1}) + c_{v_{n - 1}, v_n}
    \\
    \implies 
    d(v_n) &\le (d(v_{n - 2}) + c_{v_{n - 2}, v_{n - 1}}) + c_{v_{n - 1, v_n}}
    \\
    (&\cdots)
    \\
    \implies
    d(v_n) &\le \sum_{k = 1}^{n - 1}c_{v_{k}, v_{k + 1}} \; \forall \{v_{\sigma(i)}\}_{i = 1}^n, \sigma \text{ is any permutation of} [n]
\end{aligned}
$$

Hence, if $d(v_n)$ is the least cost path, then it has length less than all other possible least cost path, hence it has to be the cost of the least cost path. 

**Note**:

If $(v_{i}, v_{i + 1}) \not \in A$, then set $c_{v_{i}, v_{i + 1}} = \infty$ for all such arcs, then the argument follows smoothly. 


---
### **Distance Functions from Source**

> Fixed some vertex $s$ in a graph, $d(t)$ be  shortest path cost going from $s$ to $t$ if and only if $\forall i, j \in V: d(i) \le d(i) + d(j)$

This is a direct application of the previous theorem. 


**References**: Chapter 4 of the book: Network Flows, theory, Algorithms and Applications. Shortest subpath is property 4.2. 

---
### **In Relations to Linear Programming**

The shortest path problem is related to the linear programming problem. The above conditions just an application of strong duality. Visit [[../AMATH 514 Combinatorics Optimizations/Everything Network Flow/LP for Source Tree Shortest Paths]] for more information. 
