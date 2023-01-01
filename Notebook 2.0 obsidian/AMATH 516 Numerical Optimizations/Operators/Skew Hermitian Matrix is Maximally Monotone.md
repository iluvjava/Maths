[[Introduction to Operators for Optimizations]]


---
### **Intro**

> For any skew symmetrix matrix $S$, it's maximally monotone meaning that $\forall x, y\in \mathbb E$, we have $\langle y - x, S(y - x)\rangle \ge 0$. 

Let $S$  be a skew symmetric matrix. Then

$$
\begin{aligned}
    \langle x - y, S(x - y)\rangle &= \langle x - y, S^T(x - y)\rangle
    \\
    \langle x - y, (S - S^T)(x - y)\rangle &= 0
    \\
    \left\langle x - y, \frac{1}{2}(S - S^T)(x - y)\right\rangle &= 0, 
\end{aligned}
$$

Take note that for any skewed symmetric matrix $S$, $S = \frac{1}{2}(S - S^T)$ by Toeplitz Decomposition of matrices. 
