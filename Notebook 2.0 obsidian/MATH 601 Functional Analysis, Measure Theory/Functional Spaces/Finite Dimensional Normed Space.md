- [[Banach Space Introduction]],  
- [[Convergence, Completeness in Metric Space]].

---
### **Intro**

A Banach space where, the basis to span each element has finitely many elements in it. We will prove that, a vector space with norm, which is a type of metric space is, complete, hence Banach. The major consequences are:  
- equivalences between all norms, and, 
- completeness of all subspaces and spaces, 
- equivalences between compactness (existence of converging subsequences), and the condition: closed and bounded. 

#### **Lemma-1 (2.4-1) | Lower Bound for the Basis Vectors**: 
> Let $\{x_i\}_{i=1}^n$ be a basis for the Finite dimensional linear basis, in the space $X$, then $\exists c > 0$ such that $\forall (\alpha_1, \cdots, c_n)$ we have: 
> $$
> \left\Vert 
>     \sum_{i = 1}^{n}
>     \alpha_ix_i
> \right\Vert \ge c
> \underbrace{
>     \left(
>     \sum_{i = 1}^{n}|\alpha_i|
>     \right)
> }_{=s}
> $$

**Proof**: 

Denote $\vec \alpha = (\alpha_1, \alpha_2, \cdots, \alpha_n)$, notice that when $\vec\alpha = \mathbf 0$, then it's trivial, then we consider
$$
\begin{aligned}
    \text{by: }\Vert \vec\alpha\Vert_1 \neq 0;\;   \beta_i := \frac{\alpha_i}{\Vert \vec \alpha\Vert_1} \implies \sum_{i = 1}^n |\beta_i| = 1, 
\end{aligned}
$$

WOLG, rewrite using: 
$$
\begin{aligned}
    \left\Vert 
        \sum_{i = 1}^{n}\frac{\alpha_i }{s}x_i
    \right\Vert &\ge 
    c 
    \\
    \left\Vert 
        \sum_{i = 1}^{n}\beta_ix_i
    \right\Vert &\ge 
    c, 
\end{aligned}
$$

otherwise, we consider some vector, we don't know what it is, such that it make the inequality false. We are in Banach space, then let's make a sequence of $y^{(m)}$ such that $\lim_{m\rightarrow \infty} \Vert y^{(m)}\Vert = 0$, we write: 

$$
\begin{aligned}
    y^{(m)} = \sum_{i=1}^{n} \beta_i^{(m)} x_i
\end{aligned}
$$

so that the basis represent it. $\Vert \vec \beta^{(m)}\Vert_1  = 1\implies |\beta_i^{(m)}|\le 1 \; \forall i \in [n]$. Certainly, the $\vec{\beta}$ is in a bounded subset of $\R^n$. Applied Bozano Weierstrass to $(\beta_1^{(m)})_{m\in \mathbb N}$, get subsequence transformation function $\sigma_1$, we then find a subsequence of $\sigma_1(m)$ such that $\beta_2$ also converges, denote that as $\sigma_2(m)$, repeat the process we then have $\sigma_n(m)$ such that, for all $1\le i \le n$, $\beta^{(\sigma_n(m))}_i$ is a subsequence of $\beta^{(m)}_i$, and we have limit: 
$$
\begin{aligned}
    \lim_{m\rightarrow \infty} \beta_i^{(m)} = \beta_i \; \forall 1\le i \le n, 
\end{aligned}
$$

then we have a problem because: 

$$
\begin{aligned}
    \quad \lim_{m\rightarrow \infty} \left\Vert
        y^{(m)}
    \right\Vert &= 0
    \\
    \iff 
    \lim_{m\rightarrow \infty} y^{(m)} &= \mathbf 0 
    \\
    \iff 
    \lim_{m\rightarrow \infty}
    \left\Vert \vec \beta \right\Vert_1  
    &= 0
    \quad \text{ Because basis. }
\end{aligned}
$$

By linear independence of basis, it has to be the case that, $\beta_i = 1$, the limit, for all $1 \le i \le n$. The key move here is the use of Bozano Weierstrass, which doesn't work in infinite dimension case. 

**Remarks**: 

The use of Bozano Weierstrass subspace for the whole vector is using the fact that the space is a finite dimensional spaces. Here, we list an counter example for failing the above lemma in the infinite dimension. Consider a sum of infinite vector like: 

