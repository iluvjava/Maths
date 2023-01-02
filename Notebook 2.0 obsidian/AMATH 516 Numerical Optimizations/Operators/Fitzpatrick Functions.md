[[Subgradient and Subdifferential Definition]], [[Introduction to Operators for Optimizations]]


---
### **Intro**

Fitzpatrick, function is a generalization of the Fenchel inequality but for some monotone operators. 

**Definition: Fitzpatrick Function**
> With any monotone operator $T:\mathbb E \mapsto \mathbb E$ we associate $F_T: \mathbb E\times \mathbb E \mapsto \mathbb{\bar{R}}$ defined as: 
> $$
> \begin{aligned}
>   F_(x,y):= \langle x, y\rangle - \inf_{(\bar x, \bar y)\in \text{gph}(T)} \langle \bar y - y, \bar x - x\rangle. 
> \end{aligned}
> $$

---
### **Lemma 3.8.2 (Fitzpatrick Inequality)**
> Let $T: \mathbb E \mapsto \mathbb E$ be maximally monotone, then $F_T$ is closed convex and proper, additioally for any pair of $(x, y) \in \mathbb E \times \mathbb E$, we have: $F_T(x, y)\ge \langle x, y\rangle$. 

**References**
Lemma 3.8.2 in Dimitry's textbook for 516. 

---
### **Lemma 3.83 (Subdifferential of Fitzpatrick Functions)**
> Let $T: \mathbb E \mapsto 2^{\mathbb E}$ be a maximal monotone opreator, fix $(x, y)\in \mathbb E \times \mathbb E$ and $(y_2, x_2)\in \partial F_T(x_1, y_1)$

**References:**

Lemma 3.8.3 in Dimitry's textbook for 516. 