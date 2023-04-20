wiki: [TSP](https://en.wikipedia.org/wiki/Travelling_salesman_problem)
[Graph Theory Terminology](../AMATH%20514%20Combinatorics%20Optimizations/Graph%20Theory%20Terminology.md)


---
### **Intro**

A tour goes through all the vertices once on the graph and ends up on the vertex that it started with, without repeating any other vertices on the graph. The traveling salesman consider a weight assignment function $f(x): E\mapsto \mathbb R$, and search for a tour $T$ such that its weight $f(T)$ is the smallest. The problem is np hard and we consider reducing it to an integer programming and analyze its properties and behaviors. 

We assume knowledge of linear programming and basic graph theory terminology. This is made for the presentation of the class. 


---
### **MZT Reductions 1960**

The reduction was introduced back in 1960 and here is the paper [Integer Programming of Traveling Salesman Problem](https://dl.acm.org/doi/pdf/10.1145/321043.321046). We will introduce the reduction and rationalize why it's correct. This reduction is a polynomial sized IP , which probably means it's not total unimodular if NP hard and P are not equivalent. We consider decision variable $x_{i, j}\; \forall (i, j)\in [n]\times [n]$ where $|V| = n$, if $(i, j)\not\in E$ we let $f(x_{i, j}) = \infty$. Next, a naive approach to formulate the problem considers the following system of constraints to assert the solution is indeed a tour: 

$$
\begin{aligned}
    \min\sum_{i = 1}^{n} & \sum_{j = 1}^{n} f(e_{i, j}) x_{i, j} \; \text{s.t:} 
    \\
    \sum_{j \neq i, j = 1}^{n}
        x_{i, j} &= 1 \quad \forall i\in [n] \quad & [1]
    \\
    \sum_{i \neq j, i = 1}^{n}
        x_{i, j} &= 1 \quad \forall j\in [n] \quad & [2]
    \\
    x_{i, j} &\in \{0, 1\} \quad\forall (i, j)\in [n]\times [n], 
\end{aligned}
$$

this approach asserts that for each vertex $i$, there must exist exactly 2 edges $e_{i, j}, e_{j', i}\in T$ goes into and out of the vertex, however it's possible to have a solution to be a several disconnected tour that goes over the vertices, and that would be the optimal solution for the problem. To assert a full tour to be our solution, MZT considers one additional variable $u_i\in \mathbb Z, i\in \{2, \cdots, n\}$ with $2 \le u_i \le n$, the key is to have $x_{i, j} \implies u_j \ge u_i + 1$. To achieve that, we consider the following 2 potential constraints

$$
\begin{aligned}
    & u_i \ge u_j + 1 \quad \forall (i, j)\in \{2, \cdots, n\}^2& [3.1] 
    \\
    & u_j + (n - 2) \ge u_i + (n - 1)x_{i, j} \quad \forall (i, j)\in \{2, \cdots, n\}^2,  & [3.2]
\end{aligned}
$$
in the case of \[3.1\] condition $x_{i, j} = 1\implies u_j \ge u_i + 1$ is asserted, but it imposes extra constraint when $x_{i, j} = 0$, where $u_j \ge u_i$, which is could be impossible if that graph not happens to be a DAG.[^1] Conditions \[3.2\] however, doesn't impose any constraint when $x_{i, j} = 0$ because $u_j + (n - 2) \ge u_i$ is true for all $2\le u_i, u_j \le n$. Therefore \[3.2\] should be adopted over \[3.1\]. Next, we want to show that it indeed eliminates multiple disconnected tour on the graph. The only type of subgraphs that are not eliminated from using both \[1, 2\] are discrete tours. Observe that $u_1$  doesn't exist, let's consider one of the discrete tour that involves $v_1\in V$ satisfies \[3.2\] and WLOG, it involves the first $k$ vertices in $V$: 

$$
\begin{aligned}
    u_2 < u_3< \cdots < u_k, 
\end{aligned}
$$

however, the remaining $V\setminus [k]$ will has to be a tour as well, resulting in $v_k\rightarrow v_{k + 1}\rightarrow \cdots\rightarrow v_n$, which then asserts all $x_{k, k + 1}, x_{k + 1, k + 2}, \cdots x_{n - 1, n} =1$, hence arriving at a contradiction where: 

$$
\begin{aligned}
    u_k < u_{k + 1} < u_{k + 2} \cdots < u_{n} < u_k. 
\end{aligned}
$$

Therefore, multiple discrete tours that includes all the vertices violates \[3.2\]. 

**Remarks**

The algorithm is still applicable even we have directed graph. Hence it's not hard to see that for the specific case where the graph is an undirected graph, there might exists reduction that stronger than the above formulations. 

Even tho the discrete sub-tour solution doesn't count towards a tour, but it can be viewed as a LP relaxation to the IP, providing us with a lower bound and a solution that can be constrained to improve to be a tour. (Cook, Combinatorics Optimizations Theorem 7.2, the sub-tour bound. )


---
### **Dantzig Fulkerson Johnson Reductions 1954**
The DFJ formulation of the TSP problem is an exponentially sized IP problem. Its important contribution are the ideas of a lazy constraints and cutting plane methods. The formulation is exactly the same for constraints \[1, 2\] as listed in the MZT reduction. To eliminate discrete sub-tours, we consider any set $|Q| \ge 2$ and $Q\subseteq V$, then there must not be a sub-tour inside of $Q$, to asset it, we consider constraints \[3.3\] which is formulated as: 

$$
\begin{aligned}
    \sum_{\substack{i \in Q \\ j\in Q\setminus\{i\}}}
        x_{i, j} \le |Q|  - 1 \quad \forall Q \subseteq V, |Q| \ge 2 \quad [3.3]
\end{aligned}
$$
where the $\ge |Q| - 1$ only allows for several disjoint paths running across the set $Q$, or at maximum, a spanning path in the set $Q$. 

**Lazy Constraints with LP Sub-Problem**: 

When solving it, we consider solving the IP with only the constraints \[1, 2\], and then after solving the relax problem, we find any 2 $Q_1, Q_2 \subseteq V$ where it violates \[3.3\], then we add this condition to the problem and solve the IP again. We solve until the sub-tour constraints are no longer violated, in which case the above IP problem would be solved completely. However, this is a combination of Branch and Bound (used in solving the sub-problem which is IP) and lazy constraints, which is not very fast when the problem is huge. 

**Theorem: Dual and the One Tree Bound**

> From the dual of the DFJ formulation without \[3.3\], we get the one-tree bound. 

**Proofs**: 

We skip the proof here and we list the references. 

**References:** 

pg: 260 of William Cook's combinatorics optimizations textbook. 

**Methods of Cutting Planes and Column Generations**

We skip the column generation. One of the way to use cutting plane method is to utilize the minimum cut algorithm to identify subtours that are violating \[3.3\]. To do that, we consider the non-integral solution from just constraints \[1,2]\. It is easy to identify disconnected components when there are a lot of edges with zero value, but after adding more cuts to it, it's likely that most of the edges has $x_{i, j}\neq 0$ . In which case we have to check all pairs of the vertices and use max flow minimum cut to determine the set $S$ such that it's violating constraints \[3.3\] using with the non-integer solution. To do that we simply consider check the minimum cut set's flow value, if it's strictly less than 2, then it's violating the constraint \[3.3\] and requires a cut added to \[3.3\]. 
**References**: 257 page of Cook's book on Combinatorics Optimizations. 


**Remarks:** 
The reduction happens to be the core of one of the fastest TSP solver, the [concord TSP solver](https://en.wikipedia.org/wiki/Concorde_TSP_Solver). 

---
### **The one Tree Bound**

The one tree bound give the lower bound for the minimum cost tour of a graph. The crucial insight is the fact that, the all minimum spanning tree is a special type of spanning path on the graph. 

**Definition: One Tree Bound**

> Here we denote $\delta (v):= \{e: e = (v, u) \in E, u \neq v\}$ as the cut set for the fixed vertex $v$ and $c E \mapsto \mathbb R_+$ to be the cost functions on the edges for the graph then for some $v\in V$. Then the one tree bound given an $v\in G$ is defined as: 
> 
> $$
> \min\{c(e) + c(f), \text{ s.t: } \{f, e\} \subseteq \delta (v), f \neq e\} + c(\text{MST}(V\setminus v)).
> $$

The above bound is lower than all the tours in the graph. And one has the potential to improve the bound by choose $v\in V$ that maximizes the quantity so that the heurstic is as close as possible. And if there is no spanning tree, obviously there is no spanning paths, and the cost is infinity. 

**Proof**

Fix $v\in V$ and select any $T$ such that it's a tour in $G$. Suppose that there exists $e, f \in T$ such that $e\neq f; \{e, f\} \subseteq \delta (v)$, then $P:= T\setminus \{e, f\}$ is a spanning path. Since $P$ is a spanning tree on $G \setminus v$, we define $M^+$ to be the minimum spanning tree on $V\setminus v$, then $c(P)\ge c(M^+)$. Next, choose any distinct $e^+, f^+\in \delta(v)$ such that $c(f^+) + c(e^+)$ is minimized, we have $c(f) + c(e)\ge c(e^+) + c(f^+)$ since both comes from $\delta (v)$, and therefore we have: $c(f) + c(e) + c(P)\ge c(e^+) + c(f^+) + c(M^+)\implies c(T)\ge c(M^+) + c(\{e^+, f^+\})$, and because this is true for all spanning tours, this will be an lower bound for the optimal tour as well. If there is no spanning trees in the graph, then the lower bound is infinity, and there is no spanning paths.


---
### **Branch and Bound Frameworks**

The reduction is exponential sized unfortunately, and it also only give a lower bound for the objective.



[^1]: When all decision variables $x_{i, j} = 0$, the graph is also a DAG, the constraint can then be satisfied. And by asserting $x_{i, j}$, the constraints now become stronger, make it even more infeasible. 