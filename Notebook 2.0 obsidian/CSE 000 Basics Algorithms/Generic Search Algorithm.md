[[Algorithm Complexity Introduction]], 

---
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
  - <mark style="background: #BBFABBA6;">Admissible</mark>: if node $i$ is marked and node $j$ is unmarked. 
  - <mark style="background: #FF5582A6;">Inadmissible</mark>: Otherwise. 

The algorithm keeps: $S$, a set for all marked vertices. It produces the order of discovering each of the vertices on the graph, and it also returns a tree called the predecessor tree that represents the searching process. 

**Algorithms Descriptions**: 
- Initialize $S = \{s\}$, where $s$ is chosen at random. 
- Initialize counter $i = 0$
- While $S \neq \emptyset$: 
  - Choose a vertex $v\in S$, if there exists $(v, u)$ such that it is <mark style="background: #BBFABBA6;">admissible</mark>: 
    - Set the predecessor of $u$ to be $v$
    - Set the order of the vertex $u$ to be $i$, increment the order for future vertices using $i:= i + 1$
    - Add $v$ to $S$. 
  - Else, there is no admissible arcs coming out of $v$, then remove $v$ from the set $S$. 

**Algorithm Pseudocode**: 



**Observations**:  
- The algorithm generates a search tree, and each vertices on the tree link to its parent via the predecessor label. 


Different order of choosing different $v\in S$ makes different algorithm: 
- When $S$ is a queue, we have breadth first search. 
- A stack, we have a depth search. 
  - If $j$ is a descendent of $i$, with $i\neq j$, then $\text{order}(j) > \text{order}(i)$. 
- A priority queue for the number of incoming admissible arcs into the vertex $v$, then this become the topological search. (Assuming that it has a topological ordering.)
- When the vertices are label by the distance function from the source node of the search, and the list is a priority queue listing all the vertices using their distance label, then the search algorithm becomes the Dijkstra algorithm. 

**Further Observations and Potential Optimizations**
- Each time we removed an element $v$ from the list, we have to check all the arcs $(v, u)$ for admissibility. If this element has be selected before from the list and not removed, then we would have rechecked all previous check arcs from previous selection of $v$. To improve, there are 2 possibilities: 
	- Book keep the arcs that is coming out of the current vertex in the list, and only checks the one that haven't been checked since that last selection. (Preferable because it doesn't remove generality of the algorithm. )
	- Check all the admissible arcs on selected vertex all at once. 

---
### **Potential Functions and Complexity Analysis**

A potential function can be used book keeping the progress of the operations. 

