[Farkas's Lama](Farkas's%20Lama.md)
[Polytopes](Polytopes.md)
[A Brutal Introduction to Linear Programming](A%20Brutal%20Introduction%20to%20Linear%20Programming.md)
Proof Taken from Theorem 2.6 of: Shrijver's book: A course in Combinatorics Optimizations. 


---
### **Intro**

We introduce linear programming strong duality using the theory of hyperplane separations and Ferkas's Lemma. Which is different from the KKT formulations.

---
### **Strong Duality Statement**

$$
\begin{aligned}
    \max_{x\in \mathbb R_+^n}\{\langle c, x\rangle| Ax \le b\} &= \min_{y\in \mathbb R_+^m}\{\langle b, y\rangle| y^TA\ge c^T\}
    \\
    \max_{x\in \mathbb R^n}\{\langle c,x\rangle|Ax \le b\}
    &=
    \min_{y\in \mathbb R^m_+} 
    \{\langle b, y\rangle| A^Ty = c^T\}
    \\
    \max_{x\in \mathbb R_+^n}\{\langle c, x\rangle| Ax = b\}
    &= \min_{y\in \mathbb R^m}\{
            \langle b, y\rangle| A^Ty \ge c^T
        \}
\end{aligned}
$$

These 3 statements are equivalent, using some standard reduction tricks we can transform between different forms of LP and show their equivalences. 

---
### **Strong Duality: Proof of The Second Form via Farkas' Lemma**

The proof will make use of Lemma 2.1, a fundamental results of Farka's lemma, and then Corollary 2.5(b), one of the extension of the Farkas' Lemma. We proceed to prove the second variant of the strong duality: 

$$
\begin{aligned}
    \max_{x\in \mathbb R^n}\{\langle c,x\rangle|Ax \le b\}
    &=
    \min_{y\in \mathbb R^m_+} 
    \{\langle b, y\rangle| A^Ty = c\}
\end{aligned}
$$

Assuming that the primal and dual are both feasible and bounded, then using Weak duality (Proof is an exercise in linear algebra): 

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
            (y^*)^TA = c^T, (y^*)^Tb\le \delta
\end{aligned}
$$
The second line is using corollary 2.5(b), listed in the introduction at the top of the file. The $y^*$ is special in the sense that it's the dual optimal: 

$$
\begin{aligned}
    & \min_{y\ge \mathbf 0}
    \left\lbrace
        y^Tb| y^TA = b
    \right\rbrace = (y^*)^T b \le \delta := \max_x \left\lbrace
        c^Tx| Ax \le b
    \right\rbrace
    \\
    & \min_{y\ge \mathbf 0}
    \left\lbrace
        y^Tb|y^TA = b
    \right\rbrace \le \max_x\left\lbrace
        c^Tx |Ax \le b
    \right\rbrace
\end{aligned}
$$

Combining with the weak duality, the strong duality of LP is shown. The form of the strong duality can be proved by remodeling the problems using standard LP programming tricks. 

---
### **Remark**

For a view of duality in Linear programming using the KKT conditions and the Lagrangian, check out [KKT in Linear Programming](KKT%20in%20Linear%20Programming.md). 