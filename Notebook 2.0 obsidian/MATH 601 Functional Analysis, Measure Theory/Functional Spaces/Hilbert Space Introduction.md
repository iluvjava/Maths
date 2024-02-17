- [Inner Product Space](Inner%20Product%20Space.md), 
- [Convex Sets Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Intro.md). 

---
### **Into**

[Hilbert space](https://mathworld.wolfram.com/HilbertSpace.html)(Wolfram Math World) is a complete inner product space. 
It's Banach space enhanced with Euclidean geometry. 
There is one important results that come from the completeness of the Hilbert space, and that is the projection theorem. 
For more about the projection theorem in finite dimensional spaces, visit [Convex Sets Projections and Dist, Intro](../../AMATH%20516%20Numerical%20Optimizations/Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more info. 
Other interests of Hilbert space includes orthogonal basis and linear operator, which will be more interesting due to the fact that [Hilbert spaces are self dual to each other](https://mathworld.wolfram.com/Self-Dual.html)(Wolfram Math World), which allows for an inner product, bilinear form representation for linear mapping, and the important Rietz Representation Theorem. 

**Important Notes Throughout**

Let $M$ be a subset of $\mathcal H$, the Hilbert space, then $\text{span}(M)$ is the span of finite many elements in $M$. 
This is important because closure of the span, denoted as $\overline{\text{span}(M)}$ is a different set that make the Hilbert space complete. 
This is different from what we can have in a finite Euclidean space because it changes the meaning of closure. 

**References**

All the content are coming from the lecture notes from Prof Shawn Wang at UBCO for his Math 328 class, I am not sure where he find these fascinating proofs. 
This is also based on Kryzig's textbook on functional analysis. 



---
### **Orthogonal Complements In Hilbert Spaces**

We discuss the properties of orthogonal complements and their properties. 
Please read carefully since they are not exactly the same as in finite dimensional inner product spaces. 

#### **Def | Orthogonal Complement Subspace**
> Let $Y\subseteq \mathcal H$ be a subspace, then we define the orthogonal complement to be $Y^\perp := \{x\in \mathcal H | x \perp Y\}$. 

**Fact**: 

If, $Y = \mathcal H$, then $\{\mathbf 0\}$ is the complement of that. 

#### **Thm | Orthogonal Decomposition**
> Ler $Y\subseteq \mathcal H$ be a closed subspace, for all $x \in \mathcal H$, there exists unique $u\in Y, v\in Y^\perp$ such that $x = y + v$. 

**Observations**: 

The set $Y\subseteq \mathcal H$ is said to be closed. 

**Proof**

Let $x\in \mathcal H$, we have: $x = \Pi_Yx + (x - \Pi_Yx)$. By Hilbert Subspace projection theorem, we have $\Pi_Y(x) \in Y$, and $x - \Pi_Yx \in Y^\perp$. To show uniqueness suppose that: 

$$
\begin{aligned}
    \text{Let } & (u', u \in Y), (v', v \in Y^\perp)  
    \\
    &
    x = u + v = u' + v'
    \\
    \implies
    &
    \underbrace{u - u'}_{\in Y} = 
    \underbrace{v - v'}_{\in Y^\perp}
    \\
    \implies &
    u - u' = v - v' \in Y\cap Y^{\perp} = \{\mathbf 0\}
    \\ 
    \iff 
    &
    u - u' = v - v' = \mathbf 0. 
\end{aligned}
$$

Therefore, we have the uniqueness of the orthogonal complement projection proven at the end. 

**Remarks**:

1. In general, we have $Y \subseteq Y^{\perp\perp}$ and $Y^\perp$ is always a closed set. In fact, we have $\text{cl}(Y) = Y^{\perp\perp}$. This is important because $Y$ is specifically said to be a closed subspace in $\mathcal H$, and in $\mathcal H$, there are subspace that are not closed. In which case, we don't have the same looking theorem as above from the cause of finite dimensional spaces. 

2. Let $Y, Y^\perp$ and $Y$ be closed. Then for all $x \in \mathcal H, x = u + v$, unique $u\in Y, v \in Y^\perp$. And we have $\Vert x\Vert^2 = \Vert u\Vert^2 + \Vert v\Vert^2$, because $u\perp v$. This is Pythagoras in the infinite dimensional space. 

3. According to the orthogonal decomposition theorem, to span $\mathcal H$ given a subspace $Y$, we may have $\mathcal H = \text{cl}(Y) \oplus Y^\perp$ to span the whole space. 

---
### **Orthogonal Normal Basis In Hilbert Spaces**

We introduce the idea of ortho-normal basis in the Hilbert space. 
A type of infinite dimension basis ([Schauder Basis](https://en.wikipedia.org/wiki/Schauder_basis)). 

#### **Def | Orthogonal Basis**

> $\{e\}_{i\in \mathcal I}$ is an orthogonal basis for an inner product space if: 
> $$
> \begin{aligned}
>     (\forall i, j \in \mathcal I)\; 
>     \langle e_i, e_j\rangle
>     =
>     \begin{cases}
>         0  & i \neq j
>         \\
>         1 & i = j
>     \end{cases}
> \end{aligned}, 
> $$
> The inner product between the elements of the basis equals to Kronecker delta. 

**Remarks**

The set of standard basis vector is not closed. Denote $\mathcal B = \{e_i\}_{i\in \mathbb N}$ to be the basis for space $l^2$, which is a Hilbert space. 
The set $\text{span}(\mathcal B)$ is not closed. 
For example, the sequence $(1, 1, \cdots)\not\in \mathcal B$, but rather, this number is in $\text{cl.span}(\mathcal B)$. 
This is very different to the way things work in finite dimensions. 

Given such a basis, we can project onto this basis using very simple algebra, compare to projecting to any other type of basis in Hilbert space. 
A core part of Linear Algebra. 


#### **Thm | Projection Onto Orthonormal Basis**
> Let $\mathcal B = \text{span}(\{e_i\}_{i \in \mathcal I})$ be a basis with some index set $\mathcal I$. Can be countable or uncountable. Then a projection onto $\mathcal B$ is given by: 
> $$
> \begin{aligned}
>     \Pi_Y(x) = \sum_{ i\in \mathcal I}\langle x, e_i\rangle e_i \in \text{cl}(\mathcal B),
> \end{aligned}
> $$
> In finite dimensional projection, the closure is not necessary. 

**Proof**

It's a simple argument involving the theorem for projecting onto subspaces. 

**Examples**: 

1. $e_n = (\delta_{n, j})_{j\in \mathbb N}$ is the basis vector for $l^2$. 
2. In $L^2[a, b]$, we have the Fourier basis. It's too famous to be stated here. 


---
### **Bessel's Inequality**

We introduce the Bessel's Inequality for Orthogonal Basis and their consequences. 

#### **Thm (3.4-6) | Bessel's Inequality**
> Let $\mathcal B = \text{cl.span}(e_i)_{i \in \mathbb N}\subseteq \mathcal H$, and it is an orthonormal basis for $\mathcal H$, then for all $x \in \mathcal H$: 
> $$
> \begin{aligned}
>     \sum_{i = 1}^{\infty} \langle x, e_i\rangle^2 \le \Vert x\Vert^2. 
> \end{aligned}
> $$

**Proof**

We uses a limiting argument. Take $Y_n = \text{span}(\{e_i\}_{i=1}^n)$ to be a subset of $\mathcal B$, then using the theorem of orthogonal complement and projection onto an orthonormal subspace we have: 

$$
\begin{aligned}
    \Vert x\Vert^2 &= 
    \left\Vert
        \sum_{i = 1}^{n} \langle x, e_i\rangle e_i
    \right\Vert^2
    + 
    \left\Vert
        x - \sum_{i = 1}^{n} \langle x, e_i\rangle e_i
    \right\Vert^2 \ge 
    \left\Vert
        \sum_{i = 1}^{n} \langle x, e_i\rangle e_i
    \right\Vert^2
    \\
    n\rightarrow \infty \implies 
    \Vert x\Vert^2 &\ge 
    \left\Vert
        \sum_{i = 1}^{n} \langle x, e_i\rangle e_i
    \right\Vert^2. 
\end{aligned}
$$

**Observations**: 

1. The coefficients for the basis vector after the projection onto an orthonormal basis gives a convergent series. That would the coefficients squared goes to zero as $n\rightarrow \infty$, and the coefficient is a sequence in $l^2$. 
2. Regardless of having infinity many basis vector, it can still span a a subset of the whole space. This the simple fact that a subset of an infinite set can still, be infinite. 

---
### **Corollary | Parseval's Relations**

> Bessel's equality is true whenever we have $x\in \text{cl.span}(\{e\}_{i = \mathbb N})$. 

**Proof**: 

Use the subset $Y_n = \{e_i\}_{i = 1}^n$, then write $\Vert x\Vert^2$ in inner product form using the basis $Y_n$, Take the limit using the continuity of the inner product and the projection of $x$ onto $Y_n$. 

**Remarks**: 

This condition is called Parseval's relations, not to confused with the Parseval's theorem, which is a totally different thing. 


---
### **Total Basis in Hilbert Spaces**

A total set has closure that spans the whole Hilbert Space. 
Its existence is important because it places idealism for describing the whole Hilbert space only using basis that is countable. 
Sometimes it'a also referred to be the maximal basis.

#### **Def (3.6-1) | Total Space**
> A set $M\subseteq M$ is total if $\text{cl.span}(M) = \mathcal H$. And a sequence is total if and only if all terms in the sequence form a total set in $\mathcal H$. 

**Note**: 

Recall that $x\in \text{span}(M)$ if and only if there is a finite linear combinations of the elements from $M$ that represent the vector $x$, hence the closure is not given for free.  

**Remarks:**

The Gram Schimdtz gives an algorithm for computing the ortho-normal basis out a given basis that is total. 

#### **Thm  | Maximality of Basis**
> $M \subseteq \mathcal H$ is total if and only if $M^\perp = \{\mathbf 0\}$. 

**Proof**:
- For $\implies$, let $x\in M^\perp$, consider $x_n\rightarrow x$, by $\text{cl.span}(M) = \mathcal H$, $x_n \in \mathcal H\; \forall n$, and $x\in \mathcal H$ by closure. Then $\langle x, x_n\rangle = 0$ for all $n\in \mathbb N$, by continuity of inner product we have $\langle x, x\rangle = 0$, which means that $x = 0$ by the definition of norm. 
- For $\impliedby$, consider $M^\perp = \{\mathbf 0\}$, let $V = \text{span}(M)$, then $\mathcal H = \text{cl}(V)\oplus \text{cl}(V)^\perp$, but $\text{cl}(V)^\perp = \text{cl.span}(M)^\perp = \{\mathbf 0\}$, then we have $\mathcal H = \text{cl}(V)$. The space $M$ is now total. 

**References**: 

From prof wang's notes for math 328 in UBCO. 

#### **Thm | Total Orthonormal Sequences**
> Let $(e_i)_{i\in \mathbb N}$ be a total sequence for $\mathcal H$, let $M = \{e_i\}_{i \in \mathbb N}$, the set of all its value, then the following conditions are equivalent. 
> 1. $M$ is total. 
> 2. Bessel's inequality becomes equality (Parseval’s identity). 
> 3. For all $x \in \mathcal H, \Pi_{\text{cl}(M)} x= x$, projecting onto the closure of $M$ will recovers $x\in \mathcal H$. More specifically $x = \sum_{n = 1}^{\infty}\langle x, e_n\rangle e_n$. 

**Proof**

- To show (1) implies (3), choose any $x \in \mathcal H$, consider
$$
\begin{aligned}
    y &= \sum_{n = 1}^{\infty} \langle x, e_n\rangle e_n
    \\
    \implies \forall k \in \mathbb N: 
    \langle x - y, e_k\rangle &= \langle x, e_k\rangle - \langle y, e_k\rangle
    \\
    \text{[orthogonality]}\implies 
    &= \langle x, e_k\rangle - \langle x, e_k\rangle = 0
    \\
    \iff \forall k \in \mathbb N : x - y & \perp e_k 
    \\
    x - y &\perp \text{cl.span}(M) 
    \\
    \iff x&= y \text{ by totality of }M
\end{aligned}
$$

- To show that (3) implies (2), we directly take norm on expression in statement (3) and obtain the result. 
- To show (2) implies (1), for contradiction assume $M$ is not total then $\exists x \in M^\perp\setminus \{\mathbf 0\}$, but $\langle x, e_n\rangle = 0 \; \forall n \in \mathbb N$, by $x\in M^\perp$, so then we have $\sum_{n = 1}^{\infty}\langle x, e_n\rangle^2 = 0$, which means that $\Vert x\Vert = 0$ by (3), which contradicts with the selection of $x$. 


---
### **Separability of of Hilbert Space and Basis (3.6-4)**
> The following theorem relate separability of the Hilbert space and the type of orthonormal basis for the Hilbert space $\mathcal H$. 
> 1. If $\mathcal H$ has a countable orthonormal basis, then $\mathcal H$ is a separable space. Every $x \in \mathcal H$ can be described by the closure of the countable basis. 
> 2. If $\mathcal H$ is a separable space, then every orthonormal basis set is, countable. 


**Proof**: 

Skipped for now. 


**Remarks**: 

Take note that the existence of a basis for Hilbert space is, assumed. 
The existence of a total basis for all Hilbert spaces, is not a trivial statement. 


---
### **Examples for Total Basis**

In $L^2$, one of the total basis is the space of polynomials, $x^n$ with $n\in \mathbb N$. 
Another basis would be the Fourier basis, which is a maximal basis as well. 
Finally, in the space of $l^2$, we have $e_i$, the canonical basis being the maximal basis. 


