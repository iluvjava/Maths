- [Epsilon Subgradient Introduction](Epsilon%20Subgradient%20Introduction.md)

---
### **Intro**

A lot of results, and algorithms had been established for convex epsilon subgradient. 
In this file, we will take a careful look into it. 
We will only focus on he properties in $\R^n$, which is most relevant to application in general. 

#### **Our References**
- "Convex analysis in general vector spaces" by Zalinescu C. 
- "Convex Analysis and Beyond: Volume I: Basic Theory" by Morducovhich, Mau Nam. 

---
### **Calculus Rules of $\epsilon$-subgradient**

The epsilon subgradient admits calculus rules similar to the convex subgradient. 
Previously we had showed the sum rule.
Taken from Morducovhich Theorem 5.19, we have the following strong sum rule: 

#### **Proposition | Strong $\epsilon$-subgradient sum rule**
> Take both $f, g: \R^n\rightarrow \overline \R$ to satisfy assumption in this section. 
> Let $\epsilon \ge 0$. 
> Then the $\epsilon$ subdifferential sum rule states that 
> $$
> \begin{aligned}
>     \partial_\epsilon[f + g](\bar x) = 
>     \bigcup \left\lbrace
>         \partial_{\epsilon_1} f(\bar x) + 
>         \partial_{\epsilon_2} g(\bar x) \left|\; 
>             \min(\epsilon_1, \epsilon_2) \ge 0\wedge 
>             \epsilon_1 + \epsilon_2 = \epsilon
>         \right.
>     \right\rbrace
> \end{aligned}
> $$
> in each of the following scenarios:
> 1. $f$ is continuous at some point $\bar u \in \text{dom}\; f$. 
> 2. $\text{ri.dom}\; f \cap \text{ri.dom}\;g \neq \emptyset$. 


#### **Proposition | Affine composition fule of $\epsilon$-subgradient**
> Let matrix $A\in \R^{p\times n}$ for $p, n \in \N$. 
> Let $g: \R^p \rightarrow \overline \R$ be a closed, convex, proper function. 
> Then, for all $\epsilon \ge 0, x \in \R^n$ such that $A \bar x \in \text{dom}\; g$, it has the chain rule
> $$
> \begin{aligned}
>     \partial_\epsilon(g\circ A)(\bar x) = A^\top \partial_\epsilon g(A\bar x), 
> \end{aligned}
> $$
> Under the condition that $\text{rng}\;A \cap \text{ri}\; \text{dom}\; g \neq \emptyset$. 



---
### **Duality of $\epsilon$-subgradient**

The inexact subgradient reflect duality, and as a result, the Moreau decompositions as well. 
Recall the following theorem from the previous section. 

#### **Theorem | $\epsilon$-Fenchel inequality**
> Let $\epsilon \ge 0$, then:
> $$
>     x^* \in \partial_\epsilon f(\bar x)\iff f^\star(x^*) + f(\bar x) \le \langle x^*, \bar x\rangle + \epsilon \implies \bar x \in \partial_\epsilon f(x^*).
> $$
> They only equivalent when biconjugation holds at $\bar x$ for $f$. 

**Proof** see original file listed at the top. $\square$




