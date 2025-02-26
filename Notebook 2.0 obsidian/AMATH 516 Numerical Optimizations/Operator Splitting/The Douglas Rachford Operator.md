- [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md)
- [Resolvent Operators](../Operators%20Theory/Resolvent%20Operators.md)
---
### **Intro**

#### **Def | Douglas Rachford Operator**
> Let $T_1, T_2$ be firmly nonexpansive on $X$. Set reflectant $R_i := 2T_i - I$. Then the DR operator is $T:= I - T_1 + T_2 R_1$. 

**Observations**

1. If $\text{fix}(T_1)\cap \text{fix}(T_2) \ni x$, then $x \in \text{fix}(T)$. 

To show (1.), suppose that $T_1, T_2$ share a common fixed point $x$, then $x$ is also the fixed point of the DR operator because 

$$
\begin{aligned}
    Tx &= x - T_1x + T_2R_1x
    \\
    &= \mathbf 0 + T_2 R_1x 
    \\
    &= \mathbf 0 + T_2(2T_1x - x)
    \\
    &= \mathbf 0 + T_2(2x - x)
    \\
    &= \mathbf 0 + T_2 x 
    \\
    &= x. 
\end{aligned}
$$

Hence, it's also the fixed point of the DR operator. 




#### **Thm | DR has good fixed point and it's Firmly Nonexpansive**
> Let $T$ be the DR operator of firmly nonexpansive operator $T_1, T_2$, then 
> 1. $T = (1/2)(I + R_2 R_1)=I - T_1 + T_2 R_1$. 
> 2. $T$ is firmly non-expansive. 
> 3. $\text{fix}(T) = \text{fix}(R_2R_1)$
> 4. $y \in \text{fix}(T) \iff T_1 y = T_2 R_1 y$. 

**Proof**

**Showing (1.)**, consider 

$$
\begin{aligned}
    (1/2)(I + R_2R_1) &= (1/2)(I + (2T_2 - I)(2T_1 - I))
    \\
    &= (1/2)(I + 2T_2R_2 - (2T_1 - I))
    \\
    &= (1/2)(2I + 2T_2R_2 - 2T_1 )
    \\
    &= I - T_1 - T_2R_2. 
\end{aligned}
$$

Hence, they are equivalent expressions. 

**Showing (2.)**. 
Next, $T_i$ is firmly nonexpansive for $i \in \{1, 2\}$ is equivalent to $R_i$ are nonexpansive for $i \in \{1, 2\}$ which implies that $R_2R_1$ is nonexpansive which implies that $(1/2)(I + R_2 R_1)$is firmly nonexpansive (Or 1/2 averaged) because it's an equivalent conditions of firmly non-expansiveness.

**Showing (3.)**. Consider: 

$$
\begin{aligned}
    x &\in \text{fix}(T) \iff x  =(1/2)x + (1/2)R_2 R_1 x
    \\
    \iff 
    2x &= x + R_1R_2x
    \\
    \iff 
    x &= R_2R_1x. 
\end{aligned}
$$
To show (4.), it follows from the definition of DR operator, consider: 

$$
\begin{aligned}
    y \in \text{fix}(T) \iff y &= y - T_1 y + T_2 R_1 y
    \\
    T_1 &= T_2 R_1 y. 
\end{aligned}
$$


---
### **The Fixed Point of the DRS Operator**

To understand the potential of the DR operator, we need to understand what is its fixed point and what problem the fixed point can represent in the real world. 


#### **Claim | Zero set is the Resolvent of the Fixed Point of DR operator**
> For a DR operator T constructed by maximal monotone operators $A, B$, we have the following equalities for its zero sets. 
> $$
> \begin{aligned}
>     \text{zer}(A + B) = \mathcal J_A(\text{fix }T)
>     = \mathcal J_A \text{ fix}((1/2)(I + \mathcal R_B \mathcal R_A))
>     = \mathcal J_A (\text{fix }\mathcal R_B \mathcal R_A). 
> \end{aligned}
> $$

**Proof**

We consider

$$
\begin{aligned}
    z \in \text{zer}(A + B)
    &\iff 
    \exists z \in X: z \in Ax \wedge  -z \in Bx
    \\
    &\iff 
    \exists z \in X : 
    (z + x\in Ax + x )\wedge 
    (x - z \in Bx + x)
    \\
    &\iff 
    (\mathcal J_A(z + x) = x) 
    \wedge 
    (\mathcal J_B(x - z) = x)
    \\
    &\quad  \forall z \exists y: z = y- x
    \\
    & \iff
    \mathcal J_A y = x \wedge
    \mathcal J_B(2x - y) = x
    \\
    &\iff 
    \mathcal J_A y = x \wedge
    \mathcal J_B(2 \mathcal J_A y - y) = x
    \\
    &\iff 
    \mathcal J_A y = x \wedge
    \mathcal J_B(\mathcal R_A y) = x, 
\end{aligned}
$$

and therefore we have the consequence that $\mathcal J_Ay = \mathcal J_B \mathcal R_A y$, by previous theorem, $y \in \text{fix }T$. 
The second equality is justified by $T = (1/2)(I + \mathcal R_B \mathcal R_A)$. 
Finally, the fixed point set of $(1/2)(I + \mathcal R_B \mathcal R_A)$ is the same as $\mathcal R_B \mathcal R_A$, Let $N = \mathcal R_B \mathcal R_A$ then 

$$
\begin{aligned}
    x \in \text{fix}((1/2)(I - N))
    & \iff 
    x = (1/2)x - (1/2 )Nx
    \\
    & \iff 
    -(1/2)x  = - (1/2)Nx
    \\
    &\iff 
    x \in \text{fix}(N). 
\end{aligned}
$$

The $1/2$-averaged operator $\mathcal J_A$ on $N$, a non-expansive operator, has the same fixed point set. 

---
### **Some Simple Examples**

We consider some simple examples. 

#### **Example | Same Affine Space Projection**
> Define $T_1x = T_2x = 1/2\nabla f$. Then DR operator as a operator for minimizations of objective $f$. 

**Demonstrations**

