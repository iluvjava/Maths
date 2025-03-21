[Real Analysis Basics](Real%20Analysis%20Basics.md)


---
### **Intro**

A sequence can have many subsequential limit. 
In this file we are interested in the highest and the lowest such subsequential limit. 

#### **Def | Limit Supremum, Limit Infimum of real sequence**
> Let $(a_n)_{n \in \N}$ be a sequence in $\R$. 
> Then we define: 
> 1. $\liminf_{n\rightarrow \infty} a_n = \lim_{m \rightarrow \infty} \sup_{n \ge m}a_n$, 
> 2. $\limsup_{n\rightarrow \infty} a_n = \lim_{m \rightarrow \infty} \inf_{n \ge m}a_n$. 


#### **Theorem | Limit Supremum and subsequential limit**
> Let $(a_n)_{n \in \N}$ be a sequence in $\R$. 
> Define the set of all subsequential cluster points of the sequence by
> $$
> \begin{aligned}
>     C = \left\lbrace
>         c \in \R^n \left| 
>             (\forall m \in \N): \inf_{n \ge m} |a_n - c| = 0
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$
> Then $\liminf_{n \rightarrow \infty} a_n = \inf C$ if the limit infimum exists. 

**Proof**

By existence of limit infimum as statement hypothesis let $L = \liminf_{n\rightarrow \infty} a_n$ then $L \in C$ because 

$$
\begin{aligned}
    0 &= \left(
        \lim_{m\rightarrow \infty} \inf_{n \ge m} a_n
    \right) - L
    \\
    &= \lim_{m\rightarrow \infty}  \inf_{n \ge m} \left\lbrace
        a_n - L
    \right\rbrace
    \\
    \iff 
    0 &= 
    \left|\lim_{m\rightarrow \infty}  \inf_{n \ge m} \left\lbrace
        a_n - L
    \right\rbrace
    \right|
    \\
    &= \lim_{m\rightarrow \infty} \inf_{n \ge m} |a_n - L|
    \\
    \implies L &\in C. 
\end{aligned}
$$

But if $c \in C$ then $c \ge L$ because 

$$
\begin{aligned}
    0 &= 
    \lim_{m\rightarrow \infty} \inf_{n \ge m} |a_n - c|
    \\
    &\ge 
    \lim_{m\rightarrow \infty} \inf_{n \ge m} (a_n - c)
    \\
    &\ge 
    \left(
        \lim_{m\rightarrow \infty} \inf_{n \ge m} a_n
    \right) - c
    \\
    &= L - c. 
\end{aligned}
$$

Therefore $L = \inf C$. 


---
### **Some properties of Limit Infimum and Limit Supremum**
