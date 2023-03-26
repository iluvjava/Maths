[[Graph Theory Terminology]]

---
### **The Network Flow Problem**

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

seeks for a solution such that it minimizes the costs of sending all the stuff between the set of vertices such that deficit and surplus conditions are satisfied. As a sanity check, we assert the fact that $\sum_{i = 1}^{N}b_i = 0$ so that the surplus and deficit of everything on the network is balanced out, if not then it's obvious that this won't have a feasible solution. 

**Remarks**

The vector $u_{i, j}$ can have elements of infinity, and the vector $c \ge \mathbf 0$. 


---
### **Residual Network**

The concept of residual network is relevant to the optimality conditions for an optimal solution. Given any flow $x^\circ$ that is feasible on the graph $G$, we can transform the graph $G$ into a residual network. The residual network can have 2 arcs along the same direction. To use the residual network we make the following assumptions about the input graph $G = (A, N)$, with upper bound $u$, lower bound $l$, and mass balance constraint vector $b$ and unit flow cost vector $c$. 

1. The network is at least feasible. 
2. The lower bound is zero, and the upper bound is positive, valid. If it's not the case the we have lower bounds, consult: [[Reduction to Network Flow]], removing lower bounds. 
3. For all node $i, j$ where arc $(i, j)\in A$, there is only one arc. No double arcs are allowed. 

**Definition: The Residual Network**

> We define $x^\circ$ to be a feasible flow on the network. For the capacity on the residual network, we denote it using $r$, that is the upper bound for each arc. The lower bound for each arc in the residual network $G(x^\circ)$ will always be $0$. We denote the cost to be $c'$. Then: 
> 
> $$
> \begin{aligned}
>     & 
>     (i, j) \in A' \iff 
>     x^\circ_{i, j} < u_{i, j} \text{ with } r_{i, j} = u_{i, j} - x_{i, j}^\circ , c'_{i, j} = c_{i, j}
>     \\ 
>     & 
>     (j, i) \in A' \iff 
>     x^\circ_{i, j} > 0 \text{ with } r_{i, j} = x_{i, j}^\circ, c'_{j, i} = -c_{i, j}, 
> \end{aligned}
> $$
> 
> which completes the definition. 

Intuitively, the residual network represent how a feasible flow may change, while still being feasible. Let $x'$ be the flow on the residual network. It will always be positive, but on the original graph, if $x_{i, j} > 0$ and we have $(i, j) \in A$, it is the amount of increase the flow $x^\circ_{i, j}$ else, $(j, i)\in A$, it is the amount of decrease on $x_{i, j}^\circ$. 


---
### **The Incidence Matrix**

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


**The Magic of Walks on the Incidence Matrix**

The null spaces of the incidence matrices are directed cycles, or closed directed walks on the graph. Let $W$ denote the arc collection a directed walk on the graph, Suppose that we have a unit flow vector $\mathbf 1_W$ then we define the indicator vector for the walk as: 

$$
\begin{aligned}
    (\mathbf  1_W)_{i} = \begin{cases}
        1 & i \in W
        \\
        0 & \text{else}, 
    \end{cases}
\end{aligned}
$$

**Claim:** 
> Let $C$ denoted a closed directed walk on the graph, then vector $\mathbf 1_C$ is in the null space of the incidence matrix $M$. 

WLOG (general up to a permutation of vertices), let the arc collection $C$ be defined as: $(v(1), v(2)), (v(2), v(3)), \cdots, (v(k - 1), v(k)), (v(k), v(1))$, then the vector representing it will be in the null space of the graph. This is true by considering a cycle that is made of a list of vertices of the form $C = \{v_i\}_{i = 1}^k$, then for each vertex $v_i\in C$ we have $(j, v_i) \in C \iff (v_i, k) \in C$ by the fact that $C$ is a closed directed walk because if you walk over the vertex $v_i$, you have to come out of it at some point.  giving us $(1 - 1) + (1 - 1) + \cdots(1 - 1)$ on the row for $v_i$ in incidence matrix $M$. This is true for all vertices in $C$. For all vertices not on the walk, there is no arc intersecting the nodes, therefore it's zero automatically. More precisely: 

