- [[Bayes Theorem]], 
- [[Expectations of Random Variables without Sigma Algebra]], 
- [[PDFs, PMFs]]


---
### **Intro**

A conditional probability is a way of measuring the probability of an event given some specific information. A more technical definition involves the use of sigma algebra. Ignoring the technicality, we use $\mathbb P(A|B)$ to denote that probability of event $A$ given event $B$. We start off with the following intuitive reasoning: 
1. $\mathbb P(A|B) = 1$ if $A$ and $B$ is the same event. 
2. $\mathbb P(A|B) = 0$ if $A = B^C$. Meaning that $A$ and $B$ are mutually exclusive events. 

In this file, we highlight the computational approach for probability/expected values for random variables with PDFs without any mentions of probability theories. This is made with the intention to bring in probability without too much mathematical backgrounds. At the end we look over some of the classical, non-trivial applications of the conditional expectations. Material presented here worth the weight of a Junior/sophomore Probability Theory class in a decent university. 

**Fundamental Laws of Joint Probability** 

Suppose that 2 events $A, B$ are from the same probability space, then condition probability can be computed by: 
$$
\begin{aligned}
    \mathbb{P}\left(A\cap B\right)
    &= 
    \mathbb{P}\left(A|B\right)\mathbb{P}\left(B\right) = \mathbb P(B|A) \mathbb P(A), \text{Bayes Theorem}
    \\
    \mathbb{P}\left(A|B\right) &= 
    \frac{\mathbb{P}
    \left(A \cap B\right)}
    {
        \mathbb{P}\left(B\right)
    }
\end{aligned}
$$

**Remarks**: 
This is not a definition, but rather a way we can compute the conditional probability for some specific events. 

**Terminology**: 
A posterior probability refers to $\mathbb P(A|B)$, and the prior probability of that posterior is $P(B)$. 

---
### **Disjoint Sums of Conditional Probability**

> Disjoint decomposition. The probability of any event $A$ can be given by: 
> 
> $$
> \begin{aligned}
>     \mathbb P(A) &= \mathbb P(A|B)\mathbb P(B) + \mathbb P(A|B)\mathbb P(B^C). 
> \end{aligned}
> $$

To prove we use the definition of conditional probability. Consider: 

$$
\begin{aligned}
    & \mathbb P(A|B)\mathbb P(B) + \mathbb P(A|B^C)
    \\
    =&
    \frac{\mathbb P(A\cap B)}{\mathbb P(B)} \mathbb P(B) + 
    \frac{\mathbb P(A\cap B^C)}{\mathbb P(B^C)}
    \\
    =&
    \mathbb P(A \cap B) + \mathbb P(A\cap B^C)
    \\
    =& \mathbb  P((A\cap B)\cup (A\cap B^C)) =  \mathbb 
    P(A), 
\end{aligned}
$$

where on the last line, we used basic property of the sets and the property of a probability measure. In general, assume that a sequence of disjoint events $B_i$ for $1 \le i \le n$ such that it partitioned the whole event space, the probability of any event $A$ can be expressed as: 

$$
\begin{aligned}
    \mathbb P(A) &= 
    \sum_{i=1}^{n}\mathbb  P(A|B_i)\mathbb P(B_i), 
\end{aligned}
$$

and that concludes this section. 

---
### **Conditional Probability Chain Rule**

Hm.... hold my beer. 

---
### **Conditional Distribution**

A conditional distribution is a probability density function involving $X, Y$ in $\mathbb R^2$ such that, a specific value for one of the variable is provided. 

$$
\begin{aligned}
    p_{X|Y}(x|y)
    = 
    \frac{p_{X, Y}(x, y)}{p_y(y)}
    =
    \frac{p_{Y|X}(y|x)p_X(a)}{p_Y(y)}, 

\end{aligned}
$$

take note that, there is a slight difference in the subscript, and the equality is that: 

$$
p_{X, Y}(x, y) = p_{X|Y}(y|x)p_X(x). 
$$

The formulas of conditional distribution for random variable that is continuous and discrete variables are the same. 

---
### **Marginal Distributions**

A marginal distribution is observing the joint probability of $X, Y$ but ignoring one of the variable entirely. Suppose that the random variable $X, Y$ has a joint probability function $p_{X, Y}$ and they are discrete random variable from 2 different events space. Then the marginal distribution for $X$ is: 

$$
p_X(x) = \sum_{y\in \mathbb Z}^{} p_{X, Y}(x,y), 
$$

which is literally summing up all the probability outcomes of $Y$ for each value of $X$. In the continuous case the **marginal probability mass function** is: 

$$
f_X(x) = \int_{\mathbb R}^{} f_{X, Y}(x, y)dy = \int_{\mathbb R}^{} 
f_{X|Y}(x|y)f_Y(y)dy = \mathbb{E}\left[f_{X|Y}(x|y)\right], 
$$

