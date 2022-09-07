[Fields of Values](Fields%20of%20Values.md), [Gerschgorin Theorem](Gerschgorin%20Theorem.md), [Eigenvalues and Fields of Values](Eigenvalues%20and%20Fields%20of%20Values.md)


---
### **Intro**

Let's defined the row sum and column sum ignoring the diagonal, which is going to be like: 

$$
\begin{aligned}
    R_i(A) &= \sum_{j = 1\; j\neq i}^{n}|A_{i, j}|
    \\
    C_i(A) &= \sum_{j = 1\; j\neq i}^{n}|A_{j, i}|
\end{aligned}
$$

Let $covh$ denotes the convex hull of the set. 

**Theorem Statement**

> $$
> \mathcal{F}(A) \subset\text{covh}\left(
>     \bigcup_{i =1 }^n 
>     \left\lbrace
>         z \in \mathbb{C}: 
>         |z - a_{i, i}| \le \frac{1}{2}(R_i(A) + C_i(A))
>     \right\rbrace
> \right)
> $$


We skip the proof here for now, but it's related to the Corollary of Eigenvalues and Fields of values, and the fact that the fields of values is a convex set. (Unions of discs are not neccessarily a convex set tho). 

