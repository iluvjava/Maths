- [Introducing The KKT Conditions](../Background/Introducing%20The%20KKT%20Conditions.md), 
- [Fritz John Conditions](Fritz%20John%20Conditions.md), 
- [Subdifferentials Subgradient Computations](Subdifferentials%20Subgradient%20Computations.md). 

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

The following theorem states that, the existence of a Slator point is the necessary condition for KKT. 

#### **Theorem | KKT Necessary Conditions**
> let $f, g_1, \cdots, g_m$ all be convex and that $x^+$ solves $(P)$, assume that the *[Slater's Condition](https://en.wikipedia.org/wiki/Slater%27s_condition)* holds i.e: $(\exists s\in X)\;(\forall i \in I)\; g_i(s) < 0$. 
> Then, there exists the Lagrange multipliers $\lambda_1 \ge 0, \cdots, \lambda_m \ge 0$ such that the following KKT conditions hold: 
> $$
> \begin{aligned}
>   \begin{cases}
>       \mathbf 0 \in \partial f(x^+) + \sum_{i\in I}^{} \lambda_i \partial g_i(x^+) & \ \text{stationarity}, \\
>       (\forall i \in I) \; \lambda_i g_i(x^+) = 0  & \substack{\text{complementary} \\ \text{slackness}}. 
>   \end{cases}
> \end{aligned}
> $$
> 

**Observations**: 

$g_i(x)$ adds convexity to the constraints because they are all convex functions. 
For any convex function $g_i(x)$, $g_i(x) \le 0$ defines the level set of the function $g_i$. 
Because $x^+$ solves $(P)$, it's in level set zero of the constraint indicator function of $\{x : g_i(x) \le 0\; (\forall x \in I)\}$. 
By the level set property it says that $\partial f(x^+)\subseteq - N(x^+| \text{lev}_{0}(g_i))$. 
Assuming $\bigcap_{i\in I}\text{ri.dom}(g_i)\neq 0$. 
Then strong subgradient sum rule has: 
$$
\begin{aligned}
    \partial \left[
        \cdot \mapsto \sum_{i \in I}^{} \delta( \; \cdot \; | \;\text{lev}_0(g_i))
    \right](x^+) 
    &= \sum_{i \in I}^{}  N(x^+ |\; \text{dom}\; g_i) 
    = \sum_{i \in I}^{} -\partial g_i(x^+). 
\end{aligned}
$$
This now looks similar to the first stationary condition of KKT Necessary condition, if, we assume strong sum rule of the subgradients on constraint function, which in terms also assumed non-critical intersection for the domain of the constraint functions. 

**Proof**

Suppose $x$ solves $(P)$ then, the set of Fritz John conditions is true and, it has: 

$$
\begin{aligned}
    &(\forall i \in I):\alpha_1 \ge 0 \ \wedge (\exists \;i \in I): \alpha_i > 0, 
    & \quad (1)
    \\
    & \mathbf 0 \in \alpha_0 \partial f(x) + \sum_{i \in I}^{}\alpha_i \partial g_i(x), 
    & \quad (2)
    \\
    &(\forall i \in I)\; \alpha_i g_i(x) = 0. 
\end{aligned}
$$

We claim that: $\alpha_0 \neq 0$. 
For contradiction assume $\alpha_0 = 0$. 
Take for all $i= 1, \ldots, m$, $v_i \in g_i(x)$, let $s\in X$ be a point where the Slater's conditions are satisfied, labeling the condition: 

$$
\begin{aligned}
    (\forall i \in I)\; g_i(s) < 0. 
\end{aligned}\tag{a}
$$

Then it has:

$$
\begin{aligned}
    &(\forall i \in I): g_i(x) + \langle  s- x, v_i\rangle \le g_i(s), 
    &(3)
    \\
    &\hspace{0.2em}\underset{\text{(2)}}{\implies} 
    \mathbf 0 = \sum_{i \in I}^{} \alpha_i v_i, 
    &(4)
    \\
    &\implies
    0\underset{\text{(4)}}{=} 
    \sum_{i\in I}^{}
    \langle  s - x, \alpha_i v_i\rangle 
    \underset{\text{(3)}}{\le}
    \sum_{i\in I}^{}\alpha_ig_i(s) \underset{\text{(a)}}{<} 0
\end{aligned}
$$

Therefore, we can divide $\alpha_0 > 0$ on (2) to obtain the condition: 
$$
\begin{aligned}
    \mathbf 0 \in \partial f(x) + \sum_{ i\in I}^{}(\alpha_i/\alpha_0) \partial g_i(x). 
\end{aligned}
$$

$\blacksquare$



#### **Theorem | KKT Sufficient Conditions**
> Suppose that all functions $f, g_i, \cdots, g_m$ are convex and, that $x\in X, \lambda \in \mathbb R^m$ and, the following list of conditions are satisfied: 
> 1. $\forall i \in I\; g_i(x)\le 0$, primal feasibility;
> 2. $\forall i\in I\; \lambda_i \ge 0$, dual feasibility;
> 3. $\mathbf 0\in \partial f(x) + \sum_{i \in I}\lambda_i g_i(x)$, stationary;
> 4. $\forall i \in I\; \lambda_i g_i(x) = 0$, complementary slackness. 
> 
> Then $x$ solves $(P)$. 

**Note**

An optimal point would satisfy all 4 conditions while for all feasible point only item (1.), (2.) will be satisfied. 
Item (3.), (4.) are necessary conditions in the first theorem. 

**Proof**

Let's label the conditions in the theorem hypothesis: 
1. (a): Primal feasibility,
2. (b): Dual feasibility,
3. (c): Stationarity,
4. (d): complementary slackness. 

Fix such $x$ that satisfies all 4 conditions.
Define: $h := f + \sum_{ i \in I}^{}\lambda_i g_i$, which is a convex function. 
Stationary condition is true and, the weak sum rule of subgradient has: 

$$
\begin{aligned}
    \mathbf 0 \in f(x) + \sum_{ i\in I}^{} \alpha_i \partial g_i(x) \subseteq
    \partial h(x). 
\end{aligned}
$$

Therefore, $x$ is a global minimizer of $h$ by convexity.
For any $y\in X$ that is primal and dual feasible, i.e: y satisfies condition (a), (b).
Then, it has:

$$
\begin{aligned}
    h(x) 
    &= 
    f(x) + \sum_{ i\in I}^{} \lambda_i g_i(x)
    \underset{\text{(d)}}{=} h(x) + 0 \le h(y)
    = f(y) + \sum_{i\in I}^{} \lambda_i g_i(y) 
    \underset{\text{(a), (b)}}{\le} f(y). 
\end{aligned}
$$

Therefore, $x$ solves $(P)$. 


#### **Corollary | KKT Full Conditions**
> If $f, g_1, \cdots, g_m$ are all convex and the Slater's conditions holds, then $x^+$ solves $(P)$ if and only if there exists $\lambda\in \mathbb R_m$ such that:  
> 1. $\forall i \in I\; g_i(x)\le 0$, primal feasibility;
> 2. $\forall i\in I\; \lambda_i \ge 0$, dual feasibility;
> 3. $\mathbf 0\in \partial f(x) + \sum_{i \in I}\lambda_i g_i(x)$, stationary;
> 4. $\forall i \in I\; \lambda_i g_i(x) = 0$, complementary slackness. 

**Proof**: 

By the first 2 theorems. 

**References**: 

Provided exclusively by Professor Heinz and his convex optimization class in UBCO. 
