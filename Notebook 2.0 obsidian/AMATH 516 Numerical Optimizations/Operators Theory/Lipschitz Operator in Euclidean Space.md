- [Banach Contraction in Metric Space](Banach%20Contraction%20in%20Metric%20Space.md)

---
### **Lipschitz Operator**

> And operator is called *Lipschitz* with a constant $L$ when for any $(u, v)\in \text{gph}(F), u \in F(x), v \in F(y)$ we have the inequality: 
> $$
> \begin{aligned}
>     \Vert u - v\Vert_2 \le L \Vert x - y\Vert_2,
> \end{aligned}
> $$
> An operator is called *non-expansive* if its Lipschitz constant is $\le 1$. An operator is called a *contraction* if $L< 1$. 

**Observations**
For simplicity we use the 2 norm to formulate the definition. 
Obviously, if $A$ is Lipschitz then it's continuous and single valued ,else the LHS of the function can simply chosen to be $u\in F(x), v\in F(x)$ with $u\neq v$, giving us a contradiction. 


**properties**
1. The set of Lipschitz operators are closed under addition and composition. 

---
### **Convex Fixed Point Set of Non-Expansive Operators**

Nonexpansive operator has a fixed point set that is convex. 

#### **Def | Fixed Point Set**
> When $f$ is non-expansive and domain of $F$ is $\mathbb R$, then the set of fixed point of the operator is: 
> 
> $$
> \text{fix}(F) = 
> \begin{aligned}
>    \left\lbrace
>        x\in \text{dom}(F)| x = F(x)
>    \right\rbrace = 
>    (I - F)^{-1}(0), 
> \end{aligned}
> $$

#### **Thm | The set of fixed point for an non-expansive operator is a closed and convex set**

> Assuming that $F$ is non-expansive, then the fixed point of the operator has to be a convex set. In the case when $F$ is a contraction, the set of fixed point will have to be a singleton. 

**Proof**: 

When the fixed point set is empty, it's convex. 
Otherwise we suppose that $x, y \in \text{fix}(F)$ in the fixed point set of the operator $T$, with $\theta \in [0, 1]$, and then we will show that $z = \theta x + (1 - \theta)y$ will again have to be a fixed point of the operator as well, additionally it has to on the line segment for all valid $\theta$, this is true because: 

$$
\begin{aligned}
    & \Vert Fz - x\Vert_2 = (1 - \theta)\Vert y - x\Vert_2
    \\
    & \Vert Fz - y\Vert_2 = \theta \Vert y - x\Vert_2
    \\
    \implies &
    \Vert x - y\Vert_2 = \Vert x - Fz + Fz - y\Vert_2 \le 
    \Vert Fz - x\Vert_2 + \Vert Fz - y\Vert_2 = \Vert x - y\Vert_2, 
\end{aligned}
$$

and the last line suggest that the point $Fz$ must lies on the line segment $[0, 1]$ because the equality of the triangle inequality is satisfied from the last expression, for all value of $\theta\in [0, 1]$, implying the fact that the set $X$ has to be a convex set. 

**References**: 

[Primer on Monotone Operators](../../MATH%20999%20Paper%20Reviews%20and%20Frontier%20Mathematics/References%20Sep%202022/Primer%20on%20Monotone%20Operators.pdf), The Primer on Monotone Operator Paper. 

