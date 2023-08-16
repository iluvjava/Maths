- [PDFs, PMFs](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/PDFs,%20PMFs.md)

---
### **Intro**

Poisson process is an integer type random variable that count the occurrences of events over a period of time, modeling it with a fixed rate. In this file, we will define the Poisson random variable and Poisson process in terms of more familiar random variables, i.e: the exponential random variables. 

**References:**

Rick Durrett, Essential or Stochastic Processes


### **Def-1 | Exponential Distributions**
> The random variable $T\in \mathbb R$ is an exponential random variable with rate $\lambda \ge 0$, or $T\sim \text{expnential}(\lambda)$ (expo for short) when $P(T \le t) = 1 - \exp(-\lambda t)$, and pdf $\lambda \exp(-\lambda t)$. 

**Context**

Recall the important property that, an exponential random variable is similar to the discrete geometric random variable, lacking a direct Markovnian interpretation, we have [Memoryless Geometric Distributions](Memoryless%20Geometric%20Distributions.md) property for exponential distribution as well. 

### **Thm-1 | The Gamma Distributions**
> The sum of $n$ independent exponentials with a density $\lambda$ has the gamma distribution $\text{gamma}(n, \lambda)$, which has the PDF $\lambda \exp(-\lambda t)\frac{(\lambda t)^{n-1}}{(n - 1)!}$. 

**Context**

The sum of $n$ exponential random variable is related to the construction of the Poisson processes, for more information and how we can attain the moment generating function of the random variable, see [Moment Generating Functions](../MATH%20000%20Math%20Essential/Probability,%20Stats,%20Combinatorics,%20Information%20Theory/Moment%20Generating%20Functions.md). For an inductive proof of the PDF function of Gamma by its definition, see Theorem 2.1 in Rick's Essential Processes textbook. In general, the Gamma distribution is, the amount of time for chain of given number of geometric events to occur. This distribution is used for modeling queues. In the book examples for renewal process are given. 

---
### **Exponential Races**

We discuss the events for a list of random exponential variables and the probability of observing a minimum of those random being a specific random variable we had in mind. 

#### **Thm-2 | The Exponential Races**
> Let $T_1, \cdots, T_n$ be independent, with $T_i = \text{Expo}(\lambda_i)$, and $S = \min(T_1, \cdots, T_n)$, then $S = \text{Expo}(\lambda_1 + \cdots, + \lambda_n)$, then
> $$
> P(T_i = \min(T_1, \cdots, T_n)) = \frac{\lambda_i}{\lambda_1 + \cdots + \lambda_n},
> $$

**Context**

Where, the probability of the $i$ th random variable being the first to arrive is the ratio of the arrival rate $\lambda_i$ over the sum of the arrival rate of all the other exponential random variables. And the sum of the random variable is still an exponential random variable whose sum are the sum of the rates of all the i.d.d random variables. 

**Proof**

We skip the derivations for the facts now. 

---
### **Poisson Distributions**

Poisson distribution is a counter for the number of occurrences of an event that happens at a fixed rate per time unit. 

#### **Def-2 | The Poisson Counting Process**
> Let $(\tau_i)_{i\in \mathbb N}$ be a sequence of i.i.d Random variable $\sim \text{Expo}(\lambda)$ let $T_n = \tau_1 + \cdots + \tau_n$, then the Poisson Process is a random variable $N(s)$, with $s > 0$ defined as $N(s) = \sum_{k \in \mathbb N}^{ }\mathbf 1 \{T_k \le s\}$. 

**Demonstrations**

We demonstrate the important thing about this. To start, notice that the pdf of the exponential distribution is $f_{\tau_i}(t) = \lambda\exp(\lambda t)$, and $f_{T_n}(t) = \lambda \exp(-\lambda t)\frac{(\lambda t)^n}{n!}$, the PDF of the $\sim \text{Gamma}(n, \lambda)$ for each of the $T_n$. Then, we may derive the density function of the random variable $N(s)\in \mathbb N$. Firstly 

$$
\begin{aligned}
    P \left(
        \sum_{k = 1}^{\infty} \mathbf 1\{T_k < s\} = n
    \right) 
    &= 
    P(T_1 < s, T_2 < s, \cdots, T_n < s, T_{n + 1} > s), 
\end{aligned}
$$

observe that we have $\{\tau_1 < s\}\subseteq \{T_2 < s\}\subseteq \cdots \subseteq \{T_n < s\}$, which would imply that the above event turns into 

