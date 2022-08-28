Back Propagation, a way of figuring out the derivative of the weights matrix for a given feed forward neuro-network.

References: My imagination

A background in gradient descend is preferred, see: 
[[Gradient Descend 3]]

The objective is to find the derivative of the weight matrix given a set of deep Neuro-Network. 

---
### **1. Intro**

Let's be familiar with the set up of a Neuro Network with one hidden layer. 

$$
E(x, \theta) = \frac{1}{2}\Vert f_3(W_2f_2(W_1x + b_1) + b_2) - y\Vert^2
$$

And this is the error function of the neuro net. It's taking the error by looking at a single sample. 

3 layers, 2 fully connected layers exist between the input and the output, supported by the $W_1$ and the $W_2$ weight matrices. $\alpha_1, \alpha_2$ are the biases. 

$f_3, f_2$ are th activation function on the second and the third layer of the Neuron. 

$\theta$ is just denoting all the parameters one can find in the Neuro Net.


**Training**: 

We feed the Neuro Net a small example from the populations, and then we minimize the errors on that smaller patch of the samples. Notice, that convergence is not promised, but we can assume that there exists a function that can approximate the whole populations. 

---
### **2. Preliminaries**

Let's consider taking the derivative on a certain configuration of function that is similar to the Neuro-network architecture. 

The function is the in the form of: 

$$
f(Wg(x) + b)
$$

Let's make $W$ to be a $m\times n$ matrix. It's like the weight matrix in Neuro-Network. 

The function $f$ is a univariate function, it's broadcasted to the whole vector. 

The function $g$ is a univariate function too, it's broadcasted to the whole vector $x$, 

$$
f(Wg(x) + b) = 
\begin{bmatrix}
    f([Wg(x) + b]_1)
    \\
    f([Wg(x) + b]_2)
    \\
    \vdots
    \\
    f([Wg(x) + b]_m)
\end{bmatrix}
\quad 
g = \begin{bmatrix}
    g(x_1) \\ g(x_2) \\ \vdots \\ g(x_n)
\end{bmatrix}
$$

Then certainly, we can take derivative wrt to one of te variable in the input vector, say $x_i$ where $1 \le i \le k$. When we take derivative with that, we are taking it wrt to all the $m$ outputs from the function, hence, we have a gradient and it's $\in \mathbb{R}^m$. 

Consider: 

$$
\partial_{x_i}\begin{bmatrix}
    f([Wg(x) + b]_1)
    \\
    f([Wg(x) + b]_2)
    \\
    \vdots
    \\
    f([Wg(x) + b]_m)
\end{bmatrix}
= 
\begin{bmatrix}
    f'(\partial_{x_i} [Wg(x) + b]_1)
    \\
    f'(\partial_{x_i} [Wg(x) + b]_2)
    \\
    \vdots 
    \\
    f'(\partial_{x_i} [Wg(x) + b]_m)
\end{bmatrix}
$$

$$
=
\begin{bmatrix}
    f'([W\partial_{x_i}[g(x)]]_1)
    \\
    f'([W\partial_{x_i}[g(x)]]_2)
    \\
    \vdots 
    \\
    f'([W\partial_{x_i}[g(x)]]_m)
\end{bmatrix}
=
f'(W\partial_{x_i}g(x))
$$

However, notice that, because $g$ is broadcast to the vector $x$, only the $i$ th output of $g(x)$ is related to $x_i$, therefore $\partial_{x_i}g(x)$ has zeros on all entries that is not the $i$ th entry. 

$$
= f'(W_{[:, i]}g'(x_i))
$$

Inside is a scalar $g'(x_i)$ multiplied by the $i$ th column of the weight matrix $W$. 

This is helpful when taking neuro-network. Inside a Neuro-network, the output from the previous layer are put under a weight and bias transform and then put into a new layer of the same activation function. 

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
