[[Real Analysis Basics]]

---
### **Intro**

**Definition: Cauchy Sequence**

> $(a_n)_{n\in \mathbb N}$ is a cauchy sequence then for all $\epsilon > 0$ there exists $m, n$ such that whenever $\min(m, n) \ge N_\epsilon$ then $|a_n - a_m|\le \epsilon$. In brief, any 2 points that is sufficiently large can get as close as we want. 

Immediately observe that if a sequence is convergence, then it has to be a Cauchy sequence. 

**Remarks**

In general metric space, this theorem still works well. 

---
### **Convergence of Cauchy Sequence**

> If a sequence $a_n$ is Cauchy, then it converges. We don't know what it converges to. 

Let $(a_n)_{n\in \mathbb N}$ be Cauchy then there exists $m, n$ such that $\forall \min(m, n)> N_\epsilon$ such that $|a_m - a_n|\le \epsilon$, which means that the sequence has to be bounded, and we can represents the bound as $[\inf_{n\ge N_\epsilon}a_n, \sup_{n\ge N_\epsilon}a_n]$. The interval has a length that is less than $\epsilon$. Now, we know that the sequence that comes after $N_\epsilon$ will be a bounded sequence therefore, there exists a convergent subsequence $a_{n_k}$ such that it converges to a point, let's say it's $a$. Then we consider that: 

$$
\begin{aligned}
    |a_n-  a| \le |a_n - a_{n_l}| + |a_{n_l} - a|, 
\end{aligned}
$$

where, we already know that $|a_n - a_{n_l}| < \epsilon$ by the fact that it's a Cauchy sequence. The second term is bounded by any $\epsilon'$ by the fact that the subsequence converges to $a$. Therefore, the LHS is bounded. The proof is complete.  







