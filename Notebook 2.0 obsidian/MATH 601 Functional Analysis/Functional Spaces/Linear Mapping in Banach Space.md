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
- *Injective* or *one-to-one* if points in the domains maps to a unqiue point in the range of the operator. 
- 

Such an operator will be able operate on any Normed Spaces, here we list some examples of them to enlighten the concepts. 

**Basic Examples**
- Matrices in finite dimension over the complex field, or the real fields, or matrices for some vector field that contains a norm. 
- In $C[a, b]$, multiplying the function $x(t)$ by a $t$, resulting in $tx(t)$, is a linear transformation. 
- In $C[a, b]$, $T(x) = \int_{a}^t x(\tau)d\tau$ is a linear transform between functions. 
- Differentiation is a linear transform. 
- The zero opeartor, where it maps an element in the vector space to the zero element in the vector space. 

**References**:

This part will be focusing on later part of chapter 2 of Kryzig's textbook for functional analysis. We will denote te indices for theorems in the book using: (.). 

---
### **Important Theorems**

These results are elementary, it's the same as basic linear algebra, but they are proved without explicity definition or intuitive, graphical interpretations of a linear operator in finite dimensional spaces. These proofs are not exactly useful, but important for intuitive understanding of the infinite dimensional spaces. 

#### **Thm-1 | Range and Null Spaces (2.6-9)**
> 1. Range of a linear operator is also a vector space. 
> 2. If $\text{dim.dom}(T) = n < \infty$ , then $\text{rng}(T) \le n$. 
> 3. The null space, $\text{null}(T)$ is a vector space. 

**Proof** Skipped. 

**Remarks**: 

From (2.), a linear operator will prserve linear dependence of a set of vectors, 

#### **Thm-2 | Inverse Operator (2.6-10)**
> Let $X, Y$be vector spaces, both real and complex, Let $T: \text{dom}(T)\mapsto Y$, be a linear operator, with some domain and range that are subsets of $X, Y$. Then: 
> 1. The inverse exists if and only if $Tx = 0 \iff x = 0$. 
> 2. $T^{-1}$ exists, then it will be a linear opeartor. 
> 3. If $\text{dim}(T) = n < \infty$ and $T^{-1}$ exists, then $\text{dim.rng}(T) = \text{dim.dom}(T)$. 

#### **Lemma-1 | Inverse of Product (2.6-11)**


