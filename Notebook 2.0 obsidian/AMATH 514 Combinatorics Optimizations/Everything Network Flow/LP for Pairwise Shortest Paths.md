[[Network Flow Standard Form]]

---
### **Intro**
**Shortest Paths Assumptions:** 

We assume that:

- The cost of the functions can all be integers.
- The graph is directed.
- The graph is connected.
- There is no directed cycle with a costs that is negative.
- Then, we will be able to find the shorts path between 2 vertices with algorithms that are not too complicated.


**Shortest Ancestor Tree**: 

Given a graph $G = (A, N)$, with arc costs, let the source node be $s\in N$, we consider the find the shortest path from every vertices that is not source node to every other vertices in the graph. The following LP problem directly formulated it as a network flow LP problem in standard form: 

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

**Shortest Point to Point**

Suppose that the source vertex and the destination vertex are $1, n$ th vertex on the graph, then we want to sent a unit flow from $v_1$ to $v_n$ such flow costs the least. Then the formulation of the problem would be: 

$$
\begin{aligned}
    & \min_{x\ge \mathbf 0}\langle x, c\rangle \text{ s.t: }
    \left(
        \sum_{(i, j)\in A}^{}x_{i, j}
    \right) - \left(\sum_{(j, i) \in A}^{}
        x_{j, i}
    \right) = 
    \begin{cases}
        1 & \text{for } i = 1
        \\
        0 & \text{for } i\not \in \{1, n\}
        \\
        - 1 & \text{for } i = n
    \end{cases}
\end{aligned}
$$


---
### **Dual and Matrix Form**

Read [[../../CSE 000 Basics Algorithms/Characterizations Pairwise of Shortest Paths]] first. We then show that the optimality conditions for the shortest distance is exactly matching the optimal reduced costs via the dual of the Network Standard form applied to the above LP formulations. Without lost of generality assume the graph $G=(V, A)$ is directed such that it satisfies the assumptions listed at the start, let $1, n$ to be the source and destination nodes, then we consider its linear programming form. 
