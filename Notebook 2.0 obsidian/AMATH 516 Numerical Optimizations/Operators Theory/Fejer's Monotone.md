[[Introduction to Operators for Optimizations]]


---
### **Intro**

Fejer monotone is a type of strong generalization to a monotone sequence in Banach Spaces. 

**Definition: Fejer Montone Sequence**
> A sequence $(x_n)_{n\in N}$ is fejer monotone wrt to the set $\emptyset \neq C \subseteq X$ when: 
> $$\forall c \in C, k \in \N: \Vert x_{k + 1} - c\Vert \le \Vert x_k - c\Vert. $$

**Observations**: 

The points in the sequences, is getting closer, to very elements in the set $C$. This is a very strong type of convergence, especially for the set $C\subseteq X$. We explicitly assume that, the set $X$ is some type of Banach space. Traditionally, in the realm of real analysis, a monotone increasing sequence $x_n$ approaches $\sup_{n\in N}x_n$, but observe that, a monotone increasing sequence approaches $C = [\sup_{n\in \N}x_n, \infty)$. We hence showed that our observation is ok. 

The convergence is strong. If $(x_n)_{n\in \mathbb N}$ is Fejer monotone, it would mean that $d_C(x_n)$ is a monotone sequence, however, the converse is not true, since Fejer monotone asserts the monotone conditions for all the points in the set $C$. 

If $x_n$ is Fejer monotone wrt to a convex set $C\subset X$, then it is Fejer monotone to all the convex subsets of the set $C$.

**Theorem: Convergence of Fejer Monotone Sequence**

> Let $(x_k)_{k\in \N}$ be Fejer-Monotone w.r.t a nonempty subset $C$ of $X$, then $(x_k)_{k\in \N}$ is bounded; moreover, $(x_k)_{k\in N}$ converges to some point in $C\iff (x_k)_{k\in \N}$ has a cluster point. 

**Observations**: 

The theorem, decomposes monotone convergence into some set $C$ into 2 conditions, the existence of a cluster point, and the property of Fejer Monotone. And the existence of the cluster point inside of $C$ ensures that the limit of the sequence is in the set $C$. 

**Proof**: 

Choose any point $c\in C$, we have: 

$$
\begin{aligned}
    \forall k \in \mathbb N: \Vert x_{n + k} - c\Vert \le \Vert x_{n} - c\Vert < \infty, 
\end{aligned}
$$
therefore, the Fejer monotone sequence is bounded. Next we show $\implies$. If the sequence $x_n$ converges to $\bar c \in C$, then that point is the cluster point, by property of the limit. Let $\bar c \in C$ be a cluster point, then for all $\epsilon > 0$, there exists $N_\epsilon$ s.t: $n > N \implies \mathbb x_n\in \mathbb B_{\epsilon}(\bar c)$, this defines a subsequence $x_{n_k}\rightarrow \bar c \in C$. From the monotone property, for all $\epsilon > 0$ we have $N'_\epsilon$: 

$$
\begin{aligned}
    & k > N'_\epsilon \implies \Vert x_{n_k} - \bar c\Vert \le \epsilon
    \\
    \implies &
    (n \ge n_k \implies \Vert x_n - \bar c \Vert\le \Vert x_{n_k} - \bar c\Vert \le \epsilon), 
\end{aligned}
$$

where, the subsequence and the sequence has the same limit, from the monotone property of the entire sequence. 

**References**: 

Proposition 5.9 in Heinz's Combette's Monotone operator textbook. 


---
### **Applications**

Fejer monotone sequence characterizes a weaker type of convergences for the averaged operators. 


