MLE is a statistical tool. It looks for a model the maximizes the likelihood for a given list of observation from a [idd](https://www.wikiwand.com/en/Independent_and_identically_distributed_random_variables) (Independent and Identically Distributed Random Variables) random variable. 

References: Random Googling and the CSE 312 Textbook. 

---
### **Intro**

Let's define some keywords. 

**Realization, Samples**: Observed Values from a random variable $X$. 

> Denoted as: $x_1, x_2 \cdots x_n$

**Likelihood**: 

> Given a model $\theta$, and idd observation $x$, The likelihood is the probability of observing the samples given the model. 

**Important Questions**: 

> How is it computed? If the distribution is continuous, doesn't it mean it's almost impossible to observe that exact given sequence? (Because exactly equals to the observed probability is impossible when the random variable is defined to a real number). 

Ok, in order to pull a rigorous proof off I think we need some real analysis shit, but computing is as simple as: 

> $$
L(x|\theta) = \prod_{i = 1}^{n} f\left(x_i|\theta\right) $$

Where, the function $f$ is the probability density function when the random variable is continuous and it's a probability mass function when the variable is discrete. 

What is the intuition behind likelihood for continuous random variable? 

Approximate the probability density function with a probability mass function ($\tilde{f}\approx f$), that closest resemble the probability density function. Then, the output value of the probability of producing $x_i$ with $\tilde{f}$ given parameter $\theta$ will be close to $f$ as well. 

Take the limit as we make the approximate function $\tilde{f}$ finer and finer, then we will have the probability density function $f$. 

---
### **Best Parameters**

Given a sequence of idd samples, the best parameters: $\Theta$ will be given as: 

$$
\Theta^* = 
\underset{\Theta}{\text{argmin}} 
\prod_{i = 1}^{n} f\left(x_i|\Theta\right)
$$

And then BOOM! we have the most likely model for the given data, and it will be: $f(X|\Theta)$. 

For actual computation, it's often transformed into: 

$$
\Theta^* = 
\underset{\Theta}{\text{argmin}} 
\sum_{i = 1}^{n} \ln \left(f\left(x_i|\Theta\right)\right)
$$

If there is a closed form solution to the best estimator given the model then use it. 

If not, we need the power of optimization algorithm to figure out the best solution to the formulated MLE problem. 

---
### **Burnoulli Distribution**

The distribution is controlled via one parameter and the probability density function is given by: 

$$
f(x|\theta) = \theta^x(1 - \theta)^{1 - x} \quad x \in \{0, 1\}
$$

Then for a series of observations: $\{x_1, x_2, \dots, x_3\}$, the likelihood of observing the sample given the parameter $\theta$ will be: 


