[[Back Propagation]] 
This one is a new approach to what we did before, but we are going to make things easier, nicer to understand than the previous iterations. 

We will keep talking about Neural network backprop algorithm. 

And we are sticking with matrix notations. 

We are going to use better notations. 

We are going to make taking the derivative easier to understand. 

We will assume that reader has basic understanding in: 
1. Structure of Neural network. 
2. Some understanding of Linear Algebra
3. Experts on taking gradient and derivative and matrix vector products. 
---
### **Intro**
 
Let $a_{i}^{(n)}$ denotes the output of Neural Network at layer $n$. 

Let $a_{0}^{(n)}$ denotes the bias nural node, so that it always has a value of 1 outputing from it. 

Let $f$ be the activation function for each layer of the Neural Network, let's assume that it's the same on all the hidden layer. For example, the ReLu activation function. 

Let the activation function of the input layer to be the identity matrix. 

let the output layer activation function denoted by: $f_o$. 

Let $x$ be the intput of the Neural Nework, which is a vector, and let $x^{(k)}_{i}$ be the ith intput on the kth layer of the Neural Network. 

Let $\hat{y}$ be the final output of th Neural Network. 

Let $L$ be the loss function at the final layer, so given the label and the prediction, it willbe denoted by: $L(\hat{y}, y)$. 

Let $\theta^{(n)}_{i, j}$ be the weight between $a^{n - 1}_{j}$ and the $i$ th intput into the $n$ th layer of the neural net. 

Let $\Theta^{(n)}$ be the weight matrix between the $n - 1$ and the $n$ th layer of the Neural Network. 

**That is the introduction, let's now take these variabels for a spin**: 

For example, the output of the first hidden layer will be like: 

$$
a^{(1)}(x) = f(\Theta^{(0)}x)
$$

And take note that, there will be a bias element in the input vector $x$, which has a fixed value of one, let that be the first element in $x$, indexed by $0$. 

And the output of the second hidden layer will be like: 

$$
a^{(2)}(x) = f(\Theta^{(1)}x^{(1)}) = f(\Theta^{(1)}a^{(1)}(x)) = f(\Theta^{(1)}f(\Theta^{(0)}x))
$$

Boom, fascinating isn't it. 

Let's take a look from the output layer and see how it feels like: 