and note that this is not a definition, but merely a way to compute the above quantity. For more about marginal distributions, visit [wiki](https://en.wikipedia.org/wiki/Marginal_distribution). 

---
### **Conditional Expectation**

#INCORRECT, I don't think this is correct, the conditional expectation of a random variable is another random variable and not really a value. Need to fix this. 

Conditional expectation is defined via conditional probability. 

$$
\mathbb{E}\left[X\right|Y = y] = 
\sum_{x \in \Omega_X}^{}x \mathbb{P}\left(X = x|Y = y\right) 
=
\sum_{x\in \Omega_X}^{}xp_{X, Y}(x|y). 
$$

The expected value of $X$ given that we observed $Y = y$ is it's just the summing up the moment along the line where $Y = y$. Notice that, it's just a simple tweak if we want to look for a transformed Expected value for the random variable $X$: 

$$
\mathbb{E}\left[g(X)\right|Y = y] = 
\sum_{x \in \Omega_X}^{}x \mathbb{P}\left(g(X) = x|Y = y\right) 
=
\sum_{x\in \Omega_X}^{}g(x)p_{X, Y}(x|y), 
$$

---
### **Law of Total Expectation**

Conditional expectation is similar to conditional probaility. Given the conditional expectation of a variable, we can find the unconditional expectation using: 

$$
\mathbb{E}\left[g(X)\right]
= 
\sum_{y}^{}
\mathbb{E}\left[g(X)| Y = y\right]p_Y(y)
$$

For each condition that $y$ is observed for rv $y$, we sum up the expectation when for random variable $X$, then we have the total expectation for the variable $g(X)$. Notice that this is just basic conditional probability, and it makes intuitive sense. 

**Proof**: 

We go from the right to the left: 

$$
\sum_{y \in \Omega_Y}^{}\mathbb{E}\left[g(X)| Y = y\right]p_Y(y)
$$

Using the definition of the conditional expectation for $g(X)$ given $Y$ is observed to be $y$, we have: 

$$
\sum_{y \in \Omega_Y}^{}
\left(
    \sum_{x\in \Omega_X}^{} 
        g(x)p_{X|Y}(x|y)
\right)
p_Y(y)
$$

Multiply it in and swap the sums. Notice that $p_{Y}(y)$ is the prior to the conditional $P_{X|Y}(x|y)$, therefore their product is the joint distribution function $p_{X, Y}$

$$
\sum_{x\in \Omega_x}^{}
\sum_{y\in \Omega_y}^{}
g(x)p_{X|Y}(x|y)p_Y(y)
$$

$$
\sum_{x\in \Omega_x}^{}
\sum_{y\in \Omega_y}^{}
g(x)p_{X, Y}(x, y) = \mathbb{E}\left[g(X)\right]
$$

And by definition, this is the expected value for the joint distribution, of the random variable $g(X)$

$\blacksquare$

---
### **Examples and Applications** 

We illustrate the use of conditional expectation and probability using some simple examples. 

**Exponential, Uniform Draws**:

> $X\sim \text{unif}(0, 1)$, Draw $Y\sim \text{unif}(0, 1)$ until The first $T$ (The number of draws) time $Y$ is less than $X$. Find the expected value of $T$. 

**Analysis:** 

1. Given $X = x$, $T$ has distribution $X(1 - X)^{T-1}$, a geometric distribution with $p = X$. 
2. That above geometric distribution has expectation of $\frac{1}{X}$, where $X$ is an random variable. 
3. Notice that, events regardiing $T$ is dependent on $X$, therefore we are going to use the Laws of Total Expectation, which is going to be:  

$$
\begin{aligned}
    \mathbb{E}\left[T\right] &=
    \int_{0}^{1} \mathbb{E}\left[T|X = x\right]f_X(x)dx
    \\
    &= \int_{0}^{1} 
        \frac{1}{x}1
    dx
    \\
    &= \infty
\end{aligned}
$$

The expected value is infinity. 


**Success Trials (Simple Markov Stopping Time)**: 

> let $p$ be the probability of an event being successful, let $X$ be the number of trials on such an even up to and include the first success. We make a random draw of a Bernoulli variables and until the success of the events. This is a simple exponential model, however, we use LTE to find the expected value of the random variable. 

**Analysis**: 

Let's denote $H$ to be the success of such an even and let $T$ to be failed. Think of it as head and tail of a coin flip. Then the expectation of $\mathbb{E}[X]$ is going to be: 

$$
\begin{aligned}
    \mathbb{E}\left[X\right] &= 
    \mathbb{E}\left[X|H\right]\mathbb{P}\left(H\right) + 
    \mathbb{E}\left[X|T\right]\mathbb{P}\left(T\right)
    \\
    &= \mathbb{E}\left[X|H\right]p + \mathbb{E}\left[X|T\right](1 - p)
    \\
    \underset{(1)}{\implies}
    &= 
    p + \mathbb{E}\left[X|T\right](1 - p)
    \\
    \underset{(2)}{\implies}
    &= p + (1 + \mathbb{E}\left[X\right])(1 - p)
\end{aligned}
$$

**Explanation**:

(1): $\mathbb{E}[X|H]$, given success, what is the expected number of steps until success? The sequence of trials terminate, giving us a sequence of one, therefore this term is one. 

(2): $\mathbb{E}[X|T]$, given a failure occurred, then we need to make another trial, we recursively represents the new expected to be: $1 +\mathbb{E}[X]$. 

Therefore, we have gotten ourselves a "recursive expression" for the expected value for the number of trials using the Laws of total expected. Therefore, we can solve it and get the solution. The "Recursive Expression" is true, if we consider the empirical approach to the problem, by which I mean, we carry out the experiment and keep updating the expected value using an algorithm. Cute huh? 

$$
\begin{aligned}
 	\mathbb{E}\left[X\right] &= p + (1 + \mathbb{E}\left[X\right])(1 - p)
    \\
    \mu
    &= 
    p + (1 + \mu)(1 - p)
    \\
    \mu
    &= 
    p + 1+ \mu  -p - \mu p
    \\
    0 &= p + 1 - p - \mu p
    \\
    0 &= 1 - \mu p
    \\
    \mu &= \frac{1}{p}
\end{aligned}
$$

The results is equivalent from using calculus and the Geometric Probability distribution function. 

**Sums of i.i.d**

> Given random variable $X_i$ draws from the same distribution, and random variable $N$ that has a finite expected value, independent wrt $X_i$, find the expected value of $\sum_{i=1}^{N}X_i$. 

**Analysis**

The sum of all the $X_i$ is dependent on $N$, but no each $X_i$. 

$$
\begin{aligned}
    \mathbb{E}\left[\sum_{i = 1}^{N}
        X_i
    \right]
    &\underset{(1)}{=} 
    \sum_{n\in \Omega}^{}
        \mathbb{E}\left[\left.
            \sum_{i = 1}^{n}
            X_i \right|N = n
        \right]\mathbb{P}\left(N = n\right)
    \\
    \underset{(2)}{\implies}
    &= 
    \sum_{n \in \Omega}^{}
    \left(
        \sum_{i = 1}^{n}
        \mathbb{E}\left[X_i\right]\mathbb{P}\left(N = n\right)
    \right)
    \\\underset{(3)}{\implies}
    &= 
    \sum_{n\in \Omega}^{}
        n\mathbb{E}\left[X_i\right]\mathbb{P}\left(N = n\right)
    \\
    &= 
    \mathbb{E}\left[X_i\right] \sum_{n\in \Omega}^{}
        n\mathbb{P}\left(N = n\right)
    \\
    &= 
    \mathbb{E}\left[X_i\right] \mathbb{E}\left[N\right]
\end{aligned}
$$

**Explanation:**

- (1): By the law of total expectation. 
- (2): By the linearity of the expected operator. 
- (3): The random variable $X_i$ all has the same expected value. 

**The Monty Hall Problem**

> There are 3 doors, one contains a goat and the other one contains a car. The contestant is asked to choose one of the doors at the start and the anouncer will anounce the unchosen door with/without a goat in it. There are 2 strategies based on a binary choice: 
> 1. The contestant always choose to swtich to another door that is not yet opened. 
> 2. The contestant always choose the current door. 

First observe that trivially, if we don't switch, then the probability of wining the car is $\frac{1}{3}$. Let the event $C$ be the door after we switched has the car. Let the event $B$ be that, the first door we chose has the car in it. Then $\mathbb P(C) = \mathbb  P(C|B)P(B)  + \mathbb P(C|B^C)P(B^C)$. Then
1. $\mathbb P(C|B)$ is the probability of getting the car if we always switch given that the door we first choose has the car in it. This is zero because we switched away from the right choice.  
2. $\mathbb P(C|B^C)$, given that we didn't choose the car at first, then the car is in the remaining 2 doors. 
   1. If one of the unchosen door is revealed to be empty, and the door we currently chosen is not the one with the car, then the other door must have the car, and this is certain hence we have $1$ for this. 
   2. If one the unchosen door is revealed to be contain the goat, and the door we currently chosen doesn't have the car, then the car must be in the remaining door. This is with 100%.
   3. It's certain under both cases, therefore $\mathbb P(C|B^C) = 1$

Therefore, $\mathbb P(C) = 0 + 2/3 = 2/3$. Switching the door gives higher probability of getting the car at the end. 
