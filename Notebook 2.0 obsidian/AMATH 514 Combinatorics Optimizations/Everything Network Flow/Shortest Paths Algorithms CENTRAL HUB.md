### **Intro**

We make one file that list some of the important discussion about shortest path, as a network flow problem. This file is made with the intention for reviewing for the final of the network flow class. 

**Theoretical Foundations**: 

- [LP for Source Tree Shortest Paths](LP%20for%20Source%20Tree%20Shortest%20Paths.md). 
	- The LP formulations of the single source shortest path problem, 
	- Assumptions for the shortest path problem. 
	- Relaxation conditions from the dual. 
	- Optimal Path Conditions for the Dual. 

We now assume that $C = \max_{a\in A}(|c_a|)$, the maximum absolute value for all the costs in the graph. 

**Algorithms for Single Sources Shortest Path Problem**
- [Dijkstra Algorithm](Dijkstra%20Algorithm.md)
	- Only for graphs with costs that are non-negative. 
	- Complexity $\mathcal O(n^2)$ if we are not using any, priority queue and fancy datastructure for the algorithm. 
- [Shortest Path Label Correcting Algorithm](Shortest%20Path%20Label%20Correcting%20Algorithm.md)
	- This is a class of algorithms. 
	- If there are negative cycle in the graph: 
		- FIFO Labeling and Bellmand Ford will detect the negative cycles in the graph without checking the predecessor tree. 
		- For generic labeling algorithm, it must detect negative cycles on the predecessor tree when it's iterating. 

**Algorithm for All Pairs Shortest Path Problem**
- [All Pairs Shortest Paths](All%20Pairs%20Shortest%20Paths.md), This is the Floydwarshall Algorithm, and the generic all pairs labeling algorithm, exploiting the optimality conditions for paths in the graph. 

