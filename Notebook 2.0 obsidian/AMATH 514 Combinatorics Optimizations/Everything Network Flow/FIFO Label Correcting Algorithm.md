- [[LP for Source Tree Shortest Paths]]

---
### **Intro**

This is an algorithm comes from the generic label correct algorithm, which aims at exploiting the dual optimality conditions for the shortest path problem, a gem that we got from the LP formulation of shortest path. It improve over the complexity of the generic label correcting algorithm. This algorithm derived is exactly the same as the Bellman Ford algorithm. 

One important thing is that in here, we are keeping the assumptions made for the shortest path problem under the LP formulation, so that it's at least not unbounded. 

**References**: Chapter 5 of the Network flow, Algorithm and applications book. 

**Generic Label Correcting algorithm**: 

Let $G=(V, A)$ be a directed graph satisfying the assumptions, let $d(s)$ be a distance label for each of the vertices in the graph, let $s$ be the source vertex, we denote $c(i, j)$ to be the costs of the arc $(i, j)\in A$. The following algorithm returns a predecessor graph, such that it's with the lowest total cost. 

```sql
d(s) := 0; pred(s) = 0;
d(j) := Inf, for all j in N\{s}; 
WHILE{ there exists arc (i, j) such that d(j) > d(i) + c(i, j) }
    d(j) := d(j) + c(i, j)
    pre(j) := i; 
END
```

and this algorithm just correct the labels that doesn't satisfy the optimality conditions. 

**Invariants**: 

> For every predecessor graph created by the algorithm, the reduced costs introduce by the negative distance label $c^d_{i, j} = c_{i, j} + d(i) - d(j) \le 0$ for every arc $(i, j)\in A$. 
>
**Proof:**

If the arc $(i, j)$ is not yet in the predecessor graph, then it satisfied $d(j) \ge d(i) + c(i, j)$, else, it is in the tree, then it's the case that $d(j) = d(i) + c(i, j)$ by the algorithm during a specific iteration of the algorithm. In future iteration, if $d(j)$ (the predecessor of the node of interest: i) is decreased then it still holds, when $d(i)$ is decreased then the arc $(i, j)$ will be removed from the predecessor graph (in which case it goes back to the equality case), hence the claim would still hold. 


**Observations:**

- Similar to to the generic search algorithm, an arc can be picked repeatedly from the list of arcs, and for each vertices $d(i)$, their distance label can be updated more than once. 
- Each time when an update is performed, the distance label $d(j)$ for each $d(j)$ must have improved! 
- Therefore, for each $d(j)$, there is a limit to how many times its distance can be decreased, the upper bound for $d(j)$ should be $nC$, the value of $d(j)$. Under the worst case, we look for a longest possible path to the label $d(j)$, and then we correct the distance label for $d(j)$ as slow as possible by going over all possible paths leading to $d(j)$. At the worse case we decrease the value $nC$ (the theoretically longs path length) by a value of $1$ (the theoretically lowest capacity change by the integrality assumption on our graph). 

**Complexity**: 

Let $C$ be the maximum arc costs across all the arcs in the graph, then the complexity is $O(Cmn)$. This is directly conclude from the simple description of the algorithm, and the observation on the theoretical upper bound for the initial distance label change of some vertex $d(j)$. 

**Theorem: Existence of Negative Cost Directed Cycles** 

> If the predecessor graph of the generic label-correcting algorithm contains a directed cycle, then the cycle has to be a negative cost cycle on the original graph. 

**Proof**: 

We use the invariant of the algorithm, and for simplicity and WLOG, we assume that $(1, 2), (2, 3)$ were already on the predecessor graph, and at the latest ieration of the algorithm, $(3, 1)$ is being added to the predecessor graph, then, using the invariant of the algorithm we have the conditions that: 

$$
\begin{aligned}
    d(2) &\ge d(1) + c_{1, 2}
    \\
    d(3) &\ge d(2) + c_{2, 3}
    \\
    d(1) &= d(3) + c_{3, 1}, 
\end{aligned}
$$

then if we substitute entries from the button to the top, we have the condition that: 

$$
\begin{aligned}
    d(1) &\ge d(2) + c_{2, 3} + c_{1, 2}
    \\
    d(1) &\ge d(1) + c_{1, 2} + c_{2, 3} + c_{1, 2}
    \\
    0 &\ge c_{1, 2} + c_{2, 3} + c_{1, 2}, 
\end{aligned}
$$

hence that cycle has a negative cost to it, (or zero...?). 


---
### **Pathological Example**

The following pathological example is credit to our professor, Dovan Hare at UBCO, Spring Semester, 2023. The example demonstrates the exponential complexity of looking for a shortest path from a source using the generic label correcting algorithm without specifying the order of choosing the arcs. 

![[../../Assets/Pasted image 20230224004932.png]]
**Source:** UBCO, Prof Hare, 2023 Spring, Lecture slides. 

To get the worse update, always start with the longest path with sum over $2^n$ for all $0\le n \le 2^k$. Each time, shorten the destinations on the path by exactly one, giving us an exponential complexity (choosing the alternative of $2^1$ at the right most node). 

---
### **Modified Label Correcting Algorithm**

It follows the exact same assumptions as the label-correcting algorithm, and the same set of variables. But this time it does things with order in it, and we specify the specific choices that are ambiguous in the former algorithm: 

```sql
d(s) := 0; pred(s) := 0; 
d(j) := Inf, FOR ALL node j in (N\{S}); 
L := {s};    /* This is the list */
WHILE{ L IS NOT EMPTY }
    REMOVE i from L;
    FOR EACH {(i, j) in neighborhood(i)} DO
        IF d(j) > d(i) + c(i, j)
            d(j) := d(j) + c(i, j); 
            pred(j) = i; 
            IF NOT (j in L)
                L := L UNION {j};
            END
        END
    END
END
```

