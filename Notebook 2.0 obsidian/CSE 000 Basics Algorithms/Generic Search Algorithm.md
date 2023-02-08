### **Intro**

we put the idea of all path finding and searching algorithm that generate a tree into one single framework. Consider a directed graph $G=(V, A)$ with: 
- a source vertex. 
- a vertex has 2 states: marked, or unmarked. 
  - Marked vertices: known to be reachable from the source. 
  - Unmarked: Undetermined
- A vertex has additional label: 
  - Predecessor: Which is just another label. 
  - Order: An integers indicating at which iteration the vertex is discovered by an admissible arc from its neighbor. 
- An arc $(i, j)$ has 2 states: 
  - Admissible: if node $i$ is marked and node $j$ is umarked. 
  - Inaddmissible: Otherwise. 

The algorithm keeps: $M$, a set for all marked vertices. The algorithm performs the following: 

**Algorithms**: 
- While $S \neq \emptyset$: 
  - Choose a vertex $v\in S$, if there exists $(v, u)$ such that it is admissible: 
    - Set the predecessor of $u$ to be $v$
    - Set the order of the vertex $u$, increment the order for future vertices. 
    - Add $v$ to $S$
  - Else, there is no admissible arcs coming out of $v$, then remove $v$ from the set $S$. 

**Observations**:  
- The algorithm generates a search tree, using the predecessors of the vertices. 

Different order of choosing different $v\in S$ makes different algorithm: 
- When $S$ is a queue, we have breadth first search. 
- A stack, we have a depth search. 
  - If $j$ is a descendent of $i$, with $i\neq j$, then $\text{order}(j) > \text{order}(i)$. 
- A priority queue for the number of incoming admissible arcs into the vertex $v$, then this become the topological search. (Assuming that it has a topological ordering.)