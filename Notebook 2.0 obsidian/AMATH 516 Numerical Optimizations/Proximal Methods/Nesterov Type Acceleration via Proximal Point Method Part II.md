[Nesterov Type Acceleration via Proximal Point Method Part I](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20I.md)

---
### **Intro**

We need to re-derive the Lyponouv convergence theorem to allows for more genericity so that it can be applied for proving the convergence for more varieties of the accelerated gradient methods. 

---
### **Varieties of Nesterov Accelerated Gradient**

The analysis of PPM eventually extends to all varieties of Nesterov accelerated gradient methods. 

### **Def 1.1 | AG Generic Form I**
> Described in Nesterov ^[Y. Nesterov, Lectures on Convex Optimization, vol. 137. in Springer Optimization and Its Applications, vol. 137. Cham: Springer International Publishing, 2018. doi: 10.1007/978-3-319-91578-4.] (2.2.7), is an accelerated gradient method. 
> Here we faithfully resented it as the way it is in the book.
> Let $f$ be a $L$ Lipschitz smooth and $\mu\ge 0$ strongly convex function. 
> Choose $x_0$, $\gamma_0 > 0$, set $v_0 = x_0$, for iteration $k\ge 0$ it: 
> 1. Computes $\alpha_k \in (0, 1)$ by solving $L\alpha_k^2 = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 2. Set $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$. 
> 3. Choose $y_k = (\gamma_k + \alpha_k \mu)(\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)$. Compute $f(y_k)$ and $\nabla f(y_k)$. 
> 4. Find $x_{k + 1}$ such that $f(x_{k + 1}) \le f(y_k) - (2L)^{-1} \Vert \nabla f(y_k)\Vert^2$. 
> 5. Set $v_{k + 1} = \gamma_{k+1}^{-1}((1 - \alpha_k)\gamma_kv_k + \alpha_k \mu y_k - \alpha_k \nabla f(y_k))$. 

**Remarks**

For a faithful derivation of the algorithm as written in Nesterov's book, visit [Nesterov Estimating Sequence](../../MATH%20602%20Nesterov%20Acceleration/Nesterov%20Original%20Conception%20of%20Momentum%20Method.md) for more information. 
Claimed by Ahn ^[K. Ahn and S. Sra, “Understanding nesterov’s acceleration via proximal point method.” arXiv, Jun. 02, 2022. doi: 10.48550/arXiv.2005.08304.], the above Nesterov accelerated gradient fits the generic form of the algorithm: 

$$
\left\lbrace
\begin{aligned}    
    y_t &= \alpha_t x_t + (1 - \alpha_t)z_t
    \\
    x_{t + 1} &= \beta_t x_t + (1 - \beta)y_t - \gamma_t \nabla f(y_t)
    \\
    z_{t + 1} &= y_t - \delta_t \nabla f(y_t)
\end{aligned}
\right.
$$




---
### **PPM Analysis**

We derive some of the Nesterov accelerated gradient variants using PPM as a tool for interpretations. 

#### **Definition 2.1 | Two Ways PPM**
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



#### **Lemma 2.2 | The 3 Points Generic Accelerated Gradient**
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

#### **Definition 2.3 | 2-ways Strongly Convex PPM**
> 

#### **Definition 2.4 | 2-ways Strongly Convex Bregman PPM**
> 


#### **Lemma 2.5 | The Lyapunov upper bounds for generic 2 steps PPM**
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

Define $\phi_t(x) = \tilde \eta_{t +1}(f(y_t) + \langle \nabla f(y_t), x- y_t\rangle)$.  
With $L$-smoothness of $f$ in mind, consider the following sequence of inequalities: 
$$
\begin{aligned}
    \phi_t(x_{t + 1}) 
    &= 
    \tilde\eta_{t + 1} (f(y_t) + \langle \nabla f(y_t), x_{t + 1} - y_t\rangle)
    \\
    \phi_t (x_{t + 1}) &= \tilde \eta_{t + 1}(
        f(y_t) + \langle \nabla f(y_t), (x_{t +1} - z_{t + 1}) + (z_{t + 1} - y_t) \rangle
    )
    \\
    &\ge 
    \tilde \eta_{t + 1}
    \left(
        f(z_{t + 1}) - \frac{L}{2} \Vert z_{t + 1} - y_t\Vert^2 + 
        \langle \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \right), 
\end{aligned}
$$

Performing PPM on the function produces the PPM Lyapunov inequality, substituing yields equivalences for all $x_*$: 
$$
{\footnotesize
\begin{aligned}
    & \phi_t(x_{t + 1}) - \phi_t(x_*) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    - \frac{1}{2}\Vert x_* - x_t\Vert^2 
    \\
    \quad 
    &\le 
    - \frac{1}{2} \Vert x_{t + 1} - x_t\Vert^2 
    \\
    & 
    \tilde \eta_{t + 1}\left(
        f(z_{t + 1}) - \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
        + 
        \langle \nabla f(y_t), x_{t + 1} - z_{t + 1}\rangle
    \right) - \tilde \eta_{t + 1} f(x_*)
    + 
    \frac{1}{2}\left(
        \Vert x_{t + 1} - x_*\Vert^2 - \Vert x_{t} - x_*\Vert^2
    \right)
    \\
    \quad &\le - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    \\
    & 
    \tilde \eta_{t + 1} \left(
        f(z_{t + 1}) - f(x_*)
    \right) + \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2 
    - \frac{1}{2}\Vert x_{t} - x_*\Vert^2 
    \\
    \quad &\le 
    -\frac{1}{2} \Vert x_{t + 1 } - x_t\Vert^2 + 
    \frac{\tilde \eta_{t + 1}}{2}\Vert z_{t + 1} - y_t\Vert^2 
    - \langle \tilde \eta_{t + 1}\nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle =: \Upsilon_{1, t + 1}. 
\end{aligned}
}
$$

Observe that, the rhs and lhs of the Lyapunov inequality are anchored at $z_{t + 1}$. 
Similarly for the descent inequality we wish to obtain: 

$$
\begin{aligned}
    f(z_{t + 1}) - f(z_t) &= f(z_{t + 1}) - f(y_t) + f(y_t) - f(z_t) 
    \\
    &\le 
    \langle \nabla f(y_t), z_{t + 1} - y_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle =: \Upsilon_{2, t + 1}. 
\end{aligned}
$$

Which is the descent inequality anchored on $z_{t + 1}$. 
Merging the $(z_{t + 1} - y_t)$ with $y_t - z_t$ together yield the desired results. 


---
### **Not similar triangle**

In this section, we repeat part II, but with the above theorem. 
