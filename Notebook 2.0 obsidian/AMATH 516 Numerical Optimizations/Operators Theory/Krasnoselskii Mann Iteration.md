- [Nonexpansive Operator](Lipschitz%20Operator%20in%20Hilbert%20Space.md)
- [Fejer's Monotone](Fejer's%20Monotone.md)


---
### **Intro**

This is a fixed point iterations that aims to find the fixed point of a non-expansive operator in Hilbert space by averaging the operator at each step of the iterations. 


#### **Thm | Kransnoselkii - Mann Iterations**
> Let $T: D \mapsto D$ be non-expansive, with $D \neq \emptyset$, closed and convex in Hilbert space $\mathcal H$. 
> Suppose that $\text{Fix}(T) \neq \emptyset$, $\lambda_n$ lies in $[0, 1]$, and $\sum_{n = 0}^{\infty}\lambda_n(1 - \lambda_n) = \infty$, Let $x_0 \in D$, we define the iterations: 
> $$ x_{n + 1} := (1 - \lambda_n)x_n + \lambda_n Tx_n, $$
> then the following are all true: 
> 1. $x_n$ is F-mono wrt set $\text{Fix}(T)$. 
> 2. $x_n - Tx_n \rightarrow \mathbf 0$, the convergence of the error to zero is strong. 
> 3. $x_n \rightharpoonup \bar x \in \text{ Fix}T$. The sequence converges to a point in the fixed point set of the operator weakly. 

**Observations**

When $D$ is a bounded set, theorem holds after if the existence assumption of the fixed point set is removed because fixed point set of non-expansive operator is convex (By a theorem in [Nonexpansive Operator in Hilbert Space](Lipschitz%20Operator%20in%20Hilbert%20Space.md)). 


**Proof**

To prove (1), take $y \in \text{Fix}\;T$ by non-empty assumption.
Consider

$$
\begin{aligned}
    \left\Vert
         x_{n + 1} - y
    \right\Vert^2
    &=  \Vert (1 - \lambda_n) x_n + \lambda_n Tx_n - y\Vert^2
    \\
    &= \Vert (1 - \lambda_n)(x_n - y) + \lambda_n (Tx_n - y)\Vert^2 , \quad \text{ by } -1 = \lambda_n - 1 - \lambda_n 
    \\
    &= 
    (1 - \lambda_n)\Vert x_n - y\Vert^2 + \lambda_n\Vert Tx_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2  
    \quad 
    \text{Cute formula}
    \\
    &\le 
    (1 - \lambda_n)\Vert x_n - y\Vert^2
    + 
    \lambda_n\Vert x_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 
    \quad \text{Nonexpansive}
    \\
    &= 
    \Vert x_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 
    \le \Vert x_n - y\Vert^2. 
\end{aligned}
$$

The above says $x_n$ is F-monotone wrt to the $\text{Fix } T$. 
Moreover: 

$$
\begin{aligned}
    \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 &\le 
    \Vert x_n - y\Vert^2  - \Vert x_{n +1}- y\Vert^2
    \\
    \implies 
    \sum_{ n =0}^{N} \lambda_n(1 - \lambda_n) 
    \Vert x_n - Tx_n\Vert^2
    &\le 
    \Vert x_0 - y\Vert^2 - \lim_{n\rightarrow \infty} \Vert x_{n + 1} - y\Vert^2
    < \infty. 
    \quad \text{Telescope}
\end{aligned}
$$

Above shows $x_{n + 1} - x_n \rightarrow \mathbf 0$. 
We had shown condition (2). 
It remains to show $x_n \rightharpoonup \text{Fix}\; T$. 
Consider: 

