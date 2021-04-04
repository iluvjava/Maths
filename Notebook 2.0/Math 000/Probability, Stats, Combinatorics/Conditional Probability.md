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

