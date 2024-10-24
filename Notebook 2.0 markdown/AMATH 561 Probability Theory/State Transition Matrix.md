[Gerschgorin Theorem](../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Gerschgorin%20Theorem.md)


---
### **Intro**

A transition matrix is a non-negative matrix such that its row sum is 1. Then one of the immediate property can be proven via the Gershchgorin's Theorem. The theorem will be stated: 

> For all transition matrix, it only has eigenvalues with absolute values that are less than or equal to one. 

**Proof**: 

$$
\begin{aligned}
    | \lambda_i - a_{i, i}| &\le  \sum_{j = 1, j \neq i}^{n}
    a_{i, j} \le 1  \quad\forall\; 1 \le i \le n
    \\
    \implies |\lambda_i| \le 1
\end{aligned}
$$

And that completes the proof. Such a matrix is used to model the behavior of discrete Markov Chain. 
