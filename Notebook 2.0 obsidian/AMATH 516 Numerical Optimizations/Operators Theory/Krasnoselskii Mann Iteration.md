- [Nonexpansive Operator](Lipschitz%20Operator%20in%20Hilbert%20Space.md)
-[Fejer's Monotone](Fejer's%20Monotone.md)


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

The iterations chains up a series of averaged operators,  by taking the convex combinations between $I$  the identity and the non-expansive operator $T$. 
The fixed point set is assumed to exist. 
Recall that if we have the condition that $D$ is a bounded set, then we can remove the existence assumption of the fixed point set. 


**Proof**

To prove (1), take $y \in \text{Fix} T$ by the assumption that the fixed point set is non-empty, the consider the distance to the fixed point 

$$
\begin{aligned}
    \left\Vert
         x_{n + 1} - y
    \right\Vert^2
    &=  \Vert (1 - \lambda_n) x_n + \lambda_n Tx_n - y\Vert^2
    \\
    &= \Vert (1 - \lambda_n)(x_n - y) + \lambda_n (Tx_n - y)\Vert^2 , \quad \text{ by } -1 = \lambda_n - 1 - \lambda_n
    \\
    \text{Use cute formula: }& 
    \\
    &= 
    (1 - \lambda_n)\Vert x_n - y\Vert^2 + \lambda_n\Vert Tx_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 
    \\
    &\le 
    (1 - \lambda_n)\Vert x_n - y\Vert^2
    + 
    \lambda_n\Vert x_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 
    \\
    &= 
    \Vert x_n - y\Vert^2
    - \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 
    \\
    &\le \Vert x_n - y\Vert^2, 
\end{aligned}
$$

here, we used the property that the operator $T$ is non-expansive, and hence it's non-expansive wrt to the fixed point $y \in \text{Fix}(T)$ as well. 
As a consequence of the above claim, we see that the sequence $x_n$ is F-monotone wrt to the set $\text{Fix } T$. 
Moreover, we may re-arrange the second last line of the results, which introduce a term that describes exactly how much error we get between the distance of $x_n$ against the fixed point $y$: 

$$
\begin{aligned}
    \lambda_n(1 - \lambda_n) \Vert x_n - Tx_n\Vert^2 &\le 
    \Vert x_n - y\Vert^2  - \Vert x_{n +1}- y\Vert^2
    \\
    \text{Telescoping the series: }&
    \\
    \implies 
    \sum_{ n =0}^{N} \lambda_n(1 - \lambda_n) 
    \Vert x_n - Tx_n\Vert^2
    &\le 
    \Vert x_0 - y\Vert^2 
    < \infty .
\end{aligned}
$$

The squared term summed up with weights $\lambda_n (1 - \lambda_n)$ of all the successive error is finite. 
Which doesn't mean that the total distance of the trajectory is finite, but this is enough to show condition (2). 
Consider the successive error between the iterates we have that: 

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

Here, we made use of the non-expansiveness of operator $T$, and we showed that the successive distance between each of the iterats are monotonically decreasing. 
Since distance non-negative, this monotone decreasing sequence must be bounded below hich means that $\Vert x_n - Tx_n\Vert\searrow 0$ and let $l$ be its limit. 
We show by contradiction that, it must be the case that $l = 0$, for a proof by contradiction we assume that $l > 0$, with that we consider the summation with $N \in \mathbb N$, we have 

$$
\begin{aligned}
    \infty > \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n)\Vert x_n  - Tx_n\Vert^2 
    &\ge 
    l^2 \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n). 
\end{aligned}
$$

taking $N \rightarrow \infty$, we arrive at the contradiction. 
Therefore it must be that $l = 0$.
Therefore we have $\lim_{n\rightarrow \infty} \Vert Tx_n - x_n\Vert = 0$ and this condition is equivalent to the strong convergence of $Tx_n - x_n \rightarrow \mathbf 0$. 

Since $x_n$ is F-Monotone wrt to the set $\text{Fix }T$, there exists a subsequence $x_{n_k}$ that has weak limit $\bar x$. 
This means 

$$
\begin{aligned}
    & x_{n_k}\rightharpoonup \bar x, 
    \\
    & Tx_{n_k} - x_{n_k} \rightarrow \mathbf 0, 
\end{aligned}
$$

using the property of Demi-closure of a non-expansive operator the limit of the subsequence converges to $\bar x \in \text{Fix } T$, by F-Monotone convergence of the sequence, all the clusters point must be also in $\text{Fix }T$. 


---
### **Convergence rate**

We are interested in the rate of convergence for the fixed point error $Tx_n - x_n$. 

#### **Thm | The Convergence of Kransnoselkii Mann**
> The convergence rate of the normed error vector: $\Vert x_n - Tx_n\Vert$, decreases at the rate of $\mathcal O(\sum_{i = 0}^{n}\lambda_n(1 - \lambda_n)^{1/2})$. 


**Proof**

Recall from monotonicity of the fixed point error, which is $\Vert x_{n + 1} - Tx_{n + 1}\Vert \le \Vert x_n - Tx_n\Vert$. 
With that, we reconsider the telescoping sum which gives 

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
    \Vert x_0 - y\Vert^2
    &\ge 
    \left(
        \sum_{n = 0}^{N}\lambda_n(1 - \lambda_n)
    \right)\Vert x_N  - Tx_N\Vert^2
    \\
    \frac{\Vert x_0 - y\Vert}{\left(
        \sum_{n = 0}^{N} \lambda_n(1 - \lambda_n)
    \right)^{1/2}} &\ge 
    \Vert x_N - Tx_N\Vert. 
\end{aligned}
$$


---
### **Corollaries, and Misc Results**

We state results of applying KM iterations to averaged operator. 
Because averaged operator is a subclass of non-expansive operator, it allows for a of $\lambda_n$ in a larger rage. 