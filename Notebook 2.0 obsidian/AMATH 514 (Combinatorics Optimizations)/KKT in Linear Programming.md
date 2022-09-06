[[Introducing The KKT Conditions]]
[[A Brutal Introduction to Linear Programming]]
[[Linear Programming Strong Duality via Farkas]]


No references are used, the whole thing is from myself. 

---
### **Intro**

We illustrate the idea of KKT using one of the standard forms of linear programming problem. We reveal the fact that the Dual Problem can be read from the stationary conditions of the Lagrangian, and we can also derive the strong duality in the process. 

The example primal and dual we use: 

$$
\begin{aligned}
    \max_{x\in \mathbb R^n}\left\lbrace
        \langle c, x\rangle| Ax \le b
    \right\rbrace
    &= 
    \min_{y\ge \mathbf 0}\left\lbrace
        \langle b, y\rangle| y^TA = c^T
    \right\rbrace
\end{aligned}\tag{1}
$$
The left is the primal problem, right is dual. 

---
### **KKT Conditions From Saddle Points of the Lagrangian**

$$
\begin{aligned}
    \mathcal L(x, y) := \langle c, x\rangle - \langle y, Ax - b\rangle \quad x \in \mathbb R^n, y\in \mathbb R^m_+
\end{aligned}\tag{2}
$$

The negative sign is due to the maximization objective of the primal problem. The Lagrangian is direct from the KKT conditions by treating $G(x) = Ax - b$, $H(x)\equiv \mathbf 0$, $f(x) = \langle c, x\rangle$. The KKT conditions are: 

$$
\begin{aligned}
    \nabla_x [f]_{x^+} - \nabla_x[G]_{x^+}^Ty^+ &= \mathbf 0
    \\
    \implies c - A^Ty^+ &= \mathbf 0 \quad \text{Stanionary Point}
    \\
    \implies 
    G(x^+) = Ax^+ - b &\le \mathbf 0 \quad \text{Primal Feasibility}
    \\
    \implies y^+ &\ge \mathbf 0 \quad \text{Dual Feasibility}
    \\
    \langle y^+, G(x^+)\rangle &= 0
    \\
    \implies
    \langle y^+, Ax^+ - b\rangle &= 0 \quad \text{Comp Slack}
\end{aligned}\tag{3}
$$

---
### **Reading the Dual Problem from the Lagrangian**

$$
\begin{aligned}
    \mathcal L(x, y) &= \langle c, x\rangle - \langle y, Ax - b\rangle
    \\
    &= \langle c, x\rangle - \langle y, Ax\rangle + \langle y, b\rangle
    \\
    &= \langle b, y\rangle - \langle A^Ty, x\rangle + \langle c, x\rangle
    \\
    &= \langle b, y\rangle + \langle c-A^Ty, x\rangle
    \\
    \text{Where: } y& \in \mathbb R^m_+, x\in \mathbb R^n
\end{aligned}\tag{4}
$$

This is another Lagrangian where $\overline{G}(x) = A^Ty + c, \overline{f}(x)$, which can be interpreted as the Lagrangian whose primal formulation is: 

$$
\begin{aligned}
    \max_{y\ge \mathbf 0}\left\lbrace
        \langle b, y\rangle: A^Ty = c
    \right\rbrace
\end{aligned}\tag{5}
$$

It's a maximization due to the positive sign on the Lagrangian. The constraint is $A^Ty = c$ is an equality because $x\in \mathbb R^n$. 

---
### **Strong Duality from Complementary Slacks**
Strong duality for the Linear programming can be found from the KKT conditions from the Lagrangian. Combining the stationary conditions with the complementary slack conditions we obtain the strong duality statement: 

$$
\begin{aligned}
    \langle y, Ax - b\rangle &= 0 \quad \text{Comp Slack}
    \\
    \langle y, Ax\rangle - \langle b, y\rangle &= 0
    \\
    \langle A^Ty, x\rangle - \langle b, y\rangle &= 0 \quad \text{by: }A^Ty =c
    \\
    \langle c, x\rangle - \langle b, y\rangle &= 0
\end{aligned}\tag{6}
$$

Which is the strong duality, without using hardcore mathematical proofs. 

**Remarks**

Assuming that strong duality holds (which it does for all LP problems), we then need either one of the Strong Duality or the Comp Slack conditions to characterize the KKT conditions, we don't need both. 



