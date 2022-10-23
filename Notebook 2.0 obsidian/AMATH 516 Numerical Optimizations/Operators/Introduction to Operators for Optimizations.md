[[Multivalued Functions, Set-valued Mappings]]

---
### **Intro**

Due to the fact that there are so much things with operators, and monotone operator, here we will summarized different type of operators as an introduction. When we refers to operators, we are referring to a set-valued mapping. 

Operator in general, introduces a relations between the 2 sets, or the set itself. It's a pairing between elements from the domain and the range of the operator. The inverse of an operator in this sense, simply invert the domain and range of the operator. 


**References**
1. \<Large-scale convex Optimizations: Algorithms and analysis via Monotone Operators\> by Ernest K. Ryu & Wotao Yin. A very complicate textbook, which should serve as primary references. 
2. \<A Primer on Monotone Operators\>, this one is a really good one! The collections are extremely good.  See [Primer on Monotone Operators](Primer%20on%20Monotone%20Operators.pdf) for more. 

---
### **Lipschitz Operator**

> And operator is called *Lipschitz* with a constant $L$ when for any $(u, v)\in \text{gph}(F), u \in F(x), v \in F(y)$ we have the inequality: 
> 
> $$
> \begin{aligned}
>     \Vert u - v\Vert_2 \le L \Vert x - y\Vert_2,
> \end{aligned}
> $$

For simplicity we use the 2 norm to formulate the definition. And please observe that, for any operator to be Lipschitz, it has to be the case that the operator is single valued. If this is not true, the LHS of the function can simply chosen to be $u\in F(x), v\in F(x)$ with $u\neq v$, giving us a contradiction. An operator is called *nonexpansive* if its Lipschitz constant is $\le 1$. An operator is called a *contraction* if $L< 1$. 

**properties**

1. The set of Lipschitz operators are closed under addition and composition. 


---
### **Monotone and Maximally Monotone Operator**




---
### **Fixed Points of the Operator**

> When $f$ is nonexpansize and domain of $F$ is $\mathbb R$, then the set of fixed point of the operator is: 
> 
> $$
> \begin{aligned}
>     \left\lbrace
>         x\in \text{dom}(F)| x = F(x)
>     \right\rbrace = 
>     (I - F)^{-1}(0), 
> \end{aligned}
> $$

**Theorem: The set of fixed point for an nonexpansive operator is a closed and convex set**

> Assuming that $F$ is nonexpansive, then the fixed point of the operator has to be a convex set. In the case when $F$ is a contraction, the set of fixed point will have to be a singleton. 

**Proof**: 
To prove, we suppoe that $x, y \in X$, with $\theta \in [0, 1]$, and then we will show that $z = \theta x + (1 - \theta)y$ will again have to be a fixed point of the operator as well, additionally it has to on the line segment for all valid $\theta$, this is true because: 

$$
\begin{aligned}
    & \Vert Fz - x\Vert_2 = (1 - \theta)\Vert y - x\Vert_2
    \\
    & \Vert Fz - y\Vert_2 = \theta \Vert y - x\Vert_2
    \\
    \implies &
    \Vert x - y\Vert_2 = \Vert x - Fz + Fz - y\Vert_2 \le 
    \Vert Fz - x\Vert_2 + \Vert Fz - y\Vert_2 = \Vert x - y\Vert_2, 
\end{aligned}
$$

And the last line suggest that the point $Fz$ must lies on the line segment $[0, 1]$, for all value of $\theta\in [0, 1]$, implying the fact that the set $X$ has to be a convex set. 

---
### **An Averaged Operator**


**Definition**: 

> Let $F$ be an averated operator then $F := (1 - \theta) I + \theta G$ where $\theta \in (0, 1)$, and $G$ has to be a nonexpansive operator. Consequently, the fixed point of $F$ will have to be a fixed point of $G$ as well. 


**Properties**:
1. The set of averaged operator is closed under composition. 
2. It's definitely a subset of Lipschitz Operators. 

**Theorem: Averaged Operator has Fixed Point Convergence**

> Let $F$ be an averaged operator, then the fixed point iterations, defined as $x^{(k + 1)} = Fx^{(k)}$ monotonically converges to a point on the fixed point set of the operator, provided that the fixed poin set $X$ exists. Additionally, the rate of convergence is $\mathcal O(1/\sqrt(k))$. 

**Proof**

Observe the following tweak of Jensen's inequality is true: 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2, 
\end{aligned}
$$

which is not hard to verify, and it would be easier to verify by starting on the right side of the equation first. Next, by definition of $F$ being an averaged operator, it would mean that $F = (1 - \theta)I + \theta G$ where $G$ is nonexpansive. We denote an fixed point $\bar x\in X$, we start by considering that: 

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

immediately observe that it's decreasing monotonically, and that gives an recursion to work with, unrolling the recurison, we have: 

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

Therefore, the squared norm of the residuals, $Gx^{(j)} - x^{(j)}$ will converges sublinearly with rate $\mathcal O(1/k)$. 


**Remarks**

In many cases, when the given gradient of a function is strongly smooth, meaning that it has an upper bound on it's lipschitz constant, then fixed sized gradient descend with $2/L$ will be a fixed point iteration that converges. The convergence is pessimistic, and it doesn't require the monotone property from the function, additionally, it also includes dynamical system that are not neccesarily a gradient system. 


---
### **Example: Convex Sets Projection Operator**

Recall from [[Convex Sets Projections and Dist, Intro]], and [[Convex Sets Projection Obtuse Angle Theorem]], the projection operator onto a convex set is a *nonexpansive operator* that is also *monotone*. 



---
### **Example: The Subgradient and Proximal Operators**


