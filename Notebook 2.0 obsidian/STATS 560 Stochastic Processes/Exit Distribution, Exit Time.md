[Markov Chain Introduction](Markov%20Chain%20Introduction.md)

### **Intro**

exit distribution is actually very useful. It tells us how things moves in the Markov chain. This part also tells us how to compute the expected stopping time defined and discuss in [Stopping Time and Classification of States](Stopping%20Time%20and%20Classification%20of%20States.md). 

#### **Def | Exit Distribution**
> Suppose $\mathcal \Omega = S\cup \{s, t\}$ is the states for the Markoc chain. We use $s$ to denote the terminal state (Game over) and $t$ to denote the exit state (Won the game). Denoting the $V_t = \min\{n \ge 0 : X_n = t\}$ to be a random variable that is the total travel steps to state $s$. Then the exit distribution is the portion of chains that ends up in state $t$, starting from the state $x$, it's $P(V_t < \infty \cap X_0 = x)$. We assume that, reaching $t$ from $x$ is possible, hence $V_t = \infty$ is an impossible event. 

**Observation**

The random variable $V_t$ is not the same a stopping time since it include the observation up to state of $X_0$. Similarly, we can attempt to derive a recurrence relations for the exit distribution on this Markov chain, let $h(x):= P(V_t < \infty \cap X_0 = x)$, then using conditional probability we have 

$$
\begin{aligned}
    P(V_t < \infty | X_0 = x) &= \sum_{y\in \mathcal \Omega}
    P(V_t < \infty \cap X_1 = y | X_0 = x)
    \\
    &= 
    \sum_{y\in \mathcal \Omega}
    P(V_t < \infty | X_1 = y, X_0 = x)P(X_1 = y | X_0 = x)
    \\
    &= \sum_{y\in \mathcal \Omega}
    P(V_t < \infty | X_1 = y)P(X_1 = y | X_0 = x)
    \\
    &= 
    \sum_{y\in \mathcal \Omega}
    P(V_t -1 < \infty | X_0 = y)P(X_1 = y | X_0 = x)
    \\
    &= \sum_{y \in \Omega}^{}
    h(y)p(y|x)
    \\
    &= \mathbb{E}\left[h(X_1) | X_0 = x\right], 
\end{aligned}
$$

and that is the recurrence formula. Notice that, since the state $s$ is a terminal state, we artificially define $P(V_s < \infty \cap X_0 = x) = 0$, and since the state $t$ is an exit state, we define artificially that $P(V_t < \infty \cap X_0 = t) = 1$

### **Looking for the Exit Distrbution**