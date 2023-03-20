[[Maxflow Min Cut, Ford Fulkerson]]

---
### **Intro**

We introduce some advanced algorithms for solving maxflow min cut. These algorithms are strongly polynomials. 

The simplest way to improve Ford Fulkerson is the Edmonds Karp algorithm. It uses a BFS routine to compute the shortest augmenting path from $s$ to $t$, and then augment the path. It does this each time for looking for augmenting path. 

**Notations**: 

1. Denote $x^\circ$ as the feasible flow at some point of the algorithm. 
2. Denote $G(x^\circ)$ the residual graph based on the given feasible flow. 
3. Denote $u(x^\circ)$ the residual capacity of a given feasible flow. 
4. Denote $x'$ the residual flow. 

We let $s,t$ be the sink and the source nodes for the graph, and we want to look for the maximum amount of flows we can send through the network from $s$ to $t$. The graph we are talking about is $G = (A, N)$. 


---
### **Edmonds Karp Algorithm**

The algorithm looks for the shortest path measured in the number of arcs and then augmented along that path. We ignore arcs on the residual that has a capacity of zero. Denote $d^{(k)}(i)$ be the distance in number of arcs from $s$ to $i$, after the $k$ augment of the flow. 

**Theorem: Monotone Increasing Distance Labels**
> The distance for any nodes in the graph strictly increases, we have $d^{(0)}(j) \ge d^{(1)}(j) \ge \cdots \ge d^{(k)}(j)$, for all $j\in N$. 

**Proof**: 

Define a level set $L^{(k)}(l)$ vertices with distance $l$ away from the source node $s$: $L^{k}(l):= \{i \in N| d^{(k)}(i) = l\}$. The level set partitions the residual graph at iteration $k$. Let $P$ be an $s-v$ path has length $d^{(k)}(v)$, after augmentations, a subset of arcs on $P$ are reversed (There could be empty, many, or a single one of those arcs), denoted as $Q$. The next iteration finds a new $s-v$ path, say $P'$. There are 2 cases. 

* Let $P'\cap Q = \emptyset$ with $|P'| = d^{(k + 1)}(v)$. Then for all arcs in $(i, j) \in P'$, we have $i\in L^{(k)}(l) \implies L^{(k)}(l + 1)$, by the property of BFS tree. In this case, $d^{(k + 1)}(v) = d^{(k)}(v)$
* Else, $P'\cap Q \neq \emptyset$, giving us an reverse arc $a\in P'$, which means that $a = (i, j)$ has $i \in L^{(k)}(l), j \in L^{(k)}(l - 1)$ for some $l$, there exists some arc in the path which had been reversed by the path $P$, in $Q$. In this case $d^{(k + 1)}(v) > d^{(k)}(v)$. 

Hence, inductively, we have $d^{(k + 1)}(v)\ge d^{(k)}(v)$, for all $v\in N$. 

**References:** UW, Discrete optimization, 2020 Summer, Thomas Rothvoss. 


---
### **Shortest path with Retreats and Advances**

The algorithm keeps a label of distance for node. $d(j)$ now represent the minimum number of arcs needed to travel from the current node $j$ to the dstination node t. 




---
### **Preflow Push**

The algorithm send everything at first, and then slowly adjust the flow such that all the vertices again have the correct mass balance constraints equals to zero again. 