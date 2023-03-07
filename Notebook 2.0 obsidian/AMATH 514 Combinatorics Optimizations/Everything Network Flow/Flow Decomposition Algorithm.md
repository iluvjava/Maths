[[Network Flow Standard Form]], 
[[../../CSE 000 Basics Algorithms/Generic Search Algorithm]]

---
### **Intro**
 
**Theorem: Flow Decomposition Theorem**

> Every path and cycle flow has a unique representation as nonnegative arc flows. Conversely, every nonnegative arc flow x can be represented as a path and cycle flow (though not necessarily uniquely) with the following two properties:
> - (a): Every directed path with positive flow connects a deficit node to an excess node. 
> - (b): At most n + m paths and cycles have nonzero flow; out of these, at most m
cycles have nonzero flow.

If we denote $\mathcal P, \mathcal C$ to be the set arcs in all directed paths and cycles on the graph that sense non-zero amount of flows between vertices. We also define an indicator function $\mathbf 1_{CP}\{v\}$ to denote $1$ if $v\in \mathcal C\cup \mathcal P$ else $0$, then ay flow between the vertices can be expressed as: 

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

---
### **Flow Decomposition Algorithm**

Assume graph $G = (N, A)$. We start by defining the flow balance constraints violations using $g_i$, for each node it's defined as the total amount of inflow  minus the total amount of outflow: 

$$
\begin{aligned}
    \left(
        \sum_{(i, j)\in A}^{}
        x_{i, j}
    \right) - 
    \left(\sum_{(j, i)\in A}^{}
        x_{j, i}
    \right) = - g_i \quad \forall i \in N
\end{aligned}
$$

We define $g_i < 0$ to be <mark style="background: #FF5582A6;">deficit</mark> node, $g_i>0$ to be <mark style="background: #ADCCFFA6;">excessive</mark> node. Currently let's ignore the mass balance constraints $b_i$ because we sometimes consider the flow decomposition a flow that is current feasible/infeasible, we are not interested in the mass balance constraints. As noted in the book, some algorithms doesn't have the mass balance constraints so here we choose this alternative formulation, for example the [[Maxflow Min Cut, Ford Fulkersson]]. 

**Flow Decomposition Algorithm (Proof)**

Given any flow $x$ on the graph. let $i$ be an <mark style="background: #ADCCFFA6;">excessive</mark> node with $g_i \ge 0$, assume for now that there exists an arc $(i_1, i_2)$ such that it has $u_{i_1, i_2} > 0$, it carries positive flow along the edge. This is a possibility by the imbalance constraint. Inductively suppose that we are doing this at $i_k$ with $g_k > 0$ so that this is a deficit node, then arc $(i_k, i_{k + 1})$ with positive flow that we identified has the following possibility: 
1. $i_{k + 1}$ is an excessive node.
   1. If $i_{k + 1} = i_1$, then a directed cycle has been identified. Name it $C$
   2. Else, $i_{i + 1}$ is just another node with excessive flow, we repeat the argument and look for $i_{k + 2}$. 
2. $i_{k + 1}$ is a deficit node, then the path terminates and the amount of flow we send over the path is $\min_{a\in P}f(a)$. 

Once such a path or cycle is 