- [The Spectral Momentum Idea Part II](The%20Spectral%20Momentum%20Idea%20Part%20III.md)


---
### **Intro**

This file formalize some of the explorations and make them into mathematical claims about the spectral momentum algorithm stated from previously. 


#### **Claim 1 | The Canonical form of convex quadratic function**
> For any convex quadratic function $f:\R^n \mapsto \R^n := 1/2\Vert Ax - b\Vert^2$, there exists a objective transformation on the graph of $f$ such that it's equivalent to a function of the form $\frac{1}{2}\langle x, \Lambda x\rangle$ where $\Lambda$  is a diagonal with non-negative entries: $l_1 \le l_2 \le  \cdots \le l_n$. 

**Proof**

To start we have: 


$$
\begin{aligned}
    f(x) &= \frac{1}{2}\Vert Ax - b\Vert^2
    \\
    &= 
    \frac{1}{2}\langle Ax, Ax\rangle + (1/2)\Vert b\Vert^2
    - \langle b, Ax\rangle
    \\
    &= 
    \frac{1}{2}\langle x, A^TAx\rangle + (1/2)\Vert b\Vert^2
    - \langle b, Ax\rangle
    \\
    f(x) - (1/2)\Vert b\Vert^2 &= 
    \frac{1}{2}\langle x, A^TAx \rangle - \langle A^Tb, x\rangle. 
\end{aligned}
$$

Let $A^\dagger$ be the Moreau Psuedo Inverse of $A$. 
Let $x^+ = A^\dagger b$, which always exists and unique. 

$$
\begin{aligned}
    f(x - x^+) - (1/2)\Vert b\Vert^2
    &= \frac{1}{2}\langle x - x^+, A^TA(x - x^+)\rangle
    - \langle b, Ax\rangle
    \\
    &= 
    \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle + 
    \langle x, A^TAx^+\rangle
    - \langle b, Ax\rangle
    \\
    &= \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle + 
    \langle Ax, AA^\dagger b\rangle
    - \langle b, Ax\rangle
    \\
    &= \frac{1}{2}\langle x , A^TAx\rangle
    + \frac{1}{2}\langle x^+, Ax^+\rangle
    \\
    f(x - x^+) - (1/2)\Vert b\Vert^2
    - \frac{1}{2}\langle x^+, A, x^+\rangle
    &= \frac{1}{2}\langle x, A^TA, x\rangle
\end{aligned}
$$


$A^TA$ is always being a positive semi-definite matrix. 
Set $G = A^TA$, then the RHS has the form: 

$$
\begin{aligned}
    f(x) &= \frac{1}{2}\langle x, Gx\rangle
\end{aligned}
$$

Because $G$ is semi-definite, it has orthogonal eigendecomposition with $G = V\Lambda V^T$. 
Let's make $y = V^Tx$, so $x = Vy$, so the above can be written into: 

$$
\begin{aligned}
    f(V y) &= \frac{1}{2}\langle Vy, V\Lambda V^T Vy\rangle = \frac{1}{2}\langle y, \Lambda y\rangle. 
\end{aligned}
$$

Therefore, without loss of generality, it suffice to assume a convex quadratic to take the form of $1/2\langle x, \Lambda x\rangle$ where $\Lambda$ is a diaognal matrix of non-negative entries. 
Finally, using a permutation matrix, we can assume further that $\Lambda$ is a matrix whose diagonal are increasing. 

#### **The consequence of the above claim**



---
### **Convergence analysis of the spectral momentum algorithm in for convex quadratic function**

It suffices to show the behavior of the algorithm under the assumption that $\Lambda$ is a diagonal matrix 

