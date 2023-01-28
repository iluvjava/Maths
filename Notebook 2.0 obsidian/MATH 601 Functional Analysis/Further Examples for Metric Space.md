[[Metric Space]]

---
### **Metric for Unbounded Sequence**



---
### **l-p Sequence Space**

**Conjugate Pairs**
> $p, q$ are conjugate pairs if they satisfies: $p^{-1} + q^{-1} = 1$. 




**Theorem: Fenchel's Young's Inequality**

> Let $f(\beta) = \alpha\beta - q^{-1}\beta^q$ when $\alpha,\beta> 0$, $p> 1$, and $p, q$ are conjugate to each other, we have the inquality: $\alpha\beta \le q^{-1}\alpha^{p} + q^{-1}\beta^q$. 

To prove, we simply take the derivatove giving us $f'(\beta) = \alpha - \beta^{q - 1}$. By the assumption that $q - 1 > 0$, we know $q > 1, 0 < p < 1$ and the function $f'$ is monotone decreasing by $\beta > 0$. Meaning that the original function contains a maximum over $\mathbb R_+$. After that, we may just do some calculus to prove the inquality. 

**Theorem: Holder's Inequality**

> Let $p, q > 0$ be a conjugaete pairs and let $a, b \in \mathbb R^n_+$, then $\Vert a\Vert_p\Vert b\Vert_q \le \langle a, b\rangle$. 

**Proof**

We define positive constants: $\alpha_1 = a_i/\Vert a\Vert_p, \beta_i = b_i/\Vert b\Vert_q$, then $\alpha_i, \beta_i \ge 0$ for all indices, applying Fenchel's inequality we have: 

$$
\begin{aligned}
    \alpha_i\beta_i &\le \frac{\alpha_i^p}{p} + \frac{\beta_i^q}{q}
    \\
    \sum_{i = 1}^{n}\alpha_i\beta_i &\le 
    \sum_{i = 1}^{n}\frac{\alpha_i^p}{p} + 
    \sum_{n = 1}^{n} \frac{\beta_i^q}{q}
    \\
    \left\langle 
        \frac{a}{\Vert a\Vert_p}, \frac{b}{\Vert b\Vert_q}
    \right\rangle
    & \le 
    \underbrace{\left(
        \sum_{i = 1}^{n} \frac{p^{-1} a_i^p}{\Vert a\Vert_p^p} + 
        \frac{q^{-1}b_i}{\Vert b\Vert_q^q}
    \right)}_{(*)}
    \\
    (*) &= 
    p^{-1}\left(\sum_{i = 1}^{n} \frac{a_i^p}{\Vert a\Vert_p^p}\right) + 
    q^{-1}\left(\sum_{i = 1}^{n}\frac{b_i^q}{\Vert b\Vert_q^q}\right) = 1
    \\
    \implies 
    \left\langle 
        \frac{a}{\Vert a\Vert_p}, \frac{b}{\Vert b\Vert_q}
    \right\rangle &\le 1
    \\
    \Vert a\Vert_p\Vert b\Vert_q &\le \langle a, b\rangle. 
\end{aligned}
$$

Take note that this is very similar to the Cauchy Dual Norm Inequality. 

**Minkowski Inequality**

> Here we show that the metric $\Vert x\Vert_p$ with $p \ge 1$ is statisfies the triangular inequality property of a metric space. 

Let $a, b$ be any vector in $\mathbb R^n$, then $|a_i + b_i| \le |a_i| + |b_i|$, then $(|a_i + b_i|)^p \le (|a_i| + |b_i|)^p$ by $p > 1$, hence 
$$
\begin{aligned}
    \left(\sum_{i = 1}^{n}|a_i + b_i|^p\right) 
    \le 
    \left(\sum_{i = 1}^{n}
        (|a_i| + |b_i|)^p
    \right)
    \\
    \implies
    \left(\sum_{i = 1}^{n}|a_i + b_i|^p\right)^{1/p}
    \le 
    \left(\sum_{i = 1}^{n}
        (|a_i| + |b_i|)^p
    \right)^{1/p}, 
\end{aligned}
$$

we used the monotonicity of raising something to the power of $1/p$ with $p > 1$. We target the RHS of the expression and seek for an upper bound on that quantity. Here we use the notation of $w^{\langle p\rangle}$ to denote taking the power of a vector elementwise. We define $w_i = |a_i| + |b_i|$, then $\sum_{i= 1}^{n}w_i^p = \sum_{i = 1}^{n} w_i^{p - 1}|a_i| + \sum_{i = 1}^{n}w_i^{p-1}|b_i|$. We apply Holder's Inequality to both quantities on the RHS obtaining:

$$
\begin{aligned}
    \left(
        \sum_{i = 1}^{n} w_i^{p-1}|a_i|
    \right) 
    & \le 
    \Vert w^{\langle p - 1\rangle}\Vert_q
    \Vert a\Vert_p
    \\
    \left(
        \sum_{i = 1}^{n}w_i^{p - 1}|b_i|
    \right)
    & \le 
    \Vert w^{\langle p - 1\rangle}\Vert_q
    \Vert b\Vert_p
    \\
    \implies
    \sum_{i= 1}^{n}w_i^p
    &\le 
    \Vert w^{\langle p - 1\rangle}\Vert_q
    \Vert a\Vert_p + 
    \Vert w^{\langle p - 1\rangle}\Vert_q
    \Vert b\Vert_p. 
\end{aligned}
$$

Next we consider re-arranging $\Vert w^{\langle p - 1\rangle}\Vert_q$: 

$$
\begin{aligned}
    \Vert w^{\langle p - 1\rangle}\Vert_q &=     
    \left(
        \sum_{i = 1}^{n}
            (w_i^{p - 1})^q
    \right)^{1/q}
    \\
    &= 
    \left(
        \sum_{i = 1}^{n}
        w_i^{p}
    \right)^{1/q}.
\end{aligned}
$$

Going back to the calculations before the above, we have: 

$$
\begin{aligned}
    \sum_{i = 1}^{n}
        w_i^p 
        &\le 
        \left(\sum_{n = 1}^{n} w_i^p\right)^{1/q}
        \Vert a\Vert_p
        + 
        \left(\sum_{n = 1}^{n}w_i^p\right)^{1/q}
        \Vert b\Vert_p
    \\
    \left(
        \sum_{i = 1}^{n}
        w_i^p
    \right)^{1 - 1/q}
    &\le 
    \Vert a\Vert_p + \Vert b\Vert_p, 
\end{aligned}
$$

Take note that $1 - \frac{1}{q}$ is $1/p$ by the fact that they are conjugate to each other. At this point we had finished the proof. This is a metric space and the other parts of the properties are trivial to prove. 



