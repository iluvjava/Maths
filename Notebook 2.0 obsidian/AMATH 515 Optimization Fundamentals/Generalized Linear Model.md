Let's talk about it under the context statistic modeling. Using Linear model to determine parameters for given statistic distributions. The Generalized linear models are used as a way of dealing with distribution that can be represented exponentially, because the MLE includes the exp, and therefore we will be able to put it under a linear model and optimize for the parameters of the model. 

[Good Reference](http://statmath.wu.ac.at/courses/heather_turner/glmCourse_001.pdf)

In addition, one of the major idea exploited here is: MLE (Maximal Likelihood Estimator). See [Maximal Likelihood Estimator](../STATS%20501%20Statistics%20for%20Mathematicians/Maximal%20Likelihood%20Estimator.md) for more. In addition, it's better to understand the usual linear model, [[Linear Regression]]. 

---

### **Intro**

Give "Features" vectors $a_i \in \mathbb{R}$ with outcomes $y_i$. However, notice that outcomes can be in many different domain: $\mathbb{R}, \mathbb{R}_{\le 0}, \mathbb{Z}_+, \mathbb{F_2}$. 

**The Big Picture**: 

> Suppose that we observe a i.i.d sequence of $(y_i, a_i^T)$ and we want to construct a linear model that describes the missing parameter for the distribution for $Y_i$.  We choose the most appropriate pmf/pdf for the type of observed outcomes. For our case assume that the parameter is a single parameter. Assume that parameter is different for each observed instance. We analyize the likelihood for the i.i.d sequence. Next, we link *some parameters* from the likelihood function to the feature parameter $a_i\in\mathbb{R}^d$ via the linear model $a^T_ix$, with $x$ being our new parameter for the optimization problem.

**Remarks**

It's possible to create mixed models for it as well. 

---
#### **Example | Simple Poisson Regression**

Poisson distribution has $y_i\in \mathbb{Z}_+$, the probability is conditioned on the rate parameter. The pmf is

$$
\begin{aligned}
    & p(y_i| \lambda_i) := \frac{\exp(-\lambda_i)\lambda_i^{y_i}}{y_i!} = \exp(
        - (\lambda_i - y_i \ln(\lambda_i) + \ln(y_i!)))
\end{aligned}
$$

Given a sequence of observation $y_i$, we want to maximize the likelihood of observing the entire set of observations: 

$$
\begin{aligned}
    & \quad
	\arg\max_{\lambda_1, \cdots, \lambda_m} \left(
    \prod_{i = 1}^{m} 
        p(y_i| \lambda_i)
    \right)
	\\
	& \quad \text{apply negative logarithm}
    \\
    & =
    \arg\min_{\lambda_i, \cdots, \lambda_m} 
	\left(
    \sum_{i = 1}^{m} 
		\lambda_i - y_i \ln(\lambda_i) + \ln(y_i!)
    \right), 
\end{aligned}
$$

To associated $y_i$ with a linear model, we associated logarithm of the rate with a linear model. With $\ln(\lambda_i) = a_i^Tx$ where $x\in \mathbb R^d$ being the new undetermined parameter, $a_i$ is the i.i.d feature vectors collected.  Assume that $a\in \mathbb{R}^d$, reducing the optimization problem into

$$
\min_{x} \left(\sum_{i = 1}^{m} 
	\exp(a_i^Tx) - y_ia_i^Tx
\right) + C. 
$$

Where $C$ is some constant. 

**Remarks**
 
This objective function is convex, and it's $C^\infty$, however this is not Beta Smooth because the Hessian has unbounded eigenvalues. Additionally this is also not strongly convex due  Hessian doesn't have lower bound for the eigen value over the entirety of $\mathbb R^n$. Whether we have some kind of other norms with desirable property, is something that I don't know but potentially useful. 

---
#### **Example | Simple Logistic Regression**

$y_i\in \{0, 1\}$, and we want to use a Bernoulli Distribution for the labels. Now, the parameterized distribution of the function will be: $\mathbb{p}(Y|p) = p^y(1 - p)^{1 - y}.$ We express the conditional probability in exponential form inp preparations for the MLE. 

$$
\begin{aligned}
	\mathbb{p}(y|p) &= \exp(y\ln(p))\exp((1 - y)\ln(1 - p)) 
	\\
	 & = \exp(y\ln(p) + (1 - y)\ln(1 - p))
	\\
	 & = \exp(y\ln(p) + \ln(1 - p) - y\ln(1 - p))
	\\
	 & = \exp \left(
	    y\ln \left(
	        \frac{p}{1 - p}
	    \right)+ \ln(1 - p)
	\right)
\end{aligned}
$$

Suppose that we have realizations $(Y_i, p_i)_{i=1}^m$, a list of realizations. The maximal likelihood for the parameters $p_i$, $1 \le i \le m$ is given as: 

$$
\begin{aligned}
	\underset{p_i, i\in [m]}{\text{argmax}}   
	\; \mathcal L(p_1, p_2, \cdots, p_m)
	& =
	\underset{p_i, i\in [m]}{\text{argmax}}
	\prod_{i = 1}^{m}
	    \mathbb{p}(y_i| p_i)
	\\
	& =
	\underset{p_i, i\in [m]}{\text{argmax}}
	\prod_{i = 1}^{m}
	    \exp \left(
	        y_i\ln \left(
	            \frac{p_i}{1 - p_i}
	        \right)+ \ln(1 - p_i)
	    \right)
	\\
	& =
	\underset{p_i, i\in [m]}{\text{argmax}}
	\sum_{i = 1}^{m} \left(
		y_i\ln \left(
			\frac{p_i}{1 - p_i}
		\right)+ \ln(1 - p_i)
	\right)
	\\
	& =
	\underset{p_i, i\in [m]}{\text{argmin}} 
	\sum_{i = 1}^{m} \left(
		- y_i\ln \left(
			\frac{p_i}{1 - p_i}
		\right) - \ln(1 - p_i)
	\right).
\end{aligned}
$$

Let the logarithm of the odds linked to a linear model $a^T_i x$, where the vector $a_i^T\in \mathbb R^d$ describes realizations of features, can be continuous or discrete. With brief reasoning we have $\ln \left(\frac{p_i}{1 - p_i}\right) = a_i^Tx\implies \frac{p_i}{1 - p_i} = \exp(a_i^Tx)$, similarly we have an expression for $1 - p_i$ as well

$$
\begin{aligned}
	\frac{p_i}{1 - p_i} &= 
	\frac{p_i - 1}{1 - p_i} + \frac{1}{1 - p_i} = \exp(a_i^Tx)
	\\
	&= 
	-1 + \frac{1}{1 - p_i} = \exp(a_i^Tx) 
	\\
	\frac{1}{1 - p_i} &= 1 + \exp(a_i^Tx) 
	\\
	\implies & -\ln(1 - p_i) = \ln(1 + \exp(a_i^Tx))
\end{aligned}
$$

Conveniently we have the MLE in the form of a minimization problem with parameters $x$, making use of the feature matrix $A$ (rows are $a_i$), we now have the optimization problem 

$$
\begin{aligned}
	\hat x &= \underset{x}{\text{argmin}}\left\lbrace
		\left(\sum_{i=1}^{m} 
			\ln(1 + \exp(a_i^Tx))
		\right) - b^TAx
	\right\rbrace
	\\
	&= \underset{x}{\text{argmin}}\left\lbrace
		\sum_{i = 1}^{m} \left(
				\ln(1 + \exp(a_i^Tx)) - y_i(a_i^Tx)
			\right)
	\right\rbrace. 
\end{aligned}
$$


And this is the objective for Logistic regression, using generalized Linear model. 


**Model Inferences**

Recalls that linear model is linked to the odds by the expression:

$$
\begin{aligned}
	\frac{p_i}{1 - p_i} &= \exp(a_i^Tx)
	\\
	p_i &= \frac{\exp(a_i^Tx)}{1 + \exp(a_i^Tx)}
\end{aligned}
$$

and then we can solve for $p_i$, which is the conditional probability probability of $y_i=1$ given value for $a_i^T$. 


---
### **Training the Model**

We would need the gradient of the function. I computed it and this is the gradient of the function.  

$$
\begin{aligned}
	& \nabla_x \left[\sum_{i = 1}^{m} \log(1 + \exp(a_i^T x))\right]
	= 
	\left(
		\sum_{i = 1}^{m} 
		\frac{\exp(a_i^Tx)}{1 + \exp(a_i^Tx)}
	\right) a_i^T, 
\end{aligned}
$$

And the gradient of $b^TAx$ is just $b^TA$. 

---
### **Odds and Linearity of Odds**

Here I want to point out that the Logistic equation is hidden in the expression here. When we construct the linear model, we did: 
$$
\frac{p_i}{1 - p_i} = \exp(a_i^Tx). 
$$

And solving for $p_i$ it will give us: 

$$
p_i = \frac{\exp(a_i^Tx)}{1 + \exp(a_i^Tx)} = \frac{1}{1 - \exp(-a_i^Tx)}
$$

As we can see, the observe probability of something happened $p_i$ is the CFD function of the logistic distribution.
