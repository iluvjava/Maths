[Measuring Rate of Convergence](../../AMATH%20515%20Optimization%20Fundamentals/Gradient%20Descend/Measuring%20Rate%20of%20Convergence.md)


---
### **Intro**

We show the convergence of fixed point iterations for function of type $\mathbb R \mapsto \mathbb R$. By the way, the whole thing is just am example of Banach contraction. See [Banach Contraction in Metric Space](../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md) for a more abstract version of the below theories. 

---
### **Thm-1 | Existence of a Fixed Point via Self-Map**
> Let $f: \mathbb R\mapsto \mathbb R$ be a continuous function, suppose that the range of the function $f$ over an interval $[a, b]$ is in $[a, b]$, written like $\text{rng}_{[a, b]}(f)\subseteq [a, b]$, then there exists a fixed point $s\in [a, b]$ for $f$, satisfying $f(s) = s$. 

**Proof**: 

If the fixed point is of either $a, b$, then we are done. We now assume that that $s\neq a, b$ is not the fixed point. Consider $g(x) = x - f(x)$, By the self-map property consider $g(a) = a - f(a), g(b) = b - f(b)$, then $f(a) \in [a, b], f(b) \in [a, b]$, hence $g(a) = a - f(a) \le 0, g(b) = b - f(b) \ge 0$. By IVT, we have [Intermediate Value Theorem](../Analysis/Intermediate%20Value%20Theorem.md), therefore $\exists s \in [a, b]$ such that $g(s) = 0$, hence $f(s) = s$. The fixed point exists in the interval. 

**Remark**
THis is also known as Brouwer’s ﬁxed point theorem in $\mathbb R$.


---
### **Thm-2 | Contraction and Uniqueness**

> Let $f(x): \mathbb R\mapsto \mathbb R$ and it has the self-map property and it's continuous, additionally, assume that $f$ is a contraction over $[a, b]$, meaning that it's Lipschitz continuous with a constant that is strictly less than zero then the fixed point has to be unique. 

**Proof**

Choose any 2 points $s_1, s_2$ in $(a, b)$, suppose they are not fixed points so that $|s_1 - s_2| \neq 0$, then 

$$
\begin{aligned}
    & |f(s_1) - f(s_2)| \le L|s_1 - s_2| < |s_1 - s_2|
    \\
    \iff &
    \frac{|f(s_1) - f(s_2)|}{|s_1 - s_2|} \le L < 1
    \\
    \text{by fixed point }\implies &
    \frac{|s_1 - s_2|}{|s_1 - s_2|} < 1,
\end{aligned}
$$

which is a contradiction, therefore it must be the case that $|s_1 - s_2|\neq 0$. This is essentially the.


---
### **Thm-3 | Convergence Rate of the Fixed Point Iterations**

> If a mapping $f: \mathbb R\mapsto R$ is a self-map over an iterval and it's also a contraction, then the sequence $(x_n)_{n\in \mathbb N}$ produced by the fixed point iterations on the mapping will be converging to the fixed point, and it does it at a linear rate. 

**Proof:**

From previous theorem $s$, a fixed point exists for $f$ in $[a, b]$, and let $L < 1$ be the Lipschitz Constant then: 

$$
\begin{aligned}
    |f(s) - f(x_n)| &\le L |f(s) - x_n|
    \\
    |s - x_{n + 1}| &\le L|s - x_n|
    \\
    \implies 
    |s - x_{n + 1}| &\le L^n|s - x_0|,
\end{aligned}
$$

where, $x_0$ is the initial condition for the fixed point iterations. By $L < 1$, we have $\lim_{n\rightarrow \infty}|s - x_n| = 0$, hence the sequence converges, dividing both side on the second inequaly of above yield the same formula from the definition of a linear convergence. 

**Remark**: 

The lipschitz constant is an upper bound for the absolute value of the derivative over the interval when the function is known to be differentiable. 

---
### **Thm-4 | Sufficient Conditions for Convergence**
> Let $f:\mathbb R\mapsto \mathbb R$, if $s$ is known to be a fixed point and $f$ is a contraction over $[s - \delta, s + \delta]$ for some $\delta > 0$, then the fixed point iteration converges. 

**Proof**

choose any $x\in [s - \delta, s + \delta]$,using the definition of a fixed pont, we have: 

$$
\begin{aligned}
    |g(x) - s| \le L |x - s| < |x - s| \implies g(x) \in (x - \delta, x+ \delta). 
\end{aligned}
$$



---
### **Thm-5 | Second Order Convergence**

> Suppose that $g$ is a contraction in $[s - \delta, s + \delta]$ and $s$ is a fixed point. Assuming that the second derivative $g''$ is bounded on the interval $[s - \delta, s + \delta]$ and fixed deriative $g'$ exists and $g'(s) = 0$, then the fixed point iteration converges, super linearly. 


**Proof**: 

Let $x_n$ be the sequences produced by the fixed point iteration then using Tayler's theorem, there exists $\xi_n \in [x - \delta, x + \delta]$ such that: 

$$
\begin{aligned}
    g(x_ n) &= g(s) + g'(s)(x - s) + \frac{g''(\xi_n)}{2} (x_n - s)^2
    \\
    g(x_n) - g(s) &= \frac{g''(\xi_n)}{2} (x_n - s)^2 \quad \text{by } g'(s) = 0
    \\
    \frac{|x_{n + 1} -s| }{|x_n - s|^2} &= \frac{g''(\xi_n )}{2}
    \\
    \lim_{n\rightarrow \infty}
    \frac{|x_{n + 1} - s|}{|x_n - s|^2} 
    &\le 
    \sup_{c \in [x - \delta, x + \delta]} |g''(c)|. 
\end{aligned}
$$

which is the definition of a second order converging sequence. We are done. 