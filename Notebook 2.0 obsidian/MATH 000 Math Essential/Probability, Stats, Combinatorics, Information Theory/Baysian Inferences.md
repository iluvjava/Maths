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

---
### **Problem | Posterior Distribution for Bernoulli, The Beta Distribution**



---
### **Problem | Posterior Distribution for Poisson, The Gamma Distribution**

We motivate the problem first. Suppose that, we have some prior belief about the distribution of random variable $T$, and suppose that we observed some instance of the random variable $X\sim \text{Poisson}(T)$, duringa unit period of time. How do we infer about the distribution of $T$? We now state more. 

#### **The Distribution for Posterior**

> Suppose that random variable $T$ has a Gamma distribution, with parameter $\lambda, n$, then assume that $X$ to have a Poisson distribution with parameter $T$. Suppose that an specific instance $x$ is observed, we want to know the pdf function for $f_{T|X}(t|x)$. 

**Demonstration**

To start, we state the PDF for the random variables. 

$$
\begin{aligned}
    T &\sim \text{Gamma}(\lambda, n)
    \\
    X &\sim \text{Poisson}(T)
    \\
    f_{T}(t | \lambda, n) &= \frac{t^{n - 1}\exp(-t/\lambda)}{(n - 1)!\lambda^n}, 
    \quad n\in \mathbb N, \lambda\in \mathbb R_+
    \\
    f(x | \lambda) &= \frac{\lambda^x \exp(-\lambda)}{x!}.
\end{aligned}
$$

Observe that Gamma with parameter $n = 1$, we recover the exponential distribution. To figure out the posterior distribution, we use the Bayes formula for PDF and we have 

$$
{\large
\begin{aligned}
    f_{T|X}(t | x) &= 
    \frac{f_{X|T}(x|t) f_T(T|\lambda, n)}{f_X(x)}
    \\
    &= \frac{
        \frac{t^x\exp(-t)}{x!} \frac{t^{n - 1}}{(n - 1)!\lambda^n}
        \exp(-t/\lambda)
    }{
        \int_{\mathbb R_+}^{} 
            \frac{t^x\exp(-t)}{x!}\frac{t^{n - 1}}{(n - 1)!\lambda^n}
            \exp(-t/\lambda)
        dt
    }
    \\
    &= 
    \frac{
        t^x\exp(-t)t^{n- 1} \exp(-t/\lambda)
    }{
        \int_{\mathbb R_+}^{} 
            t^x\exp(-t) t^{n - 1}\exp(-t/\lambda)
        dt
    }
    \\
    &= 
    \frac{
        t^{x +n- 1}\exp(-t(1 + 1/\lambda))
    }{
        \int_{\mathbb R_+}^{} 
            t^{x +n- 1}\exp(-t(1 + 1/\lambda))
        dt
    }, 
\end{aligned}
}
$$

Next, we consider the marginal integral below, to evaluate, we consider the integral of the generic format with $\alpha = (1 + 1/\lambda) > 0$, and $k = x + n - 1\in \mathbb N$, then consider taking the integral

$$
\begin{aligned}
    I_k &= \int_{\mathbb R_+}^{} 
        t^k \exp(-t\alpha)
    dt
    \\
    &= \left .t^k \frac{\exp(-t \alpha)}{-\alpha}
    \right|_0^\infty + 
    k \int_{\mathbb R_+} \frac{\exp(-t\alpha)}{\alpha} t^{k - 1}dt
    \\
    &= 0 + \frac{k}{\alpha} I_{k - 1}
    \\
    I_0 &= \int_{\mathbb R_+}^{}\exp(-t\alpha) dt
    \\
    &= \left. 
        \frac{\exp(-t \alpha)}{\alpha}
    \right|_\infty^0 = 1/
    \alpha
    \\
    \implies & 
    I_k = (k!/\alpha^k)I_0 = \frac{k!}{\alpha^{k + 1}}, 
\end{aligned}
$$

and therefore, the posterior simplifies to 

$$
\begin{aligned}
    f_{T|X}(t|x) &= 
    \frac{t^{x +n- 1}\exp(-t(1 + 1/\lambda))}{
        \frac{(x + n - 1)!}{
            (1 + 1/\lambda)^{x + n}
        }
    }
    \\
    &= \frac{t^{x + n - 1}\exp(-t(1 + 1/\lambda))(1 + 1/\lambda)^{x + n}}{
        (x + n-1)!
    }
    \\
    &= \frac{
        t^{x + n - 1}\exp\left(-t\left(
            \frac{1 + \lambda}{\lambda}
        \right)\right)
    }{
        (x + n - 1)! \left(
            \frac{\lambda}{1 +\lambda}
        \right)^{x + n}
    }, 
\end{aligned}
$$

observe that, it fits the gamma distribution with parameter $\text{Gamma}(t | x + n, \lambda/(1 + \lambda))$. The posterior has updated our belief using one observation of the Poisson random variable, over a unit amount of time. The number of events to occur has been updated to $n + x$, and the rate has been updated to $\lambda/(1 + \lambda)$. With large value of $\lambda$, the quantity is closer to one, and $n$ gets larger and larger as observation accumulates to our gamma distribution. 
