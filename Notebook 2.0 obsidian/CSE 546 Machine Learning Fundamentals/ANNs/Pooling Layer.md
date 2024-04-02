[Introduction to Artificial Neural Network](Introduction%20to%20Artificial%20Neural%20Network.md)

---
### **Intro**

Max pool is often used in networks for computer visions. 
A pooling layer extract out useful statistics from the results of a filter. 


---
### **Max Pool Layer**

Similar to convolution layer, max pool can be applied to multi-channels of signals. 


#### **Def | Max Pool on 1D input**
> A max pool transform on $u \in \mathbb R^n$, takes parameter $k \le n$ which is the size of the window sliding over vector $u$. 
> Then mathematically we may express it as a $\mathbb R^n \mapsto \mathbb R^{n - k}$: 
> $$
> \begin{aligned}
>     v_i = \max(u_i, u_{i + 1}, \cdots, u_{i + k}), 
> \end{aligned}
> $$
> for $1 \le i \le m - k$. 

**Observations**

This transformation is a continuous transformation. 

#### **Def | Max Pull 2D Input**
> A max pull transfrom on $u \in \mathbb R^{n_1\times n_2}$ takes out the maximal element locally. 
> Define a $k_1 \times k_2$ sized matrix to be the filter. 
> The output filter will be of size $(n_1 - k-1, n_2 - k_2)$, where each elements are the maximal of the elements from the kernel sized window on the original signal. 
> Let $Y_{i, j}$ be of size $(n_1 - k_1, n_2 - k_2)$ be the output matrix and let $X_{i, j}$ of size $(n_1, n_2)$ be the input matrix, then the output can be mathematically represented as: 
> $$
> \begin{aligned}
>     \forall (i, j) \in [n_1 - k_1] \times [n_2 - k_2] : Y_{i, j} = 
>     \max_{
>         \substack{
>             i' = 1, \cdots, k_1 \\ j' = 1, \cdots, k_2}
>         }
>         \left\lbrace
>             X_{i + i', j + j'}
>         \right\rbrace. 
> \end{aligned}
> $$

**Remarks**

This is a locally Lipschitz continuous mapping wrt to elements in the input matrix $X$. 


#### **Def | The Simple Max Pull Layer**
> Let's define these quantities 
> 1. $(N, C, H, W)$ is the size of the input signal. 
> 2. $(N, C, H', W')$ is the signal of the output layer.
> 3. $(k_1, k_2)$ is the size of the kernel. 
> 4. $N$ is usually the size of the Batched samples. 
> 5. $[s_1, s_2]$ be the stride parameters for the kernels. 
> 
> Let $X$ be the signal of size $(N,C, H, W)$, let the output signal be $Y$ of size $(N, C, H', W')$, then the output can be precisely described by the following formula: 
> $$
> {
> \large
> \begin{aligned}
>     Y_{i,c, h, w} = 
>     \max_{
>         \substack{m = 0, \;\cdots, H\\n = 0, \; \cdots \; , W}
>     }
>     \{
>         X_{i, c, hs_1 + m, s_2w + n}
>     \}. 
> \end{aligned}
> }
> $$

**Observations**

The operation is different compared to Convolution since there is no mixing between the different channels of the input signal. 

**Remarks**

See Max pull component [here](https://pytorch.org/docs/stable/generated/torch.nn.MaxPool2d.html).
The output dimension can also be influenced by padding options as well. 
Other more complicated operations include: 

1. `padding`, adding zeros to the boundary of the input signal on all channels. 
2. `dilation`, pulling from a dilated kernel instead. 