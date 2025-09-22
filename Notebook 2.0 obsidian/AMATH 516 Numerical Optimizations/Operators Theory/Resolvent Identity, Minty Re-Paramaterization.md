- [Monotone Operators Introduction](Monotone%20Operators%20Introduction.md)
- [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)
- [Firmly Nonexpansive Operators](Firmly%20Nonexpansive%20Operators.md). 
- [Resolvent Operators](Resolvent%20Operators.md)

---
### **Resolvent Identity and Minty Paramatrizations**

The resolvent operator serves an important role in the theory of optimizations, it's part of the operator theory. 
Throughout, the strongest assumption on ambience space $X$ is Inner product space. 

#### **Definition | Resolvent**
> Denote $\mathcal J_A^{\alpha}:= (I - \alpha A)$ to be the resolvent of the operator $A: \mathbb E \mapsto 2^{\mathbb E}$. This is by definition. 

**Observations**

When the mapping $A$ is maximally monotone, the resolvent operator is single-valued (Explained and stated in the next section). 
Note the following immediate properties: 

- Take note that for some scalar value $\alpha$: $\mathcal J_{\alpha A}\circ[\alpha^{-1}I] = (\alpha I + T)^{-1}$
- And $\mathcal J_{\alpha^{-1}\beta T}\circ[\alpha^{-1}I] = (\alpha I + \beta T)^{-1}$. 
- In a sense when we have bijective mapping $S$, it would have $J_{S^{-1}A}\circ S = (S + A)^{-1}$


**Remarks**:

It can have other convention, but in the references I have we stick to this one. 

#### **Thm | Resolvent Identity**

> For all $T: X \rightarrow 2^X$ , it has $\mathcal J_{T^{-1}} = I - \mathcal{J}_{T}$. 

**Proof**:

Accept the following rules for multi-valued operators for all $(x, y) \in \text{gph}\; T$: 
- $(x, y) \in \text{gph}\; T \iff (y, x) \in \text{gph}\; T$. 
- $(x, y) \in \text{gph}\; T \iff (x, y + x)\in \text{gph}\; (I + T)$. 

Then the resolvent identity follows directly by the following sequence of equivalences: 

$$
\begin{aligned}
    (x, y) &\in \text{gph}\; \mathcal J_{T^{-1}}
    \\
    \iff 
    (y, x) &\in \text{gph}\; \mathcal (I + T^{-1})
    \\
    \iff 
    (y, x - y) &\in \text{gph}\; T^{-1}
    \\
    \iff 
    (x - y, y) &\in \text{gph}\; T
    \\
    \iff (x - y, x) &\in \text{gph}\; (I + T)
    \\
    \iff (x, x - y) &\in \text{gph}\; \mathcal J_{T}
    \\
    \iff (x, y - x) &\in \text{gph}\; (-\mathcal J_{T})
    \\
    \iff 
    (x, y) &\in \text{gph}\; (I -\mathcal J_{T}). 
\end{aligned}
$$

$\square$

**References**: 

- Heniz's book, 23.18
- Rockafellar Variational, Lemma 12.14, Inverse resolvant. 

**Remarks**

This theorem can hold for all $T: \mathbb E \mapsto 2^{\mathbb E}$, and it doesn't have to be a maximally monotone operator. 
The exercise from Dimitri didn't use have the condition that it's maximal monotone, it can be proved directly by the definition of an inverse map. 


---
### **Minty Reparameterizations**

Minty reparameterization express the graph of a monotone operator using the resolvent of the monotone operator. 

#### **Thm | Minty Reparameterization**
> Let $A: X \mapsto 2^X$ be monotone, set $D = \text{rng}(I + A)$, which is also the domain of the resolvent of $A$, then 
> $$
> \begin{aligned}
>     \text{gph}A = 
>     \left\lbrace
>         (J_A x, J_{A^{-1}}x) | x \in D
>     \right\rbrace
>     = 
>     \left\lbrace
>         (J_A x, x - J_A x) | x \in D
>     \right\rbrace
> \end{aligned}
> $$

**Proof**

The second equality in the theorem is a direct use of the resolven identity. 
Let $x \in \text{dom}(J_A) = \text{rng}(I + A) = D$, by definition we would have 

