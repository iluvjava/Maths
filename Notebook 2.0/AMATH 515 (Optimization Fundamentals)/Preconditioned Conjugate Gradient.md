Must at least know about [[Conjugate Gradient for Dummy]] before reading this. 
Recommend reading on [[Conjugate Gradient Anne's Version]] before reading this. 

---
### **Preconditioned Conjugate Gradient**

The idea is to use a matrix $M$ that is approximately $A$, such that $M^{-1}A$ will make the spectrum of the matrix easier for conjugate gradient, in terms of numerical stability of the algorithm. To achieve that, we apply the preconditioner to the residual, recall that residual is related to the gradient of the Energy Norm Objective of the Conjugate Gradient. 

**Algorithm Statement**
$$
\begin{aligned}
    & r_0 := b - Ax_0
    \\
    & z_0 := M^{-1}r_0
    \\
    & p_0 := z_0 
    \\
    & \text{For: }k = 1,\cdots
    \\&\hspace{1.1em}
    \begin{aligned}
        & a_k := \frac{
            \langle r_k, z_k\rangle
            }{
                \langle p_k, Ap_k\rangle
            }
        \\
        & x_{k + 1} := x_k + a_k p_k
        \\
        & r_k := r_k - \alpha_k Ap_k 
        \\
        & \text{if }r_k \text{ small then exit}
        \\
        & z_{k + 1} := M^{-1}r_{k + 1}
        \\
        & b_k := \frac{\langle r_{k + 1}, z_{k + 1}\rangle}
        {\langle r_k, z_k\rangle}
        \\&
        p_{k + 1} = z_{k + 1} +  b_k p_k
    \end{aligned}
\end{aligned}
$$

The only changes aplied to the original conjugate gradient algorithm is $M^{-1}$ on the residual vector. Staionary Iterative Methods, Incomplete Cholesky, Multi-Grid routine are all possible candidates for preconditioners for conjugate gradient. 


---
### **Preconditioners**

We assume that the role of the preconditioner changes the spectrum of the matrix $A$ and improve the stablity and rate of convergence for the conjugate gradient method. One of the natural choice of it is a matrix $M$ that is SPD. However with this assumption, $M^{-1}A$ is not SPD. Therefore, solving the system $M^{-1}Ax = M^{-1}b$ is out of the picture as a method for the conjugate gradient. 

**Statement 1**

> Let the choice of the preconditioner be a symmetric positive definite matrix $M$, so that it has the decomposition
> $$
> \begin{aligned}
>     M &= EE^T
> \end{aligned}
> $$

**Statement 2**

> The Matrix $E^{-1}AE^{-T}$ will be symmetric positive definite and it will have the same eigenvalues as the matrix $M^{-1}A$. (They are not the same matrix obviously. )

**Proof**

The matrix $E^{-1}AE^{-T}$ is SPD is trivial. 

Suppose that the matrix $M^{-1}A$ has a eigenvector $x$ such that $M^{-1}Ax = \lambda x$, then $E^Tx$ is an eigenvector with eigenvalue $\lambda$ for the matrix $E^{-1}AE^{-T}$. Consider: 

$$
\begin{aligned}
    &\hspace{0.5em}
    (E^{-1}AE^{-T})(E^Tx)
    \\
    &= E^{-1}Ax
    \\
    &= E^TE^{-T}E^{-1}Ax
    \\
    &= E^TM^{-1}Ax
    \\
    &= E^T\lambda x
    \\
    &= \lambda(E^Tx)
\end{aligned}
$$

**Implications**

An alternative system of equations is proposed for solving by the conjugate gradient that make use of the factorization of $M$, and it will have better numerical stablity and convergence: 

$$
E^{-1}AE^{-T}(E^{T}x) = E^{-1}b
$$

This system is another SPD system, suitable for Conjugate Gradient. 


---
### **Factorization Free PCG**

The factor of the preconditioned matrix $M$ is needed, which could be a problem for the actual implementations for the algorithm. As we saw above, we didn't make use of the explicit matrix factorization in the PCG algorithm. 

To find a factorization free PCG algorithm, we consider the CG algorithm applied to the equation $E^{-1}AE^{-1}(E^Tx) = E^{-1}b$. 
