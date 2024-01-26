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


---
### **Def | Operations**

Common operations and their rules. 

#### **Def| Composition**
> Let $T, S$ be 2 set-valued operators, then the composition between the 2 operator 
> $$
> \text{gph}(T\circ S)= \{(x, y)| (x, z)\in \text{gph}(S), (z, y)\in \text{gph}(T)\}. 
> $$

#### **Def | Addition**
> Let $T, S$ be 2 set-valued operators, then their additions is taking the same domains for both operators, but performing Minkowski summations for the output, giving us: 
> $$
> \text{gph}(T + S) = \{(x, y + z)|(x, y)\in T, (x, z)\in S\}, 
> $$

For simplicity we denotes $(x, y)\in T$ as $(x, y)\in \text{gph}(T)$. When thinking about the set-valued operators, we might treat then directly as their graph instead. 


#### **Def | The Inverse of the Multi-valued Mapping**
> Let $A:  X \mapsto  2^X$  be a multi-valued mapping, then the inverse of the operator is defined via the relation $\text{gph}(A^{-1}) = \{(x, y)\in X \times X : x \in Ay\}$. 

**Observations**

It's just swapping the relation. 
In the case of $X = \mathbb R$, the graph of the inverse of $A$ is a reflection along $y = x$ on $\mathbb R^2$. 
In general, to obtain the graph of the inverse, we perform the linear transform

$$
\begin{aligned}
    \begin{bmatrix}
        0 & I_X
        \\
        I_X & 0
    \end{bmatrix}, 
\end{aligned}
$$

where $I_X$ denotes the identity transformation on the space $X$. 
Let $T, S$ be 2 operator $\mathbb E\mapsto 2^{\mathbb E}$ then the inverse of their composition $(T\circ S)^{-1}$ equals to $S^{-1} \circ T^{-1}$. 

**Remarks**

The inverse $T^{-1}$ is different from the tranditional sens of inverse. 
$T^{-1}T \neq I$. 
For example, consider $T x = \mathbf 0$ for all $x \in X$, then $T^{-1}$ would map $0$ to everything $X$, and this operator is not the same as the identity operator. 
Information is lost. 
It's only an identity mapping when the operators are invertible operators. 