### **Intro**

Back propagation is an efficient algorithm that evaluates the derivative wrt to weights and biases on a simple dense layer artificial neural network. 

#### **Setting Up The Neural Networks**
Assume that our neural network has one hidden layer in the middle of an input layer and an output layer with the 2-norm loss function. 
Let $\Theta$ denote the parameters for the neural network. 
The parameters symbol $\Theta$ denotes the weight and biases between the input layer and the hidden layer: $W_1, b_1$, and the weights and biases between the hidden layer and the output layer: $W_2, b_2$. 
Let $f_3, f_2$ be the activation function applied to the hidden and output layer.
The loss function, or error function, can written as: 

$$
E(x | \Theta) = \frac{1}{2}\Vert f_3(W_2f_2(W_1x + b_1) + b_2) - y\Vert^2. 
$$

In the above expression, $x$ is the input of the neural network. 
When we train the neural network, $x$ is the sample from the training data set we feed to the neural network.
It's an input when it's making inferences. 

**Remarks**

The first layer doesn't have an activation function. 
The hidden layers usually have the same activation function. 
The last layer may not have an activation function or use a different one. 


---
### **Partial Derivative of the Neural Network Layer Composition**

During the Neural network training, the optimizer needs the derivative on all the weights and biases through the loss function. 
Specifically, we must compute the partial derivative of $E(x | \Theta)$ wrt all the weights and biases.
Therefore, we need a gradient wrt to all $W_{i, j}, b_i$, whatever the $i, j$ are and the range they take. 
We introduce the following notations. 
* Let $x^{(k)}$ denote the input for the kth layer of the neural network. 
Let $x^{(0)}, x$ denote the input of the neural network. 
* Let $p^{(k)}$ denote the output of the current layer. 
So we have $p^{(k)} = f(x^{(k)})$, where the activation function $f$ is applied element-wise to $x^{(k)}$. 
* Let $W^{(i - 1/2)}, b^{(i - 1/2)}$ denote the weights matrix and bias vector between the $i$ and $i - 1$ layer. 
So then we have $x^{(i)} = W^{(i - 1/2)}p^{(i - 1)} + b^{(i -1/2)}$ to be the input of the layer $i$. 

To simplify the notation, we ignore which layer of neurons we are looking at. That gets rid of the superscript. 
Generically speaking, output at any layer except for the first layer takes in the output from the previous layer, feeds it over an affine function, and then feeds it to the activation function. 
Denoting the output of the previous layer using $p(x | \Theta)$, the activation function of the current layer being $f$, the output of the current layer is represented as $f\diamond(W p(x|\Theta) + b)$. 
We use $\odot$ to mean applying $f$ element-wise to a vector. 
The $\Theta$ here denotes all the weight and biases that are not between the current layer and the previous layer. 

$f\diamond(W p(x | \Theta) + b)$ is a multi-valued mapping. 
If we take derivative wrt to weight matrix $W$, then we treat it like a $\mathbb R^{m\times n}\mapsto \mathbb R^m$. 
We treat all weights and biases $\Theta$ before the previous layer as a vector. 
Recall from multi-variable calculus that compositing a multi-valued mapping would require the Jacobian matrix for using the chain rule. 

#### **Computing Derivative of Weights and Biases Between the Current and the Previous Layer**

