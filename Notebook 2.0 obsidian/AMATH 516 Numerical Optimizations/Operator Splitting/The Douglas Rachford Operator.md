- [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md)
- [Resolvent Operators](../Operators%20Theory/Resolvent%20Operators.md)
---
### **Intro**

#### **Def | Douglas Rachford Operator**
> Let $T_1, T_2$ be firmly nonexpansive on $X$. Set reflectant $R_i = 2T_i - I$. Then the DR operator is $T:= I - T_1 + T_2 R_1$. 

**Observations**

Suppose that $T_1, T_2$ share a common fixed point $x$, then $x$ is also the fixed point of the DR operator because 

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
    &= 0 + T_2 x 
    \\
    &= x, 
\end{aligned}
$$

therefore it's also the fixed point of the DR operator. 

**Remarks**

The $T_1, T_2$ usually take the form of a resolvent of a maximally monotone operator. 
The the context of optimization, the resolvent is the proximal mapping, which is a resolvent of a subgradient. 
When the original function is convex, closed and proper, then it would be maximal monotone. 
Which suits the above format. 
However, it remains to verify that the fixed point of the Douglas Rachford operator is relevant to the some optimization problem. 


#### **Thm | DR has good fixed point and it's Firmly Nonexpansive**
> Let $T$ be the DR operator of the operator $T_1, T_2$, then 
> 1. $T = (1/2)(I + R_2 R_1)$ as well. 
> 2. $T$ is firmly non-expansive. 
> 3. $\text{fix}(T) = \text{fixed}(R_2R_1)$

**Proof**

From the definition we will have 

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

Therefore the 2 reflectant identity representation is the equivalent to the original definition. 
Next, $T_i$ is firmly nonexpansive for $i \in \{1, 2\}$ is equivalent to $R_i$ are firmly nonexpansive for $i \in \{1, 2\}$ which implies that $R_2R_1$ is nonexpansive which implies that $(1/2)(I + R_2 R_1)$is firmly nonexpansive. 
For the above reasoning we only used equivalencies and implications of non-expansive operators. 
Finally, conditions (3.) can be reasoned with 

$$
\begin{aligned}
    x &\in \text{fix}(T) \iff x  =(1/2)x + (1/2)R_2 R_1 x
    \\
    \iff 
    2x &= x + R_1R_2x
    \\
    \iff 
    x &= R_2R_1x, 
\end{aligned}
$$
and from the last line, the result we want to show is self evident. 

---
### **The Fixed Point of the DRS Operator**

To understand the potential of the DR operator, we need to understand what is its fixed point and what problem the fixed point can represent in the real world. 