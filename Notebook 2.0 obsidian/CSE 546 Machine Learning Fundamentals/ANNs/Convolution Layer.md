- [Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)
- [1D, 2D Components](1D,%202D%20Components.md)

---
### **Intro**

Convolutional layer is made to approximate convolution operation in mathematics. 
Vectors in neural networks can be treated a discrete representation of a one dimensional functions on a bounded domain. 
If reader knows, recall [Introduction to Wavelets](../../AMATH%20582%20Data%20Science/Introduction%20to%20Wavelets.md) but the kernel function is now a learnable parameters for the artificial neural network. 
This component in modern artificial neural network has a history. 

#### **Def | Integral Convolution between 2 Functions**
> Let $f, g$ be $\mathbb R \mapsto \mathbb R$, we define the convolution between them to be 
> $$
> \begin{aligned}
>    [f * g](t) = \int_{-\infty}^{\infty} f(\tau)g (t - \tau)d \tau. 
> \end{aligned}
> $$
> The definition is symmetric wrt to permutation of $f, g$. 

#### **Def | Discrete Convolution, Infinite Boundary**
> Let $f, g$ be defined on $\mathbb Z$, maps to $\mathbb C$. 
> The convolution between the function is discrete convolution defined as: 
> $$
> [f * g](t) = \sum_{k = -\infty}^{\infty} f(k) g(t - k). 
> $$


---
### **1D Convolution Layer**

