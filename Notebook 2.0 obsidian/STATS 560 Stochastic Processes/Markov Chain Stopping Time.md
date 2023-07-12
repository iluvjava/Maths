[[Markov Chain Introduction]]

---
### **Intro**

Let $(X_n)_{n\in \mathbb N}$ be a Markov chain, then initialize the chain with $X_0 = x$, we observe it until first reaching the terminal state $y$, the number of steps that takes us to transition to the final state is the another random variable called stopping time. This quantity is important for some theories and theoretical quantities about Markov chain, it opens up the window for saying a lot of things about the Markov based on this random variable along, specifically it distinguishes different categories of states and how they would communicated with each other. 

However, we won't discuss on how to compute the expected value, or the probability of computing this variable efficiently in this file. 

#### **Def | Stopping time**

> A random variable called stopping time for a state $y$, usually denoted as $T_y$ is defined as $T_y = \min\{n \ge 1 | X_n = y\}$, denoting the shortest number of steps needed to reach state $y$, ignoring the initial state. 

#### **Def | Stopping Probability**

> A random variable $\rho_{x, y}$ denotes the probability of reaching state $y$ starting at state $x$ in a finite amount of time, defined as $\rho_{x, y} = P(T_y < \infty | X_0 = x)$. 


---
### **Multiple Returns to the State**

> Suppose that we start with state $X_0 = y$, we are interested in the probability of returning to the state $k$ many times. Then the probability of such an event happening would be exacty $\rho_{y, y}^k$. 

**Proof**

Recursively we defined the recurrent stopping time $T^{(k)}_y = \min \{n > T^{(k - 1)} | X_n = y\}$, and $T^{(0)}_y = T_y$ to just be the stopping time. We start with state $y$ would mean $P(X_0 = y) = 0$. 


