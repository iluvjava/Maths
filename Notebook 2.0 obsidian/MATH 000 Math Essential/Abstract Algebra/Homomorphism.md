[[Group Basics]]

We use the Abstract Algebra by John and William, the brown covered book. 

---
### **Intro**

Homomorphism is a function that binds 2 groups together while preserving their respective group operations. See [Wolfram Math World definition](https://mathworld.wolfram.com/GroupHomomorphism.html) for more information. 

**Definition | Homomorphism**

> A homomorphism is a mapping between 2 groups $G_1, G_2$ the preserves the group operations. Let $\phi$ be a mapping $G_1\mapsto G_2$, it is a homomorphism if $\phi(xy) = \phi(x)\phi(y)$ for all $x,y\in G_1$. 

**Existing examples of homomorphism**
1. Determinant of a matrix. The determinant function creates a map from the group of all invertible matrix to the reals under multiplications.
2. Trace of a matrix. The trance of the matrix maps from the group of all invertible matrices to the reals with addition operations. 

**Propositions**
> Let $\phi$ be a homomorphism between the group $G, G'$, then it satisfies: 
> 1. $\phi(e) = e'$ where $e\in G, e'\in G'$;
> 2. $\phi(a)^{-1} = \phi(a^{-1}) \; \forall a \in G$;
> 3. for any $n\in \mathbb N$, and $a\in G$ then $\phi(a^n)=\phi(a)^n$. 
> 4. if $a\in G$ has an order of $n$, then order of $\phi(n)$ is a divisor of $n$. 

**Proof**
1. $\phi(e)\phi(e) = \phi(e^2) =\phi(e)\implies \phi(e)\phi(e) = \phi(e)e' \implies \phi(e) = e'$.
2. $\phi(a)\phi(a^{-1}) = \phi(e) = e'$, implying $\phi(a^{-1}) = \phi(a)^{-1}$. 
3. It's kinda trivial and an inductive argument will suffice.
4. Let $a\in G$, with $n = |a|$, since $\phi$ is homo, we have $\phi(a)^n = \phi(a^n) = e$, hence $|\phi(a_n)|$ divides $n$.

**References**:

Proposition 3.7.2, Abstract Algebra, the brown cover book. 

**Kernel**

The kernel of an homomorphism, denoted by $\text{ker}(\phi)$, which is the set of all $x\in G$ such that $\phi(x) = e'\in G'$. 

**Remark**

A one-to-one relation exists if the kernel of  $\phi$ is the identity in $G$. 


----
### **Factor Group of a Homomorphism**



---
### **Kernel Properties**




