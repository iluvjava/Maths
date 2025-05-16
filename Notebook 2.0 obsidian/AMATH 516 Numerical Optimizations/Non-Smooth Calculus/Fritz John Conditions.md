- [[Minimizers of Smooth Non-smooth Sum]], 
- [[Subdifferentials Subgradient Computations]]


---
### **Intro**

Armed with subgradients calculus, we consider characterizing the minimizers for a function that is the sum over finite convex functions. 
This characterization that we are introducing encapsulate duality theory in the land of linear programming, but under some stricter assumptions, but it can also be used for constraints optimizations under different context. 

#### **Problem form**
> Let $f, g_1, \cdots, g_m$ be convex functions mapping from an Euclidean space to $\R$, let $I:= [m]$ be the index set $\{1, \cdots, m\}$, then the problem of constraint minimizations: 
> $$
>   \min_x f(x) \text{ s.t: } g_i(x) \le 0 \;\forall i \in I \tag{P}
> $$
> is equivalent to minimizing: 
> $$
>   F(x) := \max \left\lbrace f(x) - \mu, \max_{i\in I}g_i(x)\right\rbrace. 
> $$
> Where we assume the existence of a minimum $\mu$ define to be the minimum attained by the first form, i.e: $\mu = \inf_{x}\{f(x)| g_i(x) \le 0\; \forall i \in I\}$. 

**Proposition**
> The solution to $\min_{x} F(x) = 0$ is exactly the solution to the original constraint optimization problem, assuming the minimizer exists. 

**Proof**

If $x$ solves equation $\min_x F(x) = 0$, then $f(x) \le \mu$ by definition of $F$. 
Simultaneously, $g_i(x) \le 0\;\forall i \in I$. 
Since $x$ is feasible, it must be that $f(x) = \mu$ by definition of $\mu$. 
The proof is done. 
Infeasibility will imply that $F(x) > 0$ for all $x$. 


#### **Theorem | The Fritz John Conditions**
> Assuming that all $g_i(x), i\in I$ are all convex and that $x$ solves (P).
> The Fritz John condition is the following set of conditions. 
> There exists $\alpha_i \ge 0 \;\forall i\in [m]$, $\min_{i \in I}\alpha_i > 0$ such that
> $$
> \begin{aligned}
>   &\mathbf 0 \in \alpha_0 f(x) + \sum_{i \in I}^{}\alpha_i \partial g_i(x), 
>   \\
>   & \alpha_ig_i(x) = 0 \;\forall i \in I. 
> \end{aligned}
> $$

**Note**

The second condition is often referred to be the complementary slackness condition. 

**First Observation**: 

If all the $\alpha_i = 0$, and assuming that the complementary slackness is true, then it's possible that all $g_i(x) \le 0$, which doesn't create problems immediately. 

**Proof**

Consider $g_0(\cdot) := f(\cdot) - \mu$, since $x$ solves (P) then $F(x) = 0 = \min_x F(x)$ hence by convexity of all the functions and the subgradient on point wise $\max$ of functions we have: 
$$
\begin{aligned}
    \mathbf 0 \in \text{conv}\left(
        \bigcup_{i\in T(x)} \partial g_i(x)
    \right)
\end{aligned}
$$
where $T(x) = \{0\}\cup \{i \in I| g_i(x)= 0\}$, denoting the list of tight constraints achieved by $x$ the minimizer, then $\forall i \in T(x) \;\exists \alpha_i \ge 0$ such that $\sum_{i\in T(x)}^{}\alpha_i = 1$, implying that not all $\alpha_i = 0$, and then: 
$$
\begin{aligned}
    \mathbf 0 \in \alpha_0 \partial f(x) + \left(\sum_{i \in T(x)\setminus \{0\}}^{} \alpha_i \partial g_i(x)
    \right). 
\end{aligned}
$$
Then the first part of the theorem is shown, next, consider setting $\alpha_i = 0$ for all $i\in I \setminus T(x)$ then $\alpha_i g_i(x) = 0\; \forall i \in I$ because whenever $\alpha_i\not= 0$, we have $i \in T(x) \implies g_i(x) = 0$, complementary slackness holds. 

**Remarks**

Fritz John conditions describes all the linear programing problems that has a minimizer. It's describing that: 
$$
\begin{aligned}
    \alpha_0(-c) \in \left(\sum_{i\in T(x)\setminus \{0\}}^{}
        \alpha_i a_i
    \right), 
\end{aligned}
$$

using the fact that the constraint $g_0 = f(x) - \mu$ is achieved, we are able to choose $\alpha_0 > 0$, hence dividing both side by $\alpha_0$, we get the condition that: 
> The minimizer of a linear program is a point where, there exists a convex combinations of the tight constraints such that it equals to the negative objective vector: $-c$. And complenary slackness holds. 

The $\alpha_i$ in this case, is relevant to the dual variables of the linear programs. 
The convex conbination conditions for $\alpha_i$ stating that $\Sigma_{i\in I(x)}\alpha_i = 1$ still remains true regardless of not appearing in the theorem statement, we just get a more restrictive statement if we do that, therefore due to the fact that the hypothesis of the statement didn't specify this conditions, we shouldn't care too much about it. 



