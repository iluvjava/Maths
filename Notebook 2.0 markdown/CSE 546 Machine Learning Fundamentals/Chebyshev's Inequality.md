It's an inequality that related the extreme value of some observation and the the variance of the distribution. 

This is derived using: [Markov Inequality](Markov%20Inequality.md)

The Chebyshev's Inequality is going to be compatible with random variables that can be negative. 

---
### **Intro**

$X$ is a random variable with finite mean and variance $\mu,\sigma$, then for any real number $k>0$, we have: 

$$
\mathbb{P}\left(
        |X - \mu| \ge k\sigma 
    \right)\le 
    \frac{1}{k^2}
$$

And this will be the upper bound of observing an observation of an random variable that is $k$ variance away from the true mean $\mu$. 

**Take note that**, the mean and variance is from the theoretical distribution, not the sample mean and sample variance. 

