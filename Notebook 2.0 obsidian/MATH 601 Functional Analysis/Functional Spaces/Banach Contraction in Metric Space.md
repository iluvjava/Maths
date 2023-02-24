- [[Metric Space]], [[Convergence in Metric Space]], [[../Further Examples for Metric Space]]. Which are the foundations for metric spaces and their properties. 

---
### **Intro**

This is just a generalization for fixed point iterations in $\R$, however, we generalized it to metric spaces and mapping that maps back to the same metric space. The theory is somewhat dull, but the application is fruitful, forming the foundations for a lot of methods in optimizations. 


**Definition: Fixed Point of Operators**: 

> Let $T:X\mapsto X$ where $(X, d)$ gives a complete metric space, then $x\in X$ is a fixed point of $T$ if $Tx = x$. We denote $\text{fix}(T)$ to be the set of fixed point for the operator $T$. 


**Definition: Fixed Point Iterations of Operator**: 

> Let $T: X\mapsto X$ and $x_0\in T$, The fixed point iteration of $T$ is a sequence $(x_n)_{n\in \N}$ defined recursively as: $x_{n} = Tx_{n - 1}$. 

**Definition: Banach Contraction**

> Suppose that the metric space $(X, d)$ is complete, then $T$ is a Banach contraction if there exists $\alpha\in [0, 1)$ such that: 
> $$
> \begin{aligned}
>     d(Tx, Ty) \le \alpha d(x, y) \quad \forall x, y \in X
> \end{aligned}
> $$

**Theorem: Banach Fixed Point Contraction Theorem**

> Let $(X, d)$ be a complete metric space that is non-empty, let $T:X\mapsto X$ be a contraction on $X$, then $\text{fix}(T)$ is a singleton. 

**Proof Preparations**: 

We construct a Cauchy sequence in the metric space and then show that the operator $T$ has precisely one fixed point. The Cauchy sequence is the fixed point iteration sequence given by the recursive relation: $x_{n + 1} = Tx_n$, and we have $x_n = T^nx_0$ too.

**Proof**

Fix some $m\in \N$ then a simple recursive argument would yield that: 
$$
\begin{aligned}
    d(x_{m + 1}, x_m) \le \alpha^m d(x_1, x_0), 
\end{aligned}
$$

now, we assume that $n > m$ WLOG and we let it be that $m + k = n$, then 

$$
\begin{aligned}
    d(x_m, x_n) &\le d(x_m, x_{m + 1}) + d(x_{m + 1}, x_n)
    \\
    &\le 
    d(x_m, x_{m + 1}) + d(x_{m + 1}, x_{m + 2}) + d(x_{m + 2}, x_n)
    \\
    & \cdots
    \\
    &\le \sum_{i = 0}^{k - 1} d(x_{m + i}, x_{m + i + 1}), 
\end{aligned}
$$

where we just applied the triangle inequality for the metric repeatedly, and which it gives us a telescoping summation, upper-bounding the initial quantity $d(x_m, x_n)$. Next, we use the obvious recursive relations from $T$ being a contraction: 

$$
\begin{aligned}
    \sum_{i = 0}^{k - 1}
        d(x_{m + i}, x_{m + i + 1})
    & \le 
    \sum_{i = 0}^{k - 1} 
    \alpha^{m + i}
    d(x_{0}, x_{1})
    \\
    &= 
    d(x_0, x_1) \left(
        \sum_{i = 0}^{k - 1} \alpha^{m + i}
    \right)
    \\
    &= 
    \alpha^{m} \frac{1 - \alpha^{n - m}}{1 - \alpha} d(x_0, x_1), 
\end{aligned}
$$

then directly observe that we have: 

$$
\begin{aligned}
    d(x_m, x_n) \le 
    \alpha^{m} \frac{1 - \alpha^{n - m}}{1 - \alpha} d(x_0, x_1) 
    \le 
    \frac{\alpha^m}{1 - \alpha} d(x_0, x_1), 
\end{aligned}
$$

whenever we have $n > m$. Now, we have shown that a fixed point iteration on a contractive mapping is producing a Cauchy sequence, and hence, $x_n\rightarrow x$ by the fact that $(X, d)$ is a complete metric space. To show, we consider: 

$$
\begin{aligned}
    d(x, Tx) &\le 
    d(x, x_m) + d(x_m, Tx) 
    \\
    &\le
    d(x, x_m) + \alpha d(x_{m - 1}, Tx)
    \\
    \lim_{n\rightarrow \infty} d(x, Tx) 
    &\le 
    \lim_{n\rightarrow \infty} d(x, x_m) + 
    d(x_{m - 1}, Tx)
    \\
    d(x, Tx) &= 0
\end{aligned}
$$

Take note we can take the limit using the convergence property of complete metric space. Hence we had shown that the limit point $X$ has to be in $\text{fix}(x)$, in the fixed point set of the operator $T$. To show that the fixed point is unique, we consider $\bar x$ to be another element from the fixed point set $\text{fix}(T)$ then: 
$$
\begin{aligned}
    d(x, \bar x) = d(Tx, T\bar x) \le \alpha d(x, \bar x), 
\end{aligned}
$$

assuming that $\alpha \neq 0$, then it must be the case that $d(x, \bar x) = 0$, at the last step we directly apply the fact that the mapping is a contractive mapping. 


---
### **Corrollary: Error Bound**

We attained the following error bound estimate from the previous proof: 

$$
\begin{aligned}
    & d(x_m, x) \le \frac{\alpha^2}{1 - \alpha} \delta(x_0, x_1); 
    \\
    & d(x_m, x) \le \frac{\alpha}{1 - \alpha}d(x_{m - 1}, x_m), 
\end{aligned}
$$

assuming that the metric space is complete, and the mapping for the fixed point iteration is contractive. 

---
### **Misc**

> A contractive mapping is automatically a continuous mapping. 


**Theorem: Multiple Contractions**

> Let $T, T_1, T_2$ be contractions with constants $\alpha, \alpha_1, \alpha_2$ respectively then: 
> - $T$ is uniformly continuous on $X$. 
> - If $X$ happens to be a normed vector space, and we have $d(x, y) = \Vert x - y\Vert$, then $(T_1 + T_2)/2$, their averages is also going to be a contractive mapping. 
> - $T_2\circ T_1$, the composite for 2 of the mapping is going to be a contractive mapping as well. 

**Proof**: 
#UNFINISHED

