[Conjugate Gradient Convergence Statmemt of Results](Conjugate%20Gradient%20Convergence%20Statmemt%20of%20Results.md)


---

### **Intro**

We wish to prove the convergence rate listed in the prereq of this file, which is the convergence rate of the Conjugate Gradient under the Exact Arithmetic Assumptions. The final objective we wish to prove is that the convergence bound for the CG method is given as: 

> $$
> \frac{\Vert e^{(k)}\Vert_A}{\Vert e^{(0)}\Vert_A}
> \le 2 \left(
>         \frac{\sqrt{\kappa} + 1}{\sqrt{\kappa} - 1}
> \right)^k
> $$

This is also listed as **Theorem 3.1.1** in professor's Greenbaums work: \<Iterative Method for linear System\>, and this is an analysis from Paige C.C. 

**Notations**

We introduce the notations: 

$$
\begin{aligned}
    p_{k}(A|w)v &= \sum_{j = 0}^{k}w_jA^jv
    \\
    p_{k}(x|w) &= \sum_{j = 0}^{k}w_jx^j
\end{aligned}
$$

For denoting polynomials with degree $k$. And we denotes $\mathcal P_k$ for the set of all possible polynomial with term $x^{k}$ as the maximum possible degree. 

---
### **The Chebyshev Polynomial**

This polynomial has the following definition: 

$$
T_k(x) = \arg\min_{p(x)\in \mathcal{P}_{k}}\max_{x\in [-1, 1]}|p(x)|
$$

After the adaptation of the Chebyshev Type T we have: 

$$
\begin{aligned}
    T_k(x) &= \arg\min_{
        \substack{
            p\in \mathcal{P}_{k}
            }
        }\max_{x\in [-1, 1]}|p(x)|
    \\
    p_k(x) &:= 
    \frac{T_k(\varphi(x))}{T_k(\varphi(0))}
    \quad 
    \text{where: } 
    \varphi(x) := \frac{2x - \lambda_1 - \lambda_n}{\lambda_n - \lambda_1}
    \\
    \implies p_k(x) &= \arg \min_{
        \substack{
            p\in \mathcal{P}_{k}
            \\
            \text{s.t: } p(0)  = 1
        }
    }\max_{x\in [\lambda_1, \lambda_n]}|p(x)|
\end{aligned}
$$

Which will be useful later. It's the polynomial that crosses the real line $k$ times with minimal amount of wiggles.Take this for granted. This polynomial also appeared under the following context for my notebook: 

[Spectral Method 2](../AMATH%20581%20Scientific%20Computing/Spectral%20Method%202.md)

[Sturm Liouville Theory](../AMATH%20503%20Intro%20to%20Partial%20Differential%20Equations/Sturm%20Liouville%20Theory.md)

[Chebyshev Series Derivative via FFT](../AMATH%20581%20Scientific%20Computing/Chebyshev%20Series%20Derivative%20via%20FFT.md)

---
### **Matrix Polynomial Bound**

Firstly, we are going to make the claim that: 

> $$
> \frac{\Vert e_k\Vert_A}{\Vert e_0\Vert_A} \le 
> \min_{p_{k}: p_{k}(0) = 1}\max_{x\in [\lambda_{\text{min}}, \lambda_{\text{max}}]} |p_k(x)|
> $$

And the polynomial formulations of the relative error: 

> $$
> \begin{aligned}
>     x_k &\in \mathcal{K}(A|r_0)w + x_0
>     \\
>     \frac{\Vert e_k\Vert_A^2}{\Vert e_0\Vert_A^2}
>     &= 
>     \min_{w\in \mathbb R^k} 
>     \Vert
>         (1 + Ap_k(A|w))A^{1/2}e_0
>     \Vert_2^2
>     \le
>     \min_{p_{k}: p_{k}(0) = 1}\max_{x\in [\lambda_{\text{min}}, \lambda_{\text{max}}>     ]} |p_k(x)|
> \end{aligned}
> $$


**Proof**

We write Krylov subspace as max polynomial with some coefficients denoted as a vector $w$, and we consider the error energy norm minimization property of the conjugate gradient algorithm, which happens at each step of the conjugate gradient algorithm. 

