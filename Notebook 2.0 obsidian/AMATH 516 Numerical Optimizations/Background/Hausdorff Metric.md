- [Metric Space Introduction](MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Metric%20Space%20Introduction.md)

---

We are referencing [Hausdorff distance - Wikipedia](https://en.wikipedia.org/wiki/Hausdorff_distance). 
Let $(M, d)$ be metric space endowed with metric $d$. 
Then a new metric can be defined using this metric space. 

#### **Def | Hausdorff Metric**
> Let $d_H(\cdot, \cdot)$ be a $2^M \times 2^M \rightarrow \R \cup \{\infty\}$ mapping defined as 
> $$
> \begin{aligned}
>     (\forall X \subseteq M)(\forall Y \subseteq M)\; 
>     d_H(X, Y) := 
>     \max \left(
>         \sup_{x \in X} d(x, Y), 
>         \sup_{y \in Y} d(y, X)
>     \right). 
> \end{aligned}
> $$
> We had $(\forall X \subseteq M)(\forall z \in M)\; d(z, X) := \inf_{x \in X}d(z, x)$. 
> This is the minimum distance function from an element to a set. 

**Remarks**


This metric is kinda weird in the sense that it can take infinite value. 
Take note that the metric defined here is obviously symmetric.
It's not clear that: 
1. It satisfies triangle inequality. 
2. It satisfies $d_H(X, Y) \iff X = Y$. 

In fact, the second item would be false in general. 
Take $M = \R$ and try $X = \R, Y = \Q$. 


---
### **Let's do it on Compact sets**


