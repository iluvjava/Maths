[[Uniform Convergence Preserves Continuity]]

---
### **Intro**

We state the theorem and them prove it in the next section. The Wiestrass M-Test tells us whether a series of function can converges to a continuous function absolutely, or it fails to do so. 

> Let $(f_n)_{n\in \mathbb N}$ be a sequence of function and let $(M_n)_{n\in \mathbb N}$ be a sequence of number. Let $A$ be the set where the function is going to converge on. Define $\Vert g\Vert_{(A, \infty)} = \sup_{x\in A}|g(x)|$ be a norm metric. If 
>
> 1. $\Vert f_n(x)\Vert_{(A, \infty)}\le M_n\; \forall n \ge 0$
> 2. $\sum_{i = 1}^{\infty}M_n < \infty$
> 
> Then the sequence of function $f_n$ converges uniformally and absolutely. 

**Proof**

We can show the convergence by showing that the sequence of function is Cauchy converging uniformly on $A$. We denote $S_n = \sum_{k = 1}^n f_n$ to be the function for the partial sum. Using the fact that $M_n$ converges, we know that it's Cauchy hence: 

$$
\begin{aligned}
    & \forall \epsilon > 0 \;\exists N_\epsilon: 
    \left(
        \forall m, n: \min(m, n) > N_\epsilon: \sum_{k = n + 1}^{m}M_k < \epsilon
    \right)
    \\
    \implies &
    \Vert S_m - S_n\Vert_{(A, \infty)} = 
    \left\Vert
        \sum_{k = n+ 1}^{m} f_k
    \right\Vert_{(A, \infty)} 
    \le 
    \sum_{k = n+ 1}^{m} \Vert f_k\Vert_{(A, \infty)}
    \\
    & \hspace{6.6em}
    \le 
    \sum_{k = n + 1}^{m}M_k \le \epsilon, 
\end{aligned}
$$

Therefore, the sequence $S_n$ is now Cauchy in the metric $\Vert \cdot\Vert_{(A, \infty)}$, therefore, it has to be a convergence sequence. And since it's converging under the norm, it would mean that it's converging uniformly, and hence this convergence will also preserves the continuity. 


**Remarks**

While this is not directly used, nor related, but the proof implicitly uses the concept of a [[Metric Space]] to bound the functions uniformly. Also take note that, function that is not continuous can also converges uniformly, this stronger type of convergence doesn't really do much with the type of functions we have. 