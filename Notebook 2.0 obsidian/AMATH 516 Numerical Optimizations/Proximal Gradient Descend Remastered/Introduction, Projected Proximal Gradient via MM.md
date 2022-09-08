prereq: 
* [[Gradient Descend 1]]
* [[Subgradient and Subdifferential Definition]]
* [[Characterizing Functions for Optimizations]]

---
### **Intro**

Proximal gradient descend is a unconstrained optimization method, it aims to solve: 

> $$\min_x \{g(x) + h(x)\}$$

where $g(x), h(x)$ are convex but $h(x)$ is non-smooth and $g$ is smooth, meaning that it has gradient oracle and can be bounded by quadratic from above on every point for the domain of the function. Here, we derive the proximal gradient algorithm using the most common way of deriving the projected gradient algorithm: Majorizing and Minimizing. We derive a non-smooth upper bound from the gradient information of the function and then solves the minimum for the upper bound function for an update of the next step of the algorithm. 

**The Upper-bounding Function**

By $\beta$ convexity of $g$ and convexity of $h$ we have: 

$$
f(x) + h(x) \le 
g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
+ h(y) = m_x(y) \tag{1}
$$

Take note that, using the fact that function $f$ is smooth, we have a quadratic upper bound plus the affine function from below defined via the gradient. 



**Define: The Proximal Operator**

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
\right\rbrace.
$$

This is called the proximal operator, parameterized by a convexity information related parameter $t$, and the non-smooth function named $h(x)$. Please read [[Moreau Envelope and Proximal Mapping]] for more in depth discussion. 

---
### **Claim 1**

> 
> $$
> \arg\min_y \left\lbrace
>     g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2}
>     \Vert y - x\Vert + h(y)
> \right\rbrace
> $$
> Solves $m_x(y)$ and it can be written as: 
> $$
> \underset{h, t}{\text{prox}} \left(x - \frac{\nabla g(x)}{\beta}\right) \text{ where: } t= \frac{1}{\beta}.
> $$

**Proof**

$$
\begin{aligned}
    & g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
    \\
    =&
    g(x) + \nabla g(x)^T x - \nabla g(x)^T x + 
    \frac{\beta}{2}\Vert x\Vert^2 + \frac{\beta}{2} \Vert x\Vert^2
    -\beta y^T x + h(y)
    \\
    =& 
    \left(
        g(x) - \nabla g(x)^Tx + \frac{\beta }{2} \Vert x\Vert^2
    \right) + 
    \underbrace{\left(
        \nabla g(x) - \beta x
    \right)^T y + \frac{\beta}{2} \Vert y\Vert + h(y)}_{\text{Optimize This!}}. 
\end{aligned}\tag{2}
$$

Which means that: 

$$
\begin{aligned}
    & \arg\min_y \left\lbrace
    g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
    \right\rbrace
    \\
    =&
    \arg\min_y \left\lbrace
        \underbrace{\left(
            \nabla g(x) - \beta x
        \right)^T y + \frac{\beta}{2} \Vert y\Vert^2}_{\text{the smooth part}} + h(y)
    \right\rbrace. 
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
    \right\Vert^2. 
\end{aligned}\tag{4}
$$

Let's make the link back to the start, which means that: 

$$
\begin{aligned}
    =& 
    \arg\min_y\left\lbrace
        \left(
            \nabla g(x) - \beta x
        \right)^T y + \frac{\beta}{2} \Vert y\Vert
        + h(x)
    \right\rbrace 
    \\
    =& 
    \arg\min_y\left\lbrace
        \frac{\beta}{2}\left\Vert
        y - \left(x - \frac{\nabla g(x)}{\beta}\right)
    \right\Vert^2 + h(x)
    \right\rbrace
    \\
    =& 
    \underset{h, t}{\text{prox}} \left(x - \frac{\nabla g(x)}{\beta}\right) \text{ where: } t= \frac{1}{\beta}, 
\end{aligned}\tag{5}
$$

therefore, minimizing the proximal operator using the convexity information at a point of the function will minimizes the parabolic approximation of that region, together with the nonconvex function. 

$\blacksquare$

Therefore, we have a way to solve the mini minimization problem $m_x(y)$ at a point $x$ of a smooth convex function $f(x)$. 


---
### **Claim 2**

> If proximal operator produces $x^{(k+ 1)} = x^{(k)}$, then optimality condition is satisfied. 

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

Where $G_t(x) = \frac{1}{t}(x^+ - x)$, it can be interpreted as the step size function, but influenced by the smoothness and the regularization term. Take notice that, if $x^+ = x$, meaning that the proximal operator becomes the identity, then the optimal solution is satisfied because zero belongs to the subgradient of $g(x) + h(x)$. 

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

This accelerated gradient algorithm is referenced from: [[FISTA_ A Fast Iterative Shrinka - Amir Beck.pdf]]. 

The iteration will be started with: $x_0 = y_0$, $t_0 = 1$, the update sequence is: 

>$$ 
>\begin{aligned}
>    & x_{k + 1} = \underset{1/\beta, h}{\text{prox}}\left(
>        y_k - \frac{1}{\beta}\nabla f(y_k)
>    \right)
>    \\
>    & t_{k + 1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}
>    \\
>    & y_{k + 1} = x_{k + 1} + \frac{t_k - 1}{t_{k + 1}}(x_{k + 1} - x_k)
>\end{aligned}
>$$

Take notice that this is exactly the same when compare to the gradient descent without the proximal operator. 




