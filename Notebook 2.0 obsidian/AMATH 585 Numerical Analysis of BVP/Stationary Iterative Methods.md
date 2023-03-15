This is the preq: [[Jacobi Gauss Sediel Iterations]]. Here is more advanced coverage of the same topic. 

---
### **Intro**

You must read the document listed above to proceed. 

Stationary iterative method refers to methods that just iterate with a matrix that approximately the inverse of the matrix $A$, in hope to solving the system $Ax - b$ by minimizing the residual. 

Here is a list of the common methods: 

* Jacobi Iteration: Talked in the prereq. 
* Gauss Seidel: Talked in the prereq. 
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

Here, the choice of $w$ is in between $(1, 2]$. That is a reasonable range to paramaterize the above equation. Finally the above equation can be put into an iterative formula as: 

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

This is directly the Gauss Sediel Method. However, no choice of parameter on $w$ can recover the Jacobi Iterations. Take note that, in the case of sparse matrix, it might be easier to back solve than than using the inverse.  

**Note:** Different conventions of naming these quantities exists sometimes $w$ above is actually the $w^{-1}$ in some literature. 

**References**: Greenbaum's 2021 class, and her Iterative Method book. 

---
### **Intuitive Understanding of the Matter**

To gain a better understanding, we have to simplifies the system into another form. 

$$
\begin{aligned}
    (D + wL)x_{n + 1} &= wb - (wU + (w - 1)D)x_k
    \\
    (w^{-1}D + L)x_{n + 1} &= b - (U + (1 - w^{-1})D)x_k
    \\
    &= b - Ux_k - (1 - w^{-1})Dx_k
    \\
    &= b - Ux_k - Dx_k + w^{-1}Dx_k
    \\
    &= b - Ux_k - Dx_k + w^{-1}Dx_k - Lx_k + Lx_k
    \\
    &= b - (U + D + L)x_k + (w^{-1}D + L)x_k
    \\
    &= b - Ax_k + (w^{-1}D + L)x_k
\end{aligned}
$$

If we define $M = (w^{-1}D + L)$, then hope is that the matrix $M\approx A$ and $M^{-1}$ is very easy to compute, so that we have the following expression: 

$$
\begin{aligned}
    Mx_{n + 1} &= b - Ax_k + Mx_k
    \\
    x_{n + 1} &= M^{-1}r_k + x_k
\end{aligned}
$$

Ideally speaking, $M^{-1}r_k$ approximate the quantity $A^{-1}b - x_k$, or the error of the current guess $x_k$. If by the choice of $M$ it achieved it, (Which it will for SOR), then the iterations formula converges. In fact, when it converges, we have: 

$$
\begin{aligned}
    x_{n + 1} &= M^{-1}r_k + x_k
    \\
    A^{-1}b - x_{n + 1} &= A^{-1}b - M^{-1}r_k - x_k
    \\
    e_{k + 1} &= e_k - M^{-1}(b - Ax_k) \text{ where : } e_k = A^{-1}b - x_k
    \\
    e_{k + 1} &= e_k - M^{-1}A(A^{-1}b - x_k)
    \\
    e_{k + 1} &= e_k - M^{-1}Ae_k
    \\
    e_{k + 1} &= (I - M^{-1}A)e_k
    \\
    e_{k + 1} &= (I - M^{-1}A)^{k + 1}e_0
\end{aligned}
$$

The spectral radius of the matrix $I - M^{-1}A$ will determine the convergence of the error. 

**Staionary Iterative Convergence Theorem**

> For any choice of $M$, the iterative scheme $x_{k + 1} = M^{-1}r_k + x_k$ convergence for all initial guess if and only if $\Vert (I - M^{-1}A)^k\Vert$ convergences to zero. 

The theorem is an IFF type of statement, which one direction is easy, but the other direction is not. If the norm converges, then the erro does, but the other way around is not so obvious. 

**Field of values**

If the field of value of the matrix $I - M^{-1}A$ is strictly less than one, then it STILL converges, but might not be monotonically under certain norm measure. 

---
### **Convergence Rate Statement**

Before one can make any claim, we need to put the iterations proceudure into the form of $x_{k + 1} = Gx_{k} + c$. Then, we can make the claim that, if the [[Spectral Radius]] of the matrix $G$ is less than unity, then the iterative scheme will inevitability converge for all initial guess. In fact the converse is also true. The statement that we wish to prove would be: 

**Convergence and Spectral Radius**
> If the iterations matrix $G$ for the stationary scheme has a spectral radius that is less than unity iff and only if the stationary scheme converges for all initial guesses. 

**Optimal Relaxation Factor for SOR Method**

> The spectrum of the iterative matrix is in the scale of $1 - \mathcal{O}(h)$ for the optimal sor relaxation factor, given as $w_{opt} = 1/\sqrt{1 - \rho(G_J)}$ where $G_J$ is the Jacobi Iteration Matrix. 