$$
\begin{aligned}
    \Vert e_k\Vert_A^2 & =
    \min_{x_k \in x_0 + \mathcal K_k(A|r_0)}
    \Vert 
        x^+ - x_k
    \Vert_A^2
    \\
    x_k \in x_0 + \mathcal K_k(A|r_0) 
    & \implies
    e_k = e_0 + p_{k - 1}(A|w)r_0
    \\
    \implies  &=
    \min_{w\in \mathbb R^k}
    \Vert 
        e_0 + p_{k - 1}(A|w)r_0
    \Vert_A^2
    \\
    &= \min_{w\in \mathbb R^k}
    \Vert 
        e_0 + Ap_{k - 1}(A|w)e_0
    \Vert_A^2
    \\
    &= \min_{w\in \mathbb R^k}
    \Vert 
        A^{1/2}(I + Ap_{k - 1}(A|w))e_0
    \Vert_2^2
    \\
    &\le
    \min_{w\in \mathbb R^k}
    \Vert 
        I + Ap_{k - 1}(A|w)
    \Vert_2^2\Vert e_0\Vert_A^2 \quad 
    \\
    & = 
    \min_{w\in \mathbb R^k}
    \left(
        \max_{i = 1, \dots, n}
        |1 + \lambda_i p_{k - 1}(\lambda_i|w)|^2
    \right)\Vert e_0\Vert_A^2
    \quad
    \\
    & \le 
    \min_{w\in \mathbb R^k}
    \left(
        \max_{x\in [\lambda_{\min}, \lambda_{\max}]}
        |1 + \lambda_i p_{k - 1}(\lambda_i|w)|^2
    \right)\Vert e_0\Vert_A^2
    \quad 
    \\
    &= 
    \min_{p_{k}: p_{k}(0) = 1}
    \max_{x\in [\lambda_{\min}, \lambda_{\max}]}
    | p_{k}(x)|^2 \Vert e\Vert_A^2
    \\
    \implies
    \frac{\Vert e_k\Vert_A}{\Vert e_0\Vert_A} &\le 
    \min_{p_{k}: p_{k}(0) = 1}\max_{x\in [\lambda_{\text{min}}, \lambda_{\text{max}}]} |p_{k}(x)|
\end{aligned}
$$


---
### **Krylov Subspace Grade Terminating Conditions**

> The grade determines the termination conditions of CG. 

It's immediate because $r_k \perp \mathcal K_{k}(A|r_0)$, when the grade is reached, it will have to terminates due to the cg setting $p_k$ to be the zero vector. 

> The grade of some vector is determined by it's eigen decomposition and the number of unique eigenvalues of those eigenvectors. 

This is discussed in Krylov Subspace. 


---
### **Chebyshev Bound**

We wish to show the claim that, we can adjust the Chebyshev Polynomial in the following way to establish the bound for that minmax polynomial of the relative error measured under the energynorm. 

> $$
> p_k(x) = \frac{T_k(\varphi(x))}{T_k(\varphi(0))}
> \quad \varphi(x) = \frac{2x - \lambda_n - \lambda_1}{\lambda_n - \lambda_1}
> $$

Where $T_k$ is the $k^{th}$ degree Chebyshev polynomial of the first kind, and we use $\lambda_1, \lambda_n$ to denote the quantity $\lambda_{\min}, \lambda_{max}$ for short. It's easy to verify that $p_k(0) = 1$. Next, observe the fact that $\varphi$ remaps the interval from $[\lambda_1, \lambda_n]$ (Assume that the eigenvalues of matrix $A$ is index in a way that $\lambda_1\le \cdots\le \lambda_n$) to the interval $[-1, 1]$, so that polynomial is adapted to the convex hull of the eigenvalues of matrix $A$. Next, also observe that: 

$$
\forall x \in [\lambda_1, \lambda_n]: \left|
\frac{T_k(\varphi(x))}{T_k(\varphi(0))}
\right|
\le 
\left|
    \frac{1}{T_k(\varphi(0))}
\right|
$$

Because $T_k(x)$ is bounded by one. 

**Next Objective would be to find:** $T_k(\varphi(0))$. Placing a bound to the polynomial ultimately. 

Firstly, observe that $\varphi(0) \not\in [\lambda_1, \lambda_n]$, because all Eigenvalues are larger than zero, therefore it's out of the range of the Cheb and we need to find the actual value of that. 

**Finding** $\varphi(0)$. 

$$
\begin{aligned}
    T_k(x) &= \cosh(k\text{ arccosh}(z)) \quad \forall z \ge 1
    \\
    \implies
    T_k(\cosh(\zeta)) &= \cosh(k\zeta) \quad z := \cosh(\zeta)
\end{aligned}
$$

We need to match the form of the expression $T_k(\varphi(0))$ with the expression of the form $T_k(\cosh(\zeta))$ given the freedom of varying $\zeta$. Observe that: 

$$
\begin{aligned}
    \varphi(0) &= \cosh(\zeta) = \cosh(\ln(y)) \quad \ln(y) := \zeta
    \\
    \text{recall: } \cosh(x) &= (\exp(-x) + \exp(x))/2
    \\
    \implies 
    \cosh(\ln(y)) &= (y + y^{-1})/2
    \\
    \varphi(0) &= (y + y^{-1})/2
