- wikipedia [here](https://en.wikipedia.org/wiki/Set-theoretic_limit).
- [Metric Space Introduction](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Metric%20Space%20Introduction.md)
---
### **Intro**

The content of this file is from the chapter 1 of the book Set-valued analysis [^1]. 
Set inclusion is a partially order relation making it possible to extend the concept of $\lim\inf, \lim\sup$ for sets. We define the limit of a sequence sets $(A_n)_{n\in \mathbb N}$:

[^1]: J.-P. Aubin and H. Frankowska, _Set-Valued Analysis_. Boston: Birkhäuser, 2009. doi: [10.1007/978-0-8176-4848-0](https://doi.org/10.1007/978-0-8176-4848-0).

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
Observe that the space $X$ is not metric space and the distance function is not used in this definition. 



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
> For set of monotonically expanding set $A_1 \subseteq A_2 \subseteq \cdots \subseteq A_{n}\cdots$, we have the set limit being: 
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

The reader should verify that the previous theorem regarding monotone expanding/shrinking sets is consistent with the above theorem by considering sequences of sets that are monotone expanding/shrinking. 

**Proof**

We consider directly from the Limsup of the sequence of sets we have 

$$
\begin{aligned}
    x \in \Liminf{n\rightarrow \infty} A_n &\iff 
    x \in \bigcap_{n \in \mathbb N}\bigcup_{m \ge n}A_n, 
    \; 
    \text{define } A_n^\cup &= \bigcup_{m \ge n} A_n
    \\
    x \in \bigcap_{n \in \mathbb N}A_n^\cup 
    & \iff 
    \forall n \in \mathbb N: x \in A_n^\cup
    \\
    & \iff 
    \forall n \in \mathbb N \;\exists m \in \mathbb N: 
        x \in A_m, 
\end{aligned}
$$

On the last line it asserts given any $n$, there always exists a $k \in \mathbb N$ such that $x \in A_{n + k}$, which allows us to construct a subsequence sequence $k_n$ of natural numbers such that $x \in A_{k_n}$ for all $n \in \mathbb N$. 
Therefore the Liminf case had been demonstrated. 

Similarly, we consider that 

$$
\begin{aligned}
    x \in \Limsup{n\rightarrow \infty} A_n 
    & \iff 
    \bigcup_{n \in \mathbb N} \bigcap_{m \ge n}
    A_n \ni x, \; \text{ define } A_n^\cap := \bigcap_{m\ge n}A_m
    \\
    x \in \bigcup_{n\in \mathbb N}A_n^\cap 
    & \iff
    \exists n \in \mathbb N: m \ge n \implies x \in A_m
    \\
    &\iff 
    \exists n \in \mathbb N: x \in \bigcap_{m \ge n} A_m. 
\end{aligned}
$$

Therefore, there exists the sequence $(k_n)_{n \in \mathbb N} = (n, n + 1, n+2, \cdots)$ so that $x \in A_{k_n}$ for all $n \in \mathbb N$. 
The proof is now done. 

**Remark**

The reader should realize that, with $\mathcal N_\infty \subseteq \mathcal N_\infty^\#$, we have for $\Limsup{n\rightarrow \infty} A_n\supseteq \Limsup{n\rightarrow \infty} A_n$, as a result of the above equivalent characterization of set limits. 

If, we let $A_n = \{x_n\}$ to be a sequence of singleton set from $\mathbb R$, then the convergence condition for Liminf described above is too strong compare to convergence in the metric space $\mathbb R$. 
For example, it would require the subsequence to converge exactly to a singleton at finitely many steps after. 
In the case of Limsup, it would requires the subsequence to hit the limit $x$, a singleton element infinitely many time. 
This is once again, too strict compare to the limit of $x_n \in \mathbb R$. 


#### **Thm | Characterzing the Limit of the sets Via Set Indicator Functions**
> The following conditions are equivalent: 
> 1. $x \in \Limsup{n \rightarrow \infty}A_n$,
> 2. $x \in \bigcup_{n\in \mathbb N}\bigcap_{m \ge n} A_m$, 
> 3. $\limsup_{n\rightarrow \infty}  \chi_{A_n}(x) = 1$. 
> 
> Similarly, for $\Liminf{}$, we have the third condition being of $\liminf_{x\rightarrow \infty} \chi_{A_n}(x) = 1$. 
> Here $\chi_{A}(x)$ is the set indicator function where $\chi_{A}(x) = 1 \; \forall x \in A$ then $\chi_{A}(x) = 0 \; \forall x \not \in A$. 


**Proof**

We use the prvious theorem to identify a subsequence of the natural numbers that only differs with the natural number for finite many numbers. 
To do what, we start by considering that: 

$$
\begin{aligned}
    x \in \Liminf{n\rightarrow \infty} A_n
    & \iff 
    \exists (k_n)_{n\in \mathbb N}
    \in 
    \mathcal N_\infty : x \in A_{k_n} \forall n \in \mathbb N 
    \\
    &\iff 
    \exists (k_n)_{n\in \mathbb N}
    \in 
    \mathcal N_\infty  \forall n \in \mathbb N: \; \chi_{A_{k_n}}(x) = 1
    \\
    &\iff 
    \exists m \in \mathbb N : n \ge m \implies x \in A_m \quad \text{ By def of } \mathcal N_\infty
    \\
    &\iff 
    \lim_{n\rightarrow \infty}
    \chi_{A_{m+ n}}(x) = 1 
    \\
    &\iff 
    \liminf_{n\rightarrow \infty} \chi_{A_n}(x) = 1.
\end{aligned}
$$

To show Limsup, we solve it in a similar way: 

$$
\begin{aligned}
    x \in \Limsup{n\rightarrow \infty} A_n 
    &\iff 
    \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# \; \forall n \in \mathbb N : 
    x \in A_{k_n}
    \\
    &\iff 
    \exists (k_n)_{n \in \mathbb N} \in \mathcal N_\infty^\# 
    \; \forall n \in \mathbb N: 
    \lim_{n\rightarrow \infty} \chi_{A_{k_n}} (x) = 1
\end{aligned}
$$

Take note that the range of the function $\chi_C(x)$ for any set, is $\{0, 1\}$, therefore, if there exists a subsequence that has a limit of $1$, it is a cluster point. 
Cluster point of any sequence $\chi_C(x_n)$ is bounded above by $1$, therefore, if there exists a subsequence that achieves $1$, then $\limsup_{n\rightarrow \infty} \chi_C(x_n) = 1$. 
Apply it to above we have $\lim_{n\rightarrow \infty }\chi_{A_k}(x) = 1 = \limsup_{n\rightarrow \infty}\chi_{A_n}(x)$. 


**Remark**

The indicator function $\chi_A(x)$, when $X$, the ambience space is a metric space equipped with the discrete metric, we have representations: 

$$
\begin{aligned}
    \chi_C(x) = \left|
        1 - \min_{y \in C} \text{dist }(x, y) 
    \right|, 
\end{aligned}
$$

which is equivalent to a discrete metric between a set of elements and a single elements. 
This is the reason why the name of the file is called "discrete set limit". 


---
### **More**

[Set Limits Part II](Set%20Limits%20Part%20II.md) continuous the discussion, for metric space that may not be a discrete metric. 