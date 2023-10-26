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

Taking the limit supremum of $n\rightarrow \infty, n > k$ on both side we have 

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

Change of ratio between the sequence having limit implies that the ratio between the sequene also has the same limit. Setting $a_1 = x_1, b_1 = y_1$, then define $a_n = x_n - x_{n - 1}, b_n= y_{n} - y_{n - 1}$. Notice that to use the theorem, $b_n$ has to be positive, and therefore, $y_n$ is monotonically increasing and diverges. Then using the previous theorem we have that 

$$
\begin{aligned}
    \underset{n\rightarrow \infty}{\lim\sup}
    \frac{\sum_{i = 1}^{n} x_i - x_{i + 1}}{
        \sum_{i = 1}^{n} y_i - y_{i + 1}
    } \le 
    \underset{
        \substack{
            n\rightarrow \infty \\ n \ge 2
        }
    }{\lim\sup}
    \frac{x_n - x_{n- 1}}{y_n - y_{n - 1}}, 
\end{aligned}
$$

and observe that on the LHS, we have the telescoping sum. Further assume that the sequence $(x_n - x_{n - 1})/(y_n - y{n - 1})$ that has a finite limit, then it would be the case that 

$$
\begin{aligned}
    \underset{n\rightarrow \infty}{\lim\sup} 
    \frac{x_1 - x_n}{y_1 - y_n} &\le 
    L, 
\end{aligned}
$$

finally, the lhs of the limit would be $x_n / y_n$ by the fact that $y_n$ monotically increases and diverges to infinity. Therefore, we would have the following theorem as a result, and they are in fact, equivalent. 

#### **Corollary | Lopital's Rule for Sequences**
> Let $(y_n)_{n\in \mathbb N}$, be strictly increasing and diverges to infinity. Then for any sequence $(x_n)_{n \in \mathbb N}$, we have the $\lim\sup, \lim\inf$ of $x_n/y_n$ stucked between the $\lim\sup, \lim\inf$ of $(x_n - x_{n - 1})/(y_n - y_{n - 1})$. When limit of the later exists, the limit between sequence $x_n/y_n$ equals to $(x_n - x_{n -1})/(y_n - y_{n - 1})$. 

**Proof**

Read the paragraph before this claim. 

---
### **Applications**

With the theorem we can show that the empirical mean of any sequence that has a limit, would be the limitof the sequence. 
