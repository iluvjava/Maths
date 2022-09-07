* [Cone](Cone.md)


---
### **Intro**

A polar cone, denoted as $K^\circ$ where $K$ is a cone is defined to be the set of all vectors $v$ that makes an obstuse angle with vectors from the set $K$: 

$$
K^\circ := 
\left\lbrace
    v\in \mathbb{R}^n: 
    \langle v, x\rangle \le 0 \; \forall x \in K
\right\rbrace
$$

**Quick Facts**: 

* When $L$ is a linear subspace, we have $L^\circ = L^\perp$. 
* $(\mathbb R_+^n)^\circ = \mathbb R_-^n$, $(\mathbb S_+^n)^\circ =\mathbb S_-^n$
* $K^{\circ\circ} = \text{cl}\circ \text{cvxh}(K)$: The double polar theorem, or the bipolar theorem. 

---
### **The Bipolar Theorem**

> For any closed cone $K$ we have: $K^{\circ\circ} = \text{cl}(K)$. 

**Proofs**: 

Consider the set $F_K$, consisted of all the normals of halfspaces containing the cone $K$ on its positive side: 

$$
\begin{aligned}
    F_K &= \{a: \langle a, x\rangle \ge 0, \forall x \in K\}
    \\
    -F_K &= \{a: \langle a, x\rangle \le 0, \forall x \in K\} = K^\circ
\end{aligned}
$$

However at the same time because $\text{cl}\circ \text{cvxh}(k)$ is a convex set, it can be characterized by the intersection of all the halfspaces that contains it in one side hence: 



---
### **Example 1: Polar Polyhedral Cone**

> The set $A := \{x: Ax \le \mathbf 0\}$ is $B:=\{A^T y: y\ge \mathbf 0\}$. We assume that $A \in \mathbb R^{m\times n}$. 

**Proof**: 

Please recall the [](../../AMATH%20514%20Combinatorics%20Optimizations/Farkas's%20Lama.md#Variants), the polar cone variants. We state it here for convenicne: 

$$
(Ax \le \mathbf 0 \implies \langle c, x\rangle \le 0) \iff (\exists y\ge \mathbf 0: A^Ty = c)
$$

We decompose the statement from left to right and in reverse to discuss how it's relevant to the definition of polar cones. 

* $x \in A\implies \forall c \in B: \langle c, x\rangle \le 0 \implies B \subseteq A^\circ$ 
* $\forall x \in A, \langle c, x\rangle \le 0\;  \forall c \in B \implies A^\circ \subseteq B$

Therefore $A^\circ = B$ and using bipolar $B^\circ = A$. 


---
### **Extension: Homogenizations**

**Definition:**

> Consider a set $Q\subseteq \mathbb E$ and it contains the origin. Let the cone be generated on the set $Q\times \{1\}\subseteq \mathbb E\times \mathbb R$, which is given by: 
> 
> $$
>   K := \{(\lambda x, \lambda): x\in Q, \lambda \ge 0\}
> $$

**Remarks**

Since the set $Q$ contains the origin, the polar cone $Q^\circ\subseteq \mathbb E\times \mathbb R_-$. 



---
### **Polarity Calculus**

We establish a list of rules for computing polar cone, so it's easier and faster to compute when we are dealing with computations and applications. 


#TODO: ISN'T FILLED OUT YET


**Source**: Dimitry's AMATH 516 2021 FALL. 




