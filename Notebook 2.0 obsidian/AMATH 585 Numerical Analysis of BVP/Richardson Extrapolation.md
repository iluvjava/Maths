[wiki link](https://en.wikipedia.org/wiki/Richardson_extrapolation), [[Finite Difference]]

---
### **Intro**

It's used for sequence accelerations, where we have information for the power series for the sequence, here we use for deriving finite difference formulas for derivatives. 

The goal is to accelerate the sequence: $A(h)$, where $\lim_{h\rightarrow 0}A(h) = 0$, and $A(h)$ commits a power series representation. We will use a linear combinations of $A(h_i)$ evaluated at some points to accelerate the convergence of the power series. 

---
### **General Formula**

Suppose that the exact function $A^{+}$ is approximated by a function $A(h)$. 

> $$
>   A^+ = A(h) + a_0h^{k_0} + a_1 h^{k_1} + a_2 h^{k_2} \cdots 
> $$
> Where $a_0, a_1, \cdots \neq 0$ and $k_0 < k_1 < k_2 \cdots$ and they are positive integers. 

Consider: 

$$
\begin{aligned}
    A^+ &= A(h) + a_0h^{k_0} + \mathcal{O}(h^{k_1})
    \\
    A^+ &= A(h/t) + a_0\frac{h^{k_0}}{t^{k_0}}  + \mathcal{O}(h^{k_1})
    \\
    (t^{k_0} - 1)A^+ &= t^{k_0}A\left(
        \frac{h}{t}
    \right)^{k_0} - A(h) + (t^{k_0} - 1)\mathcal{O}(h^{k_1}) 
    \\
    A^{+} &= \frac{
        t^{k_0}A\left(
            \frac{h}{t}
        \right)^{k_0} - A(h)
    }{
        t^{k_0} - 1
    } + \mathcal{O}(h^{k_1})
\end{aligned}
$$

Observe that, the new approximation involving a linear combinatons of $A(h/t), A(h)$ has improved the error of the approximation for $A^+$, because $\mathcal{O}(h^{k_1})$ is better better than $\mathcal{O}(h^{k_0})$. 

---
### **Finite Difference Applications**

We can use Richardson extrapolation and Taylor series to approximate the second derivative to a certain degree of accuracy. Consider finite difference approximation to the second derivative: 

$$
\begin{aligned}
    \underbrace{h^{-2}\left(
        u(x + h) + u(x - h) - 2u(x)
    \right)}_{:= \varphi_1(h)} &= 
    u''(x) + \frac{2h^2}{4!} u^{(5)}(x) + h^{-2}R_1(h),
\end{aligned}
$$

we define the remainder $R_1(h)$: 

$$
\begin{aligned}
    R_1(h) &= \sum_{j = 6}^{\infty}(1 + (-1)^n)\frac{h^n}{n!}u^{(j)}(x) \in \mathcal{O}(h^6)
    \\\text{because: }
    R_1(h) &= \sum_{j = 3}^{\infty}
    2\frac{h^{2n}}{(2n)!}u^{(j)}(x).
\end{aligned}
$$

Because the term with odd power cancelled out in the remainder, the first order interpolant is denoted as $\varphi_1(h)$. The $R_1(h)$ denotes the exact remainder, and it's in $\mathcal{O}(h^6)$, let's consider: 

$$
\begin{aligned}
    \varphi_1(h) &= u''(x) + \frac{2h^2}{4!}u^{(5)}(x) + h^{-2}R_1(h)
    \\
    \varphi_1(h/2) &= u''(x) + \frac{2(h/2)^2}{4!}u^{(5)}(x) + \left(
        \frac{h}{2}
    \right)^{-2}R_1
    \left(
        \frac{h}{2}
    \right)
    \\
    &= 
    u''(x) + \frac{h^2}{2(4!)}u^{(5)}(x) + \left(
        \frac{h}{2}
    \right)^{-2}R_1\left(
        \frac{h}{2}
    \right)
\end{aligned}
$$

Now we proceed to fine a linear combinations of 2 of the interpolants based on $h$, $h/2$ to reduce the $h^2$ term, decreasing the error. 

$$
\begin{aligned}
    4\varphi_1(h/2) - \varphi_1(h) &= 
    3u''(x) + 4 (h/2)^{-2}R_1(h/2) - h^{-2}R_1(h)
    \\
    \underbrace{\frac{4\varphi_1(h/2) - \varphi_1(h)}{3}}_{:= \varphi_2(h)} &= 
    u''(x) + \underbrace{\frac{4}{3}(h/2)^{-2}R_1(h/2) - \frac{1}{3h^2}R_1(h)}_{:=R_2(h)}
    \\
    \varphi_2(h) &= u''(x) + R_2(h)
\end{aligned}
$$

Oops, we would need another term for $h$ to cancel out, therefore, we would need to take the definition of $R_1(h)$, $R_2(h)$, expand it out, to find the exactly term involving $h$ to some kind of power for cancelling things out. 

$$
\begin{aligned}
    R_1(h) &= \frac{2h^6}{6!} + \mathcal{O}(h^8)
    \\
    \implies 
    \frac{4}{3}\left(
        \frac{h}{2}
    \right)^{-2}R_1(h/2) &=
    \frac{4}{3}\left(
        \frac{h}{2}
    \right)^{-2}\left(
        \frac{2(h/2)^6}{6!} + \mathcal{O}(h^8)
    \right)
    \\
    &= \frac{4}{3} \left(
        \frac{2(h/2)^4}{6!} + 
        \mathcal{O}(h^6)
    \right)
    \\
    &= \frac{8(h/2)^4}{3(6!)} + \mathcal{O}(h^6) 
\end{aligned}
$$

Similarly: 

$$
\begin{aligned}
    \frac{1}{3h^2}R_1(h) &= \frac{1}{3h^2}
    \left(
        \frac{2h^6}{6!} + \mathcal{O}(h^8)
    \right)
    \\
    &= \frac{2h^4}{3(6!)} + \mathcal{O}(h^6)
\end{aligned}
$$

**Note**

The results from Richardson Extrapolation should be consistent with what we get for finite difference using other methods, such as undetermined coefficients. 

It's better to prepare more terms before using Richardson so we don't have to expand out and remainder to check for the term missing for cancelling when ordering for higher order extrapolation. 

**References**: 
From Prof Anne Greebaum at UW, from class AMATH 585 2022 Spring. 

---
### **An Generic Example**

To get the point across, and to practice Richardson's Extrapolation when there are multiple terms to be elimiated, we make a generic example that requires 2 steps of Richardson Extrapolation to reduce. 

#UNFINISHED


---
### **Successive Refinement Via Richardson Extrapolations**