\end{aligned}
$$

Recall the definition of $\varphi(x)$ and then simplifies; 

$$
\begin{aligned}
    \varphi(0) &= \frac{-\lambda_n - \lambda_1}{\lambda_n - \lambda_1}
    \\
    &= \frac{-\lambda_n/\lambda_1 - 1}{\lambda_n/\lambda_1 - 1}
    \\ 
    &= - 
    \frac{\lambda_n/\lambda_1 + 1}{\lambda_n/\lambda_1 - 1} 
    \\
    \implies \varphi(0) &=
    -\frac{\kappa + 1}{\kappa - 1}
\end{aligned}
$$

Therefore we seek for the solution of the equation for a form match: 

$$
-\frac{\kappa + 1}{\kappa - 1} = 
\frac{1}{2}(y + y^{-1})
$$

Spoiler, the solution is: 

$$
y = \frac{\sqrt{\kappa}\pm 1}{\sqrt{\kappa}\mp 1}
$$

Justification In the Appendix of the page, because it's just algebra. For now observe that the 2 solutions of the quadratic is the riciprical of each other, and it doesn't matter if we have 2 soltuion, they won't be affecting the final solution of the system.

Therefore, we can figure out the value of $T_k(\varphi(0))$ as the following: 

$$
\begin{aligned}
    \varphi(0)&= \frac{1}{2}(y + y^{-1})
    \\
    \implies 
    T_k(\varphi(0)) &= 
    T_k(\cosh(\ln(y)))
    \\
    &= \cosh(k\ln(y))
    \\
    &= (y^k + y^{-k})/2
\end{aligned}
$$

**Objective Accomplished. $\varphi(x)$ is found** 

Then, substituting the value of $y$, and invert the quantity we have: 

$$
\begin{aligned}
    \frac{1}{T_k(\varphi(0))} &= 2(y^k + y^{-k})^{-1}
    \\
    &= 
    2\left(
        \left(
            \frac{\sqrt{\kappa}\pm 1}{\sqrt{\kappa}\mp 1}
        \right)^{k} + 
        \left(
            \frac{\sqrt{\kappa}\mp 1}{\sqrt{\kappa}\pm 1}
        \right)^{-k}
    \right)^{-1}
    \\
    &= 2\left(
        \underbrace{\left(
            \frac{\sqrt{\kappa}+ 1}{\sqrt{\kappa}- 1}
        \right)^{k}}_{> 1} + 
        \underbrace{\left(
            \frac{\sqrt{\kappa}- 1}{\sqrt{\kappa}+ 1}
        \right)^{-k}}_{ < 1}
    \right)^{-1}
    \\
    & \le 2 \left(
        \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
    \right)^k
\end{aligned}
$$

Because, the second quantity in the Denominator is always larger than zero and gets smaller as the value of $k$ incrases, setting it to zero and take the riciprical of the fraction, and setting it to a positive quantity only, then we have it. 


---
### **Big Eigen Outlier Convergence Bound**

We can place a better bound on the convergence rate when the largest eigenvalues are noticably larger than all the other eigenvalues which are clustere around the origin. For notational convenience, consider a degree $k$ Chebyshev Polynomial adapted to any close interval $[a, b]$ such that it minimizes inf norm over that interval. by that token, we get: 

$$
\hat{T}_{[a, b]}^{(k)}(x) := 
T_k\left(
    \frac{2x - b - a}{b - a}
\right)
$$


Eigenvalues of the matrix $A$ are like: 

$$
p_k(z) := 
\frac
{
    \hat{T}_{[\lambda_1, \lambda_{n - 1}]}^{(k - 1)}
    \left(
        z
    \right)
}{
    T^{(k - 1)}_{[\lambda_1, \lambda_{n - 1}]}
    \left(
        0
    \right)
}\frac{\lambda_n - z}{\lambda_n}
$$

Where the line extra linear polynomial $(\lambda_n - z)/\lambda_n$ will interpolote the point $p_1(x) = 1, p_1(\lambda_n)=0$. Observe these following fact about this polynomial: 

$$
\begin{aligned}
    &\frac{\lambda_n - z}{\lambda_n} \in [0, 1]
    \quad \forall z \in [\lambda_1, \lambda_n]
    \\
    &
    \frac{\lambda_n - z}{\lambda_n} <1
    \quad  \forall z \in 
    [\lambda_1, \lambda_{n-1}]
    \\
    & 
    |p_k(x)| \le
    \left|
        \frac{
            \hat{T}_{[\lambda_1, \lambda_{n-1}]}^{(k - 1)}(x)
        }{
            \hat{T}_{[\lambda_1, \lambda_{n - 1}]}^{(k - 1)}(0)
        }
        \frac{\lambda_n - z}{\lambda_n}
    \right|
    \le 
    \frac{1}{
    \left|
        \hat{T}_{[\lambda_1, \lambda_{n - 1}]}^{(k - 1)}(0)
    \right|}
