wiki [here](https://en.wikipedia.org/wiki/Set-theoretic_limit)

---
### **Intro**

Set inclusion is a partially order relation making it possible to extend the concept of $\lim\inf, \lim\sup$ for sets. We define the limit of a sequence sets $(A_n)_{n\in \mathbb N}$: 


#### **Def | Discrete Set Limits**
> Let $(A_n)_{n \in \mathbb N}$ be a sequence of subset $A_n \subseteq X$, from the partial order space $(2^{X}, \subseteq)$. 
> With that we can define the $\Limsup{}, \Liminf{}$ limit of the sequence of set by the following: 
> $$
> \begin{aligned}
>     \Limsup{n\rightarrow \infty} 
>     A_n &= \bigcup_{n\in \mathbb N} \bigcap_{m \ge n} A_n
>     \\
>     \Liminf{n\rightarrow \infty} 
>         A_n &= \bigcap_{n\in \mathbb N} \bigcup_{m \ge n} A_n. 
> \end{aligned}
> $$


**Remarks**

The letters in the name of the opeartor $\Limsup{}, \Liminf{}$ had been capitalized to distinguish the difference between the limits of a sequence of set, or the limit of an elements. 


#### **Def | Subsequences of the Natural Numbers**
> Let $(k_n)_{n\subseteq \mathbb N} \in \mathcal N_\infty^\#$ denotes the set of all subsequence of the natural number sequence. 
> Let $(k_n)_{n\subseteq \mathbb N} \in \mathcal N_{\infty}$ denotes the subsequence of the natural number such that it only differs with the sequence of natural number in finitely many places. 
> Mathematically we can define it as 
> $$
> \begin{aligned}
>     (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# &\iff 
>     (k_n : \mathbb N \mapsto \mathbb N) \wedge 
>     (\forall n \in \mathbb N:  k_n \ge n \wedge k_n > k_{n - 1} + 1), 
>     \\
>     (k_n)_{n \in \mathbb N} \in \mathcal N_{\infty} &\iff
>     ((k_n)_{n \in \mathbb N} \in \mathcal N_{\infty}^\#) 
>     \wedge 
>     (\exists m \in \mathbb N: n \ge m \implies k_{n + 1} = k_n + 1). 
> \end{aligned}
> $$
> If both quantities are the same, then the set would define the limit for the sequence of sets.

**Observations**

Please observe that obviously we have $\mathcal N_{\infty} \subsetneq \mathcal N_{\infty}^\#$. 


---
### **Characterizing Sequential Limit using Set Limit**

We disect the definition of a discrete set limit listed above. 
The following three observations characterize limits of a sequences of sets, in increasing level of abstractness. 

#### **Thm | Monotone Set Convergence for Discrete Set Limits**
> For set of monotonically expanding ste $A_1 \subseteq A_2 \subseteq \cdots \subseteq A_{n}\cdots$, we have the set limit being: 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} 
>     A_n  = \Limsup{n\rightarrow \infty} A_n 
>     = 
>     \bigcup_{n\in \mathbb N} A_n. 
> \end{aligned}
> $$
> for sequence of set that is monotonically shrinking; $A_1 \supseteq A_2 \supseteq \cdots \supseteq  A_n \supseteq \cdots$, then we have the limit that: 
> $$
> \begin{aligned}
>     \Liminf{n\rightarrow \infty} 
>     A_n  = \Limsup{n\rightarrow \infty} A_n 
>     = 
>     \bigcap_{n\in \mathbb N} A_n. 
> \end{aligned}
> $$

**Proof**

Assume $A_n \subseteq A_{n + 1}$. 
We define 

$$
\begin{aligned}
    A_n^\cup = \bigcup_{m \ge n} A_m. 
\end{aligned}
$$

then $A_n^\cup \subseteq A_{n + 1}^\cup$, because the sequence of set $A_n$ is monotonically expanding. 
Therefore we have 

$$
\begin{aligned}
    \Liminf{n\rightarrow \infty} A_n = \bigcap_{n \in \mathbb N} A_n^\cup
    & = A_1^\cup \quad \text{by } A_n^\cup \subseteq A_{n+ 1}^\cup \forall n
    \\
    &= \bigcup_{m \ge 1} A_m \quad \text{by def of } A_1^\cup 
    \\
    &= \bigcup_{m \ge 1} \bigcap_{n \ge m} A_n 
    \quad \text{ by } A_m \subseteq A_{m + 1}
    \\
    &= \Limsup{n\rightarrow \infty} A_n 
    \quad \text{ By def of Limsup}. 
\end{aligned}
$$

Therefore, when the set is monotonically epxanding, the limit of the sequence of sets are the union of all the sets in the sequence. 

Assume that $A_n$ is a sequence of shrinking set, i.e: $A_1 \supseteq A_2 \supseteq \cdots \supseteq A_n \supseteq A_{n + 1}\supseteq \cdots$. 
In a similar manner we can define 

$$
\begin{aligned}
    A_n ^\cap := \bigcap_{m \ge n} A_m 
    \implies 
    A_n^\cap \supseteq A_{n + 1}^\cap. 
\end{aligned}
$$

With that we have 

$$
\begin{aligned}
    \Limsup{n\rightarrow \infty} A_n 
    & = \bigcup_{n \in \mathbb N} A_n^\cap
    \quad \text{Def of sup}
    \\
    &= A_1^\cap 
    \quad \text{by } A_n^\cap\text{ monotone shrinking}
    \\
    &= \bigcap_{n \in \mathbb N}A_n 
    \quad \text{ by def of } A_n^\cap
    \\
    &= 
    \bigcap_{n \in \mathbb N}\bigcup_{m \ge n} A_m 
    \quad \text{ by } A_n \text{ monotone shrinking}
    \\
    &= \Liminf{n\rightarrow \infty} A_n 
    \quad \text{ By def of Liminf.}
\end{aligned}
$$

Therefore, when the sequence of sets are monotone shrinking, you get the intersection of all these sets as the limit of the sets. 


#### **Thm | Sequential Characterization of the Set Limits**
> Let $A_n \subseteq X$ and consider sequence $(A_n)_{n\in \mathbb N}$. 
> Let $x \in \Liminf{n\rightarrow \infty}A_n$ if and only if there exists $(k_n)_{n \in \mathbb N} \in \mathcal N_{\infty}^\#$ such that $x \in \bigcap_{n\in \mathbb N} A_{k_n}$. 
> Simiarly, let $x \in \Limsup{n\rightarrow \infty} A_n$ if and only if there exists $(k_n)_{n \in \mathbb N} \in \mathcal N_\infty$ such that $x \in \bigcap_{n\in \mathbb N}A_{k_n}$. 

**Obervations**


**Proof**



#### **Thm | Characterzing the Limit of the sets Via Set Indicator Functions**
> 