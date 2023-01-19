[[Graph Theory Terminology]]

---
### **The Network Float Problem**

We are interested in sending stuff between vertices on a directed graph where, sending per unit amount of stuff will costs us money and there are certain amount of deficit and surplus requirement must be satisfied for each of the vertices. To do this properly, we came up with a canonical form of LP problem formulations for the above problem, and this is what this file is about. Here are the list of quantities and their meaning: 

1. Each arc $(i, j)\in A$ contains a costs for sending unit amount of stuff from vertex $i$ to $j$, denoted as $c_{i, j}$
2. We assume a directed graph where each vertex is indexed by $[N]$ and we have all vertices labeled with a number that represents the amount of surplus (negative number), or defict (positive number), this is denoted using $b_i$, $i\in [N]$. 
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
        \\
        \mathbf 0 \le x \le u 
    \end{cases}
\end{aligned}
$$

seeks for a solution such that it minimizes the costs of sending all the stuff betweens the set of vertices such that deficit and surplus conditions are satisfied. As a sanity check, we assert the fact that $\sum_{i = 1}^{N}b_i = 0$ so that the surplus and deficit of everything on the network is balanced out, if not then it's obvious that this won't have a feasible solution. 

---
### **Matrix Form**

For an directed graph, we can make use of the adjacency matrix of the graph. The adjacnecy matrix $M$ for a directed graph is $N \times M$ where $N$ is the number of vertices in the graph and $M$ is the number of edges. The matrix's entries can be describe as: 

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

since each edge only goes from one vertex to another, an immediate observations is that each column of $M$ consists of exactly 2 numbers, with exactly one $1$ and $-1$. And conveniently, the constraints of flows can be simply expressed as: $Mx = b$ for the network flow problem. This simplifies the process of looking for duals and stuff like those. 

