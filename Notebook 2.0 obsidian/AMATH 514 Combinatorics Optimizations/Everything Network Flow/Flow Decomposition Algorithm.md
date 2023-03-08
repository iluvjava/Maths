[[Network Flow Standard Form]], 
[[../../CSE 000 Basics Algorithms/Generic Search Algorithm]]

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

If we denote $\mathcal P, \mathcal C$ to be the set arcs in all directed paths and cycles on the graph that send *strictly positive amount of flows* between vertices. We also define an indicator function $\mathbf 1_{CP}\{v\}$ to denote $1$ if $v\in (\bigcup_{c\in \mathcal C} c)\cup(\bigcup_{c\in \mathcal P})$ else $0$, then any flow between the vertices can be expressed as: 

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


**Looking for one path**: 

Given any flow $x$ on the graph. let $i$ be an <mark style="background: #ADCCFFA6;">excessive</mark> node with $g_i > 0$, Look for a i-j path strict positive capacity (More on this soon) such that $g_j < 0$, Let this path be $P^{(1)}$, we determine the amount of flow send over $P^{(1)}$ to be $\min_{a \in P}x_a$, where $u(a)$ denotes the capacity of the arc $a\in P$. It's possible to have $P^{(1)}$ to have positive flow because $x$ is a feasible flow. 




