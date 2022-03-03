### **Intro**

This is a summary of the Lanczos Algorithm with Ritz Vector orthogonalization that I had in mind. 

**List of Assumptios for the Algorithm**

> $A$ is Hermitian, and the $T_k$ generated from Iterative Lanczos is irreducible, meaning sub-diagonals are all non zeros. 

> There exists a subroutine $\mathcal{R}(T_k, a, b)$ where there exists exactly one eigenvalues in the interval $[a, b]$ that returns the eigenvalue in that invterval. One of $a$ or $b$ can be $-\infty$ or $\infty$ but ot both. The subroutine is efficient and has complexity $\mathcal{O}(k)$. 

> There exists a sub routine that returns the eigen vector for $T_k$ given it's corresponding eigenvalue. Name it $\mathcal{G}(\lambda)$. 

> This assumptions is relevant to identifying converged ritz vectors and values. 
> 
> Let $\theta_i^{(k)}$ be the $i$ th eigenvalues for $T_k$ ordered so that: $\theta_1^{(k)} \le \theta_2^{(k)}\cdots \theta_k^{(k)}$ for all $k$. 
> 
> Assuming that $k$ is odd, $i \le \lceil k\rceil$, and $\theta_i^{(k - 1)} - \theta_i^{(k)} < \epsilon$ , then eigenvalues $\theta_i^{(k-1)}$  is one of the converged ritz values. Assuming that $i > \lceil k\rceil$ and $\theta_{i + 1}^{(k + 1)} - \theta_{i}^{(k)} < \epsilon$, then the ritz value $\theta_{i + 1}^{(k + 1)}$ has converged at current iteration. 
> 


---
### **Keeping track of the Eigenvalues for $T_k$**

Cauchy Interlace Theorem asserts that the eigenvalues for $T_{k - 1}$ are between the eigenvalues of $T_{k}$. 

$\theta_{i}^{(k)} \rightarrow \theta_{i}^{(k + 1)}$ when $i\le \lceil k/2\rceil$. $\theta_i^{(k)} \rightarrow \theta_{i + 1}^{(k + 1)}$ when $i \ge 1 + \lceil k/2\rceil$, the new found ritz value that join the inner spectrum of $T_{k + 1}$ is $\theta_{\lceil k/2\rceil}$. We compare the values between the matching eigenvalues from iteration $k + 1$ to iteraton $k$, and if the difference between them is small enough, then we find its corresonding eigenvector and declare to the a well-converged eigenvector for matrix $A$. 

**Complexity**

Converged eigenvalues from before iteration $k - 1$ can be ignore, therefore from iteration 1 to k, routine $\mathcal{R},\mathcal{G}$ is called $k$ time cumulatively, both routine has a complexity of $i$ for $i$ going from 1 to k, therefore, cumulatively we have a complexity of $\mathcal{k^2m}$, where $m$ is the number of converged eigenvectors. 

When $k, m$ is much smaller than $n$, where $n$ is the full size of matrix $A$, the algorithm has a better complexity. 

---
### **Algorithm Overview**

Suppose that at each iteration of Lanczos, We only know the set of eigenvalues of $T_k$, listed as $\theta_i^{(k)}$, they are ordered so that $\theta_1^{(k)} < \theta_2^{(k)}\cdots < \theta_k^{(k)}$, and we know whether they have converged before iteration $k$ or not. During the iterations, we seek for $\theta_{i}^{(k + 1)}$ for $T_{k + 1}$ and establisehd converged ritz vectors. 

