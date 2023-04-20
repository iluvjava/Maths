[Min Cost Network Flow Standard Form](Min%20Cost%20Network%20Flow%20Standard%20Form.md), 
[Generic Search Algorithm](../../CSE%20000%20Basics%20Algorithms/Generic%20Search%20Algorithm.md)

---
### **Intro**

**Quantities Introduced**: 
* $x$, a flow on the network, a flow creates imbalances on vertices of the graph. 
* $\mathcal C$ family of cycles used to approximate a given flow. 
* $\mathcal P$ family of simple path used to aproximate a given flow. 
* $g$: The excess of deficit that we need to balance out on the given flow. 
* $x'$: The flow we are using to approximate the flow $x$. 

**Theorem: Flow Decomposition Theorem**

> Every path and cycle flow has a unique representation as *nonnegative* arc flows. Conversely, every *nonnegative* arc flow x can be represented as a path and cycle flow (though not necessarily uniquely) with the following two properties:
> - (a): Every directed path with positive flow connects a deficit node to an excess node. 
> - (b): At most n + m paths and cycles have nonzero flow; out of these, at most m
cycles have nonzero flow.

If we denote $\mathcal P, \mathcal C$ to be the set arcs in all directed paths and cycles on the graph that send *strictly positive amount of flows* between vertices. We also define an indicator function $\mathbf 1_{CP}\{v\}$ to denote $1$ if $v\in (\bigcup_{c\in \mathcal C} c)\cup(\bigcup_{p\in \mathcal P}p)$ else $0$, then any flow between the vertices can be expressed as: 

$$
\begin{aligned}
    x_{i, j} = \left(
        \sum_{a\in \mathcal P}^{} \mathbf 1_{CP}\{a\}f(a)
    \right)
    + \left(
        \sum_{a\in \mathcal C}^{}
        \mathbf 1_{CP}\{a\} f(a)
    \right)
\end{aligned}, 
$$

which is demonstrated mathematically as above. To demonstrate the theorem, we consider developing an algorithm that decomposes any flows into composition of cycles and paths, the algorithm is considered to be a kind of proof. 

**References**: 

Chapter 3 of the network flow theory, algorithm and application textbook. 

---
### **Flow Decomposition Algorithm**

Assume graph $G = (N, A)$. We start by defining the flow balance constraints violations using $g_i$, for each node it's defined as the total amount of inflow  minus the total amount of outflow: 

$$
\begin{aligned}
    \underbrace{\left(
        \sum_{(i, j)\in A}^{}
        x_{i, j}
    \right)}_{\text{flow out}}
     - 
    \underbrace{\left(
        \sum_{(j, i)\in A}^{}
        x_{j, i}
    \right)
    }_{\text{flow in}}
    = - g_i \quad \forall i \in N
\end{aligned}
$$

We define $g_i < 0$ to be <mark style="background: #FF5582A6;">deficit</mark> node, $g_i>0$ to be <mark style="background: #ADCCFFA6;">excessive</mark> node. Currently let's ignore the mass balance constraints $b_i$ because we sometimes consider the flow decomposition a flow that is current feasible/infeasible, we are not interested in the mass balance constraints. As noted in the book, some algorithms doesn't have the mass balance constraints so here we choose this alternative formulation, for example the [Maxflow Min Cut, Ford Fulkerson](Maxflow%20Min%20Cut,%20Ford%20Fulkerson.md). 


**Looking for One Path on Flow**: 

Inductively suppose that we are gven a flow path $P$ that originated from $i(1)$ such that $g_{i(1)} > 0$, and it terminates at $g_{i(n)}$ such that for all $(i(k), i(k + 1))$ where $0\le k \le n- 1$, we have $x_{i(k), i(k + 1)} > 0$. Suppose that we currenctly are looking at the arc $(i(n-1), i(n))$, then there are several possibility for the node $i(n)$. 

1. $g_{i(n)} < 0$ deficit. Which means that we have arrived at a node with defecit, and we are done. 
2. $g_{i(n)} > 0$ excessive. Then we can find another arc $(i(n), i(n + 1))$ such that $x_{i(n), i(n + 1)} > 0$ from the fact that $g_{i(n)} > 0$, hence we can repeat the same argument with $n:= n + 1$. 
3. $g_{i(n)} = 0$ circulation, and that would mean there has to have another arc $(i(n), i(n + 1))$ such that there are positive flow on it. 

If we can't find $i(n + 1)$ without repeating, then the original flow is not a feasible flow, this is impossible, therefore it has to either recur, or terminates at case (1). When that happens, we will have a path $P$ that starts at $i(1)$ that is have $g_{i(1)} > 0$ and ends with $g_{i(n)} < 0$. We choose a vector $\Delta x$ such that for all $1\le k \le n - 1$ we have $\Delta x_{i(k), i(k + 1)} > 0$. Choose the minimum arc capacity along the path, say it's $\delta$ then the new flow $x + \Delta x$ will produce $g_{i(1)} - \delta$, and $g_{i(n)} + \delta$, the total amount of violation on all the $g$ vector has been strictly improved, further more, one of the $a\in P$ will set $x_a = 0$, because we saturated one of the arc cpacity along $P$. 


**Looking for Cycles on Circulations**:

If, there is no such $i(1)$ with $g_{i(1)} > 0$, then it has to be the case that all $g_i = 0$ for all $i \in N$ else, the flow is infeasible to begin with. When $g_i = 0$ for all $i \in N$, then $x$ has to be a circulation. Select any arc $(i(1), i(2))\in A$ such $x_{i(1), 1(2)}> 0$. The base case would be to find the next node, which is possible by the fact that it's a circulation, there exists $x_{i(2), i(3)}$ with $i(3)\neq i(2)$ to balance out the inflow to node $i(1)$. 


---
### **The Matrix View of the Matter**

For any flow $x$, it can be decomposed into positive span of paths and cycles, where cycles are from the null space of the incidence matrix and the paths are from the row space of the matrix. 


