[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)


---
**Interior**

The interior of a set $B$ is the set of all the point such that for each point, there exists an epsilon ball surrounding that point and the whole ball is in the set $B$. Denotes the interior of the set as $\text{int}(B)$, then we have the definition that: 

> $$
> x\in \text{int}(B)\iff 
> \exists \delta: \mathbb{B}_\delta \subset Q
> $$

Nice and easy, and then we will be able to define a closed and an opened set: 

* A set is open iff $Q = \text{int}(Q)$. 
* A set is closed iff $Q = \text{cl}(Q)$

To prove it, we will need to use the epsilon balls, and arbitrary sequences on the set under discussion. If a set is closed, then every limit point is in the set. If a set of open, then that is false. If a set if compact, then it means it's closed and bounded. 