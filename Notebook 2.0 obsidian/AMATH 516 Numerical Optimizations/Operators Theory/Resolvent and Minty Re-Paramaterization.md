- [[Monotone Operators]]
- [[Minty's Theorem, The Surjectivity Theorem]]
- [[Firmly Nonexpansive Operators]]. 
- [Resolvent Operators](Resolvent%20Operators.md)

---
### **Resolvent and Minty Re-paramatrizations**

The resolvent operator serves an important role in the theory of optimizations, it's part of the operator theory. 

#### **Definition | Resolvent**

> Denote $\mathcal J_A^{\alpha}:= (I - \alpha A)$ to be the resolvent of the operator $A: \mathbb E \mapsto 2^{\mathbb E}$. This is by definition. 

When the mapping $A$ is maximally monotone, the resolvent operator is single-valued (Explained and stated in the next section). 

Note the following immediate properties: 

- Take note that for some scalar value $\alpha$: $\mathcal J_{\alpha A}\alpha^{-1} = (\alpha I + T)^{-1}$
- And $\mathcal J_{\alpha^{-1}\beta T}\alpha^{-1} = (\alpha I + \beta T)^{-1}$. 


**Remarks**:

It can have other convention, but in the references I have we stick to this one. 

#### **Thm | Minty Re-Paramaterizations**

> Let $T$ be maximally monotone, then $\mathcal J_{T^{-1}} = I - \mathcal{R}_{T}$. 

**Proof**:

$$
\begin{aligned}
    \mathcal J_{T^{-1}} &= I - \mathcal J_T
    \\
    I &= \mathcal J^{-1}_{T^{-1}} - \mathcal J_{T} \mathcal J_{T^{-1}}^{-1}
    \\
    &= 
    (I + T^{-1}) - (I + T)^{-1}(I + T^{-1})
    \\
    &= 
    I + T^{-1} - (I + T)^{-1} - (I + T)^{-1}T^{-1}
    \\
    &= 
    I - (I + T)^{-1} + T^{-1} - (I + T)^{-1}T^{-1}
    \\
    &= 
    I - (I + T)^{-1} + (I - (I + T)^{-1})T^{-1}
    \\
    &= 
    (I - (I + T)^{-1})(I + T^{-1})
    \\
    &= (I - (I + T)^{-1})\mathcal J^{-1}_{T^{-1}}
    \\
    \implies  \mathcal J_{T^{-1}} &= 
    (I + (I + T)^{-1}) = I + \mathcal J_{T}, 
\end{aligned}
$$

which completes the proof. 

**References**: 

Heniz's book, 23.18

**Remarks**

This theorem can hold for all $T: \mathbb E \mapsto 2^{\mathbb E}$, and it doesn't have to be a maximally monotone operator. 
The exercise from Dimitri didn't use have the condition that it's maximal monotone, it can be proved directly by the definition of an inverse map. 

---
### **Resolvent and Inverse are Linear Transform on the Graph of the Operators**




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

> Let $A: \mathcal H \mapsto 2^{\mathcal H}$ be such that $\text{dom}(A)\neq \emptyset$, set $D:= \text{ran}(I + A)$, set $T = \mathcal J_A|_D$. Then: 
> 
> 1. $A = T^{-1} - I$. 
> 2. $A$ is monotone iff $T$ is firmly non-expansive. Which implies that it's also singled-valued. 
> 3. $A$ is max monotone iff T is firmly non-expansive and $D = \mathcal H$. 

**Proof**

Not yet written. 

**References:**

Prop 23.9 in Heinz's book. See the Bloyd Primer on monotone operators paper for more good info. 



