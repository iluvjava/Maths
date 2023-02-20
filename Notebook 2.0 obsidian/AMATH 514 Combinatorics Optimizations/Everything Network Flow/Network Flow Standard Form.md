[[Graph Theory Terminology]]

---
### **The Network Float Problem**

We are interested in sending stuff between vertices on a directed graph where, sending per unit amount of stuff will costs us money and there are certain amount of deficit and surplus requirement must be satisfied for each of the vertices. To do this properly, we came up with a canonical form of LP problem formulations for the above problem, and this is what this file is about. Here are the list of quantities and their meaning: 

1. Each arc $(i, j)\in A$ contains a costs for sending unit amount of stuff from vertex $i$ to $j$, denoted as $c_{i, j}$
2. We assume a directed graph where each vertex is indexed by $[N]$ and we have all vertices labeled with a number that represents the amount of surplus (negative number), or deficit (positive number), this is denoted using $b_i$, $i\in [N]$. 
3. Each edge has a capacity denoted using $u_{i, j}$, representing an upper bound for unit number of stuff. 
4. The decision variable $x_{i, j}$ denotes the number of units sent from $i$ to $j$.  

We use $x$ to denote a vector of all the flows on arcs, let $c, u$ be vectors that denotes the costs and the upper bound for the flow; we let $A$ denotes the set of arcs for the graph, then the following linear program: 

$$
\begin{aligned}
    & \min_x \langle c, x\rangle \text{ s.t: }
    \begin{cases}
        \underbrace{\sum_{(i, j)\in A}^{}x_{i, j}}_{\text{flow out}}
         - 
        \underbrace{\sum_{(k, i)\in A}^{}x_{k, i}}_{\text{flow in}} = b_i
        & \text{ Mass Balance}
        \\
        \mathbf 0 \le x \le u & \text{Capacity }
    \end{cases}
\end{aligned}
$$

seeks for a solution such that it minimizes the costs of sending all the stuff betweens the set of vertices such that deficit and surplus conditions are satisfied. As a sanity check, we assert the fact that $\sum_{i = 1}^{N}b_i = 0$ so that the surplus and deficit of everything on the network is balanced out, if not then it's obvious that this won't have a feasible solution. 

**Remarks**

The vector $u_{i, j}$ can have elements of infinity, and the vector $c \ge \mathbf 0$. 

---
### **The Adjacency Matrix**

For a directed graph, we can make use of the adjacency matrix of the graph. The adjacency matrix $M$ for a directed graph is $N \times M$ where $N$ is the number of vertices in the graph and $M$ is the number of edges. The matrix's entries can be describe as: 

$$
\begin{aligned}
    M_{i, (j, k)} = \begin{cases}
        1 & j = i
        \\
        -1 & k = i
        \\
        0 & \text{else}
    \end{cases}
\end{aligned}
$$

since each edge only goes from one vertex to another, an immediate observations is that each column of $M$ consists of exactly 2 numbers, with exactly one $1$ and $-1$. And conveniently, the constraints of flows can be simply expressed as: $Mx = b$ for the network flow problem. This simplifies the process of looking for duals and stuff like those. To illustrate it better, we provide a row/column view of the adjacency matrix $M$: 

$$
\begin{aligned}
    &M = \begin{bmatrix}
        \delta_1^T 
        \\
        \delta_2^T
        \\
        \vdots
        \\
        \delta_N^T
    \end{bmatrix} \text{ where } 
    (\delta_i)_j = \left.\begin{cases}
        1 & (i, j)\in A
        \\
        -1 & (j, i) \in A
        \\
        0 & \text{ else}
    \end{cases}\right\rbrace.
    \\
    & M = 
    \begin{bmatrix}
        \e_{i_1} - \e_{j_1}
        & 
        \e_{i_2} - \e_{j_2}
        &
        \cdots
        & 
        \e_{i_m} - \e{j_m}
    \end{bmatrix}
\end{aligned}
$$

where, each row of the matrix is like an indicator vector denoting which edge is coming into/out of the vertex using $\pm 1$, positive one is coming out, and negative is coming in. The number of columns equal to the number of arcs in the graph. And the second view is the column view of the matrix. The adjacency matrix $M$ consists of columns of vector that has only exactly one $+1$ and $-1$ on it. Suppose that the arc is $(i, j)$, then its corresponding column in the adjacency matrix has $+1$ at the $i$ th row and $-1$ at the j th position. 


**The magic of directed cycles**

The matrix contains null space and the null spaces are directed cycles/(closed directed walks) on the graph. Suppose that we have a flow  $x'$ that goes through cycles on the graph, and it's like $(v_1, v_2), (v_2, v_3), \cdots, (v_{n - 1}, v_n), (v_n, v_1)$, and it corresponds to sending a unit amount of flow through the cycle, then the vector representing it will be in the null space of the graph. This is true by considering a cycle that is made of a list of vertices of the form $C = \{v_i\}_{i = 1}^k$, then for each vertex $v\in C$ we have total mount of flow $1 - 1$, giving us zero for this vertex. This is true for all vertices, therefore, it's in the null space of the matrix. We are using the row interpretation of the adjacency matrix here. 



---
### **Formulations in Matrix Form**

The problem has the form: 

$$
\begin{aligned}
    & \min_{x}\langle c, x\rangle \text{ s.t: }
    \\
    & 
    \begin{cases}
	    Mx = b
	    \\
		\mathbf 0 \le x \le u
    \end{cases}
\end{aligned}
$$
Now we can try taking the dual of this using the useful [[../Linear Programming Duality Cheat Sheet]], allowing us to write down the dual as: 

$$
\begin{aligned}
    \max_{\substack{y_1 \text{free} \\y_2 \le \mathbf 0}}
    \left\lbrace
       \langle b, y_1\rangle + \langle u, y_2\rangle
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

in the dual the choice of $y_1$ is free but the variable $y_2$ is strictly negative, if the dual were to be feasible, then it at least has to be the case that: 

$$
\begin{aligned}
    M^Ty_1 + y_2\le c, y_1 \text{ free}, 
\end{aligned}
$$

zoom in and select a row of the matrix such that it corresponds to the arc $(i, j)$, then we have: 

$$
\begin{aligned}
	c_{i, j} - (y_1)_i + (y_1)_j \ge (y_2)_{(i, j)} \underset{\substack{\text{when}\\\text{optimal}}}{=} 0,\tag{*}
\end{aligned}
$$

the LHS of the $\ge$ is the reduced costs. If we were to solve the problem using the simplex algorithm, then in the above expression, on the LHS, will become the objective row for each of the dictionary. And when all of them are larger than zero (for all basic feasible solution), then the algorithm terminates. For more about the property of reduced cost and how to use it, see [[Reduced Costs and Potentials]]. Note, more specifically, the variable $y_1$ is the potential of a graph, and the reduced costs is the entirely of the LHS of $\le$. 

**Implication of Complementary Slackness**

suppose that for some vertices $i\in [n]$, the dual constraint (*) is not tight, hence $c_{i, j} - (y_1)_i + (y_1)_j > 0$, then the dual of the dual, the primal, must have its variable equal to zero to satisfies the complementary slackness, e.g: $(c_{i, j} - (y_1)_i + (y_1)_j)x_{i, j} = 0$, since $x_{i, j}\ge 0$ by virtual of the network standard form, we conclude that $x_{i, j} = 0$. 


---
### **Reductions from Other Problems**

There are many problems that can be reduced to the network flow problems: 
1. [[LP for Pairwise Shortest Paths]]. 
2. Max flow Min Cut. 
3. Tournament Problems. 
4. Bipartite Assignment problems. 

