[[Multivalued Functions, Set-valued Mappings]], [[Monotone Operators]], [[Fitzpatrick Functions]], we prove the Minty's theorem. 

---
### **Minty's Theorem**

> Let $A$ be a multi-valued mapping on some Hilbert space: $\mathcal H$, and $A$ is monotone. Then $A$ is *maximal monotone* if and only if $\text{ran}(I + A) = \mathcal H$ (The operator is surjective). 

**Proof**

To show $\impliedby$, let range of $I + T$ be $\mathbb E$ where we consider any $(\hat x,\hat y)\in \mathbb E \times \mathbb E$ such that $\langle \hat y - y, \hat x - x\rangle \ge 0 \;\forall (x, y)\in \text{gph}(T)$, since $I + T$ is surjective, $\exists x \in \mathbb E$ where $\hat x + \hat y \in (I + T)(x)$, let $y = \hat x + \hat y - x$, then: 

$$
\begin{aligned}
    \langle \hat y - (\hat x + \hat y - x), \hat x - x\rangle &\ge 0
    \\
    \langle x - \hat x, \hat x - x\rangle &\ge 0
    \\
    \implies & - \Vert x - \hat x\Vert^2 \implies x = \hat x
    \\
    \implies & y = \hat y \implies \hat y \in T\hat x, 
\end{aligned}
$$

therefore, the operator $T$ is maximally monotone. To prove $\implies$, we assume $T$ is maximal monoton, then we show that $\mathbf 0 \in \text{ran}(I + T)$, which we will clarify later. Supoose that there exists $(x, y)\in \mathbb E \times \mathbb E$, such that $-(x, y)\in \partial F_T(x, y)$ whose existence will be clarify later, then applying lemma 3.8.3 for the Fitzpatric Function: 

$$
\begin{aligned}
    0 \ge \langle y- (-x), x - (-y)\rangle &= \Vert x + y\Vert^2 \ge 0
    \\
    \implies 
    x = -y, -x \in T(-y) \implies& \mathbf 0 \in \text{ran}(I + T)
\end{aligned}
$$

where $-x \in T(-y)$ comes from applying 3.8.3 lemma. Next, take note that if this is true, then $0 \in \text{ran}(I + T)$. Consider another operator $T - \{w\}$, which is also maximally monotone by the property of shifting property of maximal monotone operator, we know that $\mathbf 0 \in \text{ran}(T - \{w\} + I)$ (Using what we just proved but applied it for all maximal monotone operator) for any $w \in \mathbb E$, therefore $w \in \text{ran}(T + i)$ for any $w \in \mathbb E$. Finally, observe that: 

$$
\begin{aligned}
    g(x, y) &:= F_T(x,y) + \frac{1}{2}(\Vert x\Vert^2 + \Vert y\Vert^2)
    \\
    \text{let: }
    (x, y) &\in \arg\min g(x, y) \implies 
    \\
    (0, 0) &\in \partial g(x, y) \implies
    \\
    -(x, y)&\in F_T(x, y), 
\end{aligned}
$$

and hence, the existence of such an pair of $x, y$ is assured. 

**Reference**: 

21.1 from Heinz's operator book. OR Theorem 3.79, 3.83 on Dimitri's Book. They have similar proof. 


**Remarks**

Minty's theorem is applied for the single-valueness of the resolvent of a maximally monotone operator, it also ensures the existence of the resolvent. 


