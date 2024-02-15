- [Multivalued Functions, Set-valued Mappings](Multivalued%20Functions,%20Set-valued%20Mappings.md) 
- [Minty's Theorem, The Surjectivity Theorem](Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)


---
### **Intro**

The resolvent operators are important objects optimizations due to its favorable properties. 

### **Def | Resolvent Operators**

> Let $A: X \mapsto 2^X$ be an operator, then the resolvent $\mathcal J_A := (I + A)^{-1}$. 

**Observations**

The domain of the operator is the same as operator $A$. 
Using Minty's theorem, when $A$ is maximally monotone, the operator $(I + A)$ has full domain and therefore the domain of $\mathcal J_A$ is $X$ because 

$$
\begin{aligned}
    \text{dom}(T) &= \text{rng}(T^{-1}) = \text{rng}(I + A) = X. 
\end{aligned}
$$




---
### **Firmly Non-expansiveness of the Resolvent Operators**

We discuss how the resolvent operator preserves some favorable properties of the original operator. 


#### **Prop | Resolvent of Monotone Operators are Firmly non-expansive**
> Let $A: X \mapsto 2^X$, and $D = \text{rng}(I + A)$, and $T = \mathcal J_A  = (I + A)^{-1}$.
>  Then 
> 1. $A$ is mono implies$T: D\mapsto X$ is firmly non-expansive. 
> 2. $A$ is maximal monotone then $T: X \mapsto X$ is firmly non-expansive. 
> And under both cases $T$ is a single valued operator. 

**Proof**

If $x \in \mathcal J_A(u)$ and $y \in \mathcal J_A(v)$ then we have $u - x \in Au$ and $v - y \in Ay$. 
By $A$ being monotone we have 

$$
\begin{aligned}
    \langle x - y, (u - x) - (v - y)\rangle & \ge 0 
    \\
    \langle  x -y, -(x - y) + (u - v)\rangle &\ge 0
    \\
    \langle x - y, u - v\rangle &\ge \Vert x - y\Vert^2. 
\end{aligned}
$$

Observe that this is the definition of $\mathcal J_A$ being a firmly-nonexpansiev operator. 
In addition, a firmly non-expansive operator is a single valued operator because it's already non-expansive. 
It's evident from above by setting $u = v$, then $x = y$ from the inequality. 





