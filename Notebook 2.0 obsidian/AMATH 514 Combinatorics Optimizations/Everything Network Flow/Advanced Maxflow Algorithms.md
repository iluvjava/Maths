[[Maxflow Min Cut, Ford Fulkerson]]

---
### **Intro**

We introduce some advanced algorithms for solving maxflow min cut. These algorithms are strongly polynomials. They exploit the network topology of the graph, so that the complexity is no longer tied to the capacity of the network. 

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

**Basic Quantities**: 
- $d^{(k)}(j)$ denotes the distance needed to go from $j$ to $t$ using the least number of arcs, on after the $k$ th augmenting path operations on the graph. 
- $L^k(l)$ is the level set assignment from the BFS for the node $l$, after the $k$ th iterations of the augmenting path algorithm. 

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

The major idea that it exploit is the idea of *Maximum Capacity Augmening Path*. It identified the issues with the usual Forward Fulkerson, and addresses by excluding paths that have small capacities. This is a general heuristic because it can be mixed with other type of augmenting path method for max flow together to improve the complexity of other algorithms. 

**Basic Quantities**
- `res(G, delta, f)`, denotes the delta residual graph for a given flow, in the code. 
- `U`, $U$ denotes the maximum capacity for all the arcs in the code, and the graph. $U = \max_{a\in A}u_a$. 

**Definition: Delta Residual Graph**: 
> Let $x^\circ$ be a feasible flow, $\delta \ge 0$, then $G(x^\circ, \Delta)$ is subgraph of the residual graph obtained by deleting all arcs with a capacity that is less than $\Delta$. 

**Methods: Capacity Scaling Via Binary Search**
Let $G = (A, N)$. $s, t$ are the source and the sink nodes for the graph. 

```SQL
f = EVAL('zero flow for the initial graph')
delta = 2^(floor(U))
WHILE delta >= 1 : 
    WHILE res(G, delta, f) EVAL('contains an augmenting graph'):
        EVAL('Perform the Ford Fulkerson algorithm')
    delta /= 2

```

**Theorem: Maximum Cut Capacity**: 

**Theorem: Complexity**



---
### **Shortest path with Retreats and Advances (Dinic's Algorithm)**

The algorithm keeps a label of distance for node. $d(j)$ now represent the minimum number of arcs needed to travel from the current node $j$ to the dstination node t. It's just Edmond Karp's algorithm, but improved. It improved it by memorizing the labels from the BFS, and when a augmenting path is identified, one of the arcs on the shortest path is removed, causing a restructuring of the BFS level tree. This is accomplished via the use of a valid distance label: $d(i)$ on each of the node. 

**Basic Quantities and their Meaning**: 
- $d(t) = 0$, the distance is called a *valid label* when $d(i)\le d(j) + 1 \;\forall (i, j)\in A$, for every arcs in $(i,j)\in A$. This is a distance label denoting the expected least number of arcs require to travels from node $j$ to $t$. When $d(s)\ge n$, there is no path going from $s$ to $t$. 
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

The retreat subroutine is only called whenever there is no adimmissible arcs coming out of the vertex $i$. 

```SQL
/*Changes the distance to allow for more admissible arcs for the augpaths. */
FUNCTION retreat(i, G=(A, N)): 
    nlb = d(i)  /*value for the new label */ 
    FOR ALL j IN nghs(i): 
        nlb = min(nlb, d(j) + 1)
    RETURN nlb
```

**Subroutine: Initializations**

At the start of the algorithm, we label all the nodes using a reverse search from $t$ to $S$, and $d(j)$ will be the level sets of BFS for all the vertices. 

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
                EVAL('Perform aug path and get the new residual graph, make it G')
        ELSE: 
            d(i) = retreat(i)
            i = EVAL('Find predecessor of i in $augpth, and change $augpth accordingly')
