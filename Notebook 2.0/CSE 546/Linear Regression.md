Here we are going to learn about linear regression. 

1. Define the problem 
2. Get the closed form solution 
3. Get the offset version of the problem and its solution 
4. Show that the estimation for the parameters is unbiased. 
5. Find the variance of the estimator of the best parameters. 

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

---
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

Optimizing under the square 2-norm of course. Where $b$ is a constant scalar and $\mathbf{1}$ is a vector of ones in it. 

**The Centered Offset Approach**

Notice that, without the offset is implying the fact that, the mean of all the sample is exactly zero. And that solution is simple. 

let's consider rearranging things by a bit: 

$$
y - (Xw + \mathbf{1}b) = y - (X - \mathbf{1}\mu^T)w - (\mathbf{1}\mu^T)w - \mathbf{1}b
$$

This is like a standardization, where we make the matrix that is multiplying the vector $w$ into a standardized matrix. So we optimize for $w$ first, and then we solve for the best $b$ vector. 

Notice that, I inserted a rank-one matrix, which is the average of all the values of the features, represented as $\mathbf{1}\mu^T$. 

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
        = 
        \frac{\mathbf{1}^Ty}{n} - \mu^T\hat{w}
$$


**The Gradient Approach**

$$
\nabla_w \left[
        \frac{1}{2}\Vert y - (Xw + \mathbf{1}b)\Vert_2^2
    \right]
    =
    -X^T (
        y - (Xw + \mathbf{1}b)
    ) = 0
$$

$$
\partial_b \left[ \frac{1}{2}
        \Vert y - (Xw + \mathbf{1}b)\Vert_2^2
    \right]
    =
    \mathbf{1}^T(y - (Xw + \mathbf{1}b))
    = 
    0
$$

I just added a $\frac{1}{2}$ so the derivative will come out without an extra 2 in  the front. 

Gradient is for vector, and partial derivative is for the constant offset.


**The Augmented Matrix Approach**

Augment matrix $X$ to be: 

$$
\tilde{X} = \begin{bmatrix}
    X & \mathbf{1 }
\end{bmatrix}
$$

And then the new optimizing vector will be defined as: 

$$
\widetilde{w} = \begin{bmatrix}
    w \\ b
\end{bmatrix}
$$

Notice that, this will keep everything the same in such at way that: 

$$
Xw + \mathbf{1}b = \tilde{X}\tilde{w}
$$

Boom, and then we solve the problem wrt to $\hat{w}$, and the solution for that vector will contain the constant we need: $b$.  

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

---
### **Gaussian Noise**

We are going to show that the expected value of the best parameter is indeed the,ground truth for the gaussian distribution.

Consider some perturbations on the parameters: 

$$
\hat{w} = (X^TX)^{-1}X^T(Xw + \epsilon)
$$

Where we decided to add some noise. The assumption we made is that: 

$$
y_i =  x_i^Tw + \epsilon_i
$$

And, each row vector represent all the features of a given sample, in this case, it's the vector $x_i^T$. 

Then, the predicted labels, with the ground truth value $w$ will be given as: 

$$
y = Xw + \epsilon \tag{5546}
$$

and that is how we get the expression for $\hat{w}$. 

In this case, let's show that $\hat{w}$ is an unbiased estimator: 

$$
\mathbb{E}\left[\hat{w}\right] - w
=
\mathbb{E}\left[
        (X^TX)^{-1}X^TX^TXw + (X^TX)^{-1}X^T\epsilon
    \right]
$$

And then we have: 

$$
\mathbb{E}\left[
        w + (X^TX)^{-1}X^T\epsilon
    \right]
$$

And the expected value for the Gaussian random vector is zero, therefore this quantity will equal to the ground truth: $w$. 

**Covariance Matrix for the estimator**

In this part, we are interested in the co-variance matrix of the random variable $\hat{w}$, which is given as: 

$$
\text{Var}\left[\hat{w}\right] = \mathbb{E}\left[
        (\hat{w}
            - \mathbb{E}\left[\hat{w}\right]
        )(\hat{w}
            - \mathbb{E}\left[\hat{w}\right]
        )^T
    \right]
$$

Which will give us the covariance matrix, and we make the same assumption as expression (5546), we will get that the expected value of the co-variance of the estimator will be like: 

$$
\hat{w} - \mathbb{E}\left[\hat{w}\right]
= (X^TX)^{-1}X^T\epsilon
$$

So then: 
$$
(\hat{w} - \mathbb{E}\left[\hat{w}\right])(\hat{w} - \mathbb{E}\left[\hat{w}\right])^T
=
(X^TX)^{-1}X^T\epsilon
\epsilon^TX(X^TX)^{-T}
$$

Notice that, the matrix $X^TX$ is a symmetric matrix, and hence, it's transpose is going to be the same, and the inverse transpose is still going to be the inverse. 

THerefore we have: 

$$
(X^TX)^{-1}X^T\epsilon
\epsilon^TX(X^TX)^{-T} 
=
(X^TX)^{-1}X^T\epsilon
\epsilon^TX(X^TX)^{-1}
$$

And take note that, when we take the expected value of that, the expected value goes all the way inside to the term $\epsilon\epsilon^T$, and hence it's going to be: 

$$
\text{Var}\left[\hat{w}\hat{w}^T\right] = 
(X^TX)^{-1}X^T
\mathbb{E}\left[
        \epsilon\epsilon^T
    \right]
X(X^TX)^{-1}
$$

Take note that, the epsilon vector is a vector of idd rvs where each $\epsilon_i$is drawn from the normal distribution, zero mean, and some kind of variance. 

And it can be said that the variance of such a vector will be: 

$$
\mathbb{E}\left[\epsilon 
    \epsilon^T
\right]
=
\Sigma^2 = 
\text{diag} \left(
    \begin{bmatrix}
        \sigma_1^2 \\ \sigma_2^2 \\ \vdots \\\sigma_n^2
    \end{bmatrix}
\right)
$$

And this is the variance matrix.

And hence, notice that, this matrix can be pull up to the front and giving us: 

$$
\text{Var}\left[\hat{w}\hat{w}^T\right] =
(X^TX)^{-1}X^T \Sigma^2
X(X^TX)^{-1}
$$

Notice that there is a matrix and matrix inverse product above, hence giving us: 

$$
\text{Var}\left[
    \hat{w}\hat{w}^T
    \right]
=
\Sigma^2
(X^TX)^{-1} 
$$

Here we make the assumption that the distribution of the noise is homogenous, so that all the $\sigma_i^2$ equals to each other, therefore we can say that: 

$$
\text{Var}\left[\hat{w}\hat{w}^T\right]
= 
\sigma^2(X^TX)^{-1}
$$

$$
\epsilon \sim \mathcal{N}(w, (X^TX)^{-1})
$$


Boom, we have both the variance and the expected value for the random variable $\hat{w}$. 
