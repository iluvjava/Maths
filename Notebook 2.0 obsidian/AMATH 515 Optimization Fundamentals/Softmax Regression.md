[[Generalized Linear Model]]

---

### **Intro**

This is a model where the inputs are continuous features, and the output is a categorical vector. 
A categorical random variable in our case will be encoded by a standard basis vector $\e_i$. 
The prediction vector made my the model is a discrete probability distributions, i.e: $\sum_{i = 1}^{d}\hat{y}_i = 1$. 
The label vector in the training set for each sample a standard basis vector, where the correct label is marked with $1$ on it.

---
### **Setting Things up**

Let $X\in \mathbb R^{n\times d}$ encodes all observed sample features in $\mathbb R^d$, over a sample of size  $n$. 
1. $X\in\mathbb{R}^{n\times d}$. 
2. $W\in \mathbb{R}^{d\times q}$ encodes the weights of the model. Each column codes a regression model for specific label. 
3. $b\in \mathbb{R}^{1\times q}$, encodes the bias of the model. Each element encodes a bias of the regression model for a specific feature. 
4. $q$ is the total number of categories for the labels. 


#### **Softmax (Log Sum Exp)**
The model predictions is: 

$$
\begin{aligned}
    O &= XW + \mathbf 1 b^T, 
    \\
    \text{SftMtx}(z): \mathbb R^n \mapsto \mathbb R^n &:= 
    \text{Cat}\left(
        \frac{z_i}{\sum_{i = 1}^{n}\exp(z_i)}
    \right),
    \\
    \hat{Y} &= \text{SftMx}(O). 
\end{aligned}
\tag{1}
$$ 

The bias vector, is shared across each column because each column 
$\hat Y$ matrix is $n \times d$. 
$\text{Cat}$ is just vector concatenating. 

### **Cross Entropy Loss Function**

The loss function mapss from $X\in \mathbb R^{n\times d}$, for all $n\in \mathbb N$ to $\mathbb R$. 
It is a function of input training samples, the output of the model $\hat y$, and the actual correct labels in the training set $y$. 
In the case of cross entropy, it can be derived and we present: 
$$
l(y, \hat{y}) = - \sum_{j = 1}^{q}
    y_j\log(\hat{y}_j)
=
\sum_{j = 1}^{n}
    -\log \mathbb{P}(y^{(i)}|x^{(i)}).
$$



---
### **Gradient**

The loss function is convex. 
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
[^3]: stated [here](https://d2l.ai/chapter_linear-networks/softmax-regression.html)