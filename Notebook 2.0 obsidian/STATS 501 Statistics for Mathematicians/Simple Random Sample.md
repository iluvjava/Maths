- [Variance, Covariance](Variance,%20Covariance.md)
- [Expectations of Random Variables without Measure Theory](Expectations%20of%20Random%20Variables%20without%20Measure%20Theory.md)

---
### **Intro**

A simple random sample technique is sampling from a population with fixed, finite amount of elements without a replacement. They may have all unique values, or may have overlapping values and be grouped by their values. Let $N$ be the total number of elements from the populations. The process choose a subset of $n$ elements from the set, with equal probability placed all all $\begin{pmatrix}N \\ n\end{pmatrix}$ combinations of the sets. However, we are concerned with, the properties of the sample variance and sample mean, what are they and are they biased? 

To start, we denote that each element from the populations has gives $m$ distinct values: $x_1, x_2, \cdots, x_m$ with frequencies $n_1, n_2, \cdots, n_m$. 

**References**




### **Claim-1 | The Mean is Unbiased**

> Let $\bar X$ denote the random variable for the sample meme via SRS, then this is an unbiased estimator for the population mean. 

**Demonstration**
Due to sampling $n$ samples from population of $N$ randomly, all combinations of subsets of size $n$ of $N$ are assigned with equal probability, therefore it's equivalent to choosing the first $n$ elements of a list $N$, where all permutations were given the same probability. Therefore, for each element $i$, the ordering doesn't matter and we may claim that: 
        
$$
\begin{aligned}
    \expect{\bar{X}} &=
    \expect{\frac{1}{n}\sum^n_{i=1}X_i}\\
    &= \frac{1}{n}\sum^n_{i=1}\expect{X_i}\\
    &= \frac{1}{n}\sum^n_{i=1}\mu\\
    &= \frac{n}{n}\mu\\
    &= \mu
\end{aligned}
$$
        
So $\bar{X}$ is an unbiased estimator of $\mu$.



### **Claim-2 | The Covariance Between Samples**
> The SRS sampling will introduce covariance between $X_i, X_j$ where $i \neq j$ with $\cov (X_i, X_j) = -\sigma^2/(N - 1)$. 

**Demonstrations**

By definition of covariance: 
$$
\cov(X_i,X_j)=\expect{X_iX_j}-\expect{X_i}\expect{X_j}.
$$

Consider the value for the expcted value of the product with the laws for conditional probability, we get 

$$
\begin{aligned}
    \expect{X_iX_j}
    &=
    \sum^m_{k=1}\sum^m_{l=1}x_kx_l\pr(X_i=x_k\text{ and } X_j=x_l)
    \\
    &=
    \sum^m_{k=1}x_k\pr(X_i=x_k)\sum^m_{l=1}x_l\pr (X_j=x_l|X_i=x_k)
\end{aligned}
$$

SRS sampling without replacement introduce probability conditioning of the sampled element has value that collides with each other, resulting in conditional probability of 

$$
\begin{aligned}
    \pr(X_j=x_l|X_i=x_k)= 
    \begin{cases}
        \frac{n_l}{N-1} 
        & \text{if } k\neq l
        \\
        \frac{n_l-1}{N-1}
        & \text{if } k= l
    \end{cases}
\end{aligned}
$$

We may express the inner summation 

$$
\begin{aligned}
    \sum^m_{l=1}x_l\pr(X_j=x_l|X_i=x_k)
    &=
    \left(
        \sum_{1\le l\neq k \le m }x_l\frac{n_l}{N-1}
    \right)
    +
    x_k\frac{n_k-1}{N-1}
    \\
    &= 
    \left(
    \sum_{l = 1}^m \frac{x_l n_l}{N - 1}
    \right)
    + 
    x_k \left(
        \frac{n_k - 1}{N - 1}
    \right)
    -
    x_k \left(
        \frac{n_k}{N - 1}
    \right)
    \\
    &=
    \sum^m_{l=1}x_l\frac{n_l}{N-1}-\frac{x_k}{N-1}. 
\end{aligned}
$$

With it, we find the expression for $\expect{X_iX_j}$ to be 

