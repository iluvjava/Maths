[Markov Chain Introduction](Markov%20Chain%20Introduction.md)


---
### **Intro**

exit distribution is actually very useful. It tells us how things moves in the Markov chain. 

#### **Def-1 | Exit Distribution**
> Suppose $\mathcal \Omega = S\cup \{t\}$ is the states for the Markov chain. We use $t$ to denote the exit state (Won the game). Denoting the $V_t = \min\{n \ge 0 : X_n = t\}$ to be a random variable that is the total travel steps to state $s$. Then the exit distribution is the portion of chains that ends up in state $t$, starting from the state $x$, it's $P(V_t < \infty \cap X_0 = x)$. We assume that, reaching $t$ from $x$ is possible, hence $V_t = \infty$ is an impossible event (which means $P(T_t < \infty | X_x) = 1$. See [Stopping Time and Classification of States](Stopping%20Time%20and%20Classification%20of%20States.md) for more information. 

**Demonstrations**

The random variable $V_t$ is not the same a stopping time since it include the observation up to state of $X_0$. Similarly, we can attempt to derive a recurrence relations for the exit distribution on this Markov chain, let $h(x):= P(V_t < \infty \cap X_0 = x)$, then using conditional probability we have $\forall x \neq t$: 

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
    h(x)&= \mathbb{E}\left[h(X_1) | X_0 = x\right], 
\end{aligned}
$$

and that is the recurrence formula. Notice that, since the state $s$ is a terminal state, we artificially define $P(V_s < \infty \cap X_0 = t) = 1$. 


#### **Def-1 | Exit Distribution with a Game over State**
> In addition to an exit state $t$, we also define a game over state: $s$. pictorially it's state where, if the chain hit, then it ends the observation of the chain (Lock it there). Let $\Omega = S\cup \{s, t\}$, then the same recurrence from above hold for all $x\not\in \{s, t\}$. 

**Demonstrations**

Define a new random variable $T = \min(V_t, V_s)$, we are going to assume that $T < \infty$ is true for all $x\not\in \{a, b\}$. We then go through the same proof as above, but replace the event $V_t < \infty$ into $V_t < V_s$. 

**Remarks**

Fo any other states $y$ in the chain that is not the terminal chain, or exit distribution chain, but it's unreachable from the initial state $x$, then we may manually set $P(V_t < \infty | X_0 = y) = 0$. 

#### **Def-3 | Exit Time**
> Let $t$ be the terminal state. Then the hitting time $g_x$ is the average amount of steps it takes for the Markov chain to arrive at $t$, begins with $X_0 = x$. The random variable $V_t$ is the stopping time the state $t$. 

**Observations**

There is an recurrences for the expected value of this random variable as well, simlar to what we did previously. The recurrence is simply

$$
\begin{aligned}
    g(x) &= \begin{cases}
        1 + \mathbb{E}\left[g(X_1) | X_0 = x\right] & x \neq t,
        \\
        0 & x= t. 
    \end{cases}
\end{aligned}
$$

For the second case with $x = t$, the intuitive argument is that, if we started at the terminal state $t$, then the average amount of time it takes to get there is zero. 


---
### **Looking for the Exit Distribution**

Looking for an exit distribution conditioned on a specific state is as direct as computing probability of the event, we do a brute force approach and then we do an approach by Rick Durrett. 

**Brute Force Approach**

Suppose that, the exit state is denoted by $t$, denotes the initial state $x$, denote the state space $S$. The event can simply be decomposed into many discrete event whenever $x \neq t$:

$$
\begin{aligned}
    P(V_t < \infty | X_0 = x) 
    &= \sum_{n\in \mathbb N}^{} P(V_t = n | X_0 = x), \text{ note: }P(V_t = 0 | X_0=x\neq t) = 0
    \\
    &= \sum_{n\in \mathbb N}^{}
    P(X_0= x\cap \{X_i\neq x : 1 \le i < n\}\cap X_n = t),
\end{aligned}
$$

Which in fact, doesn't have a nice description for each individual event in the summation. Directly, we may recall the Extend Chapman Homogorov formulation for observing any chain, after some simplification, it should yield this monstrosity

$$
\begin{aligned}
    P(V_t = n | X_0 = x) &= 
    \sum_{
        \substack{(x_1, \cdots, x_n)\\ \quad\in (S\setminus \{t\})^{n - 1}}
    }^{}
    p(t | x_{n - 1}) \left(
        \prod_{k = 1}^{n - 1} p(x_{k + 1}| x_{k})
    \right)p(x_1 | x), 
\end{aligned}
$$

and bro trust me, this is matrix product of all it's sub matrix indexed only with the subset $S\setminus \{t\}$. So, denoting matrix $M$ to be the transition matrix stripping of the columns and row for the state $t$, the summation is equivalent to $e_t^T M^{n}e_x$. This observation will later be proven useful. 


