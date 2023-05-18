[[Introduction to Operators for Optimizations]], [[Firmly Nonexpansive Operators]]

---
### **Intro**

Average operator is nonexpansive. Firmly nonexpansive operators are a subset of averaged operators. 

**Definition | Averaged Operator**

> Let $F$ be an averaged operator if $F := (1 - \theta) I + \theta G$ where $\theta \in (0, 1)$, and $G$ has to be a non-expansive operator. Consequently, the fixed point of $F$ will have to be a fixed point of $G$ as well. 

**Properties**:
1. The set of averaged operator is closed under composition. 
2. It's definitely a subset of Lipschitz Operators. 

---
### **Characterizations**

We show that a similar equivalence characterization for the firmly nonexpansive also exists for the alpha-averaged operators. 

**Lemma: A useful Formula**
> 

**Theorem: Averaged Operator is Weaker than Nonexpansive**
> Let $T: X\mapsto X$, let $\alpha \in (0, 1)$, then $T$ is $\alpha$-averaged if and only if for all $x, y\in X$ we have: 
> $$
> \begin{aligned}
>     \Vert Tx - Ty\Vert^2 \le \Vert x - y\Vert^2 - \frac{1 - \alpha}{\alpha}
> \Vert (I - T)x - (I - T)y\Vert^2. 
> \end{aligned}
> $$

**Observations**

Setting $\alpha = 1/2$ in the above formula, we recover the definition for a firmly nonexpansive operator $T$. This is strictly weaker because changing the $\alpha$ value will produce formulas that doesn't correspond to firmly nonexpansive operators. 

**Proof**: 

Let $N$ be a firmly nonexpansive operator, by definition the averaged operator $T = (1 - \alpha)I + \alpha N$, so $N = (1 - \alpha^{-1})I + \alpha^{-1}T$. Write $u = x - y$ and $v = Tx - Ty$. 


#UNFINISHED 

**References**: 

Heinz's course notes, theorem 22.11. 

---
### **Fixed Point Convergences**

This type of non-expansive operator converges under fixed point iterations. 

**Theorem: Averaged Operator has Fixed Point Convergence**

> Let $F$ be an averaged operator, then the fixed point iterations, defined as $x^{(k + 1)} = Fx^{(k)}$ monotonically converges to a point on the fixed point set of the operator, provided that the fixed point set $X$ exists. Additionally, the rate of convergence is $\mathcal O(1/\sqrt{k})$. 

**Proof**

From [[../Background/Euclidean Jensen's Equality (Cute Formula)]]: 

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

the series converges by the fact that it's positive and bounded above, therefore the limit of $Gx^{(j)} - x^{(j)}$ equals to the zero vector. Therefore it converges to some point $\bar x$ satisfying $G\bar x = \bar x$. Additionally, the rate of the convergence can be derived using the monotone convergence property of the series: 
$$
\begin{aligned}
    (k + 1)
    \left(
        \min_{j = 0, \cdots, k} \Vert Gx^{(j)} - x^{(j)}\Vert^2
    \right)
    \le &
    \sum_{j = 0}^{k}
    \Vert Gx^{(j)} - x^{(j)}\Vert^2
    \le 
    \frac{\Vert x^{(0)} - \bar x\Vert^2}{\theta(1 - \theta)}
    \\
    \implies
    \min_{j = 0, \cdots, k} \Vert Gx^{(j)} - x^{(j)}\Vert^2
    \le & 
    \frac{\Vert x^{(0)} - \bar x\Vert^2}
    {(k + 1)\theta(1 - \theta)}.
\end{aligned}
$$

Therefore, the squared norm of the residuals, $Gx^{(j)} - x^{(j)}$ will converges sub-linearly with rate $\mathcal O(1/k)$. And the fast rate of convergence is given when $\theta = \frac{1}{2}$. 


**Remarks**

When the gradient of some function is strongly smooth, meaning that the gradient of the function is Lipschitz, then the gradient operator is Lipschitz. Multiplying it by a constant will make it nonexpansive. We skip the details here. 

Take note the that bound is very pessimistic. With additional assumption such as the fact that the operator $G$ is monotone, we can derive the rate of convergence for the optimality, and with the assumption that $G$ is strongly monotone, we can derive that it has a linear convergence rate for a suitable step sizes. 

This derivation is extremely similar to what we had for [[../Smooth Gradient Descend Remastered]], more specifically the smooth descend frameworks. 

For more about the theories for Fejer montone sequences, and their type of convergence is very special because it monotonically approaches all the points in the fixed point set, which is not obvious from what had been stated in here. Please refer too [[Fejer's Monotone]] for more information. 

**Reference**: See Primer on Monotone Operator for more information. [[../../MATH 999 Paper Reviews and Frontier Mathematics/References Sep 2022/Primer on Monotone Operators.pdf]]. 


---
### **Fejer Monotonicity**

Fixed point iteration of an averaged operator has Fejer Monotone convergence. 




