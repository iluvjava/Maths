- [[Interior Topology]]
- [[Closure Topology]]
- [[Affine Hull, Affine Span]]

---
### **Intro**

Rockafellar was motivated by the fact that the natural interior of a set in $\mathbb R^n$ might not exists when the set belongs to a lower dimensional subset of $\mathbb R^n$. He still wants the interior so he changed the background set for the topology to be the affine span of the set instead. We will follow chapter 6 of his Convex Optimization Textbook. 

**Definition | Relative Interior** 
> Let $Q\subseteq \mathbb{E}$ be a set in the Euclidean space, then the relative interior of the set $Q$ denoted as $\text{ri}(Q)$ is the interior of the Affine Hull $\text{affhull}(Q)$: 
> $$
> \text{ri}(Q):= 
> \{
>     x\in Q:  \exists\; \epsilon > 0 \text{ s.t: }
>     \mathbb{B}_\epsilon(x)\cap \text{affhull}(Q)\subseteq Q
> \}
> $$

**Observation**

The relative boundary of the set is defined as $\text{rb}(Q):= \text{cl}(Q)\setminus \text{ri}(Q)$. Since the background set is the affine span, it loosen the condition for a set being in the relative interior, resulting in $\text{int}(C)\subseteq \text{ri}(C)$. 

**Simple Consequences**

1. One simple observation that could be made is $\text{int}(Q)\subseteq \text{ri}(Q)$ for any set. 
2. And it's not the case that if $C_1 \subseteq C_2$ we have $\text{ri}\;C_1 \subseteq \text{ri}\;C_2$, imagine the case where $C_1$ is a cube and $C_2$ is one of the faces of the cube. 
The face of the cube is part of it, but the relative interior doesn't intersect the relative interior (the strict inside) of the cube. 
3. Based on this definition and the natural definition of a boundary of a set, the relative boundary of the set $C$ can be defined to be $\text{cl}(C)\setminus \text{ri}C$. Similarly, the set is relatively open then we have $C = \text{ri}C$. 


