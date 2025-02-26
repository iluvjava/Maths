---
aliases:
  - Averaged Operators
---
- [Lipschitz Operator in Euclidean Space](Lipschitz%20Operator%20in%20Euclidean%20Space.md)
- [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md)

---
### **Intro**

Average operator is non-expansive. 
Firmly non-expansive operators are a subset of averaged operators. 
Averaged operators are the super set of firmly non-expansive operators and the subset of non-expansive operators. 

#### **Def-1 | Averaged Operator**

> Let $F$ be an averaged operator if $F := (1 - \theta) I + \theta G$ where $\theta \in (0, 1)$, and $G$ has to be a non-expansive operator. Consequently, the fixed point of $F$ will have to be a fixed point of $G$ as well. 

**Properties**:
1. The set of averaged operator is closed under composition. 
2. It's definitely a subset of Lipschitz Operators. 
3. This class includes the class of firmly non-expansive operators. It's also strictly weaker than the class of firmly non-expansive operator. 

---
### **Characterizations**

We show that a similar equivalence characterization for the firmly non-expansive also exists for the alpha-averaged operators. 

#### **Thm-1  | Averaged Operator is Weaker than Firmly Non-expansive**
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
So we have $\text{F.Nexp}\subset \text{Avg} \subset \text{Nexp}$. 

**Proof**: 

Let $N$ be a firmly non-expansive operator, by definition the averaged operator $T = (1 - \alpha)I + \alpha N$, so $N = (1 - \alpha^{-1})I + \alpha^{-1}T$. 
Write $u = x - y$ and $v = Tx - Ty$. If, $N$ is nonexpansive: 

For any $x, y \in \R^n$, write $x' = Tx, y' = Ty$. 
Denote $z = x - y, z' - z - y$ for short. 
By definition $\alpha^{-1}T - \alpha^{-1}(1 - \alpha)I = N$ and by $N$ nonexpansive it has: 

$$
\begin{aligned}
    0 &\le \Vert x - y\Vert^2 - \Vert Nx - Ny\Vert^2
    \\
    &= \Vert x - y\Vert^2 - 
    \Vert \alpha^{-1}x' - \alpha^{-1}(1 - \alpha)x - \alpha^{-1}y' + \alpha^{-1}(1 - \alpha)y\Vert^2
    \\
    &= \Vert x - y\Vert^2 
    - 
    \Vert 
        \alpha^{-1}(x' - y') - \alpha^{-1}(1 - \alpha)(x - y)
    \Vert^2
    \\
    &= \Vert z\Vert^2 
    - 
    \left\Vert 
        \alpha^{-1}z' + (1 - \alpha^{-1})z
    \right\Vert^2
    \\
    &= \Vert z\Vert^2 - \left(
        \alpha^{-1}\Vert z'\Vert^2 + (1 - \alpha^{-1})\Vert z\Vert^2
        - \alpha^{-1}(1 - \alpha^{-1})\Vert z - z'\Vert^2
    \right) \quad \text{Cute formula}
    \\
    &= \alpha^{-1} \Vert z\Vert^2 - \alpha^{-1}\Vert z'\Vert^2 
    + \alpha^{-1}(1 - \alpha^{-1})\Vert z - z'\Vert^2
    \\
    &= \alpha^{-1}\left(
        \Vert z\Vert^2 - \Vert z'\Vert^2 - (\alpha^{-1} - 1) \Vert z - z'\Vert^2
    \right). 
\end{aligned}
$$

See [Equalities, Inequalities of Euclidean Space](AMATH%20516%20Numerical%20Optimizations/Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md) for a reference of the "Cute formula". 


**References**: 

Heinz's course notes, theorem 22.11. 


#### **Corollary | Averaged operator is Strictly Quasi Nonexpansive**

> Let $x \in X \setminus \text{fix}T$, $y \in \text{fix}(T)$ with $T$ being an $\alpha$-averaged operator, then it's strictly quansi-nonexpansive, $\Vert Tx - y\Vert^2 \le \Vert x - y\Vert^2$. 

