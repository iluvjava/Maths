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

```SQL
list = {s}; /*List of vertices to go over*/
mkd = {s}; /*set of Marked vertices */
pred[s] = 0; 
counter = 0;
ord[s] = counter; 
WHILE list IS NOT EMPTY: 
	SELECT i IN list; /*any i, algoritm is generic. */
	adm_ngh = SELECT a = arc(i, j) WHERE EVAL("${a} is admissible ")
	IF adm_ngh IS NOT EMPTY:
		SELECT ANY j IN adm_ngh
		ADD j TO mkd;
		pred[j] = i;
		counter += 1;
		ord[j] = counter; 
		ADD j TO list /*in any position*/;
	ELSE: /*a must be inadmissible*/
		DELETE i FROM list

```

`EVAL`means analyzing human English language, with string interpolations syntax.

**Observations**: 
1.  Observe that the set `mkd` is always being added and nothing is removed from it. It grows to eventually includes all the vertices in the graph. 
2. For `list`: 
	1. A node is either added to the list, or it's not. (obvious)
	2. A node is added to or removed from `list` only once. Because, if `j` is added to `list` (then it's marked), then the number of admissible arcs coming out of it is strictly decreasing, when the number of admissible arc hit zero, it's removed, it can't be added back because it's already marked and all arcs coming into it is inadmissible. 
3. If a vertex is in `mkd`, it's not necessarily in the list, but if it's in the `list`, then it has to be marked.

**Complexities**: $\mathcal O(mn)$. 

By observation 2.2, we know that the outer while loops executes in $\mathcal O(n)$, the inner while loop executes for $\mathcal O (m)$, because that is the upper bound on the number of admissible arc, in total it's $\mathcal O (mn)$. The complexity can be improved if we keep track of the set of inadmissible arcs for each of the vertices. 


**Remarks**: 

Different order of choosing different $v\in S$ makes different algorithm: 
- When `list` is a queue, we have breadth first search. 
- When `list` is stack, we have a depth search. 
  - If $j$ is a descendent of $i$, with $i\neq j$, then $\text{order}(j) > \text{order}(i)$. 
- A priority queue for the number of incoming admissible arcs into the vertex $v$, then this become the topological search. (Assuming that it has a topological ordering.)
- When the vertices are label by the distance function from the source node of the search, and the list is a priority queue listing all the vertices using their distance label, then the search algorithm becomes the Dijkstra algorithm. 

**Improving the Complexities of the Algorithm**
- Each time we removed an element $v$ from the list, we have to check all the arcs $(v, u)$ for admissibility. If this element has be selected before from the list and not removed, then we would have rechecked all previous check arcs from previous selection of $v$. To improve, there are 2 possibilities: 
	- Book keep the arcs that is coming out of the current vertex in the list, and only checks the one that haven't been checked since that last selection. (Preferable because it doesn't remove generality of the algorithm. )
	- Check all the admissible arcs on selected vertex all at once. 


---
### **Generic Search Algorithm with Book Keeping | $\mathcal O(m + n)$**

To improve the complexity of the basic generic search algorithm, we consider another set `inadm[i]` to dente the next admissible arcs for vertex `i`. We also introduce an datastructure that stores the kth neighbor of vertex `i` in the code, using `ngh[i]`. 

```SQL
INPUT: ngh, nodes, arc; 
list={s}; 
mkd={s};
counter=0; 
ord[s] = counter; 
inadm[i] = 0 FOR ALL i IN nodes;
WHILE list IS NOT EMPTY: 
	SELECT i IN list; /*any i, algoritm is generic. */
	WHILE TRUE: 
		IF j IS NULL: 
			DELETE i FROM list;
			BREAK;
		j = next(ngh[i]);
		IF j IN mkd: 
			CONTINUE;
		ADD j TO mkd;
		pred[j] = i;
		counter += 1;
		ord[j] = counter; 
		ADD j TO list /*in any position*/;

```


The new algorithm consists of an iterator `ngh[i]` where, it remembers the last checked arc. Using this method, the total number of arc exam for each of the node is a constant, more specifically it's the out-degree for each of the node. Executing the outer loop for each of the vertices results in $\sum_{i\in N} \text{deg}^+(i)\in \mathcal O(m)$, in total. And since each time we need to select `i` from the `list` and remove it from `list`, this results in $2n$ exact operations. Therefore, the total number of operations required is in $\mathcal O(m + n)$. 


---
### **Specific Search Algorithms**

Using different order of selecting node `i` from `list`, we produces new search algorithms that constructs specific predecessor trees. 

**Depth First Search:** 

We make the following changes to the generic version of the algorithm: 
- Select `i` the current node from the head of the `list`. 
- Add `j` the neighbour just being marked by `i` to the head of the `list`. 

**Breadth First Search**: 
- Select `i` the current node from the head of the `list`. 
- Add `j`, the neighbour that just got marked by `i` to the tail of the `list`. 

**Topological Ordering**: 
- Select first `i` from `list` where it has zero in-degree. 
	- If such a `i` doesn't exists, then the graph cannot have topological ordering.
- Add `j`, in whatever order. 

Removing elements from the `list` is the same for all variants of the search algorithm. 

