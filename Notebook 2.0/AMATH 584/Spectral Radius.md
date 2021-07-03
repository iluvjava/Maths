[[Eigen Decompose]], [[Schur Decomposition]]
Reference: Intro part of the book: \<Iterative Method for Linear System\>
[[Norm]]

---
### **Intro**

The spectral Radius of a square matrix the absolute value of its eigenvalue. 

> $$\rho(A) = \max\{\lambda: \text{It is an eigen value of } A\}$$


---
### **Properties**

> $$
> \rho(A) \le \Vert A\Vert
> $$
> The spectral radius is less than any norm of the matrix. 

Let $\lambda = \rho (A)$, such a $\lambda$ exists by the definition of spectral radius, and let corresponding $v$ be the eigenvector. 

Then, let $V$ be filled with rows of $v$, then: 

$$
\begin{aligned}
    \Vert AV\Vert = |\lambda|\Vert V\Vert 
    \\
    |\lambda|\Vert V\Vert &= \rho(A) \Vert V\Vert
    \\
    \rho(A)\Vert V\Vert &\le \Vert A\Vert \Vert V\Vert
    \\
    \rho(A) &\le \Vert A \Vert
\end{aligned}
$$



> $$
> \forall\; \epsilon > 0 \;\exist \;\Vert \bullet\Vert: \rho(A)\le  
>  \Vert A\Vert \le \rho(A) + \epsilon
> $$
> We can define a norm, an induced norm that is as close to the spectral radius as possible. 

Consider diagonal matrix $D = \text{Diag}(d, d^2, \cdots, d^n)$, and consider: 

$$
DTD^{-1} = \begin{cases}
    t_{i, j}d^{i}d^{-j} & i \le j
    \\
    \lambda_i & i = j
    \\
    0 & \text{else}
\end{cases}
$$

Then, $d$ can be chosen such that, $d{i - j}$ is as small as possible, making the matrix $DTD^{-1}$ to be close to diagonal, which then implies: 

$$
\begin{aligned}
    \forall \epsilon &\exist d: \Vert DTD^{-1}\Vert_1 \le \rho(A) + \epsilon
    \\
    \implies
    \Vert B\Vert_1 &:= \Vert DQ^HBQD^{-1}\Vert_1 
    \\
    \implies
    \Vert B\Vert_1 &= \Vert G B G^{-1}\Vert_1
    \\
    \implies \Vert GAG^{-1}\Vert_1 &= \rho(A) + \epsilon
\end{aligned}
$$

Then, such a newly defined norm using $G$ will have small enough, for all matrix $B$, for any given matrix $A$. 


