- [[Minimum Cost Network Flow Standard Form]], 
- [[Minimum Cost Flow Optimality Conditions]]. 

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

The algorithm identifies a spanning tree subgraph $T$ such that it's a *spanning tree solution*. It takes arcs that are restricted: $a \in A\setminus T$, depending on the which way it's restricted, it identifies a cycle on the tree, with the arc $a$, and then augment on that cycle depending on the governing boundary types. There are a lot of things to consider when understanding this algorithm: 
1. Why does solutions with a tree structure exists? 
2. How to expoits the optimality conditions so that we are improving the flow? 
3. How to update all the information, the potentials, reduced costs, and the tree structure? 
   1. This includes the computation details and how to make them efficient. 
   2. Also includes the type of heuristics one should employ to attain best cost reduction with least computational cost and storage. 

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

The triple $(L, U, T)$ determines a spanning tree solution of the problem (We refers this as spanning tree structure). From \[thm 11.1\], suppose that a cycle free solution had been given (important!). Let $F\subseteq A$ to be the set of arcs that are free. Since there is no cycle, the graph is a forest with less than or equal to $n - 1$ arcs. 
1. Select the set of all free arcs, since there are no cycle of free arcs. 
2. Select any non-free arcs from the graph, add it to the tree so that it becomes a spanning tree. 

The spanning tree is non-degenerate if, the cycle free solution has strictly less than $n - 1$ number of free arcs. Else, the spanning tree solution is a non-degenerate tree. 


**Thm | Min Cost Flow Optimality Conditions \[11.3\]**
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
- Intuitively, if the reduced costs is negative, then it means sending more flow would save cost, hence, for an optimal solution, it better be the case that that arc is at capacity. 
- Else, reduced cost is positive, meaning that we shouldn't be sending any thing on the arc to increase the costs. 

**Proof**: 

skipped. Vist basic algorithm for network flow for more background for the optimality conditions on the original graph. 

---
### **Computing the Node Potentials and Flows**

Given a spanning tree structure $(T, L, U)$. We describe the process of computing the node potentials using Pseudocode. We first looks for a potentials for the spanning tree structure. 

**Basic Quantities**
- `pi`, $\pi$ is the potential assignments for nodes in the graph. 
- `T, U, L` are sets for the tree structure in the code.  
- `c(i, j)` is the cost assignment on the original graph `G` in the code. 
- `thread` is an array, contains the ordering of node obtained by a pre-order traversal of the spanning tree $T$. This also requires the defintion of a root node of the tree, WLOG, let the root node of the tree be indexed by 1. This assumption will be used throughout. 
- `pred`, is the list containing predecessor of all nodes in $T$, for the tree, this is determined by a pre-order tree traveral of the undirected tree $T$, consistent with the ordering of `thread`. 


**Algorithm Preconditions**: 
- We treat $T$ as an undirected graph, and we performed a pre-order tree traversal on the tree, which determines `pred` and `thread`, the arcs as defined by `(pred(i), i)` for all $i \in N$, can be either, a forward, or a backward arcs on the original graph $G$. 

```SQL
FUNCTION compute_node_potentials(T, L, U, G=(A, N)): 
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

Given a spanning tree structure, which corresponds to a spanning tree solution for the flow, we describe a algorithm procedures for computing all the flows that are on the tree. Given $(T, U, L)$, we already know what flow should be for $U, L$, out goal is to determine flow on arcs in $T$. 

**Basic Quantities**: 
- $b'$, `b_prime`, denotes the temperory label for the flow balance on a node. 
- `T_prime`, $T'$ is a copy of the tree, include all its arcs and nodes, and it has mass balance constraint: `b_prime`, $b'$. It will be modified when we run the algorithm. 
- `x` is the flow, `x(i, j)` denotes the flow on arc $(i, j)$, positive. 
- `u` is the upper bound function for the min cost flow problem. 
- Finally, we keep using the quantities: `thread, pred` from the previous sections, they are relevant to the spanning tree structure, let the root node of the tree to be the same as in the previous case. 

**Algorithm Pseudo Code**: 

```SQL
FUNCTION compute_flows(T, L, U, G=(A, N)): 
    b_prime(i) = b(i) FOR ALL i IN N
    FOR (i, j) IN U: 
        x(i, j) = u(i, j)
        b_prime(i) -= u(i, j)
        b_prime(j) += u(i, j)
    FOR (i, j) IN L: 
        x(i, j) = 0
    T_prime := T
    WHILE T_prime != {1}: 
        j = SELECT EVAL("a leaf node in the graph that is not: 1. in $T_prime")
        i = pred(j)
        IF (i, j) IN T_prime: 
            x(i, j) = - b_prime(j) 
        ELSE:  /*The case where, (j, i) is in T_prime! */
            x(i, j) = b_prime(j)
        DELETE j FROM T_prime
        DELETE (i, j) FROM T_prime