```


**Lemma 7.5**: 

> The shortest augmenting path algorithm maintains valid distance labels at each step. Moreover, each relabel (or, retreat) operation strictly increases the distance label of a node.

**Proof**: 

To show, we need to consider whether the distance labels are still valid after: 
1. An augmentation by a correctly identified augmenting path, at least one of the arcs were deleted from the admissible paths on the graph. 
2. A retreat operation. 

We won't need to check the advance operations because there is no modifying the capacities on the residual graph. Let's make inductive hypothesis for the lemma to be: 

**Valid Labels Inductive Hypothesis**:
> The distance label, $d(i)$ is valid for all $i\in N$ after the previous iterations of the while loop of the algorithm. 

Let's be in case (1.) for Lemma 7.5, no modification is being made when augmenting one of the $s-t$ paths. Assume that one of the arc: $(i, j^+)$ is saturated and removed from the graph, then $A(i)$, or the `nghs[i]` set in the code, is now one element less, meaning that it's a proper subset of previous iteration. By inductive hypothesis we have: $d(i) \le \min_{j\in A(i)}\{d(j) + 1\}$, by reducing the set $A(i)$ into $A(i)\setminus \{j^+\}$, the same condition hold, therefore, the label $d(i)$, is still, a valid label. 

In (2), retreated is needed because for the current node $i\in N$ we have: $d(i) < d(j) + 1$ for all $j\in A(i)$, then an update on node $i$, denoted as $d'(i)$ of $d'(j):= \min_{j\in A(i)}\{d(i) + 1\}$, which by definition, $d'(i)$ is still less than or equal to all the $d(j)$ for $j\in A(i)$. Under both cases, the distance label for any arcs $(i, j) \in A$ has $d(i) \le d(j) + 1$. Therefore, Lemma 7.5 had been proved. 

**Claim:** 
> The algorithm terminates and when it does, the maximal flow is identified. 

**Proof**

The algorithm terminates because the label for $s$ has an upper bound. It's impossible to increment $d(i), i\neq s$ without any upper bound, therefore, at some point $d(s) > n$, meaning that there is no path from $s$ to $t$ on the residual graph, so the optimality conditions are satisfied. 

**Complexity**: 
> The algorithm runs for $\mathcal O(mn^2)$, faster than Edmond's Karp. 



#### **Blocking Flows and Dinic's Algorithm**

Some modifications can be to the above algorithm and show its equivalency to another algorithm, called the Dinic's algorithm for Maximum Flows. A *layered network* refers to a BFS performed on the graph where, each node is labeled with the distance from $i$, the node, to the destination $t$, in terms of the number of arcs needed. For more information about this variation, see [[Dinic's Algorithm]] for more details. 


**References:**

Professor's Hare's class at UBCO, and the Network Algorithms Textbook, chapter 7.4, and 7.5. 

---
### **Generic Preflow Push**

The algorithm sends everything at first it then adjusts the flow to maintain correct excess label. They are the active nodes. We introduce the generic Preflow push algorithm for context, preparing for the full FIFO preflow push algorithm. Intuitively, the algorithm push out the maximum amount of flow using all out-going arcs of $s$, and then it adjusts the excess. Each time the excess is adjusted, it create more excess for all nodes in the graph. But since excess for the node $s, t$, the since and source can never be created, the algorithm will terminate with all excess zero on nodes $i\in N \setminus \{s, t\}$, creating a flow. It remains to be show that the flow is the maximum flow. 

**Basic Quantities/Definitions**: 
- The label $d(i)$ is the exepcted distance from node $i\in N$ to the node $t$ in number of arcs. It's valid when $d(i) = d(j) + 1$ for all $(i, j)\in A$. 
- An arc $(i, j)\in A$ , is *admissible* when $d(i) = d(j) + 1$, and the residual capacity $r_{i, j}$ is $> 0$. 
- The label excess, $e(i)\ge 0$ is created for all $N\setminus \{s, t\}$, it's a always a positive quantities denoting the amount of extra flow created on each node. The excess means there is more flow into the node than outof it. 
- The node, $i$ is active whenever $e(i) > 0$, else it's inactive. The $s, t$ node were never active. 
- $f: A \mapsto \R_+$  is a flow labeling function for all the arcs on the graph. It's anti-symmetric and strictly positive. 
- Denote `nghs(i)` as the out-neighbours of the current node $i$ in the code, and in the math we use the notation $A(i)$ for that. 
- `u`, $u$ is the capacity labels for each of the arc. 
- A *saturating push* refers to a node that becomes *inactive* after an application of the push relabel subroutine on the node. This happens whenever the excess of the node becomes zero after pushing and/or relabeling the node. 


**Algorithm Overview**: 

Subroutines and their descriptions: 
1. Preprecessing: This is for labeling the nodes with the correct distance label, and excess label before running the algorithm. 
2. push/relabel: Changing the excess of the node on the graph and shifting the flow arounds. 


**Subroutine: Preprocess**: 

The preprocess algorithm will constract a valid label for each of the nodes at the start of the algorithm. They make the distance labels, and the excess labels for each of the node. 

```SQL
FUNCTION preprocess(G=(A, N), s, t): 
    d = EVAL('Perform BFS to make valid distance label. ')
    FOR ALL j in nghs(s): 
        f(s, j) = u(s, j)
        e(j) = u(s, j)
```
**Subroutine: Push\Relabel**: 

The process gets rid of the excess for a specific node and adjust the $e, d$ label for that node. If there is some admissible arcs from the node $i$, then it will push the excess flow away from the node and adjust it, if not, it will increase its distance label to allow for more admissible arcs for the node $i\in N$. 

```SQL
FUNCTION pushRelabel(G=(A, N), i, s, t)
    IF EXISTS (i, nghs(i)) EVAL('Such that (i, nghs(i)) is an admissible arc'): 
        SELECT ANY j IN nghs(i) SUCH THAT (i, j) IS EVAL('An admissible arc'): 
            delta = min(e(i), r(i, j))
            IF NOT(j IS i OR j is T)
            EVAL('Adjust the excess of the node $j')
    ELSE: 
        REPLACE d(i) BY min(d(j) + 1) WHERE j IN nghs(i) 
```

**Algorithm: Generic Pre-Flow Push**: 

The algorithm just select any active node and then push the excess flow away. The selection of the active node is determined. 

```SQL
FUNCTION preflowPush(G=(A, N), s, t): 
    G = preprocess(G, s, t)
    WHILE EXISTS EVAL('Nodes that are active in $G'): 
        i = SELECT ANY i IN A WHERE EVAL('node i is an active node')
        pushRelabel(G, i, s, t)

```


**Example**: 
![](../../Assets/Prefow-push-example.jpeg)

Reading from left to right, top to bottom. When observing, keep noticing the monotone property of the distance label, this prevents the node from exchanging excessive flow repeatedly, hence, the algorithm terminates at some point at least. Observe that on the 4th image, the node $2\in N$ doesn't have any admissible arc due to the invalid distance label. Therefore, when pushing, a relabel occured for $d(2)$, allow the flow to goes to $d(3)$, the smallest distance label next to node $2$. If, the distance label were to increase beyond $2$, say $3$, then the flow will be directly sent back to node $1$, resulting in a flow that is suboptimal. 


#### **Correctness of the Algorithm**


**Complexity of the algorithm**
> A FIFO implementation of the Preflow push algorithm has a complexity of $\mathcal O(n^3)$. 


**Reference**: 
Chapter 7.6 of the Network Flow algorithm textbook. 

