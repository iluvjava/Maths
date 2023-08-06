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

One might surmise the case that, whenever the average production capacity, $\mathbb E[\xi] > 1$ all survives, when $< 1$, all dies at some point. However, this is not true and it's possible for a fraction of all trajectory of populations to survive indefinitely and that happens when $\mathbb E[\xi] > 1$. 

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
    G_{t + 1}(t) &= 
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

#### **Existence and Convergence of the Fixed Point Iteration**

$G_1(t) = \mathbb{E}\left[t^{\xi}\right] = t^3p + 1 - p$, a fixed point exists when $t = G_1(t)$ has a solution to it. Which means that $f(t) = G_1(t) -t$ crosses zero at some point. $f(t) = t^3p + 1 - p - t$. Observe $f(0) = 1 - p > 0$, and $f(t)$ is a constinuous function, we are interested in another value $f(t) < 0$. Consider extremum of the function: 

$$
\begin{aligned}
    f'(t) &= 3t^2p - 1
    \\
    0 &= 3(t^*)^2p - 1
    \\
    \iff 
    1/\sqrt{3p} &= t^*, 
\end{aligned}
$$

this critical point would be a minimum because second derivative test yield: $f''(t) = 6tp > 0$, $t^* = 1/\sqrt{3p}$ is a minimum. Since $f(1) = 1$, we have $f(t^*) \le 0$, then by [Intermediate Value Theorem](../MATH%20000%20Math%20Essential/Analysis/Intermediate%20Value%20Theorem.md) there would exist a root in the interval $(0, t^*]$. Observe that when $p > 1/3$ we have $t^* < 1$, and when $p < 1/3$, we have $t^* > 1$. In the later case it would mean that $t = 1$ is the only fixed point for $G_1(t)$, else, there is another fixed point in the interval $(0, t^*]$ with $t^* < 1$ (The fixed point $t < t^* < 1$, reader should take this for granted since this is only intuitive for me). When $p = 1/3$, we need more advanced theory to show the convergence of the fixed point iteration (We skip that part of the analysis), when $p < 1/3 \vee p > 1/3$ , checking wether $G_1(t)$ is a constraction on the interval $(0, 1)$ suffices. 

The fixed point iteration on $G_1(t)$ with $t = 0$ converges when $G_1(t)$ maps from $[0, 1]$ to within $[0, 1]$ and $|G_1'(t)|  < 1$ within $[0, 1]$. See [Banach Contraction in Metric Space](../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md) for more theories. In here we note that $G'(t) = 3t^2p > 0$, hence $G_1$ is monotone increasing, $G(1) = 1$ would attains the maximum, therefore it's range over $[0, 1]$ is within $[0, 1]$. If $p < 1/3$, then 

$$
\begin{aligned}
    p &< 1/3
    \\
    t^2p &< t/3
    \\
    3t^2p &< t^2
    \\
    \sup_{t\in [0, 1]} 3t^2p & < 1
    \\
    \sup_{t\in [0, 1]} G_1'(t) & < 1, 
\end{aligned}
$$

which indicates that $G_1(t)$ forms a contraction on the interval $(0, 1)$, hence the fixed point iteration would converge, since $t^* > 1$ in this case, it would converge to the only fixed point $t = 1$, implying that $\lim_{k\rightarrow \infty} G_k(t) = 1 = P(X_k = 0 | X_0= 1)$, the population dies out with certainty. Otherwise when $t > 1/3$, we have $G_1(t^*) = G_1(1/\sqrt{3p}) = 1$, then by monotonicity of $G_1$, we have $|G'(t)| < 1$ over the interval $(0, t^*)$, therefore, it would converge to a fixed point $t \in (0, t^*)$, indicating a fractional probability of certain death for all trajectories of the populations $X_k$ as $k\rightarrow \infty$. 


**Remarks**

You need  to actually perform the iterations $G(t) = t^3 p + 1- p$ to compute the probability of death over infinite generations. Because solving it directly it's quite a non-trivial depressed cubic to solve. It's not recommended unless you like it really much. 