```

**Observations**

For simplicity we may suppose that the whole graph is just a tree, and we were give a spanning tree-structure, which corresponds to a unique spanning tree solution on the graph. Then the algorithm delete the leaf node $j$, depending on whether the arc points away, a towards the node $j$, we set the flow using the mass balance. This is true because there is only one arc coming in/out of node $j$ by the fact that it's a leaf node. 

---
### **The Generic Network Simplex Algorithm**

The the simplex algorithm for LP, but it's performed on the network directly. The theories behind it is not revealed for my education. But it's there is a deep connection between the 2 algorithm nonetheless. Suppose that a spanning tree solution is given by the tree structure $T, L, U$. The network simplex algorithm can be summarized simply:  
1. Compute the node potentials. 
2. Using the potentials to determine reduce costs. 
3. Using the reduced costs to determine which arc to choose. 
4. Choose the arc to add to the tree to create a cycle on the tree, increase, or decrease flow on the arcs, depending on the reduced costs. 

**Algorithm Pseudocode**: 
```SQL
EVAL("Determine initial feasile tree structure (T, L, U).")
EVAL("Determine the flow x, and potentials pi for the above tree structure.")
WHILE EVAL("There exists some arcs violating the optimality structure."):
    SELECT (k, l) WHERE EVAL("It violates the optimality conditions (using the reduced costs). ")
    ADD (k, l) TO T
    EVAl("Determine an leaving arc (p, q).")
    EVAL("Update the tree structure, the flow, the potentials. ")
```

The most important part of the algorithm that determines its behaviors is the part where we choose the entering, and the leaving arcs (like simplex pivoting), and how we avoid degeneracy on the tree structure for the solution. 


**Initial Spanning Tree Solution**: 

- Create a feasible flow for the network min cost feasibility check to max flow problem. 


---
### **Strongly Feasible Spanning Tree Solution**

Keeping a strong feasible spanning tree solution will allow the algorithm to terminate on finitely many iterations. It won't necessarily make the spanning tree solution non-degenerate to assure increase on the objective for every iterations, but it will prevent the algorithm to enter a cycle of pivoting, causing it to halt. 

**Definition: Strongly Feasible Spanning Tree Solution**
> A spanning tree solution is a strongly feasible spanning tree solution if and only if the following, 2 equivalent statements are true with respect to some root node on the tree. 
> 1. We can send some positive flow from any node in the tree to the root node of the tree. 
> 2. For all tree arcs with zero flow, it points to the root node, for all arcs with full flow, it points away from the root node.

**Observations**: 
- A root node must be defined for the tree before the definition becomes valid for any tree. 
- A non-degenerate spanning tree is always a strongly feasible spanning tree. Because none of the arcs in the tree is at capacity, or zero capacity. 
- A degenerate spanning tree, can be strongly feasible, or not. It's not directly related. 

**Defintion: Apex**
> We observe that that adding any arc to the tree will connect a cycle on the tree. Let the cycle to be the smallest possible cycle connected by the added arc, the apex is the only node with more than 2 arcs coming in/out of it. 

**Leaving Arc Strategy**
> Select the leaving arc as the last blocking arc encountered in traversing the pivot cycle W along its orientation starting at the apex w. 


**References:**


11.6 in the Ahuja's textbook for network flow algorithms. 

---

### **Pivoting Rules**



