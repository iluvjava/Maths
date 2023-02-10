[[Network Flow Standard Form]]

---
### **Intro**

Given a graph $G = (A, N)$, with arc costs, let the source node be $s\in N$, we consider the find the shortest path from every vertices that is not the source node to the source node. The following LP problem directly formulated it as a network flow problem: 

$$
\begin{aligned}
    & \min_{x}\langle x, c\rangle \text{ s.t: }
    \\
    & 
    \left(
        \sum_{(i, j)\in A}^{}x_{i, j}
    \right) - \left(\sum_{(j, i) \in A}^{}
        x_{j, i}
    \right) = 
    \begin{cases}
        n - 1 & \text{for } i = s
        \\
        - 1 & \text{for } i \in N \setminus \{s\}
    \end{cases}
    \\
    & x \ge \mathbf 0. 
\end{aligned}
$$

**Observations**

- There is no upper bound for the amount of flows. 
- If there is a negative cycle (formed by the costs on a directed cycle being arcs with all negative capacity), then this lp programming problem is unbounded with minimization objective. Because a negative cycle improves the minimum objective and it exists in the null space of the constraint adjacency matrix, hence, it gets ignored by the equality constraints and non-negativity constraints. 

