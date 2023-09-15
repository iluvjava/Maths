[[Introduction to Operators for Optimizations]]

---
### **Intro**

Fejer monotone is a type of strong generalization to a monotone sequence in Banach Spaces. 

#### **Definition-1 | Fejer Montone Sequence**
> A sequence $(x_n)_{n\in N}$ is fejer monotone wrt to the set $\emptyset \neq C \subseteq X$ when: 
> $$\forall c \in C, k \in \N: \Vert x_{k + 1} - c\Vert \le \Vert x_k - c\Vert. $$

**Observations**: 

The points in the sequences, is getting closer, to very elements in the set $C$. This is a very strong type of convergence, especially for the set $C\subseteq X$. We explicitly assume that, the set $X$ is some type of Banach space. Traditionally, in the realm of real analysis, a monotone increasing sequence $x_n$ approaches $\sup_{n\in N}x_n$, but observe that, a monotone increasing sequence approaches $C = [\sup_{n\in \N}x_n, \infty)$. We hence showed that our observation is ok. 

The convergence is strong. If $(x_n)_{n\in \mathbb N}$ is Fejer monotone, it would mean that $d_C(x_n)$ is a monotone sequence, however, the converse is not true, since Fejer monotone asserts the monotone conditions for all the points in the set $C$. 

If $x_n$ is Fejer monotone wrt to a convex set $C\subset X$, then it is Fejer monotone to all the convex subsets of the set $C$.


#### **Thm-1 | Convergence of Fejer Monotone Sequence To the Set**

> Let $(x_k)_{k\in \N}$ be Fejer-Monotone w.r.t a nonempty subset $C$ of $X$, then $(x_k)_{k\in \N}$ is bounded; moreover, $(x_k)_{k\in \N}$ converges to a point in $C\iff (x_k)_{k\in \N}$ has a cluster point in $C$. 

**Proof**

The $\implies$ direction is clear (Because the limit of the sequence is a cluster point). From the other direction, Let $\bar x \in C$ be a cluster point then exists subsequence $x^{(n_k)}$ such that $\lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$. For any $\epsilon > 0$, using Fejer Monotonicity we have: 

$$
\begin{aligned}
    \exists N_\epsilon: k > N_\epsilon \implies (\epsilon \ge \Vert x^{(n_k)}  - \bar x\Vert \ge \Vert x^{(m)} - \bar x\Vert \; \forall m \ge n_k), 
\end{aligned}
$$

therefore, it means that $\Vert x^{(m)} - \bar x\Vert \rightarrow 0$ and the sequence is Cauchy, and hence it converts to a point $\bar x$ in $C$. Alternatively, we may also prove it this way. 

**Alternative Proof**

For the $\impliedby$ direction, consider any $\bar x \in C$, then monotonicity, the real sequence $\Vert x^{(n)} - \bar x\Vert$ is bounded below and monotone, therefore it has a limit. Fix a $\bar x \in C$ and let it be the cluster point we have $\lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$, hence, the real sequence has sub sequential limit. Since $\bar x \in C$, the sub-sequential limit must be the same as the monotone limit (the sub-sequential limit of the norm must equals to the limit of the monotone convergence by definition of a convergence. )! Therefore, we have $\lim_{n\rightarrow } \Vert x^{(n)} - \bar x\Vert = \lim_{k\rightarrow \infty} \Vert x^{(n_k)} - \bar x\Vert = 0$, hence the sequence converges to $\bar x$. 

**Remarks**
It converges weakly, since it's converging only by the norm. 


#### **Thm-2 | A Slightly Weaker Version in Finite Euclidean Space**
> In finite dimensional Euclidean space, let $C\subseteq \mathbb R^n$ be non-empty. Suppose that for all $c \in C$ the sequence $\Vert x^{(n)} - c\Vert$ is convergent in $\mathbb R$, and the cluster point of the sequence $(x^{(n)})_{n \in \mathbb N}$ is in $C$, then the sequence converges to a limit in $C$. 


**Proof**

