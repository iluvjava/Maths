[[Convergence, Completeness in Metric Space]], 
[[Topology of Metric Space]]

---
### **Intro**

In this section, we show some of the examples where a metric space is not a complete metric space. This is taken from Professor's Wang's Analysis class Homework. When doing real analysis, the example proposed for incomplete spaces were quite limited. However, this time with functional analysis, a precise definition is created, and a metric can be proposed to make all different type of examples. 

To verify that a metric space $(d, X)$ is complete, we identify a sequence $(x_n)_{n\in \N}$ such that it's Cauchy wrt to metric $d$, and then we propose a limit for such a Cauchy sequence and check if it's in the space or not. The limit of the sequence is not related to the metric, while the Cauchyness of the sequence is metric related. 

---
### **Example 1 | Incomplete Arctan Metric for Sequence Space**

> Let $(X, d)$ be a metric space where $X$ is the set of reals, and $d$ is the metric: 
> $$
> \begin{aligned}
>     d(x, y) = \sup_{x\in \R} |\arctan(x) - \arctan(y)|,
> \end{aligned}
> $$
> is incomplete. 

**Proof Preparation**

To show that this is true, we would need to make use of the fact that $\arctan$ has horizontal asymptotes, for any sequence say $x_n = n$, we want to show that $d(x_n, x_m)$ with $m, n > N$ will get always make $d(x_n, x_m)\le \epsilon$. This is true because of the $\arctan$ converges to $\pi/2$. And most importantly we have $x_n\rightarrow \infty$ as $n\rightarrow \infty$, which means that the limit of $x_n\neq \mathbb R$.

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

and this completes the proof and showed that the sequence $x_n$ is indeed Cauchy, since the limit $x_n$ is $\infty$, not part of $\R$, we know that the metric space is incomplete. 

---
### **Example 2 | Incomplete Subspace of $l^\infty$, with Finite many None Zeros**

$l^\infty$ itself is a complete metric space, but one of its dense subspace might not be complete. 

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

and this is a sequence that has finitely many non-zero terms for all $N\in \N$, we show that it's limit is  Cauchy under the metric, but the limit of $x_N$ as $N\rightarrow \infty$, is definitely not part of the subspace $M$ of the metric space because it will have infinitely man zeros. Consider some value of $M, N$: 

$$
\begin{aligned}
    d(x_N, x_M) = \sup_{n\in \N}|(x_N) - (x_M)| \le 
    \frac{1}{\min(M, N)}, 
\end{aligned}
$$

because the first term they differs is $\min(M, N)$, and this difference is the largest in absolute value, by this token, we can choose any $M, N$ such that $\min(M, N) > \epsilon^{-1}$ for all $\epsilon > 0$ to make $\min(M, N)^{-1}\le \epsilon$, then for all $m, n$ such that $\min(m, n)\ge\min(M, N)$, we will have: $d(x_N, x_M) \le \epsilon$. And this completes the proof. This subspace of the metric space is incomplete because the limiting sequence have, infinitely many none zero entries in it. 


---
### **Example 3 | The $l^\infty$ sequence space is Complete**

The $l^\infty$ sequence space is a complete metric space. The metric between 2 elements of the space is $\sup_{n\in N}|x_n -y_n| =: d(x, y)\;\forall x, y\in X$, where $X$ just denotes the space for a sequence. Due to the additional fact that sequences are vectors, we use $\Vert \cdot\Vert_\infty$ ti simplifies the notations for the metric. 

**Claim:**
> The $l^\infty$ metric space is a complete metric space. For all Cauchy sequences of sequence, they must converge to a sequence that is $l^\infty$. 

Let's $(x^{(n)})_{n\in \N}$ be a sequence in $l^\infty$. 

**Strategies**: 
1. Show that for all $i\in \N$, $\lim_{m\rightarrow \infty}x_{i}^{(m)}$ exists and it's bounded, denote that as $\bar x_i$. 
2. Show that, the sequences of pointwise limit, denoted as $\bar x = (\bar x_1, \bar x_2, \cdots)$ is in $l^\infty$. 

**Proof**
We start with: 
$$
\begin{aligned}
    & (x^{(n)})_{n\in \N} \text{ is Cauchy in }  l^{\infty}
    \\
    \iff &
    (\forall \epsilon > 0\; 
    \exists N: (m > n > N \implies \Vert x^{(n)} - x^{(m)}\Vert_\infty \le \epsilon))
    \\
    \iff &
    (\forall \epsilon > 0\; 
    \exists N: (m > n > N \implies \forall i \in \N  \; |x^{(n)}_i - x^{(m)}_i| \le \epsilon))
    \\
    \implies &
    \forall i \in \N:  (x_i^{(m)})_{m\in \N} \text{ is Cauchy in } \mathbb R
    \\
    \iff &
    \exists \bar x_i \in \mathbb R: \bar x_i = \lim_{m\rightarrow \infty} x^{(m)}_i, 
\end{aligned}
$$

Therefore, any cauchy sequence $(x^{(m)})_{m\in \N}$, has a limit for each of its element. Next we consider , $x^{(m)}\in l^{\infty}$, its norm must be bounded, for any $\epsilon > 0$ that is practically small, fix any $m\in \N$: 

$$
\begin{aligned}
    & \Vert \bar x \Vert_\infty \le 
    \underbrace{\Vert \bar x - x^{(m)}\Vert_\infty}_{< \epsilon} + 
    \underbrace{\Vert x^{(m)}\Vert_\infty}_{< \infty}
    \\
    \implies &
    \Vert \bar x\Vert_\infty < \infty, 
    \\
    \iff& 
    \bar x \in l^{\infty}. 
