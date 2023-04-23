### **Intro**

Let $(x_n)_{n\in \N}$ be a sequence in $\R$, then a subsequence is the same sequence but skipping some indices. We consider a function $\sigma (k):\mathbb N \mapsto \mathbb N$, We let $\sigma (k) < \sigma(k + 1)$ such that it's a strict monotone function. Then for all such function, the sequence $x_{\sigma(n)}$ is a subsequence of the sequence $x_n$. For conveniences, we write $x_{n_k}$ to refers to a subsequence of some sequence. 


---
### **Thm-1 | Monotone Subsequence Theorem**

For every sequence $(x_n)_{n\in \N}$ there is a subsequence that is monotone. It might not be strictly monotone however. This is a lemma the underlies the Bozano Wierstrass theorem, a very important theorems that describes the space of real numbers. 

> For all sequences that in the real line, there exists a subsequence of that sequence such that it is monotone. 

**Proof**: 

We invent the condition called *dominant*. If we say that a term $x_n$ in the sequence is dominant if and only if $(\star)$ is true, which is: 

$$
\begin{aligned}
    (\star): x_n > \sup_{m \ge n + 1}x_m, 
\end{aligned}
$$

meaning that $x_n$ is larger than all numbers that comes after it in the sequence. We denote $S$ to be the set of indices for the sequence such that condition $(\star)$ is true: $S := \{n: x_n \text{ is } (\star)\}$, then, there will be 2 cases: 
1. CASE I: the set $S$ is infinite. If this is the case, then ordering the indices $n_k\in S$, we have $x_{n_k} \ge x_{n_{k +1}}$, each of the dominating term is gonna larger than the term that comes after it, this is by the definition of $(\star)$. 
2. CASE II: There are finitely many terms in the set $S$. We discuss this in more details. 

If $S$ is finite, then we choose $n^+ = \sup S$, hence $x_{n_1}$ is the last dominating term in the sequence. 

- Choose any $N_1 > n^+$, then $x_{N_1}$ is not dominating, by $(\star)$, there exists $m_1 \ge N_1$ such that $x_m \ge x_{N_1}$. 
- Choose any $N_2 > m_1$, $x_{m_1}$ is not dominating meaning that there exists $m \ge N_2$ such that $x_{m_2} \ge x_{m_1}$. 
- (...)
- This process can be repeated indefinitely. 

At the end we have a sequence that is monotone increasing: 

$$
\begin{aligned}
    x_{m_1} \le x_{m_2}\le \cdots , 
\end{aligned}
$$

this is a monotone subsequence and we completed the proof. 

**Remarks**: 

I like this monotone subsequence lemma. It's interesting and it's important. 