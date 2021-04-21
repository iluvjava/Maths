Here, we are going to learn about binary/multi-class classification in this file. 


---
### **Intro**

So the predictions we are going to preduce will be in the format of $\{1, 2, \cdots K\}$, or in the case of binary classifications it will be like: $\{0, 1\}$. 
 
**Loss Function**

$$
l(f(x), y) = \mathbf{1}\{f(x)\ne y\}
$$

It basically counts the number of classification that is incorrect. 


Consider the joint distribution of random variable, and in this case the $Y$ random variable is binary. 
$$
\mathbb{E}_{XY}\left[
        l(f(x), y)
    \right]
$$

Consider the output of a function that is conditioned on the value of $X$, and we want to measure the expected value of it answering things correct, and in that case: 

$$
\mathbb{E}_{Y|X}\left[
        \mathbf{1}\{
                f(x)\ne Y
            \}|
            X = x
    \right]
$$

And this is just the Expected value of the loss function. 

Then by definition, we can say that: 

$$
\sum_{i = 1 }^{K}
    \mathbb{P}\left(Y = i| X = x\right)
    \mathbf{1}\{
            f(x)\ne i
        \}
$$

This, is the expected value of, our model made a wrong perdiction for all the labels that goes from $1$ to $K$.

Alternatively, it's just: 

$$
1 - \mathbb{P}\left(Y = f(x)|X = x\right)
$$

The probability of one the model making a wrong prediction conditioned on an obseration of the random variable $X$. 


---
### **Important Questions**

Suppose that we know the exact value for $\mathbb{P}(Y|X)$, how should we set the classifier? 

**Introducing**:  **Bayes-Optimal Classifier**

$$
f(x)  = \underset{y}{\text{argmax}} \{\mathbb{P}\left(Y = y|X = x\right)\}
$$

The output of the model, is the mostly likely observation of $Y$, if we were given the fact that $X = x$. 


---
### **Bayes Optimal Binary Classifier**

Suppose that $Y\in \{0, 1\}$, and we have $\{(x_i, y_i)\}_{i = 1}^n$

We make the assumption that the observed random variable $x$ are i.d.d, then we will be estimating the $\mathbb{P}(Y|X)$ just from our samples. 

Now, what is the natural estimator for $\mathbb{P}(Y = 1|X = \tilde{x})$?

For all $\tilde{x}$ among all observed samples, what is the portion of them has has $Y = 1$? 

Basically: 

$$
\mathbb{P}\left({X = \tilde{x}}|Y = 1\right)
$$

If, among all of the $n$ samplse, $m$ of them are $\tilde{x}$ and $k$ of them associated with $Y = 1$, then we can se that the most likely esimator of the above expression will be: $\frac{k}{m}$

This is an unbiased estimator. 

---
### **Counting Bayes Binary Classifier**

We just count the sample and get the portions to get an estimate for predicting the labels of $Y$

Let's consider observed samples: $\{(x_i, y_i)\}_{i = 1}^n$

Let's assume that the label we want to predicts take the form $Y\in \{0, 1\}$. 

Let's assume that we observe discrete values of $x_i$, with $d$ number of features, so that means: $X \subset \{0, 1\}^d$

Then it can be said that the best estimator for a given label will be: 

$$
\hat{f}(x) = \underset{y\in\{0, 1\}}{\text{argmax}}
\left\lbrace
    \frac{
        \sum_{i = 1}^{n}
            \mathbf{1}[x_i = x]\wedge\mathbf{1}[y_i = y]
    }{
        \sum_{i = 1}^{n}
            \mathbf{1}[x_i = x]
    }
\right\rbrace
$$ 

Take notice that this is **not really realistic**, because for the denominotor to be none zero, we have to make sure that the value $x$ **must be observed at least once** in the data we collected, if not, then the denominator is going to be zero. 


---
### **Continous Predictors**

Yes, we can use linear regression, but, there is one problem. 

Consider $w^Tx$, if we fixed the quantity of $w$, then it's possible to choose some combinations of $x_i$ for the linear model such that $w^Tx$ gives a quantity that is larger than $1$, and that is a fallacy because probability cannot be larger than one. 

Consider anther function that has this property: 

$$
\sigma(x): \mathbb{R}\cup \{-\infty, \infty\}\mapsto [0, 1]
$$

And one of the choice is the Sigmoid Function, and it's like: 

$$
\sigma(z):= \frac{1}{1 + \exp(-z)}
$$

Then the model we are going to use will be $f(x) = \sigma(w^Tx)$. Or with biases from the linear model, it will be like: $f(x) = \sigma(w^Tx + \beta)$

Interestingly: $1 - \sigma(z) = \sigma(-z)$

**Questions**: 

Can we replace the linear function with other models? 

Yes, we can do that for other function. The sigmoid function is just adapting to a new interval. [^1]: 

---
### **Multi-Class Softmax**

In the case of multi-class classification, the model we will be looking at will be: 

$$
\mathbb{P}\left(Y = j\right| X = x) = 
\frac{\exp(-w_j^Tx)}{\sum_{i = 1}^{K}
    \exp(-w^T_ix)
}
$$


[^1]: There is more to it, but we are just gong to say this in here.



