- [[Min Cost Network Flow Standard Form]], 
- [[Mininum Cost Flow Basic Algorithms]]. 

---
### **Intro**

We introduce and summarize the network simplex algorithms in the textbook by Ahuja. Network simplex algorithm make use of the optimality conditions for the network, and it's just a type of simplex algorithm where the variable has a box bounding constraints associated with it. We list some terms and then we get started. 

- Everything is on the original graph and not the residual graph. 
1. *Restricted arcs*: $(i, j)$ is restricted when, $x_{i, j} = 0, x_{i, j} = u_{i, j}$, meaning that the flow is at the capacity limits. 
2. *Free arcs*: $(i, j)$ with flow in $(0, u_{i, j})$. 
3. *Cycle free solutions*: A solution that doesn't have a cycle of free arcs, if a solution is not cycle free, then there exists a cycle where, we can increase, or decrease its total flow amount by sending flows on those cycles. 
4. *Spanning tree solutions*: It's a spanning tree, a subgraph of the graph, and non-tree arcs are always restricted (they kinda forms a basis like in the simplex LP). Arcs on the tree can be either. 

**High Level Summarizations**: 

The algorithm identifies a spanning tree subgraph $T$ such that it's a *spanning tree solution*. It takes arcs that are restricted: $a \in A\setminus T$, depending on the which way it's restricted, it identifies a cycle on the tree, with the arc $a$, and then augment on that cycle depending on the governing boundary types. 

**Reference**: 

Ahuja's chapter 11. 


**Thm: Cycle Free Property \[11.1\]**
> If a min cost flow problem has a feasible region, and it's bounded from below, then there exists an optimal cycle free solution. 

**Observations:** 

Theorem is an adaptation from the fundamental theorem for Linear programming where, a bounded polyhedra always has an optimal solution that is on, one of its vertex. See [[../A Brutal Introduction to Linear Programming]] for more information. 