The norm of the sequence $\Vert x^{n} - c\Vert$ converging $\mathbb R$ for all $c \in C$. Hence the sequence is bounded in norm. Since the space is complete and finite dimensional, by Bozano Weierstrass theorem, there exists a subsequence $x^{(n_k)}$ that converges. Suppose that there are 2 such sub-sequential limit points $y, z$ in $C$, we want to show that they are the same point. We first show that, $\langle x^{(n)}, y - z\rangle$ are the same for all subsequences by using the paralellogram identity $\langle x, y\rangle = \frac{1}{4}(\Vert x + y\Vert^2 - \Vert x - y\Vert^2)$, consider any 2 points $y, z \in C$ then: 

$$
\begin{aligned}
    2 \langle x^{(n)}, y - z\rangle &= 
    \langle x^{(n)}, y\rangle - \langle x^{(n)}, z\rangle
    \\
    &= 
    \frac{1}{2}(
        \Vert x^{(n)} + y\Vert^2
        -
        \Vert x^{(n)} - y\Vert^2
        -
        \Vert x^{(n)} + z\Vert^2
        + 
        \Vert x^{(n)} - z\Vert^2
    )
    \\
    &= 
    \frac{1}{2}
    \left(
        \Vert x^{(n)}\Vert^2 + \Vert y\Vert^2 + 2\langle x^{(n)}, y\rangle
        -
        (\Vert x^{(n)}\Vert^2 + \Vert x\Vert^2 + 2\langle  x^{(n)}, z\rangle)
    \right.
	    \\
	    &\quad\;
	    +
	\left.
	    \Vert x^{(n)} - z\Vert^2
	    - \Vert x^{(n)} - y\Vert^2 \right)
    \\
    &= \frac{1}{2}(
        \Vert y\Vert^2 - \Vert x\Vert^2 + 2\langle x^{(n)}, y - z\rangle + 
        \Vert x^{(n)} - z\Vert^2
        - \Vert x^{(n)} - y\Vert^2
    )
    \\
    \iff 
    \langle x^{(n)}, y - z\rangle &= 
    \frac{1}{2}(
        \Vert y\Vert^2 - \Vert x\Vert^2+ 
        \Vert x^{(n)} - z\Vert^2
        - \Vert x^{(n)} - y\Vert^2
    ).
\end{aligned}
$$

since the sequence $\Vert x^{(n)} - y\Vert$ converges in $\mathbb R$, any subsequence has $\lim_{k\rightarrow \infty} \langle x^{(n_k)}, y - z\rangle = \Vert y\Vert^2 - \Vert x\Vert^2$, because which is fixed, therefore, consider again the use of B.W theorem and 2 subsequences indexed with $n_k, m_k$ converging to 2 different cluster point $\bar x, x^+ \in C$ we have equality between the 2 limits: 

$$
\begin{aligned}
    & \lim_{k\rightarrow \infty} \langle x^{(n_k)}, \bar x - x^+\rangle = \
    \lim_{k\rightarrow \infty} \langle x^{(m_k)}, \bar x - x^+\rangle
    \\
    \iff & 
    \langle \bar x, \bar x - x^+\rangle = \langle x^+, \bar x - x^+\rangle 
    \\
    \iff & \langle \bar x - x^+, \bar x - x^+\rangle = 0
    \\
    \iff & \Vert \bar x - x^+\Vert = 0, 
\end{aligned}
$$

where we make use of the fact that inner product of an inner product space is a continuous mapping. See [Inner Product Space](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Inner%20Product%20Space.md) for more information. Therefore, all sub-sequential limit points of the sequence are the same, therefore, the sequence has a unique limit and it converges. 

**Remark**

Intuitively, if the sequence approaches the set $C$ for all points and gets very close, it can't have too much room to wiggle. This theorem is weaker compare to the first theorem in the sense that, in finite Euclidean space, the Fejer monotonicity can be removed at the cost of removing the "if and only if" relations between the two parts. 

---
### **Applications**

Fejer monotone sequence characterizes a weaker type of convergences for the averaged operators. 