$$
\begin{aligned}
    \begin{bmatrix}
        -1 \\ 0 \\ 0  \\  0  \\  \vdots 
    \end{bmatrix}
    +
    \begin{bmatrix}
        1/2 \\ -1/2 \\ 0  \\  0  \\ \vdots 
    \end{bmatrix}
    +
    \begin{bmatrix}
        1/4 \\ 1/4 \\ -1/4 \\ 0 \\\vdots 
    \end{bmatrix}
    +
    \begin{bmatrix}
        1/8 \\ 1/8 \\ 1/8 \\  -1/8 \\\vdots 
    \end{bmatrix}
    +
    \begin{bmatrix}
        1/16 \\ 1/16 \\ 1/16 \\ 1/16 \\\vdots 
    \end{bmatrix} + 
    \cdots 
    \infty
    = 
    \mathbf 0.
\end{aligned}
$$

that is the counter example for sure. 


**References**: 

2.4-1 In Kreyszig's Intro to Functional analysis textbook. 

#### **Def-1 | Sequentially Compact Normed Space**
> Let $(X, d)$ be a metric space, it's sequentially compact when every sequence in $X$ has a convergent subsequence whose limit is an element of $M$.  

**Remarks**

For functional analysis, different type of compactness turns out to be all equivalent in metric space. We will refer to *sequential compact* just as: *compact*. 

#### **Lemma-2 | Compactness is Closed and Bounded**
> Compact subset $M$ of a metric space is, closed and bounded. 

**Proof**

The closure is direct from the definition, take $x\in \text{cl}(M)$, then for every $x$, there is an epsilon region around it to construct a sequence $x_n \in M$ for all $n\in \mathbb N$ such that $\lim_{n\rightarrow \infty}x_n = x$. 
The sequence itself is convergence and it can be its own subsequence, hence its limit is in $M$ by definition of compactness. 
Hence it's closed. 
The set is bounded because if it's not, then $(x_n)_{n\in \N}$ has $\Vert x_n\Vert$ approaching infinity, hence, all of it's subsequence never converges because they are not even bounded in the first place.

**Remarks**: 

The converse is not true. Consider the set of canonical basis $\{e_n\} \in l^2$, they are bounded with $\Vert e_1\Vert = 1$, but all of the points are $\sqrt{2}$ distance away in the 2-normed sequence space. 
They are all singletons and the the set has no accumulation points. 
This set is now closed and bounded. 
We now consider the sequence $(e_n)_{i\in \N}$, which is not gonna have any convergent subsequence. It's never Cauchy. 


**References:** 

2.5-2 in Kreyzig's Textbook

**Remark**: 

Closed and bounded doesn't necessarily mean that the space is compact, this is well illustrated when we are dealing with infinite dimension. 

---
### **Finite Dimensional Spaces Theorems**: 

We list important theorems and cite the places that they are coming from. It's in Kryzig's textbook and the info is enclosed in (). 

#### **Thm (2.4-2) | Closedness and Completeness **
> A finite dimensional subspace/space is complete and closed, both at the same time. 

**Note**:

This seems to be just the Heine Borel Theorem. 

**Proof**: 

To show that it's complete, it suffices to show that the space is a closed space. Let $\{e\}_{i = 1}^n$ to be a basis for $\mathbb R^n$. Let $y^{(m)}$ to be a sequence that is Cauchy them we have: 

$$
\begin{aligned}
    & y^{(m)} = \sum_{i = 1}^{n} \alpha_i^{(m)} e_i \quad \text{A Cauchy sequence}
    \\
    & \forall \epsilon > 0 \; 
    \exists \min(k, l) > N_\epsilon: 
    (\Vert y^{(k)} - y^{(l)}\Vert \le \epsilon)
    \\
    \text{lemma } \implies 
    & \exists c > 0 : \epsilon \ge 
    \Vert y^{(k)} - y^{(l)}\Vert \ge  
    c\sum_{i = 1}^{n} |\alpha_i^{(k)} - \alpha_i^{(l)}| 
    \ge 
    c|\alpha_j^{(k)} - \alpha_j^{(l)}| \; \forall 1 \le j \le n
    \\
    \implies 
    & 
    \exists c > 0: 
    \epsilon/c \ge |\alpha_j^{(k)} - \alpha_j^{(l)}| \;\forall 1 \le j \le n
    \\
    \iff 
    &
    \forall 1 \le j \le n \; (\alpha^{(m)}_j)_{m\in \mathbb N} \text{ is Cauchy} 
    \iff \forall 1 \le j \le n
    \lim_{m\rightarrow \infty} \alpha^{(m)}_j = \alpha_j \in \mathbb R
