Let's get ourselves familiar with conditional probability 

This also mix well with the [[Bayes Theorem]], where we talked about conditional probability. 

---
### **Intro**

Joint distribution. A **joint distribution function** is a function with 2 variables. 

$$
f(x, y) > 0 \quad \forall\; x \in \Omega_x, y \in \Omega_y
$$

And it's sum has to be positive, because it's a density function: 

$$
\iint_{-\infty}^{\infty} f(x, y) dxdy = 1
$$

often, in the discrete case, the functions joint distribution function is written as: 

$$
p_{X, Y}(x, y)
$$

If, $X$ and $Y$ are having their own **independent probability** distribution, say: $p_x$, a univariate function and $p_y$ also univariate, then their joint distribution is:

$$
p_{X, Y} =p_X(x)p_Y(y) 
$$

Just multiply them together and we will have it. 

---
### **Conditional Distribution**

$$
p_{X|Y}(a|b) = \mathbb{P}\left(X = a | Y = b\right)
= 
\frac{p_{X, Y}(a, b)}{p_y(b)}
=
\frac{p_{Y|X}(b|a)p_X(a)}{p_Y(b)}
$$

Take note that, there is a slight difference in the subscript, and the equality is that: 

$$
p_{X, Y}(a, b) = p_{X|Y}(b|a)p_X(a)
$$

The joint distribution function of random variable $X, Y$, with inputs $a, b$ will be the same as $p_{X|Y}$, probability of $X = b$ given $Y=a$, the prior, multiplied by $p_X(a)$, the probability of observing $X$ becomes $a$. 

---
### **Conditional Expectation**

$$
\mathbb{E}\left[X\right|Y = y] = 
\sum_{x \in \Omega_X}^{}x \mathbb{P}\left(X = x|Y = y\right) 
=
\sum_{x\in \Omega_X}^{}xp_{X, Y}(x|y)
$$

The expected value of $X$ given that we observed $Y = y$ is it's just the summing up along the line where $Y = y$.

Notice that, it's just a simple tweak if we want to look for a transformed Expected value for the random variable $X$: 

$$
\mathbb{E}\left[g(X)\right|Y = y] = 
\sum_{x \in \Omega_X}^{}x \mathbb{P}\left(g(X) = x|Y = y\right) 
=
\sum_{x\in \Omega_X}^{}g(x)p_{X, Y}(x|y)
$$

---
### **Law of Total Expectation**

Using the conditional expectation to get the total expectation of the random variable. 

$$
\mathbb{E}\left[g(X)\right]
= 
\sum_{y}^{}
\mathbb{E}\left[g(X)| Y = y\right]p_Y(y)
$$

For each condition that $y$ is observed for rv $y$, we sum up the expectation when for random variable $X$, then we have the total expectation for the variable $g(X)$. 

Notice that this is just basic conditional probability, and it makes intuitive sense. 

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
### **Examples** 

> $X\sim \text{unif}(0, 1)$, Draw $Y\sim \text{Unif}(0, 1)$ until The first $T$ times $Y$ is less than $X$. Find the expected value of $T$. 

**Analysis:** 

1. Given $X = x$, $T$ has distribution $(1 - X)^{T}$, a Geometric Distribution. 
2. That above Geometric distribution has expectation of $\frac{1}{X}$, where $X$ is an random variable. 
3. Notice that, $T$'s expected value is conditionally tied with $X$, therefore we are going to us the Laws of Total Expectation, which is going to be:  

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


> let $p$ be the probability of an even being successful, let $X$ be the numbr of trials on such an even up to and include the first success. Use LTE to find the expected value of the random variable. 

**Analysis**: 

Let's denote $H$ to be the success of such an even and let $T$ to be failed. Think of it as head and tail of a coin flip. 

Then the expectation of $\mathbb{E}[X]$ is going to be: 

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

**Explaination**:

(1): $\mathbb{E}[X|H]$, given that we got head, the sequence of trials terminate, giving us a sequence of one, therefore this term is one. 

(2): $\mathbb{E}[X|T]$, given that we got tail, then we need to make another trial, we recurssively represents the new expected to be: $1 +\mathbb{E}[X]$. 

Therefore, we have gotten ourself a "recursive expression" for the expected value for the number of trials using the Laws of total expected. Therefore, we can solve it and get the solution. 

The "Recursive Expression" is true, if we consider the empirical appraoch to the problem, by which I mean, we carry out the experiment and keep updating the expected value using an algorithm. Cute huh? 

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


