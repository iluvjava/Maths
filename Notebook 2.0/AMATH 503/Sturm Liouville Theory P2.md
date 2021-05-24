This just a continuation on [[Sturm Liouville Theory]]

---
### **Recap**

The Sturm Lioville System is an ODE of the form: 

$$
\partial_x[p(x)\partial_x[y]] + (\lambda r(x) - q(x))y = 0
\tag{1}
$$

**Let's list the set of properties that the system have**.

1. Orthogonality Theorem: Eigen Functions are othogonal. 
2. Uniqueness Theorem: Each Eigen values corresponds to a unique Eigen Function. 
3. All Eigen Values are real. 
4. All Eigen Values are non negative when $q(x) > 0$, $\lambda = 0$ is possible when $y'(x) = 0$ and $q(x) = 0$. Consider the heat equation with Nauman Boundary Condition. 
5. All Eigen Values are discrete and forms an increasin sequence that goes to infinity, $p(x) > 0$ and $r(x) > 0$ in $[a, b]$
6. The eigen function, $\phi_k(x)$ corresponds to Eigen Value $\lambda_k$, assuming ordering of the Eigen Values, then this eigen function $\phi_k(x)$ has $k - 1$ zeros (Roots of the Eigen Function) in $(a, b)$. This is the case for Legendre, Fourier, and Chebyshev Sytem. 
7. The set of Eigen Functions are complete. 

Proofs will not be here yet, but we will clarify, or illustrate some of these properties. 

---
### **Eigen Values are Discrete and Forms an Increasing Sequence**

It means: 

$$
\lambda_1 < \lambda_2 <\lambda_3 < \cdots 
$$

and 

$$
\lim_{i\rightarrow \infty} \lambda_i = \infty
$$

Provided that $p(x) > 0$ and $r(x) > 0$ in $(a, b)$. 

And the difference between the Eigenvalues are the same. 

---
### **Completeness of Eigen Functions**

$$
f(x) = \sum_{n = 1}^{\infty}a_n \phi_n(x)
$$

**There is a series representation for any piecewise continuous functions that are bounded using the Eigen Functions** of the SL system, and the representation is "Accurate", which means that: 

$$
\epsilon_k = \int_{a}^{b} 
    r(x)(f(x) - \sum_{n = 1}^{k}a_n \phi_k(x))^2
dx
$$

The weighted Inner product[^1] of the difference function with itself is going to zero, as the series goes to infinite, so that: 

$$
\lim_{k\rightarrow \infty} \epsilon_k = 0
$$

Note: The Weighted Norm

SL System Completeness Theorem Statement: 

> The Eigen Functions of the Sturm Loiuville system are complete. 

It's important that, it doesn't mean the function is going to be the same for all points, the weight and the L2-Hilbert Norm of the function changes everything. 



[^1]: No complex eigen functions because all Eigen Values for SL are real. 