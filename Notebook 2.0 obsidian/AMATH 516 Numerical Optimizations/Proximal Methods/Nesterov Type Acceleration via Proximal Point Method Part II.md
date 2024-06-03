[Nesterov Type Acceleration via Proximal Point Method Part I](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20I.md)

---
### **Intro**

We need to re-derive the Lyponouv convergence theorem to allows for more genericity so that it can be applied for proving the convergence for more varieties of the accelerated gradient methods. 


#### **Definition | Two Ways PPM**
> Let $f$ be convex and differentiable with Lipschitz gradient, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{1}{\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
>     \right\rbrace, 
>     \\
>     y_{t + 1} &= \argmin{x} 
>     \left\lbrace
>         l_f(x; y_t) + \frac{L}{2}\Vert x - y_t\Vert^2 + 
>         \frac{1}{2\eta_{t + 1}}\Vert x - x_{t + 1}\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$
> Here we assume that $\eta_{t + 1} > 0$ for all $t \in \N$. 



#### **Lemma | The 3 Points Generic Accelerated Gradient**
> The Two ways PPM defined above reduces to the following 3 points accelerated gradient algorithm: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
>     \\
>     y_{t + 1} &= 
>     (1 + L\eta_{t + 1})^{-1}
>     (
>     x_{t + 1} + L\eta_{t + 1}z_{t + 1}
>     ). 
> \end{aligned}
> $$



**Demonstrations**

Solving the optimality on the first PPM yields: 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f(y_t) + 
    \frac{1}{\tilde \eta_{t + 1}} (x - x_t)
    \\
    x &= x_t - \tilde \eta_{t + 1} \nabla f(y_t).
\end{aligned}
$$

Therefore, $x_{t + 1} = x_t - \tilde \eta_{t + 1}\nabla f(y_y)$. 
Similarly, for the updates of $y_{t + 1}$, we have optimality condition of 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f (y_t) + L (x - y_t) + \eta_{t + 1}^{-1} (x - x_{t + 1})
    \\
    \mathbf 0 &= \eta_{t + 1}\nabla f (y_t) + \eta_{t + 1}L (x - y_t) + x - x_{t + 1}
    \\
    \mathbf 0 &= 
    \eta_{t + 1}\nabla f(y_t) -\eta_{t + 1} Ly_t + (\eta_{t + 1}L + 1)x - x_{t + 1}
    \\
    (1 + \eta_{t + 1}L)x
    &= 
    x_{t + 1} - \eta_{t + 1}\nabla f(y_t) + \eta_{t + 1}L y_t
    \\
    \text{define: } y_{t + 1} &:= x. 
\end{aligned}
$$

In the above expression, it hides a step of gradient descent, continuing it we have 

$$
\begin{aligned}
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1}  + \eta_{t + 1}L (-L^{-1}\nabla f(y_t) + y_t)
    \\
    \text{let: } z_{t + 1} &= y_t - L^{-1}\nabla f(y_t), \text{ so, }
    \\
    (1 + \eta_{t + 1}L)y_{t + 1} &= 
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}. 
\end{aligned}
$$

Combining it yields the tree points update format 

$$
\begin{aligned}
    x_{t + 1} &= x_t - \tilde \eta_{t + 1} \nabla f(y_t) 
    \\
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
    \\
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1}
    (
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}
    ), 
\end{aligned}
$$

the ordering of $x_{t +1}, z_{t + 1}$ can be permuted. 
The base case is when $t = 0$, and that produces directly $x_0 = y_0$ for the initial guess. 



#### **Lemma | The upper bounds of 2 steps PPM**
> Applying PPM descent lemma on the first step of the two ways proximal point method, by anchoring on $f(z_{t + 1})$, we can derive the RHS of the descent quantity from the PPM inequality. 
> With definitions for quantities: 
> $$
> \begin{aligned}
>     & \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
>     + \frac{1}{2}(
>         \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_t - x_* \Vert^2
>     )  
>     \\
>     & \quad \le 
>     - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
>     \frac{\tilde \eta_{t + 1} L}{2}\Vert z_{t + 1} - y_t\Vert^2
>     - 
>     \langle \tilde \eta_{t + 1} \nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle, 
>     \\
>     & f(z_{t + 1}) - f(z_t) 
>     \le 
>     \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + 
>     \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
> \end{aligned}
> $$

**Observations**

The first inequality is not similar to the the gradient descent anaysis since it has $f(z_{t + 1})$ instead of $f(x_{t + 1})$. 
IN the above inequality, $\eta_{t + 1}$ is not playing any roles yet. 

**Proof**




