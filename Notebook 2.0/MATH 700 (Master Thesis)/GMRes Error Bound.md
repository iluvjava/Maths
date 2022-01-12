[[Cauchy Integral]]
[[GMRes]]

---
### **Intro**

We try to place some loose bound on the theoretical convergance rate of the GMRes methods. 


The polynomial using matrix $A$, for any matrix $A$ can be: 

$$
p(A) = \frac{1}{2\pi i} \oint_{\Gamma}^{} 
    p(z)(A - zI)^{-1}
dz
$$

Where, $\Gamma$ is a closed countour or an union of closed countour on the complex plane such that all the eigenvalues of $A$ are inside of $\Gamma$. 

**To Convince ourselves we use a normal matrix for simplity**, consider analytic function $p(z)$: 

$$
\begin{aligned}
    p(d) & = \frac{1}{2\pi i} \oint_{\gamma} \frac{p(z)dz}{z - d} 
    \\
    p\left(
        \begin{bmatrix}
            d_1 & & \\
            & d_2 & \\
            & & \ddots
        \end{bmatrix}
    \right) &= 
    \frac{1}{2\pi I}\oint_{\Gamma} 
    p(z) \left(
        zI - \begin{bmatrix}
            d_1 & & \\
            & d_2 & \\
            & & \ddots
        \end{bmatrix}
    \right)^{-1}dz
\end{aligned}
$$

Which is just using the Integral, but putting a vector inside and then consider the
resolvant of the identity matrix. And we consider $\gamma$ to be closed contour for each of the $d_i$ and $\Gamma$ are the union of all the closed countour on the complex plane containing the values of $d_i$. 

Consider Generalized Normal Matrices: 

$$
\begin{aligned}
    p(A) &= XP(D)X^{-1}
    \\
    \implies 
    P(A) &= X \left(
        \oint_{\Gamma}p(z)(zI - D)^{-1}dz
    \right)X^{-1}
    \\
    \implies 
    \Vert p(A)\Vert_2 &= 
    \frac{1}{2\pi} 
    \left\Vert
         \oint_{\Gamma}p(z)(zI - D)^{-1}dz
    \right\Vert_2
    \\
    & \le 
    \frac{1}{2\pi} \oint_{\Gamma}
    \Vert (zI - A)^{-1}\Vert_2 |p(z)| |dz|
    \\
    & \le 
    \frac{1}{2\pi} \mathcal{L}(\Gamma) \underbrace{\max_{z\in \Gamma} 
    \left\lbrace
        \Vert (A - zI)^{-1}\Vert |p(z)|
    \right\rbrace }_{\le \epsilon^{-1}}
\end{aligned}
$$

The minimal value over the norm of the resolvant multiplied by the absolute value of polynomial $p(z)$ can be bounded by some quantities $|p(z)|$. Using the last expression of we can derive a loose bound on the GMRes methods. This can be done because the GMRes has implicity opimizations of: 

$$
\min_{p(k): p(0) = 1}
    \left\Vert
        p_k(A) r_0
\right\Vert_2^2 
$$

Where the bound on $p_k(A)$ can be obtained via the countrour integral over the resolvant of the matrix. 