$$
\begin{aligned}
    M\mathbf 1_C &= \sum_{(i, j)\in C}^{} \e_i - \e_j
    \\
    &= \left(
        \sum_{i=1}^{k-1}
        \e_{v(i)} - \e_{v(i + 1)}
    \right) + \e_{v(k)} - \e_{v(1)}
    \\
    &= 
    \e_{v(1)} - \e_{v(k)} + \e_{v(k)} - \e_{v(1)} = \mathbf 0, 
\end{aligned}
$$

a simple application of the column view of the incidence matrix and the telescoping series on these basis vector. 

**Corollary: Non-directed Cycles their Indicator Vector**

> On a directed graph, we make $\mathbf 1_C$(not necessarily positive this time) represent an nondirected cycles, and let $C$ be a collection of arcs on that cycles, then we would still be able to define the flow: 
> $$
> \begin{aligned}
>     (\mathbf 1_C)_a = 
>     \left.
>     \begin{cases}
>         1 & a \in C 
>         \\
>         -1 & a^{-1} \in C
>         \\
>         0 & \text{else}
>     \end{cases}
>     \right\rbrace \quad \forall a \in C, 
> \end{aligned}
> $$
> Here we denote $a^{-1}$ as the reverse arc of $a$. $M \mathbf 1_C = \mathbf 0$ as well. 


**Remarks**: 

This is extremely useful for stuff on the residual graph. A direction along the arc implies adding some amount on existing feasible flow, and the direction against the arc implies removing flow on those arcs. 


**Claim**: 
> Let $W$ denote a $i-j$ walk on the graph, then $M \mathbf 1_W = \e_i - \e_j$

The justification is very similar to what we had for the closed directed walk, we won't repeat. 


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
    \max_{\substack{y_1 \text{free} \\ y_2 \le \mathbf 0}}
    \left\lbrace
       \langle b, y_1\rangle + \langle u, y_2\rangle
    \right\rbrace
    \text{ s.t: }
    \begin{bmatrix}
        M^T & I
    \end{bmatrix}
    \begin{bmatrix}
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
	c_{i, j} - (y_1)_i + (y_1)_j \ge (y_2)_{(i, j)}
	\underset
	{
		\substack{\text{when} \\ \text{optimal}}
	}
	{=} 0
\end{aligned}\tag{*}
$$

the LHS of the $\ge$ is the reduced costs. If we were to solve the problem using the simplex algorithm, then in the above expression, on the LHS, will become the objective row for each of the dictionary. And when all of them are larger than zero (for all basic feasible solution), then the algorithm terminates. For more about the property of reduced cost and how to use it, see [[Reduced Costs and Potentials]]. Note, more specifically, the variable $y_1$ is the potential of a graph, and the reduced costs is the entirely of the LHS of $\le$. 

**Implication of Complementary Slackness**

suppose that for some vertices $i\in [n]$, the dual constraint (*) is not tight, hence $c_{i, j} - (y_1)_i + (y_1)_j > 0$, then the dual of the dual, the primal, must have its variable equal to zero to satisfies the complementary slackness, e.g: $(c_{i, j} - (y_1)_i + (y_1)_j)x_{i, j} = 0$, since $x_{i, j}\ge 0$ by virtual of the network standard form, we conclude that $x_{i, j} = 0$. 

**Theorem: Optimality Conditions and Negative Costs Cycles**

> $x^+$ is feasible for a minimum cost network flow problem if and only if the residual network $G(x^+)$, contains no negative cost directed cycles. 

**Proof**: 

The $\implies$ direction is direct from the fact we can decompose $x^+ = x + \delta\mathbb 1_C$ where $C$ is a cycle on the graph, $x$ is the residual flow on the graph is still feasible, and hence, adding flow $\mathbf \delta1_C$ resulting in a strictly smaller objective value. To prove the other direction we need [[Flow Decomposition Algorithm]]. #UNFINISHED

**References**: Theorem 3.8 in the Network Algorithms Textbook. 

---
### **The Dual Problem**

We derive the dual problem of the minimum cost flow and simplify it so that it's easier for analysis purposes. 




---
### **Optimality Conditions of Min-cost Network Flows**

The characterization of the minimum cost network's optimality is useful for designing algorithms for solving these problems. 




---
### **Reductions from Other Problems**

There are many problems that can be reduced to the network flow problems: 
1. [[LP for Source Tree Shortest Paths]]. 
2. [[Maxflow Min Cut, Ford Fulkerson]]
3. Tournament Problems. 
4. Bipartite Assignment problems. 

For reduction from other more general graph problem, read [[Reduction to Network Flow]] for more information. 

