The subgradient monotonicity is a natural extension to what we have in the smooth case. The following materials will be relevant: 
* [[Subgradient and Subdifferential Definition]]
* [[Characterizing Functions for Optimizations]], the convexity parts. 

---
### **Intro**

> Let $f$ be an augmented real valued function that is convex. Suppose that there exists a line segment $[x_1, x_2]\subseteq \text{int}\circ \text{dom}(f)$, and let $x_t$ be a point in the middle paramaterized by $t\in [0, 1]$, giving us: $x_t := x_1 + t(x_2 - x_1)$. Then the following statements are true: 
> $$
> \begin{aligned}
>     & \forall g_1\in \partial [f](x_1), g_2 \in \partial [f](x_2), g_t \in \partial [f](x_t)
>     \\
>     & 0 \le \langle g_1 - g_2, x_1 - x_2\rangle 
>     \\
>     & \langle g_1, x_1 - x_2\rangle \ge \langle g_t, x_1 - x_2\rangle \ge \langle g_2, x_1 - x_2\rangle
> \end{aligned}
> $$

**Remarks**

* **Intuitive Interpretations**
  1. Intuitively, the first statement is saying that going along the direction of $x_1 - x_2$, will asserts that the gradient is also, growing in such a direction. 
  2. The second statement is saying that, the point when going along the direction of the line, it's component has a rate of change between the boundary points of the line. 

**Proofs**

**Source**:

It's obvious and I did it myself. 