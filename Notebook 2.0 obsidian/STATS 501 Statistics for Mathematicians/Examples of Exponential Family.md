[The Exponential Family](The%20Exponential%20Family.md)

---
### **Intro**

We list examples of exponential family for the purpose of referencing quickly. Recall that the form of the exponential family with a natural parameter is given by: 

$$
f(x| \phi) = \exp(\phi T(x) - \gamma(\phi) + S(x)), 
$$

where we assume that $x\in \mathcal X \subseteq \mathbb R$, and $\phi \in \Phi \subseteq \mathbb R$ where $\Phi$ is an open set. If we bind the natural parameter to the actual parameter of some distribution, then we allow for an intermediate mapping, and the above form goes into $f(x | \theta) = \exp(\phi(\theta)T(x) - \gamma \circ \phi(\theta) + S(x))$, and we define the canonical representation of this form as $f(x | \theta) = \exp(\eta(\theta) T(x) - d(\theta) + S(x))$. Further more, with more than one parameters we have $\phi$ being a vector and $\gamma(\phi) :\Phi^n \mapsto \mathbb R$. 


**Normal Distributions**

The Gaussian distribution describes a continuous random variable with 2 continuous parameters, $\mu, \sigma^2$, the mean and the variance. We illuminate the fact that the Gaussian distribution fit the form described for the exponential family. Directly consider 

$$
\begin{aligned}
    f(x | \mu, \sigma^2) &= \frac{1}{\sigma\sqrt{2\pi}}
    \exp\left(
        -\frac{1}{2} \left(
            \frac{x - \mu}{\sigma}
        \right)^2
    \right)
    \\
    &=\exp\left(
        -\ln (\sigma\sqrt{2 \pi})  
        -\frac{x^2 + \mu^2 -2x\mu}{2\sigma^2} 
    \right)
    \\
    &= 
    \exp\left(
        \underbrace{
            -\ln (\sigma\sqrt{2 \pi}) - 
            \frac{\mu^2}{2\sigma^2}
        }_{ = - \gamma(\phi_1, \phi_2)}
         + 
        \underbrace{
        \frac{1}{\sigma^2} 
        \begin{bmatrix}
            \mu \\ -1/2
        \end{bmatrix}^T
        \begin{bmatrix}
            x \\ x^2
        \end{bmatrix}
        }_{
            \begin{bmatrix}
                \phi_1 \\ \phi_2
            \end{bmatrix}^T
            \begin{bmatrix}
                T_1 \\ T_2
            \end{bmatrix}
        }
    \right), 
\end{aligned}
$$

and the readers are encouraged to work out and comfirm that 

$$
\begin{aligned}
    \begin{bmatrix}
        \phi_1 \\ \phi_2
    \end{bmatrix} &= 
    \begin{bmatrix}
        \mu/\sigma^2 \\ -1/2\sigma^2
    \end{bmatrix}
    \\
    &= \begin{bmatrix}
        \eta_1(\mu, \sigma^2) \\ \eta_2(\mu, \sigma^2)
    \end{bmatrix}
    \\
    &= \vec \eta(\mu, \sigma^2)
    \\
    \gamma(\phi_1, \phi_2) &= -\ln (\sigma\sqrt{2\pi}) - \frac{\mu^2}{2\sigma^2} 
    \\
    &= 
    \frac{-\phi_1^2}{4\phi_2} + \frac{1}{2} \ln\left(
        -\frac{\pi}{\phi_2}
    \right) 
    \\
    &= d(\mu, \sigma), 
    \\
    S(x) &= 0
\end{aligned}
$$

Then, the MLE would be characterize by the equation $\eta(\hat \mu, \hat \sigma^2) = \gamma^{-1}(\mathcal T_1/n, \mathcal T_2/n)$. And this is not a simple equation to solve. Good luck with that. 


**The Exponential Distribution (Single Parameter)**

The exponential family describes a continuous random variable and it's parameter $\lambda$, in our case denote the average rate of some type of events per unit amount of time. To see that it's an example of the exponential family we directly consider that 

$$
\begin{aligned}
    f(x | \lambda) &= \exp(\ln\lambda - \lambda x)
    \\
    \implies 
    \phi T(x) &= -\lambda x
    \\
    \implies &
    \begin{cases}
        \phi = - \lambda = \eta(\lambda)
        \\
        T(x) = x
    \end{cases}
    \\
    \implies 
    \ln(\lambda) &= -\gamma(\phi)
    \\
    \implies &
    \begin{cases}
        \ln(-(-\lambda)) = - \gamma(\phi)
        \\
        \ln(-\phi) = - \gamma(\phi)
        \\
        -\ln(-\phi) = \gamma(\phi)
    \end{cases}
    \\
    \implies S(x) &= 0, 
\end{aligned}
$$

and that is that which is a much easier manifestation compare to the normal distribution. 

**The Binomial Distribution (Single Parameter)**

The bionomial distribution has continuous parameter $\theta\in (0, 1)$, and we made it an open interval. Assuming that the value $n$ denotes the total number of trials and we fix that value. Then this distribution is an exponential family. For all $k \in {1, \cdots, n}$, we have 

$$
\begin{aligned}
    f(k | \theta) &= \begin{pmatrix}
        n \\ k
    \end{pmatrix}\theta^k (1 - \theta)^{n - k}
    \\
    &= \exp\left(
        \ln\begin{pmatrix}
            n \\ k
        \end{pmatrix}
        + 
        k \ln (\theta)
        + (n - k)\ln(1 - \theta)
    \right)
    \\
    &= 
    \exp\left(
        \ln\begin{pmatrix}
            n \\ k
        \end{pmatrix}
        + 
        k \ln \left(
            \frac{\theta}{1 - \theta}
        \right) + 
        n\ln (1 - \theta)
    \right)
    \\
    \implies T(k) &= k
    \\
    \phi &= \ln (\theta/(1 - \theta)) = \eta(\theta), 
\end{aligned}
$$

to look for the function $\gamma(\phi)$, which is implicit, we have 

$$
\begin{aligned}
    \gamma(\phi) &= n \ln(1 - \theta) = ? \text{ Expression with } \phi
    \\
    \phi &= \ln \left(
        \frac{\theta}{1 - \theta}
    \right)
    \\
    \exp(\phi)
    &= 
    \frac{\theta}{1 - \theta}
    \\
    (1 - \theta)\exp(\phi) &= \theta
    \\
    \exp(\phi) &= 
    \theta(1 + \exp(\phi))
    \\
    \theta &= \frac{\exp(\phi)}{1 + \exp(\phi)}, 
    \\
    \implies 
    \gamma(\phi) &= n \ln(1 - \theta) 
    \\
    &= n \ln \left(
        \frac{1}{1 + \exp(\phi)}
    \right)
    \\
    &= -n \ln (1 + \exp(\phi)). 
\end{aligned}
$$

And hence, the actual paramter $\theta$ for the distribution represented via the nautral parameter gives rise to the softmax function. And the gamma function is expressed as above. 


**Remarks**

With $n = 1$, then this become the same as a Bernoulli distribution, and that is still an example of the exponential family. However, with $\theta \in \{0, 1\}$, it's not a valid class of the exponential family anymore. 
