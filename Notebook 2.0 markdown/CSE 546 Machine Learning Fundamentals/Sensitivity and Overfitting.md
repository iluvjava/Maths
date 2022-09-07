[Bias Variance Tradeoff](Bias%20Variance%20Tradeoff.md), [Regression and Model Selection](../AMATH%20584%20Numerical%20Linear%20Algebra/Regression%20and%20Model%20Selection.md), [Regularization](../AMATH%20584%20Numerical%20Linear%20Algebra/Regularization.md)
We are going to combat over-fitting this time around. 

The more sensitive it is for the shuffled data to influence that data, it's more likely that we have over-fitting. 

---
### **Intro**

If the errors on the test data is much bigger than the errors on the training data, then we have what we called: "**Over-fitting**"

Sensitivity: 

The prediction is very different depending on the models that get trained, and the output has a huge changes. 

Larger sensitivity: Over-fitting. 

**Note**: Never regularized the offset of the model. 


### **Ridge Regression**

$$
\hat{w} = \underset{w}{\text{argmin}} \left\lbrace
    \Vert 
        Xw - y
    \Vert_2^2 + \lambda \Vert w\Vert_2^2
\right\rbrace
\tag{1}
$$

Take note that, this is **phrased by stats department**, and the math department stresses on the fact that regularization gives a well posed problem, for both under-determined and over-determined linear system. Which is more specific and it's under the context of Matrix vector problem. 

In this case, the regularization is used as an attempt to avoid the over-fitting by reducing the model variance. So the models we gets are similar from each other, instead of varying hugely depending on how the data is drawn from it.

By choosing the right value of $\lambda$, we might be able to get the right model for the system. 

Let's try to solve the ridge regression problem here: 

$$
\frac{1}{2}\Vert Xw - y\Vert^2 + \lambda w
$$

Then the gradient of the above expression will be: 

$$
X^T(Xw - y) + \lambda \mathbb{I} = 0 \implies \hat{w} = (X^TX + \lambda\mathbb{I})^{-1}X^T y
$$

And there is an extra terms added to the norm equations. 

**Questions**? 

What happens to the solutions as this is added? 

**Answer**: 

The estimator for the model $w_i$ shrinks in values. 

**Shrinkage Properties**

As increases the value of the $\lambda$, estimator for the function polynomials gets smaller and smaller. 

As we increase the value of $\lambda$, we will goes from over-fitting to underfitting for the given model. 

**Note**: The last estimator that goes to zero is the most important features of the data set. 

Here, we will assume that the feature of the data consist of $n$ idd variables draw from a unit Gaussian distribution, then the expected value of the data matrix $X$ has the property that: 

$$
\mathbb{E}\left[X^TX\right] = n\mathbb{I}
$$

In this case, this is true, and using this property, can figure out the shrinkage property of the ridge regression by saying that: 

$$
(X^TX + \lambda\mathbb{I})^TX^Ty = \hat{w} \implies \mathbb{E}\left[\hat{w}\right] = 
(n + \lambda)^{-1}X^Ty
$$

Take note that the regress estimator without the regularization is given by: 

$$
(X^TX)^{-1}X^Ty \implies \hat{w}_{\text{ls}} = \frac{X^Ty}{n}
$$

So then, we can relate the ridge regression to the least square estimator and get: 

$$
\mathbb{E}\left[\hat{w}\right]
=
\frac{n}{n + \lambda}\hat{w}_{\text{ls}}
$$

And this is the shrinkage properties of ridge regression demonstrated. In this sense, we will have the value of the estimator approaches zero as the regularization parameters increases. 


---
**The Biased And Variance Properties of Ridge Regression**

For this part, we are going to just list the results, and the proof is shown in this [ppt](https://courses.cs.washington.edu/courses/cse446/21sp/schedule/lecture_7_live.pdf), the results can be summarized as: 

$$
\sigma^2 + \underbrace{\frac{\lambda}{(n + \lambda)^2}(w^Tx)^2}_{\text{Biased Squared}} + \underbrace{\frac{\sigma n}{(n + \lambda)^2}}_{\text{Model Variance}}
\Vert 
x
\Vert_2^2
$$