$$
\begin{aligned}
    J_Ax &= [I + A]^{-1} x  \quad \text{by definition of resolvent. }
    \\
    x &\in [I + A]J_Ax =
    J_Ax + AJ_Ax
    \\
    x - J_Ax &= AJ_A x
    \\
    J_{A^{-1}} x &= AJ_A x \quad \text{resolvent identity.}
    \\
    (J_Ax, J_{A^{-1}}x) &\in \text{gph}A. 
\end{aligned}
$$

Therefore, from it we have concluded that if $x \in \text{dom}(J_A)$, then $(J_Ax, J_{A^{-1}} x)$ is in set $\text{gph}A$. 
We had shown $\supseteq$ in this case. 
To see the converse, consider: 

$$
\begin{aligned}
    (a, a^*) &\in \text{gph} A
    \\
    x &:= a + a^* \in [I + A] a \in D
    \\
    \implies 
    a &= [I + A]^{-1} (a + a^*) = J_A x
    \\
    (a &= J_A x )\wedge (a^* = x - a = x - J_Ax)
    \\
    \implies 
    (a, a^*) &\in \{(J_Ax, x - J_A x) \;|\; x \in D\}.
\end{aligned}
$$

Therefore the converse is also true. 
Combining, we have an equality between these two sets. 

---
### **Resolvent of Maximal Monotone Operators**

> Let $T: \mathbb E \mapsto \mathbb E$ be maximal monotone operator, then the resolvent $\mathcal J_T: \mathbb E\mapsto \mathbb E$ is a globally defined *singled-valued mapping* satisfying:
> $$
> \Vert \mathcal J_Tx - \mathcal J_Ty\Vert^2 \le 
> \langle \mathcal J_Tx - \mathcal J_Ty, x - y\rangle\quad 
> \forall x, y \in \mathbb E. 
> $$ 
>  In particular, this resolvent operator is also *firmly non-expansive*. 


**Proof**

See [Resolvent Operators](Resolvent%20Operators.md) for more information. 


**References:** 

Theorem 3.78 of Dimitri's Convex Analysis textbook for MATH 516. Professor Heinz MATH 565 at UBCO



---
### **Resolvent of Monotone Operators**

> Let $A: \mathcal H \mapsto 2^{\mathcal H}$ be such that $\text{dom}(A)\neq \emptyset$, set $D:= \text{ran}(I + A)$ so $D = \text{dom}(T)$, set $T = \mathcal J_A|_D$. Then: 
> 
> 1. $A = T^{-1} - I$.
> 2. $A$ is monotone iff $T$ is firmly non-expansive. Which implies that it's also singled-valued. 
> 3. $A$ is max monotone iff T is firmly non-expansive and $D = \mathcal H$. 



**Proof**

For (1), we consider 

$$
\begin{aligned}
    & (x, y) \in \text{gph}(J_A^{-1} - I) 
    \\
    \iff 
    & (x, y + x) \in \text{gph}(J_A^{-1}) = \text{gph}(I + A)
    \\
    \iff 
    & y + x \in x + Ax
    \\
    \iff & y \in Ax \iff (x, y) \in A. 
\end{aligned}
$$

For (2). 

See [Resolvent Operators](Resolvent%20Operators.md) for more information. 

For (3.), let $A$ be maximally monotone. 
By Minty it would mean that $D = \text{dom}(I + A) = X$. 
Therefore, the operator $T$ by the definition from before is $X$ and hence (3) is true. 



**References:**

Prop 23.9 in Heinz's book. See the Bloyd Primer on monotone operators paper for more good info. 


**Remarks**

Monotone operators are a huge class of multi-valued operators, however, its resolvent is firmly non-expansive, which is a class of singled valued operators that has a lot of desirable properties. 
This is very advantageous. 
(1.) expresses a multi-valided monotone operator using an singled valued operator, the inverse of $T$ introduced multi-valued. 
We hightlight the fact that whole proximal operator of convex function is a class of firmly non-expansive operator, but not all monotone operators has to be a subgradient of a convex function. 

Finally, the zero set of a maximally monotone operator $A$ is the same as the fixed point set of its resolvent $J_A$. 