\end{aligned}
$$

therefore we had show in the later part that $\lim_{m\rightarrow \infty} \Vert x^{(m)}\Vert_\infty$ is indeed bounded, for any Cauchy sequence, and each of its element, $x_i^{(m)}$ is indeed $\in \mathbb R$. 

**Reference**: 

Kreyszig Functional analysis textbook, example 1.5-2. 

---
### **Example-4 | l2 Sequence space is complete**

> The $l^2$ sequence space is complete. The $l^2$ sequence space is the sequence squared gives a convergence series. 

**Proof**
Let $(y^{(m)})_{m\in \mathbb N}$ be a Cauchy sequence in $l^2$, from the definition of the Cauchy sequence we have: 

$$
\begin{aligned}
    &
    \forall \epsilon > 0 \; \exists N_\epsilon: (
        \min(k, l) \ge N_\epsilon \implies 
        \Vert y^{(k)} - y^{(l)}\Vert \le \epsilon
    )
    \\
    & 
    \begin{aligned}
        \implies 
        & \Vert y^{(k)} - y^{(l)}\Vert^2 \le \epsilon^2
        \\
        \iff
        & \sum_{i = 1}^{\infty} (y^{(k)}_i - y^{(l)}_i)^2 \le \epsilon^2
        \\
        \implies 
        &
        (y^{(k)}_i - y^{(l)}_i)^2 \le \epsilon^2 \; \forall i \in \mathbb N
    \end{aligned}
    \\
    \implies 
    & 
    \forall \epsilon > 0 \; 
    \exists N_\epsilon: (
        \min(k, l) \ge N_\epsilon \implies 
        \forall i \in \mathbb N: 
        (y^{(k)}_i - y^{(l)}_i) \le \epsilon
    )
    \\
    \implies 
    & \lim_{n\rightarrow \infty} \forall i \in \mathbb N :
    y_i^{(m)} = y_i \in \mathbb R \quad \text{ completeness of reals}, 
\end{aligned}
$$

The limit exists for each of the element for $y^{(m)}$. From Cauchy of $(y^{(m)})_{m\in \mathbb N}$. Using all these limit we make the limit vector $y = (y_1, y_2, \cdots)$. Next, we show that the limit vector is in $l^2$, it's squared summable. To see that we have: 

$$
\begin{aligned}
    &
    \left|
        \Vert x^{(k)}\Vert - \Vert x^{(l)}\Vert
    \right| \le \Vert x^{(k)} - x^{(l)}\Vert \le \epsilon
    \\
    \implies & 
    \Vert x^{(k)}\Vert \text{ is Cauchy in } \mathbb R
    \\
    \iff  & (\Vert x^{(n)} \Vert)_{n\in \mathbb N} \text{ converges}. 
\end{aligned}
$$

Therefore, the norm of the limit of the sequence is indeed bounded in norm. Therefore, the space of $l^2$ is a complete space. 

**Remarks**

The $l^2$ space is also a Hilbert space, it's also isomorphic to all the other Hilbert spaces that are separable. It's an very important entity. 


---
### **Quick and Dirty Incomplete Spaces**

Examples with not too much explanations. 

**Example | $\mathbb Q$, Vector space**: 
> The set $\mathbb Q$ equipped with $|\cdot|$ is not complete, because the limit of a sequence of rationals can easily become an irrational number. 

Therefore, this is an incomplete metric space. 

**Example | Polynomials, Vector space**
> Let $X$ be the set of polynomial on a closed interval $[a, b]$, then the metric $\Vert \cdot\Vert_\infty$ is incomplete. 

Any polynomial that converges uniformly to some real function $f$ on $[a, b]$ that is not a polynomial is an example of a Cauchy sequence that punch a hole in this set after the limit by converging to a function that is not polynomial. Uniform convergence is need for this metric: $\Vert \cdot\Vert_\infty$ so that the metric of the sequence is Cauchy But as we know that not all uniform limit of Polynomials can provide us with a polynomials. Therefore this is incomplete. 
- Polynomial Uniformly converges to a non-polynomial. ([[../Weierstrass Approximation Theorem]]) But the limit is a continuous function nonetheless. 
- Uniform convergence -> Cauchy sequences in the $\Vert \cdot\Vert_\infty$ metric. 
- But the limit is not a polynomial. 

**Example | Continuous Function, Vector space**

> Let $(X, d)$ be metric space where $X$ is the set of functions that is continuous on $[0, 1]$. Let $d$ be the $\Vert \cdot\Vert_1$ metric for functions. 

The space is incomplete, consider the function $f_m(x)$ parameterized by $m \le 1/2$ defined as the following: 

$$
\begin{aligned}
    f_m(x) = \begin{cases}
        0 & x \in [0, 1/2),
        \\
        \min(x/m, 1) & x\in (1/2, 1] 
    \end{cases}
\end{aligned}
$$
then this function is converging as $m \rightarrow 0$ under the metric, however, this function is piece-wise linear at $x=1/2$, the limiting sequence of the function will be: 

$$
\begin{aligned}
    \lim_{m\rightarrow \infty}f_m(x)
    = \begin{cases}
        0 & x \in [0, 1/2)
        \\
        1 & x\in (1/2, 1] 
    \end{cases}
\end{aligned}
$$

a discontinuous function if we insist on taking the limit $m\rightarrow \infty$. 