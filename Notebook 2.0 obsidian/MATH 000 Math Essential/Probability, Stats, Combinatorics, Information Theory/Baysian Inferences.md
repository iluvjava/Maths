- [Conditional Probability, Expectations](Conditional%20Probability,%20Expectations.md)
- [PDFs, PMFs](PDFs,%20PMFs.md)

---
### **Intro**

Baysian inference is a very general idea. We will motivate it with an actual problem, and we will describe the approach to the problem generically. 


#### **Problem | Conditional Distribution of the Parameters**

> Suppose that we have, 2 continuous random variable $Y, \Theta$ with supports $\mathbb R$ and an measurable set for $\Theta$, their range is from some open set. The random variable $Y$ has pdf/pmf depending on parameter $\theta$, $f_{Y| \Theta}(y | \theta)$, we are interested in the distribution $f_{\Theta | Y}(\theta|y)$. 

**Demonstration**

We directly apply the Bayes theorem. To motivate, this is how things translate between probability theory and PDF. 

$$
\begin{aligned}
    \mathbb P(\Theta\in (\theta - \epsilon, \theta + \epsilon) | Y \in (y-\epsilon, y + \epsilon))
    &= 
    \frac{
        \mathbb P(Y \in (y - \epsilon, y + \epsilon) | \Theta \in (\theta - \epsilon, \theta + \epsilon))\mathbb P(\Theta \in (\theta - \epsilon, \theta + \epsilon))
    }{
        \mathbb P(Y \in (y - \epsilon, y + \epsilon)), 
    }
\end{aligned}
$$

For each probability, it's density is the derivative of of the probability function. Which is the PDF function. Which would result in Bayes Rule but with pdf. And that would be the Bayes theorem for likelihood, given as 

$$
\begin{aligned}
    f_{\Theta | Y}(\theta | y) &= 
    \frac{f_{Y|\Theta}(y | \theta) f_{\Theta} (\theta)}{
        f_Y(y)
    }
    \\
    f_{\Theta | Y}(\theta | y) &= 
    \frac{
        f_{Y|\Theta}(y | \theta) f_{\Theta} (\theta)
    }
    {
        \int_{\mathbb R}^{} 
            f_{Y|\Theta}(y | \theta)f_{\Theta}(\theta)d\theta
        dy
    }, 
\end{aligned}
$$

However, we are only provided with $f_{Y|\Theta}$, with $\Theta$ conditioned on a specific value. Therefore, to obtain the posterior distribution, we need prior distribution for our parameter $\theta$. Sometimes, the pdf for the parameter is assumed to be $1/\mu(\Theta \in \mathbb R)$ (This is the measure of the support for the random varaible $\theta$ on the reals), this means that we don't have any information/belief about our distribution for the parameter, and it's safed to assume with maximal entropy distribution, the uniform distribution. With this assumption we have the representation 

$$
\begin{aligned}
    f_{\Theta | Y} (\theta | y)  &= 
    \frac{
        f_{Y | \Theta} (y | \theta) \frac{1}{\mu(\Theta)}
    }{
        \int_{\mathbb R}
        \frac{f_{Y|\Theta}(y | \theta)}{\mu(\theta)}d\theta
    }
    \\
    &= 
    \frac{
        f_{Y | \Theta} (y | \theta)
    }{
        \int_{\mathbb R}
        f_{Y|\Theta}(y | \theta)d\theta
    }, 
\end{aligned}
$$

such a distribution includes information from our observations and provided updates given the value of $y$. 


#### **Problem | A sequence of Observations**
> Suppose that a sequence of i.i.d realization is observed from distribution with parameter $\Theta$, let $f_{\Theta}(\theta)$ be the pdf of the parameters, $f_{Y|\Theta}(y|\theta)$ be the pdf for the conditional distribution of $Y$ based on $\Theta$.  Find the posterior distribution of $\Theta$ given the observation random variable. 

**Demonsrations**
Directly usig the previous results, and by the property of i.i.d distribution for the random variable $\vec Y$, we have 

$$
\begin{aligned}
    f_{\vec Y | \Theta}(\vec y | \theta) &= 
    \prod_{i = 1}^{n} f_Y(y_i | \theta)
    \\
    f_{\Theta | \vec Y}(\theta | \vec y) &= 
    \frac{
        f_{\vec Y | \Theta}(\vec y | \Theta) f_{\Theta}(\theta)
    }{
        \int_{\text{supp}(\Theta)}^{}
            f_{\vec Y}(\vec y | \theta) f_{\Theta}(\theta)
        d\theta, 
    }
\end{aligned}
$$

which is usually challenge to compute. 


---
### **Actual Applications**

Posterior has nice solution and they give rise to interested distribution statistics. 

### **Problem | Posterior Distribution for Bernoulli, The Beta Distribution**
> 


