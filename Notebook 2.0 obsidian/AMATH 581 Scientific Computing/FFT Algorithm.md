FFT algorithms is an quick algorithm for Discrete Fourier Transform,
repreq: [[Fourier Transform Fourier Series]]

---

### **Intro**
The FFT uses divide and conquer and it exploits the fractal like structure of the DFT matrix, the roots of unity is the key. We denote the signal in the time domain using $f$ and $F$ denotes the signal in the Fourier Domain. This is the task of computing the discrete Fourier Transform: 

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
    \quad \forall\; 0 \le j \le N - 1, 
\end{aligned}
$$

different convention exists for different form of DFT, but here we consider this particular form. A Naive way of computing the algorithm will take abou $\mathcal{O}(N^2)$ complexity by just using the matrix vector multiplications. 

---
### **Divide and Conquer Approach**

Here we assume that $N$ is an integer power of $2$, let $w = \exp(2\pi  i/N)$ denotes the roots of unity, let the signal $f_j$ have $N$ samples in it. By splitting the term in the sum by odd and even we have:

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
    F^{[e]}_k + w^{k}F^{[o]}_k .
\end{aligned}
$$

Where, $F_k^{[e]}, F_k^{[o]}$ denotes the summation terms indexed by even indices for the signal $F_k$, these 2 terms itself is the results of another Foutie Transform. This particular property allows us to use a divide by conquery approach to implement the algorithm. Another good way of thinking about it is to partitioned DFT matrix's columns. 

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
        \right)f_{4j + 2}
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
        \right)f_{4j + 2}
    \\
    &= F^{[ee]}_k + w^{2k}F^{[eo]}_k
\end{aligned}
$$

And here, please take notice that, the index $j$ is paramaterized by the depth of th recursion and in this case for $F_k^{[ee]}$, its multiplier is now $4$, so is the multiplications of $w^{k}$, which has a new multiplier of $2k$.

**Optimizing the Memory Allocations**

To optimize the memory allocations, we want the divide by conquery algorithm to group together indices that are close to each other. This formulation of the problem doesn't give us such an advantage. Let's consider why that is the case. 

$$
\begin{aligned}
    F_k^{[ee]} &= 
    \sum_{j = 0}^{N/4 - 1}
    \exp\left(
        i\frac{2\pi kj}{N/4}
    \right)f_{4j}
    \\
    F_k^{[eo]} &= 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi kj}{N/4}
        \right)f_{4j + 2}
    \\
    F_k^{[oe]} &= 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi kj}{N/4}
        \right)f_{4j + 1}
    \\
    F_k^{[oo]} &= 
    \sum_{j = 0}^{N/4 - 1}
        \exp\left(
            i\frac{2\pi kj}{N/4}
        \right)f_{4j + 3}
\end{aligned}
$$

Here, please observe that, indices with the same modular on $4$ are grouped together. Assuming that $N = 2^kn, k\in \mathbb{N}$, it's not hard to imagine a grouping of the elements into group of $n$. When $n$ is 1, we can go down to a single element in the array by this divide and conquer scheme. Let's say that $N = 8$, then we have: 

$$
\begin{aligned}
    \begin{bmatrix}
        f_0
        \\
        f_1
        \\
        f_2
        \\
        f_3
        \\
        f_4
        \\
        f_5
        \\
        f_6
        \\
        f_7
    \end{bmatrix} &= 
    \begin{bmatrix}
        F_k^{[eee]}
        \\[0.2em]
        F_k^{[oee]}
        \\[0.2em]
        F_k^{[eoe]}
        \\[0.2em]
        F_k^{[ooe]}
        \\[0.2em]
        F_k^{[eeo]}
        \\[0.2em]
        F_k^{[oeo]}
        \\[0.2em]
        F_k^{[eoo]}
        \\[0.2em]
        F_k^{[ooo]}
    \end{bmatrix}
    =
    \begin{bmatrix}
        f_{000}
        \\
        f_{001}
        \\
        f_{010}
        \\
        f_{011}
        \\
        f_{100}
        \\
        f_{101}
        \\
        f_{110}
        \\
        f_{111} 
    \end{bmatrix}
\end{aligned}
$$

Now, if I reverse the order of sequence of $e, o$, and then set $e$ to 0 and $o$ to one, then we have the index of the element represented by a binary number. Once the indices and the odd and even splits are mapped together, then we can find the following partitions of the elements: 


$$
\begin{aligned}
    \begin{bmatrix}
        f_{000}
        \\
        f_{001}
        \\
        f_{010}
        \\
        f_{011}
        \\
        f_{100}
        \\
        f_{101}
        \\
        f_{110}
        \\
        f_{111}
    \end{bmatrix}
    \overline\bowtie
    \begin{bmatrix}
        f_{000}
        \\
        f_{100}
        \\
        f_{010}
        \\
        f_{110}
        \\
        f_{001}
        \\
        f_{101}
        \\
        f_{011}
        \\
        f_{111}
    \end{bmatrix}
\end{aligned}
$$

The new ordering that allows for memory optimization is to reorder the binary number in reverse order and then order them. Then in that way, each recursion of the FFT will be applied upon adjacent blocks. 


---
### **Matrix Representations** 

Me have no time to fill this up aaaaaaaaa...