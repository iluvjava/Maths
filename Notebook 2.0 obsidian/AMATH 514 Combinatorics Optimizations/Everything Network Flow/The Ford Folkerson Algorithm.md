[Maxflow Min Cut, Introduction](Maxflow%20Min%20Cut,%20Introduction.md)

---
### **Ford Fulkerson Algorithm | The Labeling Algorithm**

The Ford Fulkerson algorithm is also refers to as the generic augmenting path algorithm. This algorithm find augmenting flows on the residual graph, which represents the changes in the feasible flow for the original graph. Each time, it promises to increases the total amount of flow going from $i$ to $t$, keeping the feasibility of the existing feasible flow after augmenting and modifying it. 

**Algorithm Pseudocode**: 


```SQL
WHILE DiPath P(s, t) IN G(x):
    FIND DiPath P = P(s, t); 
    delta := MIN(r(i, j), (i, j) IN P)
    EVAL "Augment all flow on the path: P". 
```

where, `DiPath(S, t)` denotes a s-t directed path, EVAL means interpreting the following string of human language. 

**Observations**: 
- From the integrality assumption, the algorithm increment at least $\delta \ge 1$. 
- When the algorithm terminates, it can't find any s-t path on the residual graph $G(x)$, suppose that the set $S$ denotes all the nodes $i$ that can be reached by an s-i path, then consider any $(i, j)$ it exists:
  - Either as $(i, j) \in (S, S^C)$ in $G$, then it has $r_{i, j} = u_{i, j} - x_{i, j} = 0$, so that $x_{i, j} = u_{i, j}$; 
  - Or $(i, j)\in (S^C, S)$ in G, so then $r_{j, i} = x_{i, j} = 0$ on the residual meaning that $x_{i, j} = 0$. 
- We note that at the start of the algorithm, if no feasible flow is given, we may always use a zero flow on the graph to generate a residual network that is suitable for the Ford Fulkerson Algorithm. 

Therefore, on the S-t cut of the original graph, the out going arcs are all saturated and the incoming arcs are all empty. We had achieved strong duality and the minimum cut is the set $S$. 

**LP View of Ford Fulkerson**

For any feasible solution $x$, and increment vector $\delta \mathbf 1_P$, the indicator function for some s-t path. This factor contains $\pm 1$, when $\mathbf (1_P)_a$ it's negative, it decreases the arc flow, when it's positive, it increases the arc flow. For all $a\in A$, we have: 

$$
(\mathbf 1_P)_a = \begin{cases}
    1 & a\in P\wedge a\in A, 
    \\
    -1 & a\in P\wedge a^{-1}\in A, 
    \\
    0 & a \not\in A, 
\end{cases}
$$
and such a vector has the property that $M\mathbf 1_P = \e_1 - \e_n$, then sending some flow from $s$ to $t$ along path $P$ would mean:

$$
\begin{aligned}
    M(x + \delta \mathbf 1_P) &= Mx + M\delta \mathbf 1_P = v(\e_1 - \e_n) + \delta(\e_1 - \e_n)
    \\
    &= (v + \delta)(\e_1 - \e_n), 
\end{aligned}
$$

since the variable $v$ is free, we can set the variable $v' = v + \delta$ to accommodate the changes in the flow. Take note that $M \mathbf 1_P = \e_1 - \e_n$ by the fact that $\mathbf 1_P$ represents a s-t path on the graph, and $M$ is the incidence matrix. Furthermore, the new changes to the vector must keep its feasibility, and that is the condition that $l \le x + \mathbf 1_P \le u$ comes into the picture. This feasibility conditions will construct the residual graph for the network flow problem. We skip the details here and it's left as an exercise for the readers.


---
### **Important Theorems**

These theorems uses observations about the Ford Fulkerson to characterize the optimality of a flow. 

**Theorem-1 | Augmenting Path Optimality Conditions**
> A flow $x^+$ is optimal if and only if residual $G(x^+)$ has no s-t augmenting path. 



**Theorem-2 | Integrality Theorem**
> If all arcs capacity are integers, the maximum flow has an integer maximum flow. 



**Theorem-3 | Ford Fulkerson Complexity**
> The Ford Fulkerson algorithm solves the maximum flow problem in $O(mn U)$ where $U = \max_{a\in A} u_a$.

**Proof**:

Each path find is bounded by $\mathcal O(m)$, the capacity of the cut is at most $\mathcal O (nU)$, we can at worse increment by an amount of $1$, therefore, the worse time complexity is given as $\mathcal O(mnU)$


---
### **Foundamental Theorems For Maxflow**

  
#### **Thm-6.5 |Integrality Theorem**

> If all arc capacities are integer, the maximum flow problem has an integer maximum flow.

**Proof**: 

This is direct from the Ford Fulkerson algorithm where, each increment of the path is strictly integers, and the algorithm terminates, therefore, when it terminates, the flow amount will be integral. 