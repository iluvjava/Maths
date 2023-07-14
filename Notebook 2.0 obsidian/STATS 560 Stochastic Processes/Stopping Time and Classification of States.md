[Markov Chain Introduction](Markov%20Chain%20Introduction.md) 

---
### **Intro**

Let $(X_n)_{n\in \mathbb N}$ be a Markov chain, then initialize the chain with $X_0 = x$, we observe it until first reaching the terminal state $y$, the number of steps that takes us to transition to the final state is the another random variable called stopping time. This quantity is important for some theories and theoretical quantities about Markov chain, it opens up the window for saying a lot of things about the Markov based on this random variable along, specifically it distinguishes different categories of states and how they would communicated with each other. 

However, we won't discuss on how to compute the expected value, or the probability of computing this variable efficiently in this file. These topics are related to Exit time, and Exit distributions. 

#### **Def-1 | Stopping time**

> A random variable called stopping time for a state $y$, usually denoted as $T_y$ is defined as $T_y = \min\{n \ge 1 | X_n = y\}$, denoting the shortest number of steps needed to reach state $y$, ignoring the initial state. 

#### **Def-2 | Finite Stopping Probability**

> A random variable $\rho_{x, y}$ denotes the probability of reaching state $y$ starting at state $x$ in a finite amount of time, defined as $\rho_{x, y} = P(T_y < \infty | X_0 = x)$, equivalently $P(X_{T_y} = y | X_0 = x, T_y < \infty)$. 


**Remark**

To be more precise about the stopping time, we find the following equivalent expression of events that describes the value of the stopping time to a state $y$. 

$$
\begin{aligned}
    \{T_y = t\} = \left(
        \bigcap_{i = 1}^{t - 1} \{X_t \neq y\} 
    \right)\cap \{X_t =y\}, 
\end{aligned}
$$

it it's equivalent to a very specific even chain for the random variable $X$, which, can be computed with brute force using the Chapman Komogorov. Additionally, the equivalent argument for the stopping time is true by considering using the rule of conditional probability: 

$$
\begin{aligned}
	&\quad \;
    P(X_{T_y} = y | X_0 = x, T_y < \infty) 
    \\
    &= 
    \underbrace{P(X_{T_y} = y\cap T_y <\infty | X_0 = x)}_{= 1}
    P(T_y < \infty | X_0 = x)
    \\
    &= P(T_y < \infty | X_0 = x), 
\end{aligned}
$$

because $X_y = y$ and $T_y$ is an event that happens for sure. 


---
### **Multiple Returns to the State**

Multiple returns to the state we started has probability that can be represented by the finite stopping time probability. 

#### **Thm-1 | Multiple Returns to the same States**
> Suppose that we start with state $X_0 = y$, we are interested in the probability of returning to the state $k$ many times. Then the probability of such an event happening would be exactly $\rho_{y, y}^k$. 

**Proof**

Recursively we defined the recurrent stopping time $T^{(k)}_y = \min \{n > T^{(k - 1)} | X_n = y\}$, and $T^{(0)}_y = T_y$ to just be the stopping time. We start with state $y$ would mean $P(X_0 = y) = 1$. For simplicity we may just consider the first 2 stopping time, $T_y < T_y^{(1)}$. Assuming that $T_y^{(1)} <\infty$, then these 2 random variable is describe the event that 

$$
\begin{aligned}
	&\quad\;
    P\left(
        \left. X_{T_y^{(1)}} = y \cap X_{T_y} = y \right|
        T_{y^{(1)}} < \infty, X_0 = y
    \right)
    \\
    & = 
    P\left(
        \left. X_{T_y^{(1)}} = y \right|
        X_{T_y}= y, X_0 = y, T_{y^{(1)}} < \infty
    \right)
    P(X_{T_y} = y | X_0 = y, T_{y^{(1)}} < \infty )
    \\
    & = 
    P\left(
        \left. X_{T_y^{(1)}} = y \right|
        X_{T_y}= y,
        T_{y^{(1)}} < \infty
    \right)
    P(
        \left. X_{T_y} = y \right| 
        X_0 = y, T_{y^{(1)}} < \infty
    )
    \\
    &= 
    P\left(
        \left. X_{T_y^{(1)} - T_y} = y \right|
        X_0 = y, T_y^{(1)} - T_y < \infty 
    \right)
    P(X_{T_y} = y| X_0 = y, T_y < \infty )
    \\
    &= \rho_{y, y}^2, 