$$
\begin{aligned}
    & \text{if } \theta_{1}^{(k)} \text{converged already}:
    \\
    & \hspace{1.1em} 
        \theta_1^{(k + 1)} := \theta_i^{(k)}
    \\
    & \text{else: }
    \\
    & \hspace{1.1em}
    \theta_1^{(k + 1)} := \mathcal{R}(T_k, -\infty, \theta_1^{(k)})
    \\
    & \text{if } \theta_{k}^{(k)} \text{converged already}:
    \\
    & \hspace{1.1em} 
        \theta_{k + 1}^{(k + 1)} := \theta_i^{(k)}
    \\
    & \text{else: }
    \\
    & \hspace{1.1em}
    \theta_{k + 1}^{(k + 1)} := \mathcal{R}(T_k, \theta_k^{(k)}, \infty)
    \\
    & \text{For } i = 2 \cdots k - 1: 
    \\ 
    & \hspace{1.1em}
    \begin{aligned}
        & \text{if } i \le \lceil k/2\rceil: 
        \\
        &\hspace{1.1em}
        \theta_{i}^{(k + 1)} := \theta_i^{(k)} \text{if converged else: } 
        \mathcal{R}(T_k, \theta_{i - 1}^{(k)}, \theta_{i}^{(k)})
        \\
        & \hspace{1.1em}
        \text{Mark }\theta_{i}^{(k + 1)} \text{converged if } \theta_i^{(k + 1)}\approx \theta_i^{(k)}
        \\
        & \text{else: }
        \\
        & \hspace{1.1em}
        \theta_{i + 1}^{(k + 1)} := \theta_i^{(k)} \text{if converged else: } 
        \mathcal{R}(T_k, \theta_{i}^{(k)}, \theta_{i + 1}^{(k)})
        \\
        & \hspace{1.1em}
        \text{Mark }\theta_{i + 1}^{(k + 1)} \text{converged if } \theta_i^{(k + 1)}\approx \theta_i^{(k)}
    \end{aligned}
    \\
    & \theta_{\lceil k/2\rceil + 1}^{(k + 1)} := \mathcal{R}(T_k, \theta_{\lceil k/2\rceil}^{(k)}, \theta_{\lceil k/2\rceil + 1}^{(k)})
    \\
    & \text{Accumulate the corresponding ritz vectors for ritz}
    \\
    & 
    \text{values tha converged during this iterations for re-othogonalizations}
\end{aligned}
$$

Here is an visualization of how the ritz vectors are suppose to move: 

$$
|*|*|*|
\\
|*|*|*|*|
\\
|*|*|*|*|*|
$$

This algorithm seems to keep track of the eigenvalues and converged ritz vectors at a minmal computational cost. Another driver routine of this routine will be informed of the changes of the eigenvalues of $T_k$, so the driver routine can make use of this information in real time and decide when to orthogonalize lanczos vector against the ritz vectors. 

Let's revise the algorithm a bit, so that it's simpler for impelementation.


---
### **Subroutine R**

The characteristic polynomial of matrix $T_k$ has a recursive relationships that builds up together with the matrix $T_k$. We can compute the characteristic polynomial using this recurrence with a for loop. 

The subroutine performs a bybrid of Bisection and Newton's ethod to locate the unique eigenvalue bounded in the interval. 

**Note:**

Lapack provides algorithm that looks for only the eigenvalues, or specific eigenvalues given the index for the eigenvalue, it's complexity is not assured and I am not sure if it's more efficiently than the proposed method above. 

Recurrence of the charastic polynomial for $T_k$. 

> $$p^{(k)}(x) = (\alpha_k - x) p^{(k - 1)}(x) - \beta_{k - 1}^2 p^{(k - 2)}(x)$$

Where $p^{-1}(x) = 0$, and $p^{(0)} = 1$, $p^{(m)} (x)=\det(T_m - xI)$. And we can also carry out the derivative recursively too I believe, both of them can build up at the same time so the Newton's Method can be used. 

Writting out the Base case explicity we have: 

$$
\begin{aligned}
    p^{(1)}(x) &= \alpha_1 - x
    \\
    p^{(0)}(x) &= 1
    \\
    p^{(2)}(x) &= 
    (\alpha_2 -x)p^{(1)}(x) - \beta_2^2p^{(0)}(x)
\end{aligned}
$$

And each recursion will be based on 2 of the previous values. This means that the routine implementation is similar to the Fibonacci Number. 

**Derivative of the Shifted Characteristic Polynomial**



---
### **Sub Routine G**

Solve the system $(T_k - \lambda I)^{-1} = \mathbf{0}$ directly? And then use the eigenvector from $T_k$ and $Q_k$ to approximate the ritzvector for $A$

**Note**: 

Lapack have routine the returns eigenvector for the matrix given the corresponding eigenvalue, not sure how efficient it is. I would assume if it's designed for Tridiagonal matrix specifically, then it should be very efficient. 



---
### **Extra Comments**

It's huge effort to keep track of the eigenvalues of the matrix $T_k$, We need to also look into the potential to restart when rizt vectors are near perfect to eigenvectors of $A$ , so that $T_k$ doesn't get too large, but I would need to look into that part to see how to build on a new tridiagonal matrix using the $\beta_k$ from previous tridiaognal matrix that keeps it tridiagonal...? 