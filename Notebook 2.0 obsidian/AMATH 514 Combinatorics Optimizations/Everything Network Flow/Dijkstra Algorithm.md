[[../../CSE 000 Basics Algorithms/Generic Search Algorithm]], [[../../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]]

---
### **Intro**

We state the algorithm first and then show its correctness. The list of assumptions are the same from the shortest path characterizations We prove that the algorithm is correct and discuss their complexities. 

**Assumptions:**
- Directed graph. 
- No negative arcs. 

**Algorithm**

Given a graph $G = (A, N)$ and a source node $s\in N$, the Dijkstra algorithm looks for the shortest path from $s$ to every other vertices, it solves the single source shortest path problem when all the arc have a positive cost to it. Denote: 
1. `d(.)` denotes the shortest distance to all the nodes, 
2. `ngh(.)` denotes the out-neighbours of some vertices, 
3. `c(i, j)` the costs of some arcs.  

**Algorithm Psuedocode**
```SQL
optimal_set := {};
suboptimal_set := N;
d(i) := Inf FORALL i IN N;
d(s) := 0; 
pred(s) := 0; 

WHILE size(optimal_set) != |N|: 
    i := SELECT i FROM suboptimal_set WHERE d(i) IS MIN;
    optimal_set := optimal_set UNION {i};
    REMOVE i FROM suboptimal_set;
    FOREACH (i, j) IN ngh(i): 
        if d(j) > d(i) + c(i, j):
            d(j):= d(i) + c(i, j); 
            pred(j):= i; 
```

This is the algorithm. 


---
### **Proof of Correctness**

We introduce some basic quantities and then we proceed to prove using induction. 

- Let $d$ be the distance label.
- let $S$ be the set of vertices with optimal label.
- let $S^C$ be the set of vertices with non-optimal label. 
- let $\Pi(i, j)$ denotes the set of all possible i-j path on the graph. 
- let $P(i, j)$ denotes a specific i-j path on the graph. 
- let $P^+(i, j)$ denotes a specific i-j path with the shortest cost on the graph. 
- let $c(p)$ denotes the costs of a specific path. 

**Inductive Hypothesis**: 

> 1. Distance label in $S$ is optimal, Meaning that $d(i) = \min_{P\in \Pi(s, i)}(c(P))$. 
> 2. For all $i\in S^C$, $d(i)$ is optimal when $P^+(s, i)$, have very vertices in $S$ except for $i$. 

**Proof**: 

The base case is trivial. Inductive, we run one step of the algorithm and show that the conition is still true. 


**References**: 
MATH 409, at UW, discrete optimization Coursenoes, AND Combinatorics optimization MATH 604C at UBCO, Networkflow Theory, Algorithms and Applications. 
