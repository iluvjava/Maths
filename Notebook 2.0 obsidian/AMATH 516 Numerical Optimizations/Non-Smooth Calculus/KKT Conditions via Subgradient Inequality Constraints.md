[[../Background/Introducing The KKT Conditions]], [[Fritz John Conditions]]

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
>       \mathbf 0 \in \partial f(x^+) + \sum_{i\in I}^{}\partial g_i(x^+) & \ \text{stationarity}, \\
>       \forall i \in I \; \lambda_i g_i(x^+) = 0  & \substack{\text{complementary} \\ \text{slackness}}, 
>   \end{cases}
> \end{aligned}
> $$
> holds. 

**Theorem: KKT Sufficient Conditions**
> Suppose that all functions $f, g_i, \cdots, g_m$ are convex and that $x\in X, \lambda \in \mathbb R^m$ and the following list of conditions are satisfied: 
> 1. $\forall i \in I\; g_i(x)\le 0$, primal feasibility;
> 2. $\forall i\in I\; \lambda_i \ge 0$, dual feasibility;
> 3. $\mathbf 0\in \partial f(x) + \sum_{i \in I}\lambda_i g_i(x)$, stationarity;
> 4. $\forall i \in I\; \lambda_i g_i(x) = 0$, complementary slackness. 
> 
> Then $x$ solves $(P)$. 

**Observations**:
Slater's conditions are not stated here, this establishes the converse of the statement "KKT Necessary Conditions"

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

---
### **Proof of The Necessary Conditions**

#UNFINISHED


---
### **Proof of The Sufficient Conditions**





