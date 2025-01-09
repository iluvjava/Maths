
Pre-requisite 
- [Convergence of Cauchy Sequences](MATH%20000%20Math%20Essential/Analysis/Convergence%20of%20Cauchy%20Sequences.md)


---
### **Intro**

We give a list of examples of convergent sequences where I had experienced at one point or another. 



### **Example in 1d**


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
> Let $(\epsilon_k)_{k \ge 0}$ has $\epsilon_k \ge 0 \;\forall k \in \N$ and $\sum_{i = 0}^{\epsilon_k} = S < \infty$. 
> Suppose sequence $(\alpha_k)_{k \ge 0}$ has $\alpha_{k + 1} - \alpha_k \le \epsilon_k \; \forall k \ge 0$, then: 
> 1. $\alpha_k$ is bounded. 
> 2. $\alpha_k$ converges to some limit. 

**Proof**

See [Fejer's Monotone](AMATH%20516%20Numerical%20Optimizations/Operators%20Theory/Fejer's%20Monotone.md) for more. 


#### **Example 3 | Bounded big product sufficient but not necessary condition**
> Suppose that sequence $\alpha_i > -1$ and $\sum_{i = 1}^{\infty}\alpha_k = A < \infty$. 
> Then we have 
> 1. $0 \le \prod_{i = 1}^{n} \left(1 + \alpha_i\right)\le \exp(A)$. The big product is bounded. 
> 2. There exists a sequence $\alpha_i > -1$, $\sum_{i = 1}^{n}\alpha_i$ diverges, but $\prod_{i = 1}^n (1 + \alpha_i)$ still converges. 

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

Therefore (1.) is proved. 
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

Taking the limit as $n \rightarrow$, the big product converges to zero so it's definitely bounded. 
The sequence provided doesn't have finite sum, and therefore we showed that finite sum condition for the sequence $\alpha_i$ is not necessary. 


#### **Example 4 | Bounded velocities and bounded displacement**




---
### **Example in Finite Euclidean space**