\end{aligned}
$$



Where $\hat{T}$ denotes the perturbed Cheb on the interval of $[\lambda_1, \lambda_{n-1}]$.

Now, we make use the theorem 3.1.1 which we just proved above to bound the quantity on the denominator, giving us: 

$$
\begin{aligned}
    T^{(k - 1)}_{[\lambda_1, \lambda_{n - 1}]}
    \left(
        0
    \right)
	&= \left|
        T_{k-1}\left(
            \frac{
                -\lambda_{n-1} - \lambda_1
            }
            {\lambda_{n-1}- \lambda_1}
        \right)
    \right|
    \\ 
    &=
    \frac{1}{2}(y^{k - 1} + y^{-(k - 1)})
    \quad \text{ where: } y = \frac{\sqrt{\kappa_{n - 1}} + 1}{\sqrt{\kappa_{n - 1}} - 1}, \kappa_{n - 1} = \frac{\lambda_{n - 1}}{\lambda_1}
\end{aligned}
$$

Read please observe that this is exactly the same expression as what we did for theorem 3.1.1, except for the fact that the condition number is paramaterzied by the first $n - 1$ eigenvalues of the matrix. The tighter bound would be given as: 

> $$
> \frac{\Vert e_k\Vert_A}{\Vert e_0\Vert_A} \le 
> 2\left(
>     \frac{\sqrt{\kappa_{n - 1}} - 1}{\sqrt{\kappa_{n - 1}} + 1}
> \right)^{k - 1}
> $$

Under the extreme case, the convergence is reached in 2 step of the CG iteration. 

---
### **Small Eigenvalues Convergence Bound**

We consider the the eigenvalues of the matrix to be like: 

$$
    0 < \lambda_1 <<  \lambda_2 \le \lambda_3 \le \cdots \le \lambda_n
$$

We wish the bounding polynomial gives the following property: 

$$
p_k(0) = 1 \quad p_k(\lambda_1) = 0
$$

For notational Convenience, Define the remapped Cheb as: 

$$
\hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(x)
= 
T_{k - 1}(\varphi(x))
\quad \text{where: }\varphi(x) = \frac{2x - \lambda_2 - \lambda_n}{\lambda_n - \lambda_2}
$$

let's consider another liear weight function $w(x)$ where it take value $1$ at $x = 0$, $0$ at $x = \lambda_1$, and use it to add to our optimal minimizing polynomial: 

$$
\begin{aligned}
    w(z) &:=  \frac{\lambda_1 - z}{\lambda_1} 
    \\
    p_k(z) &:= w(z)\left(
        \frac{\hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(z)}
        {
            \hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(z)
        }
    \right)
    \\\implies
    \max_{x\in[\lambda_2, \lambda_n]} |w(x)| &=
    \frac{\lambda_n - \lambda_1}{\lambda_1}
\end{aligned}
$$

In this case, the maximal value of the weight function $w$ is achieved via $x = \lambda_1$, and the absolute value swapped the sign of the function. Therefore, we have: 

$$
\begin{aligned}
    |p_k(z)| &= 
    \left|
        w(z) 
        \frac{\hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(z)}
        {
            \hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(0)
        }
    \right|
    \\
    &\le 
    \left|
        \frac{w(z)}{\hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(0)}
    \right|
    \\
    & \le
    \left| 
        \left(
            \frac{\lambda_n - \lambda_1}{\lambda_1}
        \right)
        \hat{T}_{[\lambda_2, \lambda_n]}^{(k - 1)}(0)
    \right|
    \\
    \implies 
    & \le   
    \left(
        \frac{\lambda_n - \lambda_1}{\lambda_1}
    \right)
    2\left(
        \frac{\sqrt{\kappa_0} + 1}{\sqrt{\kappa_0} - 1}
    \right)^{k - 1}
\end{aligned}
$$

We applied the Chebyshev Bound theorem proved in the previous part. And $\kappa_0 = \lambda_n/\lambda_2$, and that is the maximal bound for the absolute value of the polynomial. Let's state the results here: 

> $$
> \frac{\Vert e_k\Vert_A}{\Vert e_0\Vert_A} \le 
> 2\left(
>     \frac{\lambda_n - \lambda_1}{\lambda_1}
> \right)
> \left(
>     \frac{\sqrt{\kappa_0} - 1}{\sqrt{\kappa_0} + 1}
> \right)^{k - 1}
> $$

Take notice that this is a much much worse bound compare to the other case, where the outlier eigenvalues being the largest eigenvalues. This will also have an huge impact on the floating point precision of the algorithm. 
