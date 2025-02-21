[[Functional Spaces/Metric Space Introduction]]

---
### **Intro**

In this file we discuss the l-p sequence space. This is a great example of a metric space that can change into all different types of metric space given different parameters of $p$, and it also contains good subspace for discussion on topics related to functional analysis. 

To start, we define the inner product as an operations on infinite sequences. Let $x, y$ be 2 sequences, then their inner product $\langle x, y\rangle := \sum_{i = 1}^\infty x_i y_i$. This is a notation that will simplify our discussion and it has not much to do with the inner product spaces. 

---
### **The Sequence Space**

A sequence space refers to $(a_i)_{i\in \mathbb N}$, and it's a vector space. For notations, we usually use $\mathbb K$ to represent some field, in the case of $\mathbb R$ or $\mathbb C$, the real and the complex numbers, we denote sequence of numbers in that space as: $\mathbb R^{\mathbb N}, \mathbb C^{\mathbb N}$. More over it's a vector field. One can just intuitively treat a sequence of number as a vector that has countable many numbers in it. 

**Source**: 

For more see [wiki](https://en.wikipedia.org/wiki/Sequence_space). 

**General Hierarchy:** 

Metric, Norm, Inner Product. Inner Product Induces Norms and Norms Induces Metric. 

---
### **$\mathcal l^p$ Subspaces**

**Definition**: 

> For any $0< p < \infty$, $l^p$ denotes the subspace of $\mathbb K^{\mathbb N}$ where a sequence $(x_n)_{n\in \mathbb N}$ such that: 
> 
> $$
> \begin{aligned}
>    \sum_{n = 1}^{\infty}|x_n|^p < \infty
> \end{aligned}
> $$

**Equipped with Norm**

> The space is also equipped with the norm ONLY for $p> 0$, where $\Vert \cdot \Vert_p$ on $l^p$ denotes: 
> 
> $$
> \begin{aligned}
>    \Vert x\Vert_p = \left(\sum_{n = 1}^{\infty}|x_n|^p\right)^{1/p}
> \end{aligned}
> $$

Now, we have $l^p$ as a vector space, and then a Banach space. And of course, for some special choice of $p$, we have a Hilbert Space, still a Banach Space and a metric space only for $0< p < 1$

**Remarks**: 

The definition of the $l^p$ forms subspace because linear combinations of such sequences preserves their convergence properties under the given norm space. 


---
### **Norm for l-p Sequence**

To start, we show the norm defined for the $l^p$ sequence space is indeed a metric. 

#### **Def | Conjugate Pairs**
> $p, q$ are conjugate pairs if they satisfies: $p^{-1} + q^{-1} = 1$. 


#### **Theorem | Fenchel's Young's Inequality (Fenchel's Inequality)**
> If $\alpha,\beta> 0$, $p> 1$, and $p, q$ are conjugate to each other, we have the inequality: $\alpha\beta \le p^{-1}\alpha^{p} + q^{-1}\beta^q$. 

**Proof**

Let $f(\beta) = \alpha\beta - q^{-1}\beta^q$. 
Observe that if $p > 1$, then $q = (1 - p)^{-1} > 1 \iff q - 1 > 0$ using the fact that $(p, q)$ is a conjugate pair with each other. 
Here are the major intermediate results of the proof. 

- **(Step I)**: $f'(\beta) = \alpha = \beta^{q - 1}$ monotone decrases and has $f'(\alpha^{1/(q - 1)}) = 0$, hence maximum at $\beta^* = \alpha^{1/(q - 1)}$. 
- **Step (II)**: Substituting back it has $f(\beta^*) = p^{-1}\alpha^p$, which is the maximum. 

$\blacksquare$


#### **Theorem | Holder's Inequality (Cauchy Inequality)**

> Let $p, q > 0$ be a conjugate pairs and let $a, b \in \mathbb R^n_+$, then $\Vert a\Vert_p\Vert b\Vert_q \le \langle a, b\rangle$. 

**Proof**

We define positive constants: $\alpha_1 = a_i/\Vert a\Vert_p, \beta_i = b_i/\Vert b\Vert_q$, then $\alpha_i, \beta_i \ge 0$ for all indices, applying Fenchel's inequality we have: 

$$
\begin{aligned}
    (\forall i = 1, \ldots, n): \alpha_i\beta_i &\le \frac{\alpha_i^p}{p} + \frac{\beta_i^q}{q}
    \\
    \implies 
    0
    &\le 
    \sum_{i = 1}^{n}\frac{\alpha_i^p}{p} + 
    \sum_{n = 1}^{n} \frac{\beta_i^q}{q}
    - \sum_{i = 1}^{n}\alpha_i\beta_i 
    \\
    &=
    p^{-1}\left(\sum_{i = 1}^{n} \frac{a_i^p}{\Vert a\Vert_p^p}\right) + 
    q^{-1}\left(\sum_{i = 1}^{n}\frac{b_i^q}{\Vert b\Vert_q^q}\right) 
    -
    \left\langle 
        \frac{a}{\Vert a\Vert_p}, \frac{b}{\Vert b\Vert_q}
    \right\rangle
    \\
    &= 1 -  \left\langle 
        \frac{a}{\Vert a\Vert_p}, \frac{b}{\Vert b\Vert_q}
    \right\rangle
    \\
    &= \Vert a\Vert_p \Vert b\Vert_q \left(
        \Vert a\Vert_p \Vert b\Vert_q - \langle a, b\rangle
    \right)
    \\
    \iff 
    0
    &\le 
    \Vert a\Vert_p\Vert b\Vert_q - \langle a, b\rangle
\end{aligned}
$$

Take note that this is very similar to the Cauchy Dual Norm Inequality. 
$\blacksquare$

**Remarks**: 

Reader, please make comparison with [Fenchel Identity, Inequality](../AMATH%20516%20Numerical%20Optimizations/Duality/Fenchel%20Identity,%20Inequality.md). 
The $\Vert \cdot\Vert_p, \Vert \cdot\Vert_q$ are dual norms to each other. 

#### **Thm | Minkowski Inequality (Triangle Inequality)**

> Here we show that the metric $\Vert x\Vert_p$ with $p \ge 1$ is satisfies the triangular inequality property of a metric space. 

**Proof**

Let $a, b$ be any vector in $\mathbb R^n$, then $|a_i + b_i| \le |a_i| + |b_i|$, then $(|a_i + b_i|)^p \le (|a_i| + |b_i|)^p$ by $p > 1$, hence 
$$
\begin{aligned}
    0
    &\le 
    \left(\sum_{i = 1}^{n}
        (|a_i| + |b_i|)^p
    \right)
    -
    \left(\sum_{i = 1}^{n}|a_i + b_i|^p\right) 
    \\
    \iff
    0
    &\le 
    \left(\sum_{i = 1}^{n}
        (|a_i| + |b_i|)^p
    \right)^{1/p}
    -
    \left(\sum_{i = 1}^{n}|a_i + b_i|^p\right)^{1/p}. 
\end{aligned}
$$

The power of $1/p$ with $p > 1$ is a monotone mapping which preserves the above inequlity hence the above inequalities are equivalent. 
We target the RHS of the expression and seek for an upper bound on that quantity. 
Here we use the notation of $w^{\langle p\rangle}$ to denote taking the power of a vector element wise. 
Define $w_i = |a_i| + |b_i|$, so it has $\sum_{i= 1}^{n}w_i^p = \sum_{i = 1}^{n} w_i^{p - 1}|a_i| + \sum_{i = 1}^{n}w_i^{p-1}|b_i|$. 
Applying Holder's inequality on RHS yields: 

$$
\begin{aligned}
    0
    & \le 
    \left\Vert w^{\langle p - 1\rangle}\right\Vert_q
    \Vert a\Vert_p
    \left(
        \sum_{i = 1}^{n} w_i^{p-1}|a_i|
    \right), 
    \\
    0
    & \le 
    \left\Vert w^{\langle p - 1\rangle}\right\Vert_q
    \Vert b\Vert_p
    -
    \left(
        \sum_{i = 1}^{n}w_i^{p - 1}|b_i|
    \right)
    \\
    \implies
    \sum_{i= 1}^{n}w_i^p
    &\le 
    \left\Vert w^{\langle p - 1\rangle}\right\Vert_q
    \Vert a\Vert_p + 
    \left\Vert w^{\langle p - 1\rangle}\right\Vert_q
    \Vert b\Vert_p. 
\end{aligned}
$$

Next we consider re-arranging $\Vert w^{\langle p - 1\rangle}\Vert_q$: 

$$
\begin{aligned}
    \left\Vert w^{\langle p - 1\rangle}\right\Vert_q
    &=
    \left(
        \sum_{i = 1}^{n}
            \left(w_i^{p - 1}\right)^q
    \right)^{1/q}
    = 
    \left(
        \sum_{i = 1}^{n}
        w_i^{p}
    \right)^{1/q}.
\end{aligned}
$$

Using $pq = p + q$ being a conjugate pair it makes: 

$$
\begin{aligned}
    0
    &\le 
    \left(\sum_{n = 1}^{n} w_i^p\right)^{1/q}
    \Vert a\Vert_p
    + 
    \left(\sum_{n = 1}^{n}w_i^p\right)^{1/q}
    \Vert b\Vert_p
    -
    \sum_{i = 1}^{n} w_i^p 
    \\
    \iff 
    0
    &\le 
    \Vert a\Vert_p + \Vert b\Vert_p
    -
    \left(
        \sum_{i = 1}^{n}
        w_i^p
    \right)^{1 - 1/q}
    \\
    &= 
    \Vert a\Vert_p + \Vert b\Vert_p
    -
    \Vert a + b\Vert_p
\end{aligned}
$$

Take note that $1 - \frac{1}{q}$ is $1/p$ by the fact that they are conjugate to each other. At this point we had finished the proof. This is a metric space and the other parts of the properties are trivial to prove. 

**Remarks**: 

We can take the limit at both side of the inequality to extend the inequality to l-p spaces with infinitely many entries in it. 

