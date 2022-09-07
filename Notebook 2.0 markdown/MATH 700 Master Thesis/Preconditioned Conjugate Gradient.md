Must at least know about [Conjugate Gradient for Dummy](../AMATH%20515%20Optimization%20Fundamentals/Conjugate%20Gradient%20for%20Dummy.md) before reading this. 
Recommend reading on [Conjugate Gradient Anne's Version](Conjugate%20Gradient%20Anne's%20Version.md) before reading this. 

---
### **Preconditioned Conjugate Gradient**

The idea is to use a matrix $M$ that is approximately $A$, such that $M^{-1}A$ will make the spectrum of the matrix easier for conjugate gradient, in terms of numerical stability of the algorithm. To achieve that, we apply the preconditioner to the residual, recall that residual is related to the gradient of the Energy Norm Objective of the Conjugate Gradient. 

**PCG Algorithm Statement**
> $$
> \begin{aligned}
>     & r_0 := b - Ax_0
>     \\
>     & z_0 := M^{-1}r_0
>     \\
>     & p_0 := z_0 
>     \\
>     & \text{For: }k = 1,\cdots
>     \\&\hspace{1.1em}
>     \begin{aligned}
>         & a_k := \frac{
>             \langle r_k, z_k\rangle
>             }{
>                 \langle p_k, Ap_k\rangle
>             }
>         \\
>         & x_{k + 1} := x_k + a_k p_k
>         \\
>         & r_k := r_k - \alpha_k Ap_k 
>         \\
>         & \text{if }r_k \text{ small then exit}
>         \\
>         & z_{k + 1} := M^{-1}r_{k + 1}
>         \\
>         & b_k := \frac{\langle r_{k + 1}, z_{k + 1}\rangle}
>         {\langle r_k, z_k\rangle}
>         \\&
>         p_{k + 1} = z_{k + 1} +  b_k p_k
>     \end{aligned}
> \end{aligned}
> $$

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

To find a factorization free PCG algorithm, we consider the CG algorithm applied to the equation $E^{-1}AE^{-1}(E^Tx) = E^{-1}b$. To do that we form match these 2 problems so that it's the input for the Conjugate Gradient Algorithm: 

$$
\begin{aligned}
    \underbrace{E^{-1}AE^{-T}}_{\bar{A}}(\underbrace{E^Tx}_{\hat{x}}) &= \underbrace{E^{-1}b}_{\hat{b}}
    \\
    \bar{A}\hat{x} &= \hat{b}
    \\
    Ax &= b \leftarrow \text{Unpreconditioned System}
\end{aligned}
$$

Then, we wish to prove that, solving the preconditioned system, we have the following parameters for the system: 

> $$
> \begin{aligned}
>     \hat{p}_0 &= M^{-1}r_0
>     \\
>     \hat{a}_k &= \frac{\langle r_k, M^{-1}r_k\rangle}
>     {\langle \hat{p}_k, A\hat{p}_k\rangle}
>     \\
>     \hat{b}_k &= \frac{\langle r_{k + 1}, M^{-1}r_{k + 1}\rangle}
>     {
>         \langle r_k, M^{-1}r_k\rangle
>     }
> \end{aligned}
> $$


Applying the Conjugate Gradient Algorithm to the above system, we can say the following things about the parameters: 

$$
\begin{aligned}
    \hat{r} &= E^{-1}b - E^{-1}AE^{-T}\hat{x} 
    \\
    E\hat{r} &= b - E^{-1}Ax 
    \\
    E\hat{r} &= r
    \\
    \implies \hat{b}_k &= 
    \frac{\langle \hat{r}_{k + 1},\hat{r}_{k + 1}\rangle}
    {
        \langle \hat{r}_{k + 1}, \hat{r}_{k + 1}\rangle
    }
    \\
    &= \frac{\langle E^{-1}r_{k + 1},E^{-1}r_{k + 1}\rangle}
    {
        \langle E^{-1}r_{k + 1}, E^{-1}r_{k + 1}\rangle
    }
    \\
    &= \frac{\langle r_{k + 1},E^{-T}E^{-1}r_{k + 1}\rangle}
    {
        \langle r_{k + 1}, E^{-T}E^{-1}r_{k + 1}\rangle
    }
    \\
    &= \frac{\langle r_{k + 1},M^{-1}r_{k + 1}\rangle}
    {
        \langle r_{k + 1}, M^{-1}r_{k + 1}\rangle
    }
\end{aligned}
$$

**Proof:**

Suppose that $p_k$ are the $A$ orthogonal vectors generated from the Preconditioned Conjugate Gradient, then $E^{T}\hat{p}_k$ are the $\bar{A}$ orthogonal conjugate vector for the unpreconditioned problem. Which would implies that $E^{T}p_k$ are the $A$ orthogonal vector for the Preconditioned CG. 

$$
\begin{aligned}
    & \hspace{0.5em}
    \langle \hat{p}_k, \bar{A}\hat{p}_k\rangle
    \\
    & = \langle E^Tp_k, \bar{A}E^Tp_k\rangle
    \\
    &= 
    \langle E^Tp_k, E^{-1}A p_k\rangle
    \\
    &= \langle p_k, EE^{-1}A p_k\rangle
    \\
    &= \langle p_k, Ap_k\rangle
\end{aligned}
$$

Therefore, for the preconditioned $\hat{p}_0 = \hat{r}_0$, preserveing the A-orthogonality would imply that $E^T\hat{p}_0 = E^T\hat{r}_0$; therefore we have: 

$$
\begin{aligned}
    E^T\hat{r}_0 &= E^TE^{-1}b - E^TE^{-1}AE^{-T}\hat{x}
    \\
    &= M^{-1}b - M^{-1}Ax
    \\
    &= M^{-1}r_0
    \\
    \implies E^{T}\hat{p}_0 &= M^{-1} r_0
\end{aligned}
$$

The proof is now complete, using the above parameters will solve the original$Ax = b$, but also the conditioned system at the same time, which has better numerical properties and doesn't require knowledge of the matrix $E$. 



