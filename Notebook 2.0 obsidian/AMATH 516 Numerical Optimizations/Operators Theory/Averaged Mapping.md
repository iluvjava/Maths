---
aliases:
  - Averaged Operators
---
[[Introduction to Operators for Optimizations]], [[Firmly Nonexpansive Operators]]

---
### **Intro**

Average operator is non-expansive. Firmly non-expansive operators are a subset of averaged operators. 

#### **Def-1 | Averaged Operator**

> Let $F$ be an averaged operator if $F := (1 - \theta) I + \theta G$ where $\theta \in (0, 1)$, and $G$ has to be a non-expansive operator. Consequently, the fixed point of $F$ will have to be a fixed point of $G$ as well. 

**Properties**:
1. The set of averaged operator is closed under composition. 
2. It's definitely a subset of Lipschitz Operators. 

---
### **Characterizations**

We show that a similar equivalence characterization for the firmly non-expansive also exists for the alpha-averaged operators. 

#### **Thm-1  | Averaged Operator is Weaker than Non-expansive**
> Let $T: X\mapsto X$, let $\alpha \in (0, 1)$, then $T$ is $\alpha$-averaged if and only if for all $x, y\in X$ we have: 
> $$
> \begin{aligned}
>     \Vert Tx - Ty\Vert^2 \le \Vert x - y\Vert^2 - \frac{1 - \alpha}{\alpha}
> \Vert (I - T)x - (I - T)y\Vert^2. 
> \end{aligned}
> $$

**Observations**

Setting $\alpha = 1/2$ in the above formula, we recover the definition for a firmly non-expansive operator $T$. 
This is strictly weaker because changing the $\alpha$ value will produce formulas that doesn't correspond to firmly non-expansive operators. 
So we have $\text{Firstly Nexp}\subset \text{Avg} \subset \text{Nexp}$. 

**Proof**: 

Let $N$ be a firmly non-expansive operator, by definition the averaged operator $T = (1 - \alpha)I + \alpha N$, so $N = (1 - \alpha^{-1})I + \alpha^{-1}T$. 
Write $u = x - y$ and $v = Tx - Ty$. If, $N$ is a firmly non-expansive operator, consider the following chain of equivalences

$$
\begin{aligned}
    \alpha(\Vert u\Vert^2 - \Vert Nx - Ny\Vert^2) \ge 0 \text{ By } N \text{ non-expansive}
    \\
    \alpha(\Vert u\Vert - \Vert 
        \alpha^{-1}Tx + (1 - \alpha^{-1})x - 
        \alpha^{-1}Ty - (1 + \alpha^{-1})y
    \Vert^2)
    &\ge 0
    \\
    \alpha(
        \Vert u\Vert^2 - \Vert 
            \alpha^{-1} (Tx - Ty) + (1 - \alpha^{-1})(x - y)
        \Vert^2
    )&\ge 0
    \\
    \alpha(
        \Vert u\Vert^2 - \Vert \alpha^{-1} v + (1 - \alpha^{-1})u\Vert^2
    ) &\ge 0
    \\
    
    \alpha(
        \textcolor{red}{\Vert u\Vert^2} - 
        (
            \alpha^{-1}\Vert v\Vert^2 + \textcolor{red}{(1 - \alpha^{-1}) \Vert u\Vert^2}
            - 
            \alpha^{-1}(1 - \alpha^{-1}) \Vert u - v\Vert^2
        )
    ) &\ge 0 \quad \text{ by cute formula}
    \\
    \alpha(
        -\alpha^{-1}\Vert v\Vert + \textcolor{red}{\alpha^{-1}\Vert u\Vert^2}
        - \alpha^{-1}(1 - \alpha^{-1})\Vert u - v\Vert^2
    ) &\ge 0
    \\
    \Vert u\Vert^2 &\ge 
    \Vert v\Vert^2 - (1 - \alpha^{-1}) \Vert u - v\Vert^2, 
\end{aligned}
$$

and observe that, on the last line, we recover the characterizations for an averaged operator. And notice that all inequalities above are equivalent, hence, doing the proof in reverse means that the characterizations imply the averaged operator is the convex combination of an identity and a non-expansive operator. The cute formula refers to [Euclidean Jensen's Equality](../Background/Euclidean%20Jensen's%20Equality.md). 


