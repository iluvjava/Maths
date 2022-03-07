[[Stationary Iterative Methods]]
[[The TST Matrix]]
[[Block TST Matrix with TST Blocks]]


---
### **Intro**

Covers the motivations behind the developement of the multi-grid method, the exploits, and how it's implemented. The Algorithm comes first and it's anlaysis and proofs come next. First thing first, the multi-grid method is so far, only exploitable from a theoretical perspective for TST and block TST matrix. other type of matrix are not showed to have advantages when solved using the multi-grid method. 

The algorithm is recursive, and it's applicable to staionary iterative methods such as the SOR, GS, and JB. Let such a method be paramaterized by grid size and the system. Let $A^{[h]}, b^{[n]}$ denotes the linear system. Let $R_\mu(A, b|x_0)$ denotes the generic iterative routine that we appied for solving the system given some type of initial guess $x_0$, and a fixed number of iterations count dentoed using $\mu$. 

* $A^{[h]}x^{[h]} = b^{[h]}$ denoets the system discretized with grid width $h$. 
* $I_{[h]}^{[2h]}$: The interplation matrix that interplate the residual/solution vector from the grid point $2h$ to $h$. It should have the size of $1/(h)\times 1/(2h)$. The inverse operation of the matrix is simply $0.5(I^{[h]}_{[2h]})^T$, $0.5$ multiplied by the interplation matrix. 
* $I^{[2h]}_{[h]}$: The interplation matrix, it's a $n\times 2n$ sized matrix. If we assume that the grid points are even discretized, then it can be said that: 
    $$
        I^{[2h]}_{[h]}= 
        \begin{bmatrix}
            \mathbf{e}_1^T
            \\
            0.5 \mathbf{e}_1^T + 0.5\mathbf{e}_2^T
            \\
            \mathbf{e_2}
            \\
            0.5 \mathbf{e}_2^T + 0.5\mathbf{e}_3^T
            \\
            \vdots 
            \\
            0.5 \mathbf{e}_{2n - 1}^T + 0.5\mathbf{e}_{2n}^T
            \\
            e_{2n}^T
        \end{bmatrix}
    $$

**Algorithm**

$$
\begin{aligned}
    & \mathcal{F}(A^{[h]}, b^{[h]}): 
    \\&\hspace{1.1em}
    \begin{aligned}
        & \text{If } h \text{ is big: return } (A^{[h]})^{-1}b^{[h]}
        \\&
        x^{[h]} := \mathcal{R}_\mu(A^{[h]}, b^{[h]})
        \\&
        r^{[h]} := b^{[h]} - A^{[h]}x^{[h]}
        \\&
        r^{[2h]} := 0.5(I_{[2h]}^{[h]})^Tr^{[2h]}
        \\&
        e^{[2h]} := \mathcal{F}(A^{[2h]}, -r^{[2h]})
        \\&
        e^{[h]} := I_{[h]}^{[2h]} e^{[2h]}
        \\&
        x^{[h]} := x^{[h]} - e^{[h]}
        \\& 
        \text{return }x^{[h]}
    \end{aligned}    
\end{aligned}
$$

Solve the current fine grid using some efficient iterative method, and then solve the error on the coarser grid using recursion. 

**Motivations and Reasons Behind it**: 

The major motivations here is the realization that iterative method can damp out the high frequencies errors using just a few iterations, and the error tends to get smoother and smoother, but at the same time, to solve for the error the fixes the smoother error, we don't need a fine grid! Hence that is where the recursion comes in. This is an exploit of the structure of the solution rather than the algorithm itself. 

**Note**: If we are talking about 2d or 3d, the system will shrink down to 1/4 or 1/8 of the original size, due to the rule of cutting the discretizations in half. 

**Implementation**

Recursively apply the algorithm and the iterative methods. Sometimes we can also use the depth of the recursion to determine when to terminate the algorithm or when not to do that. 

---
### **Weighted Jacobi/Underrelaxed Jacobi Iterations**

The Jacobi Method doesn't achive speedy convergence of TST matrix for the Poisson Equation. We consider the use of a modified version of the method that does have fast damping effect of the error of the solution. 

**Major Claim**:

> The Jacobi Iterationl has the ability to smooth out the high frequencies oscillations of the error at the beginning of the algorithm. 


