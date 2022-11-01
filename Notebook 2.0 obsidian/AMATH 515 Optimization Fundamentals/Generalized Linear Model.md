Let's talk about it under the context statistic modeling. Using Linear model to determine parameters for given statistic distributions. 

The Generalized linear models are used as a way of dealing with distribution that can be represented exponentially, because the MLE includes the exp, and therefore we will be able to put it under a linear model and optimize for the parameters of the model. 

[Good Reference](http://statmath.wu.ac.at/courses/heather_turner/glmCourse_001.pdf)

In addition, one of the major idea exploited here is: MLE (Maximal Likelihood Estimator). See [[Maximal Likelihood Estimator]] for more. 

In addition, it's better to understand the usual linear model, [[Linear Regression]]. 

---

### **Intro**

Give  "Features" vectors $a_i \in \mathbb{R}$ with outcomes $y_i$. ßHowever, notice that outcomes can be in many different domain: $\mathbb{R}, \mathbb{R}_{\le 0}, \mathbb{Z}_+, \mathbb{F_2}$

**The Big Picture**: 

> Choose the most appropriate distribution for the type of outcomes. Then we link parameters of that distributions to the $a_i\in\mathbb{R}^n$.
> 
> And then we try to nest the model into a distribution model, so when we make the prediction, we will have a weight vector for each set of observations on $a_i$, giving us: $a_i^Tx^*$, which will produce one integer scalar $\hat{y}_i$

---
#### **Example: Poisson Regression**

Poisson distribution has $y_i\in \mathbb{Z}_+$, the probability is conditioned on the rate parameter. Firstly we observe the following relations: 

$$
\begin{aligned}
    & p(y_i| \lambda_i) := \frac{\exp(-\lambda_i)\lambda_i^{y_i}}{y_i!}
    \\
    & \exp(
        - (\lambda_i - y_i \ln(\lambda_i) + \ln(y_i!)), 
    )
\end{aligned}
$$

Given a sequence of observation $y_i$, we want to maximize the likelihood of observing the entire set of observations: 

$$
\begin{aligned}
    & \hspace{1.4em} \arg\max_{\lambda_1, \lambda_2 \cdots} \left(
    \prod_{i = 1}^{m} 
        p(y_i| \lambda_i)
    \right)
    \\
    & =
    \arg\min_{\lambda_i \forall 1 \le i \le m} \left( 
    \sum_{i = 1}^{m} \left(
            \lambda_i - y_i \ln(\lambda_i) + \ln(y_i!)
          \right)
    \right), 
\end{aligned}
$$

Assume now that $\ln(\lambda_i) = a_i^Tx$ where $x$ is shared (We want a linear model for a list of poisson parameters) and $a_i$ is a vector and they are the independent variables we collected, we assume that $a\in \mathbb{R}^m$, or else linear model is not applicable here. So when the problem reduces to: 

$$
\min_{x} \left(\sum_{i = 1}^{m} \left(
        \exp(a_i^Tx) - y_ia_i^Tx
\right)\right) + C. 
$$

Where $C$ is some constant. This objective function is convex, and it's $C^\infty$, however this is not Beta Smooth because the Hessian has unbounded eigenvalues. Finally, we will be only interested in the minimizer. 

---
#### **Example: Logistic Regression**

$y_i\in \{0, 1\}$, and we want to use a Bernoulli Distribution for the labels. Now, the distribution of the function will be: 

$$
\mathbb{p}(Y|p) = p^y(1 - p)^{1 - y}.
$$

And, now we are going express it in an exponential form, so it gets linear when we take the logarithm on the MLE of it: 

$$
\begin{aligned}
	& \mathbb{p}(y|p) = \exp(y\ln(p))\exp((1 - y)\ln(1 - p)) 
	\\
	& \mathbb{p}(y|p) = \exp(y\ln(p) + (1 - y)\ln(1 - p))
	\\
	& \mathbb{p}(y|p) = \exp(y\ln(p) + \ln(1 - p) - y\ln(1 - p))
	\\
	& \mathbb{p}(y|p) = \exp \left(
	    y\ln \left(
	        \frac{p}{1 - p}
	    \right)+ \ln(1 - p)
	\right)
\end{aligned}
$$

maximizing over a series of observation on the label sets: $\{y_i\}$ gives: 
$$
\begin{aligned}
	& 
	\underset{p_i, \forall i=1, \cdots m}{\text{argmax}}
	\left(
	\prod_{i = 1}^{m}
	    \mathbb{p}(y_i| p_i)
	\right)
	\\
	=&
	\underset{p_i, \forall i=1, \cdots m}{\text{argmax}}
	\left(
	\prod_{i = 1}^{m}
	    \exp \left(
	        y_i\ln \left(
	            \frac{p_i}{1 - p_i}
	        \right)+ \ln(1 - p_i)
	    \right)
	\right)
	\\
	=&
	\underset{p_i, \forall i=1, \cdots m}{\text{argmax}}
	\left(
	    \sum_{i = 1}^{m} \left(
	        y_i\ln \left(
	            \frac{p_i}{1 - p_i}
	        \right)+ \ln(1 - p_i)
	    \right)
	\right)
	\\
	=&
	\underset{p_i, \forall i=1, \cdots m}{\text{argmin}} \left(
	    \sum_{i = 1}^{m} \left(
	        - y_i\ln \left(
	            \frac{p_i}{1 - p_i}
	        \right) - \ln(1 - p_i)
	    \right)
	\right).
\end{aligned}
$$

Now, we **link one of the parametric dependent parameter to a linear model**, let's say that: 

$$
\ln \left(\frac{p_i}{1 - p_i}\right) = a_i^Tx
\implies 
\frac{p_i}{1 - p_i} = \exp(a_i^Tx)
$$

And conveniently: 

$$
\frac{p_i}{1 - p_i} = \frac{p_i - 1}{1 - p_i} + \frac{1}{1 - p_i} = 
-1 + \frac{1}{1 - p_i} = \exp(a_i^Tx) 
$$

Rearranging we have: 

$$
\frac{1}{1 - p_i} = 1 + \exp(a_i^Tx) \implies -\ln(1 - p_i) = \ln(1 + \exp(a_i^Tx))
$$

Conveniently we have the MLE in the form of a minimization problem with parameters $x$, feature matrix $A$ (rows are $a_i$): 

$$
\underset{x}{\text{argmin}}\left\lbrace
    \sum_{i = 1}^{m} \left(
            \ln(1 + \exp(a_i^Tx)) - y_i(a_i^Tx)
        \right)
\right\rbrace
$$

Which can be more compact and changed into:

> $$
> \underset{x}{\text{argmin}}\left\lbrace
> 	\left(\sum_{i=1}^{m} 
>         \log(1 + \exp(a_i^Tx))
>     \right) - b^TAx
> \right\rbrace
> $$

And this is the objective for Poisson regression, using generalized Linear model. **What is $a_i$**? They are rows of the feature matrix, and each row vector of such a matrix is the predictors for our model. **How do we predict stuff using this model**? Remember the substitution we made: 

$$
\frac{p_i}{1 - p_i} = \exp(a_i^Tx), 
$$

And then we can solve for $p_i$, which is the probability of whether a given set of observed data $\exp(a_i^Tx)$ corresponds to $1$. 

$$
p_i = \frac{\exp(a_i^Tx)}{1 + \exp(a_i^Tx)}
$$

---
### **Odds and Linearity of Odds**

Here I want to point out that the Logistic equation is hidden in the expression here. When we construct the linear model, we did: 
$$
\frac{p_i}{1 - p_i} = \exp(a_i^Tx)
$$
And solving for $p_i$ it will give us: 

$$
p_i = \frac{\exp(a_i^Tx)}{1 + \exp(a_i^Tx)} = \frac{1}{1 - \exp(-a_i^Tx)}
$$

As we can see, the observe probability of something happened $p_i$ is the CFD function of the logistic distribution.
