[[../AMATH 514 Combinatorics Optimizations/Everything Network Flow/Reduced Costs and Potentials]], [[../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]], 

---
### **Intro**

There are 2 ways for figuring out the shortest path from all pairs of vertices on a graph all at once, or, improve the speed of finding more shortest path between pairs of vertices on a graph. We list some of the possibilities here: 

- Just do direct shortest path on all pairs of vertices, whenever asked. 
- Try Bellman Ford first and then use Dijkstra in future queries to figure out the shortest path on potential graph, and then translate it back to the solution on the original graph. 
- Figure out the all pairs shortest path using algorithm like Floyd Warshall. 

**Assumption:** 
We make the exact same set of assumptions for the graph as in the case of the single source shortest path. 
#UNFINISHED 


----
### Floyd Warshall: 

**Lemma: All Pairs Optimality Conditions**

----
### **Algorithm**
