- [Moment Generating Functions](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/Moment%20Generating%20Functions.md), a similar idea as generating function is used. 
- [Markov Chain Introduction](Markov%20Chain%20Introduction.md), the branching process is, a Marko Process. 

---
### **Intro**

We statement the problem and then we attempt to answer it. 


#### **Problem | Organism Reproductions** 
> An initial population size $X_0 \in \mathbb N$ is given, as a constant. Each individual in the populations underwent reproduction and death, denoting using $\xi^{(k)}_i$, it's the random variable representing the process for the $i$ th individual at generation $k$. For simplicity, we assume that it's an i.i.d random variable for all $k, i$. Let $\xi$ be Bernoulli and switches between $3, 0$ with probability $p, (1 - p)$. The interpretation would be each individual give birth to 2 individuals with probability $p$, or, it dies without reproduction otherwise. 

**Markovian Description**

The population of each generation can be described via a sequence of R.Vs that is a Markov Chain, it has the expression of 

$$
\begin{aligned}
    X_k = \sum_{i = 1}^{X_{k - 1}} 
    \xi_i^{(k)}, 
\end{aligned}
$$

observe that the summation has nice representation under the view of moment generating functions. We first, describes the expected value of the populations. 


---
### **Expected Populations and a Recurrence Relations**

The expected value of the populations at a specific generation is a geometric sequence. 

#### **Claim-1 | A Recurrence Relations on the Expected Value of Populations**
> The expected value of $X_k$, is a geometric sequence with ratio $\bar \xi$, and the multiplier is $\mathbb{E}\left[X_0\right]$, specifically $\mathbb E[X_k | X_0] = \bar \xi^k \mathbb E[X_0]$. 


**Demonstrations**

The expected value for populations is a geometric sequence recall that we have a filtration here, meaning that the $\sigma$-algebra for $X_{k + 1}$ only depends on the $\sigma$-algebra for $X_k$. We consider the random variable

$$
\begin{aligned}
    \mathbb{E}\left[X_k | X_{k- 1}\right]
    &= 
    \mathbb{E}\left[
        \left.\mathbb{E}\left[
            \sum_{i = 1}^{X_{k - 1}}
                \xi_i
        \right]
        \right|
        X_{k - 1}
    \right]
    \\
    &= 
    \mathbb{E}\left[
        \left.
        \sum_{i = 1}^{X_{k - 1}}
            \mathbb{E}\left[
                \xi_i
            \right]
        \right|
        X_{k - 1}
    \right]
    \\
    \text{let }\bar \xi = \mathbb{E}\left[\xi_i\right],
    &= \bar \xi X_{k - 1}, 
\end{aligned}
$$

using this recurrence relations, conditioning on the initial populations gives

$$
\begin{aligned}
    \mathbb{E}\left[
        X_k | X_0
    \right] &= 
    \mathbb{E}\left[
        \left.
            \mathbb{E}\left[
                X_k | X_{k - 1}
            \right]
        \right|
        X_0
    \right]
    \\
    &= \mathbb{E}\left[
        \mathbb{E}\left[
            \mathbb{E}\left[X_k | X_{k - 1}\right]
            | X_{k - 1}
        \right]
        | X_0
    \right]
    \\
    &= 
    \mathbb{E}\left[
        \mathbb{E}\left[
            \cdots
            \mathbb{E}\left[
                \mathbb{E}\left[X_k | X_{k - 1}\right]
                | X_{k - 1}
            \right]
            \cdots
            |X_1
        \right]
        | X_0
    \right]
    \\
    &= \bar \xi^k \mathbb{E}\left[X_0\right]. 
\end{aligned}
$$


It's quite obvious to realise that whenever $\bar \xi > 1$ or $\xi < 1$, the expected value of the populations goes to infinity, or zero as $k \rightarrow \infty$. 

**Remarks**

The critical value for the population Markov chain would be $\xi = 1$. Take note that, the random variable $X_k$ is a Martingale in general. However, whether it's a Martingale or not doesn't tell us about the distributions, it only tells us that the limit is converging to some type of distribution. For more about Martingale, consult Chapter 5 of Rick Durrett's "Essential of Stochastic Processes". 