\end{aligned}
$$

therefore, the sequence of coefficients, $(\alpha_i^{(m)})_{m\in \mathbb N}$ is Cauchy for all of its component, and therefore it has a limit and they exists by the completeness of $\mathbb R$. Now we may write the limit of the sequence $y^{(m)}$, giving: 

$$
\begin{aligned}
    & \lim_{m\rightarrow \infty} y^{(m)} = 
    \lim_{m\rightarrow \infty}\sum_{i = 1}^{n} \alpha_i^{(m)} e_i = \sum_{i = 1}^{n} \alpha_i e_i
    \\
    & \lim_{m\rightarrow \infty} 
    \Vert y^{(m)} - y\Vert = 
    \lim_{m\rightarrow \infty}\sum_{i = 1}^{n} |\alpha^{(m)}_i - \alpha_i| \Vert e_i\Vert =0
    \\
    \iff & 
    \lim_{m\rightarrow \infty} y^{(m)} = y, 
\end{aligned}
$$

and therefore, the limit indeed exist for sequence $y^{(m)}$, and all the components of the vector are in $\mathbb R^n$, by the existence of the basis representation of the limit in $\mathbb R^n$. 

**Observations**: 

Theorem is strengthen, from the case in infinite dimensional spaces where, a subspace of a Banach space is necessarily complete disregarding the fact the space itself is a Banach space. $c_0$, denoting the sequences $\in l^\infty$ converges to zero is not a complete subspace. This would mean a finite dimensional space equipped with a norm will be a Banach Space. 

**References:** Kreyzigs, 2.4-2

**Corollary | Always Complete and Banach**
> If a subspace of a finite dimensional space is complete, then the whole space will be complete. 

#### **Thm (2.4-5) | Norms are all Equivalent**
> In finite dimensional normed vector space, all norms are equivalent. 

**Recall**:

[Banach Space Introduction](Banach%20Space%20Introduction.md) about what it means to have an equivalent norm for the space. 

**Proof**: 

Let $\Vert \cdot\Vert$ be some norm and let $\Vert \cdot\Vert_a$ to be some alternative norm. Let $\{e_i\}_{i = 1}^n$ to be any basis. Then for any $x$ we have a basis representation for the vector, let $a$ denote the coefficients for the basis representing $x$, then from lemma-1 we have: 

$$
\begin{aligned}
    & \exists c > 0: \Vert x\Vert \ge c \Vert a\Vert_1
    \\
    & 
    \frac{\Vert x\Vert}{c} \ge \Vert a\Vert_1, 
\end{aligned}
$$

simulataneously for the other norm we have: 

$$
\begin{aligned}
    \Vert x\Vert_a &= \left\Vert
        \sum_{i = 1}^{n} a_ie_i
    \right\Vert_a
    \\
    &\le
    \sum_{i = 1}^{n} |a_i|\Vert e_i\Vert_a
    \\
    &\le 
    \underbrace{\max_{1\le i \le n}\{\Vert e_i\Vert\}}_{k}
    \sum_{i = 1}^{n} |a_i|
    \\
    &= k \Vert a\Vert_1 \le \frac{k \Vert x\Vert_a}{c}, 
\end{aligned}
$$

swapping the norm $\Vert \cdot\Vert, \Vert \cdot\Vert_a$ and perform the proof again to yield a lower bound for $\Vert x\Vert_a$, then, we would complete proof because we had recovered the equivalences for norms. 

**References**: 

Kreyzig's textbook, theorem 2.4-5. 

#### **Thm (2.5-3) | Closedness and Bounded is Equivalent to Compactness**
> A finite dimensional subspace is compact, if and only if it's closed and bounded. 

**Proof**: 

Going from from left to right, it is direct from the definition of a compact space, going from right to left requires some proofs. Let $M\subseteq X$ be closed and bounded, let $\text{dim}(X) = n$, let $\{e_i\}_{i = 1}^n$ be a basis for $X$, Let $(x^{(n)})_{n\in \mathbb{N}}$ be a sequence in $M$, written in the form: 

