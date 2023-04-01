[[Min Cost Network Flow Standard Form]]

---
### **Intro**

Given a network flow $x^\circ$ on graph $G = (A, N)$ such that the graph satisfies the standard form for network flow, and it's feasible. Then, we can apply a transform given $x^\circ$ to get the residual graph, we denoted it using $G(x^\circ)$. We illustrate it using an minimal example. 

**Example**

Suppose that we have an arc $(i, j)$ given as: 
$$
\begin{aligned}
    (i, b_i) \overset{x_{i,j}^\circ}{\underset{(c_i, u_{i, j})}{\longrightarrow}} (j, b_j)
\end{aligned}
$$

the residual models the amount of given flow as a reverse arc, and the vacancy as an arc pointing in the same direction. After applying the transform, we obtain the following: 

$$
\begin{aligned}
    (i, b_i) 
    \overset{x'_{i, j}}
    {
        \underset{(-c_{i, j}, x_{i, j}^\circ)}{\longleftarrow}
    }
    \overset{
        x'_{j, i}
    }
    {
        \underset{(c_{i, j}, u_{i, j} - x^\circ_{i, j})}{\longrightarrow}
    }
    (i, b_j)
\end{aligned}
$$

Take note that, in the residual graph, we would need additional decision variables for a given edge to model additional flow the is flowing on the residual network. For flow that exists in the residual graph, we denote it using $x'$. 

**Observe that**
- When $x_{i, j}^\circ = 0$, then this particular edge does change because the reverse arc has a capacity of zero, making it useless. 
- Observe that, if the $x^\circ$ saturated the capacity, then original arc is replaced with an arc with zero capacity on the residual graph, who would have the same upper bound capacity. 
- The reverse arcs now has negative cost and it's on full capacity. This reverse edge models the fact that if we send reverse flow, that is equivalent of sending "vacancy" along it, which corresponds to not sending mass, which saves money, justifying its negative cost in the residual graph. 
- The original arc is not modified with a reduce capacity, and it models the amount vacancy remains in this direction when a flow of $x_{i, j}^\circ$ has been sent through the arc. 

**References**: Network Flow, Theory, Algorithm, and Applications. 

---
### **Residual Flow**

We want the non-negative flow to satisfy $x'$ as $x'_{i, j} - x'_{j, i} = x_{i, j} - x^\circ_{i, j}$ where one of $x_{i, j}', x_{j, i}'$ has to be zero (or, they cannot both be strictly positive), which is saying that the difference of flow $x'$ models the changes based on the feasible flow: $x_{i, j}^\circ$. We define it as: 

$$
\begin{aligned}
    \begin{cases}
        x'_{i, j} = x_{i, j} - x^\circ_{i, j}, x_{j, i}' = 0
        &\text{when } x^\circ_{i, j}\le  x_{i, j} \le u_{i, j}
        \\
        x'_{j, i} = x^\circ_{i, j} - x_{i, j}, x_{i, j}' =  0
        & \text{when }
        x_{i, j} \le x^\circ_{i, j}
    \end{cases}
\end{aligned}
$$

and this will be the flow on our residual network. This zero constraint for the flow corresponds to the choice that we either choose to reduce the existing feasible flow, OR, we choose to add on the existing feasible flow. Using the flow $x'$ in the residual graph, and the given feasible flow $x^\circ$, we are able to represent all possible flow $x$ in the original graph $G$. Observe that: 

- For any single $x_{i, j}$ in graph $G$, it's being decomposed into $x_{i, j}',x'_{j, i}$ in $G(x^\circ)$. 
- We attained feasibility for the flow $x_{i, j}, x_{j, i}$ on the residual network from the above definition. 
- Under the first case, we have $x_{i, j}^\circ \le x_{i, j}\le u_{i, j}$, with $x_{j, i} = 0$, giving us $x_{i, j}' - x_{j, i}' = x_{i, j}' = x_{i, j} - x_{i, j}^{\circ}$. 
- Under the second case with $x_{i, j} \le x_{i, j}^\circ$ we have $x_{i, j}' = 0$, giving us $x_{i, j}' - x_{j, i}' = -x_{j, i}'=x_{i, j} -x_{i, j}^\circ$ too. 

We have seemed that the residual flow $x'$ is feasible in the residual graph $G(x^\circ)$ with feasible $x^\circ$, and we verify the relations stated at the start. 

**Theorem**

> Base on previous discussion, we let $c'$ to denote the cost on the residual network, we then show the relationship that: 
> $$
> \langle c', x'\rangle = \langle c, x\rangle - \langle c, x^\circ\rangle. 
> $$
> The total costs of the flow on the residual network is the costs of the original network subtract the flow of the existing feasible flow. 

**Proof**

For every arc $(i, j)\in A$, $c_{i, j}' = c_{i, j}, c_{j, i}' = c_{i, j}$, we then compute the costs on the residual network on a single arc with our residual flow $x'$, given as:

$$
\begin{aligned}
    & c'_{i, j}x_{i, j}' + c_{j, i}'x_{i, j}'
    \\
    = & c_{i, j}x'_{i, j} - c_{i, j}x'_{i, j}
    \\
    = & c_{i, j}(x_{i, j}' - x_{j, i}')
    \\
    = & c_{i, j}(x_{i, j} - x_{i, j}^\circ)
    \\
    = & c_{i, j}x_{i, j} - c_{i, j}x_{i, j}^\circ
\end{aligned}
$$

therefore, when we sum up the costs of the whole network, we will obtain the theorem above. 

**References**: Page 45, 46 of Network Flow, Theory, Algorithm, and Applications.

---
### **Optimality Conditions on the Residual Graph**

> A feasible solution $x^\circ$ of the minimum cost flow problem is an optimal solution if and only if the residual network $G(x^\circ)$ contains non negative directed cycles. 

**References**: Theorem 3.8 in Network Flow algorithm and applications textbook. 



