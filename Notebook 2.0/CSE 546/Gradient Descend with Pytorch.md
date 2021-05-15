Before training Neuro net, make sure to have some basic understanding on the back prop algorithm involved with the training: 
[[Back Propagation]], [[Back Propagation 2]]

This file is going to be a practical guide on training the Neural network using pytorch in python. 

Here are some useful links that can help with learning Pytorch
[Pytorch in 60 mins](https://pytorch.org/tutorials/beginner/deep_learning_60min_blitz.html)

---
### **Intro**

There are a lot of machine learning libraries, but here we will be focusing on pytorch. 

Notice that, all of these machine learning libraries are not that different from each other, in a sense that, the all have the following APIs: 


* Auto Diff
* GPU supports 

And that is all people need for training Neural Net. 

It's just a buffed up mathematical computational libraries. 


---
### **Common Useful Functions**

Suppose: 

```python
import torch
import numpy as np
```

is executed, so we have the correct namespace. 

`torch.tensor`: Make a torch tensor 
`np.array`: make numpy tensor
`torch.from_numpy`: transfer array from numpy array, mutable. 
`tensor.view`: member function, reshape the shape of the tensor. 
`tensor.nn.Module`: A namespace contains some of the classes relevant to components of the Neural Network. See [here](https://pytorch.org/docs/stable/generated/torch.nn.Module.html#torch.nn.Module) for the official doc.
`tensor.nn`: A namespace full of stuff for neural network, it's huge. see [here](https://pytorch.org/docs/stable/nn.html) for the official doc. 


---
### **Auto Grad**

```python
def f(x):
    return (x-2)**2

def fp(x):
    return 2*(x-2)

x = torch.tensor([1.0], requires_grad=True)

y = f(x)
y.backward()

print('Analytical f\'(x):', fp(x))
print('PyTorch\'s f\'(x):', x.grad)

```

Here is an sequential example that take the derivative wrt to a variable for a scalar function. 

Notice, any function that directly operate on the `torch.tensor` type will be compatible with using the auto diff.

**Linear Regression Using Auto Grad**

```python

# define a linear model with no bias
def model(X, w):
    return X @ w

# the residual sum of squares loss function
def rss(y, y_hat):
    return torch.norm(y - y_hat)**2 / n

# Define hyperparameters
step_size = 0.1

# And starting w
w = torch.tensor([[1.], [0]], requires_grad=True)

print('iter,\tloss,\tw')
for i in range(20):
    y_hat = model(X, w)
    loss = rss(y, y_hat)
    
    loss.backward() # compute the gradient of the loss
    
    w.data = w.data - step_size * w.grad # do a gradient descent step
    
    print('{},\t{:.2f},\t{}'.format(i, loss.item(), w.view(2).detach().numpy()))
    
    # We need to zero the grad variable since the backward()
    # call accumulates the gradients in .grad instead of overwriting.
    # The detach_() is for efficiency. You do not need to worry too much about it.
    w.grad.detach()
    w.grad.zero_()

print('\ntrue w\t\t', true_w.view(2).numpy())
print('estimated w\t', w.view(2).detach().numpy())

```

Don't forget:
* Detach and then clear the gradient for the parameter after you used it

**The Linear Module**

```python
d_in = 3
d_out = 4
linear_module = nn.Linear(d_in, d_out)

example_tensor = torch.tensor([[1.,2,3], [4,5,6]])
# applys a linear transformation to the data
transformed = linear_module(example_tensor)
print('example_tensor', example_tensor.shape)
print('transformed', transformed.shape)
print()
print('We can see that the weights exist in the background\n')
print('W:', linear_module.weight)
print('b:', linear_module.bias)
```

`torch.nn.Linear` is just a linear module, and it's basically: 

$$
f(X) = XW + b \quad X\in \mathbb{R}^{n\times d}, W\in \mathbb{R}^{d \times h} , b\in \mathbb{R}^h
$$

Where, the $X$ is the Row Data Matrix, and the $W$ is the weight matrix, and the $b$ is a bias vector, it's height is the number of features for the data matrix. The $b$ vector is being broadcast.


**Summary of Auto Diff and Gradient Descend**



---
### **Training Neural Net Example**




---
### **Misc**