Now we will take the partial derivative wrt to a specific $i, j$ element of the matrix $W$ on the vector $f\diamond(W p(x | \Theta) + b)$. 
To do that please realize that $\partial_{W_{i, j}}(Wp + b) = p_j\e_i$.
Additionally we need to realize that the partial derivative for a function that applies element-wise to a vector $g(x)$, we have $\partial_{x_i}[f\diamond x] = (f'\diamond g(x)) \odot \partial_{x_i} g(x)$. 
Therefore, we may consider the partial derivative 

$$
\begin{aligned}
    \partial_{W_{i, j}}[f\diamond(Wp + b)] &= 
    (f'\diamond (Wp + b)) \odot\partial_{W_{i, j}} [Wp + b]
    \\
    &= 
    (f'\diamond (Wp + b))\odot
    (p_j\e_i)
\end{aligned}
$$

Observe that $f'\diamond (Wp + b)\odot \e_i$  is applying $f'$ to the value of the $i$ th neuron at the current layer. 
And $p_j$ is the output of the jth neuron of the previous layer. 
Computing the bias is analogous. 
We remind of the reader that $\partial_{b_j}(Wp + b) = \e_j$ and hence 

$$
\begin{aligned}
    \partial_{b_j} [f\diamond (Wp + b)] 
    = 
    (f'\diamond(Wp + b))\odot \e_i
\end{aligned}
$$

#### **Computing the Derivative wrt Weights and Biases That Comes Before the Previous Layer**

Inductively, we want to take the derivative wrt to a specific indexed element from the weights and biases collection $\Theta$. 
Suppose it is $\Theta_j$, which is a scalar value. 
Then the partial derivative wrt $\Theta_j$ on the $k$ th neuron on the current layer would yield the expression: 

$$
\begin{aligned}
    \partial_{\Theta_j} \left[f\diamond(W p(x | \Theta) + b)\right]
    &= (f'\diamond (Wp + b))\odot(\partial_{\Theta_j}p(x | \Theta))
\end{aligned}
$$

#### **Writing Things Out Differently**

Let's say we are currently looking at the $k$ th neural network layer. 
We list the output of the previous layer $p^{(k-1)}$, the input of the current layer, $x^{(k)}$, and the output of the current layer, $p^{(k)}$ using the weights and biases in between the layers. 

$$
\begin{aligned}
    x^{(k)} &= W^{(k - 1/2)} p^{(k - 1)} + b^{(k - 1/2)}
    \\
    p^{(k)} &= f \diamond x^{(k)}. 
\end{aligned}
$$

Denote $\Theta_j$ as a weight or bias that feeds into the $k - 1$ layer. 
It can be in any neural network part before the layer $p^{(k- 1)}$. 
We may now summarize the results from the previous discussion using the new variables. 

$$
\begin{aligned}
    \partial_{W_{i, j}^{(k - 1/2)}} p^{(k)}
    &= 
    \left(
        f'\diamond x^{(k)}
    \right) \odot 
    p_j^{(k-1)}\e_i
    \\
    &= 
    p^{(k - 1)}_jf'\left(x^{(k)}_j\right)\e_i
    \\
    \partial_{\Theta_j}p^{(k)}
    &= 
    f'\diamond x^{(k)} \odot \partial_{\Theta_j} p^{(k - 1)}. 
\end{aligned}
$$
The first case is the base case, and the second is the recursive one.


---
### **Applying the Formulas to our Shallow Neural Network**

We are now ready to apply the formula to our shallow neural network. 
Our neural network has variables of the following relations

$$
\begin{aligned}
    p^{(0)} &= x^{(0)}
    \\
    x^{(1)} &= W^{(1/2)} p^{(0)} + b^{(1/2)}
    \\
    p^{(1)} &= f\diamond x^{(1)}
    \\
    x^{(2)} &= W^{(3/2)} p^{(1)} + b^{(3/2)}
    \\
    p^{(2)} &= x^{(2)}. 
\end{aligned}
$$

Let $x^{(0)} \in \mathbb R^{l_0}, x^{(1)}\in \mathbb R^{l_1}, x^{(2)}\in \mathbb R^{l_2}$. 
Hence $W^{(1/2)}$ is $l_1\times l_0$ and $W^{(3/2)}$ is $l_1 \times l_2$. 
And the loss function is just the 2-norm. 
Let's take the partial derivative wrt to weight matrix $W^{(3/2)}$. 
Therefore we consider $E(x; y \;|\; W^{(3/2)})$ with $y$ being the labels to predict for each sample.


---
### **The Generic Setup of a Dense Forward Neural Network**

We consider a general neuro-net work connected by dense neuron layers. 

Samples: 

$$
\mathbb{X} = \left\lbrace
    (x_i, y_i)
\right\rbrace_{i = 1}^N
$$

And $x$ is a vector and $y$ is also a vector. 

Here is the list of notations: 

1. $w_{i, j}^{(k)}$: The weight on the matrix $W^{(k)}$, which is the matrix that links between the $k$ and the $k+1$ layer. The incoming node to the layer $k$ is $i$, linked from the $j$th node from the $k - 1$ layer. 
2. $W_i$ the weight matrix between the $i$ th layers and the $i - 1$ th layer. 
3. $f$: The activation function for all the hidden layer of the Neuro-network. This is a univariate scalar function, it's broadcast to a vector element-wise.
4. $f_{out}$: the output layer of the NeuroNetwork. 
5. $x^{(0)}$: the input vector of the Neuro-network. 
6. $x^{(k)}$: The output vector from the kth layer, coming out from the activation function of the layer of Neurons.  
7. $p^{(i)}$: The output of the ith layer's neurons, and **it haven't been put into the activation function** for the $i+1$ th layer yet. This is a vector. 
8. $L$: the loss function, a multi-variable scalar function. This is a multi-variable scalar function.
9. $l_k$: the number of neurons at the kth layer. 
10. $\circ$: the Hadamard Product operator. 

Therefore, let's agree on the basics first: 

The vector that got input into the $k+1$ th layer's activation functions is the following: 

$$
p^{(k + 1)} = 
    W_{k}f\left(p^{(k)}\right) + b^{(k)}
$$

And there will be $N$ layers in total for the Neuro-networks. 

The last layer, output layer is: 

$$
x^{(N)} = f_{out}\left(p^{(N)}\right) = f_{out}\left(
    W_{N - 1}f\left(p^{(N - 1)}\right) + b^{(N - 1)}\right)
$$

And the input layer is: 

$$
p^{(0)} = x^{(0)}
$$

There are no activation function for the neurons in the input layers. 

The output from the fist hidden layer (not including the activation function in the first hidden layer) of the Neuro network is: 

$$
p^{(1)} = W_1 f\left(p^{(0)}\right) + b^{(0)}
$$

And then the output after the activation function applied to the first hidden layer is: 

$$
x^{(1)} = f\left(W_1 f\left(p^{(0)}\right) + b^{(0)}\right) = f\left(p^{(1)}\right)
$$

So, let's visualize this: 

$$
p^{(0)} \underset{W_1, b^{(1)}}{\longrightarrow} 
p^{(1)} 
\underset{f}{\longrightarrow} x^{(1)}
\underset{W_2, b^{(2)}}{\longrightarrow}
p^{(2)}
\underset{f}{\longrightarrow}
x^{(2)}
\cdots
\underset{w_{N - 1}, b_{N - 1}}{\longrightarrow}
p^{(N)} 
\underset{f_{out}}{\longrightarrow}
x^{(N)}
$$

---
### **4. Taking Derivative on Entries of Weight the Weight Matrix**

The loss function is a scalar function, wrt all the weights and biases in the network.

We are taking the derivative wrt to a particular weight, say $w_{i, j}^{(k)}$, this is just an ordinary differential because the loss function is just a scalar output as well. 

In addition, I just want to know the derivative for one sample, say $y$. The loss function will be like: 

$$
\partial_{w_{i, j}^{(k)}}L\left(x^{(N)}|y\right)
$$

$$
=\nabla[L(x^{(N)}|y)]^T\partial_{w_{i, j}^{(k)}}
f_{out}\left(p^{(N)}\right)
$$

Here, we will need the gradient of the loss function, using chain rule, and only focus on the second expression we have: 

$$
\partial_{w_{i, j}^{(k)}}f_{out}\left(p^{(N)}\right) 
= f'_{out}\left(p^{(N)}\right)\circ
\partial_{w_{i, j}^{(k)}}\left[p^{(N)}\right]
$$

We are not using the Jacobian because $f_{out}$ is a univariate function that got broadcast to the vector $p^{(N)}$. Hence we simply use the Hadamard Product, and that will give us the gradient wrt to $w_{i, j}^{(k)}$. 

This is also when things started to recur, consider: 

$$
\partial_{w_{i, j}^{(k)}}\left[p^{(N)}\right]
=
\partial_{w_{i,j}^{(k)}}\left[
        W_{N - 1}f(p^{\left(N - 1\right)}) + b^{(N - 1)}
    \right]
$$

$W_{N - 1}$ is a constant matrix, hence, the different will pass through it, giving us: 

$$
W_{N - 1}\partial_{w_{i, j}^{(k)}}f\left(p^{(N - 1)}\right)
= 
W_{N - 1}f'(p^{(N - 1)})\circ 
\underbrace{
    \partial_{w_{i, j}^{(k)}}\left[p^{(N - 1)}\right]
}_{\text{recursion}}
$$

Now, we can unroll the recursion and see how it looks like: 

$$
\nabla[L(f_{out}|y)]^T\partial_{w_{i, j}^{(k)}}
f_{out}\left(p^{(N)}\right)
$$

$$
=
\nabla[L(f_{out}|y)]^T
f'_{out}\left(p^{(N)}\right)
\circ 
W_{N - 1}f'\left(p^{(N - 1)}\right)
\circ 
W_{N - 2}f'\left(p^{(N - 2)}\right)
\circ
W_{N - 3}f'\left(p^{(N - 3)}\right)\cdots
$$

**The Base Case**

The base case happens bet ween the $k$ and the $k + 1$ layer of the neuro-network. Which is: 

$$
\partial_{w_{i, j}^{(k)}}\left[
        p^{(k + 1)}
    \right]
    = 
    \partial_{w_{i, j}^{(k)}}\left[
        W_{k}f\left(p^{(k)}\right) + b^{(k)}
    \right]
$$

This is the base case because $w_{i, j}^{(k)}$ is one of the entries of the matrix $W_{k}$. The derivative will be a vector such that, all the entries that are not the $i$ th row will be zero. Giving us: 

$$
\left(
    \partial_{w_{i, j}^{(k)}}\left[
        W_{k}f\left(p^{(k)}\right) + b^{(k)}
    \right]
\right)_l
:=
\begin{cases}
    f\left(p^{(k)}_j\right) & l = i
    \\
    0 & \text{else}
\end{cases}
\tag{4.1}
$$

And, this is the last vector, and it has a lot of zeros in it, and it will be the base case that terminate the recursive derivative. 

**The Case Before the Base Case**

The case before that is just one layer before the base case, which is: 

$$
\partial_{w_{i, j}^{(k)}}
\left[
        p^{(k + 2)}
    \right]
    =
    \partial_{w_{i, j}^{(k)}}
\left[
        W_{k + 1} x_{k + 1} + b^{(k + 1)}
    \right]
$$

Differential operator goes behind the linear operation matrix: 

$$
=
W_{k + 1}\partial_{w_{i, j}^{(k)}} x_{k+ 1}
$$

$$
=W_{k + 1}\partial_{w_{i, j}^{(k)}}f\left(
    p^{(k + 1)}
\right)
$$
$$
=W_{k+1}f'\left(
    p^{(k + 1)}
\right)
\circ
\partial_{w_{i, j}^{(k)}}\left[p^{(k+1)}\right]
\tag{4.2}
$$

And notice that by expression (4.1) we will be able to unroll the above recursion. The vector represented in (4.1) is very sparse, so that will make things easier. 

When the vector in (4.1) multiplied with the matrix $w_{k + 1}$ for expression (4.2), it will extract out one of the column of the matrix. Therefore, expanding (4.2) we have the expression: 

$$
(W_{k+ 1})_{[:, i]}f' \left(
    p^{(k + 1)}_i
\right) f \left(
    p_j^{(k)}
\right)
$$

The recursion now has been fully unrolled. 

**Observations**: 

Sanity check, the index $j$ determine which of the output value of te $k$ th layer's Neuron we are using, and the index $i$ tells use which of the entry at the layers are affecting our derivative. 

Is there a good way to write this compactly? 
* I think it's possible, but we might need to look $2$ layers before the $k$ th layer to get the closed form. And we will need to be smart to write it compactly as a update matrix: $\Delta W_k$. 

---
### **5. Taking Derivative on the Bias Vector**

It's the same as the taking derivative on the Biases, but we will go through this again. 

Consider performing the derivative on the $m$ th layer of the neuro net (More general), where $m > k + 1$, then: 

Consider taking the derivative on $p^{(m + 1)}$ wrt to $b^{k}_i$

$$
\partial_{b^{(k)}_i} \left[
        p^{(m + 1)}
    \right]
    =
\partial_{b^{(k)}_i} \left[
        W_{m}f\left(
               p^{(m)} 
            \right)
            + 
            b_{i}^{(m)}
    \right]
    =
    W_{m}\partial_{b_i^{(k)}} f \left(
            p^{(m)}
        \right)
    =
    W_{m}f'\left(p^{(m)}\right)\circ
    \underbrace{
        \partial_{b_{i}^{(k)}}
    \left[
        p^{(m)}
    \right]}_{\text{Recur}}
$$

This is the recursive case, let's consider the base case, that is between the $k + 1$ and the $k$ th layer of the neuro-network. The base case is: 

$$
\partial_{b_i^{(k)}} \left[
        p^{(k + 1)}
    \right]
    =
    \partial_{b_i^{(k)}}
    \left[
        W_{k}f\left(p^{(k)}\right)
        + 
        b^{(k)}    
    \right]
$$

And, $b_{i}^{k}$ will only affect the ith row on the output vector $p^{(k + 1)}$, therefore we have a vector that is $0$ on all the entries that is not $i$th entry, and then the $ith$ entry will be $1$.

$$
\left(
    \partial_{b_i^{(k)}} \left[
        p^{(k + 1)}
    \right]
\right)_j := 
\begin{cases}
    1 & j = i
    \\
    0 & \text{else}
\end{cases}
$$

Compare to taking the derivative on the weight matrices, taking derivative on the biases doesn't have anything changed for the recursive argument, the only thing that changed is the base case. 


---
### **5. Recursion Fully Unrolled**

**Unrolling the Weights Derivative**

Consider the Derivative of a particular weight in the Network: $w_{i, j}^{(k)}$, the $i$ th row $j$ th column of the weight matrix in the k th layer after the input layer.  

$$
=
\nabla[L(f_{out}|y)]^T
f'_{out}\left(p^{(N)}\right)
\circ 
W_{N - 1}f'\left(p^{(N - 1)}\right)
\circ 
W_{N - 2}f'\left(p^{(N - 2)}\right)
\circ
W_{N - 3}f'\left(p^{(N - 3)}\right)\cdots
$$

$$
\cdots 
\circ
(W_{k+ 1})_{[:, i]}f' 
\left(
    p^{(k + 1)}_i
\right) f \left(
    p_j^{(k)}
\right)
$$

**Unrolling Bias Derivative**

$$
=
\nabla[L(f_{out}|y)]^T
f'_{out}\left(p^{(N)}\right)
\circ 
W_{N - 1}f'\left(p^{(N - 1)}\right)
\circ 
W_{N - 2}f'\left(p^{(N - 2)}\right)
\circ
W_{N - 3}f'\left(p^{(N - 3)}\right)\cdots
$$

$$
\cdots 
\circ
(W_{k+ 1})_{[:, i]}f' 
\left(
    p^{(k + 1)}_i
\right)
$$


**Observe**: The derivative on the bias vector is not relevant to the variable $j$. 

---
### **Formulation of an Algorithm**

The basic idea is, compute forward to get the values for each layer, and then starting from the back (the last layer), update the weights. 

---
### **A Simple Example**

We are considering 2 hidden layers Neuro-Network. It's the minimal example needed to demonstrate all the cases for the recursion. 
