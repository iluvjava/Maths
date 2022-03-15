[[FFT Algorithm]]
[[Discrete Fourier Transform with Details]]


---
### **Intro**

We are interested in using the FFT matrix to compute the Chebyshev series at the chebyshev node, and interpolate any smooth functions over the chebyshev node on $[-1, 1]$. 

Suppose that the smooth function we are intersted in is $p(x)$, over the interval $[-1, 1]$. Using the Chebyeshev series, we want: 

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

Should be covered in else 





