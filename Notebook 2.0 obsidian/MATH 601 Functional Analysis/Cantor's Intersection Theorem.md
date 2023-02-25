[[Functional Spaces/Metric Space]], [[Set Diameter]]


---
### **Intro**

Let $(X, d)$ be a metric space that is complete. Recall [[Set Diameter]] a definition.

**Theorem: Cantor Intersections**
> If $F_1\supseteq F_2 \supseteq\cdots$, and $\lim_{n\rightarrow \infty}\text{diam}(F_n) = 0$, then the strong limit of the set converges to a singleton; i.e: $\lim_{n\rightarrow \infty} F_n  = \bigcap_{n\in N}F_n = \{x\}$. 

**Proof**

Choose a sequence $(x_n)_{n\in \N}$, with $x_n \in F_n\;\forall n \in \N$, then the sequence is Cauchy: 

$$
\begin{aligned}
    d(x_m, x_n) &\le \text{diam}(F_n) \le \text{diam} F_n \quad \forall\;  m \ge n > N.
\end{aligned}
$$

Therefore we have $x\in \bigcap_{n= 1}^\infty F_n$, and suppose that there is another element $x\in \bigcap_{n = 1}^\infty F_n$, then we have $d(x_n, y)\rightarrow 0$, by the completeness of the metric space $x = y \in X$, and hence the limiting set is a singleton. 


