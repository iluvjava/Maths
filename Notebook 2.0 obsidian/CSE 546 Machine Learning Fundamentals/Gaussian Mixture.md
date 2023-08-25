This concept has already been introduced in the AMATH class. 

In [[Basic Machine Learning]]. [[Normal Distribution]]

And this is a similar idea compare to 

---
### **Intro**


The Gaussian Distribution in $n$ dimension can be: 

$$
P(x; \mu, \Sigma) - 
\frac{1}{(2\pi)^{d/2}|\Sigma|^{1/2}}
\exp \left(
    - \frac{1}{2}(x - \mu)^T\Sigma^{-1}(x - \mu)
\right) 
$$

This is a Gaussian Distribution with a linear transform matrix $\Sigma$, and a center $\mu$.

Each of the Guassian distribution for each of the classes are going to give us a $\mu$, and a $\Sigma$. 

And, let's construct the weight for each of the sample: $\phi_i$, representing the amount of portion that a given sample is in the Gaussian distribution $i$, this implies that $\sum_{i = 1}^k\phi_i = 0$ and $\phi_i> 0$ for all $i$. 

So that if a sample is given $\phi_1 = \frac{1}{2}$ and $\phi_2 = \frac{1}{2}$, then that sample belongs right between 2 of the gaussian distribution. 

What is the probability of getting a sample $x_j$from the Guassian distribution indexed with $1$? 

It's given by: 

$$
\mathbb{P}\left(x_j \in C_1\right) = \phi_i P\left(x_j; \mu_1, \Sigma_1\right)
$$

Ok, what are we maximizing? 

$$
\max_{\forall i: \phi_i, \mu_i, \Sigma_i} \sum_{j = 1}^{k}
    \log \left(
        \phi_iP(x_j; \mu_i, \Sigma_i)
    \right)
$$

We are tweaking all the parameters associated with all the Gaussian Distributions, wrt to every sample $x_j$ and $\phi_i$, the weight of the membership for each of the sample. 


**Posterior Probability**[^1]


$$
\begin{aligned}
    r_{j, i} &=  \mathbb{P}\left(\text{Sample j blongs to cluster i}\right)    
    \\
    &= \mathbb{P}\left(z_j = i| x_j; \phi_, \mu, \Sigma\right)  
    \\
    &= \frac{\phi_i P(x_j; \mu_i, \Sigma_i)}{
    \sum_{n = 1}^{k}
        \phi_n P(x_j, \mu_n, \Sigma_n)
    } 
\end{aligned}
$$

Where we use $z_j$ to denote a cluster, it's called the cluster indicator, and it has the property that: $z_j \in \{1, 2, \cdots k\}$

$z_j$ is the actual label of $x_j$, and usually in practice we don't know what it is. Therefore, we would need this to compute the probabilty of the membership of a given sample. 
ch
The prosterior probability is also the way we evaluate on the test data set and then use the posterior formula to figure things out. 


[^1]: The posterior probability is the probability of the parameters $\theta$ given the evidence. $\mathbb{P}\left(\theta|X\right)$. Basically the reverse of the prior. 
