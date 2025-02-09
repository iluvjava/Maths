- [Limit, Cluster Point of Sequence](../../MATH%20000%20Math%20Essential/Analysis/Limit,%20Cluster%20Point%20of%20Sequence.md)


---
### **Intro**

We introduce the special properties of the cluster point of a a type of sequences where it gets zero velocity. 

#### **Theorem | Connected cluster point**
> Let $(x_n)_{n \ge 0}$ be a sequence in $\R^n$. 
> Let $C$ be the set of cluster point in $(x_n)_{n \ge 0}$. 
> If, the sequence has $\lim_{n \rightarrow \infty} \Vert x_{n + 1} - x_n\Vert = 0$, i.e: eventually stationary. 
> Then the set $C$ must be a connected set. 


**Proof**

We prove the equivalent contrapositive statement. 
Assuming that $C\neq \emptyset$ so it's the nontirvial case. 
If the cluster point $C$ is not a connected set, then $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert \neq 0$. 
The proof has the following key intermediate steps: 
1. **(STEP I)**: $C$ can be written as the union of two disjoint open set $S, T$ such that they covers $C$, i.e: $C \subseteq S \cup T$. 
2. **(STEP II)**: Then there exists a subsequence $x_{k_n}$, $N \in \N$, such that if $n> N$ then $\Vert x_{k_n} - x_{k_{n - 1}}\Vert > \epsilon/2$ for some $\epsilon > 0$. 

Therefore, the sequence $\Vert x_{n + 1} - x_n\Vert$ is not converging to zero. 

**(STEP I)**. 
$C$ is a disconnected set therefore it's the subset of two open set $S, T$ that are disjoint. 
Choose any two cluster points $s, t \in C$ such that $s \in S, t \in T$ are the cluster points of the sequence. 
There exists $\epsilon > 0$ such that $\Vert s - t\Vert > \epsilon$, this is possible because $S, T$ are disjoint and open. 
By the definition of cluster point there exists subsequences $x_{k_n^{(1)}}, x_{k_n^{(2)}}$ with limit point $s, t$. 

**(STEP 2)**. 
For any $\epsilon$ resulted from the choice of $s, t$ there exists $N(s,t) \in \N$, such that if $n \ge N(s, t)$ then $k_n^{(1)}, k_n^{(2)}$ by the convergence of both sequences to cluster point $s, t$: 

$$
\begin{aligned}
    \left\Vert x_{k_n^{(1)}} - s\right\Vert 
    &< \epsilon/4, 
    \\
    \left\Vert x_{k_n^{(2)}} - t\right\Vert 
    &< \epsilon/4. 
\end{aligned}
$$

Then the distance between the iterates from each sequence has 

$$
\begin{aligned}
    \epsilon &< \Vert s - t\Vert
    \\
    &= \left\Vert 
        s - x_{k_n^{(1)}} + x_{k_n^{(1)}} - t
    \right\Vert
    \\
    &=
    \left\Vert 
        s - x_{k_n^{(1)}} 
        + 
        x_{k_n^{(1)}} - x_{k_n^{(2)}} 
        +
        x_{k_n^{(2)}}- t
    \right\Vert
    \\
    &\le 
    \left\Vert s - x_{k^{(1)}_n}
    \right\Vert + 
    \left\Vert
        x_{k_n^{(1)}} - x_{k_n^{(2)}} 
    \right\Vert
    + 
    \left\Vert
        x_{k_n^{(2)}}- t
    \right\Vert
    \\
    &< 
    \epsilon/4 + \left\Vert
        x_{k_n^{(1)}} - x_{k_n^{(2)}} 
    \right\Vert + \epsilon/4. 
\end{aligned}
$$

Therefore, it has $\Vert x_{k_n^{(1)}} + x_{k_n^{(2)}}\Vert > \epsilon/2$. 
Since such a choice of $k_n^{(1)}, k_n^{(2)}$ always exists for all value of $\epsilon$ determined by the distance between $s, t$, the sequence $\lim_{n\rightarrow \infty} \Vert x_{n + 1} - x_n\Vert \ge \epsilon/2 \neq 0$. 
