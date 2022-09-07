[FFT Algorithm](../AMATH%20581%20Scientific%20Computing/FFT%20Algorithm.md)
[Discrete Fourier Transform with Details](Discrete%20Fourier%20Transform%20with%20Details.md)


---
### **Intro**

We are interested in using the FFT matrix to compute the Chebyshev series at the chebyshev node, and interpolate any smooth functions over the chebyshev node on $[-1, 1]$. Suppose that the smooth function we are intersted in is $p(x)$, over the interval $[-1, 1]$. Using the Chebyeshev series, we want: 

$$
\begin{aligned}
    p(x) &= \sum_{j = 0}^{n} 
    a_j T_j(x)
    \\
    p(\cos(k\pi /n)) &= 
    \sum_{j = 0}^{n}a_j \cos(k\pi/n)
\end{aligned}
$$

**DCT via DFT**

> To evaluate the function at the chebyshev node, we consider the vector: 
> $$
> \vec{f} = [a_0, a_1, \cdots, a_{n - 1}, a_n, a_{n - 1}, \cdots, a_1]
> $$
> And then apply DFT via FFT we will obtain the results: 
> $$
> \frac{1}{2}(F_k + a_0 + (-1)^k)
>         = 
> \sum_{j = 0}^{n}\cos\left(
>     \frac{\pi j k}{n}
> \right)a_j \quad \forall\; 0 \le k \le n
> $$

**Proof**

First, we set the index for the vector $\vec{f}$ starting at 0, and please notice that $f_{j} = f_{2n - j}\;\forall\; 1 \le j \le 2n - 1$, and there are 2n elements in total for the vector $\vec{f}$. 

$$
\begin{aligned}
    \exp\left(
            -i\frac{\pi(2n - j)k}{n}
        \right) &= 
        \exp\left(
            -i \frac{2\pi n - j\pi k}{n}
        \right)
        \\
        &= \exp
        \left(
            -i\frac{2n\pi n}{n} + \frac{ij\pi k}{n}
        \right)
        \\
        &= \exp\left(
            i\frac{jk\pi}{n}
        \right)
        \\
        \implies
        \sum_{j = 0}^{2n - 1}
        \exp\left(
            i \frac{\pi j k}{n}
        \right) &= 
        \sum_{j = 1}^{2n}
        \exp\left(
            -i \frac{2\pi(2n - j)k}{n}
        \right)
\end{aligned}\tag{1.1}
$$

By replacing the index $j$ into $2n - j$ will preserve the equality of the summation by symmetry of the exponential function. Next, we consider the discrete fourier transform applied to this signal: 

$$
\begin{aligned}
F_k &= \sum_{j = 0}^{2n - 1}
            \exp\left(
                - i \frac{2\pi j k}{2n}
            \right)f_j
        = \sum_{j = 0}^{2n - 1}
        \exp\left(
            - i \frac{\pi j k}{n}
        \right)f_j
        \\
        &= 
        \frac{1}{2}
        \left(
            \sum_{j = 0}^{2n - 1}
            \exp
            \left(
                -i\frac{\pi j k}{n}
            \right)f_j
            + 
            \sum_{j = 1}^{2n}
            \exp\left(
                -i \frac{2\pi (2n - j)k}{n}
            \right)\underbrace{f_{2n -j}}_{= f_j}
        \right)
        \\
        &= 
        \frac{1}{2}
        \left(
            \sum_{j = 0}^{2n - 1}
            \exp
            \left(
                -i\frac{\pi j k}{n}
            \right)f_j
            + 
            \sum_{j = 1}^{2n}
            \exp\left(
                i\frac{jk\pi}{n}
            \right)f_j
        \right) \impliedby \quad \text{(1.1)}
        \\
        &= \frac{1}{2}
        \left(
            2f_0 + 
            \sum_{j = 1}^{2n - 1}
            \exp
            \left(
                -i\frac{\pi j k}{n}
            \right)f_j
            + 
            \sum_{j = 1}^{2n - 1}
            \exp\left(
                i\frac{jk\pi}{n}
            \right)f_j
        \right)
        \\
        &= f_0 + \sum_{j = 1}^{2n - 1}
        \cos\left(
            \frac{\pi j k}{n}
        \right)f_j
\end{aligned}\tag{1.2}
$$

Now, we apply the trick that the $\cos$ function is symmetric in the sense the for the index $j = 1 + k$ and the index when $j - 2n - 1 - k$ would give the same results, hence simplifying the index range of the summation into: 

$$
\begin{aligned}
    F_k &= a_0 + \left(
        2 \sum_{j = 1}^{n - 1}
        \cos\left(
            \frac{\pi j k}{n}
        \right)a_j
    \right) + (-1)^k a_n
\end{aligned}\tag{1.3}
$$

Going from the end of (1.2) to (1.3) please observe that the extra term, when $j = n$, $f_j = a_n$, which is right in the middle of the symmetric part of $\vec{f}$, and it only repeats once, so I take it out from the sum and it produces the term $(- 1)^ka_n$. All other terms repeats 2 times and $f_0 = a_0$. Rearranging and we have: 


$$
\begin{aligned}
    \frac{1}{2}
        \left(
            F_k - a_0 - (-1)^ka_n
        \right) &= 
        \sum_{j = 1}^{n - 1}
        \cos \left(
            \frac{\pi j k}{n}
        \right)a_j
        \\
        \frac{1}{2}
        \left(
            F_k + a_0 + (-1)^ka_n
        \right) &= 
        \sum_{j = 0}^{n}
        \cos \left(
            \frac{\pi j k}{n}
        \right)a_j
        \\
        \frac{1}{2}
        \left(
            F_k + a_0 + (-1)^ka_n
        \right) &= p\left(
            \cos\left(
                \frac{k\pi}{n}
            \right)
        \right)
\end{aligned}\tag{1.4}
$$

Therefore, we have derived the way of getting the value for the chebyshev series evaluate at the chebyshev node using the DCT algorithm which make use of the FFT, significantly speeded up the computations. 
