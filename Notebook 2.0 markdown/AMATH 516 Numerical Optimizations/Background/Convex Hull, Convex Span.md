[Convex Sets](Convex%20Sets.md)

---
### **Intro**

A convex combination of linear algebra is a special case of the linear combinations of a set of vectors in the Euclidean space. Define the **Unit Simplex**: 

$$
\begin{aligned}
\Delta_n := \left\lbrace
    \lambda\in\mathbb{R}^n: 
    \sum_{i = 1}^{n}\lambda_i = 1
    ; \lambda \ge 0
\right\rbrace
\end{aligned}
$$

A convex linear combinations of a set of vectors is defined as: 

$$
\begin{aligned}
    S &= \{x_i\in\mathbb{R}^n: i = 1, \cdots, k\}
    \\
    \text{cvxspan}(S)&:= 
    \left\lbrace
        x: x = \sum_{i = 1}^{k}\lambda_i x_i, \lambda\in\Delta_k
    \right\rbrace
    \\
    &=
    \left\lbrace
        X\lambda : \lambda\in \Delta_k
    \right\rbrace \quad X = \begin{bmatrix}
        \\
        x_1 & x_2 & \cdots& x_k
        \\ 
		\\
    \end{bmatrix}
\end{aligned}
$$

**Convex Hull**: 

Which is different from a convex combinations. 

> A convex hull is defined on an existing set. The convex hull of a set $Q$ is the intersection of all convex sets containing the set $Q$, denoted as $\text{cvxh}(Q)$. Other people also use $\text{conv}(Q)$ to denote it. 

As a **consequence** of the definition, A convex hull of the set $Q$ is also the smallest convex set that contain the set $Q$. 

**Remarks**

When the set $Q$ is countable many points, its convex hull is simply the convex spans of all the vectors in the set. 

---
### **Closed Under Convex Combinations**

> For $Q\in \mathbb{R}^n$, let $k \in \mathbb{N}$ be arbitrary. Then any convex combinations of $k$ elements from $Q$ is still in $Q$. 

**Proof**:

Inductively we assume that the convex combinations of $k - 1$ points from $Q$ is in the set $Q$, and we wish to show that the convex combinations of $k$ point will be in $Q$, let $k \ge 2$. Define: 

$$
\begin{aligned}
    S_{k -1} &:= \left\lbrace
        \sum_{i = 1}^{k - 1}\lambda_ix_i: \lambda \in \Delta_{k - 1}, x_i \in Q \;\forall 1 \le i \le k -1
    \right\rbrace
    \\
    S_{k - 1} &\subseteq Q \quad \text{Inductive Hypothesis}
\end{aligned}
$$

Then we consider the convex combinations of $k$ points, which is any instance of the set $S_k$

$$
\begin{aligned}
    \sum_{i =1}^{k} \lambda_ix_i &= \left(
        \sum_{i = 1}^{k - 1} \lambda_i x_i
    \right) + \lambda_k x_k
    \\
    &= (1 - \lambda_k)\left(
        \sum_{i = 1}^{k - 1} \frac{\lambda_i x_i}{1 - \lambda_k}
    \right) + \lambda_k x_k 
    \\
    \lambda \in \Delta_k &\implies
    \sum_{i = 1}^{k - 1} \frac{\lambda_i}{1 - \lambda_k} = 1
    \\
    \lambda \in \Delta_k &\implies 0 \le \lambda_k \le 1 
\end{aligned}
$$
    

We had expressed the convex combinations of $k$ points into the convex combinations of 2 points, where one of them is from the set $S_{k - 1}$. Using the fact that $S_k$ is a subset of $Q$, both points are in $Q$, using the definition convex set, the convex combinations of these 2 points are in the set $Q$ as well. Therefore, for any instance of $S_k$, $S_k\subseteq Q$. The base case is just 2 points, which is fitting the definition of the convex set. 

---
### **Characterizing Convex Convex Hull using Convex Span**

> The convex hull of the set $Q\subseteq \mathbb{R}^n$ is the convex combinations of all countable sets of elements from the set $Q$. Mathematically given as: 
> $$
> \text{cvxh}(Q) = 
> \left\lbrace
>     \sum_{i = 1}^{k} \lambda_i x_i: 
>     k \in \mathbb{N}, x_1, \cdots, x_k \in Q, \lambda \in \Delta_k
> \right\rbrace =:T
> $$
> The set $T$ is by def and it's there to simplify the notations. 

**Proof**: 

Define the set $S_k$ being the exact same as from the theorem regarding the closure of convex combinations of the set $Q$. Then $T = \bigcup_{i\in \mathbb{N}}S_i$. By the definition of convex hull on the set $Q$: 

$$
\begin{aligned}
    \text{cvxh}(Q) &= \bigcap_{i\in \mathbb{N}} \{\text{convex set contaning } Q\}
    \\
    \implies Q &\subseteq \text{cvxh}(Q)
    \\
    \text{consider: } \{x_i\}_{i = 1}^{n} &\subseteq Q
    \\
    \implies \text{cvxspan}(\{x_i\}_i^{n}) 
    &\subseteq \text{cvxh}(Q)
\end{aligned}
$$

For the last 2 statements, suppose otherwise that it's not true, then it would mean $\exists x_j \in  \text{cvxspan}(\{x_i\}_i^{n})\wedge x_j\notin \text{cvxh}(Q)$; but $x\in Q$, which is a contradiction, as a result we obtained the consequence that: 

$$
T\subseteq \text{cvxh}(Q)
$$

Next, we wish to prove the $\text{cvxh}(Q)\subseteq T$: 

$$
\begin{aligned}
    u\in S_{k1}&\; v\in S_{k2} \\
    \implies 
    u &\in \sum_{i = 1}^{k_1}\beta_i x_i,\; v \in \sum_{ i =1 }^{k_2} \alpha_i y_i
    \\\implies 
    \lambda u + (1 - \lambda) v &= 
    \lambda\sum_{i = 1}^{k_1}\beta_i x_i + (1 - \lambda) \sum_{i = 1}^{k_2}\alpha_i y_i \quad \forall \lambda \in (0, 1)
\end{aligned}
$$

Please observe that: 

$$
\begin{aligned}
    &\lambda \sum_{i = 1}^{k_1} \beta_i + (1 - \lambda)\sum_{i = 1}^{k_2}\alpha_i = \lambda(1) + ( 1- \lambda)(1) = 1
    \\
    \implies & \forall \lambda \in (0, 1): \begin{bmatrix}
        \lambda\beta \\ (1 - \lambda)\alpha
    \end{bmatrix} \in \Delta_{k1 + k2}
    \\
    \implies &\lambda u + (1 - \lambda) v \in S_{k1 + k2}
    \\\implies
    & S_{k1 + k2}\text{ is convex and } S_{k1 + k_2}\subseteq T
\end{aligned}
$$

If $T$ is convex, and by definition $T = \bigcup_{i\in\mathbb{N}}S_i$ and each $S_i\subseteq Q$, in addition, $S_i$ is convex, therefore uniont of all of them are in the convex hull of the set $Q$. The proof is still valid even if $Q$ is finite number of points. 

**Remarks**
The proof is not easy neither intuitive. 

---
### **Half Spaces Containment**

> Every convex set can also be created using simple intersection of halfspaces in the Euclidean space. See [Supporing Convex Sets using Halfspaces](../CVX%20Geometry/Supporing%20Convex%20Sets%20using%20Halfspaces.md) for more information. Such a method is more relavent and popular for analysis in general. 





