Back Propagation, a way of figuring out the derivative of the weights matrix for a given feed forward neuro-network.

References: My imagination

A background in gradient descend is preferred, see: 
[[Gradient Descend 3]]


---
### **Intro**

Let's be familiar with the set up of a Neuro Network with one hidden layer. 

$$
E(x, \theta) = \frac{1}{2}\Vert f_3(W_2f_2(W_1x + b_1) + b_2)\Vert^2
$$

And this is the error function of the neuro net. 

3 layers, 2 full connection exists between these layers, supported by the $W_1$ and the $W_2$ weight matrices. $\alpha_1, \alpha_2$ are the biases. 

$f_3, f_2$ are th activation function on the second and the third layer of the Neuron. 

$\theta$ is just denoting all the parameters one can find in the Neuro Net.

**Training**: 

We feed the Neuro Net a small example from the populations, and then we minimize the errors on that smaller patch of the samples. Notice, that convergence is not promised, but we can assume that there exists a function that can approximate the whole populations. 


---
### **Setting Things up**

Here we consider a very general neuro-net work that is connected by dense layers of neurons. 

Samples: 

$$
X = \left\lbrace
    (x_i, y_i)
\right\rbrace_{i = 1}^N
$$

And $x$ is a vector and $y$ is also a vector. 

Here is the list of notations: 

1. $w_{i, j}^{(k)}$: The weight on the matrix $W_k$, which is the matrix that links between the $k$ and the $k+1$ layer. The incoming node to the layer $k$ is $i$, linked from the $j$th node from the $k - 1$ layer. 
2. $W_i$ the weight matrix between the $i$ th layers and the $i - 1$ th layer. 
3. $f$: The activation function for all the hidden layer of the Neuro-network. This is a univariate scalar function, it's broadcast to a vector element-wise.
4. $f_{out}$: the output layer of the NeuroNetwork. 
5. $x$: the input vector of the Neuro-network. 
6. $p^{(i)}$: The output of the ith layer's neurons, and **it haven't been put into the activation function** for the $i+1$ th layer yet. This is a vector. 
7. $L$: the loss function, a multi-variable scalar function. This is a multi-variable scalar function.
8. $l_k$: the number of neurons at the kth layer. 
9. $\circ$: the Hadamard Product operator. 

Therefore, let's agree on the basics first: 

The output for the $k$ th layer of Neurons are computed as: 

$$
p^{(k + 1)} = 
    W_{k}f\left(p^{(k)}\right) + b^{(k)}
$$

And there will be $N$ layers in total for the Neuro-networks. 

The last layer, output layer is: 

$$
f_{out}\left(p^{(N)}\right) = f_{out}\left(
    W_{N - 1}f\left(p^{(N - 1)}\right) + b^{(N - 1)}\right)
$$

And the input layer is: 

$$
p^{0} = x
$$

The output from the fist hidden layer (not including the activation function in the first hidden layer) of the Neuro network is: 

$$
p^{(1)} = W_1 f\left(p^{(0)}\right) + b^{(0)}
$$

---
### **Taking Derivative on Entries of Weight the Weight Matrix**

The loss function is a scalar function, wrt all the weights and biases in the network.

We are taking the derivative wrt to a particular on, say $w_{i, j}^{(k)}$, this is just an ordinary differential. 

Consider that, I just want to know the derivative for one sample. The loss function will be like: 

$$
\partial_{w_{i, j}^{(k)}}L\left(f_{out}|y\right)
$$

$$
=\nabla[L(f_{out}|y)]^T\partial_{w_{i, j}^{(k)}}
f_{out}\left(p^{(N)}\right)
$$

Here, we will need the gradient of the loss function, using chain rule, and only focus on the second expression we have: 

$$
\partial_{w_{i, j}^{(k)}}f_{out}\left(p^{(N)}\right) 
= f'_{out}\left(p^{(N)}\right)\circ
\partial_{w_{i, j}^{(k)}}\left[p^{(N)}\right]
$$

We are not using the Jacobian because $f_{out}$ is a univariate function that got broadcast to the vector $p_N$. 

This is also when things started to recur, consider: 

$$
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
$$

And, this is the last vector, and it has a lot of zeros in it, and it will be the base case that terminate the recursive derivative. 

**Observations**: 

Sanity check, the index $j$ determine which of the output value of te $k$ th layer's Neuron we are using, and the index $i$ tells use which of the entry at the layers are affecting our derivative. 

Is there a good way to write this compactly? 
* I think it's possible, but we might need to look $2$ layers before the $k$ th layer to get the closed form. And we will need to be smart to write it compactly as a update matrix: $\Delta W_k$. 



---
### **Taking Derivative on the Bias Vector**

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
### **Updating Weights and Biases**



---
### **Formulation of an Algorithm**

The basic idea is, compute forward to get the values for each layer, and then starting from the back (the last layer), update the weights. 