$$
\begin{aligned}
    x^{(m)} = \xi_1^{(m)}e_1 + \cdots + \xi_n^{(m)} e_n, 
\end{aligned}
$$

$M$ is bounded implies $\exists k : \Vert x^{(m)}\Vert \le k \; \forall m\in \mathbb  N$, using the coefficient one norm lower bound lemma we have: 

$$
\begin{aligned}
    \implies 
    &
    \exists c: k \ge \Vert x^{(m)}\Vert = \left\Vert 
        \sum_{j = 1}^{n} \xi_j^{(m)} e_j
    \right\Vert 
    \ge c \sum_{i = 1}^{n} |\xi_j^{(m)}|
    \\
    \implies & 
    \frac{k}{c} \ge |\xi_j^{(m)}| \; \forall j \in [n], m \in \N, 
\end{aligned}
$$

using B.W in $\R$, we consider subsequence mapper $m_1(k): \N \mapsto \N$ such that it's strictly monotone increasing that makes $\xi_1^{(m_1(k))}$ a converging subsequence of $\xi_1^{(m)}$, and then we make another mapping $m_2(k)$, It maps from the range of $m_1(k)$ to a subset of $\text{rng}(m_1)$, and it's strictly montone increasing, such that it makes $(\xi_2^{(m_2(k))})_{k\in \N}$ a converging subsequence. Keep doing this until $m_n(k)$, then it will be the case that $(\xi_i^{(m_n(k))})_{k\in \N}$ is a converging subsequence for all $1 \le i \le n$. Using this we have a converging subsequence with a limit, giving us: 

$$
\begin{aligned}
    \lim_{k\rightarrow \infty} \xi^{(m_n(k))} = \bar \xi, 
\end{aligned}
$$

and therefore, the closed and bounded set in finite dimension is a compact set. 


**Remarks**: 

Only a finite dimensional subspace has the ability to generalized the sequential compactness for the reals. 

**References**: 
2.5-3 in Kreyzig's textbook. 


---
### **Lemma-2, Riesz Lemma | Lift up From a Closed Linear Subspace**

This lemma can lift a vector up "vertically" above a closed linear subspace in the normed space, as much as the length of the vector allow. Please read about the Rietz lemma stated in [Banach Space Introduction](Banach%20Space%20Introduction.md) for more information, the later content will continue from it. In this section, we name it 

---
### **Closed Norm Ball is Always Compact in Finite Dimensions**

The following theorem will be using the previous lemma. 

**Thm (2.5-5) | Compact Norm Ball Means Finite Dimensional Space**
> If a normed space $X$, $M = \{x: \Vert x\Vert \le 1\}$, the closed unit ball, is compact then $X$ is a finite dimensional space. 

**Observations:**

The converse is true, trivially from previous theorem. 

**Proof**: 

Let $X$ be an infinite dimensional linear space, we use the Riesz lemma to make a sequence of vector that definitely doesn't have converging subsequence. 
Choose any $x_1\in X$ such that $\Vert x_2\Vert = 1$, let $X_1 = \text{span}(x_1)$, then we can choose $\Vert x_2\Vert$ such that $\Vert x_1 - x_2\Vert \ge 1/2$, by Riezs Lemma. 
So: 
$$
\begin{aligned}
    & \text{def} X_2 = \text{span}(x_1, x_2)
    \\
    \implies & \exists x_3 : \Vert x_3\Vert = 1 \wedge (\Vert x_3 - x_i\Vert \ge 1/2 \;\forall i \in \{1, 2\})
    \\
    & \text{def }X_3 = \text{span}(x_1, x_2, x_3)
    \\
    &\quad \vdots 
    \\
    \implies & \exists x_n: \Vert x_n\Vert = 1 (\Vert x_n - x_i\Vert \ge 1/2\;\forall 1 \le i \le n - 1),
    \\
    &\quad \vdots
\end{aligned}
$$

then we had constructed a sequence $(x_n)_{n\in \N}$ such that $\Vert x_n - x_m\Vert \ge 1/2$ for all $m, n\in \N$, and therefore there is no converging subsequence, therefore, in an infinite dimensional space, we can always have a bounded sequence that doesn't have any converging subsequences, this is by the virtue of Riezs Lemma. 


**Remarks**: 

It's implied that in a finite dimensional space, a closed unit ball is a set that contains bounded sequences that has diverging subspace. But this is not possible in a finite dimensional space. 


