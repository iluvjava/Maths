### **Graph**

A graph is a set of vertices and edges. $G = (V, E)$; at set of edges can be direct or undirected. When undirected, $E$ is a set of set, else, $E$ is a relations on the set $V$. 

### **Walk**

A walk on the graph $(V, E)$ is a sequence of vertices and edges, denoted as: 

$$
\begin{aligned}
    & v_0, e_1, v_1, \cdots, e_m, v_m
    \\
    & v_j \in V, e_j \in E, e_j = {v_{j - 1}, v_j}
\end{aligned}
$$

### **Path**

A walk with distinct vertices. 


### **Cycle**
A walk with $v_0 = v_m$. Take note that it can have repeating vertices while going from $v_0$ to $v_m$. 

### **Circuit**

A cycle with distinct $v_j$, except for the $v_0, v_m$, where $v_0 = v_m$. It's a cycle without revisiting any vertices. 

--- 

### **Subgraph**

$G'$ is a subgraph of $G:=(V, E)$ if $G = (V', E')$ and $V'\subseteq V$ and $E'\subseteq E$. 


### **Connected Graph**

A graph G is a connected graph if $\exists$ a PATH in G for any 2 vertices. 

### **Connected Components of Graph**

It's the maximal connected subgraph of a graph. The union of all paths between the vertices in the graph.  

### **Forest**

Graph with no cycles in it. 

### **Connected Forest: Tree**

A connected forest is connected, therefore for every vertices, there exists a path between. It's called a tree. 

> Forest is a disjoint set of trees. 

### **Spanning Tree:**

*Spanning*:

A subgraph $G'$ of $G$ is spanning if $V' = V$ and every $v\in V$ is connected to $e\in E'$. It's the set of edges that covers all the vertices of the original graph. 

*Spanning Tree:*

A spanning Tree of a subgraph is a tree (one connected component) of a graph G that is also a tree (There is no cycle in the tree). 

**Note**: A spanning subgraph is not necessarily connected, nor it has to be a tree. 


