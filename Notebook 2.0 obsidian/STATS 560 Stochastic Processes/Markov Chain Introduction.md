- [Conditional Probability, Expectations](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/Conditional%20Probability,%20Expectations.md)
- [Theories of Probability Conditioning](../AMATH%20561%20Probability%20Theory/Probability%20Basics/Theories%20of%20Probability%20Conditioning.md)

---
### **Intro**

We introduce discrete, finite probability markov chain here. In Rick book there are more advanced definition for a Markov chan in the abstract probability spaces. We skip that one and follow the undergraduate "Essence of Stochastic Processes" for the Markov chain materials here. 

**Definition | Markov Chain**

> $X_n$ is a sequence of random variables indexed by $n$, it's a Markov chain when we have: 
> 
> $$
> \begin{aligned}
>     \mathbb P(X_n = x| σ(\{X_i\}_{i = 1}^n)) = \mathbb P(X_n = x |X_{n -1})
>     \quad \forall x \in S, 
> \end{aligned}
> $$
> 

Where $S$ is refers to the state space of $X$. The sequence of random variable can be from a finite set, infinite set, or an uncountable set. When $|S|$ is countable, we use a matrix to determine the probability of $\mathbb P(X_{n + 1} = x_{n + 1}| X_n = x_n)$, in other cases, we will consider the transition Kernel. To apply the transition kernel is to convolve the probability mass function on the probability space, which is applied functional analysis. In this file, we will avoid discussion of the topic. 

**Transition Matrix**

A transition matrix can be used if, the transition probability is the same for all $n$ (The Markov chain is time Homogenous). Define the transition matrix to be a matrix whose columns are probability assignment, given as: 

$$
\begin{aligned}
    p(i | j) = P(i, j) = \mathbb P(X_{n + 1} = j| X_n = i) \quad \forall (i, j)\in S \times S, 
\end{aligned}
$$

we make these 2 different notation, when I use $P(i, j)$, then it would implies conditioning on a exixting distribution requires a left row multiplication on the matrix $P$, and if I use $p(i |j)$, I am doing it for a short hand on the conditional probability. 


---
### **Chapman Kolmogorov**

Let $(X_n)_{n\in \mathbb N}$ be a Markov chain then direct from the conditional probability chain rule, we consider the probability of observing a particular sequence given the distribution of the random variable $X_0$. Consider any events $E_i = \{X_i \in A_i\}, 1 \le i \le n$, and let $E_0 = \{X_0 = x_0\}$, events for each of the random variable then 

$$
\begin{aligned}
    & \quad
    \left(
    \prod_{k = 1}^{n} 
    P\left(
        E_k \left| 
        \bigcap_{i = 0}^{k - 1}E_i
    \right.\right)
    \right)P(E_0) 
    \\
    &= \left(
        \prod_{k = 1}^{n} 
        P\left(
            E_k \left| 
            E_{k - 1}
        \right.\right)
    \right)P(E_0), 
\end{aligned}
$$

which is a chapman Kolmogorov equation in probability form, to consider the matrix multiplication the describes this procedures, we may write it matrix multiplication form as

$$
\begin{aligned}
    P\left(
        \bigcap_{i = 1}^n \{X_i = x_i\}
    \right) &= 
    \sum_{(x_0, \cdots, x_n)\in \bigotimes_{i = 0}^n A_i}^{}
    \left(
        \prod_{k=1}^{n-1} 
        P(x_{i}, x_{i + 1})
    \right)
    P(X_0 = x_0). 
\end{aligned}
$$

Which, is in facta matrix multiplication in disguise. For example, if, the events set $A_i$ are just a singleton of $\{x_i\}$, then we have a simple chain of scalar product, if instead they are a set, then we are multiplying different sizes of sub-matrices from the transition matrix $P$. Finally, conditioning on any state $X_m$ can still work. The chain of events is memoriless. 

 
**References**

This is my own work. 

---
### **Conditioning on Intermediate States yield Independent Chains**

The following claim is relevant to stopping time and it make use of the Markov property. 

#### **Claim-1 | Independent Sub-Chains**
> Suppose that distribution for a sequence of intermediate steps with $n_0 = 0, n_1, n_2, \cdots, n_k$ where given with $P(X_{n_i}\in A_i) = 1$, certainty, then these probability distribution will break apart the probability of observing the whole sequence into independent events of observing $k$ many sequences of $X_{n_i},\cdots, X_{n_{i + 1}}$. 

**Proof**

For simplicity, we consider that there exists an intermediate state with event description $X_j \in A_j$, and we have initial state of $X_0 \in A_0$, and the final state of $X_n \in A_n$. Further suppose that we want to condition on $P(X_0 \in A_j) = 1 = P(X_k\in A_k)$ then

$$
\begin{aligned}
    & \quad 
    P(X_n\in A_n \cap A_k \in A_k \cap X_0 \in A_0)
    \\
    &= 
    P(X_n \in A_n| X_k\in A_k \cap X_0\in A_0)P(X_k \in A_k\cap X_0\in A_0)
    \\
    &= P(X_n \in A_n| X_k\in A_k)P(X_k \in A_k\cap X_0\in A_0) \quad \text{ by markov property}
    \\
    &= P(X_n \in A_n \cap X_k\in A_k)P(X_k \in A_k\cap X_0\in A_0) \quad \text{ by }P(X_k\in A_k) = 1
    \\
    &= P(X_{n -k} \in A_n\cap X_0\in A_k)P(X_k \in A_k\cap X_0\in A_0), 
\end{aligned}
$$

where, the events of observing the whole chain has been decomposed into observing 2 chains, with length $k$ and $n - k$, conditioned on different events. This is sometimes called the *Strong Markov property*. 


**References**

My own math. 