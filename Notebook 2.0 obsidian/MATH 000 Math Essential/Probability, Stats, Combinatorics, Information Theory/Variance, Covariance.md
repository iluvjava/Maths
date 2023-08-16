[[Expectations of Random Variables without Measure Theory]]

---
### **Intro**

A variance measures how spread out a probability density function is. The construction of this particular concept is based on the idea of expected value. Let $X$ be an random variable then the variance is: 

$$
\begin{aligned}
    \text{Var}\left[X\right]
    &= 
    \mathbb{E}\left[(X - \mathbb{E}\left[ X\right])^2\right]
    \\
    &= 
    \mathbb{E}\left[X^2\right] - \mathbb{E}\left[X\right]^2, 
\end{aligned}
$$

and similarly, covariance is a measure of underly linearity correlations between 2 random variable $X, Y$, and it's computed using the formula: 

$$
\begin{aligned}
    \text{Cov}[X, Y] &= 
    \mathbb{E}\left[(X - \mathbb{E}\left[X\right])(Y - \mathbb{E}\left[Y\right])\right], 
\end{aligned}
$$

when the variable $X, Y$ are independent, then the variance between the 2 variables is zero. However, the converse statement is not true, and even if $X, Y$ are dependent, it can still be the case that their covariance is zero. For more information about covariance, see [[Covariance]] for a better coverage of the topic. And one important formula from the concepts of covariance is the variance of the sum of 2 dependent variable, which is give as: 

$$
\begin{aligned}
    \text{Var}\left[X + Y\right] = 
    \text{Var}\left[X\right] + \text{Var}\left[Y\right] + 
    2\text{Cov}(X, Y). 
\end{aligned}
$$

The concept of covariance is nothing scary. 

---
### **Empirical Measure of Variance**

Given sample $\{x_i\}_{i = 1}^n$ for a random variable, the sample variance is denoted by $S_X^2$ can be computed via

$$
S_X^2 = \frac{1}{n - 1}\sum_{i = 1}^{n}(x_i - \bar x)^2, 
$$

and the fraction below is called the Bessel's correction(see [[Why Sample Variance is Biased]] for more information). It's taking into account of the fact that, the sample mean $\bar x$, is computed using the sample instead of known in prior, hence it introduces a bias. To see how it make sense, notice that $n = 1$ is banned by the expression, meaning that we at least need 2 samples to compute the variance; which makes intuitive sense. 


