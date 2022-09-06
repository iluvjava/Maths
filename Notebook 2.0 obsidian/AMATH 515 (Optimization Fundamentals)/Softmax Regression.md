[[Generalized Linear Model]]

The softmax regression is a on layer Neural Networks with a softmax activation function. 

---

### **Intro**

This is a model where the inputs are features, and the output is a categorical vector. Basically: $y\in\mathbb{Z}^{q}_+$

The prediction vector made my the model is a vector of probability, meaning that:

$$
\sum_{i = 1}^{d}\hat{y}_i = 1
$$

Where, the sum of probability equals to one.

The label vector that used for testing is a standard basis vector, where the correct label is marked with $1$ on it.

---
### **Setting Things up**

Let $X$ be a example features set with dimensionality $d$, number of inputs, and sample size $n$, number of samples. Hence: $X\in\mathbb{R}^{n\times d}$, and the weights of the model is matrix: $W\in \mathbb{R}^{d\times q}$, and a bias vector, which is written as: $b\in \mathbb{R}^{1\times q}$. Where $q$ is the number of labels the model is going to produce.

And, the set of labels with probability produced will be denoted as:

$$
\hat{Y} = \text{softmax}(XW + b)
\tag{1}
$$ 
[^1]

And the $Y$ matrix is $n \times d$.

We are also define the output function to be:
$$
O = WX + b
$$

### **Loss Function**

The Loss function introduced next is the negative of the log likelihood. [^2]

And the loss function is: 

$$
l(y, \hat{y}) = - \sum_{j = 1}^{q}
    y_j\log(\hat{y}_j)
=
\sum_{j = 1}^{n}
    -\log \mathbb{P}(y^{(i)}|x^{(i)})
$$

And this is the loss function for one particular label. 


---
### **Gradient**

The gradient of the loss function is worth considering because it's common. 

And the loss function is also convex, meaning that gradient descent is going to solve it. 

Starting with the loss function: 

$$
l(y, \hat{y}) 
= 
- \sum_{j = 1}^{q}y_i \log \left(
    \frac{\exp(o_j)}{\sum_{k = 1}^{q}
        \exp(o_k)
    }
\right)
$$

Using log we have: 

$$
\sum_{j = 1}^{q}y_i\log
    \left(
        \sum_{k = 1}^{q}\exp(o_k)
    \right)
-
\sum_{j = 1}^{q}y_io_j
$$

Notice that, we first take it wrt to the output of $o_j$. We are taking derivative wrt to a scalar, and it's the $j$ th element from the vector $\hat{y}$. Which is a scalar.

And taking the derivative will be like: 

$$
\partial_{o_j} 
\left[
        \sum_{j = 1}^{q}y_i\log
            \left(
                \sum_{k = 1}^{q}\exp(o_k)
            \right)
        -
        \sum_{j = 1}^{q}y_io_j
    \right]
$$

Which is giving us the expression that: 

$$
\text{softmax}(o)_j - y_i
\tag{7}
$$

And, what is the derivative on $o_j$ wrt to the weight matrix $W$? 

This is going to be hard because taking wrt to a matrix is going to give us a tensor product if we are not careful. But this will be easier to be dealt with using **automatic differential**. 

But when we do it with hands, we can deal with it by consider taking the derivative on $o_j$ wrt to any $W_{l, m}$, a particular weight in the matrix. 

This is all good, but from expression (7), we can then say that: 

$$
\nabla_o(l(y, \hat{y})) = 
\text{softmax}(o) - y
$$

Which is the difference from the output of the generative model and the actual label. 

Note: This is actually a common occurrence for generalized linear model. [^3]


[^1]: The vector $b$ is broadcasted into a matrix when summing up with $XW$. 
[^2]: Take it as true, can't find good resources on the internet for it.
[^3]: stated [here](https://d2l.ai/chapter_linear-networks/softmax-regression.html)