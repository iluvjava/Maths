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
### **Capacity Scaling Heuristic**

The major idea that it exploit is the idea of *Maximum Capacity Augmening Path*. It identified the issues with the usual Forward Fulkerson, and addresses by excluding paths that have small capacities. 

**Definition: Delta Residual Graph**: 
> Let $x^\circ$ be a feasible flow, $\delta \ge 0$, then $G(x^\circ, \Delta)$ is subgraph of the residual graph obtained by deleting all arcs with a capacity that is less than $\Delta$. 

**Algorithm: Capacity Scaling Via Binary Search**


**Theorem: Maximum Cut Capacity**: 





---
### **Shortest path with Retreats and Advances**

The algorithm keeps a label of distance for node. $d(j)$ now represent the minimum number of arcs needed to travel from the current node $j$ to the dstination node t. It's just Edmond Karp's algorithm, but improved. 

**Basic Quantities and their Meaning**: 
- $d(t) = 0$, $d(i)\le d(j) + 1$, for every arcs in $(i,j)\in A$. This is a distance label denoting the least number of arcs requires to travels from $j$ to node $t$. When $d(s)\ge n$, there is no path going from $s$ to $t$. 
- *Admissible arcs*: An arc $(i, j)$ is admissible on the residual graph when $d(i) = d(j) + 1$, assume that the distance label is valid, because it's on the residual graph, the resiudal capacity would have to be strictly larger than zero too. 
- *Admissible path*: A path is admissible when all of its arcs are admissible on the residual graph. 
- `nghs(i)` denotes a collection of out-going neighbors of the node $i$, in the code. 
- $A(i)$ denotes all the out-going neighbours for the vertex $i$, this is for the mathematics. 

**Property 7.1**: 
> If the distance label is valid, then $d(i)$ denotes the lower bound on the number of maximum arcs arcs needed for a path going from $i$ to $t$. 

**Observations**: 
The property is just changing the $c_{i, j} = 1$ for the optimality conditions for shortest paths. 

**Proof**: 

Obvious from the fact that the distance always increment by 1 each time. 

**Subroutine: Advances(i)**

Advances is performed on a given node, provided with the residual graph and the current distance label for the node $i$. It performs one step of path searching by trying to reach the node $i$, with the least number of arcs. 

```sql
/*Returns the next nodes to aug the path. */
FUNCTION advance(i, G=(A, N)):
    FOR ALL j IN nghs(i): 
        IF (i, j) IS EVAL('And admissible arc, e.g: d(i) = d(j) + 1'): 
            RETURN j
```

this subroutine searches for the next node after $i$ to construct complete the augmeting path going from $s$ to $t$. 

**Subroutine: Retreat(i)**

The retreat algorithm tries to re-adjust the expectation on the shortest number of arcs needed to go from a node $i$ to $t$. It changes the distance label to allow for more admissible arcs for the augmenting paths. 

Preconditions: 
> $d(i) < d(j) + 1$, for all $(i, j)$ in the graph.

Observation: 

The retreat subroutine is only called whenever there is no adimissible arcs coming out of the vertex $i$. 

```SQL
/*Changes the distance to allow for more admissible arcs for the augpaths. */
FUNCTION retreat(i, G=(A, N)): 
    nlb = d(i)  /*value for the new label */ 
    FOR ALL j IN nghs(i): 
        nlb = min(nlb, d(j) + 1)
    RETURN nlb
```

**Subroutine: Initializations**

At the start of the algorithm, we label all the nodes using an reverse search from $t$ to $S$, and $d(j)$ will be the level sets of BFS for all the vertices. 

**Algorithm: Dynamic Shortest Augmenting Paths** 

Given graph $G = (A, N)$ with the source and destination node $s, t$, we have: 

```SQL
FUNCTION shortestAugPath(G=(A, N), s, t):
    d = EVAL('Initialize the distance labels using the level sets of the reverse BFS.')
    i = s
    augpth = [i]
    WHILE d(s) < n: 
        IF EVAL("$i has an admissible arc"): 
            j = advance(i, G)
            ADD j TO augpth
            IF j IS t: 
                EVAL('Perform augpath and get the new residual graph, make it G')
        ELSE: 
            d(i) = retreat(i)
            i = EVAL('Find predecessor of i in $augpth, and change $augpth accordingly')
```


**Lemma 7.5**: 

> The shortest augmenting path algorithm maintains valid distance labels at each step. Moreover, each relabel (or, retreat) operation strictly increases the distance label of a node.

To show, we need to consider whether the distance labels are still valid after: 
1. An augmentation by a correctly identified augmenting path, at least one of the arcs were deleted from the admissible paths on the graph. 
2. A retreat operation. 
We won't need to check the advance operations because there is no modifying the capacities on the residual graph. Let's make inductive hypothesis for the lemma to be: 

**Inductive Hypothesis**:
> The distance label, $d(i)$ is valid for all $i\in N$ after the previous iterations of the while loop of the algorithm. 

**Proof**: 

Let's be in case (1.) for Lemma 7.5, no modification is being made when augmenting one of the $s-t$ paths. Assume that one of the arc: $(i, j^+)$ is saturated and removed from the graph, then $A(i)$, or the `nghs[i]` set in the code, is now one element less, meaning that it's a proper subset of previous iteration. By inductive hypothesis we have: $d(i) \le \min_{j\in A(i)}\{d(j) + 1\}$, by reducing the set $A(i)$ into $A(i)\setminus \{j^+\}$, the same condition hold, therefore, the label $d(i)$, is still, a valid label. 

In (2), retreated is needed because for the current node $i\in N$ we have: $d(i) < d(j) + 1$ for all $j\in A(i)$, then an update on node $i$, denoted as $d'(i)$ of $d'(j):= \min_{j\in A(i)}\{d(i) + 1\}$, which by definiton, $d'(i)$ is still less than or equal to all the $d(j)$ for $j\in A(i)$. Under both cases, the distance label for any arcs $(i, j) \in A$ has $d(i) \le d(j) + 1$. Therefore, Lemma 7.5 had been proved. 


**References:**

Professor's Hare's class at UBCO, and the Network Algorithms Textbook, chapter 7. 



---
### **Preflow Push**

The algorithm send everything at first, and then slowly adjust the flow such that all the vertices again have the correct mass balance constraints equals to zero again. 

**Basic Quantities**: 
