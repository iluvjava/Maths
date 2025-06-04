---
aliases:
  - Nonexpansive Operator in Euclidean Space
---
- [Banach Contraction in Metric Space](Banach%20Contraction%20in%20Metric%20Space.md)
- [Local, Global Lipschitz Continuity](AMATH%20516%20Numerical%20Optimizations/Background/Local,%20Global%20Lipschitz%20Continuity.md)

---
### **Intro**

See [Lipschitz Operator in Hilbert Space](Lipschitz%20Operator%20in%20Hilbert%20Space.md) for operator theory in the infinite dimensions. 
Lipschitz operator's theorem can all be developed on a non-expansive operator without the loss of generality. 



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

**Remarks**

Lipschitz-1 operators are also called non-expansive operators. 
This name should be self-explainatory according to the above definition. 

---
### **Convex Fixed Point Set of Non-Expansive Operators**

Non-expansive operator has a fixed point set that is convex. 

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

> Assuming that $F : D \mapsto X$ is non-expansive and $D$ is a convex set, then the fixed point of the operator is a convex set. 
> In the case when $F$ is a contraction, the set of fixed point is a singleton. 

**Proof**: 

When the fixed point set is empty, it's convex. 
Otherwise we suppose that $x, y \in \text{fix}(F)$ in the fixed point set of the operator $T$, with $\theta \in [0, 1]$, and then we will show that $z = \theta x + (1 - \theta)y$ is in $\text{fix}(F)$ too. 
Since $\text{dom}F$ is convex, then $Fz$ exists and defined. 
Non-expansiveness asserts that $Fz$ is a singleton. 
Therefore we consider: 

$$
\begin{aligned}
    & \Vert Fz - x\Vert_2 \le (1 - \theta)\Vert y - x\Vert_2
    \\
    & \Vert Fz - y\Vert_2 \le \theta \Vert y - x\Vert_2
    \\
    \implies &
    \Vert x - y\Vert_2 = \Vert x - Fz + Fz - y\Vert_2 \le 
    \Vert Fz - x\Vert_2 + \Vert Fz - y\Vert_2
    \le 
    \Vert x - y\Vert_2, 
\end{aligned}
$$

and the last line suggest that the point $Fz$ must lies on the line segment $[x, y]$ because it is the triangular inequality but the equality is true. 
And surprisingly, that would mean $\Vert Fx - z\Vert = (1 - \theta) \Vert y - x\Vert_2$ and $\Vert Fz - y\Vert = \theta \Vert y - x\Vert_2$ as well. 
With that we have $\theta \Vert y - x\Vert = \Vert z - y\Vert$, and therefore $z$ is in the fixed point set $\text{fix}(F)$. 
Therefore the fixed point set is a convex set. 

**References**: 

[Primer on Monotone Operators](../../MATH%20999%20Paper%20Reviews%20and%20Frontier%20Mathematics/References%20Sep%202022/Primer%20on%20Monotone%20Operators.pdf), The Primer on Monotone Operator Paper. 

#### **Thm | If the doman is closed, Then Fixed point Set is closed too**
> Let $F: D \mapsto X$ be an operator that has a closed domain $D$ and it's Lipschitz. 
> Then the fixed point set $\text{fix} (T)$ is also a closed set. 

**Proof**

Let $x = Fx$ so $x \in \text{fix} (F)$. 
Then consider $x_n \rightarrow x$ where $x_n \in \text{fix}(T)$ for all $n \in \mathbb N$. 
So $x_n = Tx_n$, and since $T$ is continuous (Because non-expansive means continuity), taking the limit we have $x  = Tx$. 
Therefore the set $\text{fix}(T)$ is a closed set. 


**Remarks**

This theorem generalizes to Hilbert space due to strong convergence. 


---
### **Lipschitz Operators in Relations to Other type of Operators**

Slight modifications of a non-expansive operator makes it into a maximally monotone operator. 

#### **Thm | Monotone Operator from a Nonexpansive Operator**
> Let $N: D \mapsto D$ be a nonexpansive operator. 
> The following scenarios are true. 
> 1. Then $I - N$ is a monotone operator, 
<!-- > 2. if in addition $D = X$ and $N$ is maximally monotone, then $I - N$ is a maximally monotone operator if and only if $N$ is a nonexpansive operator. -->

**Proof**


Suppose $N$ is a Lipschitz operator then: 

$$
\begin{aligned}
    \left\langle 
        x - y, x - y - (Nx - Ny)
    \right\rangle 
    &= \Vert x - y\Vert^2 - \langle x - y, Nx - Ny\rangle 
    \\
    & \ge \Vert x - y\Vert^2 - \Vert x - y\Vert \Vert Nx - Ny\Vert
    \\
    &\ge 
    \Vert x - y\Vert(\Vert x - y\Vert - \Vert Nx - Ny\Vert)
    \\
    &\ge 0. 
\end{aligned}
$$



$\blacksquare$


#### **Claim | Averaged Operator and Nonexpansive Operators**
> A strict convex combinations between a nonexpansive operator and the identity operator makes it an averaged operator. 

**Observation**

This is the definition of an averaged operator and can be viewed [Averaged Operators](Averaged%20Mapping.md). 


#### **Proposition | Nonexpansive operator and Firmly Nonexpansive Operators**
> Let $N$ be nonexpansive operator if and only if $(1/2)(N + I)$ is a firmly non-expansive operator. 

**Observations**

If we already know the definition of an averaged operator and their properties, then $(1/2)(N + I)$ is an $(1/2)$ averaged operator and therefore it's equivalent to a firmly nonexpansive operator. 

**Proof**

Let $T = (1/2)(N + I)$, consider that 

$$
\begin{aligned}
    2T &= N + I
    \\
    N &= 2T - I. 
\end{aligned}
$$

Since $N$ non-expansive, by the property of firmly non-expansive operator, the RHS is a reflector, and therefore $T$ is firmly nonexpansive. 




---
### **Examples of Lipschitz Operators**

See [Convex Sets Projections and Dist, Intro](Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) to discover that the projection onto a convex set is a non-expansive operator. 