**Using the Recurrence Value**

Without the loss of generality, let there be $N$ many state in total, let the exit state be indexed by $1$, let the game over state be indexed by $N$. We use the column transition matrix $P_{i, j} = P(X_{n + 1} = i | X_{n} = j)$. 

#### **Thm-1 | Formula for the Exit Distribution**
> The exit distribution vector, $h_x = P(V_1 < V_n | X_0 = x)$ can be computed by the formula $\widetilde h = (I - \widetilde P^T)^{-1}u$, where $u = P_{1, 2:N}, \widetilde P_{2:N-1, 2:N-1}$, where we use matlab indexing convention here. 

**Proof**

The idea is to show that, if I solve the recurrences of the vector $h_x$, then I obtain a matrix expression that has a Neuman series representation to it, and that series, is exactly the same as the brute force solution described from above. Directly from the expected value recurrence, for all $2 \le i \le N - 1$ we have

$$
\begin{aligned}
    h_i &= 
    \sum_{j = 1}^N h_y p(j| i) 
    = p(1| i) + \sum_{j = 2}^{N-1} h_j p(j | i) \text{ by } h_1 = 1, h_N = 0
    \\
    \text{Denote } h &= \begin{bmatrix}
        1 &\widetilde h & 0
    \end{bmatrix}
    \\
    \implies 
    \widetilde h_i 
    &= p(1 | i) + (P^{-T})_{2:N-1, i} \widetilde h
    \\
    \widetilde h &= 
    P_{1: 2:N-1} + P_{2: N-1, 2:N-2}^T\widetilde h
    \\
    \text{Letting: } \widetilde P & = P_{2:N-1, 2N:-1}^T, 
    u = P_{1: 2:N-1}
    \\
    \widetilde h &= (I - \widetilde P^T)^{-1} u. 
\end{aligned}
$$

Observe that the resolvent form $(I - 1)^{-1}$ has a [Neuman Series](../MATH%20700%20Master%20Thesis/Neuman%20Series.md) representation for it, hence, an equivalence expression for the distribution vector is given as 

$$
\begin{aligned}
    \widetilde h = (I - \widetilde P^T)^{-1 }u = \sum_{k = 0}^{\infty} \widetilde (P^T)^ku
\end{aligned}
$$

For example, the first term in the series when $k= 0$ we have, for all $1 \le i \le N-2$: 

$$
\begin{aligned}
    e_i^Tu &= u_i 
    \\
    & = (P_{1:2N - 1})_i 
    \\
    &= P(X_1 = 1 | X_0 = i + 1)
    \\
    e_i^T \widetilde P^T u &= \sum_{j = 1:N-2}^{}\widetilde P_{i, j}u_j
    \\
    &= \sum_{j=1:N-2} P(j + 1|i + 1)P(1 | j + 1)
    \\
    &= P(X_2=1 \cap X_1 \not\in \{1, N\} \cap X_0 = i), 
    \\
    & (...)
    \\
    e_i^T (\widetilde P^T)^k u &= 
    P(X_k = 1 \cap X_i \not\in \{1, N\}\cap X_0 = i), 
\end{aligned}
$$

and observe the fact that the events $X_k = 1 \cap X_i \not\in \{1, N\}\cap X_0 = i$ is equivalent to the event of $k = V_t < V_s | X_0 = i$, summing up all the $k=0, 1, \cdots$ is equivalent of summing up all the possible discrete value the random variable can take, what the series is essentially doing is

$$
\begin{aligned}
    \tilde h_i = \sum_{k = 0}^{\infty}e_i (\widetilde P^T)^ku
    &= 
    \sum_{k = 0}^{\infty} 
    P(k = V_t < V_s | X_0 = i) = P(V_t < V_s < \infty | X_0 = i), 
\end{aligned}
$$

which describes exactly the event that had been posed at the first place. The two solutions are computationally different but they are the same. 

**Remarks**

I am using the column transition matrix, if you are using the row transition matrix, then the transposed will be removed in the theorem statement, and $u$ corresponds to the first column, excluding the first and last row of it. 

**References**
Rick Durrett, Essential Stochastic, 1.8 Exit distributions. 


---
### **Looking for the Expected Exit Time**

Similar to the exit distribution, we solve the recurrence on the expected value and yield a general formula that describes the events by expending it with Neuman series. 


#### **Thm-2 | Formula for the Exit Time**
> The expected exit time to a state $y$ starting with state $x$, can be computed by $(I - \widetilde P^T)^{-1}\mathbf 1$. 

**Proof**

It's similar in spirit to the expected exit distributions. 