**References**: 

Heinz's course notes, theorem 22.11. 

---
### **Fixed Point Convergence of Averaged Operators**

This is a type of non-expansive operator converges under fixed point iterations. In a sense, the none-expansive operator is damped by the identity operator. 

**Thm-2 | Averaged Operator has Fixed Point Convergence**

> Let $F$ be an averaged operator, then the fixed point iterations, defined as $x^{(k + 1)} = Fx^{(k)}$ monotonically converges to a point on the fixed point set of the operator, provided that the fixed point set $X$ exists. Additionally, the rate of convergence is $\mathcal O(1/\sqrt{k})$. 

**Proof**

Recall from [Euclidean Jensen's Equality](../Background/Euclidean%20Jensen's%20Equality.md): 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2, 
\end{aligned}
$$

which is not hard to verify, and it would be easier to verify by starting on the right side of the equation first. Next, by definition of $F$ being an averaged operator, it would mean that $F = (1 - \theta)I + \theta G$ where $G$ is non-expansive. We denote a fixed point of $F$ to be $\bar x\in X$, we start by considering that: 

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
    \underbrace{\Vert Gx^{(k)} - \bar x\Vert^2}_{\le \Vert x^{(k)} - \bar [x\Vert^2\; \leftarrow [[1]], }
    - \theta (1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert 
    \\
    & \le 
    \Vert x^{(k)} - \bar x\Vert^2 - \theta(1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert^2, 
\end{aligned}
$$

at `[[1]]`, $\bar x$ is a fixed point of $F$, hence also a fixed point of $G$. immediately observe that it's decreasing monotonically, and that gives an recursion to work with, unrolling the recursion, we have: 

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

Therefore, the squared norm of the residuals, The minimum norm of all iterations of $Gx^{(j)} - x^{(j)}$ will converge sub-linearly with rate $\mathcal O(1/k)$. And the fastest rate of convergence is given when $\theta = \frac{1}{2}$. 


**Remarks**

For a function whose gradient is Lipschitz smooth with constant $L$, we have $1/L \nabla f(x)$ being non-expansive. 

The above bound is pessimistic. It's not clear whether it's tight or not, and in what sense that it can be optimal. This derivation is extremely similar to what we had for [Smooth Gradient Descend The Basics](../Smooth%20Gradient%20Descend%20The%20Basics.md), more specifically the smooth descend frameworks. 

For more about the theories for Fejer montone sequences, and their type of convergence is very special because it monotonically approaches all the points in the fixed point set, which is not obvious from what had been stated in here. Please refer too [[Fejer's Monotone]] for more information. 

**Reference**: 

See Primer on Monotone Operator for more information. [[../../MATH 999 Paper Reviews and Frontier Mathematics/References Sep 2022/Primer on Monotone Operators.pdf | Primer on Monotone Operator]]. 


---
### **Fejer Monotonicity**

Fixed point iteration of an averaged operator has Fejer Monotone convergence. Recall that, the convergence of the sequence of reals $\Vert Gx^{(j)} - x^{(j)}\Vert$ in itself is not enough to show convergence. There exists series whose successive error is approaching zero but the series itself is not approaching zero. In our picture, it's possible that the fixed point set is unbounded and we slide away into infinity. The following theorem made use of some analysis knowledge to show that the iterates of the fixed point sequence also converges. 

### **Thm | Averaged Operator Fejer Monotone Convergence**
> Let $F:= (1  - \theta) I + \theta G$ be an averaged operator, then a fixed point iterations on the sequence will produce a Fejer Monotone sequence wrt to $\text{Fix}(F)$, and the iterates will converge as well. 

**Proof**

From the previous proof we know that the sequence $\Vert x^{(k)} - \bar x\Vert$ is Fejer Monotone wrt to all $\bar x \in \text{Fix}(F)$. Next, the series $\sum_{j=0}^{k}\Vert Gx^{(j)} - x^{(j)}\Vert^2$ is bounded, and therefore by the convergence of the series, the sequence 

$$
\begin{aligned}
    \lim_{j\rightarrow \infty}\Vert Gx^{(j)}- x^{(j)}\Vert &= 0
    \\
    \lim_{j\rightarrow \infty}Gx^{(j)} - x^{(j)} &= \mathbf 0
    \\
    \lim_{j\rightarrow \infty} Gx^{(j)} &= \lim_{j\rightarrow\infty}x^{(j)}, 
\end{aligned}
$$

since the sequence is also bounded, choosing a subsequential limit $x^{(k_j)}$ would yield some kind of limit, say $x^+$, such that $\lim_{j\rightarrow \infty}Gx^{(k_j)} = \lim_{j\rightarrow \infty} x^{(k_j)}$, by continuity of non-expansive operators, we have $G x^+ = Gx^+$, hence, a cluster point is formed in the fixed point set of $G$, by [Fejer's Monotone](Fejer's%20Monotone.md) convergence, the limit of the sequence must also be $x^+$, one specific fixed point from the fixed point set. 

**Remarks**

It's hard to say which fixed point it is exactly. It would be great to know more about that for sure. However, in the context of optimization, it's possible to have some fixed point sets that are in the infinity and yet, the value of the function still manage to converge. For those type of instances, we will be unable to describe it using these 2 proofs above, which both assumed the non-emptiness of the fixed point set for the operators. 


---
### **Gradient Descent as an Example**

We show that, for a function having Lipschitz gradient operator, then for some choice of the step sizes, the gradient descent operator is an averaged operator. 

#### **Theorem | Gradient Descent is an Averaged Operator**
> Let gradient $\nabla f$ be L Lipschitz, then the operator $I - \eta \nabla f$ would be $\eta L /2$ averaged for values of $\eta \in (0, L/2)$. 

**Proof**

Firstly we show that the gradient descent operator is non-expansive by considering 

$$
\begin{aligned}
    \Vert [I - \eta \nabla f](x) - [I - \eta \nabla f](y)\Vert^2
    &= 
    \Vert (x - y) - \eta (\nabla f(x) - \nabla f(y))\Vert^2
    \\
    &= 
    \Vert x - y\Vert^2 + \eta^2 \Vert \nabla f(x) - \nabla f(y)\Vert^2
    - 
    2 \eta \langle x - y, \nabla f(x) - \nabla f(y)\rangle, 
    \\
    &  \textcolor{gray}{\triangleright {[[1]]}:\text{Using Co-coersive property :}}
    \\
    &\quad\quad
    {\small
    \begin{aligned}
        \langle x - y, \nabla f(x) - \nabla f(y)\rangle &\ge \frac{1}{L}  
        \Vert \nabla f(x) - \nabla f(y)\Vert^2
        \\
        -2\eta \langle x - y, \nabla f(x) - \nabla f(y)\rangle 
        & \le 
        - \frac{2\eta}{L}\Vert \nabla f(x) - \nabla f(y)\Vert^2
    \end{aligned}
    }
    \\
    &\le 
    \Vert x - y\Vert^2 + \eta^2 \Vert \nabla f(x) - \nabla f(y)\Vert^2 - 
    \frac{2\eta}{L}\Vert \nabla f(x) - \nabla f(y)\Vert^2
    \\
    &\le \Vert x - y\Vert^2 + 
    \eta(\eta - 2/L)\Vert \nabla f(x) - \nabla f(y)\Vert^2, 
\end{aligned}
$$

and hence, the term is non-expansive, for all values of $\eta \in (0, 2/L)$, it maybe a contraction but it would really depends on how $\nabla f(x) - \nabla f(y)$ behaves wrt to $x - y$. At `[[1]]` we used some info from [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](../Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md), and especially the Co-coersive property. Next we show that the gradient operator is an averaged operator. To do that we simply fit the form 

$$
\begin{aligned}
    I - \eta \nabla f(x) &= (1 - \theta)I + \theta (I - 2/L \nabla f)
    \\
    I - \eta \nabla f 
    &= 
    I - \theta 2/L \nabla f, 
\end{aligned}
$$

with that we have $\eta = 2\theta /L$, whenever $\eta \in (0, L/2)$, with that we conclude $\theta = \eta L /2\in (0, 1)$, and hence it's an averaged operator. Therefore, the gradient descent on Lipschitz smooth function will admit Fejer Monotone convergence. 


**Remarks**

A question for the reader, can $I - \eta \nabla f$ be firmly non-expansive? 

