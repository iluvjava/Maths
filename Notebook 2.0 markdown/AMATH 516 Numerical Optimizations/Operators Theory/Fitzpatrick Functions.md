[Subgradient Introduction](../Non-Smooth%20Calculus/Subgradient%20Introduction.md), [Introduction to Operators for Optimizations](Introduction%20to%20Operators%20for%20Optimizations.md)


---
### **Intro**

Fitzpatrick, function is a generalization of the Fenchel inequality but for some monotone operators. 

**Definition: Fitzpatrick Function**
> With any monotone operator $T:\mathbb E \mapsto \mathbb E$ we associate $F_T: \mathbb E\times \mathbb E \mapsto \mathbb{\bar{R}}$ defined as: 
> $$
> \begin{aligned}
>   F_T(x,y):= \langle x, y\rangle - \inf_{(\bar x, \bar y)\in \text{gph}(T)} \langle \bar y - y, \bar x - x\rangle. 
> \end{aligned}
> $$

---
### **Lemma 3.8.2 (Fitzpatrick Inequality)**
> Let $T: \mathbb E \mapsto \mathbb E$ be maximally monotone, then $F_T$ is closed convex and proper, add for any pair of $(x, y) \in \mathbb E \times \mathbb E$, we have: $F_T(x, y)\ge \langle x, y\rangle$. Furthermore, equality holds when $y \in T(x)$. 

**Proof**:

$$
\begin{aligned}
    F_T(x, y) &= \sup_{(\bar x, \bar y)\in \text{gph}(T)}
    \left\lbrace
        \langle x, y\rangle - \langle \bar y - y, \bar x - x\rangle
    \right\rbrace
    \\
    &= \sup_{(\bar x, \bar y)\in \text{gph}(T)}\left\lbrace
        \langle x, y\rangle - 
        \left(
            \langle \bar y, \bar x\rangle - \langle \bar y, x\rangle
            - 
            \langle y, \bar x\rangle + \langle x, y\rangle
        \right)
    \right\rbrace
    \\
    &= 
    \sup_{(\bar x, \bar y)\in \text{gph}(T)}\left\lbrace
        \langle \bar y, \bar x\rangle - \langle \bar y, x\rangle
        - 
        \langle y, \bar x\rangle
    \right\rbrace, 
\end{aligned}
$$

immediately observe that the Fitzpatrick function is a convex function because it's being written as the pointwise supremum of 3 affine functions. Take note that by the maximal monotonicity property of the operator $T$, we claim that: 

$$
\begin{align*}
    \inf_{(\bar x, \bar y)\in \text{gph}(T)} \langle \bar y - y, \bar x - x\rangle 
    &= 0 \quad \forall (x, y)\in \text{gph}(T)
    \\
    \inf_{(\bar x, \bar y)\in \text{gph}(T)} \langle \bar y - y, \bar x - x \rangle
    & < 0 \quad
    \forall (x, y)\in \mathbb E\times \mathbb E \setminus \text{gph}(T), 
\end{align*}
$$

under both cases, the inf part of the RHS is less than zero, therefore, $F_T(x, y)\ge \langle x, y\rangle$ as claimed. Further more, the function $F_T(x, y)$ is proper because it's convex and there exists at least one point where the function is not negative infinity(This is by a very weird theorem in Rockafeller's textbook).


**References**
Lemma 3.8.2 in Dimitry's textbook for 516. 

---
### **Lemma 3.8.3 (Subdifferential of Fitzpatrick Functions)**
> Let $T: \mathbb E \mapsto 2^{\mathbb E}$ be a *maximal monotone* opreator, fix $(x, y)\in \mathbb E \times \mathbb E$ and $(x_2, y_2)\in \partial F_T(x_1, y_1)$ then $\langle y_1 - x_2, x_1 - y_2\rangle\le 0$, and equality is true whenever $x_2 \in Ty_2$. 

**Proof**

$$
\begin{aligned}
    \langle y_1 - x_2, x_1 - y_2\rangle
    &= 
    \langle y_1, x_1\rangle - \langle y_1, y_2\rangle - \langle x_2, x_1\rangle
    + \langle x_2, y_2\rangle
    \\
    &\le 
    F_T(x_1, y_1) - \langle y_1, y_2\rangle - \langle x_2, x_1\rangle
    + \langle x_2, y_2\rangle,
\end{aligned}\tag{*}
$$

by lemma 3.8.2, next we consider the subgradient inequality for the convex Fitzpatrick function with arbitrary $(\bar x, \bar y)\in \text{gph}(T)$: 

$$
\begin{aligned}
    F_T(x, y)
    &\le F_T(\bar x, \bar y) + \langle (x_2, y_2), (x_1 - \bar x, y_1 - \bar y)\rangle
    \\
    &= 
    \langle \bar x, \bar y\rangle + 
    \langle x_1, y_2, (x_1 - \bar x, y_1 - \bar y)\rangle
    \\
    &= 
    \langle \bar x, \bar y\rangle + \langle x_2, x_1\rangle - \langle x_2, \bar x\rangle + \langle y_2, y_1\rangle - \langle y_2, \bar y\rangle
\end{aligned}
$$

which is by the equality case from lemma 3.8.2. Continuing from (*) by substituting the above we have: 

$$
\begin{aligned}
    \langle y_1 - x_2, x_1 - y_2\rangle &\le 
    \left(
        \langle \bar x, \bar y\rangle + \langle x_2, x_1\rangle - \langle x_2, \bar x\rangle + \langle y_2, y_1\rangle - \langle y_2, \bar y\rangle
    \right) - \langle y_1, y_2\rangle - \langle x_2, x_1\rangle
    + \langle x_2, y_2\rangle
    \\
    &= \langle \bar x, \bar y\rangle - \langle x_2, \bar x\rangle - 
    \langle y_2, \bar y\rangle + \langle x_2, y_2\rangle
    \\
    &= \langle x_2 - \bar y, y_2 -\bar x\rangle, 
\end{aligned}
$$

and invoking the fact that $(\bar x, \bar y)$ is arbitrary, we use the Fitzpatrick function to simplify: 

$$
\begin{aligned}
    \langle y_1 - x_2, x_1 - y_2\rangle
    &= 
    \inf_{(\bar x, \bar y)\in \text{gph}(T)}
    \langle x_2 - \bar y, y_2 - \bar x\rangle 
    \\
    &= \langle x_2 , y_2\rangle - F_T(y_2, x_2) \le 0, 
\end{aligned}
$$

and at the end notice that $y_2, x_2$ are swapped. And by previous lemma we have the equality whenever $y_2 \in Tx_2$, which is also swapped. Please take care of this particular detail when applying this theorem. 


**References:**

Lemma 3.8.3 in Dimitry's textbook for 516. 