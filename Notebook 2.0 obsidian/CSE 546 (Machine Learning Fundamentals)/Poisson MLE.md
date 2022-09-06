We are going to derive the MLE for the poisson distribution
[[Maximal Likelihood Estimator]]

We also discussed the generalized linear model for poisson distribution in [[Generalized Linear Model]], as an example, and putting it into an optimization problem in the optimization class. 

---
### **Intro**

The model is given by: 

$$
\text{Poi}(x|\lambda) = \exp(-\lambda) \frac{\lambda^x}{x!}
$$

We are going to shoe that the best $\lambda$ that maximizes the likelihood is just the average of all the observed samples. 

The poisson distribution models the probability of a number of events occuring during a fixed number of times. 

Like, how many people are likely to visit the shop a day, or an particular hour of the day, or a particular moment of the day, etc. 

---
### **Getting the Maximal Likelihood Estimator**

Assumes that $N$ observations of the number of occurrence during a particular time interval has been observed, and it's like: $x_1, x_2, \cdots x_N$. 

The Likelihood: 

$$
\prod_{n = 1}^{N} 
\text{Poi}(x_n|\lambda)
$$

Taking the log on the expression we have: 

$$
\sum_{n = 1}^{N}
    \log\left(
        \text{Poi}(x_n|\lambda)
    \right)
$$

So then it's like: 

$$
\sum_{n = 1}^{N}
\left(
    -\lambda + x_n\ln(\lambda) + \log(x_n!)
\right)
$$

And notice that, only some of the terms are relevant to the value of $\lambda$, and hence the best estimator will be given as: 

$$
\lambda^+ = 
\underset{\lambda}{\text{argmax}}
\left\lbrace
    -N\lambda
    +  
    \ln(\lambda)
    \sum_{i = 1}^{N}
        \left(
            x_n
        \right)
\right\rbrace
$$

Apply the derivative wrt to $\lambda$ for the inside, setting it to zero, we have: 

$$
\partial_\lambda \left[
    -N\lambda
    +  
    \ln(\lambda)
    \sum_{i = 1}^{N}
        \left(
            x_n
        \right)
    \right] = 0
$$

$$
-N + \frac{\sum_{n = 1}^{N}x_n}{
    \lambda^+
} = 0
$$

$$
\implies 
\lambda^+ = \frac{\sum_{n = 1}^{N}x_n}{N}
$$

Done. 