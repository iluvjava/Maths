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
> for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{1}{2\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
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



#### **Lemma 2.2 | Accelerated Gradient Generic Trianglar Form**
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
> Let $f$ be convex and differentiable with Lipschitz gradient and $\mu\ge0$-strongly convex, define $l_f(x; y) = f(y) + \langle \nabla f(y), y - x\rangle$ to be a linearization of $f$ at $y$. 
> for all $x_0 \in \R^n$, and let $y_0 = x_0$, define the following variants of PPM for function $f$. 
> $$
> \begin{aligned}
>     x_{t + 1} &= \argmin{x} \left\lbrace
>        l_f(x; y_t) + \frac{\mu}{2}\Vert x - y_t\Vert^2 + \frac{1}{\tilde \eta_{t + 1}} \Vert x - x_t\Vert^2
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

**Observations**

Setting $\mu = 0$ this reduces to Two Ways PPM. 

#### **Definition 2.4 | 2-ways Strongly Convex Bregman PPM**
> 

#### **Definition 2.5 | Accelerated Gradient generic strongly convex Triangular Form**
> With $f$ $L$-Lipschitz smooth and $\mu$ storngly convex, we can derive similar triangle with the following: 
> $$
> \begin{aligned}
>     & (1 + \tilde \eta_{t + 1}\mu)x_{t + 1} 
>     = 
>     x_t + \mu\tilde \eta_{t + 1}y_t - \tilde \eta_{t + 1}\nabla f(y_t)
>     \\
>     & z_{t + 1} = y_t - L^{-1} \nabla f(y_t)
>     \\
>     & (1 + L\eta_{t + 1})y_{t + 1} = x_{t + 1} + L \eta_{t + 1} z_{t + 1}
> \end{aligned}
> $$


#### **Lemma 2.5 | The Lyapunov upper bounds for generic 2 steps PPM**
> Applying PPM descent lemma on the first step of the two ways proximal point method, by anchoring on $f(z_{t + 1})$, we can derive the RHS of the descent quantity from the PPM inequality. 
> With definitions for quantities: 
> $$
> \begin{aligned}
>     \Upsilon_{1, t + 1}^{\text{AG}}&= \tilde \eta_{t + 1} (f(z_{t + 1}) - f(x_*))
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
>     \Upsilon_{2, t + 1}^{\text{AG}} 
>     &= f(z_{t + 1}) - f(z_t) 
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
{\small
\begin{aligned}
    & \phi_t(x_{t + 1}) - \phi_t(x_*) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    - \frac{1}{2}\Vert x_* - x_t\Vert^2 
    =: \tilde\eta_{t + 1}\Upsilon_{1, t + 1}^{\text{AG}}
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
    - \langle \tilde \eta_{t + 1}\nabla f(y_t), x_{t + 1} - z_{t + 1} \rangle. 
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
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle \nabla f(y_t), z_{t + 1} - z_t\rangle + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \\
    \text{let }\Upsilon_{2, t + 1}^{\text{AG}} 
    &:= f(z_{t + 1}) - f(z_t)
\end{aligned}
$$

Which is the descent inequality anchored on $z_{t + 1}$. 
Merging the $(z_{t + 1} - y_t)$ with $y_t - z_t$ together yield the desired results. 


---
### **Deriving Convergences of AG Variants From the Lyapunov Upper Bounds**

In this section, we repeat part II, but with the above theorem. 
With $x_* \in \argmin{x} f(x)$, and 

$$
\begin{aligned}
    \Phi_t &= \left(
        \sum_{i = 1}^{t} \tilde\eta_{t + 1}
    \right) (f(z_t) - f(x_*)) + \frac{1}{2}\Vert x_t - x_*\Vert^2 \quad \forall t \in \N
    \\
    \Phi_0 &= \frac{1}{2}\Vert x_t - x_*\Vert^2
\end{aligned}
$$

where we observe that, compare to the Lyapunov function of gradient descent, we had $z_t$ instead of $x_t$. 
Review [Proximal Point Method, Convex Part I](Proximal%20Point%20Method,%20Convex%20Part%20I.md) and references therein for more information. 
Using a similar derivation the difference as in the case for the PPM analysis of Lyapunov function for gradient descent, giving $\forall t \in \N$

$$
{\small
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &= 
    \left(
        \sum_{i = 1}^{t+1} \tilde\eta_{i}
    \right) (f(z_{t + 1}) - f(x_*)) 
    - 
    \left(
        \sum_{i = 1}^{t} \tilde\eta_{i}
    \right) (f(z_{t}) - f(x_*)) 
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= 
    \tilde \eta_{t + 1} (f(z_{t + 1}) - f(z_*))
    +
    \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)(f(z_{t + 1}) - f(z_t))
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AG}} + \Upsilon_{2, t + 1}^{\text{AG}}
\end{aligned}\tag{$[*]$}
}
$$


