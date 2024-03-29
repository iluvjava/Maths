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
> 
