[[Norm]], 
[[Hermitian Adjoint]]

---
Problem statement: 

> Let $A$ be a Positive Symmetric Positive Definite Matrix, then it can be said that: 
> $$
> \frac{\Vert A x\Vert}{\Vert Ay \Vert} \le \kappa(A)\frac{\Vert 
> x\Vert_A}{\Vert y \Vert_A}
> $$

**Proof**:

From the definition of incuded 2-norm of matrices, assuming that $\lambda_1$ is the minimum eigenvalue of the matrix $A$, and $\lambda_n$ the maximum, and the fact that matrix $A$ has factorization $A^{1/2}A^{1/2}$: 
$$
\begin{aligned}
    \lambda_1 \Vert x \Vert 
    &\le \Vert Ax\Vert 
    \le \lambda_2 \Vert x\Vert
    \\
    \sqrt{\lambda_1} \Vert x\Vert 
    & \le \Vert A^{1/2}x\Vert \le \sqrt{\lambda_n}\Vert x \Vert
    \\
    \implies
    \sqrt{\lambda_1} & \le \frac{\Vert Ax\Vert}{\Vert A^{1/2}x \Vert} 
    \le \sqrt{\lambda_n}
\end{aligned}
$$
Consider another vector $y$: 

$$
\sqrt{\lambda_1} \le \frac{\Vert Ay\Vert}{\Vert A^{1/2}y \Vert} \le \sqrt{\lambda_n}
$$

So then: 

$$
\begin{aligned}
    \sqrt{\lambda_1}\frac{\Vert Ax\Vert}{\Vert A^{1/2}x \Vert} 
    & \le \sqrt{\lambda_n}\sqrt{\lambda_1}
    \\
    \sqrt{\lambda_1}\sqrt{\lambda_n}& \ge \sqrt{\lambda_n} \frac{\Vert Ay\Vert}{\left\Vert
         A^{1/2}y
    \right\Vert}
    \\
    \implies 
    \sqrt{\lambda_1}\frac{\Vert Ax\Vert}{\Vert A^{1/2}x \Vert} & \le 
    \sqrt{\lambda_n} \frac{\Vert Ay\Vert}{\left\Vert
         A^{1/2}y
    \right\Vert}
    \\
    \frac{\Vert Ax\Vert}{\Vert A^{1/2}x\Vert} &\le 
	\sqrt{\kappa(A)} 
    \frac{\Vert Ay\Vert}{\Vert A^{1/2}y\Vert}
    \\
    \frac{\Vert Ax\Vert}{\Vert Ay\Vert} &\le 
    \sqrt{\kappa(A)} 
	\frac{\Vert A^{1/2}x\Vert}{\Vert A^{1/2}y\Vert}
    \\
    \frac{\Vert Ax\Vert}{\Vert Ay\Vert} &\le 
    \sqrt{\kappa(A)} 
	\frac{\Vert x\Vert_A}{\Vert y\Vert_A}
\end{aligned}
$$

$\blacksquare$



**Note**: This holds true even if the matrix $A$ is not symmetric positive definite. 