[[Interior Topology]]
[[Convex Hull, Convex Span]]

---
### **Intro**

During analysis, sometimes if a set is occupying a subspace in the finite dimensional Eucliean space, it will results in the interior of the set being the empty set, which is not a good anticipation for analysis, to resolve, the concept of an affine hull and relative interior are created, so that interior and the closure of a set can be discussed inside the span of the set. 

**Plain English Definition**: 

> The affine hull of a set $Q$ is the inersection of all affine sets that contain the set $Q$. The intersection of all affine space containing the set $Q$ automatically implies that it's also the smallest affine set containing the set $Q$ . 

**Mathematical Definition**

> $$
> \text{affhull}(Q) = 
> \left\lbrace
>     \theta_1x_1 + \theta_2x_2 + \cdots, \theta_nx_n: 
>     \sum_{i = 1}^{n}\theta_i = 1
> \right\rbrace
> $$

Take note that, the weights $\theta$ now has a summation and doesn't have non-negative constraints, making it quiet different from the usual definition of convex hull of a set. 


