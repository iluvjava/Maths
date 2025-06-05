- [Real Analysis Basics](Real%20Analysis%20Basics.md)


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
$\blacksquare$

**Remark**

Since the limit infimum is in the set of cluster point, it means there also exists a subsequence that converges to limit infimum. 

---
### **Some properties of Limit Infimum and Limit Supremum of Sequences**

#### **Lemma | Liminf first inequality**
> For any two sequences $a_n, b_n$ in $\R$, it has the inequality 
> $$
> \begin{aligned}
>     \liminf_{n\rightarrow \infty} a_n + b_n &\ge 
>     \liminf_{n\rightarrow \infty} a_n + 
>     \liminf_{n\rightarrow \infty} b_m. 
> \end{aligned}
> $$

**Proof**

The proof is direct. 
$$
\begin{aligned}
    \liminf_{k\rightarrow \infty} a_k + b_k
    &= \lim_{k\rightarrow \infty} \inf_{\substack{m \ge k \\ n \ge k}}\left\lbrace
        a_m + b_n |\; m = n
    \right\rbrace
    \\
    &\ge \lim_{k\rightarrow \infty} \inf_{\substack{m \ge k \\ n \ge k}}\left\lbrace
        a_m + b_n
    \right\rbrace
    \\
    &= \lim_{k\rightarrow \infty} \inf_{m \ge k} a_m + 
    \lim_{k \rightarrow \infty} \inf_{n \ge k} b_n. 
\end{aligned}
$$

#### **Lemma | Liminf composite sequence**
> Suppose $(a_k)_{k \ge 0}, (b_k)_{k \ge 0}$ are sequences in $\R$. 
> Suppose in addition that $\lim_{k\rightarrow \infty} b_k = b$ which has a limit. 
> Then 
> $$
> \begin{aligned}
>     \liminf_{k\rightarrow \infty} a_k + b_k = b + \liminf_{k \rightarrow \infty} a_k. 
> \end{aligned}
> $$

**Proof**

The proof is direct.
Because $b_n$ has a limit it's true that $\liminf_{k \rightarrow \infty} b_k = b$. 
Using previous lemma it has: 
$$
\begin{aligned}
    \liminf_{k\rightarrow \infty} a_k + b_k 
    &\ge \liminf_{k\rightarrow \infty} a_k + \liminf_{k\rightarrow \infty} b_k 
    \\
    &= \liminf_{k\rightarrow \infty} a_k + b. 
\end{aligned}
$$

Next, using it again 

$$
\begin{aligned}
    0 &\le \liminf_{k \rightarrow \infty} a_k + b_k - b_k + 
    \liminf_{k \rightarrow \infty} b_k - \left(
        \liminf_{k\rightarrow \infty} a_k + b_k
    \right)
    \\
    &= 
    \left(
        \liminf_{k \rightarrow \infty} a_k
    \right) + 
    b - \left(
        \liminf_{k\rightarrow \infty} a_k + b_k
    \right). 
\end{aligned}
$$

It's now done. 

---
### **Limit Supremum, Limit Infimum of functions**



#### **Definition | Limit Supremum, Infimum of a function**
> Let $f: \R^n \rightarrow \R$ be a function. 
> Then we define limit infimum, and limit supremum at some point $\bar x \in \R^n$ to be: 
> $$
> \begin{aligned}
>     \liminf_{x\rightarrow \bar x}
>     f(x)
>     &= 
>     \lim_{\epsilon \searrow 0}
>     \left(
>         \inf_{x} 
>         \left\lbrace
>             f(x) \left| \;
>                 0 < \Vert x - \bar x\Vert \le \epsilon
>             \right.
>         \right\rbrace
>     \right)
>     \\
>     &= 
>     \lim_{\epsilon \searrow 0}
>     \left(
>         \inf_{x \in \epsilon \mathbb B(\bar x)\setminus \{\bar x\}} f(x) 
>     \right), 
>     \\
>     \limsup_{x\rightarrow \bar x}
>     f(x)
>     &= 
>     \lim_{\epsilon \searrow 0}
>     \left(
>         \sup_{x} 
>         \left\lbrace
>             f(x) \left| \;
>                 0 < \Vert x - \bar x\Vert \le \epsilon
>             \right.
>         \right\rbrace
>     \right)
>     \\
>     &= \lim_{\epsilon \searrow 0}
>     \left(
>         \sup_{x \in \epsilon \mathbb B(\bar x)\setminus \{\bar x\}} f(x) 
>     \right). 
> \end{aligned}
> $$

**Notes**

Take note that, when the function $f$ is lower semi-continuous, it has: 

$$
\begin{aligned}
    \liminf_{x \rightarrow \bar x} f(x)
    &= 
    \lim_{\epsilon \rightarrow 0}\inf_{x \in \epsilon \mathbb B(\bar x)\setminus \{\bar x\}}
    f(x)
    \ge 
    \lim_{\epsilon \rightarrow 0}\inf_{x \in \epsilon \mathbb B(\bar x)}
    f(x) \ge f(\bar x). 
\end{aligned}
$$

Analogous results for limit supremum exists. 
Similarly, this definition defines lower semi-continuity of a function. 



#### **Definition | Lower semi-continuity of function**
> A function $f: \mathbf{E}\mapsto \mathbb{\bar{R}}$, then the function is lower semi-continuous if: 
> $$
>   \forall x \in \mathbf{E}: \liminf_{y\rightarrow x} f(y)\ge f(x). 
> $$


See [Lower Semi-Continuity](../../AMATH%20516%20Numerical%20Optimizations/Background/Lower%20Semi-Continuity.md) for lot more information. 

