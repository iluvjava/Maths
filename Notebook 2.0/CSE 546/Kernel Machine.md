$$
\newcommand{\Kappa}{\text{K}} % This is the fix intended for obsidian notebook. 
$$


Here we will be highlighting some of the inner structure of kenel machines and the idea behind it. 

Here are some other things in the vault that uses the idea of kernel. 
[[Kernel PCA]], [[SVM]], [[SVM and Kernels]]

Here are some good resource for explanation of Kernel Trick using the classic Linear regression model: [here](https://www.cs.cornell.edu/courses/cs4780/2018fa/lectures/lecturenote14.html)


---

### **Intro**

Kernels provides a fast way of computing high dimensional features. 

Kernels provides a way to compute implicit features mapping, like the case with the radial Gaussian Basis for SVMs. 

A kernel is a function that can take the inner product given 2 instance of samples from the data: 

Let $K: \mathbb{R}^{d}\times \mathbb{R}^{d} \mapsto \mathbb{R}$, then the function $K$ will be a kernel function when: 

$$
K(x_1, x_2) = \langle \phi(x) \phi(x_2)\rangle
$$

Where the function $\phi(x)$ is a mapping from the lower dimensional feature space to a higher dimensional feature space.

This is the kernel Trick:

Pick a kernel $K$

For a linear predictor, show that it can be written as a linear combinations of all the samples in the training set, meaning that: 

$$
w = \sum_{i = 1}^{n}\alpha_i x_i
$$

Change the loss funciton/decision rule to only access data through the dot product between the data. 

$$
w^Tx_{\text{new}} = \sum_{i = 1}^{n}
    \alpha_ix_i^Tx_\text{new}
$$


---
### **Direct Expansion on Linear Features**

In the case of using a polynomial to introduce non-linearity, we face the problem of large number of computations to achieve that. 

Suppose that there are 2 features, and I want 3 degree polynomials, then there will be 4 of them in total. Basically this is a [[Stars And Bars]] problem, all 
$x_1^ax_2^b$ where $a + b = p$ and $a, b$ are integers are a valid high dimensional features. **And the number of features grow exponentially fast**. 

And this grows very quickly. 

Therefore it's not good to computing that, but if we only need to compute the inner product, then we can just do $(y_1 + y_2)^p(x_1 + x_2)^p$ where $x, y$ are 2 of the samples drawn. 

**And this is one of the motivation behind Kernel Machine**

**Well Defined Kernels**: 

Positive semite-definiteness of the inner product matrix makes the Kernel Matrix valide. 

---
### **The Kernel Trick on Linear Regression**

We are going to use the kernel to represent the soltuion for the optimal parameter of the linear regression. 

$$
\hat{w} = \arg \min_{w}
    \sum_{i = 1}^{n} (y_i - x_i^Tw)^2 + \lambda \Vert w\Vert_2^2
$$

This is the optimal parameter, let's assume that it's a linear combination of all the samples in the data set and that will mean: 
$$
\exists \alpha \in \mathbb{R}^n: \quad \hat{w} = \sum_{i = 1}^{n}
    \alpha_ix_i
$$

Now, instead of optimizing on the optimal parameter, $w$, we will be doing the optimization wrt to the linear comb coefficient: $\alpha$, then we have the following: 

$$
\arg\min_\alpha \left\lbrace
    \sum_{i = 1}^{n}
        \left(
            y_i - \sum_{j = 1}^{n}
                \alpha_j \langle x_j, x_i\rangle
        \right)^2
        + 
        \lambda + \sum_{i = 1}^{n}\sum_{j = 1}^{n}
            \alpha_i\alpha_j \langle x_i, x_j\rangle
\right\rbrace
$$

Now, notice that we can replace the sample inner product with the Kernel machine we defiend, say $K$, then this will get changed into: 

$$
\arg\min_\alpha \left\lbrace
    \sum_{i = 1}^{n}
        \left(
            y_i - \sum_{j = 1}^{n}
                \alpha_j K(x_j, x_i)
        \right)^2
        + 
        \lambda + \sum_{i = 1}^{n}\sum_{j = 1}^{n}
            \alpha_i\alpha_j K(x_i, x_j)
\right\rbrace 

$$

Then, we are going to make a bank of all the dot product using the kernel machine, let this be a new matrix: $\Kappa$, then we can apply the following simplification: 

$$
\underbrace{\sum_{i = 1}^{n}
        \left(
            y_i - \sum_{j = 1}^{n}
                \alpha_j K(x_j, x_i)
        \right)^2}_{\Vert Y - \Kappa \alpha\Vert_2^2}
        + 
        \lambda + \underbrace{\sum_{i = 1}^{n}\sum_{j = 1}^{n}
            \alpha_i\alpha_j K(x_i, x_j)}_{\lambda \alpha^T\Kappa \alpha}
$$

Then we can say that: 

$$
\arg\min_\alpha \Vert y - \Kappa \alpha\Vert_2^2 + \lambda \alpha^2\Kappa \alpha
$$

And notice that we are now optimizing on the kernen parameter vector $\alpha$ and the original model parameter $w$ is not in the picture anymore. 

**Why Regularization**

Gnerally speaking, in the case where $\phi(x)$ the dimension augmentation function, has a dimension that is $>n$, having a dimension that is larger than the number of sample, Then: 

$$
v^T Kv 
$$

will be a positive definite matrix! 

Now, let's consider the solution to the unregularized problem: 

$$
\arg\min_{\alpha} \Vert y - K\alpha\Vert_2^2
$$

Then it's not hard to see that in this case, the solution for $\alpha$ will simply be: 

$$
\alpha = K^{-1} y
$$

And that is a perfect fit, that is why, when we are regularizing it when there are not many features present for each sample. 

---
### **Some Canonical Kernels**

D-Degree polynomial kernel: 

$$
K(u, v) = (u^Tv)^d
$$

Polynomial degree up to d will be: 

$$
K(u, v) = (u^Tv + 1)^d
$$

Guassian Kernel (RBF Kernel): 

$$
K(u, v) = \exp \left(
\frac{-\Vert u - v\Vert^2}{2\sigma^2}
\right)
$$

Sigmoid Kernel: 

$$
K(u, v) = \tanh(\gamma u^Tv + r)
$$

