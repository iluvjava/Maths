[[Network Flow Standard Form]]

---
### **Intro**

The maxflow min-cut is a problem and its dual, and this particular problem is the network flow equivalent of a simplex feasibility search algorithm. Let's assume that we are maximizing the total amount of flow from the node $s$  to $t$, and the mass balance constraints on each of the vertex has to be zero, so that there is no loss of flow across the network. To start we consider a list of assumptions made without the loss of generalization, and it's made simplify the discussion for the algorithm later. 

1. The network is directed. If not consider [[Reduction to Network Flow]] to make it so. 
2. All the capacities are non-negative integers. This is required so that the algorithm terminates, and it produces flow with integral values. Without it the augmenting path algorithm will converge in solution and flow value , but it will never get to the irrational solution exact. 
3. The network flow doesn't contain a directed path from node s to node t, composed only of infinite capacity arcs. 
4. $(i, j)\in A \iff (j, i)\in A$, pairs of arcs of reverse direction exists in the graph. Zero capacity arcs are used to represent non-existing arcs on the graph. <mark style="background:#CACFD9A6;">(I think this is talking about the residual graph and has nothing to do about the original graph given that a zero flow from $s-t$ always being a feasible path for max flow problem.)</mark>
5. The network doesn't contain any parallel arcs across vertices. 

Take it for granted now that these set of assumptions has no loss of generality to the network flow problem. The LP formulation of the network flow problem is given as: 

$$
\begin{aligned}
    &\max_{v, x} v \text{ s.t: }
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

where $x$ is the vector representing all the flows on each of the arc, and the capacity is the vector $u$. The above problem is equivalent to the network flow standard form. By considering zero cost on all the arcs and $0$ mass balance constraints on all the $i\neq s, t$, and consier the mass balance constaint on vertex $b_s = 1$  and $b_t = -t$, then modifying the graph by joining an arc $(s, t)$ with infinite capacity and a cost of $-1$ will produce a min cost network flow problem whose solution is the maximum flow to this problem. 

**Application: Feasibility Search for Network Flow Problem**


Given a network flow problem with mass balance in standard form. Let sum of $b_i$ equals to zero. We look for a feasibility solution of the network using Maxflow Mincut. Modify the graph using the following transformation: 

- $b_i < 0$ then $i$ is a surplus node, else $b_i > 0$, whic will be a deficit node. $b_i = 0$ is a circulation nodes and we ignore it for now. 
- Then by creating a new node $s$ that connects to all $i$ such that it's a surplus node with $(s, i)$ with arc capacity $b_i$
- Create a node $t$ where all nodes $i$ with surplus has arc $(i, t)$ created with capacity $b_i$. 

Then a maximum flow on the new graph that balance all the nodes with deficit meaning that the s-t cut is $S = {s}$, then a feasible solution will be identified, after ignoring the modifications made to the original graph. 

**References:**

Chapter 6 of the networkflow theory and algorithm textbook. 

----
### **The Residual Graph**

The residual flow denoted by $r_{i, j}$ represents the additional amount of flows that can be sent on arc $(i, j)$. Let $a=(i, j)\in A$ denotes the arc in the graph, and let $a^{-1}:=(j, i)$ be the arc pointing in the inverse direction, then Given any feasible flow $x_{a}$ on the original graph, we define residual capacity: 
- $r_{a} = u_{a} - x_{a}$, remaining Capcity that can be sent over. 
- $r_{a^{-1}} =x_{a}$, amount of flow that we can reduce along the direction $a$. 

Observe that: 

- The capacity for arcs on the residual networks are all $\ge 0$, If, the flow $x_{i, j}$ is a feasible flow, else the flow is infeasible. 
---
### **$s-t$ Cut**

**Definition: A s-t Cut**
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

**Claim: Weak Duality**
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


----
### **Dual LP and Its Interpretations**

#UNFINISHED 



---
### **Ford Fulkerson Algorithm**



