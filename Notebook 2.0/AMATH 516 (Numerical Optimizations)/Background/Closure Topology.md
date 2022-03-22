[[Topological Basics for Optimizations]]

----
**Closure**

The closure for a set is the set of all points such that, the epsilon ball of that point has non-empty intersection of that set. Lets denote the closure set as $\text{cl}(Q)$, where $Q$ is the set under discussion. 

> $$
> \forall x \in \mathbf{E}: \forall x \in \text{cl}(Q) \iff 
> \forall \epsilon > 0: (\mathbb{B}_\epsilon \cap Q) \neq \emptyset
> $$
