[[Topology of Metric Space]]


---
### **Intro**
Using the topology of a metric space and the metric together with real analysis, we can model the convergence some entities in the metric space, algebraic or not, using the definition of the metric. As usual, we define the concept of an epsilon ball vicinity $\mathbb B_r(x) = \{y| d(x, y) < r\}$ to be the point that is $r$ distance away for the given metric. 

**Definition: Convergence in Metric Space**
> Let $(X, d)$ be metric space, a sequence $(x_n)_{n\in \mathbb N}\rightarrow x_\infty$ if for all $\epsilon > 0$ there exists $N$ such that $n\ge N$ implies $d(x_n, x_\infty)\le \epsilon$ . 

**Observations**: 

The metric $d$ is used, A topological interpretation can be involved saying that $\forall \epsilon > 0$, there exists $N$ such that $n > N$ implies that $x_n\in \mathbb B_\epsilon(x_\infty)$. 

**Remarks**

Convergence in the metric never implies the existence of $x_\infty$ in the space $X$, it only asserts the metric $d(x_n, x_\infty)$ is bounded. *Completeness* is a stronger conditions on the underlying metric that ensure the limit of the sequence in the metric is indeed in the set $X$. Convergence in one metric doesn't imply convergence in another, but it will be true if the metrics are equivalent. [^1]

[^1]: See [[Metric Space Introduction]] for more. 


**Definition: Bounded Subset**

> A subset $M\subseteq M$ is a bounded set if there exists a $x\in X$, $r > 0$ such that $M \subseteq\mathbb B_{r}(x)$. 

**Theorems: Convergence Sequence in Metric Space**

> Let $(X, d)$ be a metric space and $(x_n), (y_n)$ to be sequence in $X$, then: 
> 1. if $(x_n)$ is converging, then it's bounded and its sequence is going to be a unique element in $X$. 
> 2. if $x_n\rightarrow x$ and $y_n\rightarrow y$ as $n\rightarrow \infty$, then $d(x_n, y_n) \rightarrow d(x, y)$. The limit of the metric is the metric of their limit. 
> 3. If a sequence is converging in the metric $d$, then it's a Cauchy sequence.  

**Proof(1.)**: 
It's direct by choosing a specific $\epsilon$ from the definition of convergence sequence in metric space. 

**Proof(2.)**:
Directly from the definition of a metric, we have: 

$$
\begin{aligned}
    d(x_n, y_n) &\le d(x_n, x) + d(x, y) + d(y, y_n)
    \\
    \implies 
    d(x_n, y_n) - d(x, y) &\le 
    d(x_n, x) - d(y, y_n)
    \\[1em]
    d(x, y) &\le d(x, y_n) + d(y_n, y)
    \\
    &\le d(x, x_n) + d(x_n, y_n) + d(y_n, y)
    \\
    d(x, y) - d(x_n, y_n) & \le d(x, x_n) - d(y_n, y), 
\end{aligned}
$$

therefore we can conclude that: 

$$
\begin{aligned}
    \underset{n\rightarrow \infty}{\lim\sup}
    (d(x_n, y_n) - d(x, y)) 
    &\le \lim_{n\rightarrow \infty} d(x_n, x) - d(x, y_n)
    \\
    \underset{n\rightarrow \infty}{\lim\inf}
    (d(x_n, y_n) - d(x, y)) \ge & \lim_{n\rightarrow \infty}d(y_n, y) - d(x, x_n)  = 0, 
\end{aligned}
$$

andtherefore, we have the limitof $d(x_n, y_n)\rightarrow d(x, y)$, if, both the quantities approach their respective limits. 

**Proof(3.)**: Choose a $\epsilon > 0$ then by the definition of convergence in metric space, we have $d(x, x_n)\le \epsilon$, $d(x, x_m) \le \epsilon$ for some $\min(m, n) > N_\epsilon$. So then by triangle inequality of metric, we have $d(x_m, x_n) \le d(x_m, x) + d(x, x_n)$, and by convergence and non-negativity property of metric, we have $d(x_m, x_n) \le 2 \epsilon$, so we are ok here. 

**Theorem: Sequential Limit Characterizations of Closure**
> Let $M\subseteq X$, then $x\in \text{cl}(M)$ if and only if there is a sequence $(x_n)_{n\in \mathbb N}\in M$, such that $x_n\rightarrow x$. 

**Proof**: 
Firstly we state the fact $M \subseteq \text{cl}(M)$. If $x\in M$, then by definition is already in $\text{cl}(M)$, otherwise, let $x\in \text{cl}(M)\setminus M$, by definition of closure, we can select from the set $\mathbb B_{1/n}(x)\cap M$, therefore, constructing a convergence sequence. The other direction of $\impliedby$ is kinda easy to see. 

**Theorem: Complete Subspace is Characterized by Closure**
> Let $M\subseteq X$ be a subspace of the metric space $(X, d)$, then the metric space is complete if and only if the set $M$ is closed in the set $X$.

**Remarks**

This theorem provides an alternative to showing that a particular subspace of a metric space is complete or incomplete. We now show that $M\subseteq X$ to be incomplete by showing that every limit point of the set is a member of the set, the alternative negates the need to use the Cauchy convergence sequence, which sometimes very complicated to use. It also provides a way of showing that a closed subspace is gong to be complete. 

For example about what metric spaces are complete and what is not, consider visiting: [[Examples of Incomplete, Complete Metrics Space]] for more examples. 

---
### **Cauchy Convergence and Completeness**

**Motivations**

Convergence in one metric might not means convergence in another metric. 

**Definition: Metric Cauchy Convergence Sequence**

> A sequence $(x_n)$ in $(X, d)$ is Cauchy if for every $\epsilon > 0$, there exists $N \in \N$ such that $d(x_n, x_m) < \epsilon$ for all $m, n > N$. 

**Observation**: 

- From basic analysis fact, a Cauchy sequence is the same as a convergence sequence. But we don't know what exact value the sequence is going to converge to. This definition is saying that we have a converging sequence that is converging to some point that is not in the space, and we don't necessarily know what that point is. 
- The definition is very similar to the definition of closure, because a Cauchy sequence is a limit sequence, and hence it brings back to the definition of closure, however, they are also different because the closure is for $M\subseteq X$ but completeness is only focused on the background set and its metric. Different focus. 

**Definition Completeness**: 

> $(X, d)$ is a complete metric space if every Cauchy sequence in $(X, d)$ in the space converges to a limit that is in $X$. 


**Examples**: 

- The Euclidean norm equipped with $\R^n$ and the p-norm metric form s complete metric space. 
- The subset of all the rationals in the metric space is not forming a complete metric space. 


---
### **Complete Subspace Theorem**


---
### **Application: Banach Complete Subspace**



