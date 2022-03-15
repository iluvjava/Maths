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
            \mathbf{e_2}^T
            \\
            0.5 \mathbf{e}_2^T + 0.5\mathbf{e}_3^T
            \\
            \vdots 
            \\
            0.5 \mathbf{e}_{2n - 1}^T + 0.5\mathbf{e}_{2n}^T
            \\
            \mathbf{e}_{2n}^T
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
        e^{[2h]} := \mathcal{F}(A^{[2h]}, r^{[2h]})
        \\&
        e^{[h]} := I_{[h]}^{[2h]} e^{[2h]}
        \\&
        x^{[h]} := x^{[h]} + e^{[h]}
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

Let's consider the classic Poisson problem on 1D, given as: 

$$
    \begin{cases}
        - u'' = f
        \\
        u(0) = u(1) = 0
    \end{cases}
$$

Using the properties from the prereq, we have the eigensystem of the Discretization matrix listed as: 

$$
\begin{aligned}
    \begin{cases}
        \lambda_k = \frac{2}{h^2}
        \left(
            1 - \cos\left(
                \frac{k\pi}{n}
            \right)
        \right) & 1 \le k \le n - 1 
        \\
        v^{(k)}_j = \sin\left(
            \frac{jk\pi}{n} 
        \right)& j = 1, \cdots, n-1
    \end{cases}
\end{aligned}
$$

Observe the simplifications for the quantity $\lambda_k$ as: 

$$
\frac{2}{h^2}
        \left(
            1 - \cos\left(
                \frac{k\pi}{n}
            \right)
        \right) = 
        \frac{4}{h^2}\sin^2 \left(
            \frac{k \pi}{2n}
        \right)
$$

Take notice that, the value $\lambda_k$ grows as $k$ goes from $1$ to $n$, and hitting a peak at the value $k = n$. Next, the eigenvector has the hightest oscillations for the value $k = n - 1$, which the eigen vector goes up and down for each value of $j$, almost at all the grid points. We call $1 \le k \le n/2$ to be the low frequencies, and $n/2 < k \le n - 1$ to be the high frequencies component. 

Consider the Modified Jacobi method which contains iteration matrix defined as: 

$$
M = w^{-1}\left(
    \frac{2}{h^2}
\right)I \quad G = (I - M^{-1}A)
$$

The convergence of the algorithm depends on the spectrum of the iterative matrix $G$. The eigenvalues of the matrix is going to be: $u_k = 1 - 2w\sin^2((k\pi)/(2n))$. Our goal here is to choose the value of $w\in [0, 1]$ such that all high frequencies components are as far away from one as possible. 

$u_k$ are discrete points from the function $1 - 2w\sin(\pi x/2)$. Which is the first quater of a sine curve, going from 1 to zero, tweaking the value of $w$ between $[0, 1]$ flattens and squeeze the curve upwards to $y =1$. 

> The optimal choice is actually $w = 2/3$, It's chosen so that for all values $k = n/2$, $k = n - 1$, and the values of $k$ between them, are all less than one as much as possible. 


**Weighted Jacobi Iterative Formula**: 

> $$
> \mathbf{x}^{(k+1)}=\omega D^{-1} \mathbf{b}+\left(I-\omega D^{-1} A\right) \mathbf{x}^{(k)}
> $$

Where $\omega \in [0, 1]$. 

**Anne's Formulations**




---
### **Limitations**

The method of multi-grid fails whenever the damping routine, such as the Jacobi and Gauss Sediel appears to 

---
### **Impelementations Tricks**

---
### **Multi-Grid Method as a Preconitioner**


