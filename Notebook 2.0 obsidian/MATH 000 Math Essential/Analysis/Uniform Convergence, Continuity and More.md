[Real Analysis Basics](Real%20Analysis%20Basics.md)


---
### **Intro**

Uniform convergence models the limit of a sequence of functions. It's slightly stronger than pointwise convergence and it has more desirable properties and theorems. Intuitively it tells us that all points in the output of the function approaches the limit together, instead of one by one. Review the definition for uniform convergence in the file linked above. For determining type of convergence of a function, visit: [Weierstrass M-Test](Weierstrass%20M-Test.md) for more information. 

#### **Thm | Uniform Cauchy Convergence is Uniform Convergence**

> A sequence of function $f_n$ is uniformly Cauchy convergence on the interval $D$ when for all $\epsilon > 0$ there exists $N_\epsilon \in \mathbb N$ such that when $n \ge N_\epsilon$ we have $\Vert f_n - f_m\Vert_D < \epsilon$, then the function converges uniformly to a limit function. 

**Proof**
$$
\begin{aligned}
    & \forall \epsilon > 0\; \exists N_\epsilon : m > n > N_\epsilon \implies \sup_{x \in D}
    \Vert f_n(x) - f_m(x)\Vert 
    < \epsilon
    \\
    \implies & 
    \forall k\ge 0, x \in D, (|f_n(x) - f_{n + k}(x)|)_{k\in \mathbb N} \text{ is Cauchy}, \text{ let }f(x): D\mapsto \mathbb R := \lim_{k\rightarrow \infty} f_{n + k}(x)
    \\
    \implies & 
    x\in D: \lim_{l \rightarrow \infty} |f_n(x) - f_{n + k}(x)| \le \epsilon
    \\
    \implies&
    x \in D: |f_n(x) - f (x)| \le \epsilon
    \\
    \iff & \Vert f_n - f\Vert_D \le \epsilon, 
\end{aligned}
$$

finally, for arbitrary small $\epsilon > 0$ we have $n > N_\epsilon$ that is smaller, hence $\lim_{n\rightarrow \infty} \Vert f_n - f\Vert_D  = 0$, hence, the function approach limit $f$ on the set $D$ uniformly. 


---
### **Uniform Convergence Preserves Continuity**

Only a specific type of convergence preserves the continuity for functions. 


> If the function $f_n$ converges to $f$ uniformly on the region $D$, then the resulting function $f$, and the function $f_n$ is continuous for all $n\in \mathbb N$, then the resulting function $f$ will be a continuous function. 


**Proof**

The proof is direct. When $f_n\rightarrow f$ uniformly. We define $\Vert g\Vert_D = \sup_{x\in D}|g(x)|$, and considering the continuity of function $f$ using 2 points $x_1, x_2 \in A$ (We will specify the condition for the choice later): 

$$
\begin{aligned}
    |f(x_1) - f(x_2)| 
    &\le |f(x_1) - f_n(x_1)| + |f_n(x_1) - f(x_2)|
    \\
    &\le 
    |f(x_1) - f_n(x_1)| + |f_n(x_1) - f_n(x_2)| + |f_n(x_2) - f(x_2)|, 
\end{aligned}
$$

observe that the term $|f(x_1) - f_n(x_1)|, |f_n(x_2) - f(x_2)|$ can be arbitrary small by the fact that $f_n\rightarrow f$ uniformly, and for the term $|f_n(x_1) - f(x_2)|$ it can also be bounded by arbitrarily choice of $|x_1 - x_2|< \delta$ for some $\epsilon$ so $|f_n(x_1) - f_n(x_2)|$ is as small as we want to be, by the continuity of the function $f_n$. Since both term can be as small as we want to be, the LHS can be as small as we want to be, therefore $f$ is a continuous function. 

**Remark**

The theorem doesn't say anything about preserving uniform continuity of the function. 

**Corollary | Uniform Convergence preserving Uniform Continuity**

> When $f_n\rightarrow f$ uniformly, the limit of the function is also uniform continuous. 

**Proof**

The proof is a very similar flavor as the previous one and we are skipping that. 


---
### **Uniform Convergence of Derivative, Differentiability**

The following theorems are frequently need for power series. To be able to differential a series of function, the uniform convergence of its derivative and the original function must be assured. 

> Let $f_n$ be have continuous first derivative. If $f_n\rightarrow f$ uniformly and $f'_n\rightarrow g$ uniformly, then the limit $f$ is differentiable and $f' = g$. 

**Proof**

Skipped for now. 
