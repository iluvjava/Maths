- [Moreau Envelope and Nonconvex Proximal Mapping](Moreau%20Envelope%20and%20Nonconvex%20Proximal%20Mapping.md)


---
### **Intro**

The example of proximal hull is given as Example 1.44 in Rockafellar and Wets. 
It's similar to double conjugate. 


#### **Definition | lambda Proximal Hull**
> For a function $f: \R^n \rightarrow \overline \R$ and any $\lambda > 0$, the $\lambda$-proximal hull of $f$ is the function $h_\lambda f: \R^n \rightarrow \overline \R$ defined as the pointwise supremum of the collection over all equadratic of elementary form $x \mapsto 1/(2\lambda)\Vert x - w\Vert^2$ that are majorized by $f$. 
> Mathematically: 
> $$
> \begin{aligned}
>     h_\lambda f(x) &:= 
>     \sup_{c\in \R, w \in \R^n} 
>     \left\lbrace
>         c - \frac{1}{2\lambda} \Vert x - w\Vert^2: 
>         0 \le \inf_z \left\lbrace
>             f(z) - c + \frac{1}{2\lambda} \Vert z - w\Vert^2
>         \right\rbrace
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations**

It's obvious from the definition that $h_\lambda f \le f$ because it's the supremum of all quadratic lower than $f$. 
It's also lower semi-continuous because it's the supremum of continuous functions. 

There is a one to one relationship between proximal hull and the Moreau envelope of proximal point. 

#### **Theorem | Proximal hull and Moreau envelope**
> Let $\lambda > 0$. 
> The proximal hull is the function $h_\lambda f: \R^n \rightarrow \overline \R$ satisfying $e_\lambda f \le h_\lambda f \le f$ and it's related to the Moreau Envelope by formulas
> $$
> \begin{aligned}
>     h_\lambda f(x)&= 
>     \sup_{w\in \R^n}\left\lbrace
>         e_\lambda f(w) - \frac{1}{2\lambda} \Vert x - w\Vert^2
>     \right\rbrace, \text{so }h_\lambda f = -e_\lambda[- e_\lambda f], 
>     \\
>     e_\lambda f(x) &= 
>     \inf_{w \in \R^n}\left\lbrace
>         h_\lambda f(w) + \frac{1}{2\lambda} \Vert x - w\Vert^2
>     \right\rbrace \text{, so } e_\lambda f = e_\lambda[h_\lambda f].
> \end{aligned}
> $$

**Proof**

Three parts for the proof. 
1. **Part I**. We show that $h_\lambda f = - e_\lambda [- e_\lambda f]$, and straight from the first equality, it can be shown that $h_\lambda f \ge e_\lambda f$. 
2. **Part II**. We show that $e_\lambda f = e_\lambda[h_\lambda f]$. 

**Proof of Part I**. 
It's direct from the definition it has 

$$
\begin{aligned}
    h_\lambda f(x) &= 
    \sup_{c, w} \left\lbrace
        c - \frac{1}{2\lambda}\Vert x - w\Vert^2 : 
        0 \le \inf_{z\in \R^n}
        \left\lbrace
            f(z) - c + \frac{1}{2\lambda} \Vert z - w\Vert^2
        \right\rbrace
    \right\rbrace
    \\
    &= 
    \sup_{c, w} \left\lbrace
        c - \frac{1}{2\lambda}\Vert x - w\Vert^2 : 
        c \le \inf_{z\in \R^n}
        \left\lbrace
            f(z) + \frac{1}{2\lambda} \Vert z - w\Vert^2
        \right\rbrace
    \right\rbrace
    \\
    &= 
    \sup_{c, w} \left\lbrace
        c - \frac{1}{2\lambda}\Vert x - w\Vert^2 : 
        c =\inf_{z\in \R^n}
        \left\lbrace
            f(z) + \frac{1}{2\lambda} \Vert z - w\Vert^2
        \right\rbrace
    \right\rbrace
    \\
    &= 
    \sup_{c, w} \left\lbrace
        c - \frac{1}{2\lambda}\Vert x - w\Vert^2 : 
        c = e_\lambda  f(w)
    \right\rbrace
    \\
    &= 
    \sup_{w} \left\lbrace
        e_\lambda  f(w) - \frac{1}{2\lambda}\Vert x - w\Vert^2
    \right\rbrace
    \\
    &\ge e_\lambda f(x). 
\end{aligned}
$$

**Proof of Part II**. 


When $x^+ \in P_\lambda f(x)$ exists, it has for all $w \in \R^n$ the inequality: 

$$
\begin{aligned}
    0 &\le 
    f(w) + \frac{1}{2\lambda} \Vert x - w\Vert^2 
    - \left(
        f(x^+) + \frac{1}{2\lambda} \Vert x^+ - x\Vert^2
    \right)
    \\
    &= 
    f(w) - \left(
        \underbrace{
            f(x^+)
            - \frac{1}{2\lambda} \Vert x^+ - x\Vert^2
        }_{\alpha(x)}
        - \frac{1}{2\lambda}\Vert x - w\Vert^2 
    \right). 
\end{aligned}
$$

Look, $f(w)$ majorizes quadratic $w\mapsto \alpha(x) - 1/(2\lambda)\Vert x - w\Vert^2$. 
The quadratic touches $f(w)$ at $w = x^+$. 
So $f(x^+) = h_\lambda f(x^+)$. 
Now this is significant because it means 

$$
\begin{aligned}
    & \inf_{w} \left\lbrace
        h_\lambda f(w) + \frac{1}{2\lambda} \Vert x^+ - w\Vert^2
    \right\rbrace
    \\
    &\le 
    h_\lambda f(x^+) + \frac{1}{2\lambda} \Vert x^+ - x\Vert^2
    \\
    &= f(x^+) + \frac{1}{2\lambda} \Vert x^+ - x\Vert^2
    \\
    &= e_\lambda f(x)
    \\
    &= \inf_w\left\lbrace
        f(w) + \frac{1}{2\lambda} \Vert x + w\Vert^2
    \right\rbrace
    \\
    &\ge 
    \inf_{w}\left\lbrace
        h_\lambda f(w) + \frac{1}{2\lambda} \Vert w - x\Vert^2
    \right\rbrace. 
\end{aligned}
$$

In this case, they are equal. 
The case when $h_\lambda f(x) = -\infty$ implies that $f$ doesn't majorize any quadratic at $x$ with the $\lambda > 0$ given. 
So $h_\lambda f(x) = -\infty$ as well. 
The case $e_\lambda f(x) = + \infty$ has $f(x) = \infty$ so $h_\lambda f(x) = \infty$ too. 

$\blacksquare$