#### **Scenario 1 | Not Similar Triangle**

The first scenario starts by considering the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$, together with the updates of the Generic Triangular Form of the algorithm:  

$$
\begin{aligned}
    x_{t + 1} - x_t &= \tilde \eta_{t + 1}\nabla f(y_t)
    \\
    z_{t +1} - y_t &= L^{-1}\nabla f(y_t), 
\end{aligned}
$$

we consider the upper bound of $\Upsilon_{1, t + 1}^{\text{AG}}$, with that we can simplify it 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}}
    &\le 
    -\frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + 
    \frac{\tilde \eta_{t + 1}L }{2} \Vert z_{t + 1} - y_t\Vert^2 
    - 
    \langle \tilde \eta_{t + 1} \nabla f(y_t), x_{t +1} - z_{t + 1}\rangle
    \\
    &\le 
    - \frac{1}{2}\Vert \tilde \eta_{t + 1} \nabla f(y_t)\Vert^2 
    + \frac{\tilde \eta_{t + 1} L}{2}\Vert L^{-1} \nabla f(y_t)\Vert^2 
    + 
    \langle 
        - \tilde \eta_{t + 1} \nabla f(y_t), 
        -L^{-1}\nabla f(y_t) + y_t - x_t + \tilde \eta_{t + 1}\nabla f(y_t)
    \rangle
    \\
    &= 
    \left(
        \frac{\tilde \eta_{t + 1}^2}{2} + 
        \frac{\tilde \eta_{t + 1}}{2L}
    \right)
    \Vert \nabla f(y_t)\Vert^2 
    + \tilde \eta_{t + 1} 
    \left\langle 
        \nabla f(y_t), 
        (\tilde \eta_{t + 1} - L^{-1})\nabla f(y_t) + y_t - x_t 
    \right\rangle
    \\
    &= 
    (1/2)(L^{-1}\tilde \eta_{t + 1} - \tilde \eta_{t + 1}^2)
    \Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}(\tilde \eta_{t + 1} - L^{-1})
    \Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}\langle \nabla f(y_t), y_t - x_t\rangle
    \\
    &= \frac{1}{2}\left(
        -L^{-1}\tilde \eta_{t + 1} + \tilde \eta_{t + 1}^2
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \tilde\eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle. 
\end{aligned}
$$
For $\Upsilon_{2, t + 1}^\text{AG}$, we simplify it with the updates of the algorithms in mind. 

$$
\begin{aligned}
    \Upsilon_{2, t + 1}^\text{AG}
    &\le 
    \langle \nabla f(y_t), z_{t +1} - y_t\rangle + 
    \frac{L}{2}\Vert z_{t +1} - y_{t} \Vert^2 
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= 
    \langle 
        \nabla f(y_t), -L^{-1} \nabla f(y_t)
    \rangle + 
    \frac{L}{2}\Vert L^{-1}\nabla f(y_t) \Vert^ 2
    + 
    \langle \nabla f(y_t), y_t - z_t\rangle
    \\
    &= -\frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
    + \langle \nabla f(y_t), y_t - z_t\rangle. 
\end{aligned}
$$

Observe that the cross product term for $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$ doesn't perfectly match. 
Hence let's consider $y_t - x_t = L \eta_t (z_t - y_t)$ from the algorithm, we make the choice to do surgery on upper bound of $\Upsilon_{2, t + 1}^\text{AG}$, so $\langle \nabla f(y_t), y_t - x_t\rangle = \langle \nabla f(y_t), L \eta_t (z_t - y_t)\rangle$. 
With this in mind, applying the RHS of $[(*)]$ yields: 

$$
{\small
\begin{aligned}
    & \Upsilon_{1, t + 1}^{\text{AG}} + \left(
        \sum_{i=1}^{t}\eta_i 
    \right) \Upsilon_{2, t + 1}^{\text{AG}} 
    \\
    &\quad \le 
    \frac{1}{2}\left(
        -L^{-1}\tilde \eta_{t + 1} + \tilde \eta_{t + 1}^2
    \right)\Vert \nabla f(y_t)\Vert^2 
    + 
    \tilde\eta_{t + 1} \langle \nabla f(y_t), y_t - x_t\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\eta_i 
    \right)\left(
        -\frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
        + \langle \nabla f(y_t), y_t - z_t\rangle
    \right)
    \\
    &\quad =
    \left(
        \frac{1}{2}\tilde\eta_{t + 1}\left(
            \tilde \eta_{t +1} - L^{-1}
        \right)
        - 
        \frac{1}{2L}\sum_{i = 1}^{t}\eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}\langle \nabla f(y_t), L\eta_t (z_t - y_t)\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\eta_i
    \right)
    \langle \nabla f (y_t), y_t - z_t\rangle
    \\
    &\quad 
    = 
    \left(
        \frac{1}{2}\tilde\eta_{t + 1}\left(
            \tilde \eta_{t +1} - L^{-1}
        \right)
        - 
        \frac{1}{2L}\sum_{i = 1}^{t}\eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \left(
        L\eta_t \tilde \eta_{t + 1} - \sum_{i = 1}^{t}\eta_i
    \right)
    \langle \nabla f(y_t), z_t - y_t\rangle. 
\end{aligned}
}
$$

