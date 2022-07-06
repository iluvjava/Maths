* [[Convex Sets]]
* [[Strict Separations Theorem]]

---
### **Intro**

**Theorem Statement**

> For any convex set, it can be characterized by the union of all halfpsaces that contain the set, and hence by extension, any set's convex closure can be characterized by all halfspaces that contains it. 

To characterize all the halfspaces containg any given set $Q$, we adopt the following notations: 

$$
\mathcal F_Q := \{(a, b) \in \mathbb E \times \mathbb R:  
    \langle a, x\rangle \le b \; \forall x \in Q
\}
$$

Then the theorem can be stated as: 

$$
\text{cl}\circ \text{cvxh}(Q) =  \bigcap_{(a, b)\in \mathcal F_Q} 
\left\lbrace
    x: \langle  x, a\rangle \le b
\right\rbrace
$$

---
### **Proof**

The proof $\implies$ is direct by the strict separations theorem for any convex set, in this case we apply it to $\text{cl}\circ \text{cvxh}(Q)$ for every possible halfspace, and since it's possible to separate it for all halfspaces, $x\in \text{cl}\circ\text{cvxh}(Q) \implies x \in \bigcap_{(a, b) \in \mathcal F_Q} \{x: \langle a, b\rangle \le b\}$

For $\impliedby$, we consider by contradiction that there exists $x$ in $\bigcap_{(a, b) \in \mathcal F_Q} \{x: \langle a, b\rangle \le b\}$ what is not part of $\mathcal F_Q$. Because $\text{cl}\circ\text{cvxh}(Q)$ is convex, there exists a hyperplace that achives separations, and hence contradicting the fact that $x \in \bigcap_{(a, b) \in \mathcal F_Q} \{x: \langle a, b\rangle \le b\}$. 











