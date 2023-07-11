[[Gerschgorin Theorem]]


---
### **Intro**


#### **Def | Finite State Transition Matrix**

> Let $|S|$ be a set denoting finite states of a Markov chain $(X_n)_{n\in \mathbb N}$, then the transition matrix between any 2 states $i, j \in S$ is denoted using 
> $$
> \begin{aligned}
>   p(i|j)  = \mathbb P(X_{n +1} = i | X_n = j), 
> \end{aligned}
> $$
> Observe that, to find out the probability of transitioning to any state $j$, conditioned on the probability of $P(X_n)$, the one step transition can be computed 
> $$
> \begin{aligned}
>   P(X_{n + 1} = j| X_n) = \sum_{s \in S}^{} p(j, |s)P(X_n = s), 
> \end{aligned}
> $$
> Which is a left multiplication on the role vector representing the probability distribution for $X_n$. 



A transition matrix is a non-negative matrix such that its row sum is 1. Then one of the immediate property can be proven via the Gershchgorin's Theorem. The theorem will be stated: 

> For all transition matrix, it only has eigenvalues with absolute values that are less than or equal to one. 

**Proof**: 

$$
\begin{aligned}
    | \lambda_i - a_{i, i}| &\le  \sum_{j = 1, j \neq i}^{n}
    a_{i, j} \le 1  \quad\forall\; 1 \le i \le n
    \\
    \implies |\lambda_i| \le 1
\end{aligned}
$$

And that completes the proof. Such a matrix is used to model the behavior of discrete Markov Chain. 