We had progress this far, and the final piece is to select a choice for stepsize parameter $\eta_t, \tilde \eta_{t +1}$ such that the coefficient for the $\Vert \nabla f(y_t)\Vert^2$ is negative, and is zero for the cross product term. 
In this scenario, we makes the choice of $\tilde \eta_t = \eta_t$. 
Continuting will simplify the upper bound so that it is: 

$$
\begin{aligned}
    \frac{1}{2}\left(
        \eta_{t + 1}^2 - L^{-1}\eta_{t +1} - L^{-1}\sum_{i = 1}^{t}\eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \left(
        L\eta_t \eta_{t + 1} - \sum_{i = 1}^{t} \eta_i
    \right)
    \langle \nabla f(y_t), z_t - y_t\rangle 
    &
    \le 0. 
\end{aligned}
$$

Assuming the above inequality holds then one of the sufficient conditions would happen when the coefficient of the cross product term is zero and the coefficient for the normed term is negative, yielding the condition for all $t \in \N$: 

$$
\begin{aligned}
    \begin{cases}
        L\eta_{t + 1}^2 + \eta_{t + 1} - \sum_{i = 1}^{t}\eta_i 
        \le 0, 
        \\
        L\eta_t \eta_{t + 1} - \sum_{i = 1}^{t} \eta_i 
        = 0. 
    \end{cases}
\end{aligned}
$$

Substituting the sequence equality back to the first one yield: 

$$
\begin{aligned}
    L\eta_{t + 1}^2 - (\eta_{t + 1} + L\eta_t\eta_{t + 1}) &\le 0 
    \\
    L\eta^2_{t + 1} - \eta_{t + 1}
    &\le 
    L\eta_t \eta_{t + 1} 
    \\
    \eta_{t + 1}(L\eta_{t + 1} - 1) 
    &\le L\eta_t\eta_{t + 1}
    \\
    \eta_t > 0 
    \implies 
    L\eta_{t + 1} - 1 &\le 
    L\eta_t 
    \\
    \eta_{t + 1} &\le \eta_t + L^{-1}. 
\end{aligned}
$$

To satisfies the equality, reader should verify that $\eta_{t + 1} = t/ L$ is one of the options. And there are not many other options for the choice of the stepszies for the equality to be satisfied. 


**Remarks**

We repeated the analysis as in Part I of the writing on Nesterov Accelerated Momentum. 

#### **Scenario 2 | Similar Triangle I**
This similar triangle approach will recover the original Nesterov acceleration sequence method proposed back in 1983. 
It is called a similar triangle approach because it employed the following conditions on top of the Triangular Generic Form of AG: $\tilde\eta_{t + 1} = \eta_t + L^{-1}$. 
This stepsize allows us to change updates so that $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, $\nabla f(y_t)$ is now nullified. 
To start, substituting the definition of $z_{t +1}, z_t$ into the above expression then we have: 

$$
\begin{aligned}
    x_{t + 1} &= y_t - L^{-1}\nabla f(y_t) 
    + L \eta_t y_t - \eta_t \nabla f(y_t) - L\eta_t z_t
    \\
    &= 
    (1 + L\eta_t)y_t - (\eta_t - L^{-1})\nabla f(y_t) - L\eta_t z_t
    \\
    &= \eta_t Lz_t + x_t -(\eta_t - L^{-1}) \nabla f(y_t)  - L\eta_t z_t
    \\
    &= x_t - (\eta_t - L^{-1})\nabla f(y_t). 
\end{aligned}
$$

This new choice for $\tilde \eta, \eta$ conveys the following updates: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) 
    \\
    x_{t + 1} &= z_{t + 1} + L\eta_t (z_{t + 1} - z_t)
    \\
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1}
    (
    x_{t + 1} + L\eta_{t + 1}z_{t + 1}
    ). 
\end{aligned}
$$

Additinally, this algorithm will allows us to reduce to the classical form of Accelerated Gradient by 

$$
\begin{aligned}
    
\end{aligned}
$$

##### **The Similar Triangle Geometry**


#### **Scenario 3 | Similar Triangle II**


