[[Farkas's Lama]]
[[Polytopes]]
[[A Brutal Introduction to Linear Programming]]
Proof Taken from Theorem 2.6 of: Shrijver's book: A course in Combinatorics Optimizations. 


---
### **Intro**

We introduce linear programming strong duality using the theory of hyperplane separations and Ferkas's Lemma. Which is different from the KKT formulations.

---
### **Strong Duality Statement**

$$
\begin{aligned}
    \max_{x\in \mathbb R_+^n}\{\langle c, x\rangle| Ax \le b\} &= \min_{y\in \mathbb R_+^m}\{\langle b, y\rangle| y^TA\ge c\}
    \\
    \max_{x\in \mathbb R^n}\{\langle c,x\rangle|Ax \le b\}
    &=
    \min_{y\in \mathbb R^m_+} 
    \{\langle b, y\rangle| A^Ty = c\}
    \\
    \max_{x\in \mathbb R_+^n}\{\langle c, x\rangle| Ax = b\}
    &= \min_{y\in \mathbb R^m}\{
            \langle b, y\rangle| A^Ty \ge c
        \}
\end{aligned}
$$

These 3 statements are equivalent, using some standard reduction tricks we can transform between different forms of LP and show their equivalences. 

---
### **Strong Duality: Proof of The Second Form via Farkas' Lemma**

The proof will make use of Lemma 2.1, a foundamental results of Farka's lemma, and then Corrollary 2.5(b), one of the extesion of the Farkas' Lemma. We proceed to prove the second variant of the strong duality: 

$$
\begin{aligned}
    \max_{x\in \mathbb R^n}\{\langle c,x\rangle|Ax \le b\}
    &=
    \min_{y\in \mathbb R^m_+} 
    \{\langle b, y\rangle| A^Ty = c\}
\end{aligned}
$$

Assuming that the primal and dualy are both feasible and bounded, then using Weak duality (Proof is an exercise in linear algebra): 

$$
\begin{aligned}
    \sup \left\lbrace
        c^Tx: Ax \le b
    \right\rbrace \le 
    \inf \left\lbrace
        y^Tb : y\ge \mathbf 0, y^TA = c^T
    \right\rbrace
\end{aligned}
$$

Using lemma 2.1, the supremum is attained within the polytope: 

$$
\begin{aligned}
    & \forall x \in \{x|Ax \le b\}: c^Tx \le \delta := \max\{
            c^Tx|Ax \le b
        \}
    \\
    \implies & 
        \exists y^* \ge \mathbf 0: 
            y^TA = c^T, (y^*)^Tb\le \delta
\end{aligned}
$$




