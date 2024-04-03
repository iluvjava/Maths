- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md) 

---
### **Intro**

There are some common parameters shared among different components/module inside of a ANNs. 
These components are of these types: 
1. Convolution Layer
2. Pooling Layer
3. Padding Layer

They all have a similar format for computing the input size and the output size of signals in the form of tensors. 
Therefore, we summarize that here instead of repeating it all the time for different kind of components. 

---
### **The Inputs and Outputs of General Signal**

These parameters a common to all components, but specifically for 1D, and the pytroch API, we discuss them below. 
The following discussion takes [Pytroch 1D Convolution](https://pytorch.org/docs/stable/generated/torch.nn.Conv1d.html#torch.nn.Conv1d) as the reference. 

#### **List | Common Parameters**
1. `in_channels`. Type integers. The number of channels expected for the input signal. 
2. `Out channels`. Type integers. The number of channel expected for the output signal. 
3. `kernel_size`. The size of the kernel used for the 1D signal, for certain type of operations. The kernel represent the size of the window where an computations are going to carry out locally on the input signal. 
4. `stride`. How many elements does the kernel skips with respect to the input signal for each of the adjacent output elements in the output signal. 
5. `padding`. The numbers of zero/null/-inf elements added to the 2 side of the 1D signal. 
   1. `padding_mode`: Determine different modes of padding the boundary of the input signal. 
      1. zero, (default)
      2. reflect, 
      3. replicate, 
      4. circular,
6. `dilation`: Spacing between the elements of the kernels. 
7. `blocks`: Number of blocked connections from intput channels to output channels, default to 1. 
8. `bias`: Add learnable bias to the component, default to `true`. 



#### **Fact | Shape of the Intput and Output for 1D Signal**
> Let Input signal be a tensor of size $(N, C, L)$. 
> Let $p, d, k, s$ denotes: "padding, dilation, kernel size, stride". 
> Then the output signal is a tensor of size $(N, C', L')$ with 
> $$
> \begin{aligned}
>     L' = \left\lfloor
>         \frac{(L + 2p)- (d(k-1)+1)}{s} + 1
>     \right\rfloor. 
> \end{aligned}
> $$
> The parameter $C'$, is user defined. 


**Observations**

The size of the input signal with paddin is $(L + 2p)$. 
The size of the dilated kernel is $d(k - 1)$. 
The $+1$ on the numerator of the fraction and the $+1$ at the outside of the fraction remains as a mystery to the writer. 

**Remarks**

The computations of the output of 2D convolution/pooling layer are just the same computations along different dimension of the input signal. 

#### **Fact | Shapes of the Intput and Output for 2D Signal**
> Let $X$ be a tensor of shape $(C, N, L_1, L_2)$, then the output signal is of size $(C', N, L_1', L_2')$, where $C'$ is defined. 
> Let $p_i,d_i,k_i,s_i, i\in\{1, 2\}$ be the "padding, dilation, kernel_size, stride" along the $L_1$ and $L_2$ dimension of the input signal. 
> Then the shape parameters $(L_1', L_2')$ can be computed by the formula: 
> $$
> \begin{aligned}
>     L'_i = \left\lfloor
>     \frac{(L_i + 2p_i)- (d_i(k_i-1)+1)}{s_i} + 1
>     \right\rfloor \quad \forall i \in \{1, 2\}. 
> \end{aligned}
> $$

**Remarks**

This is analogous to the $1D$ case and it's just applying the same formula to the corresponding dimension of the tensor to determine the shape of the output tensor. 


