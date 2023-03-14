[[Network Flow Standard Form]], 

---
### **Intro**

Reduced costs is a trick. It labels the graph nodes with values and then checks the costs of cycles and flow on the graph. Assuming that we were given original graph in network standard form. The reduce costs is related to the dual formulation of the minimal cost flow problem. 

Let $G = (A, N)$ be a directed graph, let $c$ denotes the arc costs for each unit flow on the graph. 


**References**:

Chapter 3 of the Networkflow algorithm textbook. 

---
### **Reduced Costs**

We define it and show some of its properties. 

**Definition: Reduced Costs**

> Let $i\in N$, we associated $p_i$ for each node a number, then the reduced costs of the graph, denoted as $c^{(p)}_{i, j} := c_{i, j} + (p_j - p_i)$ is defined for all $(i, j)\in A$. For discussion, we also define $z^{(p)}$ to be the objective value on the reduced cost graph, defined as: 
> $$
> \begin{aligned}
>     z(p) := \sum_{a\in A}^{} c^{(p)}_a. 
> \end{aligned}
> $$

**Observations**

Consider an increase on the current potential of a specific node $i$, with $\delta_i$, for all the arcs $(i, j)\in A$, we have $c^{(p)}_{i, j} = c_{i, j} + (p_j - \delta - p_i)$, meaning that $c^{(p)}_{i, j}$ is made smaller, for all $(k, i)\in A$, we have $c^{(p)}_{k, i} = c_{k, i} + (p_i + \delta - p_k)$, which is made larger. The potential controls the reduced costs of going in and out of a node: 

- Larger potential, less costs when flowing out of $i$, more costs when flowing in. 
- Smaller potential, most costs when flowing out of $i$, less costs when flowing in.

Reduced costs seems to be related to the $(y_2)_{i,j}$ decision variable in the dual formulation on the minimum cost flow problem. 


**Theorem: Same Optimal on the Reduced Cost**

> Minimum cost flow problem with arc costs $c^{(p)}_a$ and $c_{i,j}$ have the same optimal solutions. More over, $z(p) = z(0) - \langle p, b\rangle$. 


**Proof**: 

#UNFINISHED


**Theorem: Potential of Directed Cycles and Paths**

> Let $C$ be a directed cycle on the graph $G$ as collection of arcs, then the cost, denoted by $\text{cost}(C)$, and the reduced costs, denoted by $\text{cost}^p(C)$ is the same. When $P$ is a directed $k-l$ path on the graph G, we have $\text{cost}^p(P) = \text{cost}(P) + p_l - p_k$. 

**Proof**: 

$$
\begin{aligned}
    \text{cost}^p(C) &= \sum_{(i, j)\in C}^{}
        c^{(p)}_a 
        \\
    &= \sum_{(i, j) \in C}^{}
        c_{i,j} + (p_j - p_i)
    \\
    &= \left(\sum_{(i, j)\in C}^{}c_{i, j}\right) + 
    \underbrace{\sum_{(i, j)\in C}^{} p_j - p_i}_{=0}
    \\
    &= \text{cost}(C), 
\end{aligned}
$$

Where on the third line, the sum of all potential over a cycles will trigger a telescoping series, summing up to zero. We Follow a similar suit, it's not hard to prove that the telescoping series becomes $p_l - p_k$ when we sums over a path. 

**Remarks**: 

Very similar to a line integral on a conservative energy field in physics. 

