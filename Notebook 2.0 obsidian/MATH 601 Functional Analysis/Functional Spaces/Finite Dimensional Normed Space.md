[[Banach Space Introduction]],  [[Convergence, Completeness in Metric Space]].

---
### **Intro**

A Banach space where, the basis to span each element has finitely many elements in it. We will prove that, a vector space with norm, which is a type of metric space is, complete, hence Banach. The major consequences are equivalences between all norms, and, completeness of all subspaces and spaces. 

**Lemma: Lower Bound for the Basis Vectors**: 
> Let $\{x_i\}_{i=1}^n$ be a basis for the Finite dimensional linear basis, in the space $X$, then $\exists c > 0$ such that $\forall (\alpha_1, \cdots, c_n)$ we have: 
> $$
> \left\Vert 
>     \sum_{i = 1}^{n}
>     \alpha_ix_i
> \right\Vert \ge c
> \underbrace{
>     \left(
>     \sum_{i = 1}^{n}|\alpha_i|
>     \right)
> }_{=s}
> $$

**Proof**: 

Skipped.

**References**: 2.4 In Kreyszig's Intro to Functional analysis textbook. 

**Definition: Sequentially Compact Normed Space**
> Let $(X, d)$ be a metric space, it's sequantially compact when every sequence in $X$ has a convergent subsequence. 

**Proof**

Skipped. 

**Remarks**

For functional analysis, different type of compactness turns out to be all equivalent in metric space. We will refer to sequential compact just as: compact. 

**Lemma: Compactness is Closed and Bounded**
> Compact subset $M$ of a metric space is, closed and bounded. 

**Proof**: 

**Remarks**: 

The converse is not true. Consider the set of canonical basis $\{e_n\} \in l^2$, they are bounded with $\Vert e_1\Vert = 1$, but all of the points are $\sqrt{2}$ distance away in the 2-normed sequence space. They are all singletons and the the set has no accumulation points. This set is now closed and bounded. We now consider the sequence $(e_n)_{i\in \N}$, which is not gonna have any convergent subsequence. It's never Cauchy. 


**References:** 

2.5-2 in Kreyzig's Textbook. 

---
### **Finite Dimensional Spaces Theorems**: 

We list important theorems and cite the places that they are coming from. 

**Thm: Closedness and Completeness [2.4-2]**
> A finite dimensional subspace/space is complete, both at the same time. 

**Proof**: 

**Observations**: 

Theorem is strengthen, from the case in infinite dimensional spaces where, a subspace of a Banach space is necessarily complete disregarding the fact the space itself is a Banach space. $c_0$, denoting the sequences $\in l^\infty$ converges to zero is not a complete subspace. This would mean a finite dmensional space equipped with a norm will be a Banach Space. 

**References:** Kreyzigs, 2.4-2

**Corollary: Always Complete and Banach**
> If a subspace of a finite dimensional space is complete, then the whole space will be complete. 

**Thm: Norms are all Equivalent [2.4-5]**
> In finite dimensional normed vector space, all norms are equivalent. 

**Proof**: 
Skipped. 

**References**: 

Kreyzig's textbook, theorem 2.4-5. 

**Thm: Closedness and Bounded Euivalent to Compactness [2.5-3]**
> A finite dimensional subspace is compact, if and only if it's closed and bounded. 

**Proof**: 
Skipped. 

**Remarks**: 

Only a finite dimensional subspace has the ability to generalized the sequential compactness of the reals. 

**References**: 
2.5-3 in Kreyzig's textbook. 

**Lemma:Riesz Lemma (2.4-5)**
> Let $Y, Z$ be a subspace of a normed space $X$. Let $Y$ be a proper, closed, linear subspace of $Z$, Then for every $\theta \in (0, 1)$, a real number, there exists $z\in Z$ such that $\Vert z\Vert = 1$, and $\Vert z - y\Vert \ge \theta$ for all $y\in Y$. 

**Proof**:

Skipped. 

**Remarks**: 

Geometrically it means, it's possible to find a point $x\in Z\setminus Y$ such that, it's lifted with $1 - \epsilon$ distance away from the whole subspace, and it has a norm of $1$. This is possible for infinite dimensional spaces. 

**References:**

This is listed as 2.4-5 in Kreyzig's textbook, but I would suggest looking into [here](http://mathonline.wikidot.com/riesz-s-lemma) on mathdot for a better exposition of the proof. 


**Thm: Finite Dimensional Space [2.5-5]**
> If a normed space $X$, $M = \{x: \Vert x\Vert \le 1\}$, the closed unit ball, is compact then $X$ is a finite dimensional space. 

**Proof**: 

skipped. 

**Remarks**: 

It's implied that in a finite dimensional space, a closed unit ball is a set that contains bounded sequences that has diverging subspace. But this is not possile in a finite dimensional space. 

**Thm: Continuous Mapping [2.5-6]**
> Let $X, Y$ be metric spaces. Let $T: X \mapsto Y$ be a continuous mapping. Then the image of a compact subset $M$ of $X$ is, compact. $TM$ is a compact set as well. 

**Remarks**: 

Take note that this statement is about metric spaces in general. This theorem allows us to generalize some of the theorems used for single variable calculus. 

**References:** Kreyzig's textbook, 2.5-6. 
