[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)

----
**Closure**

The closure for a set is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Let's denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in \mathbf{E}: \forall x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset
> $$

**Remarks**

A closed set is not necessarily complete. For the set $\mathbb{Q}$ which is not complete, but it still has the epsilon ball intersecting region with itself that is non-zero for very element from it. Even worse, the Cantor set is a closed set. See more in [The Cantor Set](../../AMATH%20502%20Intro%20to%20Dynamical%20Systems%20and%20Chaos/The%20Cantor%20Set.md). A set is closed, if its complement is an open set. 
