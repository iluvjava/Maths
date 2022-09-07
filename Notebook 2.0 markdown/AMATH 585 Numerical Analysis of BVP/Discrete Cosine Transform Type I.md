[Discrete Fourier Transform with Details](Discrete%20Fourier%20Transform%20with%20Details.md)


---
### **Intro**

A discrete Cosine Transform is applied to a real signal on the interval $[-1, 1]$, and we want to express it in terms of a series of cosine function such that: 


$$
F_k = \sum_{j = 0}^{n}a_j \cos(k\pi/n)
$$

In this way, the transformed signal is expressed in terms of the output of a series of Consine Function. Usually, this is done via the DFT FFT algorithm, due to the speed and numerical stability. The procedure can be stated simply as: 


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


And the proof is cover separately in: [Chebyshev Series via FFT](Chebyshev%20Series%20via%20FFT.md). See that for more details. 

