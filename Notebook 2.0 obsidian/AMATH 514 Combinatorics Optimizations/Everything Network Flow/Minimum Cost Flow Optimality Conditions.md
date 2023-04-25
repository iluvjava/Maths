[[Minimum Cost Network Flow Standard Form]], [[Reduced Costs and Potentials]]. 

---
### **Intro**

Specialized algorithms for minimum cost flow type of problems are very fast, compare to the alternative such as the interior points method, or the simplex that solves the LP representation of the problem instead of the network flow problem directly. We will go over the Dual problems, how to identify the optimal flows and potentials if one of the other is given, and we will introduce the negative cycles removal algorithms for the min cost flow problem. 

**Assumptions**

1. All data on the graphs are integers. 
2. The network is directed. There is only one arc between each node. 
3. The sum of all the supplies and demands will sum up to zero. 
4. All costs are non-negative in the network. 

Before we start, please recall the theorem that: 

> A flow is optimal if and only if there is no negative costs cycles on the residual graph of that flow. 

Which is important for the discussion because we exploit that. In addition to the above conditions, on a high level we give summary. 
- We also assume the existence of a feasible flow for the problem first, before starting the process for improving the existing feasible solution. 

**References**: 

Most of the theorems and content will be taken from Ahuja's Network flow textbook, theorems will be listed with a `[thm ??.??]` at the end of it to indicate which theorem in the notes corresponds to the theorem in the textbook.


---
### **Optimality Conditions on the Graphs**

We list theorem that relates several quantities to an optimal flow. These will ultimately be tied to linear programming duality. 

**Thm-1｜ Reduced Costs Optimality Conditions \[thm 9.3\]**
> Feasible solution $x^\circ$ is optimal of the minimum costs problem if and only if some set of node potential $\pi$ satisfies: $c^{(\pi)}_{i, j} = c_{i, j} - \pi_i + \pi_j \ge 0$ for all $(i, j) \in G(x^\circ)$, for all arcs in the residual graph. 

**Proof**: 

Skipped. 

**Remarks**

$p_i$ is one set of the dual variable for the dual programming problem, it's related to the quality constraints of the minimum cost flow problem. 

**Thm-2 | Complementary Slackness Optimality Conditions \[thm 9.4\]**
> Feasible solution $x^\circ$ is optimal if and only if there exists node potentials $\pi$  such that the reduced costs satisfies the complementary slackness conditions for all arcs $(i, j)$: 
> $$
> \begin{aligned}
>     \begin{cases}
>         c^{(\pi)}_{i, j} < 0 \implies x^\circ_{i, j} = 0
>         \\
>         0 < x_{i, j}^\circ < u_{i, j} \implies c_{i, j}^{(\pi)} = 0
>         \\
>         c^{(\pi)}_{i, j} < 0 \implies x_{i, j}^\circ = u_{i, j}, 
>     \end{cases}
> \end{aligned}
> $$
> which is the complementary slackness conditions for the LP. Other equivalent description of the conditions exist. 

**Proof**: Skipped. 

---
### **The Dual of the LP**

We restate the dual formulation from the network standard form LP for the problem, we use $\pi, y$ for the dual variables. 

$$
\begin{aligned}
    \max_{\substack{\pi  \text{ free} \\ y \le \mathbf 0}}
    \left\lbrace
       \langle b, \pi \rangle + \langle u, y\rangle
    \right\rbrace
    \text{ s.t: }
    \begin{bmatrix}
        M^T & I
    \end{bmatrix}
    \begin{bmatrix}
        \pi \\ y
    \end{bmatrix} \le
    c, 
\end{aligned}
$$

and the constraints can be expressed in the form of: 

$$
\begin{aligned}
    & \forall (i, j) \in A: c_{i, j} - \pi_i + \pi_j \ge y_{i, j}
    \\
    & \forall (i, j) \in A: c^{(\pi)}_{i, j} \ge y_{i, j}, 
\end{aligned}
$$

where we show that, the reduced costs is an upper bound for the dual variable $y_{i,j}$  corresponding to the non-negativity constraints of the flow. We may represent $y_{i, j} = \min\left(0, c^{(\pi)}_{i, j}\right)$. This allows us to compactly write the dual LP problem as: 

$$
\begin{aligned}
    \max_{\pi \text{ free}} \left\lbrace
        \langle b, \pi\rangle + 
        \sum_{(i, j)\in A}^{}
        u_{i, j}
        \min\left(0, c^{(\pi)}_{i, j}\right)
    \right\rbrace. 
\end{aligned}
$$

Which is a non-smooth optimization problem purely using the $\pi$ variable.

**Thm-3 | Strong Duality of Min Cost Network Flow \[thm: 9.6\]**
> For all data, there exists $x^+$ as an optimal solution to the min cost flow problem satisfying strong duality, meaning that: 
> $$
>     \langle c, x^+\rangle =     \langle b, \pi\rangle + 
>         \sum_{(i, j)\in A}^{}
>         u_{i, j}
>         \min\left(0, c^{(\pi)}_{i, j}\right), 
> $$
> and the solution satisfies the conditions: $\langle -c^{(\pi)}, x\rangle = \langle -\min(c^{(\pi)}, 0), u\rangle$, this is by the properties of reduced costs, obtained by moving $\langle b, \pi\rangle$ to the left. 

**Proof**: 

Skipped for now. 


---
### **LP Duality View of the Matter**

We list results of LP duality applied to this specific formulation of Minimum cost flow LP. 


---
### **The Negative Cycle Canceling Algorithms**

This basic algorithm exploits the optimality conditions of the network flow problem. It can be summarized simply by the following: 

> Establish a feasible flow for the min cost network flow, and then detect cycles with negative costs in the residual graph. And then we augment along that cycle to bring down the cost of the flow. Each augmentation should saturates one of the arcs on the cycle. 


**Thm: Solution is Integral\[9.10\]**
> If the arc and node capacity for the graph is of integer values, then the minimum cost solution will be integers after the execution of this algorithm. 

**Proof**: 
Skipped. Refers to the textbook. 

**References**: 

Ahuja's Network Flow Algorithm Textbook, Chapter 9. 

---
### **Non-Uniqueness of the Minflow Solutions**


