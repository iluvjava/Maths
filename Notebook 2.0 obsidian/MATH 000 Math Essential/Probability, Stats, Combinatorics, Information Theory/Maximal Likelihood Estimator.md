Needs [Independent Events, Random Variables](Independent%20Events,%20Random%20Variables.md) for a better background. 


---
### **Intro**

MLE estimates unknown parameters of a distributions function from a list of samples that are assumed to be [idd](https://www.wikiwand.com/en/Independent_and_identically_distributed_random_variables) (Independent and Identically Distributed Random Variables). Similar statistical methods exists, such as the method of moments, they aim to recover the moment generating functions of the distributions. 

**References**: 

Random Googling and the CSE 312 Textbook. STATS 401, UBCO, statistical inferences, the textbook is "Probability and Statistical Inferences" by Hogg, Tanis, and Zimmerman, Chapter 6. 


#### **Realization, Samples**

> Observed Values from a random variable $X$. Denoted as: $x_1, x_2 \cdots x_n$. Usually i.i.d sample. 

#### **Def | The Likelihood Function**

> Given a model parameter $\theta$, and idd observation $x_i$, The likelihood is a function that gives the "probability" of observing the list of samples given a model with parameter $\theta$. 
> $$
> L(x|\theta) = \prod_{i = 1}^{n} f\left(x_i|\theta\right)
> $$

Take note, we can do this because the samples of $(x_i)_{i = 1}^n$ is i.i.d observation, therefore, the product spaces of all such observation has independence assumption, and therefore, direct product of the probability of observing each, gives the probability of observing the whole sequence. 

**Remarks:**

The probability statement is in quotation marks because $P(X = x | \theta)$ is, zero. Under this context, the interpretation of "probability" needs to be revised. Which, at the time of writing, I am not sure of the interpretation. 


---
### **MLE**

The maximum likely estimator is a number obtained by looking for $\theta$ that maximizes the likelihood function. Given a sequence of idd samples, the best parameters set $\Theta$ is 

$$
\Theta^* = 
\underset{\Theta}{\text{argmax}} 
\prod_{i = 1}^{n} f\left(x_i|\Theta\right), 
$$

most of the time, it's not possible to obtain closed form solution to the above problem. And for better intuitions and computations, it's reduced to the log likelihood, being: 

$$
\Theta^* = 
\underset{\Theta}{\text{argmax}} 
\sum_{i = 1}^{n} \ln \left(f\left(x_i|\Theta\right)\right) = 
\underset{\Theta}{\text{argmin}}
\sum_{i = 1}^{n} \ln \left(\frac{1}{f\left(x_i|\Theta\right)}\right)
$$

**Remarks**

Observe the similarity of the above expression and the transformed used for [[Conditional Entropy]]. There is a link between the 2 concepts that is not clear to me yet. Furthermore, it's also unclear to me regarding the existence of the minimizers for, all function $f$ that can be called a PDF. But, for the context of this file, we assume that at least one minimum exists for the above optimization problem. 


---
### **MLE As an a Random Variable**

Under a lot of convex, the MLE obtained via solving an optimization problem, is a random varaible. It's a random variable because the list of random variable taken as sample from a distribution function are random variables by their nature, and as a consequence, if we denote $\hat \theta_n$ for the maximal likelyhood estimator for the sample $(X_i)_{i = 1}^n$, then the randomness of the samling is transferred to the MLE. We now may discuss some of the properties of the random variables. 


#### **Def | Consistent**
> Let $\hat \theta_n$ be an MLE for some probability density/mass function $f$ that is deterministically parameterized by parameter $\theta$. Then the MLE is consistent for the true parameter $\theta$ if $\lim_{n\rightarrow \infty} P(|\hat \theta_n - \theta| > \epsilon) = 0$ for all $\epsilon > 0$. 

**Observations**

The random variable $\hat \theta_n$ converges almost surely to the random variable (which is actually a constant) $\theta$. 

 
#### **Def | The Bias for the Random Variable**
> Let $\theta_0$ be the true value for the distributions we sampled from, then the bias of a MLE is given by 
> $$
> \begin{aligned}
>   \text{bias}(\hat \theta) = \mathbb{E}\left[\hat \theta - \theta_0\right], 
> \end{aligned}
> $$
> It's the expected amount of difference between the true parameter and the parameter estimated by the maximal likelihood procedures. 

### **Def | The MSE of the MLE**
> The MSE is a measure of how good an estimated parameter is compare to the real parameter. Let $\hat \theta$ be the MLE produced by some procedures, then the MLE of the estimator is defined $\mathbb{E}\left[(\hat\theta - \theta_0)^2\right]$, the expected squared error from the true value. 

**Demonsrations**

The MSE of MLE is an aggregate measure of the variance and the biases of the estimator $\hat \theta$. Consider 

$$
\begin{aligned}
    \mathbb{E}\left[(\hat \theta - \theta_0)^2\right] &= 
    \mathbb{E}\left[
        \left(
            \hat \theta - \mathbb{E}\left[\hat \theta\right] + 
            \mathbb{E}\left[\hat \theta\right] - \theta_0
        \right)^2
    \right]
    \\
    &= 
    \mathbb{E}\left[
        \left(
            \hat \theta - \mathbb{E}\left[\hat \theta\right]
        \right)^2 
        + 
        \left(
            \mathbb{E}\left[\hat \theta\right] - \theta_0
        \right)^2
        + 
        2\left(
            \hat \theta  - \mathbb{E}\left[\hat \theta\right]
        \right)\left(
            \mathbb{E}\left[\hat \theta\right] - \theta_0
        \right)
    \right]
    \\
    &= \text{Var}\left[\hat \theta\right] + 
    \text{bias}\left[\hat \theta\right]
    + 0, 
\end{aligned}
$$
wher, it's zero because the term $\mathbb E\hat \theta - \theta_0$ is a constant, taking in the expected value makes $\hat \theta - \mathbb E \hat \theta$.

#### **Def | The Score Function**
> The score function is a function conditioned on some distribution parameter $\theta$. Let $f(x | \theta)$ be the model generating i.i.d sequences of random variables, then the score function $U(X|\theta) = \partial_\theta \ln(f(X|\theta))$. 

**Observations**

It's looking a bit like entropy. More specifically, it's the changes in the negative entropy as we vary the parameter $\theta$ from the distribution. We also make the observation that $\mathbb E U(X|\theta) = 0$, if $\theta$is the TRUE underlying parameter for distribution function $f$. 


#### **Def | The Fisher Information**
> There are many equivalent definition for the Fisher information. The fisher information is a quantity defiend via some candidate parameter $\theta$: 
> $$
>   I(\theta) = \mathbb{E}\left[-\partial_\theta[\ln\circ f](X|\theta)\right] = \text{Var}\left[U(X|\theta)\right]. 
> $$

#### **Thm | Cramer Rao's Lowerbouned**
> The cramer's Rao's lower bound gives a lower bound for the amount of variance of an unbiased MLE. Let $f(x|\theta)$ be a distribution function generating i.i.d sequence $(X_i)_{i = 1}^n$ with deterministic distribution $\theta$, let $\hat \theta_n$ be the MLE obtained as the solution of the optimization problem. The variance of the estimator is then lower bounded by $1 / n I(\theta)$. An estimator whose variance equals to the Cramer Rao's lower bound is called *Asymptoptically Efficient*. 

**Observations**

The second derivative information of the negative entropy of a specific parameter tells us the variance for our unbiased estimator. 





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

Ok, take note that, the function above is monotonically decreasing, to make it as big as possible, we have to make the $\theta$ as small as possible, and the smaller value of $\theta$ such that the likelihood is not zero is $\max_{1\le i\le N}(x_i)$. So the answer is just: $\theta^+ = \max_{1 \le i \le N}(x_i)$. 


---
### **Example | The Guassian Distribution**

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

To figure this out, just take the expected value for the optimal variance squared. As we collect more and more data, this is Asymptotically Unbiased. To get the unbiased estimator, divide it $\sum_{i= 1}^n (x_i - \mu)^2$ by $\frac{1}{n - 1}$. Which will be an unbiased estimator 


---
### **Summary**
1. A list of observation, a lot of them. 
2. Propose a model that can generate such a model, with under-determined parameters of for the model. 
3. Phrase the likelihood, assuming idd for the sequence of observation
4. Deal with the log of the likelihood
5. Optimize it, with derivative, or some fancy algorithms to get the best parameters for the given observation and the models. 
6. Do that a lot of time and get some estimate for the best parameters. 


[^1]: See [Sample Variance is Biased](Sample%20Variance%20is%20Biased.md) for more information. 