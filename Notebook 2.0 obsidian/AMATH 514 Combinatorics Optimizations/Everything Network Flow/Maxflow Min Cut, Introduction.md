[[Minimum Cost Network Flow Standard Form]]

---
### **Intro**

The maxflow min-cut is a problem and its dual, and this particular problem is the network flow equivalent of a simplex feasibility search algorithm. Let's assume that we are maximizing the total amount of flow from the node $s$  to $t$, and the mass balance constraints on each of the vertex has to be zero, so that there is no loss of flow across the network. To start we consider a list of assumptions made without the loss of generalization, and it's made simplify the discussion for the algorithm later. 

**Maximum Flow Standard Assumptions:**

1. The network is directed. If not consider [[Reduction to Network Flow]] to make it so. 
2. All the capacities are non-negative integers. This is required so that the algorithm terminates, and it produces flow with integral values. Without it the augmenting path algorithm will converge in solution and flow value , but it will never get to the irrational solution exact. 
3. The network flow doesn't contain a directed path from node s to node t, composed only of infinite capacity arcs. 
4. $(i, j)\in A \iff (j, i)\in A$, pairs of arcs of reverse direction exists in the graph. Zero capacity arcs are used to represent non-existing arcs on the graph. 
5. The network doesn't contain any parallel arcs of the same direction across any pair of nodes. 

Take it for granted now that these set of assumptions has no loss of generality to the network flow problem. 

#### **The LP Formulations**: 

The LP of the network flow problem is given as: 

$$
\begin{aligned}
    &\max_{v \text{ free}, x} v \text{ s.t: }
    \\
    &
    \left(
        \sum_{(i, j)\in A}^{}x_{i, j}
    \right) - 
    \left(
        \sum_{(j, i)\in A}^{}
        x_{j, i}
    \right)
    = \begin{cases}
        v & i = s, 
        \\
        0 & i \in N\setminus\{s, t\}
        \\
        -v  & i = t
    \end{cases}\quad \forall i \in N
    \\
    & \mathbf 0 \le x \le u, 
\end{aligned}
$$

where $x$ is the vector, when indexed by arc: $x_{i, j}$ represents the amount of flow on the arc $(i, j)$. $u$ is the capacity vector. 

#### **Reduction to Minimum cost Network Flow**: 

- Make zero cost on all the arcs and $0$ mass balance constraints on all the nodes $i\neq s, t$; 
- Make the mass balance constraint on vertex $s, t$ with $b_s = 1$ and $b_t = -t$,
- Join an arc $(s, t)$ with infinite capacity (or something that is large enough for sure) and a cost of $-1$, 

Then a solution to the minimum costs flow in the transformed graph is equivalent to the solution for the maximum flow problem. 

#### **Application | Feasibility Search for Min Cost Flow Problem**

