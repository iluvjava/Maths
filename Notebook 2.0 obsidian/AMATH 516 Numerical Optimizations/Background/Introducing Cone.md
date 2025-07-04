
- [[Topological Basics for Optimizations]]


---
### **Intro**

Cone is a special type of set. 
It appears a lot in convex analysis and optimizations. 

#### **Definition | A cone**
> A set $K$ is a cone if for all $\lambda K, \lambda > 0$: $\lambda K\subseteq K$. 

**Observations**
1. If $K$ is a cone, and it's closed, then $\mathbf 0 \in K$. 
Take limits of $\lambda \searrow 0$ to see why. 
2. The Minkowski sum of 2 cones is still a cone. 
3. The intersection of 2 cones is still a cone. 
4. The union of 2 cones is still a cone. 
5. A cone come be convex, or it can be non-convex. Let $K_1, K_2$ be convex cone, then $K_1 \cup K_2$ is always a cone but, it's not always a convex cone. 

**Examples** 

* $\mathbb{R}^n_+$.
* $\{x| Ax \ge \mathbf 0\}$. 
* $\{(x, y)\in \mathbb R^2 | xy = 0\}$. It is not a convex set but, it's a cone.  
* $\{y \in \mathbb R^n | \langle a, y\rangle \le 0\}$. 
* $\{\lambda v: v \in \{v_1, v_2, v_3..., v_n\}, \lambda \ge 0\}$. It's not convex. 


#### **Definition | pointed cones**
> A cone $C \subset \R^n$ is pointed when: 
> * A cone is called pointed if $-C \cap C= \{\mathbf 0\}$. It means the origin is an extreme point of the set. 
> * It's also convex. 

**Reproducing Cones**
* Sometimes, $C - C = \mathbb E$, the whole Euclidean space. Then that space is called reproducing. 

**References**

This is taken from Prof Dimitri's teaching of MATH 516 at UW 2021. 

#### **Lemma | a property of the convex cone**
> Let $C \subseteq \R^n$ be a convex cone. 
> Then, for all $a \in C, b \in C$, it has $a + b \in C$. 

**proof**

Let $a \in C, b \in C$. 
By convexity $(1/2)(a + b)\in C$. 
But because it's a cone $a + b \in C$. 

$\blacksquare$


---
### **Some basic properties/operations of cones**
Some basic operations of cones and, properties are relevant. 
Recession cone reduces set to its direction of unboundedness. 
When the set is convex, we will have a cone. 
#### **Definition | recession cone**
>Let $Q\subseteq \R^n$ be convex, then the recession cone of the set is defined as: $\{v\in \R^n : Q + v \subseteq Q\}$, denoted by $\text{rec}(Q)$. 

**Observations**

1. If $Q$ is already a cone, then $\text{rec}(Q) = Q$. The converse is not true, $Q = \N$ is a counter example. 
2. For all $\lambda > 0$, it has $\text{rec}(\lambda Q)\subseteq \lambda \text{rec}(Q)$. 
3. For any convex set, the recession cone is a convex set. 
To see, for all $z_1, z_2 \in \text{rec}\; Q$, by definition $Q + z_1 \subseteq Q$ and $Q + z_2 \subseteq Q$. 
Since $Q$ is convex, so are $Q + z_1, Q + z_2$. 
Therefore, for all $\lambda \in (0, 1)$: 
$$
\begin{aligned}
    Q + \lambda z_1 + (1 - \lambda)z_2
    = \lambda(Q + z_1) + (1 - \lambda)(Q + z_2)
    \subseteq 
    \lambda Q + (1 - \lambda)Q = Q. 
\end{aligned}
$$
4. $\text{rec}\; Q$ is a cone when $Q$ is convex. Consider $y \in \text{rec}\; Q$, then $Q + y \in Q$, but $Q + y \in Q$, so $Q + y + y \in Q$, and $Q + y \ldots + y \in Q$ so $Q + ny \in Q$ for all $n \in \N$. Since $\text{rec}\; C$ was convex, the convex hull of $\{n y \in \R^n : n \in \N\}$ is the ray in direction $y$ and it's in the set $\text{rec}\; Q$. Hence, $\text{rec}\; Q$ must be a cone. 

**Remarks**

For a convex set, recession cone gives a direction of unboundedness. 

#### **Lemma | recession cone characterizes cone**
> Let $C\subseteq R^n$ be a convex set. 
> Then the set is a cone if and only if $\text{rec}\; C = C$. 

**Proof**

Exercise for the reader. 

$\blacksquare$


#### **Definition | linearity of a cone**
> Let $C \subseteq \R^n$ be a convex cone, then the linearity of the cone denoted by $\text{lin}\; C$ is defined as $\text{lin}\; C = C\cap (- C)$. 

**Observations**

Let $C, C_1, C_2$ be convex cones in $\R^n$. 
From the definition we make the following observations: 
1. $\text{lin}\; C_1\cap C_2 = \text{lin}\; C_1 \cap \text{lin}\; C_2$. 
2. $C \cap (\text{lin}\; C)^{\perp}$ will always be a pointed cone. 
3. $C = \text{lin}\; C + C\cap (\text{lin}\; C)^{\perp}$ because $\text{lin}\; C \subseteq C$ always, and it has $C \cap (\text{lin}\; C)^\perp$ being a pointed cone. This decomposes a cone into the sum of a pointed cone and a subspace. 



#### **Lemma | linear subspace pushes through linearity of cone**
> Let $L \subseteq \R^n$ be a linear subspace. 
> Let $C \subseteq \R^n$ be a convex cone. 
> Then $\text{lin}(C + L) = \text{lin}\; C + L$. 

**Proof**

The proof is direct. 
$$
\begin{aligned}
    & x\in \text{lin}(C + L) 
    \\
    \underset{\text{(a)}}{\iff}
    & x \in C + L \wedge x \in -C + L
    \\
    \iff 
    & x + L \subseteq (-C) \wedge x + L \subseteq C
    \\
    \iff
    & x + L \subseteq \text{lin}\; C
    \\
    \iff 
    & x \in \text{lin}\; C + L. 
\end{aligned}
$$

At **(a)** we used the fact that $-L = L$ because $L$ is a linear subspace. 

$\blacksquare$

**Remarks**

If, a cone $C$ can be decomposed into a sum of linear subspace $L$ and a pointed cone $\hat C$, then $\text{lin}\;C = \text{lin}\; \hat C + L = L$ because the linearity of a pointed cone is always $\{\mathbf 0\}$. 


----
### **More Concepts about Cones**

- [Dual Cone](Dual%20Cone.md). Related to the Fenchel dual of indicator functions. 
- [Polar Cone](Polar%20Cone.md). A polar cone is the result of a transformation on a cone such that it's perpendicular to the original cones. 
- [Normal Cone](Normal%20Cone.md). A conic description of sets with convex analysis or variational flavors. 
- [Tangent Cone Introduction](AMATH%20516%20Numerical%20Optimizations/Background/Tangent%20Cone%20Introduction.md). A conic description of functions and sets with convex analysis or variational flavors. 