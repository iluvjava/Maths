- [Banach Space Introduction](Banach%20Space%20Introduction.md), 

---
### **Intro**

When there is vector space, we have linear operator. However, in the world Banach Space, we have infinite dimensional vector space to work with. 

#### **Def-1 | Linear Operators**
> A linear operator $T$ is an operator such that: 
> 1. Maps between 2 normed spaces/subspaces that has the same scalar. Denote the 2 spaces as $D\subseteq X, R\subseteq Y$. 
> 2. for all $x, y \in D$ and scalars: $\alpha$: 
>   - $T(x + y) = Tx + y$, 
>   - $T(\alpha x) = \alpha T(x)$. 
>   Constructing a homomorphism for the ring, which is the vector space (Using abstract algebra language). 

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

This part will be focusing on later part of chapter 2 of Kryzig's textbook for functional analysis. We will denote te indices for theorems in the book using: (.). 

---
### **Elementary Theorems**

These results are elementary, it's the same as basic linear algebra, but they are proved without explicit definition or intuitive, graphical interpretations of a linear operator in finite dimensional spaces. These proofs are not exactly useful, but they tells us what generalizes from the intuitions for linear operators in finite dimensional spaces. 

#### **Thm-1 | Range and Null Spaces (2.6-9)**
> 1. Range of a linear operator is also a vector space. 
> 2. If $\text{dim.dom}(T) = n < \infty$ , then $\text{rng}(T) \le n$. 
> 3. The null space, $\text{null}(T)$ is a vector space. 

**Proof** Skipped. 

**Remarks**: 

From (2.), a linear operator will preserve linear dependence of a set of vectors, 

#### **Thm-2 | Inverse Operator (2.6-10)**
> Let $X, Y$be vector spaces, both real and complex, Let $T: \text{dom}(T)\mapsto Y$, be a linear operator, with some domain and range that are subsets of $X, Y$. Then: 
> 1. The inverse exists if and only if $Tx =\mathbf 0  \iff x =\mathbf 0$. 
> 2. $T^{-1}$ exists, then it will be a linear operator. 
> 3. If $\text{dim}(T) = n < \infty$ and $T^{-1}$ exists, then $\text{dim.rng}(T) = \text{dim.dom}(T)$. 

**Proof**: 
For (1.) use the conditions to show the onto property for the linear operator. (2.) is direct from the linearity of the operator $T$. (3) Direct from (3.) in thm-1. 

#### **Lemma-1 | Inverse of Product (2.6-11)**
> Let $T$ mapping from $X$ to $Z$, Let $S$ mapping from $Y$ to $Z$, and they are both bijective linear operator on vector spaces, then the inverse $(ST)^{-1} = T^{-1}S^{-1}$. 

**Proof**

We skipped. 

---
### **Bound and Continuous Linear Operators**

Bounded linear operaors are important, they themselves are just another type of vector spaces with norms. We introduce them in this section. 

#### **Def-2 | Bounded Linear Opeartor**
> Let $X, Y$ be normed spaces, and $T: X\mapsto Y$ a linear operator, where $\text{dom}(T)\subseteq X$, the opeartor $T$ is bounded if there is a real number C such that for all $x\in \text{dom}(T)$: $\Vert Tx\Vert \le c\Vert x\Vert$. 

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


#### **Corollary | Continuity, Null Space (2.7-10)**
> Let $T$ be a bounded linear operator, then: 
> 1. $x_n \rightarrow x$ means that $Tx_n \rightarrow Tx$, preserving limits, closure of a subset of the domain will be preserved after the mapping of a bounded linear operator. 
> 2. The null space $\text{null}(T)$ is a closed space. 

**Proof**: We skip for now. 

#### **Thm-4 | Bounded Linear Extension (2.7-11)**
> Let $T$ be a bounded linear operator mapping from $\text{dom}(T)\subseteq X$ to $Y$, assuming that $\text{dom}(T)$ is a normed vector space and $Y$ is a Banach space (It's complete). Then $T$ has the following extnsion: 
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

Linear functions are a special type of linear mapping that is of special interests because they are the basic components of a linear mapping, and they also links to a concepts called: "Dual spaces", because they themselves can be represetned as a vector in the Dual Space. We didn't define it here. We introduce the definition of a linear functional: 

#### **Def-4 | Linear Functionl (2.8-1)**

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
