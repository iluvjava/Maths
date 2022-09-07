[Interior Topology](Interior%20Topology.md)
[Convex Hull, Convex Span](Convex%20Hull,%20Convex%20Span.md)

---
### **Intro**

During analysis, sometimes if a set is occupying a subspace in the finite dimensional Euclidean space, it will results in the interior of the set being the empty set, which is not a good anticipation for analysis, to resolve, the concept of an affine hull and relative interior are created, so that interior and the closure of a set can be discussed inside the span of the set. 

**Plain English Definition**: 

> The affine hull of a set $Q$ is the intersection of all affine sets that contain the set $Q$. The intersection of all affine space containing the set $Q$ automatically implies that it's also the smallest affine set containing the set $Q$ . 

Firstly, let's define the idea of Affine span for a set of vectors: 

$$
\begin{aligned}
    \text{affs}(X) := 
    \left\lbrace
        X\lambda: \langle \mathbf 1, \lambda\rangle = 1
    \right\rbrace
\end{aligned}
$$

---
**Mathematical Definition**

> $$
> \text{affhull}(Q) = 
> \left\lbrace
>     \theta_1x_1 + \theta_2x_2 + \cdots, \theta_nx_n: 
>     \sum_{i = 1}^{n}\theta_i = 1, x_i \in Q \; \forall i \in [n], n \in \mathbb N
> \right\rbrace
> $$
> The affine hull is the affine span if all possible sets of points in the set $Q$, equivalent to the intersections of all points containing the set $Q$. 

Take note that, the weights $\theta$ now has a summation and doesn't have non-negative constraints, making it quite different from the usual definition of convex hull of a set. 


