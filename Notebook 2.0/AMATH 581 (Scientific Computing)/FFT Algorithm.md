FFT algorithms is an quick algorithm for Discrete Fourier Transform,
repreq: [[Fourier Transform Fourier Series]]

---

### **Intro**
The FFT uses divide and conquer and it exploits the fractal properties of the DFT matrix, the roots of unity is the key for the exploitation here. 

This is the task of computing the discrete Fourier Transform: 

$$
\begin{aligned}
    F_k &= \sum_{j = 0}^{N - 1}
    \exp\left(
        -i \frac{2\pi kj}{N}
    \right)f_j
    \quad \forall\; 0 \le k \le N - 1
    \\
    f_j &= \frac{1}{N}
    \sum_{k = 0}^{N - 1}
    \exp\left(
        i \frac{2\pi kj}{N}
    \right)F_k
    \quad \forall\; 0 \le j \le N - 1
\end{aligned}
$$

Different convention exists for different form of DFT, but here we consider this particular form. A Naive way of computing the algorithm will take abou $\mathcal{O}(N^2)$ complexity. 

---
### **Divide and Conquery Design**

Here we assume that $N$ is an integer power of $2$, let $w = \exp(2\pi  i/N)$ and the signal $f_j$ is has $N$ samples in it. Then we consider the recursive nature of the expression; by splitting the term by odd and even. 

$$
\begin{aligned}
    F_k &= \sum_{j = 0}^{N/2 - 1}\exp
    \left(
        i \frac{2\pi k (2j)}{N}
    \right)f_{2j}
    + 
    \sum_{j = 0}^{N/2 - 1}
    \exp\left(
        \frac{2\pi  (2j + 1)k}{N}
    \right)f_{2j + 1} \quad \forall\; k = 0, \cdots N - 1
    \\
    &= 
    \sum_{j = 0}^{N/2 - 1}
    \exp\left(
        i \frac{2\pi k (2j)}{N}
    \right)f_{2j} 
    + 
    w^{k}\sum_{j = 0}^{N/2 - 1}
    \exp\left(
        \frac{2\pi i (2j)k}{N}
    \right)f_{2j + 1}
    \\
    &= 
    \sum_{j = 0}^{N/2 - 1}
    \exp\left(
        i \frac{2\pi kj}{N/2}
    \right)f_{2j} 
    + 
    w^{k}\sum_{j = 0}^{N/2 - 1}
    \exp\left(
        i\frac{2\pi jk}{N/2}
    \right)f_{2j + 1}
    \\
    &= 
    F^{[e]}_k + w^{k}F^{[o]}_k
\end{aligned}
$$

Where, we will be able the split the signal into 2 parts, where each part are also a sub-Fourier Transform. This particular property allows us to use a divide by conquery approach to implement the algorithm. Another good way of thinking about it is to partitioned DFT matrix's columns. 

Here, please also observe that $F_k^{[e]}$ is also $N/2$ periodic, which implies that $F_{k + N/2}^{[e]} = F_{k}^{[e]}$, the same can be said for $F_k^{[o]}$. This implies that the computations needed for $F_k^{[e]}, F_{k}^{[o]}$ is about half of the master problem. However, there is one more detail to discuss, consider expanding out the summation representing $F^{[e]}_k$: 

$$
\begin{aligned}
    F_k^{[e]} &= \sum_{j = 0}^{N/2 - 1}
        \exp\left(
            i \frac{2\pi kj}{N/2}
        \right)f_{2j} 
    \quad \forall\; k = 0, \cdots, N/2 - 1
    \\
    &= 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            \frac{2\pi i (2j)}{N/2}
        \right)f_{4j}
    + 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi k (2j + 1)}{N/2}
        \right)f_{4j + 1}
    \\
    &= 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi kj}{N/4}
        \right)f_{4j}
    + 
    \underbrace{\exp\left(
        i\frac{2\pi kj}{N/2}
    \right)}_{=w^{2k}}
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi kj}{N/4}
        \right)f_{4j + 1}
    \\
    &= F^{[ee]}_k + w^{2k}F^{[eo]}_k
\end{aligned}
$$

And here, please take notice that, the index $j$ is paramaterized by the depth of th recursion, so is the multiplications of $w^{k}$. It depends on which lever of recursion we are looking at. 

**Optimizing the Memory Allocations**

To optimize the memory allocations, we want the divide by conquery algorithm to group together indices that are close to each other. This formulation of the problem doesn't give us such an advantage. Let's consider why that is the case. 

$$
\begin{aligned}
    F_k^{[ee]} &= 
    \sum_{j = 0}^{N/4 - 1}
        
\end{aligned}
$$


---
### **Matrix Representations** 

