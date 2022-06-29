[[Characterizing Functions for Optimizations]]


---
### **Intro**

**Definition: Support Functions**

> A support function is paramaterized by a set $C\subset \mathbb E$. And it's defined as: 
> 
> $$
> \begin{aligned}
>     \delta_C^{\star}(x) := \sup_{y\in C} \left\lbrace
>         \langle y, x\rangle
>     \right\rbrace
> \end{aligned}
> $$

**Remarks**

When the set $C$ is not closed, the $\sup$ operator is closing it automatically. The function is convex because its the sum of 2 proper convex functions wrt $y$, $\langle y, x\rangle$ which is convex and real-valued, and $\delta_C$ the indicator function which is augmented real and proper, using [[Convexity Preserving Operations of Functions]], this is just taking the maximum of convex functions pointwise, therefore the resulting function is convex. 


---
### **Examples**



