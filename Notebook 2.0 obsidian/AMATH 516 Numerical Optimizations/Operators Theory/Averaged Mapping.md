[[Introduction to Operators for Optimizations]], [[Nonexpansive Operators]]

### **Intro**

Average operator is nonexpansive. Firmly nonexpansive operators are a subset of averaged operators. 

**Definition: Averaged Operator**

> Let $F$ be an averaged operator if $F := (1 - \theta) I + \theta G$ where $\theta \in (0, 1)$, and $G$ has to be a non-expansive operator. Consequently, the fixed point of $F$ will have to be a fixed point of $G$ as well. 


**Properties**:
1. The set of averaged operator is closed under composition. 
2. It's definitely a subset of Lipschitz Operators. 

**Theorem: Averaged Operator has Fixed Point Convergence (Fejer Convergence)**

> Let $F$ be an averaged operator, then the fixed point iterations, defined as $x^{(k + 1)} = Fx^{(k)}$ monotonically converges to a point on the fixed point set of the operator, provided that the fixed poin set $X$ exists. Additionally, the rate of convergence is $\mathcal O(1/\sqrt(k))$. 

**Proof**

From [[Euclidean Jensen's Equality]]: 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2, 
\end{aligned}
$$

which is not hard to verify, and it would be easier to verify by starting on the right side of the equation first. Next, by definition of $F$ being an averaged operator, it would mean that $F = (1 - \theta)I + \theta G$ where $G$ is non-expansive. We denote an fixed point $\bar x\in X$, we start by considering that: 

$$
\begin{aligned}
    \Vert x^{(k + 1)} - \bar x\Vert^2 
    &= 
    \Vert (1 - \theta)x^{(k)} + \theta Gx^{(k)} - \bar x\Vert^2
    \\
    &= 
    \Vert (1 - \theta) (x^{(k)} - \bar x) + \theta (x^{k} - \bar x)\Vert
    \\
    &= 
    (1 - \theta)\Vert x^{(k)} - \bar x\Vert^2
    + 
    \theta 
    \underbrace{\Vert Gx^{(k)} - \bar x\Vert^2}_{\le \Vert x^{(k)} - x^{(k)}\Vert^2}
    - \theta (1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert
    \\
    & \le 
    \Vert x^{(k)} - \bar x\Vert^2 - \theta(1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert^2, 
\end{aligned}
$$

immediately observe that it's decreasing monotonically, and that gives an recursion to work with, unrolling the recursion, we have: 

$$
\begin{aligned}
    \Vert x^{(k + 1)} - \bar x\Vert^2 \le &
    \Vert x^{(0)} - \bar x\Vert - \theta(1 - \theta)\sum_{i= 0}^{k}
    \Vert Gx^{(i)} - x^{(i)}\Vert^2
    \\
    \sum_{j = 0}^{k}
    \Vert Gx^{(j)} - x^{(j)}\Vert^2
    \le &
    \frac{\Vert x^{(0)} - \bar x\Vert^2}{\theta(1 - \theta)},
\end{aligned}
$$

Since the series converges, we know that the limit of $Gx^{(j)} - x^{(j)}$ equals to the zero vector. Additionally, the rate of the convergence can be derived using the monotone convergence property and consider that: 
$$
\begin{aligned}
    \min_{j = 0, \cdot, k} \Vert Gx^{(j)} - x^{(j)}\Vert^2
    \le 
    \frac{\Vert x^{(0)} - x^+\Vert^2}
    {(k + 1)\theta(1 - \theta)}.
\end{aligned}
$$

Therefore, the squared norm of the residuals, $Gx^{(j)} - x^{(j)}$ will converges sub-linearly with rate $\mathcal O(1/k)$. And the fast rate of convergence is given when $\theta = \frac{1}{2}$. 


**Remarks**

In many cases, when the given gradient of a function is strongly smooth, meaning that it has an upper bound on it's Lipschitz constant, then fixed sized gradient descend with $2/L$ will be a fixed point iteration that converges. The convergence is pessimistic, and it doesn't require the monotone property from the function, additionally, it also includes dynamical system that are not necessarily a gradient system. 

Take note the that bound is very pessimistic. With additional assumption such as the fact that the operator $G$ is monotone, we can derive the rate of convergence for the optimality, and with the assumption that $G$ is strongly monotone, we can derive that it has a linear convergence rate for a suitable step sizes. 


**Reference**: [[../../MATH 999 Paper Reviews and Frontier Mathematics/References Sep 2022/Primer on Monotone Operators.pdf]]. 



