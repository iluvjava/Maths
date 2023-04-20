[Skew Symmetric](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Skew%20Symmetric.md), [Monotone Operators](Monotone%20Operators.md)


---
### **Intro**

> For any skew symmetric matrix $S$, it's monotone meaning that $\forall x, y\in \mathbb E$, we have $\langle y - x, S(y - x)\rangle \ge 0$. 

**Proof**

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


**Remarks**

This is the KKT conditions for the Fenchel Rockafellar Duality problem. And in fact the operator is also maximally monotone because it's linear. However I am not sure how to prove this part of the claim yet. 