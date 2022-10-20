
[[Generalized Linear Model]]

Why is the regression model focusing on the vertical distance between the model prediction and the data it tries to predict. 

Gaussian & Cauchy Distribution for MLE on regression model

---
### **Simple Regression MLE** 

Let's proposed a generative model for a 1D regression:

> $$y_i = a_0 + a_1x + \epsilon_i$$

Where $a_0, a_1$ are the parameters of the model and $\epsilon_i$ is the variance. 

**Assuming Independent Variance and Guassian Distributions**

This means that: 

$$
\epsilon_i = N(0, \sigma^2)
$$

In which, the variance is unknown for now. 

But with the distribution, we have the statement that: 

$$
p(\epsilon_i = z_i) = \frac{\exp(-z_i^2/2\sigma^2)}{\sqrt{(2\pi\sigma^2)}}
$$

Which gives the probability of observing $\epsilon_i$ equals to a particular value $z_i$. 

Meanwhile, according to our model, we have: 

> $$\epsilon_i  = a_0 + a_1x_i - y_i$$

Using the **Independence** assumption, we have: 

$$
p(\{y_i\}|a_0, a_1, \{x_i\}) = \prod_{i = 1}^m 
\frac{\exp(-(y_i - a_0 -a_1x_i)^2/2\sigma^2)}{\sqrt{(2\pi\sigma^2)}}
$$

And take notice that all the terms can be accumulated into: 

$$
\left(
\frac{1}{\sqrt{2\pi\sigma^2}}
\right)^m
\exp\left(
-\sum_{i=1}^m
	\frac{(y_i - a_0 -a_1x_i)^2}{2\sigma^2}
\right)
$$

And that is the likelihood of observing such a variance on the residual of the model, given the parameters of the model and the data we collected. 

And the best model is the model is the parameters such that it maximizes the probability of such a likelihood. The likelihood estimator will be:

$$
\mathcal{L}(a_0, a_1) =
\left(
\frac{1}{\sqrt{2\pi\sigma^2}}
\right)^m
\exp\left(
-\sum_{i=1}^m
	\frac{(y_i - a_0 -a_1x_i)^2}{2\sigma^2}
\right)
$$

And the corresponding Minimization problem will be: 

$$
-\min_{a_0, a_1}( -\ln(L(a_0, sa_1)))
$$

In which, because of the multiplier containing the variance is going to be a constant offset after taking the logarithm, the optimization problem will be equivalent to: 

$$
\min_{a_0, a_1} \sum (y_i - a_0 - a_1x_i)^2
$$

Which is expected. 

---
#### **T-Distribution: Robust Fit**

The key to get to the optimization problem is the assumption on the distribution of the variance on the data set, for this very reason, we can tweak the model, which might take into account for some of the outliers observed. 

For example, the student T distribution. 

$$f\left(x ; x_{0}, \gamma\right)=\frac{1}{\pi \gamma\left[1+\left(\frac{x-x_{0}}{\gamma}\right)^{2}\right]}=\frac{1}{\pi \gamma}\left[\frac{\gamma^{2}}{\left(x-x_{0}\right)^{2}+\gamma^{2}}\right]$$

And for our purposes, let's assume that $\pi, \gamma = 1$ and then we center the distribution at $x_0 = 0$, giving us the estimator to be: 

$$
p(\epsilon_i = z_i) = \frac{1}{1 + z_i^2}
$$

This model is **Robust** to outliers because of reduced penalties for outliers. 

$$
\mathcal{L}(\{y_i\}, a_0, a_1, \{x_i\}) = 
\prod_{i = 1}^m
\frac{1}{1 + (y_i - a_0 - a_1)^2}
$$

And take notice that, if we minimizes this, we will have: 

$$
-\min_{a_1, a_0}(-\ln(\mathcal{L}(a_0, a_1)))
$$

Which produces the expression: 

$$
\sum_{i = 1}^m \ln(1 + (y_i - a_0-a_1x_i)^2)
$$

And the key here is to notice that the optimization problem will be **Non-Linear** because the parameters are interacting with each other. 

This means that, if we take the derivative of $a_0$, then that expression will have $a_1$ in it and vice versa. 

