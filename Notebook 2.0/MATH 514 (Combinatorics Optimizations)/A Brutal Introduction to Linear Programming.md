[[Farkas's Lama]]
[[Polytopes]]

Proofs Taken from AMATH 514, Alexander Schrijver, A course in combinatorics optimizations. 

---
### **Intro**

Linear programming in brief is just optimizing on a polytopes/polyhedra along a vector. Nothing fancy. 

**Definition of Linear Programming**

> A LP problem is maximizing/minimizing the quantity $\langle c, x\rangle$ where $x\in P$ where $P$ is a polyhedra. 

**A Fundamental Result**: 

> If the polyhedra is bounded along direction $c$, then the maximum of the LP objective value is attained at some point that is inside of the polyhedra. Cite as Lemma 2.1 from \<A Course in Combinatorics Optimizations\>

**Proof**: 

Suppose for contradiction that $\nexists x\in P$ such that $Ax\le b, c^Tx\ge \delta := \sup\{c^Tx: Ax \le b\}$. The nonexistence of such $x$ is implying that: 

$$
\begin{aligned}
    \nexists x \in \mathbb R^n : \begin{bmatrix}
        A \\ -c^T
    \end{bmatrix}x \le \begin{bmatrix}
        b \\ -\delta
    \end{bmatrix}
\end{aligned}
$$

Which invokes the first variant of Farka's Lemma: 

$$
\begin{aligned}
    & \exists \begin{bmatrix}
        y \\ \lambda
    \end{bmatrix} \in \mathbb R_{+}^{m + 1}: 
    \begin{bmatrix}
        y^T & \lambda
    \end{bmatrix}\begin{bmatrix}
        A \\ -c^T
    \end{bmatrix} = \mathbf 0 \; \wedge \; 
    y^Tb - \lambda \delta <  0 
    \\
    \implies & 
    y^TA = \lambda c^T \;\wedge \; y^Tb < \lambda \delta
\end{aligned}
$$

Then $\lambda \delta = \sup\{\lambda c^Tx: Ax \le b\} = \sup \{y^TAx: Ax \le b\}\le y^Tb < \lambda\delta$ which is a contradiction. 


---
### **Strong Duality**

A statement of results from strong duality can are listed, and proofs can be found using various different methods and techniques. 
