- [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Lower Semi-Continuity](../Background/Lower%20Semi-Continuity.md)

---
### **Intro**

We introduces concepts for the proximal mapping when the function is not necessarily convex. 

**References:**
- Rockafellar and Wetts, pg.20. 

#### **Definition | Moreau Envelope and Proximal Mapping**
> For a $f: \R^n \rightarrow \overline \R$ lsc and proper, let $\lambda > 0$, define the proximal mapping $\prox f: \R^n \rightarrow 2^{\R^n}$, Moreau envelope function $\env_f: \R^n \rightarrow \R$ by 
> $$
> \begin{aligned}
>     \pprox{\lambda f} (y) &:= 
>     \argmin{x}\left\lbrace
>         f(x) + \frac{1}{2\lambda} \Vert x - y\Vert^2
>     \right\rbrace,
>     \\
>     \env_f(y) &:= 
>     \min_{x} \left\lbrace
>         f(x) + \frac{1}{2}\Vert x - y\Vert^2
>     \right\rbrace \le f(y). 
> \end{aligned}
> $$


**Remarks**: 


This is just Rockafellar and Wetts definition 1.22 in our notations. 

The following theorems summarizes basic properties of being prox-bounded at a given point for the lsc function. 

#### **Theorem | Properties of pointwise prox-boundedness**
> 
**Proof**


#### **Definition | Prox-bounded, Prox-boundedness**
> $f: \R^n \rightarrow \overline \R$ is prox-bounded if there exists $\lambda > 0, x \in \R^n$ such that $\env_f(x) > \infty$. 
> The supremum of the set of all such $\lambda$, $\lambda_f$ is the prox-boundedness of $f$. 

A function that is bounded below would be a sufficient condition for prox-boundedness. 


#### **Excercise 1.29 (c) | Rock-Wets**
> $\env_f^{\lambda_1 + \lambda_2}(x) = \env_{\lambda_1}(\env_{\lambda_2}f)$ for $\lambda_1 > 0, \lambda_2 > 0$. 

**Proof**

It's all algebra unfortunately. 
Firstly, let's show that for all $z, y \in \R^n$ that: 
$$
\begin{aligned}
    \frac{1}{2\lambda_2} \Vert z - y\Vert^2 + \frac{1}{2\lambda_1} \Vert y - x\Vert^2
    &= 
    \frac{1}{2}(\lambda_1 + \lambda_2)^{-1}\Vert z - x\Vert^2
    + 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1\lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2. 
\end{aligned}
$$

Here are the works: 

$$
\begin{aligned}
    &\frac{1}{2\lambda_2} \Vert z - y\Vert^2 + \frac{1}{2\lambda_1} \Vert y - x\Vert^2
    \\
    &= \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_2} \Vert y\Vert^2
    - \frac{1}{\lambda_2}\langle z, y\rangle 
    + \frac{1}{2\lambda_1}\Vert y\Vert^2 + \frac{1}{2\lambda_1} \Vert x\Vert^2 
    - \frac{1}{\lambda_1} \langle y, x\rangle
    \\
    &= \left(
        \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_1}\Vert x\Vert^2
    \right) 
    + \left(
        \frac{1}{2\lambda_2} + \frac{1}{2\lambda_1}
    \right) \Vert y\Vert^2
    + \langle y, - \lambda_2^{-1}z - \lambda_1^{-1} x\rangle
    \\
    &= 
    \left(
        \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_1}\Vert x\Vert^2
    \right) 
    + 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2}\Vert y\Vert^2
    + 
    \left\langle 
        \frac{\lambda_1 + \lambda_2}{\lambda_1\lambda_2}y,
        - \frac{\lambda_1\lambda_2}{\lambda_1 + \lambda_2}
        (\lambda_2^{-1}z - \lambda_1^{-1} x)
    \right\rangle
    \\
    &= 
    \left(
        \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_1}\Vert x\Vert^2
    \right) 
    +
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2}\Vert y\Vert^2
    - 
    \frac{\lambda_1 + \lambda_2}{\lambda_1\lambda_2}
    \left\langle 
        y,
        (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)
    \right\rangle
    \\
    &= 
    \left(
        \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_1}\Vert x\Vert^2
    \right) 
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2
    - \frac{1}{2\lambda_1\lambda_2(\lambda_1 + \lambda_2)}\Vert \lambda_1 z + \lambda_2x\Vert^2
    \\
    &= 
    \left(
        \frac{1}{2\lambda_2}\Vert z\Vert^2 + \frac{1}{2\lambda_1}\Vert x\Vert^2
    \right) 
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2
    \\ &\quad 
        - \frac{1}{2\lambda_1\lambda_2(\lambda_1 + \lambda_2)}\left(
            \lambda_1^2 \Vert z\Vert^2 + \lambda_2^2 \Vert x\Vert^2
        \right) - (\lambda_1 + \lambda_2)^{-1}\langle z, x\rangle
    \\
    &= 
    \left(
        \frac{1}{2\lambda_2} - \frac{\lambda_1}{2\lambda_2(\lambda_1 + \lambda_2)}
    \right)\Vert z\Vert^2 
    + 
    \left(
        \frac{1}{2\lambda_1} - \frac{\lambda_2}{2\lambda_1(\lambda_1 + \lambda_2)}
    \right)\Vert x\Vert^2
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2
    \\
        & \quad - (\lambda_1 + \lambda_2)^{-1}\langle z, x\rangle
    \\
    &= 
    (\lambda_1 + \lambda_2)^{-1}\left(
        \Vert z\Vert^2 
        + 
        \Vert x\Vert^2 - \langle z - x\rangle
    \right)
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2
    \\
    &= 
    (\lambda_1 + \lambda_2)^{-1}\Vert z - x\Vert^2
    
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2. 
\end{aligned}
$$

From here, we start with the definition and it has 

$$
\begin{aligned}
    \env_{\lambda_1}(\env_{\lambda_2}f)(x)
    &= 
    \inf_{y} \inf_{z}
    \left\lbrace
        f(z) + \frac{1}{2\lambda_1}\Vert z - y\Vert^2 + \frac{1}{2\lambda_2}\Vert y - x\Vert^2
    \right\rbrace
    \\
    &= 
    \inf_{y} \inf_{z}
    \left\lbrace
        f(z) + (\lambda_1 + \lambda_2)^{-1}\Vert z - x\Vert^2
    - 
    \frac{\lambda_1 + \lambda_2}{2\lambda_1 \lambda_2} 
    \Vert y - (\lambda_1 + \lambda_2)^{-1}(\lambda_1 z + \lambda_2 x)\Vert^2
    \right\rbrace
    \\
    &= \inf_{z} \left\lbrace
        f(z) + (\lambda_1 + \lambda_2)^{-1} \Vert z - x\Vert^2
    \right\rbrace
    \\
    &= \env_f^{\lambda_1 + \lambda_2}(x). 
\end{aligned}
$$

$\blacksquare$

