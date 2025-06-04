- [Local, Global Lipschitz Continuity](AMATH%20516%20Numerical%20Optimizations/Background/Local,%20Global%20Lipschitz%20Continuity.md)

---
### **Intro**

This type of subgradient and subderivative for locally/globally Lipschitz continuous function. 

#### **Definition | Clarke generalized directional derivative**
> Let $O$ be an open set in $\R^n$. 
> Suppose that $f: O \rightarrow \overline \R$ is locally Lipschitz on $O$. 
> For all $x \in O, v \in \R^n$, the Clarke generalized directional derivative is defined as
> $$
> \begin{aligned}
>     f^\circ(x; v) := \limsup_{\substack{y \rightarrow x \\ t \searrow 0}}
>     \frac{f(y + tv) - f(y)}{t}. 
> \end{aligned}
> $$

#### **Lemma | Basic properties of Clarke's generalized directional derivative**


