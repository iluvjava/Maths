- [[Metric Space Introduction]], [[Convergence, Completeness in Metric Space]], [l-p Sequence Space](../l-p%20Sequence%20Space.md). Which are the foundations for metric spaces and their properties. 

---
### **Intro**

This is just a generalization for fixed point iterations in $\R$, however, we generalized it to metric spaces and mapping that maps back to the same metric space. The theory is somewhat dull, but the application is fruitful, forming the foundations for a lot of methods in optimizations. 


**Definition | Fixed Point of Operators**: 

> Let $T:X\mapsto X$ where $(X, d)$ gives a complete metric space, then $x\in X$ is a fixed point of $T$ if $Tx = x$. We denote $\text{fix}(T)$ to be the set of fixed point for the operator $T$. 


**Definition | Fixed Point Iterations of Operator**: 

> Let $T: X\mapsto X$ and $x_0\in T$, The fixed point iteration of $T$ is a sequence $(x_n)_{n\in \N}$ defined recursively as: $x_{n} = Tx_{n - 1}$. 

**Definition | Banach Contraction**

> $T$ is a Banach contraction if there exists $\alpha\in [0, 1)$ such that: 
> $$
> \begin{aligned}
>     d(Tx, Ty) \le \alpha d(x, y) \quad \forall x, y \in X
> \end{aligned}
> $$

**Theorem | Banach Fixed Point Contraction Theorem**

> Let $(X, d)$ be <mark style="background: #FF5582A6;">a complete metric space </mark>that is non-empty, let $T:X\mapsto X$ be <mark style="background: #FFF3A3A6;">a contraction</mark> on $X$, then <mark style="background: #ADCCFFA6;">$\text{fix}(T)$ is a singleton</mark>. 

**Observations**: 
- The completeness of the metric space is useful for the existence of a limit that is in the space $X$. 
- A contraction helps wit proving the convergence in the metric space. 

**Proof Preparations**: 

1. Show that the fixed point iterate is a Cauchy sequence. 
2. Show that the limit for the sequence exists. 
3. Show that the fixed point set is non-empty and it equals to the limit of that fixed point iteration sequence. 
4. Show that the fixed point is a unique fixed point. 

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
    & \hspace{0.5em}\vdots
    \\
    &\le \sum_{i = 0}^{k - 1} d(x_{m + i}, x_{m + i + 1}), 
\end{aligned}
$$

where we just applied the triangle inequality for the metric repeatedly (We implicitly assumed $x_n \in X$, its importance is mentioned later in an example), and which it gives us a telescoping summation, upper-bounding the initial quantity $d(x_m, x_n)$. Next, we use the obvious recursive relations from $T$ being a contraction: 

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

whenever we have $n > m$. Now, we have shown that a fixed point iteration on a contractive mapping is producing a Cauchy sequence, and hence, $x_n\rightarrow x$ by the fact that $(X, d)$ is a complete metric space. To show the non-emptiness of the fixed point set we consider: 

$$
\begin{aligned}
    d(x, Tx) &\le 
    d(x, x_m) + d(x_m, Tx) \quad \text{impicitly assumed }Tx \in X
    \\
    &\le
    d(x, x_m) + \alpha d(x_{m - 1}, x)
    \\
    0\le \lim_{m\rightarrow \infty} d(x, Tx) 
    &\le 
    \lim_{m\rightarrow \infty} d(x, x_m) + 
    \alpha d(x_{m - 1}, x) = 0 \quad \text{by }x_m\rightarrow x
    \\
    d(x, Tx) &= 0.
\end{aligned}
$$

Hence we had shown that $x\in \text{fix}(x)$, in the fixed point set of the operator $T$. To show that the fixed point is *unique*, we consider $\bar x$ to be another element from the fixed point set $\text{fix}(T)$ then: 
$$
\begin{aligned}
    d(x, \bar x) &= d(Tx, T\bar x) \le \alpha d(x, \bar x)
    \\
    \implies &
    0 \le (\alpha - 1) d(x, \bar x) \implies d(x, \bar x) \le 0 
    \\
    \implies &
    d(x, \bar x) = 0, 
