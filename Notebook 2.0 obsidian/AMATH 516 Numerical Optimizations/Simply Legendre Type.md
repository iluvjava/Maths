[Convex Conjugation Introduction](Duality/Convex%20Conjugation%20Introduction.md)

---
### **Intro**

A Legendre function is a type of function with a one-to-one gradient operator and hence invertible. Rockafellar classic red book[^1] discussed it in section 26. It's applicable to understanding duality in convex programming and relevant to concepts such as [Bregman Divergence](Bregman%20Divergence.md). 

#### **Definition | Essentially Smooth**
> A proper convex function is essentially smooth if, the following conditions are true on the set $C = \text{int}\circ \text{dom}(f)$: 
> 
> 1. $C\neq \emptyset$. 
> 2. $f$ is differentiable on $C$. 
> 3. $\lim_{i\rightarrow \infty} \Vert \nabla f(x^{(i)})\Vert$ where $(x^{(i)})_{i\in \mathbb N}$ is a sequence in $\mathbb R^n$ that converges to $\text{bnd}(C)$, the boundary. 

**Observations**

As commented by Rockafellar, a function that is differentiable on the entirety of $\mathbb R^n$ would be essentially smooth automatically due to $\text{bnd}(\mathbb R^n) = \emptyset$ on the background topology $\mathbb R^n$. 


#### **Theorem 26.1 | Single Valueness of the Subgradient Operator is Equivalent to Essential Smoothness**
> Let $f$ be closed and convex then $\partial f$ is a single-valued mapping if and only if $f$ is essentially smooth. Additionally, $\partial f$ reduces to the gradient mapping, and $\nabla f(x)$ exists for all $x \in \text{int}\circ \text{dom}(f)$, and if $\partial f(x) = \emptyset$, then $x \not\in \text{int}\circ \text{dom}(f)$. 

**Proof**



**Remarks**

We took this definition from Rockafellar's red convex book.

#### **Definition | Legendre Type Function**
> A function $f$ that is closed and convex, is simply-Legendre, or of Legendre type on $\Omega = \text{int}\circ \text{dom}(f)$ if and only if 
> 1. $\Omega \neq \emptyset$
> 2. $f$ is strictly convex and differentiable on $\Omega$, and essentially smooth on $\Omega$. 
> 3. for all $\bar x \in \text{bnd}(\Omega)$, we have $\lim_{x\rightarrow \bar x} \Vert \nabla f(x)\Vert = \infty$. 

**Observations**

The Legendre Type function is essentially smooth. 
Hence, it has a gradient mapping that is invertible with $(\nabla f(x))^{-1}$ being a well-defined function of $\mathbb R^n \mapsto \Omega$. 
That is a consequence of using theorem 26.1. 
The inverse is the gradient of the convex conjugate. 
For more discussion, read [Inverse of Subgradient of the Convex Conjugate](Operators%20Theory/Inverse%20of%20Subgradient%20of%20the%20Convex%20Conjugate.md). 
Additionally, if $\nabla f$ has $\mathbb R^n \mapsto \mathbb R^n$ and surjective, then the gradient mapping would be bijective. 
It is a specific case of Legendre Type Function. 


**Remarks**

We took the definition from Rockafellar[^1], but I am unsure where it is in the book; it should be in section 26. 


#### **Definition | Essential Strict Convexity**
> A proper convex function $f$ on $\mathbb R^n$ is essential strictly convex if $f$ is strictly convex on every convex subsets of $\text{dom}(\partial f)$. 

**Observations**

One consequence of the definition is that a strictly convex function is also strictly convex on $\text{ri}\circ \text{dom}(f)$ due $\text{dom}\circ \text{dom}(f)\subseteq \text{dom}(\partial f)$. As commented by Rockafeller, in section 23 of the book, he explained why $\text{dom}(\partial f)$ may not be convex because something may happen at the boundary of $\text{dom}(f)$. 


**Remarks**

The converse is not true. A function that is strictly convex on $\text{ri.dom}(f)$, or $\text{dom}(\partial f)$ are not strictly convex on $\text{dom}(\partial f)$, or $\text{dom}(f)$. Recall the relation that 

$$
\text{ri.dom}(f) \subseteq \text{dom}(\partial f) \subseteq \text{dom}(f). 
$$

The weaker characterizations of Essential Strict Convexity are easier to remember. 
However, they are never equivalent. 

---
### **Advanced Topics about Essential Smoothness for Convex Functions**
We introduce more content from the Rockafeller's book on essential smoothness and functions of Legendre types. 


#### **Theorem 26.2 | Equivalent Characterization of Essential Smoothness**
> Assuming conditions 1., 2., are true in the definition for essential smoothness then the following condition is equivalent to condition 3. in the definition of essential smoothness.
> 
> 3.`*` $f'(x + \lambda(a - x) | a - x) \searrow -\infty$ as $\lambda \searrow -\infty$ for any $a \in C$, and any boundary point of $x \in C$. 

**Observations**

The directional derivative, if points inward towards a point $a \in C$ and anchored on a boundary point $x$, at the point $x + \lambda(a - x) \in C$, then the directional derivative approaches negative infinity. We know that $x + \lambda(a - x)\in C$ by the [Accessibility Lemma](CVX%20Analysis/Accessibility%20Lemma.md) of a convex set. 

**Proof**

---
### **Non-trivial Counter Examples**







[^1]:R. T. Rockafellar, Convex analysis, 10. print. and 1. paperb. print. in Princeton Landmarks in mathematics and physics. Princeton, NJ: Princeton Univ. Press, 1997.
