[[Introduction to Operators for Optimizations]]

---
### **Intro**

Let the space of the operator be the Euclidean spaces. 

**Definition: Monotone Operator**

> An operator $T: \mathbb E \mapsto \mathbb E$ is a monotone operator if for all $x, y \in \mathbb E$ we have $\langle y - x, Ty - Tx\rangle \ge 0$. 

**Remarks**

A monotone operator doesn't imply: 
1. Continuity of any kind. 
2. Singled value property of any kind. 
3. Subjectivity of any kind. 


**Definition: Maximally Monotone**
> An operator $T$ is called maximally monotone if it's already monotone and there exists no other monotone operator $\widetilde T$ such that $\text{gph}(T)\subsetneq \text{gph}(\widetilde T)$. Mathematically one expect the conditions to be described as: 
>
> $$
> \begin{aligned}
>     (x, u) \in \text{gph}(A) \iff 
>     ((y, v)\in \text{gph}(A) \; \implies \langle x -y, y - v\rangle \ge 0),
> \end{aligned}
> $$
> any points anchored in the graph of the operator $A$ iff all points in the graph makes the monotone conditions with the anchored point. 

---
### **Surjectivity of Maximally Monotone Operators**

[[Minty's Theorem, The Surjectivity Theorem]] asserts the equivalence of surjectivity of $I + T$ for a maximal monotone operator. 

---
### **Shifting Output is Still Monotone**

Let $T$ be monotone then $T - \{v\}$ for any $v \in \mathbb E$ is still monotone because: 

$$
\begin{aligned}
    & \langle x - y,(T - \{v\})x - (T - \{v\})y\rangle 
    \\
    =& \langle x - y, Tx - v - (Ty - v)\rangle 
    \\
    =& \langle x -y, Tx - Ty\rangle \ge 0, 
\end{aligned}
$$

which doesn't change the monotonicity about the operator. 

**Remarks**

In the case of maximally monotone operator being a subgradient operator, shifting the output space by one vector is the same as adding an affine function to the original function. 

---
### **Examples**

**Example 1: Projection is Monotone**
Recall [[../Background/Convex Sets Projections and Dist, Intro]], 

**Example2: Subgradient is Monotone**
See [[../Non-Smooth Calculus/Monotonicity of Subgradient]] for more information. 


---
### **References**

Heinz's Book 20.2, for the shifting theorem that is a work of my own because it's used to prove the Minty's theorem. 