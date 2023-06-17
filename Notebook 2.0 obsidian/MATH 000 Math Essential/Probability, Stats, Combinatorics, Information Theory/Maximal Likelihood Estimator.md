MLE is a statistical tool. It looks for a model the maximizes the likelihood for a given list of observation from a [idd](https://www.wikiwand.com/en/Independent_and_identically_distributed_random_variables) (Independent and Identically Distributed Random Variables) random variable. 

References: Random Googling and the CSE 312 Textbook. 

For this topic, you might also be interested in another way of estimating the parameters involved in a model, it's the [[Methods of Moment]]. 

---
### **Intro**

Let's define some keywords. 

**Realization, Samples**: Observed Values from a random variable $X$. 

> Denoted as: $x_1, x_2 \cdots x_n$

**Likelihood**: 

> Given a model parameter $\theta$, and idd observation $x$, The likelihood is the probability of observing the samples given the model with parameter $\theta$

**Important Questions**: 

> How is it computed? If the distribution is continuous, doesn't it mean it's almost impossible to observe that exact given sequence? (Because exactly equals to the observed probability is impossible when the random variable is defined to a real number). 

Ok, in order to pull a rigorous proof off I think we need some real analysis shit, but computing the likelihood is as simple as: 

> $$
L(x|\theta) = \prod_{i = 1}^{n} f\left(x_i|\theta\right) $$

Where, the function $f$ is the probability density function parameterized by $\theta$, when the random variable is continuous and it's a probability mass function when the variable is discrete. 


**Intuitions**: 

> What is the intuition behind likelihood for continuous random variable? 

Approximate the probability density function with a probability mass function ($\tilde{f}\approx f$), so that the $\tilde f$. Suppose that we are only dealing with a 1D random variables. Then $\tilde f$ is a function that maps discretized partitions of the 1D line to a single specific value, let's say the out put value for each interval is handled by parameter $\theta$, represented as a vector with finite length. Taking the log of the maximum likelihood expression yields results estimation for the negative log transform (entropy transform) for the random variable.... (Not sure what I am rambling about, there is more clearing up that needs to be done here.)

Take the limit as we make the approximate function $\tilde{f}$ finer and finer, then we will have the probability density function $f$. 

---
### **MLE**

Given a sequence of idd samples, the best parameters: $\Theta$ will be given as: 

$$
\Theta^* = 
\underset{\Theta}{\text{argmax}} 
\prod_{i = 1}^{n} f\left(x_i|\Theta\right)
$$

And then BOOM! we have the most likely model for the given data, and it will be: $f(X|\Theta)$. 

For actual computation, it's often transformed into: 

$$
\Theta^* = 
\underset{\Theta}{\text{argmax}} 
\sum_{i = 1}^{n} \ln \left(f\left(x_i|\Theta\right)\right) = 
\underset{\Theta}{\text{argmin}}
\sum_{i = 1}^{n} \ln \left(\frac{1}{f\left(x_i|\Theta\right)}\right)
$$

If there is a closed form solution to the best estimator given the model then use it. If not, we need the power of optimization algorithm to figure out the best solution to the formulated MLE problem. 

**Remarks**

Observe the similarity of the above expression and the transformed used for [[Conditional Entropy]]. There is a link between the 2 concepts that is not clear to me yet. 


---
### **Example | The Bernoulli Distribution**

The distribution function is discrete and can be represented continuously as: $f(x|\theta) = \theta^x(1 - \theta)^{1 - x}$ where $x \in \{0, 1\}, \theta \in [0, 1]$. Then for a series of observations: $\{x_1, x_2, \dots, x_3\}$ where we assume that it's a list of i.i.d Bernoulli variable then, the parameters that maximizes the likelihood of observing the sample given the parameter $\theta$ is: 

$$
\begin{aligned}
    & \underset{\theta}{\text{argmax}}
    \prod_{i = 1}^{n} \theta^{x_i}(1 - \theta)^{1 - x_i}
    \\
    =& 
    \underset{\theta}{\text{argmax}}\sum_{i = 1}^{n}
    \left(
        x_i \ln(\theta) + (1 - x_i)\ln(1 - \theta)
    \right)
\end{aligned}
$$


Take note that, if $x_i$ is all ones or zero then it's easy to solve. If $x_i$ are all zeros, then set $\theta = 0$ to maximize $\ln(1 - \theta)$. This make intuitive sense because $\theta$ denotes the probability of positive observations for the Bernoulli random variable. If $x_i$ are all ones, then set $\theta = 1$ to maximize $\ln(\theta)$. Else, the $\theta^*$ is inside the interval. Taking the derivative wrt to $\theta$ and setting it to zero yields: $n\theta = \sum_{i  = 1}^{n}x_i$

$$
\begin{aligned}
    \partial_{\theta} 
    \left(
        \sum_{i = 1}^{n}

        x_i \ln(\theta) + (1 - x_i)\ln(1 - \theta)
    \right) &= 0 
    \\
    \sum_{i = 1}^{n}\left(
    \frac{x_i}{\theta} - \frac{1 - x_i}{1 - \theta}
    \right) &= 0
    \\
    \sum_{i = 1}^{n}\left(
        x_i(1 - \theta) - \theta(1 - x_i)
    \right)
    &= 0
    \\
    \sum_{i = 1}^{n}\left(
            x_i - x_i\theta - \theta + x_i\theta
    \right)
    &= 0
    \\
    \sum_{i = 1}^{n}\left(x_i - \theta\right) &= 0. 
\end{aligned}
$$

Therefore, the best value for $\theta$ is just the average of the sample, $\hat{\theta} = \frac{k}{n}$, where $k$ is the number of observations of hats from the sequence. And the expected variance of it will be: $\hat{\theta} \approx \mathbb{E}[{\hat{\theta}}] \pm \sqrt{\text{var}[\hat{\theta}]}$. In this case, it is called "Unbiased" Estimator. This means that, if we run the experiment a lot of time, then we will get a lot of estimates for $\hat{\theta}$. And taking the average will give us the true value. 

---
### **Example | Uniform Distribution**

Assume observations are made for a sequence of i.i.d random variable from uniform distribution $[0, \theta]$. Then, the likelihood for a given sequence of observations ($x_1, x_2 \cdots x_N$) given parameter $\theta$ is: 
$$
\prod_{n = 1}^{N} 
\underbrace{
\mathbb{P}\left(X = x_n\right)}_{\frac{1}{\theta}\mathbf{1}\{0 \le x_n \le \theta\}}
$$

Basically, if the observed sequence is not in the range covered by the uniform distribution, then it's impossible for it to be generated by the model at all. Let's just assume that $\theta \ge \max_{1\le i \le N}(x_i)$, so that there is no zero in the product. under this assumption we have the product as: 

$$
\prod_{n = 1}^{N} 
\frac{1}{\theta} = \frac{1}{\theta^N}
$$

And taking the log of that will be: 

$$
\log\left(\frac{1}{\theta^N}\right) = -N\log(\theta)
$$

Ok, take note that, the function above is monotonically decreasing, to make it as big as possible, we have to make the parameter as small as possible, and the smaller value of $\theta$ such that the likelihood is not zero is $\max_{1\le i\le N}(x_i)$. So the answer is so simple it's just: $\theta^+ = \max_{1 \le i \le N}(x_i)$. 



---
### **Gaussian (Continuous Variables)**

This is the Gaussian Models: 

$$
P(x| \mu, \sigma) =
\frac{1}{\sqrt{2\pi \sigma^2}}
    \exp\left(
        -\frac{(x - \mu)^2}{2\sigma^2}
    \right)
$$

There are 2 parameters that we are going to tweak to get the best estimation given the observations. Let $X \sim \mathcal{N}(\mu, \sigma^2)$, then we know that it's still a Gaussian random variable after affine transformation. We are skipping the math for this part and the math about central limit theorem. Let's assume that Observations are made as idd rvs, $x_i$ (denote it using $D$) from $\mathcal N(\mu, \sigma^2)$, for $1 \le i \le n$, then the likelihood measure is given as:

$$
\begin{aligned}
    \mathcal L(D| \mu, \sigma) 
    &= 
    \prod_{i = 1}^{n} 
    \frac{1}{\sqrt{2\pi \sigma^2}}
        \exp\left(
            -\frac{(x_i - \mu)^2}{2\sigma^2}
        \right)
    \\
    \log \mathcal L(D| \mu, \sigma) 
    &= 
    -n\log (\sigma \sqrt{2\pi}) - 
    \sum_{i = 1}^{n}\frac{(x_i - \mu)^2}{2\sigma^2}. 
\end{aligned}
$$


Let's denote the parameters as a tuple $\theta = (\mu, \sigma^2)$. And then we are taking the gradient of the MLE to find the maximum point for the likelihood function (More argument needed here because the function is not necessarily concave in this case). Taking the derivative wrt to the mean, we have: 

$$
\frac{d}{d\mu}
\left[
        -n\log (\sigma \sqrt{2\pi}) - 
        \sum_{i = 1}^{n}\frac{(x_i - \mu)^2}{2\sigma^2}
    \right]
=
\frac{1}{\sigma^2} \sum_{i = 1}^{n}\left(x_i - \mu\right). 
$$

Let's assume that the variance is not zero, which is possible if more than 2 observations are made and not all of the observations are the same. Zero this out to find the optimal value for $\mu$, this is like: 

$$
\sum_{i = 1}^{n}\left(x_i - \mu\right) = 0 \implies n\mu = \sum_{i = 1}^{n}\left(x_i\right), 
$$

The best parameter $\widehat{\mu}$ is the sample mean of the observed data. Now, taking the derive wrt to the Standard Deviation, we have: 

$$
\frac{d}{d\sigma}
\left[
        -n\log (\sigma \sqrt{2\pi}) - 
        \sum_{i = 1}^{n}\frac{(x_i - \mu)^2}{2\sigma^2}
    \right]
    =
    \frac{-n}{\sigma} - (-2)\sum_{i = 1}^{n}
        \frac{(x_i - \mu)}{2\sigma^3}
$$

And after some re-arranging on the expression, we have:

$$
\frac{1}{\sigma^3}
\left(
    -n\sigma^2 + \sum_{i = 1}^{n}\left(x_i - \mu\right)^2
\right) = 0
$$

And we factor out $\frac{1}{\sigma^3}$ and apply the optimality conditions to derivative, allowing us to solve for the optimal parameter for the Gaussian Distribution. And, after some fancy math, solving it gives: 

$$
\widehat{\sigma^2} = \frac{1}{n}\sum_{i = 1}^{n}\left(x_i - \widehat{\mu}\right)^2 
$$

Yes, here we also substitute the $\widehat{\mu}$, because these 2 parameters started interacting with each other. 

**The variance a Biased Parameter**[^1]

This can be shown by consider the fact that: 

$$
\frac{n - 1}{n}\sigma^2 = \mathbb{E}\left[\widehat{\sigma^2}\right] \ne \sigma^2
$$

To figure this out, just take the expected value for the optimal variance squared. 

As we collect more and more data, this is Asymptotically Unbiased. To get the unbiased estimator, divide it $\sum_{i= 1}^n (x_i - \mu)^2$ by $\frac{1}{n - 1}$. Which will be an unbiased estimator 


---
### **Summary**
1. A list of observation, a lot of them. 
2. Propose a model that can generate such a model, with under-determined parameters of for the model. 
3. Phrase the likelihood, assuming idd for the sequence of observation
4. Deal with the log of the likelihood
5. Optimize it, with derivative, or some fancy algorithms to get the best parameters for the given observation and the models. 
6. Do that a lot of time and get some estimate for the best parameters. 


[^1]: See [Sample Variance is Biased](Sample%20Variance%20is%20Biased.md) for more information. 