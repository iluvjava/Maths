[[Projector]]

Another attempt at covering the concepts of an projector is covered in [[Deeper Look into Projector]]. It's more detailed and have more proofs than what is provided here. 

---
### **Intro**

Let's get some theoretical fundations for the entity we called: Projector in linear algebra. 

A matrix $P$ is a projector if: 

> $$P^2 = P$$

This ths is an Idempotent operator. 

**Consequence 1**: 
> $(I - P)$ is also a projector. 
> $$
> (I - P)^2 = I - P
> $$



**Proof**: Trivial

**Consequence 2**: 

> $$\text{ran}(I - P) = \text{null}(P)$$

**Proof**

$$
\begin{aligned}
    \forall x \in \mathbb{C}^n: P(I - P)x &= \mathbf{0} \implies \text{ran}(I - P)\subseteq \text{null}(P)
    \\
    \forall x \in \text{null}(P): Px &= \mathbf{0} \implies (I - P)x = x \implies x \in \text{ran}(I - P)
    \\
    \implies \text{ran}(I - P) &= \text{null}(P)
\end{aligned}
$$


**Consequence 3**: 

For any $x$, it can be represented as: $x = Px + (I - P)x$. 

> $$
> \mathbb{C}^n  = \text{ran}(I - P) \oplus \text{ran}(P) = \text{null}(P) \oplus \text{ran}(P)
> $$

Where we used **consequence 2**  to justify the second equality. 

**Comments**: 

The null space of $P$ and range of $I - P$ is forming a direct sum of the whole subspace. The further interpretation would be that, for any subspace $M, S$ that forms a direct sum of the whole subspace $\mathbb{C}^n$, Defines a unique projector such that $\text{ran}(P) = M$ and $\text{null}(P) = S$. 

These type of operator experience what is called **Idempotent**, using my own words, I would say this is "Invariant Scraping". It's invariant because $P^2 = P$, it's scraping because when it's not projecting onto $\mathbb{C}^n$, the component in $(I - P)$ is scraped away by the projector $P$. 

**Fact**

> There are 2 types of projectors, **Orthogonal Projectors XOR Oblique Projector**. 

**Examples of Projectors**: 

* An Orthonormal matrix (All eigenvalues are one, and eigenvectors are orthogonal). 
* [[HS Reflector]] (The Householder Reflector), it's also an Hermitian Matrix. 
* Penrose Sudo-Inverse: $A(A^TA)^{-1}A^T - AA^\dagger$



---
### **Orthogonal Projector**

An orthogonal projector is a projector such that: 

> $$
> \text{null}(P) \perp \text{ran}(P)
> $$

This property is in fact, very special. A good example of an orthogonal projector would be the Householder Reflector Matrix. Or just any $\hat{u}\hat{u}^H$ where $\hat{u}$ is being an unitary vector. 

For convenience of proving, assume that $M = \text{ran}(P)$. 

**Lemma 1**: 

Consider the fact (From the defintion of Hermitian Adjoint Operator): 

$$
\begin{aligned}
    \langle P^Hx, y\rangle &= \langle x, Py\rangle 
    \\
    \forall  x &\in \text{null}(P^H), y\in \mathbb{C}^n
    \\
    \implies \langle P^Hx ,y\rangle &= 0 = \langle x, Py\rangle
    \\
    \implies \text{null}(P^H) \perp& \text{ran}(P)
    \\
    \forall y \in& \text{null}(P), x \in \mathbb{C}^n: 
    \\
    \langle x, Py\rangle &= 0 = \langle P^Hx, y\rangle
    \\
    \implies \text{ran}(P^H) \perp& \text{null}(P)
\end{aligned}
$$

Together they form the conclusion that: 
> $$
> \begin{aligned}
>     \text{null}(P^H) = \text{ran}(P)^{\perp}
>     \\
>     \text{null}(P) = \text{ran}(P^H)^{\perp}
> \end{aligned}\tag{1}
> $$ 

This statement (1) is applicable for all types of projectors. 

**Proposition**: 

> A projector is Orthogonal iff it's Hermitian. 

