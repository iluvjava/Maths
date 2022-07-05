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

---
### **Example 1: Polar Polyhedral Cone**

> The set $\{x: Ax \le \mathbf 0\}$ is $\{A^T y: y\ge \mathbf 0\}^\circ$. We assume that $A \in \mathbb R^{m\times n}$. 

**Proof**: 

Please recall the [[Farkas's Lama#Variants]], the polar cone variants. We state it here for convenicne: 

#TODO: FILL THIS IN!!!




---
### **Example 2: Polar Cone of Polyhedra**

We want to find the polar cone of: $K := \{x| Ax \le \mathbf 0\}$, from the definition we want to find the set of all vector, say $y$ such that $\langle y, x\rangle \le 0\; \forall x \in K$. Consider: 



---
### **Extension: Homogenizations**




