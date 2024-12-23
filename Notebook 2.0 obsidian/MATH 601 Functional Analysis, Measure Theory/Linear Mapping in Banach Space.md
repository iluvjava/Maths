---
tags: 
- unfinished
---
- [Banach Space Introduction](Functional%20Spaces/Banach%20Space%20Introduction.md), 

---
### **Intro**

When there is vector space, we have linear operator. However, in the world Banach Space, we have infinite dimensional vector space to work with. In this file, we are following Kryzig's textbook, introduction to functional analysis. 

#### **Def-1 | Linear Operators**
> A linear operator $T$ is an operator such that: 
> 1. Maps between 2 normed spaces/subspaces that has the same scalar. 
> Denote the 2 spaces as $D\subseteq X, R\subseteq Y$. 
> 2. for all $x, y \in D$ and scalars: $\alpha$: 
>   - $T(x + y) = Tx + Ty$, 
>   - $T(\alpha x) = \alpha T(x)$. 
>   It constructing a homomorphism for the ring, which is the vector space (Using abstract algebra language). 

**Keywords and Basic Quantities**
- *Null space* is the set of all $x$ such that $Tx = \mathbf 0$
- *Onto* if, $\text{rng}(T) = Y$, the whole space. 
- *Injective* or *one-to-one* if points in the domains maps to a unique point in the range of the operator. 

Such an operator will be able operate on any Normed Spaces, here we list some examples of them to enlighten the concepts. 

**Basic Examples**
- Matrices in finite dimension over the complex field, or the real fields, or matrices for some vector field that contains a norm. 
- In $C[a, b]$, multiplying the function $x(t)$ by a $t$, resulting in $tx(t)$, is a linear transformation. 
- In $C[a, b]$, $T(x) = \int_{a}^t x(\tau)d\tau$ is a linear transform between functions. 
- Differentiation is a linear transform. 
- The zero operator, where it maps an element in the vector space to the zero element in the vector space. 

**References**:

This part will be focusing on later part of chapter 2 of Kryzig's textbook for functional analysis. We will denote the indices for theorems in the book using: (.). 

---
### **Elementary Theorems**

These results are elementary, it's the same as basic linear algebra, but they are proved without explicit definition or intuitive, graphical interpretations of a linear operator in finite dimensional spaces. 
These proofs are not exactly useful, but they tells us what generalizes from the intuitions for linear operators in finite dimensional spaces. 

#### **Thm 1 | Range and Null Spaces (2.6-9)**
> 1. Range of a linear operator is also a vector space. 
> 2. If $\text{dim.dom}(T) = n < \infty$ , then $\text{rng}(T) \le n$. 
> 3. The null space, $\text{null}(T)$ is a vector space. 

**Proof**

1. Choose some $y_1, y_2 \in \text{rng}(T)$, we show that $\alpha y_1 + \beta y_2 \in \text{rng}(T)$, by def of in $\text{rng}(T)$ we have $\exists x_1, x_2 : Tx_1= y_1, Tx_2 \in y_2$, and the results directly follows from the linearity of the operator. 
2. It's impossible to have a set of $n + 1$ element such that it's independent. Let $\{y_i\}_{i = 1}^{n + 1}\subseteq \text{dom}(T)$ be a set of $n + 1$ element, arbitrary. Then there exists a set of input vector $\{x_i\}_{i = 1}^{n + 1}$ such that $Tx_i = y_i\in \text{rng}(T)$ from the definition of domain of the linear operator. From the fact that $\text{dim.dom}(T) = n$, the set $\{x_i\}_{i = 1}^{n + 1}$ is linear dependent, which means that 
$$
\begin{aligned}
    & \alpha_1 x_1 + \cdots + \alpha_{n + 1} x_{n + 1} = 0, \exists 1 \le i \le n + 1: \alpha_i \neq 0
    \\
    \implies 
    & T(\alpha_1 x_1 + \cdots + \alpha_{n + 1} x_{n + 1})  = \alpha_1 y_1 + \cdots + \alpha_{n + 1}y_1 = 0,
\end{aligned}
$$

therefore, the set of vectors $y_i\in \text{rng}(T)$ is linearly dependent. 
Since $x_i$ is an arbitrary set of vectors, there is no way we can have a linear independent set of dimension $n + 1$, hence $\text{dim.rng}(T) \le n$. 