\end{aligned}
$$

assuming that $\alpha \neq 0$, then it must be the case that $d(x, \bar x) = 0$, at the last step we directly apply the fact that the mapping is a contractive mapping. 

**Remarks**: 

Please reflect on the fact that the contraction property of the operator is not tied to the existence of the fixed point set, one of the implicitly used property for the existence of the fixed point set is that $T:X\mapsto X$, it's a self-map. It's easy to take note if this face, if a contraction is only possible for a subset $Y \subseteq X$, then whenever $Tx_n \not\in Y$, the contraction property fails, converging to a different result (or diverges or whatever). 


---
### **Corollary | Error Bound**

We attained the following error bound estimate from the previous proof: 

$$
\begin{aligned}
    & d(x_m, x) \le \frac{\alpha^m}{1 - \alpha} d(x_0, x_1), \text{aprirori};
    \\
    & d(x_m, x) \le \frac{\alpha}{1 - \alpha}d(x_{m - 1}, x_m), \text{posteri}; 
\end{aligned}
$$

assuming that the metric space is complete, and the mapping for the fixed point iteration is contractive. 

---
### **Misc Theorems**

> A contractive mapping is automatically a continuous mapping. 

**Proof**: 

It's Lipschitz continuous in set $X$ with $L = \alpha\in [0, 1)$, a stronger type of continuity. 

**Theorem | Multiple Contractions**

> Let $T, T_1, T_2$ be contractions with constants $\alpha, \alpha_1, \alpha_2$ respectively then: 
> - $T$ is uniformly continuous on $X$. 
> - If $X$ happens to be a normed vector space, and we have $d(x, y) = \Vert x - y\Vert$, then $(T_1 + T_2)/2$, their averages is also going to be a contractive mapping. 
> - $T_2\circ T_1$, the composite for 2 of the mapping is going to be a contractive mapping as well. 

**Proof**: 

#UNFINISHED

 

---
### **Examples**

We list some examples of Banach Contractions and then state the moral of the stories for then. 

**Example 1 | Differentiable 1D Functions Fixed Point Iterations**

> Let $f: \mathbb R \mapsto \mathbb R$ be differentiable. It's a contraction when $|f'(x)|< 1$, furthermore, if it's a self-map meaning that there exists $[a, b]$ such that $f([a, b])\subseteq [a, b]$, then the Banach Contraction will converge to a fixed point. 

**Proof**: 

We show that it's a contraction. Let $[x, y]$ be any interval, by intermediate value theorem we have: 
$$
\begin{aligned}
    \exists z \in [x, y]: f'(z) &= \frac{f(y) - f(x)}{y - z}, 
    \\
    |f'(x)| < 1 \implies& \left|\frac{f(y) - f(x)}{y - z}\right| < 1,
\end{aligned}
$$

which is the definition of a Banach Contraction. Furthermore, let's assume that on some specific interval $f([a, b])\subseteq [a, b]$, we show that a fixed point exists in $[a, b]$. let it be the case that $f([a, b])=[a', b'] \subseteq [a, b]$, then consider $f(x) - x$, which is again a continuous mapping, we have: 

$$
\begin{aligned}
    & f(a) - a = a' - a \ge 0 
    \\
    & f(b) - b = b' - b \le 0, 
    \\
    \implies \exists & x \in [a, b] : f(x) - x = 0, \text{by IVT}. 
\end{aligned}
$$

Therefore, the fixed point set is non-empty. Finally, one observe the same argument as the contraction in the metric space can be used in this example be cause $g^{m}(x) \in [a, b]\forall x \in [a, b]$, to derive: 

$$
\begin{aligned}
    |g^{m}(x) - g^{m - 1}(x)| \le \alpha|g^{m - 1}(x) - g^{m-2}(x)| \le \cdots\le 
    \alpha^{m - 2}|g(x) - x|, 
\end{aligned}
$$

and then we basically repeated what is stated earlier. We had used the contraction and the self map property to show the convergence of the fixed point iteration. 

