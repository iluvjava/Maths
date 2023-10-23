[Real Analysis Basics](Real%20Analysis%20Basics.md)


---
### **Intro**
we follow [this wiki](https://en.wikipedia.org/wiki/Stolz%E2%80%93Ces%C3%A0ro_theorem) for our theorem. The theorem describes behaviors of the limit sums of the sequence ratio, and the limit of the ratio between the sequence. 

### **Lemma | Stolz Cesaro Ratio of Series**
> If $(b_n)_{n\in \mathbb N}$ is a positive sequence of real number such that $\sum_{i = 1}^{\infty} b_n = \infty$, then for any sequence $(a_n)_{n\in\mathbb N}$ one has the inequalities: 
> $$
> \begin{aligned}
>   & \underset{n\rightarrow \infty}{\lim\sup}\frac{a_1 + \cdots + a_n}{b_1 + \cdots + b_n} \le 
>   \underset{n\rightarrow \infty}{\lim\sup} \frac{a_n}{b_n}, 
>   \\ 
>   & \underset{n\rightarrow \infty}{\lim\inf}\frac{a_1 + \cdots + a_n}{b_1 + \cdots + b_n} \ge 
>   \underset{n\rightarrow \infty}{\lim\inf} \frac{a_n}{b_n}, 
> \end{aligned}
> $$
> and additionally, if the sequence has a limit then we $\lim_{n\rightarrow \infty}\frac{a_1 + \cdots + a_n}{b_1 + \cdots + b_n} = \lim_{n\rightarrow \infty} \frac{a_n}{b_b}$. 


**Proof**

It suffice to only prove the first line since $(a_n)_{n \in \mathbb N}$ is arbitrary, we can set $-a_n$ instead to prove the other. On the first line, if $\lim\sup_{n\rightarrow \infty} a_n / b_n = \infty$, then it's trivial. Else, let $\lim\inf_{n\rightarrow \infty} a_n / b_n = L$, then with any $l > L$, there exists $k \in \mathbb N$ such that for all $n > k$

$$
\begin{aligned}
    \frac{a_n}{b_n} &\le l
    \\
    a_n & \le l b_n
    \\
    a_{k + 1}+ \cdots + a_n & \le 
    l (b_{k + 1} + \cdots + b_n)
    \\
    a_1 + \cdots + a_n & \le 
    a_1 + \cdots + a_k + l(b_{k + 1} + \cdots  + b_n), 
\end{aligned}
$$

denoting the partial sum of $a_n, b_n$ using $A_n, B_n$, the above inequaity displays

$$
\begin{aligned}
    A_n & \le A_k + l(B_n - B_k)
    \\
    \frac{A_n}{B_n} &\le 
    \frac{A_k}{B_n} + l\frac{B_n - B_k}{B_n}
    \\
    &\le 
    \frac{A_k}{B_n} + l \left(
        1 - \frac{B_k}{B_n}
    \right)
    \\
    &\le l + \frac{A_k + lB_k}{B_n}. 
\end{aligned}
$$

Taking the limit supremum of $n\rightarrow \infty$ on both side we have 

$$
\begin{aligned}
    \underset{n\rightarrow \infty}{\lim\sup}
    \frac{A_n}{B_n} &\le 
    l + \frac{A_k + lB_k}{\lim_{n\rightarrow \infty}B_n} \le l. 
\end{aligned}
$$

therefore, we proved the first expression in the theorem. 


---
### **Corollary**

Change of ratio between the sequence having limit implies that the ratio between the sequene also has the same limit. 
