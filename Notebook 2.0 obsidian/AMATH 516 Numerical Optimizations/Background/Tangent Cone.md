[[Introducing Cone]]


--- 
### **Intro**

A tangent cone is a cone that is define via the set $Q$ and a point $\bar{x}\in Q$ where $Q\in \mathbb{R}^n$: 

#### **Def | Variational Tangent Cone**
> $$
> T_Q(\bar{x}):= 
> \left\lbrace
>     \lim_{i \rightarrow ∞} \tau_i^{-1}(x_i - \bar{x}): 
>     x_i \rightarrow \bar{x} \in Q, \tau_i ↘ 0
> \right\rbrace
> $$

**Mathematically**: 

Tangent cone's elements are defined by a vector limit.
Consider any sequence $x_i \in Q$ that satisfies the following descriptions. 
- The sequence approaches the point $\bar{x}\in Q$. 
- It can be weighted by a non-negative decreasing sequence: $\tau_i(x_i - \bar{x})$, then the limit is a unique vector, and that vector is the set $T_{Q}(\bar{x})$. 

By changing the rate of convergence of $\tau_i\searrow 0$, we get the span of vectors that forms a cone out of all the converging sequences inside of $Q$. 
Observe that every converging sequence $x_i\rightarrow_{\in Q} \bar x$, the norm $\Vert x - \bar x\Vert$ goes to zero. 
Assuming $T_Q(\bar x)\neq \emptyset$ , we may assert that $\lim_{i\rightarrow \infty} |\tau_i^{-1}|\Vert x_i - \bar x\Vert < \infty$, (because the limit exists) implying that $\tau_i \in o(\Vert x_i - \bar x\Vert)$, a rate of convergence for the parameter $\tau$. 


**Intuitively** 

this is a cone because of the definition of the non-negative decreasing sequence of scalars can be scaled up, which is equivalent to scaling the the set $T_Q(\bar{x})$, which it also doesn't change the definition of the tangent cone. Therefore, it's a cone 

**References**:

This is from Jame Burkes at UW. 

---
### **Tangent Cone on A convex Set**

We use the variational tangent cone definition from above to show:

> Let $Q$ be a convex set, then $T(x|Q) = \text{cl.cone}(Q - x)$. Displaying the set $Q$ by $x$ and the cone of the translate set produces the tangent cone at the point $x$. Equality becomes $\subseteq$ when convexity assumption for $Q$ is removed. 

**Proof**



**Remarks**: 

Dimitri's Exercise 2.33, course notes. 


