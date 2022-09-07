[Linear Regression](Linear%20Regression.md)
As the title suggest, we are still going to work on linear regression, but this time in a much more generalized context. 

Intuitively we are just transforming the features of the data set. Making it richer. 

---

### **Intro**

Last time: 

1. Collect data
2. Make model 
3. MLE -> Loss functions

The setup is still the same. 

We want to predict continuos variables as labels: 

$$
x \in \mathbb{R}^d \quad y\in \mathbb{R}
$$

And te number of samples we have as training data is: $n$. 

And the model we have is like: 

$$
\hat{y} = x^Tw + b
$$

Where $\hat{y}$ is the predicted vector. 

There are 2 possible way to get really bad loss function for a linear regression model: 

1. It has non-linear functions behind it. 
2. The features are just not good predictors. 

---
### **Polynomial Fit (Higher Order Features)**

Linear fit on non-linear relationship will create a lot of loss on the function, reducing the predictive power of the model. 

Changing the hypothesis, for example, to Degree p polynomials. 

Then we just use the Vandermonde Matrix to achieve this, where, each row is just the features of the samples. 

In general, each row of the Vandermonde is going to be a multi-nomial polynomials, there is going to be a lot of terms to it. 

Here, let's say that we have 2 features, $d = 2$, and we want degree $2$ polynomials, so that is $p = 2$, then the Vandermonde matrix that we are going to be multiplied by $w$ on the right hand side will be like: 

$$
X = \begin{bmatrix}
    x_{1, 1}^2 & x_{1, 2}^2 & x_{1, 1}x_{1, 2} & x_{1, 1} & x_{1, 2} & 1
    \\
    x_{2, 1}^2 & x_{2, 2}^2 & x_{2, 1}x_{2, 2} & x_{2, 1} & x_{2, 2} & 1
    \\
    \vdots
    \\
    x_{n, 1}^2 & x_{n, 2}^2 & x_{n, 1}x_{n, 2} & x_{n, 1} & x_{n, 2} & 1
\end{bmatrix}
$$

Boom, then the problem is going to be phrased like: 

$$
\hat{w} = \underset{w}{\text{argmin}}
\Vert 
    Xw - y
\Vert_2^2
$$

And this is one of the way to generalize the regression! There are a lot of terms in the polynomials tho, like, a lot. Which is growing "Combinatorically" wrt to the degree of the polynomial, and the features. 

**Important Notes**

The features crosses are considered collinearity, with the assumption that the features are random variable that are independently, all the features that are crossing, terms like: $x_1x_2$, will be gotten rid of, saving us a lot of space for the Vandermond Matrix. 

**More Generally**

We are creating a function $h(x)$ that maps the features from dimension $d$ to dimension $p$. 

And the label under the hypothesis will be given by the function: 

$$
y_i = h(x)^Tw
$$

Where $h(x)$ is gonna be like: 

$$
h(x) = \begin{bmatrix}
    h_1(x) \\ h_2(x) \\ \vdots \\ h_q(x)
\end{bmatrix}
$$

And it transform the features from $\mathbb{R}^d$ into $\mathbb{R}^p$.  

And it will be like: $w \in\mathbb{R}^p$. 

**Ok, where we seem this before?**

Well, it's in here: [Generalized Linear Model](../AMATH%20515%20Optimization%20Fundamentals/Generalized%20Linear%20Model.md), where, we talked  about the logistic regression, and also [Softmax Regression](../AMATH%20515%20Optimization%20Fundamentals/Softmax%20Regression.md). 