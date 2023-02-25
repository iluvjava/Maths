wiki [here](https://en.wikipedia.org/wiki/Set-theoretic_limit)

---
### **Intro**

Set inclusion is a partially order relation making it possible to extend the concept of $\lim\inf, \lim\sup$ for sets. We define the limit of a sequence sets $(A_n)_{n\in \mathbb N}$: 

$$
\begin{aligned}
    \underset{n\rightarrow \infty}{\lim\inf}
    A_n &= 
    \lim_{n\rightarrow\infty}
    \bigcap_{m\ge n} A_n, 
    \\
    \underset{n\rightarrow \infty}{\lim\sup}
    A_n &= 
    \lim_{n\rightarrow\infty}
    \bigcup_{m\ge n} A_n. 
\end{aligned}
$$

Observe that $\lim\inf$ of a set should always be a subset of $\lim\sup$. Sometimes we refers $\lim\inf$ of set to be the strong limit and $\lim\sup$ of the set to be the weak limit of the set sequence. 

---
### **Characterizing Sequential Limit using Set Limit**



