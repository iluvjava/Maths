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
    FOREACH (i, j) IN ngh(i): /* for all out going neighbours of i*/
        if d(j) > d(i) + c(i, j):
            d(j):= d(i) + c(i, j); 
            pred(j):= i; 
```

This is the algorithm. 

**Observations**: 

1. This is not exactly the same as the Generic Search algorithm because it checks all the admissible neighbours of a select vertex inside of the inner forloop, but the generic search algorithm just check one of the admissible arcs for the select vertex instead of all of its out-going neighbours. 
2. The vertices leaves the set `suboptimal_set` once and it's removed from `optimal_set` exactly once. Hence, the outer forloop executes for exactly $n$ many times. 

---
### **Proof of Correctness**

We introduce some basic quantities and then we proceed to prove using induction. 

- Let $d$ be the distance label.
- let $S$ be the set of vertices with optimal label.
- let $S^C$ be the set of vertices with non-optimal label. 
- let $\Pi(i, j)$ denotes the set of all possible i-j path on the graph. 
- let $P(i, j)$ denotes a specific i-j path on the graph. 
- let $c(p)$ denotes the costs of a specific path. 

**Inductive Hypothesis**:

> 1. Distance label in $S$ is optimal, Meaning that $d(i) = \min_{P\in \Pi(s, i)}(c(P)), \forall i\in S$. 
> 2. For all $i\in S^C$, $d(i)$ is the shortest path cost using only vertices in the set $S$, except for $i$, meaning that $d(i) = \min_{P\in \Pi(s, i)}\{c(P)| (P\setminus S) = \{i\}\}$. 

**Proof**: 

The base case is trivial. Inductively, we run one step of the algorithm and show that the condition is still true. 

> Suppose that $i\in S^C$ is chosen by the Dijkstra algorithm (characterize by the conditions that $d(i)= \min_{l\in S^C}\{d(l)\}$) at the current step and before the update is performed for $d(i)$, we show that for all $P\in \Pi(s, i)$ the cost is at least $d(i)$, hence hypothesis (1) holds inductively for $S\cup \{i\}$. 

There are 2 types of $s-i$ path $P$, either $P\cap S = \{i\}$, or $(P\cap S) \supset \{i\}$. 

1. CASE(I), $P\cap S = \{i\}$: All of the internal nodes of the path is in the set $S$. 
2. CASE(II), $(P\cap S) \supset \{i\}$: Not all of the internal nodes are part of the set $S$. 

Inductive hypothesis (2) asserts that $d(i)$ is optimal for all paths in CASE(I). 

For all s-i path that is the CASE(II) can be decompose into sections where it firsts leaves the set $S$, by induction hypothesis, the first part of the path is at least cost $d(i)$, more specifically: 

$$
\begin{aligned}
    & \forall P\in \Pi(s, i) \text{ s.t: } (P\cap S^C) \supset \{i\}, 
    \\ 
    &\exists k \in P, P_1\in \Pi(s, k), P_2\in \Pi(k ,i) \text{ s.t: } (P = P_1 \cup P_2) \wedge (P_1\setminus \{S\} = \{k\});
    \\
    & 
    H_2 \implies c(P_2) \ge d(k)
    \\
    & 
    \text{Dijkstra }\implies d(k) \ge d(i), 
\end{aligned}
$$

because Dijkstra chooses the $i\in S^C$ with such that $d(i)$ is smallest. Using the fact that all arc lengths are non-negative, we have: 

$$
\forall P\in \Pi(s, i), c(P) = c(P_1) + \underbrace{c(P_2)}_{\ge 0} \ge c(P_1) \ge d(k) \ge d(i), 
$$

therefore, the distance label $d(i)$ is optimal for the vertex $i$ if it's by Dijkstra before updating hypothesis (1) is now true for $S\cup \{i\}$. 

> After discovering $i$, the algorithm performs updates on some vertices in $S^C$ that are direct neighbors of $i$. For all $j\in S^C\setminus \{i\}$, their label will be updated by the current iteration of Dijkstra, let that be denoted by $d'(j)$. This label will satisfies hypothesis condition (2) for $S\cup \{i\}$.

This is true because $d(i)$ is the optimal label, and by characterizations of shortest path, $d(i) + c_{i, j}$ will be the shortest path distance for all path that uses the vertex $i$ (A proof by contradiction should clarifies it), mathematically: 

$$
\begin{aligned}
    d'(j) = \min_{P\in \Pi(s,j)} \left\lbrace
       c(P)| i\in P
    \right\rbrace. 
\end{aligned}
$$

For contradiction, if this is not the case, then an shorter $P=P_1\cup P_2$ exists, with $P_1$ being an $s-k$ path where $k$ is the last node in the set $S$, and hence $d(k)$ is shorter and hence $k$ should be select to be $i$ instead, which contradict the algorithm itself. 

The algorithm then proceeds to update the predecessor tree assigning predecessor of all such $j$ to $d'(j) = d(i) + c_{i, j}$. Therefore, hypothesis (2) is kept for the set $S^C$ and now the proof is complete. 


**Remarks**: 

If it's discovered that $d(i) + c_{i, j} < d(j)$ inside the iff statement, then a negative arc exists. 



**References**: 

MATH 409, at UW, Discrete Optimization Course notes, AND Combinatorics optimization MATH 604C at UBCO, Networkflow Theory, Algorithms and Applications. 


**Complexity | No Proof**: 

>The complexity of Dijkstra using a binary heap implementation is $\mathcal O((|V| + |E|)\log (|V|))$. 