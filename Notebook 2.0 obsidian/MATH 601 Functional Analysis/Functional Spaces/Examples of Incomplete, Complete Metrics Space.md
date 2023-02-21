[[Convergence in Metric Space]]
[[Topology of Metric Space]]

---
### **Intro**

In this section, we show some of the examples where a metric space is not a complete metric space. This is taken from Professor's Wang's Analysis class Homework. When doing real analysis, the examle proposed for incomplete spaces were quite limited. However, this time with functional analysis, a precise definition is created, and a metric can be proposed to make all different type of examples. 

#UNFINISHED

---
### **Example 1**

> Let $(X, d)$ be a metric space where $X$ is the set of reals, and $d$ is the metric: 
> $$
> \begin{aligned}
>     d(x, y) = \sup_{x\in \R} |\arctan(x) - \arctan(y)|,
> \end{aligned}
> $$
> is incomplete. 

**Proof Preparation**

To show that this is true, we would need to make use of the fact that $\arctan$ has horizontal asymptopes, for any sequence say $x_n = n$, we want to show that $d(x_n, x_m)$ with $m, n > N$ will get always make $d(x_n, x_m)\le \epsilon$. This is true because of the $\arctan$ converges to $\pi/2$. And most importantly we have $x_n\rightarrow \infty$ as $n\rightarrow \infty$, which means that the limit of $x_n\neq \mathbb R$.

**Proof**

Consider the sequence $x_n = n$. We know that the limit of $\arctan$ is $\lim_{n\rightarrow \infty} \arctan (n) = \frac{\pi}{2}$, hence, we propose the choose of an integers $N \ge \lceil \tan(\pi/2 - \epsilon)\rceil$ for $0 < \epsilon < \frac{\pi}{2}$. Since the function $\arctan$ is also monotonically increasing, we have: 

$$
\begin{aligned}
    & \forall n > N: 
    \frac{\pi}{2} \ge \arctan(n) \ge \arctan(N)\ge \frac{\pi}{2} - \epsilon, 
\end{aligned}
$$

which will be true if we make another $m \ge N$ as well, combining the 2 we obtain: 

$$
\begin{aligned}
    \begin{cases}
        \frac{\pi}{2} - \epsilon\le \arctan(n) \le \frac{\pi}{2}
        \\
        \frac{\pi}{2} - \epsilon\le \arctan(m) \le \frac{\pi}{2}
    \end{cases}
    \implies
    |\arctan(m) - \arctan(n)| \le \epsilon, 
\end{aligned}
$$

and this comletes the proof and showed that the sequence $x_n$ is indeed Cauchy, since the limit $x_n$ is $\infty$, not part of $\R$, we know that the metric space is incomplete. 

---
### **Example 2: Subspace of $l^\infty$**: 

**Claim**:
> Let $M\subseteq l^\infty$ to be the subset of all the sequences that has finitely many non-zero terms in it. Then this subspace is incomplete in this metric. 

We consider the sequence a sequence $x_N$ parameterized by some natural number $N$ given as: 

$$
\begin{aligned}
    (x_N)_n = \begin{cases}
        1/n & n \le N, 
        \\
        0 & n > N,
    \end{cases}
\end{aligned}
$$

and this is a sequence that has finitely many non-zero terms for all $N\in \N$, we show that it's limit is cauchy under the metric, but the limit of $x_N$ as $N\rightarrow \infty$, is deinitely not part of the subspace $M$ of the metric space. Consider some value of $M, N$: 

$$
\begin{aligned}
    d(x_N, x_M) = \sup_{n\in \N}|(x_N) - (x_M)| \le 
    \frac{1}{\min(M, N)}, 
\end{aligned}
$$

because the first term they differs is $\min(M, N)$, and this difference is the largest in absolute value, by this token, we can choose any $M, N$ such that $\min(M, N) > \epsilon^{-1}$ for all $\epsilon > 0$ to make $\min(M, N)^{-1}\le \epsilon$, then for all $m, n$ such that $\min(m, n)\ge\min(M, N)$, we will have: $d(x_N, x_M) \le \epsilon$. And this completes the proof. This subspace of the metric space is incomplete.