$$
\begin{aligned}
    P(T_1 < s, T_2 < s, \cdots, T_n < s, T_{n +1} > s) &= 
    P(T_n < s)
    \\
    &= 
    P(T_n < s < T_n + \tau_{n + 1})
    \\
    &= P(0 < s - T_n < \tau_{n + 1})
    \\
    &= P(0 < s -t < \tau_{n + 1} | \; \forall\; 0 < t < s)
    \\
    &= \int_{0}^{s} 
        f_{T_n}(t) P(\tau_{n + 1} > s -t)
    dt
    \\
    &\quad \vdots \quad \text{ Fancy algebra moves}
    \\
    &= \exp(-\lambda s)\frac{(\lambda s)^n}{n!}, 
\end{aligned}
$$

we sekip the algebraic detail. It's recommended that the readers should do it for their mathematical health. 


#### **Thm-3 | Poisson Distributions and Possion Processes**
> Let $X\in \mathbb N$ be a random variable paramaterized by $\mu > 0$, then the poisson distribution, $\text{Pois}(\mu)$ has the density function, measured as $P (X = n) = \exp(-\mu)\frac{\exp(-\mu)\mu^n}{n!}$. Let $t_1, t_2, \cdots$ be an i.d.d sequence of $\text{Expo}(\lambda)$ random variables. Let $T_n = t_1 + \cdots + t_n$ be the partial sum of the first $n$ terms. Let $N(t) = \max\{n : T_n \le t\}$ be the number of arrivals by time $t$, then this is $\text{Pois}(\lambda t)$. 

**Context**

Please not confuse the Poisson distribution with the Gamma distributions. The Poisson process random variables counts the total number of occurrence of $n$ exponential random variable over a time period. The Gamma distribution is the amount of time it takes for $n$ exponential random variable to all occur. 

**Facts**
1. The mean and the variance of Poisson distrbution are both $\lambda$. 
2. The generating function for Poisson is $M_{\text{Pois}(\lambda)} = \exp(-\lambda(1 - t))$. See [here](https://proofwiki.org/wiki/Probability_Generating_Function_of_Poisson_Distribution) for more information. 
3. The Poisson variable $N(t) - N(t - s) \perp N(u)$, for all $u < s$. 

---
### **Properties of the Poisson Distributions**

The Poisson distribution inherited some of the properties from the Geometric distributions. 

#### **Thm | Pass Independence**
> Let $t_0 < t_1 < \cdots < t_n$ be the sequence of time interval denoting the occurances of the exponential events. More specifically we let $\tau_i$ be an i.d.d sequence from $\text{exp}(\lambda)$, then the following are independent: $N(t_1) - N(t_0), N(t_2) - N(t_1)\cdots$ are independent events. For generally, the event $N(r) \perp N(t + s) - N(s)$ are independent events for all $0 < r < s$. 

**Context**

This is very similar to the stopping time property from a Markov chain. 

#### **Thm | Sum is Rate of Poisson Added Up**
> Let $N_1(t), N_2(t)$ be Poisson process rates $\lambda_1, \lambda_2$. Then their sum $Y = [N_1 + N_2](t)$ is a Poisson process with rates $\lambda_1 + \lambda_2$. 

**Demonstrations**

Using the law of total conditioning, we have the probability being: 

$$
\begin{aligned}
    P(N_1(1) + N_2(1) = n) &= \sum_{m = 0}^{n}
        P(N_1(t) + m = n)P(N_2(t) = m)
    \\
    &= \sum_{m = 0}^{n} \exp(-\lambda_1) \frac{\lambda_1^{m - n}}{(n - m)!}
    \exp(\lambda_2)\frac{\lambda_2^{m}}{m!}
    \\
    &= 
    \frac{\exp(-(\lambda_1 + \lambda_2))}{n!}
    \sum_{m = 0}^{n}\frac{n!}{m!(n - m)!} \lambda_1^m \lambda_2^{n - m}
    \\
    &= 
    \exp(-(\lambda_1 + \lambda_2))\frac{(\lambda_1 + \lambda_2)^n}{n!}
    \sum_{m = 0}^{n} 
    \frac{n!}{m!(n - m)!} 
    \frac{\lambda_1^{n - m}}{(\lambda_1 + \lambda_2)^{n - m}}
    \frac{\lambda^m}{(\lambda_1 + \lambda_2)^m}
    \\
    &= \exp(-(\lambda_1 + \lambda_2))\frac{(\lambda_1 + \lambda_2)^n}{n!}
    \left(
        \frac{\lambda_1}{\lambda_1 + \lambda_2} + 
        \frac{\lambda_2}{\lambda_1 + \lambda_2}
    \right)
    \\
    &= \exp(-(\lambda_1 + \lambda_2))\frac{(\lambda_1 + \lambda_2)^n}{n!}, 
\end{aligned}
$$

which is the same probability density function as the Poisson process with rates $\lambda_1, \lambda_2$. 



