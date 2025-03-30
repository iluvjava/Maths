- [Single Source Shortest Path Optimality Conditions](../CSE%20000%20Basics%20Algorithms/Single%20Source%20Shortest%20Path%20Optimality%20Conditions.md). 

---
### **Intro**

**Basic Algorithms That Powers Everything Else**: 
- Generic Search Algorithm: [Generic Search Algorithm](../CSE%20000%20Basics%20Algorithms/Generic%20Search%20Algorithm.md)
- Flow Decomposition Algorithm: [Flow Decomposition Algorithm](Everything%20Network%20Flow/Flow%20Decomposition%20Algorithm.md)

For everything about shortest path algorithm, visit: [Shortest Paths Algorithms CENTRAL HUB](Everything%20Network%20Flow/Shortest%20Paths%20Algorithms%20CENTRAL%20HUB.md), these are a special type of max flow problem, and it's revealing the same optimality conditions for the mincost flow. The algorithm for shortest paths exploit similar conditions compare to the min cost flow. 


---
### **Maximum Flow**

Given a directed graph with arc costs, and 2 special node $s, t$, we send the flow from $s$ to $t$. This type of problem is in between a circulation problem and a minimum cost flow problem. To start visit: 

- [Maxflow Min Cut, Introduction](Everything%20Network%20Flow/Maxflow%20Min%20Cut,%20Introduction.md). It contains problem formulation, assumptions on the graph, optimality conditions etc. 
	- S-t Cut. 
	- LP formulations for the Max flow problem. 
	- Strong and Weak duality as a results from the linear programming modeling. 

There are simply too many algorithms and heuristic that are used for solving it efficiently, we are linking one of them: 
- [The Ford Folkerson Algorithm](Everything%20Network%20Flow/The%20Ford%20Folkerson%20Algorithm.md), this algorithm looks for augmenting paths, and its proof is tightly linked to the optimality conditions on the graph. A very important result. 


---
### **Minimum Cost Flow**

The optimality conditions for the minimum cost flow problem is directly derived from the LP formulations. See [Minimum Cost Flow Optimality Conditions](Everything%20Network%20Flow/Minimum%20Cost%20Flow%20Optimality%20Conditions.md) for details. There are 2 algorithms that solves it, both exploits the LP duality theories for the Network Flow Standard Form LP: 
- [Out of Kilter Algorithm](Everything%20Network%20Flow/Out%20of%20Kilter%20Algorithm.md)
- [Network Simplex Algorithm](Everything%20Network%20Flow/Network%20Simplex%20Algorithm.md)