[Introducing The KKT Conditions](../Background/Introducing%20The%20KKT%20Conditions.md), [Fritz John Conditions](Fritz%20John%20Conditions.md), [Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md). 

---
### **Intro**

In simple terms, KKT conditions characterize the optimal solution to a constraint programming problem using a system of equations with inequality. 

**Overall Assumptions:**
1. $f, g_1, \cdots, g_m$ are all functions of $X \mapsto \mathbb R$. 
2. $I:= \{1, \cdots, m\}$ and we consider the problem $(P)$ of solving: 
    $$
        \min_x f(x) \text{ s.t: } g_i(x)\le 0 \; \forall i \in I 
        \tag{P}
    $$
3. The optimal value of $(P)$ is defined to be $\mu:= \inf\{f(x) \;|\; g_i(x)\le 0 \; \forall i \in I\}$. 
4. When we say that $x$ solves $(P)$ we mean that the minimum is achieved and, all the constraints are satisfied. 

**Theorem:KKT Necessary Conditions**
> let $f, g_1, \cdots, g_m$ all be convex and that $x^+$ solves $(P)$, assume that the *[Slater's Condition](https://en.wikipedia.org/wiki/Slater%27s_condition)* holds i.e: $\exists s\in X\;\forall i \in I\; g_i(s) < 0$, then there exists the Lagrange multipliers $\lambda_1 \ge 0, \cdots, \lambda_m \ge 0$ such that the KKT conditions: 
> $$
> \begin{aligned}
>   \begin{cases}
>       \mathbf 0 \in \partial f(x^+) + \sum_{i\in I}^{} \lambda_i \partial g_i(x^+) & \ \text{stationarity}, \\
>       \forall i \in I \; \lambda_i g_i(x^+) = 0  & \substack{\text{complementary} \\ \text{slackness}}, 
>   \end{cases}
> \end{aligned}
> $$
> holds. 

**Observations**: 

The convexity of the function $g_i(x)$ here helps engineering the convexity into the constraints. For example, given any convex function $g_i(x)$, $g_i(x) \le 0$ defines the level set of the function $g_i$. Then, we have the conditions $\partial g_i(x^+)$ transformed into $N(x^+| \text{lev}_{0}(g_i))$, which it then says that $\partial f(x^+)\in - N(x^+| \text{lev}_{0}(g_i))$. The Slater point condition then translate to the fact that $\bigcap_{i\in I}\text{ri.dom}(g_i)\neq 0$, the strong conditions for the subgradient sum rule, this is relevant to the first condition: "stationarity" of the Fritz John conditions due to a use of the strong subgradient sum. 

The necessary conditions can be seemed as s special case of the Fritz John conditions where the Slater point conditions allowed us to set $\alpha_0 = 0$, deriving a new conditions, removing the "not all zeros" assumptions for the Fritz John Coefficients. 

**Theorem: KKT Sufficient Conditions**
> Suppose that all functions $f, g_i, \cdots, g_m$ are convex and that $x\in X, \lambda \in \mathbb R^m$ and the following list of conditions are satisfied: 
> 1. $\forall i \in I\; g_i(x)\le 0$, primal feasibility;
> 2. $\forall i\in I\; \lambda_i \ge 0$, dual feasibility;
> 3. $\mathbf 0\in \partial f(x) + \sum_{i \in I}\lambda_i g_i(x)$, stationarity;
> 4. $\forall i \in I\; \lambda_i g_i(x) = 0$, complementary slackness. 
> 
> Then $x$ solves $(P)$. 

**Observations**:

Slater's conditions are not stated here, this establishes the converse of the statement "KKT Necessary Conditions". It's probably hidden somewhere as a derivative of the new conditions added to make the converse of the statement true. 

**Corollary: KKT Full Conditions**
> If $f, g_1, \cdots, g_m$ are all convex and the Slater's conditions holds , then $x^+$ solves $(P)$ if and only if there exists $\lambda\in \mathbb R_m$ such that: 
> 1. $\forall i \in I\; g_i(x)\le 0$, primal feasibility;
> 2. $\forall i\in I\; \lambda_i \ge 0$, dual feasibility;
> 3. $\mathbf 0\in \partial f(x) + \sum_{i \in I}\lambda_i g_i(x)$, stationarity;
> 4. $\forall i \in I\; \lambda_i g_i(x) = 0$, complementary slackness. 
> 
> Holds. 

**Proof**: 
By the first 2 theorems. 

**References**: Provided exclusively by Professor Heinz and his convex optimization class. 

---
### **Proof of The Necessary Conditions**

From the Fritz John conditions: 

$$
\begin{aligned}
    & \exists\; \alpha_1 \ge 0 \forall i \in I: \exists i \in I\; \alpha_i > 0 
    & \quad (1)
    \\
    & \mathbf 0 \in \alpha_0 \partial f(x) + \sum_{i \in I}^{}\alpha_i \partial g_i(x) 
    & \quad (2)
    \\
    & \alpha_i g_i(x) = 0 \; \forall i \in I
\end{aligned}
$$

We show that $\alpha_0 > 0$ by assuming for contradiction that $\alpha_0 = 0$. Let $v_i \in G_i(x), \forall i$, which is possible from $(1), (2)$ such that: 

$$
\begin{aligned}
    &
    \sum_{i \in I}^{} \alpha_i v_i = \mathbf 0
    \\
    & 
    \forall i \in I: 
    g_i(x) + \langle  s- x, v_i\rangle \le g_i(s)
    \\
    \implies & 
    \mathbf 0 = 
    \langle  s - x, \mathbf 0\rangle 
    = 
    \sum_{i\in I}^{}
    \langle  s - x, \alpha_i v_i\rangle < 
    \sum_{i\in I}^{}\alpha_ig_i(s), 
\end{aligned}
$$

where on the last step, we proceeded to sum up the subgradients and using the fact that their $\alpha_i$ weighted sum is still zero. The contradiction arises from (1), $\exists \alpha_i > 0$ and $\alpha_i \ge 0$ for all $i\in I$, this consequently imply that $\sum_{i \in I}^{}\alpha_i g_i(s) < 0$ using the fact that $s$ makes $g_i(s) < 0$ because it's a Slator point, this is the contradiction. Therefore, we can divides $\alpha_0 > 0$ on (2) to obtain the condition: 
$$
\begin{aligned}
    \mathbf 0 \in \partial f(x) + \sum_{ i\in I}^{}\alpha_i \partial g_i(x), 
\end{aligned}
$$

and this is now done and the claim is verified. 

**Remarks**: 

This necessary conditions can be viewed as the Fritz John conditions turned stronger when we assumed for the additional Slater's conditions, then we have the additional $\alpha_0\neq 0$ and the non-zero conditions on the Fritz John multipliers has been removed as well. 


---
### **Proof of The Sufficient Conditions**

**Recall**: 

When primal, dual feasibility, stationarity and complementary slackness conditions hold for the KKT then the attain the converse and $x$ satisfying these conditions will be the optimal that solves (P). 

**Proof**: 
From primal feasibility, we take $x$ such that primal feasibility is true, now we define the function: 

$$
\begin{aligned}
    h := f + \sum_{ i \in I}^{}\lambda_i g_i, 
\end{aligned}
$$

where the $\lambda$ is the quantity taken from the necessary conditions of the KKT, then $h$ is a convex function by the dual feasibility, and from the subgradient sum rule (weak sum rule) and the stationary, we attain: 

$$
\begin{aligned}
    \mathbf 0 \in f(x) + \sum_{ i\in I}^{} \alpha_i \partial g_i(x) \subseteq
    \partial h(x), 
\end{aligned}
$$

and therefore, $x$ will be a global minimizer for $h$, now let $y\in X$ be feasible for (P), so that $g_i(x)\le 0$ for all $i\in I$, we show that: 

$$
\begin{aligned}
    f(x) &= f(x) + \underbrace{\sum_{ i\in I}^{} \lambda_i g_i(x) }_{= 0} = h(x) \le h(y)
    \\
    & = f(y) + \sum_{i\in I}^{} \lambda_i g_i(x) \le f(y), 
\end{aligned}
$$

therefore, the value $x$ attained minimizer status. Note that on the first line we use the complemenary slackness, and on the second line we used complementary slackness again. The inequality on the first line is simply that $x$ is the minimizer of the function h. 

**Remarks**: 


