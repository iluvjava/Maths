- [Reduced Costs and Potentials](Reduced%20Costs%20and%20Potentials.md), 
- [Single Source Shortest Path Optimality Conditions](../../CSE%20000%20Basics%20Algorithms/Single%20Source%20Shortest%20Path%20Optimality%20Conditions.md)

---
### **Intro**

There are 2 ways for figuring out the shortest path from all pairs of vertices on a graph all at once, or, improve the speed of finding more shortest path between pairs of vertices on a graph. We list some of the possibilities here: 

- Just do direct shortest path on all pairs of vertices, whenever asked. 
- Try Bellman Ford first and then use Dijkstra in future queries to figure out the shortest path on potential graph, and then translate it back to the solution on the original graph. ( #UNFINISHED )
- Figure out the all pairs shortest path using algorithm like Floyd Warshall. 

**Assumption:** 

We make the exact same set of assumptions for the graph as in the case of the single source shortest path. 

----
### **Floyd Warshall**
Let $G = (A, N)$ be a directed graph satisfying the general assumptions for the label correcting shortest path algorithm. 

**Lemma-1 | All Pairs Optimality Conditions**
>$d(i,j)$ represents the shortest cost of $i-j$ directed path if and only if $d(i, j) \le d(i, k) + d(k, j) \;\forall i, j, k \in N$. 

**Observations**: 

This is literally the metric space inequality. 

**Proof**: 

Following the same idea as [Single Source Shortest Path Optimality Conditions](../../CSE%20000%20Basics%20Algorithms/Single%20Source%20Shortest%20Path%20Optimality%20Conditions.md). We skip the proof here because they are really similar. 

**The Generic Labeling Algorithms**
> One algorithm that asserts the optimality path conditions repeatedly will terminate and achieve optimality at the end. 


**Thm-1 | All Pairs Shortest Path Recursion**
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
    \right\rbrace, \text{ Using the lemma:}
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

Hopefully you are convinced. The base case is made in a way that the above recursive table is true by definition. Therefore, we skip the proof for that one. 

----
### **Algorithm | Floy Warshall**

Here we proposed the algorithm. The Floyd Warshall Algorithm deploys the above dynamic programming idea. 

```SQL
d(i, j) = Inf IF (i, j) NOT IN A, FORALL i, j IN N WHERE i != j;
d(i, j) = 0, FORALL i IN N; /*All pairs distance label */
p(i, j) = NULL, FORALL i, j IN N;  /* Source tree for all i */ 
FOR i = 1,..., |N| - 1
    FOR j = 1,..., |N| - 1
        FOR k = 1,..., |N| - 1
            d_before = d(i, j)
            d(i, j) = min(d(i, j), d(i, k) + d(k, j))
            IF EVAL ("d(i, j) was updated on the last line")
                p(i, j) = p(k, j)  /*inherit k's predecessor */
            end
        END
    END
END

```

**Claim-1 | Negative Cycles Conditions**
> There is a negative cycles if and only if the diagonal of the distance label matrix contains strictly negative entries, after the algorithm terminated. 

**Proof**: 

If there exists a cycle $C$ such that it has negative cost, then for all $i \in C$, $d^{(|C|)}(i, i) < 0$, because no directed cycle can have number of arcs larger than $n - 1$ in a graph. We have shown the $\implies$ direction. For the converse, if $d^{(k)}(i, i) < 0$, then it means there is a directed cycle (a shortest closed directed walk involving $i$) that has negative cost. 

**Claim-2**
> At the k th iterations in the inner most forloop, we have the choice to ignore the kth row and column if there is *no negative cycle in this graph*. Due to this fact, we can terminate whenever a negative entry is going to appear on the diagonal of the matrix, and we don't need to keep a immutable copy of the tale $d(i, j)$ for all $1 \le k \le |N|$. 

**Proof**:

let $d(i, j) = \min(d(i, j), d(i, k) + d(k, j))\forall i, j \in N$, WOLG assume that $i = k$, then: 

$$
\begin{aligned}
    d(k, j) &= \min(d(k, j), \underbrace{d(k, k)}_{\ge 0} + d(k, j))
    \\
    \implies d(k, j) &= \min(d(k, j)) = d(k, j), 
\end{aligned}
$$

therefore, when there is no negative cycles, there shouldn't be any update on any of the $i = k \vee j = k$, and if there is any, then it would have come from some $d(k, k) <0$, but there can't be any if we terminate right away when any of the shortest negative costs cycles were first discovered. 


**Notes For the Programming Savy People**

Helpful notes for programmers actually coding it up. 

**Lazy Path Evaluation**

> We don't have to make the shortest path while the algorithm is running if we are only interested in the shortest path costs. A search algorithm can be deployed later to look for the lowest cost spanning tree given the root node and the destinations. 

**Smart Use of Datastructures**
> We can also terminate the algorithm early when there is no update on the table. Additionally, one may consider using different data structures to speed up the process when the graph is sparse. For each $k$, if we already know that $(k, i)$ or $(i, k)$ doesn't exists for some $i$, then there is no need to update $d(i, j)$ during that iteration. I am not sure what smart use of datastructure can do this, but this is left as an exercise for the programming savy readers.