Given a network flow problem with mass balance in standard form. Let the sum of $b_i$ equals to zero (Else it's already infeasible). We look for a feasible solution of the network modeling it as a Maxflow Mincut. Modify the graph using the following transformation: 

- $b_i < 0$ then $i$ is a surplus node, else $b_i > 0$, which will be a deficit node. $b_i = 0$ is a circulation nodes and we ignore it for now. 
- Then by creating a new node $s$ that connects to all $i$ such that it's a deficit node, i.e $b_i > 0$, with $(s, i)$ with arc capacity $b_i$
- Create a node $t$ where all nodes $i$ with surplus has arc $(i, t)$ created with capacity $b_i < 0$. 
- Ignoring all the capacities on the node, we now have a maximum flow problem to solve. 
	- If, it's possible to send flow from $s$ to $t$ such that the flow amount equals to the sum of all the surplus/deficit, then, all flows on the arcs of the original graph now forms a feasible flow. (Note that, this flow is definitely a maximum flow when it exists). 
	- Else, there is no feasible solution to the original problem. 

Then a maximum flow on the new graph that balance all the nodes with deficit meaning that the s-t cut is $S = {s}$, then a feasible solution will be identified, after ignoring the modifications made to the original graph, assuming that the mass balance constraints for all vertices sums up to one. 

**References:**

Chapter 6 of the network flow theory and algorithm textbook by Ahuja. 

----
### **The Residual Graph Without Lower bound**

The residual flow denoted by $r_{i, j}$ represents the additional amount of flows that can be sent on arc $(i, j)$. Let $a=(i, j)\in A$ denotes the arc in the graph, and let $a^{-1}:=(j, i)$ be the arc pointing in the inverse direction, then Given any feasible flow $x_{a}$ on the original graph, we define residual capacity: 
- $r_{a} = u_{a} - x_{a}$, remaining capacity that can be sent over. 
- $r_{a^{-1}} =x_{a}$, amount of flow that we can reduce along the direction $a$. 

Observe that: 

- The capacity for arcs on the residual networks are all $\ge 0$, If, the flow $x_{i, j}$ is a feasible flow, else the flow is infeasible. 
- The zero flow will always be feasible according to our assumptions on the graph, and it will allow us to get the residual graph with zero flow on it. 

**Definition | Augmenting Path**
> An augmenting path is a path s-t path $P$ on the residual graph $G(x)$ such that $x$ is feasible and the minimum of all residual capacities $r_{i, j} \in P$ are $> 0$. 

---
### **$s-t$ Cut**

**Definition-1 | A s-t Cut**
> Let $G = (A, N)$ be a directed graph and $s\neq t$. Let $S \subseteq N$ with $s\in S$ and $t\not S$, then the cut produce by the set $S$ is defined as: 
> $$
> \begin{aligned}
>   (S, S^C) &= \{(u, v)\in A| u\in S \wedge v \not\in S \}, 
>   \\
>   [S, S^C] &= (S, S^C)\cup (S^C, S), 
> \end{aligned}
> $$
> where the first notation is the set of arcs that go across from $S$ to $S^C$, and the second one denotes all arcs go both ways across $S, S^C$. 

We also denote the capacity of an $s-t$ cut using $u(S)$, and the residual capacity $r(S)$. The total amount of flow through the network is given by: 

**Claim-1: Weak Duality**
> The amount of the flow is upper bounded by the capacity of the s-t cut. 
> $$
> \begin{aligned}
>     v = \underbrace{\left(
>         \sum_{(i, j)\in (S, S^C)}^{}
>         x_{i, j}
>     \right)}_{\text{S flow out}} - 
>     \underbrace{\left(
>         \sum_{(i, j) \in (S^C, S)}^{}
>         x_{i, j}
>     \right)}_{\text{S flow in}} \le u(S), 
> \end{aligned}\tag{1}
> $$
> For all set $S$ such that $s\in S$ and $t\not\in S$. 

**Observations:** 

Intuitively, "S flow out" $\le u(S)$, for all $s \in S \subseteq N$, $t\not\in S$, and "S flow in" is greater than zero, hence, the inequality is true. 

**Proof**: 

To prove, take the the set of constraints from the LP formulation for all the $i\in S$ and then we sum it up (A linear combinations of the the rows of the constraint matrix), giving us the expression: 

$$
\begin{aligned}
    v &= \sum_{i\in S}^{}\left(
        \sum_{(i, j)\in A}^{}x_{i, j}
        - 
        \sum_{(k, i)\in A}^{}x_{k, i}
    \right)
    \\
    v &= \sum_{i\in S}^{}
    \left(
        \underbrace{
            \sum_{\substack{j\in S \\ (i, j)\in A}}^{}
            x_{i, j}
            - 
            \sum_{\substack{k\in S\\ (k, i)\in A }}^{}
            x_{i, j}
        }_{=0}
        + 
        \sum_{\substack{j\notin S\\ (i, j)\in A}}^{}
        x_{i, j}
        - 
        \sum_{\substack{k \notin S\\(k, i) \in A}}^{}
        x_{k, i}
    \right)
    \\
    v &= \sum_{i\in S}^{}
    \left(
        \sum_{(i, j)\in (S, S^C)}^{} x_{i, j}
        - 
        \sum_{(k, i)\in (S^C, S)}^{}
        x_{k, i}
    \right) 
    \\
    v &\le
    \sum_{i\in S}^{}
    \left(
        \sum_{(i, j)\in (S, S^C)}^{} u_{i, j}
        - 
        \underbrace{
            \sum_{(k, i)\in (S^C, S)}^{}
            x_{k, i}
        }_{\ge 0}
    \right) \le u(S), 
\end{aligned}\tag{2}
$$

and this completed the proof that, all the flow inside of $S$ equals to (Flow out of S) - (Flow in of S) less than Capacity of the s-t cut. 

**Corollary-1 | Strong Duality Conditions**

> A flow will be maximum flow if and only if there exists a cut such that the cut capacity equals to the total amount of $s-t$ flow. 

**Proof**: 

We just applied the strong duality for linear programming, using the above formulation of weak duality for the Network flow LP. See [[../Linear Programming Strong Duality via Farkas, Standard Forms]] for more information. Assuming that the integrality assumption holds for the problem. 


---
### **Derivations of Residual Capacity via LP**

The residual of the maxflow problem, can be viewed as a special case for the mincost flow problem where, all the arcs are having exactly zero costs for them. see [Residual Networks Transform](Residual%20Networks%20Transform.md) for more details. 



----
### **Dual LP and Its Interpretations**

Let $M$ be the incidence matrix of the graph, we assume that vertex $s, t$ are indexed with $1, 2$, let $n$ be the total number of nodes and $m$ be total number of arcs, then $M\in \mathbb R^{n\times m}$. The primal, dual of the problem can be stated in matrix form as ([Linear Programming Duality Cheat Sheet](../Linear%20Programming%20Duality%20Cheat%20Sheet.md)): 

$$
\begin{aligned}
    (P)\quad &
    \max_{\substack{x \ge \mathbf 0 \\ v \ge 0}} (v)
    \; \text{ s.t: } 
    \begin{bmatrix}
        M & \e_1 - \e_n
        \\
        I & \mathbf 0
    \end{bmatrix}
    \begin{bmatrix}
        x \\ v
    \end{bmatrix}
    \begin{Bmatrix}
        = \\ \le 
    \end{Bmatrix}
    \begin{bmatrix}
        \mathbf 0 \\ u
    \end{bmatrix}
    \\
    (D) \quad & 
    \min_{\substack{y_1 \text{free} \\ y_2 \le \mathbf 0}}
    \langle y_2, u\rangle \; \text{s.t: }
    \begin{bmatrix}
        M^T & I 
        \\
        (\e_1 - \e_n)^T & \mathbf 0
    \end{bmatrix}
    \begin{bmatrix}
        y_2 \\ y_2
    \end{bmatrix}
    \ge 
    \begin{bmatrix}
        \mathbf 0 \\ 1 
    \end{bmatrix}
\end{aligned}
$$

we take a careful look at the constraints of the dual, and transform it so that it's more informative: 

$$
\begin{aligned}
    \min_{\substack{y_1 \text{free} \\ y_2 \le \mathbf 0}}
    \langle y_2, u\rangle \; \text{s.t: }
    \begin{cases}
        0 \ge (y_2)_{i, j} \ge (y_1)_{j} - (y_1)_{i} & \forall (i, j) \in A
        \\
        (y_1)_1 - (y_1)_n \ge 1 &
    \end{cases}
\end{aligned}
$$

**Observations**: 

Observe that the first set of constraints describes a strategies of placing the arcs $(i, j)$ such that $j$ has less potential than $i$, and the second constraints stated that the potential of $1$ is one greater than the potential of $n$. $y_1$, the potential label on the vertices are free to be what they want, but $y_2$ is has to be minimizes. If $u$ is $\mathbf 1$, then we are looking for a way to assign the potential such that the set of arcs where potential are cut off by one is as large as possible. This is maximizing the total number or arc disjoint paths (s-t paths where non of the arcs are shared). 

Using strong duality, we can attain the conditions that: 
- $(y_2)_{i, j} = 0$, then $x_{i, j} \ge 0$, 
- $(y_2)_{i, j} \neq 0$, the $x_{i, j} = 0$. 

#UNFINISHED 




---
### **Classical Algorithms for Maximum Flow**

Some of these algorithms I actually covered them. See [Advanced Maxflow Algorithms](Advanced%20Maxflow%20Algorithms.md) for more information. 

- Ford Fulkerson: 
  - Pseudo Polynomial, in $\mathcal O(mnC)$ where $C$ is the maximum capacity for one of the arcs. 
  - Very generic, the worse case complexity can be demonstrated just using a DFS routine. 
  - See [The Ford Folkerson Algorithm](The%20Ford%20Folkerson%20Algorithm.md) for more information. 
- Edmonds Karp Algorithm: 
  - It's just Ford Fulkerson but with BFS for Augmenting path identifications on the residual graph. 
  - The complexity is $\mathcal O(|V||E|^2)$. 
  - A dynamic version of the algorithm can be created by keeping the labels of the BFS level set. 
- [Dinic's Algorithm wiki](https://en.wikipedia.org/wiki/Dinic%27s_algorithm):  
  - It remembers all the labels from the first reverse BFS search from $t$ to $s$, and then robustly undo the BFS search whenever a saturated arc has been created by the augmenting path. 
  - Implementations difference may yield the Shortest Augment with Label Memorization instead. 
  - The complexity is $\mathcal O(|V|^2|E|)$. 
- Capacity Scaling Method: 
  - Delete all the arcs with residual less than a certain threshold and do a path search for an augmenting path. 
  - If such a path doesn't exist, cut our lower bounds for the flow in half. It looks for the minimum of the maximum flow that doesn't exceed all the arcs's capacity on the residual graphs. 
  - Each time when there is no more valid paths on the residual graph, it cut the capacity by a half and search again for an augmenting path, until the capacity is equal to one, then it terminates by the integrality assumption of the maxflow graph. 
- [Preflow Push Algorithm](https://en.wikipedia.org/wiki/Push%E2%80%93relabel_maximum_flow_algorithm)
	- Make multiple flows from s to t each time. 