---
### **Fixed Point Iterations and Critical Values Reproduction Value**

The probability of survival indefinitely depends on a fixed point iterations process, and the process only make sense for critical values of reproduction rate, meaning that $\mathbb E[\xi] = 1$. 

#### **Claim-2 | Low Term Survival Probability**
> If we define the function $G_k(t) = \mathbb E[t^{X_k} | X_0 = 1]$, then we obtain the following relations from the setup of our problem. 
> 1. $G_1(t) = \mathbb E[t^\xi]$. 
> 2. $\lim_{t\searrow 0}G_k(t) = P(X_k = 0 | X_0=1)$ is the probability of populations erased at, or before generation $k$. 
> 3. $G_{k + 1}(t) = G_{k}\circ G_1(t)$, an useful recurrence relation. 
> 
> The probability of population surviving indefinitely equals to $1 - \lim_{k\rightarrow \infty} G_{k}(0)$, and from the recurrence relation, this involves a fixed point iteration and the limit is the probability of surviving forever. 

**Demonstrations**

We first define the function $G_k(t) = \mathbb E[t^{X_k} | X_0 = 1]$. Consider the function for $k = 1$, giving 

$$
\begin{aligned}
    G_1(t) &= \mathbb{E}\left[
        t^{X_k} | X_0 = 1
    \right]
    \\
    &= 
    \mathbb{E}\left[t^\xi\right]
    \\
    \mathbb{E}\left[t^{X_1}\right]
    &=
    \mathbb{E}\left[
        t^{X_0} | X_0 = x
    \right]
    \\
    &= 
    \mathbb{E}\left[t^{\xi}\right]^x = G_1(t)^x.
\end{aligned}
$$

Similarly, we may have the following recurence relation 

$$
\begin{aligned}
    G_k(t) &= \mathbb{E}\left[
        t^{X_k} | X_0 = 1
    \right]
    \\
    &= 
    \sum_{n =0}^{\infty}
    \mathbb{E}\left[
        t^{X_k} | X_k = n
    \right]P(X_k = n | X_0 = 1)
    \\
    & \text{let: } P(X_k = n | X_0 = 1) = p_k(n | 1) \text{ then }
    \\
    &= 
    \sum_{n = 0}^{\infty} t^n p_k(n | 1), 
\end{aligned}
$$

observe that, when $t = 0$, we have the limit as $t\searrow 0$ gives $G_k(t) = p_k(n | 1)$, the probability of all individuals dead at generation $k$. Additionally, we have the recurrence relations between $G_{k + 1}, G_k$ giving us 

$$
\begin{aligned}
    G_k(t) &= 
    \mathbb{E}\left[t^{X_{k + 1}} | X_0 = 1\right]
    \\
    &= 
    \sum_{n = 0}^{\infty}
    \mathbb{E}\left[t^{X_{k + 1}} | X_k = n\right]p_k(n|1)
    \\
    &= 
    \sum_{n = 0}^{\infty} \mathbb{E}\left[
        \prod_{i = 1}^{n} t^{\xi_i}
    \right]p_k(n | 1)
    \\
    \xi_i  \text{ is i.i.d} \implies 
    &= 
    \sum_{n = 0}^{\infty} \mathbb{E}\left[t^\xi\right]^n p_k(n | 1)
    \\
    &= G_{k}(\mathbb E[t^\xi])
    \\
    &= G_{k}\circ G_1(t). 
\end{aligned}
$$

Therefore, the probability of surviving up to the $k$ th generation and beyond is given by $G_k(0)= G_1\circ\cdots (\text{k times })\cdots \circ G(0) = G^k_1(0)$. From the distribution of i.i.d random variable $\xi$, we have $\mathbb E[t^\xi] = t^3p + 1 - p = G_1(t)$. Function is monotone because $G_1'(t) = 3t^2p \ge 0$ for all $t\in [0, 1]$. Observe that one of the trivial fixed point is $t = 1$. Converging to this fixed point means that the population almost certainly die out. Next, we want to derive the conitions for the existence of another non-trivial fixed point in $(0, 1)$, and then we show the convergence to such a fixed point. 
