Here we are going to learn about linear regression. 

---
### **Intro**

The model is linear function, and the label we are predicting is a continuous value.

Here we consider the case that, $(x, y_i)$ is the training data and labels. For each sample, we observe multiple features and pack them into a vector. 

Linear function, the labels is a vector of $x_i$, and the parameter for the linear function, the coefficient is denoted by: $w$ vector, and the labels we want to predict is denoted by: $y$ vector. 

The optimization problem we are trying to solve here is: 

$$
\widehat{w} = 
\underset{w}{\text{argmin}}\left\lbrace
    \left\Vert
         Xw - y
    \right\Vert_2^2
\right\rbrace
$$

In addition, we are assuming that the system is over determined(The same thing as getting a full rank matrix), meaning that there are more samples than the number of features in the dataset. 

And, the generative model we are looking at is: 

$$
y = Xw + \epsilon
$$

With th residual vector $\epsilon$. 


### **The Optimal Solution to the Least Square Regression**

$$
\widehat{w} = (X^TX)^{-1}X^Ty
$$

And, we are assuming a full-rank tall matrix. Let $X\in \mathbb{n\times d}$, where $n$ is the number of samples and $d$ is the number of features. 

To make the matrix **full-rank**, it has to be the case that $d \le n$, so that the matrix is at least skinny. Not hard to observe that this is a row data matrix. 

This is just applied math 101, we can use both the project idea, or the gradient of the function to solve for the expression for the optimal parameter. 

Well, For the educated among us, in practice, we rarely have a full rank feature matrix, and all the columns are linear independent. Hence usually regularizer are used. 

---
### **Linear Regression With Offset**

This is the optimization problem with the offset vector $b$: 

$$
\widehat{w}, \widehat{b} = 
\underset{w, b}{\text{argmin}} \Vert y - (Xw + \mathbf{1}b)\Vert_2^2
$$

Optimizing under the square 2-norm of course. 

Notice that, without the offset is implying the fact that, the mean of all the sample is exactly zero. And that solution simple

So them, let's offset all the samples by a $\mu$ vector, and transform the feature space into a new one like: 

$$
\mu =\frac{1}{n}X^T\mathbf{1} \quad \widetilde{X} = X - \mathbf{1}u^T 
$$

Take note that $X^T\mathbf{1}=\mu$ implies that, for each feature associated with the sample space, the mean for each of the feature is $\mu_i$, where $1 \le i \le d$. 

And then the matrix $\mathbf{1}u^T$ is the outter product between these 2 vectors. And hence, after removal of the feature mean, we have $\widetilde{X}$ remains here. 

And then, after this, we can just get **the optimal** $\hat{w}$ by the formula: $(\tilde{X}^T\tilde{X})^{-1}\tilde{X}^Ty$, giving us the optimal value for the regression coefficients. 

Then, we can try to add back a vector $b$, so that the zero mean feature space matrix maps back to the original matrix, which can be given by: 

$$
\hat{b} = \frac{1}{n} \sum_{i = 1}^{n}\left(
        y_i\right) - \mu^T\hat{w}
$$

---
### **MLE, Gaussian and Least Square**

There is a connection between the least square fit and the MLE for the Gaussian distribution, and that is also the reason why it makes least square a good model in under some certain cases.

The connection is: Minimizing the square error for the Linear Regression Model is the same as optimizing for the best likelihood using the Gaussian Model, for a given set of observations. 

The model we are using is: 

$$
\epsilon = y - Xw - b
$$

Where, $y$ is the label vector, and $w$ is parameters of the model, and $b$ is the offset vector. 

Let's pick up from the Maximal likelihood estimator [[Maximal Likelihood Estimator#Gaussian Continuous Variables]], and the log likelihood for the Gaussian Model over a sequence of observation is like: 

$$
\log P(D; \mu, \sigma) = 
-n\log (\sigma \sqrt{2\pi}) - 
\sum_{i = 1}^{n}\frac{(x_i - \mu)^2}{2\sigma^2}
$$

Perfect, last time, the parameters we can tweak was $\mu, \sigma$, but this time the parameters we can tweak is: $w_i$, therefore we have the expression of maximizing the observed likelihood by tweaking $w$: 

$$
\underset{w}{\text{argmax}}
\left\lbrace
    -n\log (\sigma \sqrt{2\pi}) - 
\sum_{i = 1}^{n}\frac{(x_i - \mu)^2}{2\sigma^2}
\right\rbrace
$$

And notice that, some of the terms are just constants and multiplier, therefore this can be simplify into: 

$$
\underset{w}{\text{argmax}}
\left\lbrace
    \sum_{i = 1}^{n}(x_i - \mu)^2
\right\rbrace
$$

However, take note that, the variance is just $\epsilon$ as defined above, hence this is giving us the expression: 

$$
\underset{w}{\text{argmax}}
\left\lbrace
    \sum_{i = 1}^{n}(y_i - x_i^Tw)^2
\right\rbrace
\quad
\underset{w}{\text{argmax}}
    \left\Vert
         y - Xw - b
    \right\Vert_2^2
$$

Boom, this is exactly the same as the linear regression we talked above. 

