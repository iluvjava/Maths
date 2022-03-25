[[Convex Sets]]

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
    S = \{x_i\in\mathbb{R}^n: i = 1, \cdots, k\}
    \\
    \text{cvxspan}(S):= 
    \left\lbrace
        x: x = \sum_{i = 1}^{k}\lambda_i x_i, \lambda\in\Delta_k
    \right\rbrace
\end{aligned}
$$

**Convex Hull**: 

Which is different from a convex combinations. 

> A convex hull is defined on an existing set. The convex hull of a set $Q$ is the intersection of all convex sets containing the set $Q$, denoted as $\text{cvxh}(Q)$. 

As a **consequence** of the definition, A convex hull of the set $Q$ is also the smallest convex set that contain the set $Q$. 

---
### **Closed Under Convex Combinations**

> For $Q\in \mathbb{R}^n$, let $k \in \mathbb{N}$ be arbitrary. Then any convex combinations of $k$ elements from $Q$ is still in $Q$. 

---
### **Characterizing Convex Convex Hull using Convex Span**

> The convex hull of the set $Q\subseteq \mathbb{R}^n$ is the convex combinations of all countable sets of elements from the set $Q$. Mathematically given as: 
> $$
> \text{cvxh}(Q) = 
> \left\lbrace
>     \sum_{i = 1}^{k} \lambda_i x_i: 
>     k \in \mathbb{N}, x_1, \cdots, x_k \in Q, \lambda \in \Delta_k
> \right\rbrace
> $$



---
### **Caratheodory Theorem**




