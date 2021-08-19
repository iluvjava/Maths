prereq: [[Gradient Descend 1]], [[Subgradient]]


---
### **Intro**

Welcome. Proximal gradient descend is a unconstrained optimization method, it aims to solve: 

> $$\min_x \{f(x) + h(x)\}$$

where $f(x), h(x)$ are convex but $h(x)$ is non-smooth. 

**Intuitively**

if $f(x)$ is complicated, it's hard to solve, however, if we have the convexity information for function $f(x)$ at a fixed point, then we might solve the following problem efficiently: 

$$
\underset{h, t}{\text{prox}}(
    z
) = 
\arg\min_x \left\lbrace
    \frac{1}{2t}
    \left\Vert
        x - z
    \right\Vert^2
    + 
    h(x)
\right\rbrace
$$

This is called the proximal operator, parameterized by a convexity information related parameter $t$, and the non-smooth function named $h(x)$. 

---
### **Claim 1**

> The proximal operator is equivalent to: 
> $$
> \arg\min_x \left\lbrace
>     g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2}
>     \Vert y - x\Vert + h(x)
> \right\rbrace
> $$

**Observe that**

By convexity of $f, g$ we have: 

$$
f(x) + h(x) \le 
g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
+ h(y) = m_x(y) \tag{1}
$$

find the solution to minimize this is what **claim 1** is about. 

**Proof**

$$
\begin{aligned}
    & g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
    \\
    =&
    g(x) + \nabla g(x)^T x - \nabla g(x)^T x + 
    \frac{\beta}{2}\Vert x\Vert^2 + \frac{\beta}{2} \Vert x\Vert^2
    -\beta y^T x + h(x)
    \\
    =& 
    \left(
        g(x) - \nabla g(x)^Tx + \frac{\beta }{2} \Vert x\Vert^2
    \right) + 
    \underbrace{\left(
        \nabla g(x) - \beta x
    \right)^T y + \frac{\beta}{2} \Vert y\Vert + h(y)}_{\text{Optimize This!}}
\end{aligned}\tag{2}
$$

Which means that: 

$$
\begin{aligned}
    & \arg\min_x \left\lbrace
    g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
    \right\rbrace
    \\
    =&
    \arg\min_x \left\lbrace
        \underbrace{\left(
            \nabla g(x) - \beta x
        \right)^T y + \frac{\beta}{2} \Vert y\Vert^2}_{\text{the smooth part}} + h(y)
    \right\rbrace 
\end{aligned}\tag{3}
$$

Let's complete the square here: 

$$
\begin{aligned}
    \underbrace{\left(\nabla g(x) - \beta x\right)^T}_{b} y + \underbrace{\frac{\beta}{2}}_{a} \Vert y\Vert =&
    b^Ty + a \Vert y\Vert^2
    \\
    =&
    a \left(
        \frac{b^T}{a}y + \Vert y\Vert^2
    \right)
    \\
    =& 
    a \left(
        \frac{b^T}{a}y + \Vert y\Vert^2 + 
        \left\Vert\frac{b^T}{2a}\right\Vert^2
        - 
        \left\Vert
             \frac{b^T}{2a}
        \right\Vert^2
    \right)
    \\
    =& 
    a \left(
        \underbrace{\left\Vert
              y + \frac{b}{2a}
        \right\Vert^2}_{\text{Optimize This part}}
        -
        a \left\Vert
             \frac{b^T}{2a}
        \right\Vert^2
    \right)
    \\
    \left\Vert
        \frac{b}{2a} + y
    \right\Vert^2
    =& 
    \left\Vert
         \frac{\nabla g(x) - \beta x}{\beta} + y
    \right\Vert^2 
    \\
    =& 
    \left\Vert
        y - \left(x - \frac{\nabla g(x)}{\beta}\right)
    \right\Vert^2
\end{aligned}\tag{4}
$$

Let's make the link back to the start, which means that: 

$$
\begin{aligned}
    =& 
    \arg\min_x\left\lbrace
        \left(
            \nabla g(x) - \beta x
        \right)^T y + \frac{\beta}{2} \Vert y\Vert
        + h(x)
    \right\rbrace 
    \\
    =& 
    \arg\min_x\left\lbrace
        \frac{\beta}{2}\left\Vert
        y - \left(x - \frac{\nabla g(x)}{\beta}\right)
    \right\Vert^2 + h(x)
    \right\rbrace
    \\
    =& 
    \underset{h, t}{\text{prox}} \left(x - \frac{\nabla g(x)}{\beta}\right) \text{ where: } t= \frac{1}{\beta}
\end{aligned}\tag{5}
$$

Therefore, minimizing the proximal operator using the convexity information at a point of the function will minimizes the parabolic approximation of that region, together with the nonconvex function. 

$\blacksquare$

Therefore, we have a way to solve the mini minimization problem $m_x(y)$ at a point $x$ of a smooth convex function $f(x)$. 


---
### **Claim 2**

> If proximal operator "locked" itself during the iterations of proximal gradient descend, then optimality condition is satisfied. 

**Proof**

$$
\begin{aligned}
    x^+ &= \underset{u}{\text{argmin}} \left(
        g(x) + \nabla g(x)^T(u - x) + \frac{1}{2t}\Vert u - x\Vert^2 + h(u)
    \right)
    \\
    0 &\in \nabla g(x) + \frac{1}{t}(x^+ - x) + \partial h(x^+)
    \\
    G_t(x) - \nabla g(x) &\in \partial h(x^+)
    \\
    G_t(x) &\in \partial h(x^+) + \nabla g(x)
\end{aligned}

$$

Where $G_t(x) = \frac{1}{t}(x^+ - x)$, it can be interpreted as the step size function, but influenced by the smoothness and the regularization term. 

Take notice that, IF $x^+ = x$, meaning that the proximal operator becomes the identity, then the optimal solution is satisified because zero belongs to the subgradient of $g(x) + h(x)$. 

---
### **Formulation of Proximal Gradient Descend**

Assuming that $g(x)$ is beta smooth, meaning that it can be bounded above by a parabolic of convexity $\beta$, and let $h$ be a convex but non-smooth function. 

>$$
>\begin{aligned}
>    & \text{Initialize: }x^{(0)}
>    \\
>    & \text{for } k = \text{ from } 1 \text{ to } \infty
>    \\
>    &\hspace{2em}
>    \begin{aligned}
>        & x^{(k)} = \underset{h, \frac{1}{\beta}}{\text{prox}}
>        \left(x^{(k - 1)} - \frac{\nabla g(x)}{\beta}\right)
>        \\  
>        & \text{break if } x^{(k)} = x^{(k + 1)}
>    \end{aligned}
>\end{aligned}
>$$

**Note** for accelerated gradient, it's exactly the same. 

---
### **FISTA, Accelerated Proximal Gradient**



