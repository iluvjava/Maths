[Markov Chain Introduction](Markov%20Chain%20Introduction.md)

### **Intro**

exit distrbution is actually very useful. It tells us how things moves in the Markov chain. 

#### **Def | Exit Distribution**
> Suppose $\mathcal \Omega = S\cup \{t\}$ is the states for the Markov chain. We use $t$ to denote the exit state (Won the game). Denoting the $V_t = \min\{n \ge 0 : X_n = t\}$ to be a random variable that is the total travel steps to state $s$. Then the exit distribution is the portion of chains that ends up in state $t$, starting from the state $x$, it's $P(V_t < \infty \cap X_0 = x)$. We assume that, reaching $t$ from $x$ is possible, hence $V_t = \infty$ is an impossible event. 

**Demonstrations**

The random variable $V_t$ is not the same a stopping time since it include the observation up to state of $X_0$. Similarly, we can attempt to derive a recurrence relations for the exit distrbution on this Markov chain, let $h(x):= P(V_t < \infty \cap X_0 = x)$, then using conditional probability we have $\forall x \neq t$: 

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


#### **Def | Exit Distribution with a Gameover State**
> In addition to an exit state $t$, we also define a game over state: $s$. Picturally it's state where, if the chain hit, then it ends the observation of the chain (Lock it there). Let $\Omega = S\cup \{s, t\}$, then the same recurrence from above hold for all $x\not\in \{s, t\}$. 

**Demonstrations**

Define a new random variable $T = \min(V_t, V_s)$, we are going to assume that $T < \infty$ is true for all $x\not\in \{a, b\}$. We then go through the same proof as above, but replace the event $V_t < \infty$ into $V_t < V_s$. 

**Remarks**

Fo any other states $y$ in the chain that is not the terminal chain, or exit distribution chain, but it's unreachable from the initial state $x$, then we may manually set $P(V_t < \infty | X_0 = y) = 0$. 

---
### **Looking for the Exit Distrbution**

Looking for an exi distribution conditioned on a specific state is as direct as computing probability of the event, we do a brute force approach and then we do an approach by Rick Durrett. 

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

Which in fact, doesn't have a nice description for each individual event in the summation. Directly, we may recall the Extend Chapman Homogorov formulation for observing any chain, after some simplication, it should yield this monstrosity

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

and bro trust me, this is matrix product of all it's sub matrix indexed only with the subset $S\setminus \{t\}$. 


**Using the Recurrence Value**

Let $P$ denotes the transition matrix, without lost of generality, let there be $N$ states lebeled with $1, 2, \cdots, N$, let $P$ be the transition matrix where, $P_{i, j} = p(i|j)$, so that left multiplication by a row vector is conditioning on a distribution. Let $h$ be the distrbution vector for the exit distrbution, and let state $1$ be the exit state and state $N$ be the game over state then we can related the exit distribution to a matrix vector equation

#### **Thm | Exit Distrbution Formula**
> Let $s,t$ denotes the game over state and the exit state. Let $P$ be a row transition matrix with the first row hosting $t$ and the last row hosting state $s$. Then let $\widetilde P$ denotes the inner matrix of $P$ excluding the first and last rows and columns. Let $h_x$ denote the portion of chains ends with state $t$, then the full vector for all states $S\setminus \{s,t\}$ is computed via $(I - \widetilde P)^{-1}u$, where $u$ is the top row vector of $P$, excluding the top left&right entry of the matrix. 