**Proof**

$\impliedby$ Assuming the matrix is **Hermitian and it's a projector**, then we wish to prove that it's an orthogonal projector. 

Consider (1): 

$$
\begin{aligned}
    \text{null}(P^H) = \text{ran}(P)^{\perp}
    \\
    \text{null}(P) = \text{ran}(P^H)^{\perp}
\end{aligned}
$$

Substituting $P^H = P$, we have $\text{null}(P) = \text{ran}(P)^{\perp}$, Which is the definition of Orthogonal Projector. Therefore, $P$ is an orthogonal projector by the definition of the projector. 

$\implies$ Next, we assume that $P$ is an Orthogonal Projector, then we wish to show that it's also Hermitian. Observe that $P^H$ is also a projector because $(P^H)^2 = (P^2)^H$. Then, using the definition of orthogonal projector: 

$$
\begin{aligned}
    \text{null}(P) &\perp\text{ran}(P) 
    \\
    \text{null}(P^H) &\perp \text{ran}(P^H)
\end{aligned}
$$

Notice that using above statement together with **Lemma 1** means $\text{null}(P) = \text{ran}(P)^\perp = \text{null}(P^H)$, and then $\text{ran}(P)=\text{null}(P)^\perp = \text{ran}(P^H)$. Therefore, $P^H$ is an projector such that: 

$$
\text{ran}(P) = \text{ran}(P^H) \wedge \text{null}(P) = \text{null}(P^H)
$$

Using the fact that null and ran uniquely defines a projector, here we know that projector $P$ and projector $P^H$ will have to be the same, therefore $P$ is Hermitian. 

**Example**

Given any matrix $V$ whose columns are orthonormal vectors, we can produce a orthogonal projector as $P = VV^H$. This is not unique, because any matrices who spanning the same subspace can use different set of ortho normal vectors in its columns. 

**Notice**: $V^HV$ gives a truncated identity matrix, but $P^HP=PP^H=P^2=P$ when $P = V^HV$. $P$ like, totally not a identity matrix, because $VV^H\neq V^HV$. 

---
### **Oblique Projector**

A projector that is not Hermitian is an Oblique Projector. When it's not orthogonal then we have $\text{null}(P)\not\perp \text{ran}(P)$. 

Because a projector is uniquely determined by the null space of range of $P$ and $I - P$, an oblique projector is defined via 2 subspace. Our goal is to develop a good definition for oblique projector by just: "Not orthogonal projectors". 

**Observe that**:

Let $P$ be an oblique projector, if $L$ is the orthogonal complement to $S:=\text{null}(P)$, $M := \text{ran}(I - P)$. Because it's a prjector, we know that $S\oplus M = \mathbb{C}^n$. And because $L\perp S$, then $\text{rank}(L)=\text{rank}(M)$. 

**Definition**

> $$
> Px \in M \quad (I - P)x \perp L
> $$
> The range of the operator is in subspace $M$, and $I - P$ is projecting to subspace $L$. 

Observe that, under the spacial case where $M = L$ the projector $P$ is an Orthogonal Projector we discussed in the previous case. 

**Geometric Interpretation**

OR the visualization from Wiki: 

![[Oblique_projection.svg]]

This is a projector along the direction of k onto the subspace of m, denoted performed by operator T. Try justifying the second consequence of Idempotent operator using this visualization. 

The oblique projector creates a light sources in the form of the subspace $L$ and it shoots parrell light ray orthogonal to $L$, crossing vectors and projecting their shadow onto subspace $M$. 

---
### **Biorthogonal Subspaces**

It's 2 basis, $V, W$ such that $VW^H = I$. 

**Blique Projector Defined using Bi-Orthogonal Subspaces**

> A pair of bi-orthogonal subspace defines an oblique projector, in the way that, $M = \text{Ran}(P) = \text{span}(V), L = \text{null}(P) = \text{span}(W)$. Then the projector $P$: 
> $$P = VW^H$$

**Example**

[[Bi-Lanczos]] Algortihm is an algorithm that produces the Bi-orthogonal Subspaces of some matrix operator. 