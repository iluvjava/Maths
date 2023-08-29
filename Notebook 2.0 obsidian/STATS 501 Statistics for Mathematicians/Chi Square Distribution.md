[Random variable Distribution function](../../AMATH%20561%20Probability%20Theory/Probability%20Basics/Random%20Variables%20as%20Measurable%20Functions.md)


### **Intro**

The random variable $X_n$ has $\chi(n)$ when 

$$
\begin{aligned}
    X_n = \sum_{k = 1}^{n} \frac{(N_k - \mu_k)^2}{\sigma_k}, N_k \sim N(\mu_k, \sigma), 
\end{aligned}
$$

It describes the sum of z-statistics for normal random variable. for more info see [wiki](https://en.wikipedia.org/wiki/Chi-squared_distribution). A Chi-square test, is used for testing hypothesis made about categorical distribution given the data. For more information see [Khan Academy](https://www.khanacademy.org/math/statistics-probability/inference-categorical-data-chi-square-tests/chi-square-goodness-of-fit-tests/v/pearson-s-chi-square-test-goodness-of-fit). Keep in mind about the degree of freedom for the Chi-square distribution is not the same as the number of categories, it's $n - 1$ with $n$ being the total number of categories. 
