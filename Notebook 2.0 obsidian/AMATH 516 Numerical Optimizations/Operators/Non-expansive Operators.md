[[Introduction to Operators for Optimizations]]

---
### **Non-Expansive Operators**
Non-expansive is a subset of operator that has a Lipschitz constant of one. Quasi non-expansive operator is a generalization of it. 

**Definition: non-expansiveness of operators**

Let $D$ be a subset of $\mathbb E$, then let $T: D \mapsto \mathcal H$, then $T$ is: 
1. f if *firmly non-expansive* if $\forall x, y\in D$, we have 
    $$
    \Vert Tx - Ty\Vert^2 + \Vert (I - T)x- (I - T)y\Vert^2 \le \Vert x - y\Vert^2
    $$
2. f is *non-expansive* if it is Lipschitz continuous with parameter $L = 1$. 
3. f is *quasi-non-expansive* if 
    $$
    \forall x \in D, y \in \text{Fix}(T) \; \Vert Tx - y\Vert \le \Vert x - y\Vert
    $$
4. And f is strict-quasi-nonexpansive when: 
    $$
    \forall x \in D \setminus \text{Fix}(D), y\in \text{Fix}(T)\; 
    \Vert Tx - y\Vert < \Vert x - y\Vert
    $$

Immediately observe that (i) => (ii) => (iii), (i) => (iv). 

References: Chapter 4 of the Mono Operator book from Heinz. 