* [[Cone]]


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

> For any cone $K$ we have: $K^{\circ\circ} = \text{cl}(K)$. 

**Remarks**:



---
### **Example 1: Polar Polyhedral Cone**

> The set $A := \{x: Ax \le \mathbf 0\}$ is $B:=\{A^T y: y\ge \mathbf 0\}$. We assume that $A \in \mathbb R^{m\times n}$. 

**Proof**: 

Please recall the [[Farkas's Lama#Variants]], the polar cone variants. We state it here for convenicne: 

$$
(Ax \le \mathbf 0 \implies \langle c, x\rangle \le 0) \iff (\exists y\ge \mathbf 0: A^Ty = c)
$$

We decompose the statement from left to right and in reverse to discuss how it's relevant to the definition of polar cones. 

* $x \in A\implies \forall c \in B: \langle c, x\rangle \le 0 \implies B \subseteq A^\circ$ 
* $\forall x \in A, \langle c, x\rangle \le 0\;  \forall c \in B \implies A^\circ \subseteq B$

Therefore $A^\circ = B$ and using bipolar $B^\circ = A$. 


---
### **Extension: Homogenizations**




