[[Maxflow Min Cut, Ford Fulkerson]], 
[[Min Cost Network Flow Standard Form]]. 

---
### **Intro**

Maximum flow with lower bound is a harder problem to solve compare to the case without any lower bound. To characterize such a problem, we now allow for a lot more on our graph $G = (A, N)$. Here is the list of assumptions we make for the network. 
1. Compare to the original form for maxflow, we now allows for double arcs between vertices. 
2. The uperbound, lower bound for the arc capacities, denoted by $l, u$ vector, must positive and $\mathbf 0 \le l\le u$. 
   - If, some arc $(i, j)\not\in A$, we will have $0 = u_{i, j} = l_{i, j}$ so that the math formulas work out. 
3. No parallel arcs on the same directions are allowed. 
4. Feasible solution doesn't have to exists for the graph. 
5. $s, t\in N$ that are the source and sink node for the graph. 


We will discuss the feasibility search on these network, and reduction techniques on to transform the this to a residual network that works with the augmenting path algorithm when there is no lower bounds, and the way to transform the solution back to the original graph. We define a list of quantities that are useful: 

1. Denote the graph $G=  (A, N)$ as our original network, representing the maxflow problem. 
2. Denote $u, l$  the lower bound and upper bound for the original network. 
3. Denote $x^\circ$, a vector representing a feasible flow on the arcs of the graph. 
4. Denote $x'$ the flow on the residual network. 
5. Denote $r$ a vector representing the residual capacities. The residual network doesn't have a lower bound. 


**References**: 
Chapter 7.6 of the network flow algorithm, application textbook. 

---
### **Residual with Lower Bounds**

Given a feasible flow $x^\circ$ on the graph. We construct a residual net work $G(x^\circ)$, which will be compatible with the Ford Fulkerson algorithm. The residual capacity is calculated by: 

$$
\begin{aligned}
    r_{i, j} := (u_{i, j} - x_{i, j}^\circ) + (x_{j, i}^\circ - l_{j, i}) \ge 0. 
\end{aligned}
$$

For example, assuming that we have an arc $(i, j)$, with constraints $l, u$ and some flow $x^\circ$, we represent the transformation: 

$$
\begin{aligned}
    & (i) \longrightarrow  (j) \text{ where }l_{i, j} \le x_{i, j}^\circ  \le u_{i, j}, x_{j, i} = u_{j, i} = l_{j, i} = 0
    \\
    & (i)' \longleftrightarrow (j)' 
    \text{ where: }
    \begin{cases}
        r_{i, j} = u_{i, j} - x_{i, j}^\circ + 
        \underbrace{(x_{j, i}^\circ - l_{j, i})}_{ = 0}
        & \text{ for }\rightarrow 
        \\
        r_{j, i} = \underbrace{(u_{j, i} - x_{j, i}^\circ)}
        _{ = 0}
        + (x_{i, j}^\circ - l_{i, j})
        & 
        \text{ for }\leftarrow 
    \end{cases}
    \\
    & 
    (i)' 
    \longleftrightarrow
    (j)'
    \text{ where: }
    \begin{cases}
        r_{i, j} = u_{i, j} - x_{i, j}^\circ & \text{for } \rightarrow 
        \\
        r_{j, i} = x_{i, j}^\circ - l_{i, j} & \text{for } \leftarrow 
    \end{cases}
\end{aligned}
$$

Which makes sense. $r_{i, j}$ represent the amount of vacancy allowed to send through the arc $(i, j)\in A$. $r_{j, i}$ represent the amount above lower bounds that can be reduced. This residual graph is now suitable for maxflow algorithm without the lower bounds. 

For another example. We consider double arcs with zero lower bounds. We show that it's the same as applying the residual graph without lower bound for each arcs, and then merge the capacities for parallels arcs going between them. 

$$
\begin{aligned}
    & (i) \longleftrightarrow (j) \text{ where }
    \begin{cases}
        0 \le x_{i, j}^\circ \le u_{i, j} & \rightarrow 
        \\
        0 \le x_{j, i}^\circ \le u_{j, i} & \leftarrow 
    \end{cases}
    \\
    & (i)'\longleftrightarrow (j)' 
    \text{ where }
    \begin{cases}
        r_{i, j} = u_{i, j} - x_{i, j}^\circ + x_{j, i}^\circ
        \\
        r_{j, i} = u_{j, i} - x_{j, i}^\circ + x_{i, j}^\circ. 
    \end{cases}
\end{aligned}
$$

Recall the fact that, a double arc reduction will create 4 arcs. Given as: 

$$
\begin{aligned}
    \rightarrow \text{ breaks into }\begin{cases}
        r_{i, j} = u_{i, j} - x_{i, j}^\circ & \rightarrow 
        \\
        r_{j, i} = x_{i, j}^\circ & \leftarrow 
    \end{cases}
    \\
    \leftarrow \text{ breaks into }
    \begin{cases}
        r_{j, i}  = u_{j, i} - x_{j, i}^\circ  & \leftarrow 
        \\
        r_{i, j} = x_{j, i}^\circ  & \rightarrow 
    \end{cases}, 
\end{aligned}
$$

merging the $\rightarrow$, and $\leftarrow$ pointing arcs for the above 4 arcs will yield the exact same formulations as the first case, using that special formulas for residual capacities. 

**Warning:** 

* if $r_{i, j}=0$, we remove it from the residual graph, so that the Ford Fulkerson can ignore augmenting path with zero capacities. 
* This reduction is absolutely not applicable for minimum costs flow problem since they can have different costs on different directions of the arcs. 

---
### **Transforming Residual Flow to Feasible Flow**

Given a residual graph with residual capacities $r_{i, j}$, we can convert the capacities on the residual graph back into an feasible flow on the original graph. The formulas are given as: 

$$
\begin{aligned}
    x_{i,j} = \max(u_{i, j} - r_{i, j}, l_{i, j}), 
\end{aligned}
$$

and it's that simple. This is for converting back an residual graph with an $s-t$ cut capacities of zero back to an optimal flows on the original network. 

---
### **An LP View of the Residual Reduction Procedures**



#UNFINISHED
