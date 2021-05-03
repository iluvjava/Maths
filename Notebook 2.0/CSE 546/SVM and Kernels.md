Outside the realm of Computer Science, SVMs and Kernels are also discussed for math. 
[[SVM]]
Where we formulate the mathematical problem as a quadratic programming problem and give some overview on the computational approaches for training process. 

Here, we will do the problem like a statistician and see why such a approach to the problem makes sense. 

---
### **Intro**

What we seem so far in the CS department, or the stats department is what we called a **Generative Approach**: 

We assume a generative model behind the data, and then we try to use the idea of MLEs, and different assumption on the noise (which relates to the Noise function), and then we optimize for minimal loss the given data. 

Like the, Regression, and Bayes Classification, Logistic Regression etc.

Another approach is the **Discriminative Approach**: 

* Pick a loss function. 
* Pick a set of hypothesis. 
* Pick a function f that minimizes loss on the training data. 

---
### **Reviewing the Logistic Regression**

The logistic regression tries to figure out the best. 

The biggest thing we use, is to rely on the conditional probability: 

$$
f(x) = \arg \max_y \left\lbrace
    \mathbb{P}\left(Y = y| X = x\right)
\right\rbrace
$$

This is the generative approach. And we use some model for THIS conditional probability, and our logistic model is like: 

$$
\mathbb{P}\left(Y = y| x, w\right) = 
\frac{1}{1 + \exp(-yw^Tx)}
$$

And then we use the MLE to formulate the optimization problem. 

In practice, the model is usually not exactly right. This is a problem general to all generative approach for machine learning. 

Eventually, we will have a linear classifier for the model. 

What if, we just directly use a linear classifier to make the prediction. 

* We don't care what is the generative process for the data. 
* We just want to make a linear model to best separate the data. 

---
### **Linear Classifier**

When making a linear classifier, we assume that the clusters are linear separable. 

There are infinitely many decision boundaries can be drawn to separate clusters, and in this case the **SVM** chose the decision boundary that maximizes the margin between these clusters. 

**Intuitive Understanding**

We believe that, there are some perturbation region around all the samples, such that some perturbations around that sample is not going to affect the label of that sample. And in that case, the line with the best separations between the clusters will maximizes **robustness** of the decision of the labels. 
