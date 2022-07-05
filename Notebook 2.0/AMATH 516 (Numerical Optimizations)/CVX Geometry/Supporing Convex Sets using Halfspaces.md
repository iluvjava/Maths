* [[Convex Sets]]
* [[Caratheodory Theorem]]

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
\text{cl}\circ \text{cvxh}(Q) =  \bigcap_{(a, b)\in Q} 
\left\lbrace
    x: \langle  x, a\rangle \le b
\right\rbrace
$$

---
### **Proof**




