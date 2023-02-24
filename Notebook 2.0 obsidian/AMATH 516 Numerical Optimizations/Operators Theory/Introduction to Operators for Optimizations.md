[[Multivalued Functions, Set-valued Mappings]]

---
### **Intro**

Due to the fact that there are so much things with operators, and monotone operator, here we will summarized different type of operators as an introduction. When we refers to operators, we are referring to a set-valued mapping. 

Operator in general, introduces a relations between the 2 sets, or the set itself. It's a pairing between elements from the domain and the range of the operator. The inverse of an operator in this sense, simply invert the domain and range of the operator. 


**References**
1. **\<Large-scale convex Optimizations: Algorithms and analysis via Monotone Operators\>** by Ernest K. Ryu & Wotao Yin. A very complicate textbook, which should serve as primary references. 
2. **\<A Primer on Monotone Operators\>**, this one is a really good one! The collections are extremely good.  See [Primer on Monotone Operators](Primer%20on%20Monotone%20Operators.pdf) for more. 
3. **\<Convex Analysis and Monotone Operator Theory in Hilbert Spaces\>**, this one is from Professor Heinz and it should be treated as an essential reference. 

---
### **Lipschitz Operator**

Lipschitz operator bound the distance between 2 points in the output space of the operator wrt the input space. [[Lipschitz Operator in Euclidean Space]]. In practice, we actually want [[Non-expansive Operators]], which is a type of operations that has a Lipschitz constant that is less than or equal to one. Under the best case we want to deal with operator that creates a contraction, see [[../../MATH 601 Functional Analysis/Functional Spaces/Banach Contraction in Metric Space]] for more information. 


**Definition: Non-Expansive Operator**
> The non-expansive operator has to be Lipschitz first and it has to be $X\mapsto X$, a , as a result, it has to be a single-valued mapping. A non-expansive operator has a Lipschitz constant of exactly $1$. 


**Definition: Contraction**
>  A contraction is a Lipschitz operator with a Lipschitz constant that is strictly less than one. 

---
### **Monotone and Maximally Monotone Operator**

**Definition: A Monotone Operator**:

> The operator $F$ is monotone when $\langle Fy - Fx, y - x\rangle \ge 0$ for all $x, y \in \text{dom}(F)$. 

For example, the subgradient operator of a convex function is monotone. 

**Definition: Strongly Monotone Operator**: 
> A monotone operator $T$ is strongly monotone with parameter $m$ if $\langle Tx - Ty, x - y\rangle \ge m \Vert x - y\Vert^2$ for all $x, y\in \mathbb E$. 

For example, the subgradient of a strongly convex function is a strongly monotone operator. 


---
### **Convex Fixed Point Set**


**Definition: Fixed Point Set**
> When $f$ is non-expansive and domain of $F$ is $\mathbb R$, then the set of fixed point of the operator is: 
> 
> $$
> \text{fix}(F) = 
> \begin{aligned}
>    \left\lbrace
>        x\in \text{dom}(F)| x = F(x)
>    \right\rbrace = 
>    (I - F)^{-1}(0), 
> \end{aligned}
> $$

**Theorem: The set of fixed point for an non-expansive operator is a closed and convex set**

> Assuming that $F$ is non-expansive, then the fixed point of the operator has to be a convex set. In the case when $F$ is a contraction, the set of fixed point will have to be a singleton. 

**Proof**: 

To prove, we suppose that $x, y \in \text{fix}(F)$ in the fixed point set of the operator $T$, with $\theta \in [0, 1]$, and then we will show that $z = \theta x + (1 - \theta)y$ will again have to be a fixed point of the operator as well, additionally it has to on the line segment for all valid $\theta$, this is true because: 

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

and the last line suggest that the point $Fz$ must lies on the line segment $[0, 1]$ because the equality of the triangle inequality is satisfied from the last expression, for all value of $\theta\in [0, 1]$, implying the fact that the set $X$ has to be a convex set. 

**References**: Primer on Monotone Operators. 

---
### **An Averaged Operator**


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

Therefore, the squared norm of the residuals, $Gx^{(j)} - x^{(j)}$ will converges sublinearly with rate $\mathcal O(1/k)$. And the fast rate of convergence is given when $\theta = \frac{1}{2}$. 


**Remarks**

In many cases, when the given gradient of a function is strongly smooth, meaning that it has an upper bound on it's Lipschitz constant, then fixed sized gradient descend with $2/L$ will be a fixed point iteration that converges. The convergence is pessimistic, and it doesn't require the monotone property from the function, additionally, it also includes dynamical system that are not necessarily a gradient system. 

Take note the that bound is very pessimistic. With additional assumption such as the fact that the operator $G$ is monotone, we can derive the rate of convergence for the optimality, and with the assumption that $G$ is strongly monotone, we can derive that it has a linear convergence rate for a suitable step sizes. 

---
### **Convex Sets Projection Operator, Proximal Operators**

Recall from that the projection operator onto a closed and convex set is a *non-expansive operator* that is also *monotone* and singled valued. This is true because the projector has a Lipschitz constant that is $\le 1$ (Showed in [[Convex Projection is L1 Lipschitz]]). The monotone property can be derived using the obtuse angle theorem. 

---
### **Example: The Subgradient and Proximal Operators**

#UNFINISHED : Keep filling up things about the operators. 


---
### **Concepts Central Hubs**

In here we list all the relevant and important concepts for equipping operator theory for optimization problem, these concepts will be more advanced. 

* [[Minty's Theorem, The Surjectivity Theorem]]
* [[Resolvent and Minty Paramaterization]]


