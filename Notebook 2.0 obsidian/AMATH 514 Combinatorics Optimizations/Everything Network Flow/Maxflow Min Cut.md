[[Network Flow Standard Form]]

---
### **Intro**

The maxflow min-cut is a problem and its dual, and this particular problem is the network flow equivalent of a simplex feasibility search algorithm. Let's assume that we are maximizing the total amount of flow from the node $s$  to $t$, and the mass balance constraints on each of the vertex has to be zero, so that there is no loss of flow across the network. To start we consider a list of assumptions made without the loss of generalization, and it's made simplify the discussion for the algorithm later. 

1. The network is directed. If not consider [[Reduction to Network Flow]] to make it so. 
2. All the capacities are non-negative integers. This is required so that the algorithm terminates, and it produces flow with integral values. Without it the augmenting path algorithm will converge in solution and flow value , but it will never get to the irrational solution exact. 
3. The network flow doesn't contain a directed path from node s to node t, composed only of infinite capacity arcs. 
4. $(i, j)\in A \iff (j, i)\in A$, pairs of arcs of reverse direction exists in the graph. Zero capacity arcs are used to represent non-existing arcs on the graph. <mark style="background: #CACFD9A6;">(I think this is talking about the residual graph and has nothing to do about the original graph given that a zero flow from $s-t$ always being a feasible path for max flow problem.)</mark>
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

Assuming that we were given a network flow problem, with deficit nodes $b_i < 0$ and surplus node $b_i > 0$, then by creating a new node $s$ that connects to all nodes with surplus using infinite capacity arcs and a node $t$ where all nodes with surplus gets connected with infinite capacity arcs too, then a maximum flow on the new graph that balance all the nodes with deficit and surplus will produce a feasible flow for the min cost network flow problem. We skip the demonstration and proof of equivalency. This is left as a task to the readers. 

----
### **The Residual Graph**

The residual flow denoted by $r_{i, j}$ represents the additional amount of flows that can be sent on arc $(i, j)$. Given any feasible flow $x_{i,j}$ on the original graph, $r_{i, j} = u_{i, j} - x_{i, j}$, representing the additional amount of flow that can be sent along the arc, and $r_{j, i} = x_{i, j}$, representing the amount of flow that is already sent. The value $r{i, j}$ is the flow capacities for all the arcs on the residual graph. Observe that: 
- The capacity for arcs on the residual networks are all $\ge 0$. 
- $r_{i, j} = u_{i, j} - x'_{i, j} + x'_{j, i}$, where $x'$  is a feasible flow on the residual graph. 

Flow on the residual graph represent the amount of change to the feasible flow in the original graph. Flows in the residual that goes along the arc on the original increment the feasible flow and flows that goes against the arc in the original will decrease the amount of flow in the original. 

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

$$
\begin{aligned}
    v = \underbrace{\left(
        \sum_{(i, j)\in (S, S^C)}^{}
        x_{i, j}
    \right)}_{\text{S flow out}} - 
    \underbrace{\left(
        \sum_{(i, j) \in (S^C, S)}^{}
        x_{i, j}
    \right)}_{\text{S flow in}} \le u(S), 
\end{aligned}\tag{1}
$$

for all set $S$ such that $s\in S$ and $t\not\in S$. Immediately observe that the total mount of flow that can be sent from $s$ to $t$ is less than or equal to the capacity of the cut: $u(S)$, for all $s \in S \subseteq N$, $t\not\in S$. To prove, take the the set of constraints from the LP formulation for all the $i\in S$ and then we sum it up, giving us the expression: 

$$
\begin{aligned}
    v = \sum_{i\in S}^{}\left(
        \sum_{(i, j)\in A}^{}x_{i, j}
        - 
        \sum_{(j, i)\in A}^{}x_{j, i}
    \right), 
\end{aligned}\tag{2}
$$

where the single $v$ comes from $i = s$, and for all the other $i\in S$, the RHS of the mass balance constraint is zero, contributing zero to the LHS of the above expression. Notice that if $(k, l) \in A$ with $k, l \in S$, then $x_{k, l}, x_{l, k}$ will appear in the flow out of vertex $k$ and flow in of vertex $l$, giving us zero, therefore, the only sum remains are the arcs that crosses the set $S$, proving (1). The maximum flow out of $S$ is less than $u(S)$ is because the negative term is at best zero, and the positive term is at best $u_{i, j}$, and hence $u(S)$ is an upper bound for the flow $v$. 


----
### **Dual LP and Its Interpretations**

#UNFINISHED 