It's a disappointment that there is no good resources that precisely define what a convolution is like inside of the ANNs. 
see [pytorch here](https://pytorch.org/docs/stable/generated/torch.nn.Conv1d.html#torch.nn.Conv1d). 

#### **Def | 1D Convolution Operator**
> Let $u, v$ discrete vector indexed with $1,\cdots, m$, and $1, \cdots, n$. 
> We assume that $m \le n$, then we define the convolution operator $*$ between $u, v$ to be a mapping of $\mathbb C^m\times \mathbb C^n \mapsto \mathbb C^{m - n}$ that can be defined as: 
> $$
> \begin{aligned}
>     (u*v)_t = \sum_{i = 1}^{m}u_iv_{i + t}, \quad \forall\;  t = 1, \cdots, n - m. 
> \end{aligned}
> $$

**Observations**

We can pad the vector $u, v$ so that it has infinite domain. 
Padding on a vector means $[0 \; 0 \; \cdots v  \cdots \; 0]$, so that the head and tail of the vector are filled with zero. 
Then a convolution between the two vectors will yield the same definition as previously. 
$t$ is an offsets the shorter vector to begins at $t$.

**Remarks**

There are many other ways define the convolution. 
The input reduces in sizes for this type of convolutions. 


#### **Def | 2D Convolution**
> Let $u, v$ be multi-array of dimension $m \times n$ and $k \times l$. 
> We assume that $m \le  k$ and $n \le l$.
> Then the convolution operator $*$ is a mapping from $(\mathbb C^M \times \mathbb C^n)\times (\mathbb C^k \times \mathbb C^l) \mapsto \mathbb C^{(m - k)\times (n - l)}$. 
> Then the convolution is defined as 
> $$
> \begin{aligned}
>     (u* v)_{t, \tau} = 
>     \sum_{i = 1}^{k}\sum_{j = 1}^{l}u_{i, j}v_{i + t, j + \tau}
> \end{aligned}
> $$

**Observations**

The convolution take the inner product locally between the matrix $u$, the smaller matrix and the bigger matrix $v$. 


---
### **The Convolution Component**

The convolution component of an ANN makes use of the convolution opreations in mathematics.
Instead we only deals with real numbers instead of complex numbers. (In most cases I am sure some research find good use of complex numbers in machine learning. )
We define a list of quantities that are useful for the component. 
1. `stride`, striding means ignoring some of the element of the convoluted vectors. In the case of `stride=2`, the dimension is odd or even will matter. 
2. `padding`, padding adds zero elements to the input vector/matrix. 
3. `dialation`, dilation dilate the filter, making it bigger and fills it with more zeros. The trainable weights will distributed with integers spacing between them. 
4. `group`, see [here](https://towardsdatascience.com/conv2d-to-finally-understand-what-happens-in-the-forward-pass-1bbaafb0b148) for an explanations. I am not sure what this parameter is doing really.  

See [here](https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md) for a visual explanations of what these parameter means for the convolution 2d layer for the ANNs. 
These parameters only affects the convolution operations between the vector/matrices, with. 
We introduce the computational mode of the convolutional layer next. 

#### **Def | 2D Convolution**
> Assuming that we have a single sample. 
> This simplies the size of the input channels.  
> Let $(C, H, W)$ be the shape of the input tensor. 
> $C$ is the number of channel, and $H, W$ are the height and width. 
> We use this because image tensors are usually in the shape of $(3, H, W)$. 
> Define the component to be a function, mapping from $(C', H', W')$. 
> Let $(J, C, K, L)$ denotes the dimension of the kernel tensor denoted by: $\mathcal K$. 
> Then mathematically, the computation of the output tensor $Y$ given input tensor $X$ can be computed as
> $$
> {\large
> \begin{aligned}
>     Y_{c', h', w'} = 
>     \text{ReLU}\left( b_{c'} + 
>     \sum_{k = 1}^{C} (\mathcal K_{c',k,:, :} * X)_{h', w'}\right). 
> \end{aligned}
> }
> $$

**Observation**

There is a bias term and an activation function for a specific channel. 
The kernel for an image, which is a 3D tensor, is also a 3D tensor. 
A single tensor is applied to all channels of the input channel, aggregated by summing up across these different channels. 


**Remarks**

The input signal $X$ for $N$ samples are usually of size $(N, 3, H, W)$, where $H, W$ are the sizes for all $N$ instances of images. 
According to sources like pytorch, there seems to be no activation function coming out of the convolution layer. 
See [here](https://pytorch.org/docs/stable/generated/torch.nn.Conv2d.html) for the documentations in pytorch. 

---
### **Normalized 2D convolution Layer**

Normalizations convolution layer incorperate batch normalization in between every layer of convolutions. 
See [Conv2DNormActivation](https://pytorch.org/vision/main/generated/torchvision.ops.Conv2dNormActivation.html) for more information. 

---
### **The Transposed Convolution Components**

Transposed convolution plays with the parameters and increase the dimension of the input channels instead of decreasing it. 

#### **Warning | It's not Reversing Convolution**
> A transposed convolutional layer only reverse the dimension and it doesn't reverse the convolutions. 
In brief it's a trainable convolutional layer that upscale the input signal instead of down scaling the input signal. 

**Remark**

For more information see [CONVTRANSPOSE1D](https://pytorch.org/docs/stable/generated/torch.nn.ConvTranspose1d.html). 
Please watch [here](https://github.com/vdumoulin/conv_arithmetic/blob/master/README.md) for more visualizations of the underlying computational process. 
Compared to convolution, the input is paded by the size of the filter. 


#### **Fact | Shapes of the Input and Output For 1D Signal**
> Let the input of the signal be $(C, L)$  from $C$ number of channels, let $K$ be the size of the kernel. 
> Let $(C', L')$ be the output of the signal. 
> We define the following parameters for the operations: 
> 1. $s$, the `stride`. Default: 1. 
> 2. $p$, the input `padding``. Default: 0
> 3. $d$, `dilation`. Default 1. Dilating the input signal wit zero. 
> 4. $p'$, `output_padding`. Default: 0.  Padding on the outputof the signal.
>
> Then the output signal can be computed as 
> $$
> \begin{aligned}
>     L' = (L - 1)s - 2 p + d(K - 1) + p'. 
> \end{aligned}
> $$
> Observe that in the default case, we have $s = 1, p = 1, d =1, p' = 0$ simplyfing the above into 
> $L' = (L - 1) - 2 + (K - 1)$. 

**Observations**

The major difference here is that the stride, and the size of kernel, instead of dividing by the stride like in the case of convolution, it nows multiplies the input signal. 
The parameters now are inverting the dimension of the output. 
Dilation still means the same thing. 
