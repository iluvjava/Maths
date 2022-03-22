[[Topological Basics for Optimizations]]

----
**Closure**

The closure for a set is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Lets denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in \mathbf{E}: \forall x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset
> $$

**Random Comments**

A closed set is not neccessarily complete. For the set $\mathbb{Q}$, is still true that the epsilon ball intersect is non-zero. Even worse, the cantour set is a closed set. See more in [[The Cantor Set]]. 
