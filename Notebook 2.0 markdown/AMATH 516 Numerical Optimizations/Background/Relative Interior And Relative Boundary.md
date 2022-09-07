[Interior Topology](Interior%20Topology.md)
[Closure Topology](Closure%20Topology.md)
[Affine Hull, Affine Span](Affine%20Hull,%20Affine%20Span.md)

---
### **Intro**

Let $Q\subseteq \mathbb{E}$ be a set in the Euclidean space, then the relative interior of the set $Q$ denoted as $\text{ri}(Q)$ is the interior of the Affine Hull $\text{affhull}(Q)$: 

> $$
> \text{ri}:= 
> \{
>     x\in Q:  \exists\; \epsilon > 0 \text{ s.t:}
>     \mathbb{B}_\epsilon(x)\cup \text{affhull}(Q)\subseteq Q
> \}
> $$

And hence, the relative boundary of the set is defined as $\text{rb}(Q):= \text{cl}(Q)\setminus \text{ri}(Q)$. 

**Simple Consequences**

One simple observation that could be made is $\text{int}(Q)\subseteq \text{ri}(Q)$ for any set. 
