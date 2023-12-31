### **Intro**

Backpropagation is an efficient algorithm that evaluates the derivative wrt to weights and biases on a simple dense layer artificial neural network. 

#### **Setting Up The Neural Networks**
Assume that our neural network has one hidden layer in the middle of an input layer and an output layer with the 2-norm loss function. 
Let $\Theta$ denote the parameters for the neural network. 
The parameters symbol $\Theta$ denotes the weight and biases between the input layer and the hidden layer: $W_1, b_1$, and the weights and biases between the hidden layer and the output layer: $W_2, b_2$. 
Let $f_3, f_2$ be the activation functions applied to the hidden layer and the last layer of the network.
The loss function, or, error function can written as: 

$$
E(x | \Theta) = \frac{1}{2}\Vert f_3(W_2f_2(W_1x + b_1) + b_2) - y\Vert^2. 
$$

In the above expression, $x$ is the input of the neural network. 
It's an instance of the observed sample when it's being trained. 
It's an input when it's doing inferences. 

---
### **Jacobian of the Neural Network Layer Composition**

During the training of a Neural network, the optimizer needs the derivative on all the weights and biases through the loss function. 
More specifically, we need to compute $\partial_{(W_1)_{i, j}}E(x | \Theta)$ where $x$ is one sample. 
We need to compute all the weights and biases meaning that we need a gradient wrt to all $W_{i, j}, b_i$, whatever the $i, j$ are and the range they take. 
Generically speaking, the composition at any layer takes in the output from the previous layer, feeds it over an affine function and then to the activation function. 
Denoting the output of the previous layer using $g(x)$, the activation function of the current layer being $f$, the output of the current layer is represented as $f(Wg(x|\Theta) + b)$. 
The $\Theta$ here denotes all the weight and biases that are not between the current layer and the previous layer. 

Let's make $W$ to be a $m\times n$ matrix. 
It's an abstraction of the weight matrix in Neuro-Network. 
Let the function $f$ be a univariate function broadcasted to a vector. 
Let the function $g$ be a univariate function, it's broadcasted to the vector $x$. In matrix form, we have the representation:

$$
f(Wg(x | \Theta) + b) = 
    \begin{bmatrix}
        f([Wg(x) + b]_1)
        \\
        f([Wg(x) + b]_2)
        \\
        \vdots
        \\
        f([Wg(x) + b]_m)
    \end{bmatrix},
    \quad 
    g(x) = \begin{bmatrix}
    g(x_1) \\ g(x_2) \\ \vdots \\ g(x_n)
\end{bmatrix}. 
$$

$f(Wg(x | \Theta) + b)$ is a multi-valued mapping. 
If we were to take derivative wrt to weight matrix $W$, then is a $\mathbb R^{m\times n}\mapsto \mathbb R^m$. 
We treat all weights and biases $\Theta$ before the previous layer as a vector. 
Recall from multi-variable calculus that compositing a multi-valued mapping would require the Jacobian matrix for using the chain rule. 

#### **Computing Derivative of Weights and Biases Current and the Previous Layer**

In general, the Jacobian is the tensor product of the gradient wrt to each output of the multi-valued function. 
To compute a gradient for a specific output, we consider the expression $\nabla_W [f(Wg(x | \theta) + b)]_k$ for $1\le k \le m$. 
The gradient is a $m\times n$ matrix. 
To get each of the elements, we consider the partial derivative 

$$
\begin{aligned}
    \partial_{W_{i, j}}[f(Wg(x|\Theta) + b)]_k &= 
    \partial_{W_{i, j}} f([W]_{k, :}g(x|\Theta) + b_k)
    \\
    &= 
    \mathbf 1\{k = i\}
    f'([W]_{k, :}g(x|\Theta) + b_k)[g(x | \Theta)]_j
\end{aligned}
$$

The function $\mathbf 1\{k = i\}$ is the indicator function in probability. 
It takes value zero when $k \neq i$ and $1$ when $k = 1$. 
The weight $W_{i, j}$ only affects the $i$ th neuron on the current output layer.
This is the base case.
The base case is the derivative of a weight between the current layer and the output of the previous layer. 

#### **Computing the Derivative wrt Weights and Biases That Comes Before the Previous Layer**

Inductively suppose we want to take the derivative wrt to a specific indexed element from the weights and biases collection $\Theta$. 
Suppose it is $\Theta_j$, which is a scalar value. 
Then the partial derivative wrt $\Theta_j$ on the $k$ th neuron on the current layer would yield the expression: 

$$
\begin{aligned}
    \partial_{\Theta_j} 
    [f(Wg(x | \Theta) + b)]_k
\end{aligned}
$$


---
### **3. Setting Things up**

Here we consider a very general neuro-net work that is connected by dense layers of neurons. 

Samples: 

$$
\mathbb{X} = \left\lbrace
    (x_i, y_i)
\right\rbrace_{i = 1}^N
$$

And $x$ is a vector and $y$ is also a vector. 

Here is the list of notations: 

1. $w_{i, j}^{(k)}$: The weight on the matrix $W_k$, which is the matrix that links between the $k$ and the $k+1$ layer. The incoming node to the layer $k$ is $i$, linked from the $j$th node from the $k - 1$ layer. 
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
