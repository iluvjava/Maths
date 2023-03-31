[[Banach Space Introduction]]


---
### **Incomplete Banach Space Completion**

**Claim**: 
> Let $(X, \Vert \cdot\Vert)$ be an incomplete normed space. Then there exists a Banach space $\hat X$ that is $X$ is isometric to a dense subspace of $\hat X$, where $\hat X$ is called the completion of $X$ and is unique up to isometries. 

**Observations**: 

The isometry is about the vector space. An example where we can use to complete the metric space $l^\infty$ is [[Examples of Incomplete, Complete Metrics Space]], example 2. All the possible limit of sequences in the metric space will complete the space giving it closure. In the same section, one can also complete the space of polynomials over a closed interval to any continuous function to form a complete metric space (also a vector space) to form a Banach space. 

---
### **Series Convergence Types in Banach Space**

> **Definition**
> Let $(x_n)$ be a sequence in $(X, \Vert \cdot\Vert)$ (a normed vector space), then the series: 
> 1. Converges to $x$ when $\lim_{n\rightarrow \infty} \sum_{i = 1}^nx_i = x$. 
> 2. Converges absolutely when $\lim_{n\rightarrow \infty}\sum_{i = 1}^{n} \Vert x_i\Vert$ converges. 

**Facts**: 
Type (1) means type (2), but in general a type (2) convergence doesn't mean convergence for the first type, in a general normed vector space because of incompleteness. 

**Example**: 

Here we define $c_{0, 0}$ be a sequence subspace of $l^\infty$ where $c_{0, 0} := \{x_1, x_2, \cdots, x_n, 0, 0, 0, \cdots\}$, it has finitely many nonzeros terms in it. This is a Banach space it's not hard to show that. Let the sequence $\eta^{(n)}_i$ be: 
$$
\begin{aligned}
    \eta_{i}^{(n)} &=
    \left.
    \begin{cases}
        1/n^2 & i = n
        \\
        0 & \text{else}
    \end{cases} 
    \right\rbrace
    \implies \sum_{i = 1}^{\infty} \Vert \eta^{(i)}\Vert 
    = \frac{\pi^2}{6}, 
    \\
    \text{but } &
    \sum_{i = 1}^{\infty}
    \eta^{(i)} \not\in c_{0, 0}, 
\end{aligned}
$$

which serves as an example to illustrate that absolute convergence doesn't work with an complete metric subspace. 

**Theorem: Completeness and Absolute Convergence**
> A normed vector space $(X, \Vert \cdot\Vert)$ is complete if and only if every absolute convergence series converges. 

**Proof**:

For $\implies$, let the space $X$ be complete, and $(x_n)_{n\in \N}$ be a sequence that forms an absolute convergence series, meaning that: 

$$
\begin{aligned}
    & \lim_{N \rightarrow \infty}\sum_{n = 1}^{N}\Vert x_n\Vert \text{ exists}
    \\
    & S_N = \sum_{n = 1}^{N} x_n,
    \\
    N > M\implies & 
    \Vert S_N - S_M\Vert 
    = 
    \left\Vert 
        \sum_{i = N + 1}^{M} x_n
    \right\Vert \le 
    \sum_{i = N + 1}^{M} \Vert x_n\Vert
    \\
    \implies & 
    \lim_{M \rightarrow \infty}
    \Vert S_N - S_M\Vert = 0 \text{ by series convergence}, 
\end{aligned}
$$

therefore, the vector sequence $S_N$ is now Cauchy, and by completeness of the space $X$, this sequence will converge to a limit in $X$. 

For $\impliedby$, we show that a space is complete, we need that any Cauchy sequence is converging to some point in the space. Choose any Cauchy sequence $x_n$, we make use of its absolute convergence property, by selecting a sequence of epsilon values: $1/2, 1/4, \cdots, 1/2^k$, giving us: 

$$
\begin{aligned}
    & \exists N_1:\; m > n \ge N_1 \implies \Vert x_n - x_m\Vert < 1/2
    \\
    & \exists N_2:\; m > n \ge N_2\implies \Vert x_n - x_m\Vert < 1/4
    \\
    &\quad  \vdots
    \\
    & \exists N_k :m> n \ge N_k \implies 
    \Vert x_n - x_m\Vert < 1/2^k, 
    \\
    & \quad \vdots
\end{aligned}
$$

for each case we take $n = N_k, m = N_k + 1$, summing them all up we have: 

$$
\begin{aligned}
    &\sum_{k = 1}^{\infty}
    \Vert x_{N_{k + 1}} - x_{N_k}\Vert < 1
    \\
    & \lim_{t\rightarrow \infty}\sum_{k = 1}^{t}x_{N_{k + 1}} - x_{N_k} = \bar x \text{ by statement hypothesis}
    \\
    \implies &
    \lim_{t\rightarrow \infty} x_{N_t} - x_{N_1} = \bar x \text{ telescope}
    \\
    \implies &
    \lim_{t\rightarrow \infty} x_{N_{t -1}} = x_{N_1} + \bar x, 
\end{aligned}
$$

therefore, any Cauchy sequence in the space can converge to a point that is well defined as well. Therefore, the space $(X, \Vert \cdot\Vert)$ is complete. 



**Remarks**:



---
### **Important Examples**

These examples teach a story about Banach Space in general. 

**Example 1: $(l^\infty, \Vert\cdot \Vert_\infty)$ is a Banach Space**
> We verify that $(l^\infty, \Vert\cdot \Vert_\infty)$ is a space. 

**Want to show**: 
- The space $l^\infty$ will need to be a vector space. This is easy, we skip this part. 
- The norm $\Vert \cdot\Vert_\infty$ will have to be a norm. This is easy, we skip this part. 
- The underlying metric space is complete. We show this part. 

Recall that a metric space is complete when every Cauchy sequences converges to a point that is in the space. To show that we need that the limit of the sequence to be bounded as well, and it exists as a real number too. See [[Examples of Incomplete, Complete Metrics Space]], Example 3


