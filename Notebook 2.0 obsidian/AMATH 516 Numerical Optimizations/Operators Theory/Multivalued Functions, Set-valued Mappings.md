[[Characterizing Functions for Optimizations]], 
[[../../MATH 000 Math Essential/Relations]]

---
### **Intro**

We introduce the basics about a multi-valued mapping. 

#### **Def | Multi-Valued Mapping**

> A multi-function is a relation. 
> Let $F(x)$ be a multifunction, we denote $R$ to be a relations then: 
> $$
> F(x) \ni y \iff (x, y)\in R
> $$
> Then, $R = \text{gph}(F)$, the relation is the graph of the function. 

**More Definitions**

$F$ is an operator that maps $\mathbb E$ to $\mathbb E$ where $\mathbb E$ denotes the Euclidean space. 
A multi-value mapping on the space of $\mathbb E$ is denoted as $F: \mathbb E\rightrightarrows\mathbb E$ or $F: \mathbb E \mapsto 2^{\mathbb E}$. 
Here is a list of concepts for the operators we defined consequently: 

$$
\begin{aligned}
    & \text{dom}(F) := \{x: \exists y: (x, y)\in \mathbb E\times \mathbb E\}, \text{ domain}
    \\
    & \text{rng}(F) := \{y: (x, y)\in \mathbb E \times \mathbb E\}, \text{ range}
    \\
    & \text{gph}(F) := \{(x, y): (x, y) \in \mathbb E \times \mathbb E\}, \text{ graph}
\end{aligned}
$$

The graph of the operator is the multi-function visualized on a higher dimensions of the cross product space. 
One can also define the inverse of the set-value mapping via the graph of the operator. 


#### **Def | Set Transform**

> Let $F: X \mapsto 2^X$, then let $C\subseteq X$, then we define 
> $$
>   F(C) = \bigcup_{x\in C} Fx, 
> $$
> to be the union of the output of the function over all elements of $C$. 




---
### **Graphical Interpretations of Multi-Valued Mapping**

Let $A: X \mapsto 2^X$, then $\text{gph}A$ represents a relation between the set $X$ and itself, making it a subset of the product space $X\times X$. 

#### **Claim | Inverse Graph is a Linear Transform away from the Original**
> We have $F(x, y)\in \text{gph}(A)$ where $F: X\times X\mapsto X\times X$ is a flip matrix: 
> $$
> F = 
> \begin{bmatrix}
>     \mathbf 0 & I \\ I & \mathbf 0
> \end{bmatrix}, 
> $$
> then $F(x, y)\in \text{gph}A \iff (x, y)\in \text{gph}A^{-1}$. 

**Proof**

$$
\begin{aligned}
    (x, y) \in \text{gph}(A) 
    & \iff
    y \in Ax
    \\
    &\iff 
    x \in A^{-1}y
    \\
    &\iff (y, x) \in \text{gph }A^{-1}
\end{aligned}
$$

**Remarks**

$F^2 = F = -F$

#### **Claim | Identity Additions Transform**
> Let $A: X\mapsto 2^X$ be a multi-valued mapping then let $F: X\times X \mapsto X\times X$ be a linear mapping then we have $(x, y)\in \text{gph }(A + I)\iff T(x, y)\in \text{gph }A$ where $T$ is 
> $$
> \begin{aligned}
>     T = \begin{bmatrix}
>         I & \mathbf 0 \\ I & I
>     \end{bmatrix}
> \end{aligned}. 
> $$

**Proof**

$$
\begin{aligned}
    (x, y) \in \text{gph } A 
    &\iff y \in Ax 
    \\
    & \iff 
    y + x \in \{x\} + Ax
    \\
    &\iff 
    (x, y + x) \in \text{gph }A
    \\
    &\iff 
    T(x, y) \in \text{gph }A
\end{aligned}
$$




---
### **Def | Operations**

Common operations and their rules. 

#### **Def| Composition**
> Let $T, S$ be 2 set-valued operators, then the composition between the 2 operator 
> $$
> \text{gph}(T\circ S)= \{(x, y)|\; \exists z : (x, z)\in \text{gph}(S) \wedge (z, y)\in \text{gph}(T)\}. 
> $$

**Demonstrations**

The definition is demontrated by the definition of applying sets as inputs for the operator because 
$$
\begin{aligned}
    y \in A\circ B x 
    & \iff 
    y \in \bigcup_{x_B \in Bx} Ax_B
    \\
    & \iff 
    \exists x_B \in Bx: y \in Ax_B
    \\
    & \iff
    \exists x_B: \left(
        (x, x_B) \in \text{gph } B 
    \right)\wedge
    \left(
        (x_B, y) \in \text{gph }A
    \right)
    \\
    & \iff 
    \{z | z \in Bx\} \cap \{z | y \in Az\} \neq \emptyset
\end{aligned}  
$$






#### **Def | Addition**
> Let $T, S$ be 2 set-valued operators, then their additions is taking the same domains for both operators, but performing Minkowski summations for the output, giving us: 
> $$
> \text{gph}(T + S) = \{(x, y + z)|(x, y)\in T, (x, z)\in S\}, 
> $$

For simplicity we denotes $(x, y)\in T$ as $(x, y)\in \text{gph}(T)$. When thinking about the set-valued operators, we might treat then directly as their graph instead. 


#### **Def | The Inverse of the Multi-valued Mapping**
> Let $A:  X \mapsto  2^X$  be a multi-valued mapping, then the inverse of the operator is defined via the relation $\text{gph}(A^{-1}) = \{(x, y)\in X \times X : x \in Ay\}$. 

**Observations**

It's just swapping the elements from the relations. 


**Remarks**

The inverse $T^{-1}$ is different from the tranditional sens of inverse. 
$T^{-1}T \neq I$. 
For example, consider $T x = \mathbf 0$ for all $x \in X$, then $T^{-1}$ would map $0$ to everything $X$, and this operator is not the same as the identity operator. 
Information is lost. 
It's only an identity mapping when the operators are invertible operators. 
Additionally, this fact indicates that $(A\circ B)^{-1}\neq (B^{-1}\circ A^{-1})$. 