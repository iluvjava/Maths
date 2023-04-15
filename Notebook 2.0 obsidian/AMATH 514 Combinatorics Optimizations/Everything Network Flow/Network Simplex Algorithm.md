- [[Min Cost Network Flow Standard Form]], 
- [[Minimum Cost Flow Basic Algorithms]]. 

---
### **Intro**

We introduce and summarize the network simplex algorithms in the textbook by Ahuja. Network simplex algorithm make use of the optimality conditions for the network, and it's just a type of simplex algorithm where the variable has a box bounding constraints associated with it. We list some terms and then we get started. 

0. Everything is on the original graph and not the residual graph. 
1. *Restricted arcs*: $(i, j)$ is restricted when, $x_{i, j} = 0, x_{i, j} = u_{i, j}$, meaning that the flow is at the capacity limits. 
2. *Free arcs*: $(i, j)$ with flow in $(0, u_{i, j})$. 
3. *Cycle free solutions*: A solution that doesn't have a cycle of free arcs, if a solution is not cycle free, then there exists a cycle where, we can increase, or decrease its total flow amount by sending flows on those cycles. 
4. *Spanning tree solutions*: It's a spanning tree, a subgraph of the graph, and non-tree arcs are always restricted (they kinda forms a basis like in the simplex LP). Arcs on the tree can be either. There are different types of spanning tree solution depending on the type of arcs in the spanning tree. 
   1. *Non-degenerate spanning tree*: Every arcs in the spanning tree solution is a *free arc*. 
   2. *Degenerate spanning tree*: There exists at least one arc in the spanning tree that is not an *free arc*
5. *spanning tree structure*, is a partitions of all the arcs: $(T, U, L)$ that describes a spanning tree solution of the flow problem. 

**High Level Summarizations**: 

The algorithm identifies a spanning tree subgraph $T$ such that it's a *spanning tree solution*. It takes arcs that are restricted: $a \in A\setminus T$, depending on the which way it's restricted, it identifies a cycle on the tree, with the arc $a$, and then augment on that cycle depending on the governing boundary types. 

**Reference**: 

Ahuja's Network flow algorithm textbook chapter 11. 


**Thm: Cycle Free Property \[11.1\]**
> If a min cost flow problem has a feasible region, and it's bounded from below, then there exists an optimal cycle free solution. 

**Observations:** 

Theorem is an adaptation from the fundamental theorem for Linear programming where, a bounded polyhedra always has an optimal solution that is on, one of its vertex. See [[../A Brutal Introduction to Linear Programming]] for more information. 

**Proof**
skipped. 

**Thm: Spanning tree Optimal Solution \[11.2\]**
> If the min cost flow problem is bounded from below, then there exists a spanning true solution that is optimal. 

This theorem is crucial for the algorithm, and a spanning tree represents a basis in the simplex LP method. These 2 ideas shares a lot of similarity. The proof will construct the spanning tree solution from first principles, proving the existence of the spanning true solutions for the network. 

**Proof**: 
We partition the set of all arcs into 3 set. 
1. $T$: the set of arcs that are in the spanning tree, it can be free, it can be non-free. 
2. $L$: The arcs that has a flow of zero and also not in $T$. 
3. $U$: The arcs that has full flow that is also not in $T$. 

The triple $(L, U, T)$ determines a spanning tree solution of the problem (We refers this as spanning tree structure). From \[thm 11.1\], suppose that a cycle free solution had been given. We construct a spanning tree solution from the cycle free solution. We do: 
1. Select the set of all free arcs, since there are no cycle of free arcs. 
2. If the number of arcs is less than or equal to $n - 1$, then the set of free arcs gives a forest. 
	1. Select any non-free arcs from the graph such that forest becomes a spanning tree. 
3. Else, the number of arcs is larger than $n - 1$. 
	1. We remove free arcs so that it's a spanning tree, of non-free arcs. 

We have ourselves a spanning tree solution, it may be non-degenerate if, the cycle free solution already has set of all free arcs as a spanning tree, or it may be degenerate if we need to add additional arcs that are not free to form the spanning tree solution. 



**Thm: Min Cost Flow Optimality Conditions \[11.3\]**
> A spanning tree solution with $(U, L,T)$ is an optimal spanning tree solution if and only if, it is feasible for some choice of node potentials $\pi$ and the arc reduced costs, computed by: 
> $$
> \begin{aligned}
>     \begin{cases}
>         c^{(\pi)}_{i, j} = 0& (i, j) \in T,
>         \\
>         c^{(\pi)}_{i, j} \ge 0 & (i, j) \in L ,
>         \\
>         c^{(\pi)}_{i, j} \le 0 & (i, j) \in U .
>     \end{cases}
> \end{aligned}
> $$

**Observations**: 
This is the optimality conditions for the min cost network flow, however, this is not on the residual graph. 


---
### **Computing the Node Potentials and Flows**

Given a spanning tree structure $(T, L, U)$. We describe the process of computing the node potentials using Pseudocode. We first looks for a potentials for the spanning tree structure. 

**Basic Quantities**
- `pi`, $\pi$ is the potential assignments for nodes in the graph. 
- `T, U, L` are sets for the tree structure in the code.  
- `c(i, j)` is the cost assignment on the original graph `G` in the code. 
- `thread` is an array, contains the ordering of node obtained by a pre-order traversal of the spanning tree $T$. 
- - `pred`, is the list containing predecessor of all nodes in $T$, for the tree, this is determined by a pre-order tree traveral of the undirected tree $T$, consistent with the ordering of `thread`. 


**Algorithm Preconditions**: 
- We treat $T$ as an undirected graph, and we performed a pre-order tree traversal on the tree, which determines `pred` and `thread`, the arcs as defined by `(pred(i), i)` for all $i \in N$, can be either, a forward, or a backward arcs on the original graph $G$. 

```SQL
FUNCTION compute_node_potentials(T, L, U, G): 
    pi(1) := 0 
    j:= thread (1)
    WHILE j != 1: 
        i := pred(j) /*make a selection on only one of the out going arcs on i. */
        IF (i, j) IN A: 
            pi(j) := pi(i) - c(i, j)
        ELSE (j, i) IN A: /*2 cases should be mutally exlucsive, (i,j) in A or (j, i) in A*/
            pi(j) := p(i) + c(j, i)
        j := thread(j) /* Traverse to the next element on the spanning tree. */
```

**Important Facts**: 
- Adding or subtracting a constant to all the nodes potential won't change the reduced costs induced by the potentials assignment. Therefore we can start with some node with index: 1 (that only has one arc coming out of it.) and set it with a potential of zero. That node should be a root node, we then use the conditions that: 
    $$
        c^{(\pi)}_{i, j} = c_{i, j} - \pi_i + \pi_j = 0, \forall (i, j)\in T.  
    $$
    for determining the potential of the neighboring nodes, on the tree. 
- The algorithm always produces integers solution for the dual variables whenever, the costs for the arcs are of integers types. Stated as \[Thm 11.4\] in Ahuja's textbook. 

---
### **Computing Arcs Flow**










---

### **Algorithm Descriptions**