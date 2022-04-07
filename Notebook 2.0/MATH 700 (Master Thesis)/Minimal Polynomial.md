[[Krylov Subspace]]


---
### **Intro**

**Definition** 

> A minimal polynomial is a polynomial $p_k(x)$ with degree k that is monic such that $p_k(A) = \mathbf{0}$. 

Another idea that is highly relevant to it is the Cayleys Hamilton's Theorem for krylov subspace. 


---
### **Properties**

> If the matrix $A$ is non-zero, then there will be a non-zero coefficients for the constant term for the minimal polynomial. 

For contradiction suppose $k- 1$ is the maximal degree of the minimal polynomial, then by definition: 

$$
\begin{aligned}
    \forall x: \mathbf 0 &= \sum_{j = 0}^{k - 1}w_jA^jx
    \\
    w_0 &:= 0 
    \\
    \forall x: \mathbf 0 &= \sum_{j = 1}^{k - 1}w_jA^jx
    \\
    \forall x: \mathbf 0 &= A\sum_{j = 0}^{k - 2}w_jA^jx
\end{aligned}
$$
And we get another polynomial satisfying that conditions that has a degree of $k - 1$, contradicting the condition that $k$ is the minimal such parameter. 
