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
    \text{covspan}(S):= 
    \{x: x = \sum_{i = 1}^{k}\lambda_i x_i, \lambda\in\Delta_k\}
\end{aligned}
$$


