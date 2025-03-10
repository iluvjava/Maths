---
aliases:
  - Basics of Proximal Point Convergence in the Nonconvex case
---
Pre-req: 
- [Limiting Subgradient](../Non-Smooth%20Calculus/Limiting%20Subgradient.md)
- [Cantor's Intersection Theorem](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Cantor's%20Intersection%20Theorem.md)

---
### **Intro**

The content of the file is taken from chapter 5 of Boris Morducovhich book: Convex analysis and beyond. 
Lemma 5.1 in the chapter showed the convergence of the sequence of proximal point method in metric space. 
This is a very general argument as far as we see. 


---
### **Convergence of the algorithm**

Suppose $X$ is a complete metric space with metric $d$. 
The assumption of a complete metric means that we we will be looking for the limit of some sequences. 

#### **Def | Proximal Point Method in Metric Space**

> Let $f: X \rightarrow \overline \R$ be an l.s.c function that is bounded below. 
> For any $\epsilon > 0$, select $x_0$ to be such that 
> $$
> \begin{aligned}
>     f(x_0) \le \inf_{x} f(x) + \epsilon. 
> \end{aligned}
> $$
> For any $\lambda > 0$, define $F: X \rightarrow 2^X$ as: 
> $$
> \begin{aligned}
>     F(x):= 
>     \left\lbrace
>         y\in X \left| \;
>             f(y) + \frac{\epsilon}{\lambda} d(x, y) \le f(x)
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$
> and construct the sequence $(x_k)_{k \ge 0}$ iteratively using the relations: 
> $$
> \begin{aligned}
>     x_1 & \in \text{dom}\; f, 
>     \\
>     x_{k + 1} &\in F(x_k): f(x_{k + 1}) \le \left(
>         \inf_{x \in F(x_k)} f(x)
>     \right) + \frac{1}{k} \quad (k\in \N). 
> \end{aligned}
> $$
> Then there exists $z \in X$ such that $\{z\} = \bigcap_{k\in\N} F(x_k)$. 


**Observations**

The definition of the sequence $(x_k)_{k \ge0}$ looks suspiciously similar to the proximal point method. 
However, it has some subtle differences that we can not yet explain. 

**Proof**

Observe that: 
1. By definition of $x_1\in \text{dom}\; f$, $F(x_1) \neq \emptyset$. 
2. If $x_{k + 1} \in F(x_k)$, then $F(x_k)\neq \emptyset$.
3. $F(x_{k + 1})\neq \emptyset$ because $x_{k + 1}$ is in $F(x_{k + 1})$ always. 

Proceeding stepwise, we have the following key steps for our proof. 

1. **(Step I)**: $F(x_k)$ is closed for all $x_k$. 
2. **(Step II)**: $\forall k \in \N: F(x_{k + 1})\subseteq F(x_k)$. 
3. **(Step III)**: Verify $\{z\} = \bigcap_{k \in \N}F(x_k)$ is a singleton using Cantor's intersection theorem. 

**(Step II)**. We show that $F(x_k)$ is closed for all $x_k$. 
For all $x \in X$, let $\bar x \in F(x)$, take any sequence $F(x_k) \ni z_n \rightarrow \bar x$, by completeness of the metric and lower semi-continuity of $f$, it has: 

$$
\begin{aligned}
    f(\bar x) + \frac{\epsilon}{\lambda}d(\bar x, x_k) 
    \le
    \left(
        \liminf_{n\rightarrow \infty} 
        f(z_n) + \frac{\epsilon}{\lambda}d(z_n, x_k)
    \right)
    \le f(x_k). 
\end{aligned}
$$
Therefore, $\bar x \in F(x)$. 

**(Step II)**. We show that for all $k \in \N: F(x_{k + 1})\subseteq F(x_k)$. 
Pick any $y \in F(x_{k + 1})$ then 
$$
\begin{aligned}
    f(y) + \frac{\epsilon}{\lambda} d(x_{k + 1}, y)
    \le f(x_{k + 1}). 
\end{aligned}
$$

By $x_{k + 1} \in F(x_k)$, it has 

$$
\begin{aligned}
    f(x_k) &\ge 
    f(x_{k + 1}) + \frac{\epsilon}{\lambda}d(x_{k}, x_{k + 1}) 
    & 
    \\
    &\ge 
    \left(
        f(y) + \frac{\epsilon}{\lambda}d(x_{k + 1}, y)
    \right) + 
    \frac{\epsilon}{\lambda}d(x_{k}, x_{k + 1}) & y \in F(x_{k + 1})
    \\
    &\ge 
    f(y) + \frac{\epsilon}{\lambda} d(x_{k}, y).  & \text{triangle inequality. }
\end{aligned}
$$

Therefore, $y \in F(x_{k})$ as well. 

**(Step III)**.
We can use Cantor's intersection theorem, it has $\text{diam}\; F(x_k) \rightarrow 0$. 
because we checked that $F(x_k) \neq \emptyset$ for all $n \in \N$ from **(Step I)**.
It remains to check that $\text{diam}(F_n)\rightarrow 0$.
To show, take any $y \in F(x_{k + 1})$, then by definition it has 

$$
\begin{aligned}
    \frac{\epsilon}{\lambda}d(y, x_{k + 1}) 
    &\le 
    f(x_{k + 1}) - f(y)
    \\
    &\le \left(
        \inf_{x \in F(x_k)} f(x) + \frac{1}{k}
    \right) - f(y) 
    & x_{k + 1} \in F(x_k)
    \\
    &\le 
    \left(
        \inf_{x \in F(x_{k + 1})} f(x) + \frac{1}{k}
    \right)
     - f(y) 
    &  \text{by }F(x_{k + 1}) \subseteq F(x_k)
    \\
    &\le 1/k. 
\end{aligned}
$$

Therefore, the last line yields the result $d(y, x_{k + 1})\le \frac{\lambda}{\kappa\epsilon}$ for all $k \in \N$. 
Using triangle inequality, we have for all $u \in F(x_{k + 1})$ that $d(y, x_{k + 1}) \le d(y, u) + d(y, x_{k + 1})\le 2\frac{\lambda}{\kappa\epsilon}$. 
Therefore, the set $F(x_k)$ indeed converges to a singleton. 


**Remarks**

No assumptions on convexity, this one only requires a complete metric space for limit of sequences, lsc to ensure the closure of the set$F(x_k)$. 
Nothing is said about the convergence of $f(x)$ yet. 
The convergence is possible even if the set of minimizer is non-unique. 

Of course, $F(x)$ is a subset of the level set of $f$ at height $f(x)$. 


