- [Maximal Likelihood Estimator](../STATS%20501%20Statistics%20for%20Mathematicians/Maximal%20Likelihood%20Estimator.md)

---
### **Intro**

Assume a generative model of the form $y = Xw + \epsilon$ where $X$ is a matrix of realized random variables. Each row corresponds to a realized instance of random variable list $x_i\in \mathbb R^d$, there are $n$ of them in total. Let residual vector $\epsilon$, let it assume to have a Gaussian distribution with some known parameters then the maximal likely estimator for $w$ is provided by

$$
\widehat{w} = 
\underset{w}{\text{argmin}}\left\lbrace
    \left\Vert
         Xw - y
    \right\Vert_2^2
\right\rbrace. 
$$

Let $x\in \mathbb R^{n\times d}$ be the realization of features. Assuming that the matrix is full ranked. It's at least the case that $d \le n$, then the MLE is given as $\widehat{w} = (X^TX)^{-1}X^Ty$. In practice, full rank is rarely the case and hence, the idea of regularization occurred. 

---
### **Linear Regression With Offset**

We look for the mostly likely unknow parameters from a linear function with random variables in it, from an i.i.d sequence of realizations, of the inputs and the outputs of the function. 

#### **Claim | The Minimizing a Stochastic Function**
> Suppose that we have a linear function $f(x | w, b ; \epsilon) = x^Tw + b + \epsilon$, where $w, b$ unknown parameters and $\epsilon$ is a guassian random variable $\sim N(0, \sigma^2)$. Further assume that a sequence of i.i.d observations had been made, recored as rows for the matrix $X$. Then the MLE for the parameters of the function is produced by the optimization problem
> 
> $$
> \widehat{w}, \widehat{b} = 
> \underset{w, b}{\text{argmin}} \Vert y - (Xw + \mathbf{1}b)\Vert_2^2, 
> $$
> where $\mathbf 1$ denotes a vector full of ones in it. 

**The Centered Offset Approach for a Closed Form**

Let the random varaible $Y = \vec X w + b + \epsilon$, where $\vec X$ is a vector of random variable from some unknown distribution. Observe that if $\epsilon\sim N(0, \sigma^2)$, then $b + \epsilon \sim N(b, \sigma^2)$. So then 

$$
\begin{aligned}
    Y - \vec X w &= b + \epsilon 
    \\
    Y - \langle \vec X, w\rangle &= b + \epsilon
    \\
    \mathbb{E}\left[
        Y - \langle \vec X, w\rangle
    \right] &= b
    \\
    \mathbb{E}\left[Y\right] - 
    \mathbb{E}\left[\langle \vec X, w\rangle\right] &= b
    \\
    \mathbb{E}\left[Y\right] - 
    \left\langle 
    \mathbb{E}\left[
        \vec X
    \right], w
    \right\rangle &= b,
\end{aligned}
$$

once an estimate for the value $w$ is specified, then we can obtain the value of the offsets depending on the value of $w$. 

**The Gradient Approach**

A gradient approach can be used to find the offset parameter for the model. 

$$
\begin{aligned}
    \nabla_w \left[
        \frac{1}{2}\Vert y - (Xw + \mathbf{1}b)\Vert_2^2
    \right]
    &=
    -X^T (
        y - (Xw + \mathbf{1}b)
    ) = \mathbf 0
    \\
    \partial_b \left[ \frac{1}{2}
        \Vert y - (Xw + \mathbf{1}b)\Vert_2^2
    \right]
    &=
    \mathbf{1}^T(y - (Xw + \mathbf{1}b))
    = 
    0
\end{aligned}
$$


I just added a $\frac{1}{2}$ so the derivative will come out without an extra 2 in  the front. 


**The Augmented Matrix Approach**

Augment matrix $X$ to be: $\tilde{X} = \begin{bmatrix}X & \mathbf{1 }\end{bmatrix}$, And then the new optimizing vector will be defined as: $\widetilde{w} = \begin{bmatrix}w \\ b\end{bmatrix}$. Notice that, this will keep everything the same in such at way that: $Xw + \mathbf{1}b = \tilde{X}\tilde{w}$. Then we solve the problem wrt to $\hat{w}$, and the solution for that vector will contain the constant we need: $b$.  

---
### **Linear Regression MLE Formulations**

The optimization problem for the linear regression problem is posed from the Maximal Likelihood estimation from statistical inferences. 

#### **Claim | Regression via Statistical Inferences**
> The optimization stems from a linear model of the distribution function and a noise vector that comes from a Gaussian Distribution. 

**Demonstrations**

The linear regression model can be directly deduced using the idea of maximal likelyhood. Let our model be $Y = \langle \vec X, w \rangle + b + \epsilon$ with $e
\sim N(0, \sigma^2)$, suppose that $n$ a list of $\{(x_i, y_i)\}_{i = 1}^n$ had been observed as i.i.d random variables. Then the likelihood of the unknown parameters can be computed using the pdf of zero mean random Gaussian: 

