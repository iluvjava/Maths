- [[LP for Source Tree Shortest Paths]], [[../../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]]. 

---
### **Intro**

We go from the generic label correcting algorithm to some of the cool algorithms for singled shortest path for directed graphs with any weights. We discuss negative cycle detections as well. 

One important thing is that in here, we are keeping the assumptions made for the shortest path problem under the LP formulation, so that it's at least not unbounded. 

**References**: 

Chapter 5 of the Network flow, Algorithm and applications book. Some lecture notes from the internet [here](https://cs.yazd.ac.ir/hasheminezhad/STSCF13N3.pdf). 

**Generic Label Correcting algorithm**: 

Let $G=(V, A)$ be a directed graph satisfying the assumptions, let $d(s)$ be a distance label for each of the vertices in the graph, let $s$ be the source vertex, we denote $c(i, j)$ to be the costs of the arc $(i, j)\in A$. The following algorithm returns a predecessor graph, such that it's with the lowest total cost. 

```sql
d(s) := 0; pred(s) = 0;
d(j) := Inf, for all j in N\{s}; 
WHILE EVAL("there exists arc (i, j) such that d(j) > d(i) + c(i, j)")
	EVAL("Select any of that arcs. ")
    d(j) := d(j) + c(i, j)
    pre(j) := i; 
END
```

and this algorithm just correct the labels that doesn't satisfy the optimality conditions. 

**Invariants**: 

> For every predecessor graph created by the algorithm, the reduced costs introduce by the negative distance label $c^d_{i, j} = c_{i, j} + d(i) - d(j) \le 0$ for every arc $(i, j)\in A$. 

**Proof:**

If the arc $(i, j)$ is not yet in the predecessor graph, then it satisfied $d(j) \ge d(i) + c(i, j)$, else, it is in the tree, then it's the case that $d(j) = d(i) + c(i, j)$ by the algorithm during a specific iteration of the algorithm. In future iteration, if $d(j)$ (the predecessor of the node of interest: i) is decreased then it still holds, when $d(i)$ is decreased then the arc $(i, j)$ will be removed from the predecessor graph (in which case it goes back to the equality case), hence the claim would still hold. 

**Observations:**

- Similar to to the generic search algorithm, an arc can be picked repeatedly from the list of arcs, and for each vertices $d(i)$, their distance label can be updated more than once. 
- Each time when an update is performed, the distance label $d(j)$ for each $d(j)$ must have improved! 
- Therefore, for each $d(j)$, there is a limit to how many times its distance can be decreased, the upper bound for $d(j)$ should be $nC$, the value of $d(j)$. Under the worst case, we look for a longest possible path to the label $d(j)$, and then we correct the distance label for $d(j)$ as slow as possible by going over all possible paths leading to $d(j)$. At the worse case we decrease the value $nC$ (the theoretically longs path length) by a value of $1$ (the theoretically lowest capacity change by the integrality assumption on our graph). 

**Complexity | $\mathcal O(mn^2C)$**:

Let $C$ be the maximum arc capacity across all the arcs in the graph, then the complexity is $O(Cmn^2)$. See the discussion below for the pathological example for more information. 

$\mathcal O(m)$, time is required for looking for a specific `arc(i, j)` to update. Then, we use a fact that "The `d(i)` is decreased for at least a value of $1$", and since the most a label can be decreased is to $-nC$ from $nC$, and we have $n$ vertices. Doing all the decrease on $d(i)$ for all $n$ gives $n^2C$, and multiply that with the complexity of searching for a specific arc, we have $mn^2C$. 

**Theorem: Existence of Negative Cost Directed Cycles** 

> If the predecessor graph of the generic label-correcting algorithm contains a directed cycle, then the cycle has to be a negative cost cycle on the original graph. 

**Proof**: 

We use the invariant of the algorithm, and for simplicity and WLOG, we assume that $(1, 2), (2, 3)$ were already on the predecessor graph, and at the latest iteration of the algorithm, $(3, 1)$ is being added to the predecessor graph, then, using the invariant of the algorithm we have the conditions that: 

$$
\begin{aligned}
    d(2) &> d(1) + c_{1, 2}
    \\
    d(3) &> d(2) + c_{2, 3}
    \\
    d(1) &= d(3) + c_{3, 1}, 
\end{aligned}
$$

then if we substitute entries from the button to the top, we have the condition that: 

$$
\begin{aligned}
    d(1) &> d(2) + c_{2, 3} + c_{1, 2}
    \\
    d(1) &> d(1) + c_{1, 2} + c_{2, 3} + c_{1, 2}
    \\
    0 &> c_{1, 2} + c_{2, 3} + c_{1, 2}, 
\end{aligned}
$$

hence that cycle has a negative cost to it. It won't be zero because we only update the label $d(j)$ if $d(j) < d(i) + c_{i, j}$, which is a strict inequality. 

---
### **Pathological Examples**

Examples for exponential run time for the generic labeling algorithm. 

**Example 1**

The following pathological example is credit to our professor, Donavan Hare at UBCO, Spring Semester, 2023. The example demonstrates the exponential complexity of looking for a shortest path from a source using the generic label correcting algorithm without specifying the order of choosing the arcs. 

![[../../Assets/Pasted image 20230224004932.png]]
**Source:** UBCO, Prof Hare, 2023 Spring, Lecture slides. 

To get the worse update, always start with the longest path with sum over $2^n$ for all $0\le n \le 2^k$. Each time, shorten the destinations on the path by exactly one, giving us an exponential complexity (choosing the alternative of $2^1$ at the right most node). 

**Example 2**

![[../../Assets/Pasted image 20230313233556.png]]

**Source:** 
The network flow algorithm textbook. 

---
### **Modified Label Correcting Algorithm**

The modified version order the nodes using a list. We add all neighbors of any chosen node in the list, and then add those nodes back to the list. 

**Algorithm**

```sql
d(s) := 0; pred(s) := 0; 
d(j) := Inf, FOR ALL node j in (N\{S}); 
L := {s};    /* This is the list */
WHILE{ L IS NOT EMPTY }
    REMOVE i from L; /*As to what order, it's unspecified. */
    FOR EACH (i, j) in neighborhood(i):
        IF d(j) > d(i) + c(i, j):
            d(j) := d(j) + c(i, j); 
            pred(j) = i; 
            IF NOT (j in L):
                ADD j TO L;
            END
        END
    END
END
```

It can add the same vertex repeatedly (due to $j$'s label being updated by multiple of its neighbors), resulting in the same complexity class as the previous algorithm. It uses a generic search algorithm as the basis to locate a node first and then search for its neighbors. 

**Observations**

Suppose that during any step of the iteration, $j\in N$ has been updated due to condition $d(j) > d(i) + c_{i, j}$, then the new distance label $d'(j)$ gets strictly smaller, more specifically: $d'(j) < d(i) - 1$ due to the integrality assumptions for the graph. The distance labels for each of the vertices monotonically decreases. A node that has been removed can be added back to the $L$. 

**Complexities | $\mathcal O(mnC)$**

Compare to the generic algorithm, instead of scanning all the arcs and search for one that we want to update, which takes $\mathcal O(m)$, this algorithm only searches over the neighbors of $i$ from the $L$, inside of the while loop. This results in a total complexity: 

$$
\begin{aligned}
    \sum_{i \in N}^{}
    2nC|\text{ngh}(i)| \in \mathcal O(mnC), 
\end{aligned}
$$

we make use of the fact that each of the label only comes into $L$ if its predecessor has been updated. The algorithm terminates by the monotone labeling property. I don't know of any pathological instances of choose $i$'s neighbors that can illustrate the worst case runtime. 

---
### **Label Correcting Algorithm: Bellman Ford**

In the above modified label-correcting algorithm, we still have the choice of ordering when going over the set of all $(i, j)\in A$ to look for violation to the shortest path characterizations. A better strategies is to go over all the arcs at least once per "pass" to establish the shortest path. Doing this allows for a cooler proof that can construct the optimal path faster. 

**Algorithm**: 

```SQL
d(j) = Inf, FOR ALL j != s; 
d(s) = 0; 
FOR k = 1, ... , (n - 1): 
	FOR ALL arc(i, j) IN A:  /*Odering of the arcs is not specified*/
		d(i) := min(d(i), d(j) + c(i, j)) /*The shortest path dist label is mutable */
	
```

**Algorithm with Predecessor Tree**: 
```SQL 
d(j) = inf, FOR ALL j != s; 
d(s) = 0; 
pred(j) = NULL FOR ALL j in N
FOR k = 1,... , (n-1): 
	FOR ALL arc(i, j) IN A: /*Again, in no particular order*/
		if d(j) > d(i) + c(i, j): /*We refer to this step as: "relaxations"*/
            pred(j) = i
            d(j) = d(i) + c(i, j)
```

**Observations**

Since the ordering of going over all the arcs is not specified, let's consider the case where the whole graph is just one path, $v_1, v_2, \cdots, v_n$, and we choose the arcs in the ordering of $(v_1,v_2), (v_2, v_3), \cdots, (v_{n - 1}, v_n)$, then the shortest path for all the vertices is updated in a single pass. If the ordering of the vertices are in reverse, then we would need $n-1$ passes to update all the labels correctly. Consequently, if all the arc has a cost of $1$, then  a BFS from the source is, one pass of Bellman Ford that establishes all the shortest path label in one pass. Even worse, if we know in advance what the predecessor tree is, we can just take the arcs from the predecessor tree to establish the shortest path in one iteration of Bellman Ford.

Observe the according to algorithm, the update causes the labels of the nodes  decreases monotonically (not necessarily strictly) after each passing of the while loop. A proof is probably gonna assume the structure of the predecessor tree before the while loop update and then see how it's being updated. 

**Quantities and Notations for the Proof**: 
1. $d(i)$ denotes the optimal path length going from $s$ to $i$. 
2. $l(i)$ denotes the label made by the Bellman Ford algorithm during execution of the algorithm. 


**Theorem: $n-1$ Number of Iterations**: 
> The algorithm can find all optimal labels at the end of $n-1$ iterations, if not there has to exist one negative cost cycles on the graph. This produces an over all complexity of $\mathcal O(mn)$. 

**Proofs**: 

We introduce an inductive hypothesis and a lemma. We will make use of the optimality path characterizations to prove things. 

**Lemma 1: When Relaxations Stops**
> It's always the case that $l(i) \ge d(i)$, if $l(i) = d(i)$, then it won't change for the future iterations of the algorithm assuming that there is no negative cost cycles on the graph. 

**Proof**: 

Since there is no negative cycles, we have $d(s) = 0$, and this is satisfied at the start of the algorithm with $d(s):= 0$ at the start of the algorithm. Further more, we have $d(i) = \infty$ for all $i\neq s$, which is the largest value possible. The because is true. 

Inductively, after the $k$ th relaxations on node $i$ and the $K$ th iterations of the outer while loop , we have $l(i) \ge d(i)$. Then: 

$$
\begin{aligned}
    l(i) &:= l(i') + c_{i', i}, 
    \\
    l(i) &\ge d(i') + c_{i', i} \text{ by } l(i') \ge d(i')
    \\
    l(i) &\ge d(i) \text{ by } d(i) = d(i') + c_{i', i}, \text{ By path optimaity condition}. 
\end{aligned}
$$

The value $l(i) < d(i)$ is impossible, we didn't use the fact that no-negative cycle explicitly, it's used for the proof for the optimality path condition. If we ever have $d(i) = l(i)$, then for all $i'$ we have $d(i) \le d(i') + c_{i', i}$, by $d(i') \le l(i')$, we have $d(i) \le l(i')$ hence $l(i)\le l(i') + c_{i', i}$, the relaxation was never performed because the if state were never true. 

**Inductive Hypothesis: Bellman Ford Relaxations**
> WLOG Let $s-1-2- \cdots -k-\cdots -n$  be the actual shortest path from $s$ to $n$ with a length of $n$. Assuming that $l(i) = d(i)$ is optimal all the way up to $k$ (we can make this assumption), then after another iteration of the Bellman Ford, we at least have $l(k + 1) = d(k + 1)$, at worst. 

**Proof**: 

*Assuming that*: We finished the $K$ th iterations of the algorithm, and we are executing the $K + 1$ th iterations of the algorithm. 

By optimality of $l(i) \; \forall i = 1, \cdots, k$, the label is not changed (By Lemma), during the $K + 1$ th iteration of the algorithm. The arc $(k, k + 1)$ exists on the graph and it will be exam (By Bellman Ford). Since $l(k) = d(k)$ is optimal, we have $d(j) \ge l(k) + c_{k, j}\;\forall j$ (By Path Optimality), substituting $j = k + 1$, we have 2 possibilities: 

1. Relaxation is not triggered, then we have $l(k + 1) = l(k) + c_{k, k + 1} = d(k + 1)$, by optimality of $l(k)$, the distance label is already optimal, perhaps the optimal path is non-unique, or perhaps the ordering of the arcs has already establish optimality beyond the first $k + 1$ nodes in this path. By the lemma, this label won't change any more in the future iteration and it's optimal. 
2. If an update is performed with $l(k + 1) = l(k) + c_{k, k + 1}$, then the label is optimal by the optimality conditions of shortest path. 

Under both cases, the label $l(k + 1)$ is optimal. The induction hypothesis holds true. 

**Consideration of the Base case**: 

We can make this assumption because at the start of the algorithm, for any $v_n$ in the graph such that its shortest path is $s, v_1, v_2, \cdots, v_n$, we have $d(s) = l(s) = 0$ being optimal, and the arc $(s, v_1)$ is relaxed. By optimality condition, the sub path $s- v_1$ is optimal, and hence a relaxation of the arc $(s, v_1)$ will establish the label $l(v_1) = d(v_1)$ and this is not going to change for future iteration of the algorithm. 

**Proof of the Theorem**

By the inductive hypothesis we know that, at least, the first $k$ nodes in the optimal path from $s$ to any vertices is optimal after the $k$ th iteration. Since there are no s-t paths longer than $n-1$ vertices (by property of path and the fact that we don't have negative cycles), the algorithm must stop updating all the labels after $n-1$ iterations, in the worst case. 


**References:** 

See [here](https://people.csail.mit.edu/alinush/6.006-spring-2014/mit-fall-2010-bellman-ford.pdf) for a best proof for Bellman Ford that I found on the internet so far. Feels ad hoc but it works I guess. 

---
### **Negative Cycle Checking**

We check the cycles on the predecessor graph constructed by the algorithm at regular interval while the algorithm had been running. Here is how we check it: 

**Predecessor Tree Check**: 

> Start with the root node, changed its state to marked. For every unmarked node: $v$, trace back until it meet a marked node, during each time, check every node on when tracing back is $v$ itself, if its is, then it contains a cycle, all aren',t then label all node on this path as marked. 

We take it for granted that this cycle on the predecessor graph has to be caused a negative weight cycle. This algorithm should take $\mathcal O(n)$ when the graph doesn't contain any negative cycles in it. 

**Bellman Ford Negative Cycles Detections**: 

For the Modified Generic Labeling algorithm, we can just perform it more than $n - 1$ iteration, if there is an update on the $n$ th iteration, then the node with the weight changed on $n$ th iteration must be on a negative cycle. 


---
### **FIFO Labeling Algorithm | $\mathcal O(mn)$**

The FIFO labeling algorithm by checking a subset of the arcs based on the previously updated nodes. It avoids updating on labels on the nodes such that the label is already optimal. This algorithm is slightly faster than Bellman Ford algorithm. 

**Algorithm Pseudo Code**: 

Let `s` to be the source node, the following algorithm constructs the least costs predecessor tree and the correct distance labels for all the nodes. 

```sql
d(s) = 0, pred(s) = 0;  
d(j) = Inf, FOEALL i != s;
q1 = {s}; /* nodes whose distance label had been updated */
itr = 0;
WHILE q1 NOT EMPTY && itr++ < |N|
    q1_next = {}
    FOR i IN q1
        FOREACH j IN A(i) in INCREASING ORDER OF j
            IF d(j) > d(i) + c(i, j)
                d(j) := d(i) + c(i, j);
                pred(j) := i;
                    IF j NOT IN q_next
                        ADD j to q_next;
        q1 = q1_next;

```

**Observations**: 

This algorithm only update $d(j)$ when the incoming arcs of node $j$ corresponds to some $i$ whose label has been updated from the last iteration. Each inner loop only update for at most $\mathcal O(m)$ update (because we only check all the neighbors for a subset set of vertices in the graph). The outer most loop loops $\mathcal O(n)$ times. Therefore, the total complexity is $\mathcal O(mn)$. 

The algorithm is equivalent to the Generic label correcting algorithm where, $L$ is a queue and we always dequeue from the from and add the nodes with changed labels back to the tail of the queue. Whenever it's empty, then the algorithm can terminates and returns the optimal labels for each node. The 2 queues implementation is for better "book keeping". 

**Theorem: Correctness**: 

> The FIFO label correcting algorithm executes for at most $n-1$ iterations, and that is enough to find all the correct distances labels on the graph if there is no negative cost cycles. 

We first establishes some notations, and quantities for the proof before we start proving it. The proof is long. 

**Basic Quantities**:
1. $c$: is the costs assignment function for paths. 
2. $\Pi(j, k)$: Set of s-j paths with at most k arcs. 
3. $d^k(j) = \min\{c(P)| P\in \Pi(j, k)\}$, and if the set is empty, we have $d^{k}(j) = \infty$. This denote the shortest $s-j$ path costs for all paths using at most $k$ arcs. 
4. $l^k(j)$ is the label for the node $j$ at iteration $k$. 
5. The operator $\oplus$ is for concatenting paths that are representing a list of arcs, or nodes in the path. 

**Inductive Hypothesis**: 
> For all nodes $j\in N$, we have $l^k(j) = d^k(j)$ at the k th iteration of the outter most while loop of the FIFO label correcting algorithm. Denote this hypothesis as $\mathbb H(k)$. 

**Proof of the Base Case**: 

Under the base case, by the algorithm, it only labels the out-going neighbours of the source node with the length of the arcs: 

$$
\begin{aligned}
    l^1(j) = \begin{cases}
        \infty & (s, j)\not\in A
        \\
        c_{s, j} & \text{else}
    \end{cases}, \text{ but } 
    d^1(j) = 
    \begin{cases}
        \infty & (s, j) \not\in A
        \\
        c_{s,j} & \text{else} 
    \end{cases} \; \text{ by definition}. 
\end{aligned}
$$

Therefore, we established the base case. 

**Inductively**: 

Let's assume that $\mathbb H(k)$ is true, meaning that $l^k(j) = d^k(j)$ for all $j\in N$. What we want to show is that: 

> Let $P^* \in \Pi(j, k + 1)$ such that $c(P^*) = d^{k + 1}(j)$ and there does't exist $Q\in \Pi(j, k)$ with $c(Q) = d^{k + 1}(j)$. In brief, the optimal path is of length exactly $k + 1$ number of arcs. 

Assume that $P^* = [i_0, i_1, i_2, \cdots, i_k, i_{k + 1}]$ where $i_0 = s, i_{k + 1} = j$. Let $R\in \Pi(i_k, k)$ then $c(R)\ge d^k(i_k)$, by the optimality of $d^k(i_k)$ and by the fact that $P^*$ is a path, $R$ contains $k$ arcs. It must not be the case that $c(R)> d^k(i_k)$, hence $c(R) = d^k(i_k)$, we show this next by a contraction. 

$c(R) > d^k(i_k)\implies \exists R^*\in \Pi(k, i_k): c(R^*) = d^k(i_k)$. Because $R$ is obviously, not optimal. $R^* \oplus j$ produces a walk, it has at most $k + 1$ number of arcs. Removing redundant cycles in $R^*\oplus j$ walk yields $U$ which is an $s-j$ path, with less costs by non-existence of negative costs cycles. $U\in \Pi(s, k)$ obviously. Mathematically: 

$$
\begin{aligned}
    & c(U) \le c(R^*\oplus j) = c(R^*) + c_{i_k, j}
    \\
    \implies & 
    c(P^*) = d^{k + 1}(j) \le c(U) \le c(R^*) + c_{i_k, j} = d^k(i_k) + c_{i_k, j} < c(R) + c_{i_k, j} = c(P^*)
    \\
    \implies 
    & c(P^*) < c(P^*), \text{ and we have FTL travel. ⚡} 
\end{aligned}
$$

Therefore, it has to be $c(R) = d^k(i_k)$. The subpath of optimal path $P^*$ is "k-arcs" optimal. By inductive hypothesis $\mathbb H(k)$: 

$$
\begin{aligned}
    & c(R) = d^k(i_k) = l(i_k)
    \\
    \implies & 
    d^{k + 1}(j) = c(P^*) = c(P^*) + c_{i_k, j} = l^k(i_k) + c_{i_k, j}, 
\end{aligned}
$$

where on the last line, we showed that the shortest distance of all $s-j$ path that uses at most $k + 1$ number of arcs can be updated from the previous label on vertex $j$. The algorithm does: 
1. $l^k(j) > l^k(i_k) + c_{i_k, j}$, algorithm performs an update. 
2. $l^k(j) = d^k(i_k) + c_{i_k, j}$, there is no update for $j$ by the algorithm. 

In case (1), we have: $l^{k + 1}(j) = l^k(j) + c_{i_k, j} = d^{k + 1}(j)$, hence $l^{k + 1}(j)$ becomes optimal, $\mathbb H(k + 1)$ is true. In case (2), it means there exists $Q\in \Pi(j, k)$ such that $c(Q) = d^k(j) = l^k(j) = l^k(i_k) + c_{i_k, j} = d^{k + 1}(j)$, there doesn't exist a path $P^*$ of exact $k + 1$ many arcs such that it's shorter. Algorithm doesn't update. Then there exists path $Q\in \Pi(s,j)$ such that $c(Q) = d^k(j) = l^k(j) = l^k(i_k) + c_{i_k, j} = d^{k +1}(j)$, an path uses at most $k$ arcs remains optimal. Therefore, if no update is performed, no arcs are missed by the algorithm. $\mathbb H(k + 1)$ holds for this case too. 

When $\Pi(j, k + 1) = \emptyset$, it has the same logic as the base case, no paths are missed by the algorithm. Finally, Inductive hypothesis $\mathbb H(k)\implies \mathbb H(k + 1)$. The proof is now completed. 


**References**: 

Personal message with Prof Donavan Hare, at UBCO, 2023 spring. 


---
### **A Summarizations of Label Correcting Complexity**
- Generic Label Correcting: $O(mn^2C)$
- BFS Modified Label Correcting: $O(mnC)$
- Bellmand Ford, FIFO Label correcting: $O(mn)$


