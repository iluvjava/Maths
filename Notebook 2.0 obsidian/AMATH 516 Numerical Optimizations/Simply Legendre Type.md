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

The legendre type function is essentially smooth, hence it has a gradient mapping that is invertible with $(\nabla f(x))^{-1}$ being a well defined function of $\mathbb R^n \mapsto \Omega$. This is realized by the use of theorem 26.1. 



**Remarks**

We took the definition from Rockafellar[^1], but I am not sure where exactly it is in the book, it should be in section 26. 



[^1]:R. T. Rockafellar, Convex analysis, 10. print. and 1. paperb. print. in Princeton Landmarks in mathematics and physics. Princeton, NJ: Princeton Univ. Press, 1997.
