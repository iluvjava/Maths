How, what, model and regularization. 
prereq: [Regression and Model Selection](Regression%20and%20Model%20Selection.md)

---

### Intro

A Neuro Net consists of nested layers of Matrix and Vector multiplications plugin into a non linear activation function where the offset vector is referred to as the Bias, and the matrix the takes in from he last layer is referred to as the weight matrix. 

The objective is to minimize the error across all the training set of data by looking for the optimal parameters, which are the weights and biases. 

#### Optimization Process
This is the process we are focusing on, it's done on the network: 

$$
\underset{A_j}{\text{argmin}}
(f_M(A_M, \cdots , f_2(A_2, f_1(A_1, x))\cdots) + \lambda_g(A_j))
$$

Where $A_j$ denotes the weight matrix at the j th layer of the network, and the regularization term is at the end. 

The optimization process will be looking for the optimal weights for the $A_j$ matrix. 

Repeats the process using back propagation to obtain all the optimal parameters for $1 \leq  j \leq$ so that we have all the optimal weights across the network. 