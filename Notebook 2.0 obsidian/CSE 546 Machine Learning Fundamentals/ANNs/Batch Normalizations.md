- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)


---
### **Intro**

Batch normalization is a linear transformation applied between connections between two components in the ANNs. 
See [Wikipedia](https://en.wikipedia.org/wiki/Batch_normalization), we take this as a reference for now. 
On a high level, 

#### **Opinon | High Level Description**
> the Batch normalization layer reduce the activations signal inside of a neural network to zero mean and unit variance and put it under a learnable linear transformations, using statistics from the activation layers over batch, or all training samples, etc. 

**Remark**

The source of the variance and mean might change depending on whether it's inference, or it's training. 
For example, if the variance, mean of activations were taken over to be each batch during training, the same parameters will be different during inference phase because the number of test sample we feed it depends. 

**Notations and Quantities**

Here, we denote $B$ to be the set for all the samples in one Batch, it's used as a subscript to parameterize parameters that are specific to a batch. 


---
### **The Batch Normalizations**



#### **Def | The Batch Normalizations Component**
> Let $X$ be the input signal of size $(l_1, l_2, \cdots, l_n)$. 
> Batch normalization applies to each axis of the tensor. 
> We compute the empirical mean and variance along each axis using 
> $$
> \begin{aligned}
>     \mu^{(i)}_B & = l_i^{-1}\text{sum }(X, \text{axis} = \{j \in \{1, \cdots, n\}| j \neq i\}), 
>     \\
>     \left(\sigma_B^{(i)}\right)^2 &= \text{variance}(X, \text{axis} = \{j \in \{1, \cdots, n\}| j \neq i\}). 
> \end{aligned}
> $$
> These parameters are then used to compute the output of current layer (denoted by $y^{(i)}$) along for all numbers along $l_i$. Denote slicer $a(i) = [j_1, j_2,\cdots, :\; , \cdots, j_n]$, then 
> $$
> \begin{aligned}
>     \left(\hat X_{a(i)}\right)_k &= \left((X_{a(i)})_k - \mu_B^{(i)}\right)/(\sigma_B^{(i)} + \Upsilon(\sigma_B^{(i)})) \quad 
>     \forall k = 1, \cdots, l_i \; \forall i = 1, \cdots, n
>     \\
>     Y_{a(i)} &=  \alpha_i X_{a(i)} + \beta_i \quad \forall i = 1, \cdots, n. 
> \end{aligned}
> $$
> Here, $\alpha_i, \beta_i$ are trainable parameters. 
> The $\Upsilon(\sigma_B^{(i)})$ adjust the parameter to prevent divide by zero when the variance is zero over the Batch. 
