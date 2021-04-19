The Hoffding's inequality relate the empirical mean and of a bunch of observations on a bounded random variable $X_i$

This distribution is actually related to the Markov Inequality. [[Markov Inequality]]

And  this [link]([https://www.wikiwand.com/en/Hoeffding%27s_inequality) is the wiki for this distribution. 

---
### **Intro**

Let $X_i$ for $1\le i \le n$ be $n$ independent random variable (whether they are from the same distribution is not assumed.) such that each $X_i$ is bounded by the interval $[a_i, b_i]$ and an empirical mean computed as $\bar{x_i} = \frac{1}{n}\sum_{i = 1}^{n}x_i$. 

Then, the variance of the empirical mean and the true expected value of the random variable will bounded like: 

$$
\mathbb{P}\left(
    \left|
        \bar{X} - 
        \mathbb{E}\left[\bar{X}\right]
    \right|
    \ge t
\right)
\le 
\exp\left(
    -\frac{2n^2t^2}{
        \sum_{i = 1}^{n}(b_i - a_i)
    }
\right)
$$

This is useful for estimating the true error of the model, say, obtrained from a cross valications, and this will give a confident interval for the estimated error for the model. 

