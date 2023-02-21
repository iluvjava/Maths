- [[../../CSE 000 Basics Algorithms/Shortest Path Algorithms from a Source]], [[LP for Pairwise Shortest Paths]]

---
### **Intro**

This is an algorithm comes from the generic label correct algorithm, which aims at exploiting the dual optimality conditions for the shortest path problem, a gem that we got from the LP formulation of shortest path. It improve over the complexity of the generic label correcting algorithm. 

One important thing is that in here, we are keeping the assumptions made for the shortest path problem under the LP formulation, so that it's at least not unbounded. 

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

If the arc $(i, j)$ is not yet in the predecessor graph, then it satiefies $d(j) \ge d(i) + c(i, j)$, else, it is in the tree, then it's the case that $d(j) = d(i) + c(i, j)$ by the algorithm during a specific interation of the algorithm. In future iteration, if $d(j)$ is decreased then it still holds, when $d(i)$ is decreased then the arc $(i, j)$ will be removed from the predecessor graph, hence the claim would still hold. 


**Observations:**

- Similar to te generic search algorithm, an arc can be picked repeatedly from the list of arcs, and for each vertices $d(i)$, their distance label can be upated more than once. 
- Each time when an update is performed, the distance label $d(j)$ for each $d(j)$ must have improved! 
- Therefore, for each $d(j)$, there is a limit to how many times it's distance can be shrinked, the upper bound for $d(j)$ should be $nC$, the value of $d(j)$. Under the worst case, we look for a longest possible path to the lable $d(j)$, and then we correct the distance label for $d(j)$ as slow as possible by going over all possible paths leading to $d(j)$. At the worse case we decrease the value $nC$ (the theoretically longs path length) by a value of $1$ (the theoretically lowest capacity change by the integrality assumption on our graph). 


**Complexity**: 

Let $C$ be the maximum arc costs across all the arcs in the graph, then the complexity is $O(Cmn)$. This is directly conclude from the simple description of the algorithm, and the observtion on the theoretical upper bound for the initial distance label change of some vertex $d(j)$. 

---
### **Pathological Example**

The following pathological example is credit to our professor, Dovan Hare at UBCO, Spring Semester, 2023. 



---
### **Modified Label Correcting Algorithm**

It follows the exact same assumptions as the label-correcting algorithm, and the same set of variables. But this time it does things with order in it, and we specify the specific choices that are ambiguous in the fomer algorithm: 

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
### **FIFO Label Correcting Algorithm**

In the above modified label-correcting algorithm, we still have the choice of ordering when going over the set of all $(i, j)\in A$ to look for violation to the shortest path characterizations. And we make the following claim: 

> If we go over the list of edges in strict order everytime the while loop repeats itself, then the algorithm has a complexity of $\mathcal O(mn)$. 

**Lemma**: 
> If we go over the edges in a fixed order each time the while loop repeats itself, then on the $k$ th iteration of the algorithm, the label $d(i)$ will be the shortest distance for all path that goes from $s$ to $j$ with less than or equal to $k$ many arcs. 



