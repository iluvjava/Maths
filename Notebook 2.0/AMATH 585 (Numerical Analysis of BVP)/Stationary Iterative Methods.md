This is the preq: [[Jacobi Gauss Sediel Iterations]]



---
### **Intro**

You must read the document listed above to proceed. 

Stationary iterative method refers to methods that just iterate with a matrix that approximately the inverse of the matrix $A$, in hope to solving the system $Ax - b$ by minimizing the residual. 

Here is a list of the common methods: 

* Jacobi Iteration: Talked in the prereq. 
* Gauss Sediel: Talked in the prereq. 
* Successive Over Relaxation: About to come next. 

Consider the factorization of matrix $A$ into 3 parts, the diagonal, lower diagonal, and the upper diagonal parts of the matrix: 

$$
A = L + D + U
$$

Then the system $Ax = b$ can be written as: 

$$
\begin{aligned}
    (D + wL)x &= wb - (wU + (w - 1)D)x
    \\
    Dx + wLx
    &= 
    wb - wUx + (w - 1)Dx
    \\
    wDx + wLx + wUx
    &= 
    wb 
    \\
    wAx &= wb
\end{aligned}
$$

Here, the choice of $w$ is in between $(1, 2]$. That is a resonable range to paramaterize the above equation. Finally the above equation can be put into an iterative formula as: 

$$
\begin{aligned}
    x_{n + 1} &= \underbrace{w(D + wL)^{-1}b}_{= c} \underbrace{- (D + wL)^{-1}(wU + (w - 1)D)}_{M} x
\end{aligned}
$$

Observe that, when $w = 1$, we have: 

$$
\begin{aligned}
    (D + L)x_{n + 1} &= b - Ux_{n}
\end{aligned}
$$

This is directly the Gauss Sediel Method. However, no choice of parameter on $w$ can recover the Jacobi Iterations. Take note that, in the case of sparse matrix, it might be easier to backsolve than than using the inverse.  

---
### **Convergence Rate Statement**

Before one can make any claim, we need to put the iterations proceudure into the form of $x_{k + 1} = Gx_{k} + c$. Then, we can make the claim that, if the [[Spectral Radius]] of the matrix $G$ is less than unity, then the iterative scheme will inevitability converge for all initial guess. In fact the converse is also true. The statement that we wish to prove would be: 

**Convergence and Spectral Radius**
> If the iterations matrix $G$ for the stationary scheme has a spectral radius that is less than unity iff and only if the stationary scheme converges for all initial guesses. 

**Optimal Relaxation Factor for SOR Method**

> The spectrum of the iterative matrix is in the scale of $1 - \mathcal{O}(h)$ for the optimal sor relaxation factor, given as $w_{opt} = 1/\sqrt{1 - \rho(G_J)}$ where $G_J$ is the Jacobi Iteration Matrix. 


