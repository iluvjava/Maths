This is the link: [wiki link](https://en.wikipedia.org/wiki/Laplace_expansion)

---
### **Intro**

There is a recurrence relationship between the upper left sub matrix of a symmetric tridiagonal matrix with the the whole matrix. 

**Statement 1**

> Let $T_K$ be a symmetric tridiagonal matrix $\in \mathbb{R}^{k\times k}$ with $\alpha$ on its diagonal and $\beta$ on its subdiagona. Recursively, we define $T_{k - i}$ to be the top left sub matrix of $T_k$, with size $(k - 1)\times(k - 1)$. Using $|\cdot|$ to denote the determinant of a matrix, we have the recurrence relation: 
> $$
> |T_k| = \alpha_k|T_{k - 1}| - \beta_{k - 1}^2|T_{k - 2}|
> $$

**Proof of Statement 1**

Using the notation of $e_{k}^{(m)}$ to denote the $k^{th}$ standard basis vector in $\mathbb{R}^m$, consider the Block Matrix: 

$$
\begin{aligned}
    T_k &= \begin{bmatrix}
        T_{k - 2} & \beta_{k - 2}e_{k - 1}^{(k - 2)} & 
        \\
        \beta_{k - 2}e_{k - 2}^{(k - 2)T} & \alpha_{k - 1}  & \beta_{k - 1}e_{k - 1}^{(k - 1)}
        \\
        & \beta_{k - 1}e_{k - 1}^{(k - 1)T} & \alpha_k&
    \end{bmatrix}
\end{aligned}\tag{1}
$$

Now, we use the Laplace Expansion to figure out the determinant we are expanding the Laplace Expansion on the last row of $T_k$

$$
\begin{aligned}
    |T_k| = (-1)^{k+(k - 1)}\beta_{k - 1} \left|\begin{bmatrix}
        T_{k - 2} & 
        \\
        \beta_{k - 2}e^{(k - 2)T}_{k - 2} & \beta_{k - 1}e_{k - 1}^{(k - 1)}
    \end{bmatrix}\right|&
     + 
    (-1)^{2k} \alpha_k
    \left|
        \underbrace{\begin{bmatrix}
            T_{k - 2} & \beta_{k - 2}e_{k - 1}^{(k - 2)} 
            \\
            \beta_{k - 2}e_{k - 2}^{(k - 2)T} & \alpha_{k - 1}
        \end{bmatrix}}_{=T_{k - 1}}
    \right|
    \\
    (-1)^{2k - 2}\beta_{k - 1}|T_{k - 2}| 
    = 
    \left|\begin{bmatrix}
        T_{k - 2} & 
        \\
        \beta_{k - 1}e^{(k - 2)T}_{k - 2} & \beta_{k - 2}e_{k - 1}^{(k - 1)}
    \end{bmatrix}\right|&
\end{aligned}\tag{2}
$$

Substituting the last equation back to the first equation of the first term in (2): 

$$
\begin{aligned}
    |T_k| &= 
    (-1)^{2k - 2 + 2k - 1}\beta_{k - 1}^2|T_{k - 2}| + \alpha_k|T_{k - 1}|
    \\
    &= -\beta_{k - 1}^2|T_{k - 2}| + \alpha_k|T_{k - 1}|
\end{aligned}\tag{3}
$$

And the claim has been proved. 



---
### **Sturm Sequence**

The sequence is the determinant to a series of sub matrices, in this case for example, the sequence is: $|T_1|, |T_2|, \cdots |T_{k - 1}|, |T_k|$. This is potentially useful because each time it changes sign, it's indicated that there is one negative eigenvalues, and the number of times it change signs told us exact how many eigenvalues are less than zero! 

**Reference**: Trefenthen's Numerical Linear Algebra book, page 228, in the section talking about the bisection methods for locating eigenvalues of a tridiagonal matrix. 


---
### **Recursive Characteristic Polynomials**

It's not hard to see that the recurrence can also be applied to any shifting of the characteristic polynomial of $T_k$, let $p^{(k)}(x) = \text{det}(T_k - xI)$, then the following relations are true: 

$$
\begin{aligned}
    p^{(k)}(x) &= - \beta_{k - 1}^2 p^{(k - 2)}(x) + (\alpha_k - x)p^{(k-1)}(x)
\end{aligned}
$$

Shifting on $T_k$ with $-xI$ changes $\alpha_k$ into $\alpha_k - x$.  $p^{(-1)}(x)= 0, p^{(0)}(x) = 1$