$$
\begin{aligned}
    \Vert x_{n + 1} - Tx_{n + 1}\Vert 
    &= 
    \Vert 
        (1 - \lambda)x_n - \lambda_n Tx_n - Tx_{n + 1}
    \Vert
    \\
    &= 
    \Vert 
        (1 - \lambda_n)(x_n - Tx_n) + (Tx_n - Tx_{n + 1})
    \Vert
    \\
    &\le 
    (1 - \lambda_n)\Vert x_n - Tx_n\Vert + \Vert Tx_n - Tx_{n + 1}\Vert
    \\
    &\le 
    (1 - \lambda_n)\Vert x_n - Tx_n\Vert + \Vert x_n - x_{n + 1}\Vert
    \\
    &= 
    \Vert x_n - (1 - \lambda_n)x_n - \lambda_n Tx_n\Vert 
    + 
    (1 - \lambda_n)\Vert x_n - Tx_n\Vert
    \\
    &= 
    \lambda_n \Vert x_n - Tx_n \Vert + (1 - \lambda_n)\Vert x_n - Tx_n\Vert
    \\
    &= \Vert x_n - Tx_n\Vert. 
\end{aligned}
$$ 
Therefore $\Vert x_n - Tx_n\Vert \rightarrow l \ge 0$ by monotone convergence. 
We want to show $l = 0$, for contradicition let $l > 0$ then it has contradiction: 

$$
\begin{aligned}
    \infty > \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n)\Vert x_n  - Tx_n\Vert^2 
    &\ge 
    l^2 \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n). 
\end{aligned}
$$

Therefore $\lim_{n\rightarrow \infty} \Vert Tx_n - x_n\Vert = 0$ and is equivalent to strong convergence: $Tx_n - x_n \rightarrow \mathbf 0$. Since $x_n$ is F-Monotone wrt to the $\text{Fix }T$, there exists a subsequence $x_{n_k}$ with weak limit $\bar x$. 
This means 

$$
\begin{aligned}
    & x_{n_k}\rightharpoonup \bar x, 
    \\
    & Tx_{n_k} - x_{n_k} \rightarrow \mathbf 0.
\end{aligned}
$$

By Demi-closure of a non-expansive operator, $\bar x \in \text{Fix } T$.
By F-Monotone convergence of the sequence, $x_{n}\rightarrow \bar x$. 

**Remarks**

$(1 - \lambda_n)x_n + \lambda_n Tx_n$ is an averaged mapping. 
See [Averaged Mapping](Averaged%20Mapping.md) for more. 

---
### **Convergence rate**

We are interested in the rate of convergence for the fixed point error $Tx_n - x_n$. 

#### **Thm | The Convergence of Kransnoselkii Mann**
> The convergence rate of the normed error vector: $\Vert x_n - Tx_n\Vert$, decreases at the rate of $\mathcal O(\sum_{i = 0}^{n}\lambda_n(1 - \lambda_n)^{1/2})$. 


**Proof**

Recall $\Vert x_{n + 1} - Tx_{n + 1}\Vert \le \Vert x_n - Tx_n\Vert$ from the previous proof under which is stated under the same setting. 
Reconsider the telescoping sum: 

$$
\begin{aligned}
    \Vert x_0 - y\Vert^2 
    &\ge 
    \sum_{n = 0}^{N}\lambda_n(1 - \lambda_n)\Vert x_n - Tx_n\Vert^2
    \ge 
    \left(
        \sum_{n = 0}^{N}\lambda_n(1 - \lambda_n)
    \right)\Vert x_N  - Tx_N\Vert^2
    \\
    \implies
    \frac{\Vert x_0 - y\Vert}{\left(
        \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n)
    \right)^{1/2}} &\ge 
    \Vert x_N - Tx_N\Vert. 
\end{aligned}
$$

**Remarks**

This theorem doesn't describe the proximal point method with varying stepsizes, or gradient descent with Lipschitz smoothness and strong convexity. 


---
### **Corollaries, and Misc Results**

We state results of applying KM iterations to averaged operator. 
Because averaged operator is a subclass of non-expansive operator, it allows for a of $\lambda_n$ in a larger rage. 