3. This one is direct from the definition of the null space of the linear operator, we skip this proof. 


**Remarks**: 

From (2.), a linear operator will preserve linear dependence of a set of vectors. 
Given a linear combination of vectors $\alpha_1 x_1+ \cdots, \alpha_nx_n$ that are linear dependent, then applying the linear transform still produce a sum of vectors: $\alpha_1Tx_1 + \cdots + \alpha_n T_nx_n$. 


#### **Thm 2 | Inverse Operator (2.6-10)**
> Let $X, Y$ be vector spaces, both real and complex, Let $T: \text{dom}(T)\mapsto Y$, be a linear operator, with some domain and range that are subsets of $X, Y$. Then: 
> 1. The inverse exists if and only if $Tx =\mathbf 0  \iff x =\mathbf 0$. 
> 2. $T^{-1}$ exists, then it will be a linear operator. 
> 3. If $\text{dim}(T) = n < \infty$ and $T^{-1}$ exists, then $\text{dim.rng}(T) = \text{dim.dom}(T)$. 

Note that, the inverse of the operator exists on the $\text{rng}(T)$ if $T$ is one-2-one. 
It implies that $Tx_1 = Tx_2 \implies x_1 = x_2$, allowing for the inverse of some element $y\in \text{rng}(T)$ to be uniquely defined. And when $T$ is onto, the inverse exists on the entire vector space mapped by $T$. 

**Proof**: 

For (1.) use the conditions to show the onto property for the linear operator. 
(2.) is direct from the linearity of the operator $T$. (3) Direct from (2.) in thm-1 applying to $T$, and $T^{-1}$.

#### **Lemma 1 | Inverse of Product (2.6-11)**
> Let $T$ mapping from $X$ to $Z$, Let $S$ mapping from $Y$ to $Z$, and they are both bijective linear operator on vector spaces, then the inverse $(ST)^{-1} = T^{-1}S^{-1}$. 

**Proof**

We skipped. 

---
### **Bounded and Continuous Linear Operators**

In finite dimensional vector spaces, all linear mapping are bounded. 
In infinite dimensional vector spaces, not all linear mapping are bounded. 
And it turns out that boundedness and continuity is equivalent in the case of a linear mapping. 
Bounded linear operators are important, they themselves are just another type of vector spaces with norms. 
We introduce them in this section. 

#### **Def-2 | Bounded Linear Opeartor**
> Let $X, Y$ be normed spaces, and $T: X\mapsto Y$ a linear operator, where $\text{dom}(T)\subseteq X$, the opeartor $T$ is bounded if there is a real number $c$ such that for all $x\in \text{dom}(T)$: $\Vert Tx\Vert \le c\Vert x\Vert$. 

#### **Def-3 | Norm of Linear Operator**
> Let $T$ be a bounded linear operator mapping from $X$ to $Y$ be some normed spaces, then the norm of a linear opeartor is defined as: 
> $$
> \Vert T\Vert = \sup_{x\in X} \frac{\Vert Tx\Vert_Y}{\Vert x\Vert_X}. 
> $$

We skip the demonstrations for proving that the norm of the bounded linear operator is indeed a norm.

**Remaks**: 

Direct from the definition of the norm, we have $\Vert Tx\Vert \le \Vert T\Vert \Vert x\Vert_X$ for all $x\in \text{dom}(f)$. 

#### **Thm-3 | Continuity and Boundedness are Equivalent (2.7-9)**
> Let $T$ be mapping from $\text{dom}(T)$ to $Y$, be a linear operator, where it's domain is a subspace of $X$, then: 
> 1. $T$ is continuous if and only if $T$ is bounded. 
> 2. $T$ is continuous at a single point then it's continuous.

**Proof (Sketch)**: 

For (1.), try $\Vert x - y\Vert \le \delta$, with $\delta = \epsilon / \Vert T\Vert$. For (2.), instead of showing it's continuous, just show that continuity at any point is the same as bounded, then using (1.) as a results, showing that it's continuous. 

**Remarks**
Continuity is boundedness, and vice versa. In the infinite dimension, it's possible to have a mapping that is linear and not continuous. 


