[Stopping Time and Classification of States](Stopping%20Time%20and%20Classification%20of%20States.md)


---
### **Intro**

Stationary distributions is the limiting behaviors of any Markov Chain. Using $\pi$ to denote the *stationary distribution*, and it's a stationary distributions if and only if $\pi^TP = \pi$, with $\pi^T\mathbf 1 = 1, \pi \ge \mathbf 0$. In other words, it's eigenvector for the transition matrix $P$, and it's in fact representing a distributions on the states. We start directly with a theorem that states the existence and uniqueness for a stationary distributions and the conditions, for a finite chain. 

#### **Thm 1.14 | Irreducibility Means Existence of Positive Stationary Distributions**
> Suppose that a $k\times k$ matrix is irreducible. Then there is a unique solution to $\pi P =\pi$, such that $\pi$ is a distribution vector and $\pi_x > 0$ for all state $x\in \mathcal S$, and it's unique. 

**Observations**

The Markov chain is finite and irreducible, then the stationary distribution is non-negative for all states and it's unique. Observe that it said nothing about the convergence, or whatever will happen for an infinite state spaces. 


For the row transition matrix $P$ to be irreducible it's equivalent to saying that $\forall (i, j)\in S^2: \exists N_{i, j} : (P^{N_{i, j}})_{i, j} \neq 0$. This fact will be useful later. 

**Proof**

Observe that $P \mathbf 1 = \mathbf 1\implies (P - I)\mathbf 1 = \mathbf 0$, then $P - I$ has rank $\le k - 1$, $\mathbf 1$ is an right eigen vector for $I - P$, with eigen value: $0$, then there exists a left eigenvector $v$ with the same eigenvalue[^2], so $v^T(P - I) = \mathbf 0$, meaning that $v^TP = v^T$. Which is a candidate for our stationary distribut6tions for the Markov Chain. Let $Q = (I + P)/2$[^1], then $v^TQ = v^T$, let $R = Q^{k - 1}$, then $v^TR = v^T$. Then, consider the following 
$$
\begin{aligned}
    & P \text{ is irreducible} \implies \forall v\neq y \exists \text{a path from $x$ to $y$}. 
    \\
    \implies & \forall x \neq y, \exists \text{ shortest path from $x$ to $y$}. 
    \\
    \implies & x\rightarrow y \text{ in exactly $k - 1$ steps on all distinct state is possible}. 
    \\
    \iff&  R_{x, y} > 0 \; \forall x \neq y.
\end{aligned}
$$
Take note that, if the shortest path exists with length $\le k - 1$ between any states, then using exactly $k -1$ states to reach between state is possible, this is by the fact that $Q = (I + P)/2$, and the transition probability from $x\rightarrow x$ is always non-zero. Suppose for contradiction that, $v$ is a vector with both positive and negative sign, then by $R_{x, y} > 0$ 

$$
\begin{aligned}
    & |v_y| = \left|
        \sum_{x \in \mathcal S}^{}v_x R_{x, y}
    \right| < 
    \left|
        \sum_{ x \in \mathcal S}^{} |v_x| R_{x, y}
    \right|
    \\
    \text{sum over $y$} \implies & 
    \sum_{y\in \mathcal S}^{} |v_y| < 
    \sum_{x\in \mathcal S}^{}|v_x| \sum_{y\in \mathcal S}^{} R_{x, y} = \sum_{x \in \mathcal S}^{}|v_x|.
\end{aligned}
$$

In the first strict inequality, we made use of the fact that $v_y$ contains some negative terms, hence adding the absolute value strictly increases its value. At the end we ended up with a contradiction, therefore, $v_x \ge 0 \; \forall x \in \mathcal S$ is valid, WLOG. Next we show that, this stationary distribution is not only having the same sign, but also non of the entries are equal to zero. Consider that $v_y = 0$, then 
$$
\begin{aligned}
    v_y = 0 = \sum_{x \in \mathcal S}^{} v_x R_{x, y} = 0 \implies v_x = 0 \; \forall x \text{ by } R_{x, y} > 0 \forall x\neq y, 
\end{aligned}
$$

which result in the trivial eigen vector, contradicting to the fact that we started with $v^T$ being a left eigen vector of $P$ with eigenvalue of $1$. 

[^1]: This is called a lazy chain. 
[^2]: $|A - \lambda I| = 0 = |A^T - \lambda I|$, transposing the matrix won't change the determinant for the matrix. 