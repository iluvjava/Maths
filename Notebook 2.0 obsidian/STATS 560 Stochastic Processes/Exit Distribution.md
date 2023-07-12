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


#### **Def | Exit Distrbution with a Terminal State**
> In addition to a exit state $t$, we also define a game over state: $s$. Picturally it's state where, if the chain hit, then it ends the observation of the chain (Lock it there). Let $\Omega = S\cup \{s, t\}$, then the same recurrence from above hold for all $x\not\in \{s, t\}$. 

**Demonstrations**

Define a new random variable $T = \min(V_t, V_s)$, we are going to assume that $T < \infty$ is true for all $x\not\in \{a, b\}$. We then go through the same proof as above, but replace the event $V_t < \infty$ into $V_t < V_s$. 

---
### **Looking for the Exit Distrbution**




