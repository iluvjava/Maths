[Back Propagation](Back%20Propagation.md) 
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

Let $a_{0}^{(n)}$ denotes the bias neural node, so that it always has a value of 1 outputting from it. This node is dangling at each layer of the network. 

Let $f$ be the activation function for each layer of the Neural Network, let's assume that it's the same on all the hidden layer. For example, the ReLu activation function. 

Let the activation function of the input layer to be the identity function. 

let the output layer activation function denoted by: $f_o$.

Let $x$ be the input of the Neural Network, which is a vector, and let $z^{(k)}_{i}$ be the ith input on the kth layer of the Neural Network. This is the output from the previous layer, also called the pre-activation of the current layer. 

Let $\hat{y}$ be the final output of th Neural Network. 

Let $\mathcal{L}$ be the loss function at the final layer, so given the label and the prediction, it will be denoted by: $L(\hat{y}, y)$. 

Let $\theta^{(n)}_{i, j}$ be the weight between $a^{n - 1}_{j}$ and the $i$ th input into the $n$ th layer of the neural net. 

Let $\Theta^{(n)}$ be the weight matrix between the $n - 1$ and the $n$ th layer of the Neural Network. 

**That is the introduction, let's now take these Variables for a spin**: 

For example, the output of the first hidden layer will be like: 

$$
a^{(1)}(x) =f(z_1) =f(\Theta^{(1)}x)
$$

And take note that, there will be a bias element in the input vector $x$, which has a fixed value of one, let that be the first element in $x$, indexed by $0$. 

And the output of the second hidden layer will be like: 

$$
a^{(2)}(x) = f(\Theta^{(2)}z^{(1)}) = f(\Theta^{(2)}a^{(1)}) = f(\Theta^{(2)}f(\Theta^{(1)}x))
$$

Boom, fascinating isn't it. 

Suppose that there are $L$ layers for the Neural net, where the intput leyer is indexed using $0$.  

Let's take a look from the output layer and see how it feels like: 

$$
a^{(L)} = f_{\text{out}}(a^{(L - 1)}) = f_{\text{out}}(W_{L}a^{(L - 2)})
$$

And, let's don't assume anything on the Loss function yet, but it's going to take the $\hat{y}$ and $y$, and it's $\mathcal{L}$. 

---
### **Setting Up the Network**

Let me draw this: 

$$
x \longrightarrow z^{(1)}, f(z^{(1)})  \longrightarrow z^{(2)}, f(z^{(2)}) \longrightarrow z^{(3)}, f(z^{(3)}) \cdots \longrightarrow z^{(L)}, f_{\text{out}}(z^{(L)})
$$

And here is another way I would draw this, where the arrow is viewed as a transformation operator and subset is denoting the agent that does that transformation: 

$$
x \underset{\Theta^{(1)}}{\longrightarrow} z^{(1)} \underset{f}{\longrightarrow} a^{(1)}\underset{\Theta^{(2)}}{\longrightarrow }z^{(2)}\underset{f}{\longrightarrow} a^{(2)}\cdots 
a^{(L - 1)}\underset{\Theta^{(L)}}{\longrightarrow} z^{(L)} \underset{f}{\longrightarrow} a^{(L)} \longrightarrow \hat{y}

$$

Where, the pre-activation intput and the output for each layer is just computed by: 

$$
z^{(k + 1)} = \Theta^{(k)}a^{(k)} \quad a^{(k)} = f(z^{(k)})
$$

Nice and easy, and, we not really caring about the size of the weight matrix $\Theta$. 


---
### **Back Prop Algorithm**





