Here, we will try to understand the SVM for machine learning, the mathematical formulations behind it, etc. 

Reference: Elements of statistical learning (The Textbook)

---
### Intro
SVM: Support Vector Machine. It has the following important things when using it in practice: 

1. It's a binary classifier, hence for multi-class classification, it's a bunch of binary classifier stitched together. 
2. The use of Kernel has a big impact on the Cross Validations results.

**The idea** 
We are trying to look for a hyper plane such that it best separates labeled data in a binary classes. Especially we are looking for the plane such that, the closest point from 2 of the classes are at the opposite side of the plane and they are as far as possible. 


---
### **The SVM Classifier**

The SVM classifier is an intrinsically Binary Classifier, in the implementation of multi-class classification, it's in the form of multiple binary classifier stitched together. 

Consider Label data points in 2D, $(x_i, y_i)$ where $1 < i < N$, and the binary labels we have is $\{1, -1\}$. 

Let's define the hyper plane that we would like to use for separating the data: 

$$
\{x: f(x) = x^T\beta + \beta_0 = 0\}
$$

This is a line with offset in 2D. In multi-dimensional case, the $\beta$ is a unit vector. And the classification results will be given by the expression: 

$$
G(x) = \text{sign} [x^T\beta + \beta_0]
$$

Well, obviously, if $f(x_i)$ for one of the sample is $>0$, then we expect that $G(x_i)$ is going to be $1$. Let's take a look at the expression:  

$$
y_i(x_i^T\beta + \beta_0) = m
$$

The expression here, give use the margin. If this is negative then we have different signs from $f(x_i)$ and $y_i$ (M <> 0), and this is a mis-classification, and if we have $M > 0$, then the sign from $f(x_i)$ will be the same as $y_i$, and then we have the data correctly classified. 

Our Objective is to maximize the margin of the hyper plane to get the best separations for the labeled data. 

Which can be phrased as optimization problem: 

$$
\max_{\beta, \beta_0, \left\Vert
     \beta
\right\Vert = 1}\left\lbrace
    M
\right\rbrace \quad \text{s.t: } y_i(x_i^T\beta + \beta_0) \ge M \quad \forall 1 \le i\le N
$$

And then after some magic, we will get another equivalent formulation of the same problem: 

$$
\min_{\beta, \beta_0} \left\Vert
     \beta
\right\Vert \quad \text{s.t: }\quad y_i(x_i^T\beta + \beta_0) \ge 1, \;\forall 1 \le i \le N
$$

However, notice that, this constraint doesn't allow any type of overlap for the features, and hence we will define a slack variables for all the samples. $\zeta$, which will relax the constraint for a bit, giving us: 

$$
\min_{\beta, \beta_0} \left\Vert
     \beta
\right\Vert \quad \text{s.t: } \quad y_i(x_i^T\beta + \beta_0)\ge (M - \zeta_i) \;\forall 1 \le i \le N
$$

**How did we convert it from maximizing $M$ to minimizing $\Vert\beta\Vert$**? The value $M$, is the closest perpendicular distance among all the points away from the hyperplane. 

The hyper plane is give as: $\beta^Tx + \beta_0 = 0$, then the line that is perpendicular to the plane will be: $\beta$, so them, we are minimizing the margin among all the given data, then we are doing this: 

Consider the projection onto the unit perpendicular components $\hat{\beta}$, and then we scale it by a factor of $c$ so that it's on the hyper plane: 

$$
\beta^T (c\hat{\beta}) + \beta_0 = 0 \implies c = \frac{\beta_0}{\Vert \beta\Vert^2}
$$

So then, this is the perpendicular distance from the original to the hyper plane $\beta^Tx + \beta_0 = 0$. If, given any points (say $x_i$), then the distance from that point to the hyper plane will relate to the quantity $c$ in the following way: 

$$
\text{The distance will be: } c - \beta_0 x_i = M
$$

Let's fix the quantity $\beta_0$ so that the only way to change the position of the hyper plane will be via $\Vert \beta\Vert$, computing that distance above we will have: 

$$
\frac{-\beta_0}{\Vert \beta\Vert^2} - \hat{\beta} x_i = M
$$

Then it's not hard to see that: 

$$
\max_\beta{M} \implies \min \Vert \beta\Vert
$$

With a fixed value of $\beta_0$. 

Finally let's assert the conditions that, data with label $+1$ lies in the positive side of the line and data with label $-1$ lies in the negative side of the line, then we can phrase the optimization problem in the following way: 

$$
y_i(\beta^Tx_i + \beta_0) \ge 0 \quad \forall\; 1 \le i \le n
$$

This is now exactly the form we like we had above, but it's closer and it's a minimization problem at least. What we have here rn is called **Hard Margin SVM**. 

And the other type is called the **Hard Margin SVM**, which has this set of constraints: 

$$
\begin{cases}
     y_i(\beta^T x_i + \beta_0) \ge 1 - \xi_i & \forall \; 1 \le i \le n
     \\
     \xi_i \ge 0 & \forall \; 1 \le i \le n
\end{cases}
$$

---
### **Practical Concern**: 
Always scale the data to the range $[0, 1]^n$, so that all the data points's distance from each other will be relative. 

The amount of time takes the SVM to predict after training will take a lot of time, it increases drastically as the number of labels increases. 


---
### **Computational Formulations**

The problem is formulated as a quadratic programming problem. And then solvers are applied to solve the convex optimization problem. 

When solving the convex problem, **interior points method and KTT conditions** are often used. 

Yep. So we probably want to see this part for more information about that: 

[Duality, Lagrangian and Algorithms](../AMATH%20515%20Optimization%20Fundamentals/Duality/Duality,%20Lagrangian%20and%20Algorithms.md)

