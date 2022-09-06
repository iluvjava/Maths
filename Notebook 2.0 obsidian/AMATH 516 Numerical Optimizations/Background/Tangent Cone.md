[[Cone]]


--- 
### **Intro**

A tangent cone is a cone that is define via the set $Q$ and a point $\bar{x}\in Q$ where $Q\in \mathbb{R}^n$: 

> $$
> T_Q(\bar{x}):= 
> \left\lbrace
>     \lim_{i \rightarrow ∞} \tau_i^{-1}(x_i - \bar{x}): 
>     x_i \rightarrow \bar{x} \in Q, \tau_i ↘ 0
> \right\rbrace
> $$

For a sequence of points that approaches the point $\bar{x}\in Q$, weighted by a non-negative decreasing sequence, the sequence's $\tau_i(x_i - \bar{x})$ defines a unique vector, and that vector is the set $T_{Q}(\bar{x})$. 

**Please Observe that**: This is a cone because of the definition of the non-negative decreasing sequence of scalars can be scaled up, which is equivalent to scaling the the set $T_Q(\bar{x})$, which it also doesn't change the definition of the tangent cone. Therefore, it's a cone 
