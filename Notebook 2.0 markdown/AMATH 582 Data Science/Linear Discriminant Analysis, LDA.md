Reference Materials Link: 
- [link](https://www.sjsu.edu/faculty/guangliang.chen/Math253S20/lec11lda.pdf)
- [Basic Machine Learning](Basic%20Machine%20Learning.md)

---
### **Intro**

Here, we will be interested in thinking about projecting label data onto a line in $\mathbb{R}^n$, and then formulate late the problem as a Eigenvalue Decomposition problem Computationally. 
 
**Application Scenario:**

> Given training data set $x_1, x_2, \cdots, x_n\in \mathbb{R}^d$ consisting of 2 classes of labels, $C_1$, and $C_2$, we are looking for a unit vector such that, the projection of the data onto the vector best "Discriminate" the labeled data. 

**Maximizing Discrimination:**

> We projected into the subspace, and then maximize the ration between the maximal distance between the mean dividing the variances on all classes. 

**When is this Useful**: 

> When the data can be separated linearly. Non-linearity breaks the algorithm it seems like. 

Let $v$ denotes the subspace we are projecting onto, which is $\in\mathbb{R}^d$. 

The average of all the data $\in C_1$ projected onto the subspace $v$ is denoted as: 

$$
\mu_1 = \frac{1}{|C_1|} \sum_{x_i\in C_1}^{}\left(
    v^Tx_i
    \right) 
\quad 
\mu_2 = \frac{1}{|C_2|} \sum_{x_i\in C_2}^{}\left(
    v^Tx_i
    \right) 
$$

Which gives us the average of the data of each of the labels. They are Scalar. 

The variance between these 2 classes onto the subspace can be expressed as: 

$$
s_1^2 = \sum_{x_i\in C_1}^{}\left(
        (v^Tx_i - \mu_1)^2
    \right)
\quad 
s_2^2 = \sum_{x_i\in C_2}^{}\left(
        (v^Tx_i - \mu_1)^2
    \right)
$$

Hence, it can be formulated as multi-variable scalar optimization problem as: 

$$
\max_{\left\Vert
     v
\right\Vert = 1} \left\lbrace
    \frac{(\mu_1 - \mu_2)^2}{s_1^2 + s_2^2}
\right\rbrace
$$

Which is one of the formulation that seems to have a lot of good properties. 

Is it convex? Nope! It's liked to Eigenvalue problem, and we know that, the Eigenvalue problem is not exactly convex. 

**Introducing: Between Class Scatter Matrix**

WLOG, let's take a look at the data from $C_1$, then the average onto the sub-space can be represented as the following:  

$$
\mu_1 = \frac{1}{|C_1|}\sum_{x_i\in C_1}^{}\left(
    v^Tx_i
    \right) = \frac{v^T}{|C_1|} \sum_{x_i\in C_1}^{}\left(
            x_i
        \right)
$$
And notice that, the whole thing on the RHS can be a vector, let's just say that vector is like: 

$$
m_1 = \frac{1}{|C_1|} \sum_{x_i \in C_1}^{}\left(
    x_i
    \right)
$$

Then, we can rewrite the diff of mean bet ween these 2 classes, which is basically: 

$$
(\mu_1 - \mu_2)^2 = (v^Tm_1 - v^Tm_2)^2 = (v^T(m_1 - m_2))^2 
$$
$$
(v^T(m_1 - m_2))^2  = v^T(m_1 - m_2)\cdot (m_1 - m_2)^Tv
$$
$$
S_\text{between} = (m_1 - m_2)(m_1 - m_2)^T\in \mathbb{R}^{d\times d}
$$

Notice that, the difference in between matrix is a rank-one matrix, and the difference of the average can be essentially denoted as: 

$$
v^TS_\text{between}v = (\mu_1 - \mu_2)^2
$$

WLOG, let's consider the variance of one of the class $C_1$, and we will get another **Within-Class Scatter Matrix**: 

$$
s_1^2 = \sum_{x_i \in C_1}^{}\left(
        (v^Tx_i - v^Tm_1)^2
    \right)
    =
    \sum_{x_i\in C_1}^{}\left(
            v^T(x_i - m_1)(x_i - m_1)^Tv
        \right)
$$

And then this will give us a sum of rank-1 matrix in the middle, making it look like: 

$$
v^T
\left\lbrack
    \sum_{x_i\in C_1}^{}\left(
            (x_i - m_1)(x_i - m_2)^T
        \right)
\right\rbrack v
 = v^TS_{\text{within}}v
$$

Then, the maximization problem will be rephrased into:

$$
\max_{\Vert v\Vert = 1} \left\lbrace
    \frac{v^TS_{\text{between}}v}{v^TS_{\text{within}}v}
\right\rbrace
$$

If we assume that the matrix is non-singular, then by setting the vector $v$ to be the eigenvalue of $S_{\text{within}}^{-1}S_{\text{between}}u$, then that vector $u$, is the solution to the maximization problem. 

Boom! LDA! Linear! For 2 Classes! 

**How Many Discriminant Direction we can find**?

It depends on how many non-zero Eigenvalues we have for the matrix: 

$$
S_{\text{within}}^{-1}S_{\text{between}}
$$

This is very important. The dominant eigen-space is going to help use out a lot. And each subsequence subspace will have worse and worse separation. 

Using the Eigenspace of the matrix, we can get the best Binary Separation Subspace. This is a **Dimensionality Reduction** Technique. 

---
### **Multi-Class Linear Discriminant Analysis**

Not much has changed, except for the way that the distance between the projected clusters are changed, and the size of the subspace. 

This time, the distance between the clusters are measured by the distance for each of the cluster relative to the global central of all the data point. 

When we have 3 classes, the subspace is now a plane instead of a line. And in general, we would need about $n - 1$ points for $n$ class classification. But this is a choice, we can still use a line to separate the data.

(...) Math is still loading. 