

### **Intro**

TST: Tridiagonal Symmetric Toeplitz Matrix. 

This is a special type of matrix where we have solved it pretty thorougly. 

The matrix looks like this: 

$$
\begin{aligned}
    T = \begin{bmatrix}
        b& a& & 
        \\
        a & b& a&
        \\
        & a& &
        \\
        & & \ddots&a
        \\
        & & a&b
    \end{bmatrix}
\end{aligned}\in \mathbb{R}^{m\times m}
$$

And for thes type matrix, it has an eigen system that is paramaterized by $a, b, c$ in the matrix. 

> The eigenvalues are like: 
> 
> $$
> \lambda_k = a + 2b\cos \left(
>     \frac{k\pi}{m + 1}
> \right)\quad \forall\;  1 \le k \le m 
> $$
> 
> Which denotes the $k$ th eigenvalues for the matrix. 
> 
> $$
> v^{(k)}_l = \sqrt{\frac{2}{m + 1}} \sin\left(
>     \frac{kl\pi}{m + 1}
> \right) \quad \forall\; 1\le l \le m
> $$

Which denotes the $l$ element of the eigen vector $v{(k)}$. 


Take note that the eigenvectors are indeed the eigenvector of the above matrices, which can be derived like: 

$$
\begin{aligned}
    \frac{(v^{(k)})_j}{\sqrt{\frac{2}{m + 1}}}
    & =
    a \sin  \left(
        \frac{k\pi j}{m + 1}
    \right) + \underbrace{b\sin \left(
        \frac{k \pi (j - 1)}{m + 1}
    \right)}_{(1)} + \underbrace{b\sin \left(
        \frac{k\pi (j + 1)}{m + 1}
    \right)}_{(2)}
    \\
    (1)&=
    b\left(
        \sin\left(
            \frac{k\pi j}{m + 1}
        \right) + 
        \cos\left(
            \frac{k\pi}{m + 1}
        \right) + 
        \cos\left(
            \frac{k \pi j}{m + 1}
        \right)
        \sin\left(
            \frac{k \pi}{m + 1}
        \right)
    \right)
    \\
    (2) &= 
    b\left(
        \sin\left(
            \frac{k\pi j}{m + 1}
        \right) + 
        \cos\left(
            \frac{k\pi}{m + 1}
        \right) -
        \cos\left(
            \frac{k \pi j}{m + 1}
        \right)
        \sin\left(
            \frac{k \pi}{m + 1}
        \right)
    \right)
    \\
    \implies (1) + (2) &= 
    a\sin\left(
        \frac{k\pi j}{m + 1}
    \right) + 
    2b \sin\left(
            \frac{k \pi j}{m + 1}
        \right)\cos\left(
            \frac{k\pi j }{m + 1}
        \right)
    \\
    &= 
    \sin\left(
        \frac{k \pi j}{m + 1}
    \right)
    \left(
        a + 2b \cos\left(
            \frac{k \pi j}{m + 1}
        \right)
    \right)
    \\
    \frac{(v^{(k)})_j}{\sqrt{\frac{2}{m + 1}}}
    &= 
    \sin\left(
        \frac{k \pi j}{m + 1}
    \right)
    \lambda_j
\end{aligned}
$$

Which proves that the eigenvectors are indeed the eigenvectors and its corresponding eigenvalues are given by the above formulas. 