**Remarks**: 

Without the self-mapping properties for the operator, which is also implicitly stated at the start ($X\mapsto X$), we cannot make sure the exists of the fixed point set of the opertor. See the next example to see the case where, a fixed point set doesn't exists for an operator due to the lack of a self-mapping properties. 

**Example 2 | Local Contraction and no Fixed Point Set**
> Consdier the function $f = x + 1/x$, we have $\text{fix}(x) = \emptyset$ because $x = x - 1/x$ is not true $\forall x \in \R$, however, this is a contraction because $|f'(x)| = |1 - 1/x^2| < 1$ for all $x \in \R$. 

**Remarks**: 

A contraction that is local without the self mapping properties might not have a fixed point to it. 


**Example | Square Root of Numbers**
> An ancient trick of computing $\sqrt{c}$ is to use the iterations: $(1/2)(x_n + c/x_n)$. Here we show that this is a contraction and it converges to the wanted results as a form of Banach Contraction, and we show the importance of $c > 0$ assuming everything is real. 

**Observation**:

That mapping is actually the [Newton's Method 1D](../../MATH%20464%20Numerical%20Analysis/Newton's%20Method%201D.md) for finding the root $x^2 - c=0$. 

**Proof**: 

The iterative formula is written as $g(x) = (1/2)(x + c/x)$, it's a local contraction and we find the conditions for contraction.  
$$
\begin{aligned}
    g'(x) & = \frac{1}{2}
    \left(
        1 - \frac{c}{x^2}
    \right) < \alpha, \text{where } \alpha \in (0, 1]
    \\
    \iff
    \frac{1}{2}\left(
        1 - \frac{c}{x^2} 
    \right)&\in (-\alpha, \alpha)
    \\
    \iff
    \frac{c}{x^2} - 1 &\in (-2\alpha, 2\alpha)
    \\
    \iff
    1 - 2\alpha &< \frac{c}{x^2} < 1 + 2\alpha.
\end{aligned}
$$

To get a stricter conditions, we cannot assume that $\alpha$ is $> 1/2$ such that $1 - 2\alpha < 0$, therefore, we bring it along and solve the quadratic inequalities to get: 

$$
\begin{aligned}
    1 - 2\alpha & < \frac{c}{x^2} < 1 + 2 \alpha
    \\
    \frac{1}{1 + 2\alpha} &< \frac{x^2}{c} < \frac{1}{1 - 2 \alpha}
    \\
    0 \le \frac{c}{1 + 2\alpha} &< x^2 
    < \frac{c}{1 - 2\alpha} \text{ by } c> 0
    \\
    \iff
    x &\in \left(
        \sqrt{\frac{c}{1 + 2\alpha}}, \sqrt{\frac{c}{1 - 2 \alpha}}
    \right) , 
\end{aligned}
$$

further observe that $g(\sqrt{c}) = \frac{1}{2}(\sqrt{c} + \frac{1}{\sqrt{c}}) = \sqrt{c}$, which is a fixed point. It's not hard to see that $\exists \delta > 0$ with $g((\sqrt{c} - \delta, \sqrt{c} + \delta))\subseteq (\sqrt{c} + \delta, \sqrt{c} - \delta)$, and from the conditions above, it's possible to choose $\delta > 0$ small enough such that a self-map is possible, and, it satisfies the contraction conditions listed above, choose a $\delta > 0$ such that: 

$$
\begin{aligned}
    \exists \delta > 0 : (\sqrt{c} - \delta, \sqrt{c} + \delta) \subseteq 
    \left(
        \sqrt{\frac{c}{1 + 2\alpha}}, \sqrt{\frac{c}{1 - 2 \alpha}}
    \right), 
\end{aligned}
$$

We had verified that this ancient formula for computing the square is a Banach Contraction. For more goodies about fixed point iterations and their theories, visit [Fixed Point Iterations 1D](../../MATH%20464%20Numerical%20Analysis/Fixed%20Point%20Iterations%201D.md) for more information.
