
Pre-requisite 
- [Convergence of Cauchy Sequences](MATH%20000%20Math%20Essential/Analysis/Convergence%20of%20Cauchy%20Sequences.md)


---
### **Intro**

We give a list of examples of convergent sequences where I had experienced at one point or another. 



### **Example in 1d**

Sequences in $\R$. 

#### **Example 1 | Cesaro Stolz sequence**
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

See [Stolz Casero Theorem](MATH%20000%20Math%20Essential/Analysis/Stolz%20Casero%20Theorem.md). 


#### **Example 2 | Quasi-monotone convergence**
> Let $(\epsilon_k)_{k \ge 0}$ has $\epsilon_k \ge 0 \;\forall k \in \N$ and $\sum_{i = 0}^{\infty} \epsilon_i = S < \infty$. 
> Suppose sequence $(\alpha_k)_{k \ge 0}$ has $0 \le\alpha_{k + 1} - \alpha_k \le \epsilon_k \; \forall k \ge 0$, then: 
> 1. $\alpha_k$ is bounded. 
> 2. $\alpha_k$ converges to some limit. 

**Proof**

See [Fejer's Monotone](AMATH%20516%20Numerical%20Optimizations/Operators%20Theory/Fejer's%20Monotone.md), but we will do it again here differently. 
To show (1.), we have 

$$
\begin{aligned}
    0\le \sum_{i = 0}^{k} \alpha_{i + 1} - \alpha_{i} = \alpha_{k + 1} - \alpha_0 \le 
    \sum_{i = 0}^{k} \epsilon_i \le S. 
\end{aligned}
$$

In fact, the sequence is Cauchy as well following a similar argument. 
Choose any $n \in \N$, consider telescoping partial sum 

$$
\begin{aligned}
    0 \le \sum_{i = n}^{k + n - 1} \alpha_{i + 1} - \alpha_i
    = \alpha_{n + k} - \alpha_n 
    &\le \sum_{i = n}^{k + n - 1} \epsilon_i 
    \le \sum_{i = n}^{\infty} \epsilon_i = S - \sum_{i = 0}^{n}\epsilon_i. 
\end{aligned}
$$

On the RHS, from the convergence of summed $\epsilon_i$ as $n\rightarrow \infty$, it converges to zero. 
Since this is true for all $k, n$, the sequence is Cauchy, and therefore it also has a limit. 


#### **Example 3 | Bounded big product sufficient but not necessary condition**
> Suppose that sequence $\alpha_i > -1$ for all $i \in \N$, the following scenarios are true: 
> 1. If $\sum_{i = 1}^{\infty} = A < \infty$, then $0 \le \prod_{i = 1}^{n} \left(1 + \alpha_i\right)\le \exp(A)$. The big product is bounded for all $n$. 
> 2. There exists a sequence $\alpha_i > -1$, $\sum_{i = 1}^{n}\alpha_i$ diverges, but $\prod_{i = 1}^n (1 + \alpha_i)$ still converges. 

**Observations**

(1.) provides a sufficient conditions for the big product $\prod_{i = 1}^{n} \left(1 + \alpha_i\right)$ to be bounded. 
(2.) Shows that the condition is stronger, and not always required for a big product of the form to converge. 

**Proof**

The proof is direct via 

$$
\begin{aligned}
    \prod_{i = 1}^{n} \left(1 + \alpha_i\right)
    &\le \exp\left(
        \sum_{i = 1}^n \ln(1 + \alpha_i)
    \right)
    \\
    &\le \exp\left(
        \sum_{i = 1}^n \ln(1) + \frac{d}{dx}\left[\ln(1 + x)\right|_{x = 1}\alpha_i
    \right) \quad & \text{$\ln(1 + x)$ is concave. }
    \\
    &=
    \exp\left(
        \sum_{i = 1}^n \ln(1) + \alpha_i
    \right)
    \le \exp(A). 
\end{aligned}
$$

Therefore, (1.) is proved. 
Consider $\alpha_i = - 2/(2 + i)$, which doesn't give a convergence series, but the product will converge. 
The big product is 

$$
\begin{aligned}
    \prod_{i = 1}^{n} \left(1 - \frac{2}{i + 2}\right)
    &= \prod_{i = 1}^{n} \left(\frac{i}{i + 2}\right) = 
    \prod_{i = 1}^{n} \left(\left(
        \frac{i}{i + 1}
    \right)\left(
        \frac{i + 1}{i + 2}
    \right)\right)
    \\
    &= 
    \prod_{i = 1}^{n} \left(
        \frac{i}{i + 1}
    \right)
    \prod_{i = 2}^{n - 1} \left(
        \frac{i}{i + 1}
    \right)
    = (1/n)(2/n) = 2/n^2. 
\end{aligned}
$$

Taking the limit as $n \rightarrow$, the big product converges to zero, so it's definitely bounded. 
The sequence provided doesn't have finite sum, and therefore we showed that finite sum condition for the sequence $\alpha_i$ is not necessary. 


**Remarks**

A similar proof can use the fact that $(1 + x) \le \exp(x)$, so $(1 + \alpha_i) \le \exp(\alpha_i)$ which converts the product to the sum on the exponent. 


#### **Example 4 | Bounded velocities and bounded displacement**
> Suppose $(\alpha_k)_{k \ge 1}, (x_k)_{k \ge 0}$ are a non-negative sequences. 
> Assuming that $x_{k + 1} - x_k \ge 0$ for all $k \ge 0$, so it is monotone.
> If for all $k \ge 1$ they satisfies
> $$
> \begin{aligned}
>     \alpha_k(x_{k + 1} - x_k) 
>     &\le 
>     \alpha_{k - 1}(x_{k} - x_{k - 1}). 
> \end{aligned}
> $$
> Then the following scenarios are true: 
> 1. If $\alpha_k$ diverges, then successive error $x_{k + 1} - x_k$ converges to zero. 
> 2. If $\sum_{i = 1}^k\alpha_i^{-1}$ is convergent, then the sequence $x_k$ is bounded and has a limit. 


**Proof**

With some examinations, it shows that for all $k \ge 1$: 

$$
\begin{aligned}
    0\le x_{k + 1 } - x_k &\le (\alpha_{k - 1}/\alpha_k)(x_k - x_{k - 1})
    \\
    &\le (\alpha_{k - 1}/\alpha_k)(\alpha_{k - 2}/\alpha_{k - 1})(x_{k - 1} - x_{k - 2})
    \\
    & \cdots
    \\
    &\le (\alpha_{1}/\alpha_{k})(x_1 - x_0). 
\end{aligned}
$$

So obviously if $\alpha_k \rightarrow \infty$, it gives convergence of $x_{k +1} - x_k$. 
Summing up the inequality for $i = 1, \cdots, k - 1$, it yields that 

$$
\begin{aligned}
    \sum_{i = 1}^{k - 1} x_{i + 1} - x_i = x_k - x_1 \le
    (x_1 - x_0)\sum_{i = 1}^{k - 1} \alpha_1/\alpha_k
\end{aligned}
$$

The right-hand side is a convergent series by convergence of $\sum_{i = 1}^{k}\alpha_i^{-1}$. 


---
### **Example in Finite Euclidean space**