$$
\begin{aligned}
    \mathcal L(w) &= \prod_{i = 1}^{n} 
    \frac{1}{\sigma \sqrt{2 \pi}} 
    \exp\left(
        \frac{-1}{2}
        \frac{(y_i - \langle x_i, w\rangle - b)^2}{\sigma^2}
    \right)
    \\
    -\ln \mathcal L(w) &= 
    \ln(\sigma \sqrt{w\pi})
    -
    \sum_{i = 1}^{n}
    \frac{-1}{2}
        \frac{(y_i - \langle x_i, w\rangle - b)^2}{\sigma^2}
    \\
    \text{in vector matrix form:}& 
    \\

    &= 
    \ln (\sigma\sqrt{w\pi}) + 
    \frac{1}{2} \Vert \vec y - M w - b\mathbf 1\Vert_2^2, 
\end{aligned}
$$

and maximizing the likelihood means minimizing $-\ln \mathcal L(w)$ in this case. The matrix $M$ is a matrix whose row vectors are the list of observations $x_i$ sampled. And this is the form of the regression problem. Finally, we note here that, the solution to the problem is not necessarily unique. But in the case of full-ranked matrix the best estimator is give by $(M^TM)^{-1}M^T(\vec y - b \mathbf 1)$. 

---
### **Analysis of the MLE**

We analyze the bias and the variance for the MLE provided from the previous section. 

#### **Claim | The Estimator is Unbiased**
> The estimator $w = (M^TM)^{-1}M^T(\vec y - b \mathbf 1)$ is unbiased, meaning that $\mathbb{E}\left[\hat w - w\right] = 0$, for the observed sequence of i.i.d variables packed as rows of the matrix $M$. 

**Demonstration**

We claim that $\hat{w} = (M^TM)^{-1}M^T(Mw + \epsilon)$, this is true because $\vec y = Mx + b \mathbf 1 + \vec \epsilon$, where $\vec \epsilon$ is a zero mean Gaussian random variable vector, re-arranging and substituting $\vec y - b = \mathbf 1 Mx + \vec \epsilon$, we linked the best estimator $\hat w$ with the theoretical noise in the model. To show that there is no bias, we fix the row data matrix $M$ for some i.i.d realizations of vector $x$ from the model, only noise vector $\epsilon$ left, taking the expected on the MLE we gain

$$
\begin{aligned}
    \mathbb{E}\left[\hat{w}\right] - w
    & =
    \mathbb{E}\left[
        (M^TM)^{-1}M^TM^TMw + (M^TM)^{-1}M^T\epsilon
    \right]
    \\
    &= 
    \mathbb{E}\left[
        w + (M^TM)^{-1}M^T\epsilon
    \right]
    \\
    &= \mathbb{E}\left[w\right] + 
    (M^TM)^{-1}M^T \mathbb{E}\left[\epsilon\right]. 
\end{aligned}
$$

and the expected value for the Gaussian random vector is zero, therefore this quantity will equal to the ground truth: $w$. 

**Covariance Matrix for the estimator**

In this part, we are interested in investigating the covariance for the MLE estimator $\hat{w}$, to start we have that 

$$
\begin{aligned}
    \text{Var}\left[\hat{w}\right] 
    &= \mathbb{E}\left[
        (\hat{w}
            - \mathbb{E}\left[\hat{w}\right]
        )(\hat{w}
            - \mathbb{E}\left[\hat{w}\right]
        )^T
    \right]
    \\
    \text{recall: }
    \hat{w} - \mathbb{E}\left[\hat{w}\right]
    &= 
    (M^TM)^{-1}X^T\epsilon
    \\
    (\hat w - \mathbb{E}\left[\hat w\right])(\hat w - \mathbb{E}\left[\hat w\right])^T&= 
    (M^TM)^{-1}M^T\epsilon
    \epsilon^TM(M^TM)^{-T} 
    \\
    & =
    (M^TM)^{-1}M^T\epsilon
    \epsilon^TM(M^TM)^{-1}
\end{aligned}
$$

What we had produced, is the covariance matrix for the random variable $\hat w$, in this case, it's conditioned on $M$, the data matrix $M$. On the last line, we used the fact that $M^TM$ is a symmetric matrix. Finally, evaluating the expected value of the term yieds: 

$$
\text{Var}\left[\hat{w}\hat{w}^T\right] = 
(M^TM)^{-1}M^T
\mathbb{E}\left[
        \epsilon\epsilon^T
    \right]
M(M^TM)^{-1}. 
$$

Take note that, the epsilon vector is a vector of idd rvs where each $\epsilon_i$is drawn from the normal distribution, zero mean, with some kind of variance. Therefore we may quantify it as

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
\right),
$$

Let $\Sigma^2$ be the variance matrix. And hence, notice that, this matrix can be pulled up to the front and giving us: $\text{Var}\left[\hat{w}\hat{w}^T\right] =(M^TM)^{-1}M^T \Sigma^2 M(M^TM)^{-1}$.
Here if we make the assumption that the distribution of the noise is homogenous, so that all the $\sigma_i^2$ equals to each other, therefore we can say that: 


$$
\begin{aligned}
    & 
    \text{Var}\left[\hat{w}\hat{w}^T\right]
    = 
    \sigma^2(M^TM)^{-1}
    \\
    \implies & \hat w\hat w^T \sim \mathcal{N}(w, \sigma^2(M^TM)^{-1}). 
\end{aligned}
$$

And that is an expression for the covariance matrix of the MLE for the linear regression estimator. 