$$
\begin{aligned}
    \sum^m_{k=1}\frac{x_kn_k}{N}
    \left(
        \sum^m_{l=1}
            \frac{x_ln_l}{N-1}-\frac{x_k}{N-1}
    \right)
    &= 
    \frac{1}{N(N-1)}\sum_{k = 1}^m
        x_k n_k 
        \left(
            \left(
                \sum_{l = 1}^mx_l n_l
            \right) - x_k
        \right)
    \\
    &= \frac{1}{N(N-1)}\left(
        (N\mu)^2 - \sum^m_{k=1} x_k^2n_k
    \right)
    \\
    &= \frac{(N\mu)^2}{N(N-1)}-\frac{1}{N(N-1)}
    \underbrace{\sum^m_{k=1}x_k^2n_k}_{=\expect{X^2}}
    \\
    \text{recall}: \expect{X^2} &= \sigma^2 - \mu^2
    \\
    &=\frac{N\mu^2}{N-1}-\frac{1}{N-1}(\mu^2+\sigma^2)
    \\
    &=\mu^2-\frac{\sigma^2}{N-1}, 
\end{aligned}
$$

Finally subtracting $\expect{X_i}\expect{X_j}=\mu^2$ from the last equation by the previous claim, we have $\cov(X_i,X_j) = \frac{\sigma^2}{N-1}$ for $i\neq j$.


---
### **The Variance of the Sample Variance, Mean Estimators under SRS Sampling**

Continuing the same assumptions with the populations, we consider the variance for the sample variance. 

### **Claim | The Bias of the SRS Sample Mean**
> The variance of the sample variane via SRS sampling gives: $\var{\bar{X}} = \frac{\sigma^2}{n}\left(1 - \frac{n-1}{N-1}\right)$. 


**Demonstrations**

Directly from the defintion of variance and mean, the variance of the sum of random variable is the sum of all pairwise covariance producing: 

$$
\begin{aligned}
    \var{\bar{X}} &= \frac{1}{n^2}\sum^m_{i=1}\sum^m_{j=1}\cov(X_i,X_j)\\
    &=
    \frac{1}{n^2}\sum^n_{i=1}\var{X_i} + 
    \frac{1}{n^2}\sum^n_{i=1}\sum_{j\neq i}\cov(X_i,X_j)\\
    &=
    \frac{\sigma^2}{n}-\frac{1}{n^2}n(n-1)\frac{\sigma^2}{N-1}\\
    &= 
    \frac{\sigma^2}{n}\left(
        1 - \frac{n-1}{N-1}
    \right), 
\end{aligned}
$$

And therefore, the variance of the mean is generally better in the case when, population is finite and we employed SRS sampling. With small value of $n$ relative to $N$, the variance of the mean is similar to sampling with replacement. 


### **Claim | The Variance of the Sample Variance Estimator**
> The sample variance is biased for SRS sampling, and the unbiased sample variance is 
> $$
>     s^2 =\frac{1}{n-1}\left(1 - \frac{1}{N}\right)\sum^n_{i=1}(X_i-\bar{X})^2. 
> $$

**Demonstrations**

$$
\begin{aligned}
    \hat{\sigma}^2 &= \frac{1}{n}\sum^n_{i=1}X^2_i-\bar{X}^2
    \\
    \expect{\hat{\sigma}^2}
    &=
    \frac{1}{n}\sum^n_{i=1}\expect{X_i^2} - \expect{\bar{X^2}}, 
\end{aligned}
$$

recall the fact that $\expect{X_i^2}=\var{X_i}+\expect{\bar X}^2=\sigma^2+\mu^2$, then 

$$
\begin{aligned}
    \expect{\bar{X^2}} &= \var{\bar X} + \expect{\bar{X}}^2
    \\
    &= 
    \frac{\sigma^2}{n}\Big(1-\frac{n-1}{N-1}\Big)+\mu^2, 
\end{aligned}
$$

substituting it back we have

$$
\begin{aligned}
    \expect{\hat{\sigma}^2}
    & =
    \left( 
        \sum_{i = 1}^n \sigma^2 + \mu^2
    \right) -
    \frac{\sigma^2}{n}\left( 
        1 - \frac{n - 1}{N - 1}
    \right) - \mu^2
    \\
    &= 
    \left( 
        \sum_{i = 1}^n \sigma^2
    \right) -
    \frac{\sigma^2}{n}\left( 
        1 - \frac{n - 1}{N - 1}
    \right)
    \\
    &= \sigma^2 - \frac{\sigma^2}{n}\left(
        \frac{N - n}{N - 1}
    \right)
    \\
    &= \sigma^2 \left(
        1 - \frac{N - n}{n(N - 1)}
    \right)
    \\
    &= \sigma^2
    \left(\frac{nN - N}{n(N - 1)}\right)
    \\
    & =
    \sigma^2\left(\frac{n-1}{n}\right)\frac{N}{N-1}, 
\end{aligned}
$$

and therefore, the sample variance is a biased estimator for the population variance. 