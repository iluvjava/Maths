[[Vector Space]], [[Metric Space Introduction]], [[../../AMATH 584 Numerical Linear Algebra/Matrix Theory/Norm, for Beginners]]

---
### **Banach Space**

[Banach space](https://mathworld.wolfram.com/BanachSpace.html) is a complete, normed, [[Vector Space]]. It is already a [[Metric Space Introduction]]. It's a set of elements that can form a complete  vector space with a norm calculations.  **Note**: The "complete" in this context is referring to closure under Cauchy Sequence, not interpreted as "complete with". If a vector space is normed, but it's not complete, them we just refer to it as "normed space". 

In this section we introduces basics facts and theorems about Banach Spaces and we show some illustrating examples for those concepts. 

**Banach Spaces should have**:
- Vector space with a norm (not necessarily from inner product)
- The vector space is complete (Topological Property)

**Banach is a Metric Space**
> The metric $d(x, y)$ for Banach Space is define as $\Vert x - y\Vert$. The space $X$ is a vector space. 

**Banach But not Hilbert**
> It's implied from the definition, that, there exists instances of Banach Space that is not Hilbert Space. Such a space would have norm that is not defined via inner product, unlike a [[Hilbert Space]] where it has its norm defined via the inner product of elements. 

**Lacks of Inner Product**
> The definition doesn't said anything about  using inner product in the space to define the norm metric. The norm can be independent of the inner product.

**Normed Vector Space but Not Banach**
> These are incomplete normed vector spaces. For examples: $(\Q, |\cdot|), (C[0, 1], \Vert \cdot\Vert_1), (C[0, 1], \Vert \cdot\Vert_2)$. They are incomplete vector spaces. For more details see [[Examples of Incomplete, Complete Metrics Space]]. They have completions for their spaces as $\R, L^1[0, 1], L^{2}[0, 1]$. 

**Example: The Euclidean Space**
> The space ($\R^n, d(x, y):= \Vert x - y\Vert$) is an example of a Banach space because $\mathbb R^n$ is complete, and the p-norm for all the vector there are all equivalent metrics. 

For more information about norm in the real finite vector space, see [[../../AMATH 584 Numerical Linear Algebra/Matrix Theory/Norm, for Beginners]] for more information. 


---
### **Norm as a Metric**

Before we dive deeper, we show that norm is a special type of metrics that contains extra properties that general metric space might not process. These properties are paired up together with some of the computations in vector spaces. 

Suppose that $d(x, y) = \Vert x - y\Vert$ is the metric for our vector space then: 
1. $|\Vert x\Vert - \Vert y\Vert| \le \Vert x - y\Vert$. 
2. $\Vert \cdot\Vert$ is a continuous mapping. And it's has a Lipschitz constant of 1. 
3. For all $x, y, z\in X$, $\alpha > 0$ we have: 
    $$
    \begin{aligned}
        d(x + a, y + a) &= d(x, y)
        \\
        d(\alpha x, \alpha y) &= |\alpha| d(x, y),
    \end{aligned}
    $$
    it experiences translational and scaling invariance. This metric space reflect the underlying topology of Euclidean spaces.

---
### **Incomplete Metric Space Completion**

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

To show that a space is complete, we need to show that any Cauchy sequence is converging to some point in the space. Choose any Cauchy sequence $x_n$, we make use of its absolute convergence property, by selecting a sequence of epsilon values: $1/2, 1/4, \cdots, 1/2^k$, giving us: 

$$
\begin{aligned}
    & \exists N_1\; m > n \implies \Vert x_n - x_m\Vert < 1/2
    \\
    & \exists N_2\; m > n \implies \Vert x_n - x_m\Vert < 1/4
    \\
    & \vdots
    \\
    & \exists N_k > N_{k - 1} \implies 
    \Vert x_n - x_m\Vert < 1/2^k, 
\end{aligned}
$$

using these values of epsilon, we make the series: 

$$
\begin{aligned}
    \sum_{k = 1}^{\infty}
    \Vert x_{N_{k + 1}} - x_{N_k}\Vert &= 1
    \\
    \lim_{t\rightarrow \infty}\sum_{k = 1}^{t}x_{N_{k + 1}} - x_{N_k} &= \bar x \text{ by hypothesis}
    \\
    \implies 
    \lim_{t\rightarrow \infty} x_{N_t} - x_{N_1} &= \bar x \text{ telescope}
    \\
    \implies \lim_{t\rightarrow \infty} x_{N_{t -1}} = x_{N_1} + \bar x, 
\end{aligned}
$$

therefore, any Cauchy sequence in the space can converge to a point that is well defined as well. Therefore, the space $(X, \Vert \cdot\Vert)$ is complete. 



**Remarks**:



---
### **Important Examples**

These examples teach a story about Banach Space in general. 

**Example 1: $(l^\infty, \Vert\cdot \Vert_\infty)$ is a Banach Space**
> We verify that $(l^\infty, \Vert\cdot \Vert_\infty)$ is a space. 
**Observations**: 
- The space $l^\infty$ will need to be a vector space. 
- The norm $\Vert \cdot\Vert_\infty$ will have to be a norm. 
- The underlying metric space is complete. 
