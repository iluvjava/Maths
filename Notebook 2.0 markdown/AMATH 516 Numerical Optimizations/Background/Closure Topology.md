[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md), 
We assume that the background set for our topology is the Euclidean space. 

----
**Closure**

The closure for a set $Q\subseteq X$ relative to a background $X$ is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Let's denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in X: (x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset)
> $$

**Remarks**

A closed set is not necessarily complete. For the set $\mathbb{Q}$ which is not complete, but it still has the epsilon ball intersecting region with itself for for very element from it. Even worse, the Cantor set in the real line is a closed set. See more in [The Cantor Set](../../AMATH%20502%20Intro%20to%20Dynamical%20Systems%20and%20Chaos/The%20Cantor%20Set.md). 

**Facts**
* A set is closed, if its complement is an open set. 
* A set is closed, if the limit of very sequence in the set is also in the set. 
