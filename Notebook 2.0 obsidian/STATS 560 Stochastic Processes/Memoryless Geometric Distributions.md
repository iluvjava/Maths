- [Stopping Time and Classification of States](Stopping%20Time%20and%20Classification%20of%20States.md), we made use of stopping time. 
- [Markov Chain Introduction](Markov%20Chain%20Introduction.md), we made use of the strong Markov property. 

---
### **Intro**

We use theory of Markov chain to understand and derive the memoryless properties of the geometric random variable. Denote $X\sim \text{Geo}(\alpha)$, produces PDF $f_X(k)=(1 - \alpha)\alpha^{k - 1}$. 

#### **Thm-1 | Memoryless of Geometric**
> The random variable $T$ is memoryless meaning that $P(T = m + n | T > n) = P(T = m), \;\forall m \in \mathbb N$. 

**Proof**

A geometric random variable can be is a stopping for a Markov chain with 2 states, $0, 1$. The transition probability matrix is given by 

$$
\begin{aligned}
    P = \begin{bmatrix}
        \alpha & 1 - \alpha
        \\
        0 & 1
    \end{bmatrix}
\end{aligned}
$$

Then, we consider any chain that start with state $0$, and ends with state $1$, the even description and their assigned probability would be 

$$
\begin{aligned}
    P(X_T = 1 \cap X_i \neq 1\; \forall 1\le i < n \cap X_0 = 0) &= (1 - \alpha)\alpha^{T - 1}. 
\end{aligned}
$$

We now us the Markov chain stopping time to reformulate, giving us 

$$
\begin{aligned}
    P(T = m + n | T > n) &= P(X_{m + n} = 1 | X_i = 0\;  \forall\;  0 \le i \le n)
    \\
    &= P(X_{m + n} = 1 | X_n = 0) \quad \text{By Markov property}
    \\
    &= P(X_m = 1 | X_0 = 0) \quad \text{by strong Markov property}
    \\
    &= P(T = m). 
\end{aligned}
$$

and that completes the proof. 


### **Memoryless of Exponential**

