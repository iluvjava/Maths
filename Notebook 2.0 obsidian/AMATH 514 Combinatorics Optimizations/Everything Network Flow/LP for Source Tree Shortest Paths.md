[[Min Cost Network Flow Standard Form]], 
[[../../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]]

---
### **Intro**

We solve the problem of looking for the shortest path going from one vertex on the graph to all other vertices on the graph. 

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

- There is no upper bound for the amount of flows on each of the edges. 
- If there is a negative cycle (formed by the costs on a directed cycle being arcs with all negative capacity), then this lp programming problem is unbounded with minimization objective. Because a negative cycle improves the minimum objective and it exists in the null space of the constraint adjacency matrix, hence, it gets ignored by the equality constraints and non-negativity constraints. 
- The solution is an out-tree with the minimum flow cost. The tree posses a root node where every out going edge has a flow equals to the number of vertices it goes to (Size of the subtree).

**Claim Without Much Proof**

> The solution to the above LP problem produces integral results for all costs parameters $c$. 

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

Read [[../../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]] first. We then show that the optimality conditions for the shortest distance is exactly matching the optimal reduced costs via the dual of the Network Standard form applied to the above LP formulations. Without lost of generality assume the graph $G=(V, A)$ is directed such that it satisfies the assumptions listed at the start, let $1, n$ to be the source and destination nodes, then we consider its dual linear programming form:  

$$
\begin{aligned}
    \max_{\substack{y_1 \text{free} \\y_2 \le \mathbf 0}}
    \left\lbrace
       (n - 1)(y_1)_1 + \left(\sum_{i = 2}^{n}-(y_1)_i\right) + \langle u, y_2\rangle
    \right\rbrace
    \text{s.t: }
    \begin{bmatrix}
        M^T & I
    \end{bmatrix}\begin{bmatrix}
        y_1 \\ y_2
    \end{bmatrix} \le
    c, 
\end{aligned}
$$

with optimality condition: 
$$
\begin{aligned}
	c_{i, j} - (y_1)_i + (y_1)_j \ge (y_2)_{(i, j)} \underset{\substack{\text{when}\\\text{optimal}}}{=} 0,
\end{aligned}
$$

if for example, then for any arc $(i, j)$, the above dual constraint becomes loose, then $c_{i, j} - (y_1)_i + (y_1)_j + (y_2)_{(i, j)} = 0$, then it's dual variable $x_{i, j} = 0$, meaning that it's not part of the ancestor tree. Furthermore, please observe that the shortest path characterization is $d_j \le d_{i} + c_{i, j}$, is just $c_{i, j} + d_i - d_j\ge 0$. By substituting $d_k = -(y_1)_k$, we obtain the same expression as the dual right constraints. Therefore: 

> The shortest path optimality condition is satisfied when a dual constraints become tight, and the distance label is the negative of the dual decision variable. The dual feasibility form simplifies to: 
> $c_{i, j} + d_i - d_j\ge 0$, for all arcs $(i, j)\in A$, and when $(i, j)$ is in the shortest ancestor tree, then the we have $c_{i, j} + d_i - d_j = 0$. 
> 
Such an observation becomes the major exploits for numerous shortest path algorithm, and applying the strong duality: 
1. Primal feasible. 
2. Dual feasible. 
3. Complementary Slack. 
One can test the optimality/infeasibility/unboundedness for a given shortest path problem. 
