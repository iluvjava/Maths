[Subgradient and Subdifferential Properties](../AMATH%20516%20Numerical%20Optimizations/Non-Smooth%20Calculus/Subgradient%20and%20Subdifferential%20Properties.md)
[Monotone Operators](../AMATH%20516%20Numerical%20Optimizations/Monotone%20Operators.md)

---
### **Intro**

It's not true that all monotone operators can be the subgradient of a convex function, this is clarified in Rockafellar's Variational Analysis on page 547, where the idea of Cyclical Monotonicity is proposed for characterizing the subgradient of convex functions. A related stack overflow discussion can be seemed here: [here](https://math.stackexchange.com/questions/111767/is-every-monotone-map-the-gradient-of-a-convex-function). 

**Theorem :Characterizations of Convex Subgradient Mapping**

> A mapping $T:\mathbb R^n \rightrightarrows \mathbb R^n$ has the form $T = \partial f$ for some proper convex lsc function $f:\mathbb R^n \mapsto \mathbb{\bar R}$ if and only if $T$ is maximally cyclicly monotone then $f$ is determined by $T$ uniquely up to an additive constant. 

**Remarks**

Theorem 12.25 in Rockafellar's \<Variational Analysis\>. 

