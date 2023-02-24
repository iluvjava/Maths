[[../AMATH 514 Combinatorics Optimizations/Everything Network Flow/Reduced Costs and Potentials]], [[../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]], 

---
### **Intro**

There are 2 ways for figuring out the shortest path from all pairs of vertices on a graph all at once, or, improve the speed of finding more shortest path between pairs of vertices on a graph. We list some of the possibilities here: 

- Just do direct shortest path on all pairs of vertices, whenever asked. 
- Try Bellman Ford first and then use Dijkstra in future queries to figure out the shortest path on potential graph, and then translate it back to the solution on the original graph. ( #UNFINISHED)
- Figure out the all pairs shortest path using algorithm like Floyd Warshall. 

**Assumption:** 
We make the exact same set of assumptions for the graph as in the case of the single source shortest path. 


----
### Floyd Warshall: 
Let $G = (A, N)$ be a directed graph satisfying the general assumptions for the label correcting shortest path algorithm. 

**Lemma: All Pairs Optimality Conditions**
>$d(i,j)$ represents the shortest cost of $i-j$ directed path if and only if $d(i, j) \le d(i, k) + d(k, j) \;\forall i, j, k \in N$. 

**Proof**: 

Following the same idea as [[../CSE 000 Basics Algorithms/Characterizations Shortest Paths from Source]]. We skip the proof here because they are really similar. 

**Theorem: All Pairs Shortest Path Recursion**
> let $d^{(k)}(i ,j)$ denotes the low cost $i-j$ directed path only using nodes $1, 2, \cdots, k - 1$, then it satisfies the conditions: 
> $d^{(k + 1)}(i, j) = \min(d^{(k)}(i, j), d^{(k)}(i, k) + d^{(k)}(k, j))$. 
> 
> Here, if it's impossible to exists a $i-j$ using all $1, \cdots, k - 1$ vertices in the graph, then we would denote $d(i, j) = \infty$, and we have $d^{(-1)}(i, i) = 0$ as the base case. 

**Proof Preparations**: 

To experience the math with gory details, we introduce the following notations: 

$$
\begin{aligned}
    P(i, j) &:= {\text{arcs or vertices collection for a $i-j$ path on } G}
    \\
    \Pi^{(k)}(i, j) &:= \{P(i, j)| P(i, j)\subseteq [k - 1]\cup\{i, j\}\}
    \\
    P(i, k) &:= P(i, j)\oplus P(i, k) \text{ Path Concatentation}
\end{aligned}
$$

where, the first denotes some $i-j$ path on the graph $G$. The second denotes all the possible $i-j$ path on the graph such that it only uses vertice $1, \cdots, k - 1$. Then we have the convenient description: 
$$
\begin{aligned}
    d^{(k)}(i, j) = \min_{P \in \Pi^{(k)}(i, j)} \left\lbrace
       \sum_{(i, j) \in P}^{}c_{i, j}
    \right\rbrace \quad \forall i, j\in N. 
\end{aligned}\tag{*}
$$
And together with the base case definition of $d^{(-1)}(i, i) = 0$. 

**Proof**: 

Inductive we assume that $d^{(k)}(i, j)$ is indeed optimal, as described by (*), then the shortest path with one additional vertex $k$ will have an expression for its shortest path of the form: 
$$
\begin{aligned}
    d^{(k + 1)}(i, j) &= \min 
    \left\lbrace
        \text{cost}(P)
        \left|
            P \in \Pi^{(k + 1)}(i, j) 
        \right.
    \right\rbrace
    \\
    \text{Let }
    P^+_{k + 1}(i, j) &\in \arg\min 
    \left\lbrace
        \text{cost}(P)
        \left|
            P \in \Pi^{(k + 1)}(i, j) 
        \right.
    \right\rbrace
    \\
    d^{(k + 1)}(i, j) &= 
    \begin{cases}
        \min 
        \left\lbrace
            \text{cost}(P)
            \left|
                P = P^+_{k}(i, k)\oplus P^+_{k}(k, j) \in \Pi^{(k + 1)}(i, j) 
            \right.
        \right\rbrace  
        & 
        k \in P^+_{k + 1}(i, j)  
        \\
        d^{(k)}(i, j) & \text{else}
    \end{cases}
    \\
    \implies 
    d^{(k + 1)}(i, j) &= 
    \begin{cases}
        \min 
        \left\lbrace
            \text{cost}(P^+_{k}(i, k)\oplus P^+_{k}(k, j))
        \right\rbrace  
        & 
        k \in P^+_{k + 1}(i, j)  
        \\
        d^{(k)}(i, j) & \text{else}
    \end{cases}
    \\
    d^{(k + 1)}(i, j) &= 
    \begin{cases}
        d^{(k)}(i, k) + d^{(k)}(k, j)
        & 
        k \in P^+_{k + 1}(i, j)  
        \\
        d^{(k)}(i, j) & \text{else}
    \end{cases}
\end{aligned}
$$

observe that trivially, $\text{cost}(P^+_{k}) \ge \text{cost}(P^+_{k + 1})$ simply becase we can use less nodes, therefore if $k \in P^+_{k + 1}(i ,j)$, then it has to be the case that the path using $k$ cost less, hence the equality is justified and we have: 
$$
\begin{aligned}
    d^{(k + 1)} = \min(d^{(k)}(i, j), d^{(k + 1)}(i, k) + d^{(k + 1)}(k, j)). 
\end{aligned}
$$

Hopefully you are convinced. 

----
### **Algorithm**