#### **Corollary | Continuity and Null Space (2.7-10)**
> Let $T$ be a bounded linear operator, then: 
> 1. $x_n \rightarrow x$ means that $Tx_n \rightarrow Tx$, preserving limits, closure of a subset of the domain will be preserved after the mapping of a bounded linear operator. 
> 2. The null space $\text{null}(T)$ is a closed space. 

**Proof**:
1. Since $T$ is bounded, from previous theorem, it's a continuous on the Banach space. Since we are in banach space, we can have limit, by continuity of the mapping, the limit in the space exists and will be preserved. 
2. Choose $x\in \text{cl.rng}(T)$ be arbitrary, then exists $x_n\rightarrow x$ such that $Tx_n = \mathbf 0 $ for all $n \in \mathbb N$, by previous case (1), this has a limit and it's $\mathbf 0$. Therefore, $x\in \text{rng}(T)$, and therefore the set is a closed set. 


#### **Thm-4 | Bounded Linear Extension (2.7-11)**
> Let $T$ be a bounded linear operator mapping from $\text{dom}(T)\subseteq X$ to $Y$, assuming that $\text{dom}(T)$ is a normed vector space and $Y$ is a Banach space (It's complete). Then $T$ has the following extension: 
> $$
>   \widetilde T: \text{cl.dom} (T) \mapsto Y, 
> $$
> where, we closed the domain of the bounded linear mapping, and the extension will have the property that $\Vert \widetilde T\Vert = \Vert T\Vert$. 

**Observations**: 

Please keep in mind that, $Y$ is a complete space, only that it's possible to complete the domain of the bounded linear operator, and the operator is bounded. 

**Proof**: 

We skip them for now. 

---
### **Linear Functionals**

Linear functions are a special type of linear mapping that is of special interests because they are the basic components of a linear mapping, and they also links to a concepts called: "Dual spaces", because they themselves can be represented as a vector in the Dual Space. We didn't define it here. We introduce the definition of a linear functional: 

#### **Def-4 | Linear Functional (2.8-1)**

> A linear functional $f$ is linear operator with domain in a vector space $X$, and its range is the scalar space for the vector space $X$. The scalar field is complex or real for the context of functional analysis because they have many desirable properties. 

#### **Def-5 | Bounded Linear Functional**

> A linear functional $f$ mapping from $\text{dom}(f)\subseteq X$ to $K \in \{\mathbb R, \mathbb C\}$, if there exists a real number $c$ such that for all $x\in \text{dom}(f)$, we have: 
> $$
>   |f(x)| \le c \Vert x\Vert_X. 
> $$

**Remarks**: 

The theorems and properties for a bounded linear mapping also applies to a bounded linear functional. 


**Examples of Linear Functionals**

1. Definite integrals on $C[a, b]$. 
2. Dot product. 
3. Choosing a fixed of a function and putting it into the function in the space $C[a, b]$. 
4. The $l^2$ sequence space. 

---
### **Kronecker Delta Representation of Linear Functional**

We present the coordinate form of a linear funtional. 
Let $\mathcal B = \{\e_1, \e_2\cdots\}$ be set of basis vectors for space $V$. 
The basis could be finite but for generality we assumed that it's not. 
We define $\beta_{i} : V \mapsto \mathbb R$, for $i \in \mathbb N$ to be such that 

$$
\begin{aligned}
    \beta_i(\e_j) = 
    \delta_{i, j} := 
    \begin{cases}
        0 & i \neq j, 
        \\
        1 & i = j. 
    \end{cases}
\end{aligned}
$$

Let's now consider generic vector $v \in V$ represented by basis $\mathcal B$. 
Assuming that $\beta_i$ is a linear functional, then

$$
\begin{aligned}
    \beta_i\left(
        \sum_{j \in \mathbb N}^{} v_j\e_j
    \right) &= 
    \sum_{j\in \mathbb N}^{}
    v_j \beta_i(\e_j)
    \\
    &= v_i. 
\end{aligned}
$$

It quiry the multiplier of a basis representation of a vector $v$. 
This is a special kind of linear functional. 


---
### **Adjoint Operators in Banach Spaces**

This section will be based on 4.5 of Kryzig's textbook for functional analysis. However, to make this concept useful and easier to understand, we need to view it as a generalization of adjoint operators in Hilbert spaces. See [Linear Mapping in Hilbert Space](Linear%20Mapping%20in%20Hilbert%20Space.md) for more about adjoin operator in Hilbert space. 



