Similar to the idea of MLE (Maximal Likelihood) estimator, the method of MOM seeks to look for the best model parameters that explain that distributions. 


Reference Materials: 

---
### **Intro**

Moments of Samples: 

$$
\frac{1}{n}\sum_{i = 1}^{n}x_i
$$

k th Moments for a Random Variable: 

$$
\mathbb{E}[X^{k}]
$$

kth Moment of $X$ about constant $c$ is: 

$$
\mathbb{E}[(x - c)^k]
$$

**Statement of Method**: 

Let random variable $W$ be produced by model with a set of parameters: $\Theta$. And there are $m$ parameters in total for the model. 

Denote the underlying distribution of $W$ to be $f$ with parameters $\Theta$. 

Define the moments for the observed random variable to be: 

$$
\mu_k = \frac{1}{n}\sum_{i = 1}^{n}w_i^k
$$

Then we try to solve a system of equations given as: 

$$
\begin{matrix}
    \mu_1 &= \mathbb{E}[W]
    \\
    \mu_2 &= \mathbb{E}[W^2]
    \\
    \mu_3 &= \mathbb{E}[W^3]  
    \\
    \vdots 
    \\
    \mu_m &= \mathbb{E}[W^m]
\end{matrix}
$$

And notice that, the expected value for the distribution with given set of parameters will be like: 



---

