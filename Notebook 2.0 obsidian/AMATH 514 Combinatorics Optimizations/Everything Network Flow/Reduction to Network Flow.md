[[Network Flow Standard Form]]

---
### **Intro**

We reduce different types of graph algorithm problem to an instance of network flow problem and solve it. This is much similar to linear programming where we always reduce a linear program of a model to the simplex standard form, maximizations, so that the simplex tabeau method can be employed to solving the problem. There are 2 types of reduction techniques: 
1. The type where changing the variable is enough. 
2. The type where the structure of the graph is changed too and substitution of variables are also needed. 

Here, we denote the vertices with a tuple $(i, m)$ where $i$ is the index and $m$ is the mass balance constraint, and a tuple $(c, l, u), (c, u)$ to represents an edge with a lower bound upper bound, or an zero lower bound and positive upper bound flow constraint. 

---
### **Non-zero Lower Bound**

suppose that initially we have an arc $(i, j)\in A$ such that it has lower bound $l_{i, j} > 0$, and upper bound $u_{i, j}$, with arc cost $c_{i, j}$, mass balance constraints on both vertex $i, j$ with $b_i, b_j$. As illustrated: 

$$
\begin{aligned}
    (i, b_i) \longrightarrow (c_{i, j}, l_{i, j}, u_{i, j}) \longrightarrow (j, b_j).
\end{aligned}
$$

We can eliminate the use of non-zero lower bound by considering changing it with substitutions $x'_{i, j} + l_{i, j} = x_{i, j}$, which would mean $x_{i, j}' = x_{i, j} - l_{i, j} \ge 0$. We make the following changes to the parameters: 

* $(i, b_i)$ changed into $(i, b_i + l_{i, j})$, because's always sending out a flow amount of $l_{i, j}$ at the least. 
* $(j, b_j)$ changed into $(j, b_j - l_{i, j})$ because it's always receiving the same amount of flows. 
* $l_{i, j}$ changed into zero. 
* $u_{i, j}$ changed into $u_{i, j} - l_{i,j}$, which reduce the maximum amount of flow that can be sent over the arc. 

There is not changes to the structure of the graph. To illustrate we have the transformed: 

$$
\begin{aligned}
    (i, b_i + l_{i, j}) \longrightarrow (c_{i, j}, 0, u_{i, j} - l_{i, j}) \longrightarrow (j, b_j - l_{i, j}).
\end{aligned}
$$

**Invariants**
- The sum of $b$ vector after the transform should still be the same as before, as shown in the transformation, therefore the constraints are still satisfied. 
- The decision variable $x'$ and the decision variable $x$ has a bijective mapping from the reformulations. Translating solutions between the 2 is still ok. 

**Remarks**

$x = x' + l$ is the key, the new decision variable models how much more flow we need to send across an arc above the lower bound. 


---
### **Undirected Edge**
An undirected edge has an upper capacity of $u_{i, j}$ for both direction and it's modeled by the decision variable $x_{\{i, j\}} = x_{i, j} + x_{j, i}$, the constraints it asserts is $x_{i, j} + x_{j, i} \le u_{i, j}$, where both directions has positive flow. Let the costs for this edge be $c_{i, j} > 0$. 

To transform, we replace $\{i, j\}$ to 2 arcs $(i, j), (j, i)$, both with the same cost and capacity as the undirected edge. We then put 2 uncoupled decision variables $x_{i, j}', x_{j, i}'$ that are non-negative, then in the undirected network the flow of is given as $x_{\{i, j\}} = x_{i, j}' - x_{i, j}'$ where the sign indicates the direction of the flow on the undirected edge. 


**Remarks**

Undirected edge with a lower bound that is not zero, or with negative cost, <span style="color:red">we cannot use the above transform</span>. 

This transformed is made possible a direct substitutions of $x\in [u, l]\ni 0$ into $x = [x]_+ - [x]_-$. 

---
### **Arc Reversal | Negative Arc**

Suppose that we have $c_{i, j} < 0$, which is unwanted for the standard form, we consider using $c_{i, j}' = -c_{i, j}$, and we introduce new decision variable $x_{j,i}' = u_{i, j} - x_{i, j}$, reversing the direction of the edge and make $b_i' = b_i - u_{i, j}, b_j' = b_j + u_{i, j}$, and the capacity $u_{i, j}' = u_{i, j}$. Intuitively, negative cost means gaining money while sending mass on the arc, if we models the flow of vacancy, then it means that it would cost money for us to not send vacancies on the arcs.  


**Remarks**:

Due to the nature of minimization, an arc with negative value will always be saturated, therefore, we change the surplus and deficit of the vertex to assert the flow that is always present. Reversing the flow and cost is modeling on the absent of stuff sent from $j$ to $i$, because the choice of not sending stuff is losing money when the cost is negative, therefore the amount of vacancy has positive flow, hence the rationality that $x'_{j, i} = u_{i, j} - x_{i, j}$. 

---
### **Arc Bound Removal**

Our goal is to remove the arc capacity so that it can be represented by a graph with infinite capacity for the arcs. To do that we model the arc capacity constraints using an extra vertex and mass balance constraints. Suppose that $(i, j)\in A$ has a flow constraint of $l_{i, j}, u_{i, j}$ and a costs of $c_{i, j}$. Creates an additional vertex $k$ such that we have $i\rightarrow k \leftarrow j$ with new $b'_{k} = -u_{i, j}$, and decision variable $x_{i,k}', x_{j, k}'$ and $u_{i, k}'= \infty, u_{j, k}'=\infty$ and $b_j'= b_j + u_{i, j}$, which best illustrated as: 

$$
\begin{aligned}
    & (i, b_i)
    \overset{x_{i, j}}{\underset{(c_{i, j}, u_{i, j})}{\longrightarrow}}
    (j, b_j) 
    \\
    \equiv & 
    (i, b_i)
    \overset{x'_{i, k}}{\underset{(c_{i, k}, \infty)}{\longrightarrow}}
    (k, -u_{i, j}) 
    \underset{(0, \infty)}{\overset{x'_{j, k}}{\longleftarrow}}
    (j, b_j + u_{i, j}), 
\end{aligned}
$$

where we forces a fixed $-u_{i, j}$ of flow going through $(i, k)$ with the same costs, and counter it with another free costs flow using the arc $(j, k)$, while changing the original $b_j$ to annotate the additional $u_{i, j}$ flow that is lost. 


---
### **Vertex Splitting**

Vertex splitting method make us possible to model network flow problem where vertices is representing a mass balance constraint, but rather a capacity of some kind. The original arcs can still have costs or whatever. 