This algorithm is breed of the generic search algorithm and the previous generic label correcting algorithm. It can add the same vertex repeatedly, resulting in the same complexity class as the previous algorithm. In comparison it's just more implementation friendly. 

---
### **Modified Generic Correcting Algorithm | Bellman Ford**

In the above modified label-correcting algorithm, we still have the choice of ordering when going over the set of all $(i, j)\in A$ to look for violation to the shortest path characterizations. And we make the following claim: 

> If we go over the list of edges in strict order every time the while loop repeats itself, then the algorithm has a complexity of $\mathcal O(mn)$. 

To show that, we need to show that the algorithm goes over exactly $n - 1$ passes for the set of arcs, $m$ of them. 

**Lemma**: 
> If we go over the edges in a fixed order each time the while loop repeats itself, then on the $k$ th iteration of the algorithm, the label $d(i)$ will be the shortest distance for all path that goes from $s$ to $j$ with less than or equal to $k$ many arcs. 

**Proof of the Lemma**:

We define the base case to be $d^{(0)}(j) = \infty$  when $j\neq s$, and then let $d^{(0)}(s) = 0$. The base case is the first execution of the algorithm. The while loop go over all the edges in order, it will upate all $d^{(1)}(j)$ such that $(s, j)\in A$, and this is exactly all the possible path that using one arc or less that goes from $s$ to $j$. 

Inductively let's assume that the while loop at the $k$ th iteration establishes $d^{(k)}(j)$ as: 
> "$d^{(k)}(j)$ denotes the cost of the shortest $s-j$ path that uses less than or equal to $j$ many arcs." 

Suppose that the while loop is executing, fixed any $(i, j)\in A$, then there are 2 cases here: 
1. The distance for $d^{(k + 1)}(j)$ is being updated to $d^{(k + 1)}(j) = c_{i, j} + d^{(k)}(i)$. 
2. The distance is $d^{(k + 1)}(j) := d^{(k)}(j)$, not being updated yet. 

If, there is an least cost path that goes from $i$ to $j$ with exactly $k + 1$ many arcs, then it can be decompose into a $s-i'$ path with exactly $k$ arcs, and an arc $(i' ,j)$, the $s-i'$ arc will be optimal and hence the edge $(i', j)$ will update by the while loop because the loop go over all the arcs, by the optimality condition $d^{(k + 1)}(j)$ will also be optimal. 

Else, there doesn't exist a path with a shorter cost such that it uses exactly $k + 1$ arcs, hence the least cost path still uses less than or equal to $k$ arcs, and in this case, $d^{(k + 1)}(j) = d^{(k)}(j)$ which is direct. 

**Note:**

The edge case where there doesn't exist any path from $s$ to $k$ had been coded into the algorithm through the numerical value $\infty$ of the distance label.  

**Proof of the theorem**

The longest path in the algorithm cannot use more than $n - 1$ arcs because a path has no repeating vertices, therefore, $d^{(n-1)}(j)$ has to be optimal for all $j\in N$ using the lemma. And hence the algorithm produce the optimal label after $n - 1$ iterations of the while loop, each while loop go over $m$ many arcs and setup the optimal condition using $\mathcal O(1)$, therefore the total complexity for the algorithm is $\mathcal O(mn)$. 

**The Bellman Ford Algorithm**

```SQL
d(0, j) = Inf, FOR ALL j != s;
d(0, s) = 0; 
FOR k = 1 ... (n - 1)
    FOR 1 <= i < j <= n
        d(k, j) = min(d(k - 1, j), d(k - 1, i) + c(i, j))
    END
END
```
**Complexities**

The outter forloops excutes for $n$ times while the inner for loop executes for $n^2$, this gives a total of $\mathcal O(n^3)$ complexity in total. 

**Remarks**
And this will construct the optimal label. We can get the predecessor tree afterwards by checking for the tight dual constraints. Or we can choose to get the predecessor tree in the while loop, but that would give us some extra if statements to work with. 

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

The FIFO labeling algorithm by checking a subset of the arcs based on the previously updated nodes. This algorithm is an improvement from the Bellmand Ford algorithm as it improves the algorithm runtime when the graph is sparse, meaning that $m \not \in \mathcal O(n^2)$. 

**Algorithm Psuedo Code**: 

Let `s` to be the source nde, the following algorithm constructs the least costs predecessor tree and the correct distance labels for all the nodes. 

```sql
d(s) = 0, pred(s) = 0;  
d(j) = Inf, FOEALL i != s;
q1 = {s}; /* nodes whose distance lable had been updated */
itr = 0;
WHILE q1 NOT EMPTY && itr++ < |N|
    q1_next = {}
    FOR i IN q1
        FOREACH (i, j) IN A(i) in INCREASING ORDER OF j
            IF d(j) > d(i) + c(i, j)
                d(j) := d(i) + c(i, j);
                pred(j) := i;
                    IF j NOT IN q_next
                        ADD j to q_next;
        q1 = q1_next;

```

This algorithm only update $d(j)$ when the incoming arcs of node $j$ corresponds to some $i$ whose label has been updated from the last iteration. Each inner loop only update for at most $\mathcal O(m)$ update (because we only check all the neighbours for a subset set of verticies in the graph). The outter most loop loops $\mathcal O(n)$ times. Therefore, the total complexity is $\mathcal O(mn)$. We made the assumption that the algoithm will produce the correct solution after at most $n - 1$ iteration. 