**Proof**
$$
\begin{aligned}
    \Vert Tx - y\Vert^2 &= \Vert Tx - Ty\Vert^2
    \\
    & \le \Vert x - y\Vert^2 - \frac{1 - \alpha}{\alpha}\Vert x - Tx - (y - Ty)\Vert^2
    \\
    &\le \Vert x - y\Vert^2 - \frac{1 - \alpha}{\alpha} \Vert x - Ty\Vert \quad \text{by } y \in \text{fix}(T)
    \\
    & < 
    \Vert x - y \Vert^2. 
\end{aligned}
$$

This completes the proof. 
This property is useful for algorithms. 


#### **Theorem | Equivalent Representations of Averaged Operators**
> Let $T = (1 - \alpha)I + \alpha N$ with $N$ nonexpansive. 
> Then $T$ is $\alpha$-averaged if and only if for all $x, y \in \R^n$ i satisfies: 
> $$
> \begin{aligned}
>     0 &\le \frac{1}{2(1 - \alpha)}\left(
>         (2\alpha - 1)\Vert x - y\Vert^2 + \Vert Tx - Ty\Vert^2
>     \right)
>     + \langle x - y, Tx - Ty\rangle. 
> \end{aligned}
> $$

**Proof**

Choose any $x, y \in \R^n$ and let $x' = Tx, y' = Ty$, $z = x - y, z' = z' = y'$, then the definition of an averaged mapping becomes: 
$$
\begin{aligned}
    0 &\le 
    \Vert z\Vert^2 - \Vert z'\Vert^2 - \Vert z - z'\Vert^2 + (1 - \alpha^{-1})\Vert z - z'\Vert^2
    \\
    &= \Vert z\Vert^2 - \Vert z'\Vert^2 - \Vert z - z'\Vert^2 
    + (1 - \alpha^{-1})\left(
        \Vert z\Vert^2 + \Vert z'\Vert^2 - 2\langle z, z'\rangle
    \right)
    \\
    &= (2 - \alpha^{-1 })\Vert z\Vert^2 - \alpha^{-1}\Vert z'\Vert^2
    - 2 (1 - \alpha^{-1})\langle z, z'\rangle
    \\
    \iff 
    0&\le 
    (2\alpha - 1)\Vert z\Vert^2 - \Vert z'\Vert^2 - 2(\alpha - 1)\langle z, z'\rangle
    \\
    &= 2(1 - \alpha)
    \left(
        \frac{2\alpha - 1}{2(1 - \alpha)}\Vert z\Vert^2
        - \frac{1}{2(\alpha - 1)}\Vert z'\Vert^2
        - \langle z, z'\rangle
    \right)
    \\
    &= 2(1 - \alpha)
    \left(
        \frac{(2\alpha - 1)\Vert z\Vert^2 - \Vert z'\Vert^2}{2(1 - \alpha)}
        - \langle z, z'\rangle
    \right)
    \\
    \iff 
    0 &\le 
    \frac{(2\alpha - 1)\Vert z\Vert^2 - \Vert z'\Vert^2}{2(1 - \alpha)} - \langle z, z'\rangle
\end{aligned}
$$


---
### **Fixed Point Convergence of Averaged Operators**

This is a type of non-expansive operator converges under fixed point iterations. 
In a sense, the none-expansive operator is damped by the identity operator. 

**Thm-2 | Averaged Operator has Fixed Point Convergence**

> Let $F$ be an averaged operator, then the fixed point iterations, defined as $x^{(k + 1)} = Fx^{(k)}$ monotonically converges to a point on the fixed point set of the operator, provided that the fixed point set $X$ exists. Additionally, the rate of convergence is $\mathcal O(1/\sqrt{k})$. 

**Proof**

Recall from [Equalities, Inequalities of Euclidean Space](AMATH%20516%20Numerical%20Optimizations/Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md): 

$$
\begin{aligned}
    \Vert (1 - \theta) a + \theta b\Vert^2 = (1 - \theta)\Vert  a\Vert^2 + \theta \Vert b\Vert^2 - 
    (\theta)(1 - \theta)\Vert a - b\Vert^2, 
\end{aligned}
$$

which is not hard to verify, and it would be easier to verify by starting on the right side of the equation first. 
Next, by definition of $F$ being an averaged operator, it would mean that $F = (1 - \theta)I + \theta G$ where $G$ is non-expansive. 
We denote a fixed point of $F$ to be $\bar x\in X$, we start by considering that: 

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
    \underbrace{\Vert Gx^{(k)} - \bar x\Vert^2}_{\le \Vert x^{(k)} - \bar [x\Vert^2\; \leftarrow [1](1), }
    - \theta (1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert 
    \\
    & \le 
    \Vert x^{(k)} - \bar x\Vert^2 - \theta(1 - \theta)\Vert Gx^{(k)} - x^{(k)}\Vert^2, 
\end{aligned}
$$

at `[1](1)`, $\bar x$ is a fixed point of $F$, hence also a fixed point of $G$. 
Immediately observe that it's decreasing monotonically WRT to the set of fixed points. 
([Fejer's Monotone](Fejer's%20Monotone.md)), and that gives a recursion to work with, unrolling the recursion, we have: 

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

the series converges by the fact that it's positive and bounded above, therefore the limit of $Gx^{(j)} - x^{(j)}$ equals to the zero vector. 
Therefore, it converges to some point $\bar x$ satisfying $G\bar x = \bar x$. 
Additionally, the rate of the convergence can be derived using the monotone convergence property of the series: 
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

For a function whose gradient is Lipschitz smooth with constant $L$, we have $1/L \nabla f(x)$ being non-expansive. The above bound is pessimistic. 
It's not clear whether it's tight or not, and in what sense that it can be optimal. This derivation is extremely similar to what we had for [Smooth Gradient Descend The Basics](../Smooth%20Gradient%20Descend%20The%20Basics.md), more specifically the smooth descend frameworks. 
The proof suffers from the same problem as the proof of gradient descent under the general case. 
However, this proof assumed the existence of a fixed point set, which is equivalent to assuming that $0 = \nabla f(x)$ has a solution in the case of gradient descent. 
We emphasize that this is a major difference between the two proofs. 
The convergence of successive iterates doesn't mean that the sequence of the limit of the sequence. 

For more about the theories for Fejer monotone sequences, and their type of convergence is very special because it monotonically approaches all the points in the fixed point set, which is not obvious from what had been stated in here. 
Please refer too [Fejer's Monotone](Fejer's%20Monotone.md) for more information. 

Finally, for a generalization of the fixed point iterations convergence on the averaged mapping, visit [Krasnoselskii Mann Iteration](Krasnoselskii%20Mann%20Iteration.md) for more information. 

**Reference**: 

See Primer on Monotone Operator for more information. [Primer on Monotone Operator](../../MATH%20999%20Paper%20Reviews%20and%20Frontier%20Mathematics/References%20Sep%202022/Primer%20on%20Monotone%20Operators.pdf%20). 

The following theorem attempt shows the convergence of the averaged operators with the modulus of averageness relaxed. 




---
### **Fejer Monotonicity**

Fixed point iteration of an averaged operator has Fejer Monotone convergence. 
Recall that, the convergence of the sequence of reals $\Vert Gx^{(j)} - x^{(j)}\Vert$ in itself is not enough to show convergence. 
There exists series whose successive error is approaching zero but the series itself may not be convergence.
In the previous proof, it's possible that the fixed point set is unbounded and we slide away into infinity. 
The following theorem made use of some analysis knowledge to show that the iterates of the fixed point indeed converges to the fixed point. 

### **Thm | Averaged Operator Fejer Monotone Convergence**
> Let $F:= (1  - \theta) I + \theta G$ be an averaged operator, assuming that it has a fixed point set $\text{fix}(F)$, then the fixed point iterations will produce a Fejer Monotone sequence wrt to $\text{Fix}(F)$, and the iterates will converge to a point in the fixed point set. 
> Assuming we are in finite dimension. 

**Proof**

From the previous proof we know that the sequence $\Vert x^{(k)} - \bar x\Vert$ is Fejer Monotone wrt to all $\bar x \in \text{Fix}(F)$. 
Next, the series $\sum_{j=0}^{k}\Vert Gx^{(j)} - x^{(j)}\Vert^2$ is bounded, and therefore by the convergence of the series, the sequence 

$$
\begin{aligned}
    \lim_{j\rightarrow \infty}\Vert Gx^{(j)}- x^{(j)}\Vert &= 0
    \\
    \lim_{j\rightarrow \infty}Gx^{(j)} - x^{(j)} &= \mathbf 0
\end{aligned}
$$

since the sequence is also bounded, choosing a subsequential limit $x^{(k_j)}$ would yield some kind of limit, say $x^+$, such that $\lim_{j\rightarrow \infty}Gx^{(k_j)} = \lim_{j\rightarrow \infty} x^{(k_j)}$. 
The existence of the limit allows us to split the above limit apart and move it to the RHS.
By continuity of non-expansive operators, we have $G x^+ = Gx^+$, hence, a cluster point is formed in the fixed point set of $G$, by [Fejer's Monotone](Fejer's%20Monotone.md) convergence, the limit of the sequence must also be the cluster point $x^+$, and the cluster point will belong to the set. 

**Remarks**

The assumption of the existence of a fixed point set is quite usual. 
However, this proofs hinges on the fact that we are in finite dimensions. 
In the case where the averaged operator is the gradient descent operator, a function such as $\exp(x)$ will have a gradient operator: $x - \exp(x)$ that never has a fixed point to it. 
That is the case when things doesn't converge. 

---
### **Composition of Averaged Operators**

The composition of averaged operator is still an averaged operator. 
Composition of nonexpansive operator would still be non-expansive too. 
Composition of firmly nonexpansive operator is not firmly nonexpansive anymore, it becomes an averaged operator. 
This fact is useful in the analysis of optimization algorithms. 

#### **Thm | Composition of two Averaged Mapping**
> Let $T_i \in \{\alpha_i-\text{Avg}\}$, for $i \in \{1, 2\}$ then the composition $T_2\circ T_1$ is $\alpha$-averaged with $\alpha = \frac{\alpha_1 + \alpha_2 - 2\alpha_1 \alpha_2}{1 - \alpha_1 \alpha_2}$. 
> However, when $\alpha_1 = \alpha_2 = 1$, that becomes invalid, and we set $\alpha = 1$. 

**Observations**

The case when $\alpha_1 = 1 = \alpha_2$ is describing the composition of non-expansive operators. 
The composited averaged operator is less than 1 and positive since with $\alpha_1, \alpha_2 \in (0, 1)$ we can have
$$
\begin{aligned}
    \alpha_1 + \alpha_2 - \alpha_1\alpha_2 - \alpha_1\alpha_2
    &= 
    1 + \alpha_1 + \alpha_2 - \alpha_1\alpha_2 - 1 - \alpha_1\alpha_2
    \\
    &= -1 + \alpha_1 + \alpha_2 - \alpha_1\alpha_2 + 1 - \alpha_1\alpha_2
    \\
    &= -(1 - \alpha_1)(1 - \alpha_2) + 1 - \alpha_1\alpha_2 
    \\
    &\le 1 - \alpha_1 \alpha_2, 
\end{aligned}
$$

therefore, the composited ratio is still valid for an averaged operator. 

**Proof**


#### **Theorem | Composition of many Averaged Mapping**
> Let $T_i \in \{\alpha_i-\text{Avg}\}$ , for $i \in \{1, \cdots, n\}$. 
> Each $\alpha_i \in (0, 1)$. 
> Then the composition $T_1\circ T_2\circ \cdots \circ T_n$ is an averaged mapping with constant $\alpha = \kappa/ (1 + \kappa)$, and $\kappa = \sum_{i = 1}^{n}\frac{\alpha_i}{1 - \alpha_i}$. 

**Proof**



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
    &  \textcolor{gray}{\triangleright {[1](1)}:\text{Using Co-coersive property :}}
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

and hence, the term is non-expansive, for all values of $\eta \in (0, 2/L)$, it maybe a contraction, but it would depend on how $\nabla f(x) - \nabla f(y)$ behaves wrt to $x - y$. 
At `[1](1)` we used some info from [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](../Properties%20of%20Functions/Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md), and especially the Co-coersive property. Next we show that the gradient operator is an averaged operator. 
To do that we simply fit the form 

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
A question for the reader, what is the sufficient conditions to assert the convergence of the gradient descent algorithm? 
There might be other operators that are averaged and doesn't have to be a gradient operator. 
Where are those operators? 

