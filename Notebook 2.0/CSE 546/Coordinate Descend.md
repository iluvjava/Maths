This is a more specific type of Gradient Descend, it's one of the way of doing non-smooth optimization. 
[[Gradient Descend 1]]: Some general understanding in Gradient Descend under convex context (or non-convex is good)

[[Non smooth convex optimization]]
This will also be used, for example, the definite of sub gradient.

---
### **Intro**
Commonly we have the problem of solving Lasso, The L1 regularizer is non-smooth at some points. 

Make sure to know: 
1. Fancy Derivative 
2. Sub-Gradient 
3. Gradient Descends

---
### **Algorithm**

We are going optimize for $x_i$ for a particular coordinates, and then we will be cycling through all of the coordinate, hoping that eventually, we will get to the optimal. 

Then, for each subroutine, we will have a 1D solution optimization to it. 

**Spoiler Alert**

There is a closed form solution when it's lasso, or, regression. 


---
### **Linear Regression Coordinate Descend**

We are looking for: 

$$
\underset{w_1}{\text{argmin}}\left\lbrace
    \Vert Xw  - y\Vert_2^2
\right\rbrace
$$

Notice that, it's a scalar optimization on quadratic, which means that the closed form solution can be obtained by completing the square to get it. 

Extracting out everything that is relevant to variable $w_1$ we have: 

$$
w_1^+ = \underset{w_1}{\text{argmin}}\left\lbrace
    \left\Vert
         X[:, 1]w_1 - (y - X[:, 2:d]w_1)
    \right\Vert_2^2
\right\rbrace
$$




---
### **Lasso Coordinate Descend**

The form of the scalar optimization used for the coordinate descend is in the form of: 

$$
f(w_1) = (aw_1 - b)^2 + \lambda |w_1|
$$

To take the derivative we will need to make use of the sub-gradient to find the optimal point. 

The sub gradient of the function is like: 

$$
w_1^+ = \underset{w_1}{\text{argmin}}\left\lbrace
    \left\Vert
         X[:, 1]w_1 - (y - X[:, 2:d]w_1)
    \right\Vert_2^2 + \lambda|w_1|
\right\rbrace
$$

And boom, nice and easy, we have all the expression in $\vert Xw - y\vert + \lambda |w|$ that contains $w_1$, our objective parameter. 

Let's name the objective function above to be $f(w_1)$. 






