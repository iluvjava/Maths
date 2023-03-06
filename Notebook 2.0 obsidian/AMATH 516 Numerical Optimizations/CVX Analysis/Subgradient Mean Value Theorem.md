[[../Background/Characterizing Functions for Optimizations]], [[../Proximal Operator/Moreau Envelope and Proximal Mapping]]

---
### **Intro**

We introduce the subgradient mean value theorem for a convex function. 

> Let $f$ be proper convex, let $x, y\in \text{ri.dom}(f)$, then there exists the point $z\in [x, y]$, line segment defined by $x, y$ satisfying $v\in \partial f(x)$ such that: 
> $$
> \begin{aligned}
>   f(y) - f(x) = \langle v, y - x\rangle, 
> \end{aligned}
> $$

**Hints**: 
First argue why that without loss of generality, we can assume that $x, y\in \text{int.dom}(f)\neq \emptyset$, we then consider the gradient of the Moreau Envelope on the function $f$, with parameter $\alpha > 0$, then let $\alpha\rightarrow 0$ to show that the mean value theorem for the smoother function still applies to some extends after taking the limit. 

**Proof**: 

#UNFINISHED

**Reference**: Exercise 3.65, Dimitri's Textbook for AMATH 516. 