\end{aligned}
$$

and inductively, we can show that if we returns to the state $k$ many times, and we started at state $y$ too, then the probability of that happening is just $\rho_{y, y}^k$. 

**Remarks**

From the derivation of the process, we can see that all $T_y^{(k + 1)} - T_y^{(k)}$ are independent to the random variable $T_y^{(k)} - T_y^{k - 1}$ for all $k \ge 1$, and $T_y^{(1)} - T_y$ independent to $T_y$, as the base case. This could be a corollary for the above theorem. 


#### **Lemma-1 (1.11) | Expected Number of returns to the same State**
> Let the random variable $N_x(y)$ counts the number of time we hit state $y$ given that $X_0=x$ in an observed chain. Then this random variable can be computed by the quantities $\frac{\rho_{xy}}{1 - \rho_{yy}}$. 

**Proof**

Recall that, the expected value of a discrete random variable $X$ may be computed via $\mathbb{E}\left[N_x(y)\right] = \sum_{k\in \mathbb N}^{}P(N_x(y) \ge k)$, applying this formula in our case yields

$$
\begin{aligned}
    \mathbb{E}\left[N_x(y) | X_0 = x\right] &= 
    \sum_{k\in \mathbb N}^{}P(N_x(y) \ge k | X_0 = x)
    \\
    &= \rho_{x,y}\sum_{k\in \mathbb N}^{}\rho_{y,y}^{k-1}
    \\
    &= \frac{\rho_{x, y}}{1 - \rho_{y, y}}, 
\end{aligned}
$$

#### **Lemma-2 (1.12) | Expected Number of Returns to the Same State**

> Let the random variable $N_x(y)$ counts the number of time we hit state $y$ given that $X_0=x$ in an observed chain. Then this random variable can be computed by the series $\sum_{n=1}^{\infty}\mathbf p^n(x, y)$. 

**Proof**

The random variable $N_x(y)$ is a simple discrete function that we can take the expected value of 

$$
\begin{aligned}
    N_x(y) &= \sum_{n = 1}^{\infty} \mathbf 1 \{X_n = y\}
    \\
    \mathbb{E}\left[N_x(y)\right] &= 
    \sum_{n = 1}^{\infty} P(X_n = y | X_0 = x). 
\end{aligned}
$$


**References**

This is theorem 1.21 from the Rick Durrett Essential Stochastic textbook. 


---
### **Classifications of States**

The above concepts are created to understand different type of states that can appear in a Markov chain. We define them immediately. 

#### **Def-3 | States**
> Let $y$ be a state for a Markov chain then, 
> 1. A state is *transient* if $\rho_{y,y} < 1$, this means that $\lim_{k\rightarrow \infty} \rho_{y, y}^k = 0$, meaning that the number of returns to the state $y$ is finite, as the length of the chain goes to infinite. 
> 3. $y$ is *recurrent* when $\rho_{y, y} = 1$, this means that, starting with $y$, it will always return to the state in finitely length. 
> 
> Let $x, y$ be states that are different, then $x\rightarrow y$ means that $x$ commute to $y$, and it happens when $\rho_{x, y} > 0$, meaning that there is a non-zero probability finite chain that starts with $x$ and ends up to $y$. 

#### **Def-4 | Sets of States**
> 1. A set $A\subseteq S$ is a *closed* set if it's impossible to go out, meaning that, if $i\in A$ and $j\not\in A$, then there is no chain with non-zero probability that starts with $x$ and ends up with $y$. 
> 2. A set is called *irreducible* if, whenever $i, j \in A$, $i\rightarrow j$. 


These definition uses the concept of stopping time, stopping probability and it will be used to discuss the appearance of stationary distributions for the Markov chain. 


