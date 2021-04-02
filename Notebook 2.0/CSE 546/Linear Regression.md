Here we are going to learn about linear regression. 


---
### **Intro**

The model is linear function, and the label we are predicting is a continuous value. 

Linear function, the labels is a vector of $x_i$, and the parameter for the linear function, the coefficient is denoted by: $w$ vector, and the labels we want to predict is denoted by: $y$ vector. 

Then the function is gonna look like: 

$$
y = wx + \epsilon
$$

The vector that minimizes the lost is the least square solution to the system. 

Now, we make a more general assumption by assuming multiple features for observations, denoted by a row data matrix $X$, and the labels are just one label, a real number. 

The optimization problem we are trying to solve here is: 

$$
\widehat{w} = 
\underset{w}{\text{argmin}}\left\lbrace
    \left\Vert
         Xw - y
    \right\Vert_2^2
\right\rbrace
$$

In addition, we are assuming that the system is over determined, meaning that there are more samples than the number of features in the dataset. 

And, the generative model we are looking at is: 

$$
y = Xw + \epsilon
$$

With th residual vector $\epsilon$. 


### **The Optimal Solution to Least Square Regression**

$$
\widehat{w} = (X^TX)^{-1}X^Ty
$$

And, we are assuming a full-rank tall matrix. 

This is just applied math 101, we can use both the project idea, or the gradient of the function to solve for the expression for the optimal parameter. 

s
