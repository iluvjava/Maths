- [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md)


---
### **Intro**

This file directly continue from the previous part. 
It's split to reduce lags on the inefficient web based frameworks that renders markdown katex in real time. 
We continue the assumptions and notations from the previous parts. 

1. $h = f + g$ where $f, g$ are convex and $f$ is $L$-Smooth. 
2. $\mathcal T_L, \mathcal G_L$ denotes the proximal gradient, gradient mapping operator applied to $h$. 

These assumptions will keep our claim generic. 
By letting $g \equiv 0$, $\mathcal T_L = I - L^{-1}\nabla f$, and $\mathcal G_L = \nabla f$. 

#### **ToC For Viewing with VS Code**
- [**Intro**](#intro)
  - [**ToC For Viewing with VS Code**](#toc-for-viewing-with-vs-code)
- [**Deriving convergences of AG variants from the Lyapunov upper bounds**](#deriving-convergences-of-ag-variants-from-the-lyapunov-upper-bounds)
  - [**Theorem | Lyapunov analysis based on the PPM interpretation of AG**](#theorem--lyapunov-analysis-based-on-the-ppm-interpretation-of-ag)
  - [**Scenario 1 | Not Similar Triangle**](#scenario-1--not-similar-triangle)
    - [**The algorithm it reduces to**](#the-algorithm-it-reduces-to)
  - [**Scenario 1.1 | Non-Smooth, Not Similar Triangle**](#scenario-11--non-smooth-not-similar-triangle)
  - [**Scenario 1.2 | Extended Analysis on the Stepsize Sequence Constraints**](#scenario-12--extended-analysis-on-the-stepsize-sequence-constraints)
  - [**Scenario 2 | Similar Triangle I**](#scenario-2--similar-triangle-i)
  - [**Remarks**](#remarks)
    - [**The similar triangle geometry**](#the-similar-triangle-geometry)
  - [**Claim 1.1 | Recovering nesterov original form**](#claim-11--recovering-nesterov-original-form)
  - [**Scenario 3 | Similar triangle II**](#scenario-3--similar-triangle-ii)
- [**Some more nuanced results**](#some-more-nuanced-results)
  - [**Def 2.1 | Chambolle Dossal (2015)**](#def-21--chambolle-dossal-2015)
  - [**Def 2.2 | Ryu's chapter 12**](#def-22--ryus-chapter-12)
  - [**Claim 2.3 | Ryu's variant is part of the framework**](#claim-23--ryus-variant-is-part-of-the-framework)
  - [**Claim 2.4 | Chambolle Dossal is also part of the framework**](#claim-24--chambolle-dossal-is-also-part-of-the-framework)


---
### **Deriving convergences of AG variants from the Lyapunov upper bounds**

#### **Theorem | Lyapunov analysis based on the PPM interpretation of AG**
> Let $x_* \in \argmin{x} f(x)$, define quantities $\forall t \in \N \cup \{0\}$: 
> $$
> \begin{aligned}
>     S_t &:= \sum_{i = 1}^{t} \delta_i \quad \forall t \in \N,
>     \\
>     \sigma_t &:= \sum_{i = 1}^{t}\tilde \eta_i \quad \forall t \in \N, 
>     \\
>     \Phi_0 &:= \frac{1}{2}\Vert x_0 - x_*\Vert^2, 
>     \\
>     \Phi_t &:= 
>         \sigma_t(h(z_t) - h(x_*)) + \frac{1}{2}\Vert x_t - x_*\Vert^2 
>     \quad \forall t \in \N.
> \end{aligned}
> $$
> Also suppose that we have 
> 
> $$
> \begin{aligned}
>     \Upsilon_{1, t + 1}^{\text{AG}}
>     &:= 
>     \tilde \eta_{t + 1}(h(z_{t + 1}) - h(x_*))
>     + 
>     \frac{1}{2}(\Vert x_{t + 1} - x_*\Vert^2 + \Vert x_t - x_*\Vert^2)
>     \\ 
>     \Upsilon_{2, t + 1}^{\text{AG}}
>     &:= 
>     h(z_{t + 1}) - h(z_t), 
> \end{aligned}
> $$
> 
> assume that there is a sequence $\delta_t$ such that it satisfies for all $t \in \N$
> 
> $$
> \begin{aligned}
>     & \Phi_{t + 1} - \Phi_{t} =
>     \sigma_t\Upsilon_{2, t + 1}^{\text{AG}} 
>     + 
>     \Upsilon_{1, t + 1}^{\text{AG}} 
>     \le \delta_{t + 1} \quad 
>     \forall t \in \mathbb N, 
>     \\
>     & \Upsilon_{1, 1}^{\text{AG}} \le \delta_1. 
> \end{aligned}
> $$
> 
> Then we have 
> 
> $$
> \begin{aligned}
>     h(z_T) - h(x_*) &\le 
>     \sigma_T^{-1}\left(
>         S_{T} + \frac{1}{2}\Vert x_0 - x_*\Vert^2
>     \right). 
> \end{aligned}
> $$
> 
> Where $x_*$ is an minimizer of $h$. 
> So $h(z_T) - h(x_*)$ has convergence rate $\mathcal O(\sigma_T^{-1})$ when $S_T \le 0$, and $\mathcal O(\sigma_T^{-1}S_T)$ when $S_T > 0$. 

**Demonstrations**

Observe that, compare to the Lyapunov function of gradient descent, we had $z_t$ instead of $x_t$. 
We may first onsider the case when $\delta_t =0$ for all $t \in \N$. 
Review [Convex Proximal Point Method, Part I](../AMATH%20516%20Numerical%20Optimizations/Proximal%20Methods/Convex%20Proximal%20Point%20Method,%20Part%20I.md) and references therein for more information. 
Using a similar derivation the difference as in the case for the PPM analysis of Lyapunov function for gradient descent, giving $\forall t \in \N$

$$
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &= 
    \left(
        \sum_{i = 1}^{t+1} \tilde\eta_{i}
    \right) (h(z_{t + 1}) - h(x_*)) 
    - 
    \left(
        \sum_{i = 1}^{t} \tilde\eta_{i}
    \right) (h(z_{t}) - h(x_*)) 
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= 
    \tilde \eta_{t + 1} (h(z_{t + 1}) - h(z_*))
    +
    \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)(h(z_{t + 1}) - h(z_t))
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    &= \left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AG}} + \Upsilon_{1, t + 1}^{\text{AG}} \le \delta_{t + 1}. 
\end{aligned}
$$

Telescoping for $t = 0, \cdots, T- 1$
$$
\begin{aligned}
    \Phi_T - \Phi_0 = 
    \sum_{i = 0}^{T - 1}\Phi_{i + 1} - \Phi_i 
    &\le 
    \sum_{i = 0}^{T - 1}\delta_{i + 1}
    = S_{T}. 
\end{aligned}
$$
So then $\Phi_T - \Phi_0$ yields: 

$$
\begin{aligned}
    \sigma_T (h(z_T) - h(x_*)) 
    + \frac{1}{2}\Vert x_t - x_*\Vert^2 
    - \frac{1}{2}\Vert x_0 - x_*\Vert^2 
    &\le S_{T}
    \\
    \implies 
    \sigma_T(h(z_T) - h(x_*))
    &\le 
    S_T + \frac{1}{2}\Vert x_0 - x_*\Vert^2
    \\
    h(z_T) - h(x_*) &\le 
    \sigma_T^{-1}\left(
        S_{T} + \frac{1}{2}\Vert x_0 - x_*\Vert^2
    \right),
\end{aligned}
$$
which yields a convergence rate $\mathcal O(\sigma_T^{-1}S_{T})$. 
When $S_T = 0$, the convergence rate is $O(\sigma_T^{-1})$ instead. 


#### **Scenario 1 | Not Similar Triangle**
Recall the tri-point generic form comes updates the iterates according to

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
    ). 
\end{aligned}
$$

The first scenario starts by considering the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$. 
To start we observe that the vector $x_{t + 1} - x_t$ parallels to $z_{t + 1} - y_t$ because: 

$$
\begin{aligned}
    x_{t + 1} - x_t &= - \tilde \eta_{t + 1}\nabla f(y_t)
    \\
    z_{t +1} - y_t &= - L^{-1}\nabla f(y_t), 
\end{aligned}
$$

next we consider the upper bound of $\Upsilon_{1, t + 1}^{\text{AG}}$, with that we can simplify it: 

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
    &= 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + 
    \frac{\tilde \eta_{t + 1}L }{2} \Vert z_{t + 1} - y_t\Vert^2 
    - 
    \langle \tilde \eta_{t + 1} \nabla f(y_t),
        (x_{t + 1} - x_t) + x_t + (y_t - z_{t + 1}) - y_t
    \rangle
    \\
    &= 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + 
    \frac{\tilde \eta_{t + 1}L }{2} \Vert z_{t + 1} - y_t\Vert^2 
    - 
    \langle \tilde \eta_{t + 1} \nabla f(y_t),
        (L^{-1} - \tilde \eta_{t + 1}) \nabla f(y_t) + x_t - y_t
    \rangle
    \\
    &= 
    - \frac{1}{2}\Vert \tilde \eta_{t + 1} \nabla f(y_t)\Vert^2 
    + \frac{\tilde \eta_{t + 1} L}{2}\Vert L^{-1} \nabla f(y_t)\Vert^2 
    -
     \langle \tilde \eta_{t + 1} \nabla f(y_t),
        (L^{-1} - \tilde \eta_{t + 1}) \nabla f(y_t) + x_t - y_t
    \rangle
    \\
    &= 
    \left(
        -\frac{\tilde \eta_{t + 1}^2}{2} + 
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
Here when we groups the coefficient for $\Vert \nabla f(y_t)\Vert^2$ it has 

$$
\begin{aligned}
    &\quad 
    \left(
        \frac{\tilde \eta_{t + 1}}{2L} 
        - \frac{\tilde\eta_{t + 1}^2}{2}
    \right)
    + \tilde\eta_{t + 1}^2 
    - 
    \frac{\tilde\eta_{t + 1}}{L}
    \\
    &= 
    - \frac{\tilde\eta_{t + 1}}{2L}
    + 
    \frac{\tilde\eta_{t + 1}^2}{2}
    \\
    &= \frac{1}{2}(\tilde \eta_{t + 1}^2 - L^{-1}\tilde\eta_{t + 1}). 
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

Observe that the cross product term for $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$ doesn't match. 
Hence let's consider $y_t - x_t = L \eta_t (z_t - y_t)$ from the algorithm, we make the choice to do surgery on upper bound of $\Upsilon_{2, t + 1}^\text{AG}$, so $\langle \nabla f(y_t), y_t - x_t\rangle = \langle \nabla f(y_t), L \eta_t (z_t - y_t)\rangle$. 
With this in mind, applying the RHS of $[(*)]$ yields: 

$$
{\small
\begin{aligned}
    & \Upsilon_{1, t + 1}^{\text{AG}} + \left(
        \sum_{i=1}^{t}\tilde\eta_i 
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
        \sum_{i = 1}^{t}\tilde \eta_i 
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
        \frac{1}{2L}\sum_{i = 1}^{t}\tilde \eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \tilde \eta_{t + 1}\langle \nabla f(y_t), L\eta_t (z_t - y_t)\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
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
        \frac{1}{2L}\sum_{i = 1}^{t}\tilde \eta_i
    \right)\Vert \nabla f(y_t)\Vert^2
    + 
    \left(
        L\eta_t \tilde \eta_{t + 1} - \sum_{i = 1}^{t}\tilde \eta_i
    \right)
    \langle \nabla f(y_t), z_t - y_t\rangle. 
\end{aligned}
}
$$

In this scenario, we make the choice of $\tilde \eta_t = \eta_t$. 
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

To satisfies the equality, reader should verify that $\eta_{t} = (t - 1)/(2L)$ one of the options. And there are not many other options for the choice of the stepszies for the equality to be satisfied. 

##### **The algorithm it reduces to**
> With the choice of $\tilde \eta_{t} = \eta_t = t/(2L)$ in the definition of the Generic AG PPM form, we have the algorithm: 
> $$
> \begin{aligned}
>     x_{t + 1} &= x_t - \frac{t + 1}{2L} \nabla f(y_t), 
>     \\
>     z_{t + 1} &= y_t - L^{-1} \nabla f(y_t), 
>     \\
>     y_{t + 1} &= 
>     \left(
>         \frac{2}{t + 3}
>     \right)x_{t +1} + 
>     \left(
>         1 - \frac{2}{t + 3}
>     \right)z_{t + 1}. 
> \end{aligned}
> $$
> For the basecase, we make $y_0 = x_0$. 

**Observations**

If we set $t = -1$ onto the formulas, then we have $y_0 = x_0$, which gives the base case; 
so $z_0$ is undefined. 
Therefore the first three updates are $(y_0, x_0, z_0) = (x_0, x_0, x_0 - L^{-1}\nabla f(z_0))$. 

#### **Scenario 1.1 | Non-Smooth, Not Similar Triangle**

The analysis in the non-smooth case is surprisingly similar compare to the smooth case, this is due to the merit of the similarities between for the updates of the iterates. 
Recall that for the proximal gradient PPM generic form we have iterate updates for $t\in \N$: 

$$
\begin{aligned}
    y_t &= (1 + L\eta_t)^{-1}(x_t + L\eta_t z_t)
    \\
    x_{t + 1} &= x_t - \tilde \eta_{t + 1} \mathcal G_L(y_t)
    \\
    z_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t). 
\end{aligned}
$$

and generic Lyapunov upper bound 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^\text{AG}
    &= 
    \tilde\eta_{t + 1} (h(z_{t + 1}) - h(x_*)) + 
    \frac{1}{2} (
        \Vert x_{t + 1} - x_*\Vert^2
        - 
        \Vert x_t - x_*\Vert^2
    )
    \\
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + \frac{\tilde\eta_{t + 1}L}{2}\Vert z_{t + 1} - y_t\Vert^2
    - \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        x_{t + 1} - z_{t + 1}
    \rangle
    \\
    \Upsilon_{2, t + 1}^\text{AG}
    &= 
    h(z_{t + 1}) - h(z_t) 
    \le 
    \langle \mathcal G_L(y_t), z_{t + 1} - z_t\rangle + 
    \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}
$$

By the updates, vector $x_{t + 1} - x_t$ and $z_{t + 1} - y_t$ are parallel by observations 

$$
\begin{aligned}
    x_{t + 1} - x_t &= -\tilde\eta_{t + 1}\mathcal G_L(y_t), 
    \\
    z_{t + 1} - y_t &= -L^{-1}\mathcal G_L(y_t). 
\end{aligned}
$$

This setup allows for: 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^{\text{AG}} 
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 + 
    \frac{\tilde\eta_{t + 1}L}{2}\Vert z_{t + 1} - y_t\Vert^2 
    - 
    \langle \tilde\eta_{t + 1}\mathcal G_L (y_t), x_{t + 1} - z_{t + 1} \rangle
    \\
    &= 
    - \frac{1}{2}\Vert \tilde\eta_{t + 1} \mathcal G_L\Vert^2 + 
    \frac{\tilde\eta_{t + 1}L}{2}\Vert L^{-1} \mathcal G_L(y_t)\Vert^2
    - 
    \langle \tilde\eta_{t + 1} \mathcal G_L(y_t), x_{t + 1} - z_{t + 1} \rangle
    \\
    &= 
    \frac{1}{2}\left(
        - \tilde\eta_{t + 1}^2 + 
        L^{-1}\tilde\eta_{t + 1}
    \right)\Vert \mathcal G_L(y_t)\Vert^2
    - 
    \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        (x_{t + 1} - x_{t}) + x_t
        + (y_t - z_{t + 1}) - y_t
    \rangle
    \\
    &= 
    \frac{1}{2}\left(
        L^{-1}\tilde\eta_{t + 1}
        - \tilde\eta_{t + 1}^2
    \right)\Vert \mathcal G_L(y_t)\Vert^2
    - 
    \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        -\tilde\eta_{t + 1}\mathcal G_L(y_t) + x_t 
        + L^{-1}\mathcal G_L(y_t) - y_t
    \rangle
    \\
    &= 
    \frac{1}{2}\left(
        L^{-1}\tilde\eta_{t + 1}
        - \tilde\eta_{t + 1}^2
    \right)\Vert \mathcal G_L(y_t)\Vert^2
    - \langle 
        \tilde\eta_{t +1}\mathcal G_L(y_t), 
        (L^{-1} - \tilde\eta_{t + 1})\mathcal G_L(y_t) + x_t - y_t
    \rangle
    \\
    &= \frac{1}{2}\left(
        L^{-1}\tilde\eta_{t + 1} - \tilde\eta_{t + 1}^2 
        + 2 \tilde\eta_{t + 1}^2 - 2\tilde\eta_{t + 1}L^{-1}
    \right)\Vert \mathcal G_L(y_t)\Vert^2
    - 
    \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        x_t - y_t
    \rangle
    \\
    &= 
    \frac{1}{2}\left(
        \tilde\eta_{t + 1}^2 - \tilde\eta_{t + 1}L^{-1}
    \right)\Vert \mathcal G_L(y_t)\Vert^2 
    + \langle \tilde\eta_{t + 1} \mathcal G_L(y_t), y_t - x_t\rangle
\end{aligned}
$$

similarly we also have upper bound 

$$
\begin{aligned}
    \Upsilon_{2, t + 1}^{\text{AG}} 
    &= 
    \langle \mathcal G_L(y_t), z_{t + 1} - z_t\rangle + 
    \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \\
    &= 
    \langle \mathcal G_L(y_t), z_{t + 1} - y_t + y_t - z_t\rangle
    + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \\
    &= 
    \langle \mathcal G_L(y_t), - L^{-1} \mathcal G_L(y_t) + y_t - z_t\rangle
    + 
    \frac{L}{2}\Vert L^{-1}\mathcal G_L(y_t)\Vert^2
    \\
    &= 
    -L^{-1}\Vert \mathcal G_L(y_t)\Vert^2 
    + 
    (1/2)L^{-1}\Vert \mathcal G_L(y_t)\Vert^2 
    + 
    \langle \mathcal G_L(y_t), y_t - z_t\rangle
    \\
    &= 
    -(1/2)L^{-1}\Vert \mathcal G_L(y_t)\Vert^2
    + 
    \langle \mathcal G_L(y_t), y_t - z_t\rangle. 
\end{aligned}
$$

Observe that the cross product term for $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$ doesn't match. 
Hence let's consider the update for $y_t$, which can be written as $y_t - x_t = L \eta_t (z_t - y_t)$. We make the choice to do surgery on upper bound of $\Upsilon_{2, t + 1}^\text{AG}$, so $\langle \mathcal G_L(y_t), y_t - x_t\rangle = \langle \mathcal G_L(y_t), L \eta_t (z_t - y_t)\rangle$. 
With this in mind, applying the RHS of $[(*)]$ yields: 

$$
{\footnotesize
\begin{aligned}
    \Phi_{t + 1} - \Phi_t 
    &= \Upsilon_{1, t + 1}^\text{AG} + 
    \left(
        \sum_{i = 1}^{t}\tilde\eta_i 
    \right)\Upsilon_{1, t + 1}^{\text{AG}}
    \\
    &\le 
     \frac{1}{2}\left(
        \tilde\eta_{t + 1}^2 - \tilde\eta_{t + 1}L^{-1}
    \right)\Vert \mathcal G_L(y_t)\Vert^2 
    + 
    \langle \tilde\eta_{t + 1} \mathcal G_L(y_t), L\eta_t(z_t - y_t)\rangle
    + 
    \left(
        \sum_{i = 1}^{t}\tilde\eta_i 
    \right)\left(
        -(1/2)L^{-1}\Vert \mathcal G_L(y_t)\Vert^2
        + 
        \langle \mathcal G_L(y_t), y_t - z_t\rangle
    \right)
    \\
    &= 
    \left(
        \frac{1}{2}\tilde\eta_{t + 1}\left(
            \tilde \eta_{t +1} - L^{-1}
        \right)
        - 
        \frac{1}{2L}\sum_{i = 1}^{t}\tilde \eta_i
    \right)\Vert \mathcal G_L(y_t)\Vert^2 + 
    \left(
        L\eta_t \tilde \eta_{t + 1} - \sum_{i = 1}^{t}\tilde \eta_i
    \right)\langle \mathcal G_L(y_t), z_t - y_t\rangle. 
\end{aligned}
}
$$

<!-- If the algorithm were to have the abstract convergence rate, one of the sufficient condition is to have the above quantity less than or equal to zero, one sufficient condition of that is to have the coefficient for $\Vert \mathcal G_L(y_t)\Vert$ be $\le 0$, and the coefficient of the cross term $\langle \mathcal G_L(y_t), z_t - y_t\rangle$ be zero. 
Denote $\sigma_t = \sum_{i = 1}^{t} \tilde \eta_i$.
Simplifying it should yield the following relations: 

$$
\begin{aligned}
    \tilde \eta_{t + 1}(\eta_t + L^{-1}) - 
    L^{-1}\sigma_t
    &\le 0
    \\
    \iff 
    \tilde \eta_{t + 1}^2 
    &\le 
    L^{-1} \sigma_t + \tilde \eta_{t + 1} = L^{-1}\sigma_{t + 1}
    \\
    \iff 
    L\tilde \eta_{t + 1} &\le \sigma_{t + 1}
\end{aligned}
$$

and with $L\eta_t \tilde \eta_{t+ 1} - \sigma_t = 0$, it yeilds the system 

$$
\begin{aligned}
    \begin{cases}
        \tilde \eta_{t + 1}^2 \le L^{-1}\sigma_{t + 1} 
        & \forall t \in \{0\}\cup \N, 
        \\
        L\eta_t \tilde \eta_{t + 1} = \sigma_t
        & \forall t \in \N 
    \end{cases}
\end{aligned}
$$

A consequence of the above relations is 

$$
\begin{aligned}
    L \tilde \eta_{t + 1}^2 &\le \sigma_{t + 1}
    = \tilde \eta_{t + 1} + \sigma_t = \tilde \eta_{t + 1} + L\eta_t \tilde \eta_{t + 1}
    \\
    L\tilde \eta_{t + 1}^2 &\le 
    \tilde \eta_{t + 1} + L \eta_t \tilde \eta_{t + 1}
    \\
    L \tilde \eta_{t + 1} &\le 1 + L\eta_t. 
\end{aligned}
$$

To simplify, we make the assumption that $\tilde \eta_t = \eta_t$ for all $t \in \N$. 
These conditions translate to the following relations for $\eta_{t}$. 

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

To satisfy the equality, reader should verify that $\eta_{t} = (t - 1)/(2L)$ one of the options. And there are not many other options for the choice of the stepszies for the equality to be satisfied.  -->

**Remarks**

Without the simplifcation of $\tilde \eta_t = \eta_t$, the situation will be much more complex. 
The next section will try to relax and extend that assumption on the parameter. 

#### **Scenario 1.2 | Extended Analysis on the Stepsize Sequence Constraints**
The extended analysis focuses on the inequality and explore the alternative of using the assumption $\tilde \eta_t = \eta_t$ for all $t$. 
To eliminate such a assumption in the proof, it requres to quantify the coefficient of $\Vert \mathcal G_L(y_t)\Vert^2$ during the iterations. 
To do that we make another sequence $\epsilon_i$ for $i \in \N$. 
Then we have the system of equalities:

$$
\begin{aligned}
    \begin{cases}
        \tilde \eta_{t + 1} (\tilde \eta_{t + 1} - L^{-1})
        - L^{-1} \sum_{i= 1}^{t}\tilde \eta_i 
        = 
        \epsilon_{t + 1} \tilde \eta_{t + 1}
        & \forall t \in \N, 
        \\
        L \eta_t \tilde \eta_{t + 1} = \sum_{i=1}^{t}\tilde \eta_i 
        & \forall t \in \N. 
    \end{cases}
\end{aligned}
$$

It requires base case $L\eta_0\tilde\eta_{1} = 0$, assume $\sigma_0 = 0$. 
To ease the notation we use $\sum_{i = 1}^t \tilde \eta_i = \sigma_t$, simplifying the first equation using the second equation gives: 

$$
\begin{aligned}
    \tilde \eta_{t + 1} (\tilde \eta_{t + 1} - L^{-1})
    - L^{-1} \sigma_t
    &= 
    \epsilon_{t + 1} \tilde \eta_{t + 1}
    \\
    \iff 
    \tilde \eta_{t + 1} ^2 - L^{-1} \tilde \eta_{t + 1} 
    &= 
    \epsilon_{t + 1} \tilde \eta_{t + 1} + L^{-1} \sigma_t
    \\
    &= 
    \epsilon_{t + 1} \tilde \eta_{t + 1} 
    + L^{-1}(L \eta_t \tilde \eta_{t + 1})
    \\
    \iff 
    \tilde \eta_{t + 1} &= \epsilon_{t + 1} + \eta_t + L^{-1}. 
\end{aligned}
$$
At the last step, we divided both side of the equation by $\tilde \eta_{t + 1} > 0$.
The parameter gives relation $\epsilon_{t+1} = \tilde \eta_{t + 1} - \eta_t - L^{-1}$. 
Hence, it gives us the following system of equality to work with 

$$
\begin{aligned}
    \forall t \in \N: 
    \begin{cases}
        \tilde \eta_{t + 1} = \epsilon_{t + 1} + \eta_t + L^{-1}, 
        \\
        L \eta_t \tilde \eta_{t + 1} = \sigma_t.     
    \end{cases}
\end{aligned}
$$

With that, we can solve a relation between $\eta_{t + 1}$ in terms of the sequence $\epsilon$ and $\eta_t$.
Consider the equality 

$$
\begin{aligned}
    L \sigma_{t + 1} &= L \tilde \eta_{t + 1} + L \sigma_t
    \\
    &=
    L \tilde \eta_{t + 1}  + L (L \eta_t \tilde \eta_{t + 1})
    \\
    &= L \tilde \eta_{t+ 1} + L \eta_t (L \tilde \eta_{t + 1})
    \\
    &=  L \tilde \eta_{t+ 1} + L \eta_t (L \epsilon_{t + 1} + L \eta_t + 1)
    \\
    &=  L \tilde \eta_{t+ 1} + L \eta_t (L \eta_t + 1) + L^2 \eta_t \epsilon_{t + 1}
    \\
    &= L (\epsilon_{t +1} + \eta_t + L^{-1}) + L\eta_t(L \eta_t + 1) + L^2\eta_t \epsilon_{t + 1}
    \\
    &= L \epsilon_{t + 1} + (L\eta_t + 1)^2 + L^2\eta_t \epsilon_{t + 1}
    \\
    &= 
    L \epsilon_{t + 1}(1 + L \eta_t) + (1 + L \eta_t)^2. 
\end{aligned}
$$

At the same time only using the first equality we have: 

$$
\begin{aligned}
    L \sigma_{t + 1} &= L^2 \eta_{t + 1}\tilde \eta_{t + 1} 
    \\
    &= L\eta_{t + 1}(1 + L \eta_{t + 1} + \epsilon_{t + 2})
    \\
    &= L\eta_{t + 1}(1 + L \eta_{t + 1}) + \epsilon_{t + 2}L\eta_{t + 1}. 
\end{aligned}
$$

Therefore, it generates the following equation: 

$$
\begin{aligned}
    L\eta_{t + 1} (1 + L \eta_{t + 1}) 
    + 
    \epsilon_{t + 2} L \eta_{t + 1} 
    &= 
    L\epsilon_{t + 1}(1 + L \eta_t)  + (1 + L\eta_t)^2
    \\
    (L\eta_{t + 1} + L^2\eta_{t + 1}^2)
    + 
    \epsilon_{t + 2} L \eta_{t + 1} 
    + 
    \frac{1}{4}
    &= 
    L\epsilon_{t + 1}(1 + L \eta_t)  + (1 + L\eta_t)^2
    + 
    \frac{1}{4}
    \\
    (L\eta_{t + 1} + L^2\eta_{t + 1}^2 + 1/4)
    + 
    \epsilon_{t + 2} L \eta_{t + 1} 
    + \epsilon_{t + 2}
    &= 
    L\epsilon_{t + 1}(1 + L \eta_t)  + (1 + L\eta_t)^2
    + \frac{1}{4}
    + \epsilon_{t + 2}
    \\
    (L\eta_{t + 1} + 1/2)^2 + \epsilon_{t + 2}(L \eta_{t + 1} + 1)
    &= 
    L \epsilon_{t + 1}(1 + L \eta_t) + (1 + L\eta_t)^2
    + \frac{1}{4} + \epsilon_{t + 2}
    \\
    \text{ with: } & a_t = 1 + L \eta_t = \tilde \eta_{t + 1} - \epsilon_{t + 1}
    \\
    (a_{t + 1} - 1/2)^2 + \epsilon_{t + 2}a_{t + 1}
    &= 
    L \epsilon_{t + 1}a_t + a_t^2 + 1/4 + \epsilon_{t + 1}
    \\
    a_{t + 1}^2 + 1/4 - a_{t + 1} + \epsilon_{t + 2}a_{t + 1}
    &= 
    L \epsilon_{t + 1}a_t + a_t^2 + 1/4 + \epsilon_{t + 1}
    \\
    a_{t + 1}^2 + a_{t + 1}(\epsilon_{t + 2} - 1)
    &= 
    \underbrace{
        a_t(L \epsilon_{t + 1} + a_t) + \epsilon_{t + 1}
    }_{c_{t + 1}}. 
\end{aligned}
$$

Solving reveals the relations: 

$$
\begin{aligned}
    \begin{cases}
        a_{t + 1} = (1/2)\left(
        1 - \epsilon_{t + 2} + \sqrt{(1 - \epsilon_{t + 2}) + 4 c_{t + 1}}
        \right), 
        \\
        c_{t + 1} = a_t (L \epsilon_{t + 1} + a_t) + \epsilon_{t + 1}. 
    \end{cases}
\end{aligned}
$$

Observe that in the case where we choose $\epsilon_t = 0 \forall t \in \N$, the above relation simplifies to 

$$
\begin{aligned}
    a_{t + 1} &= (1/2)\left(
        1 + \sqrt{1 + 4 c_{t + 1}}
    \right), 
    \\
    c_{t + 1} &= a_t^2. 
\end{aligned}
$$

This relation is the Famous Nesterov momentum sequence. 
At the same time, we can analyize the convergence rate of the algorithm by the abstract convergence lemma, producing: 

$$
\begin{aligned}
    \Phi_{t + 1} - \Phi_t =
    \Upsilon_{1, t + 1}^\text{AG} + 
    \sigma_t\Upsilon_{1, t + 1}^{\text{AG}} 
    &\le \epsilon_{t + 1}\eta_{t + 1} \Vert \mathcal G_L(y_t)\Vert^2 \le \delta_{t + 1}
\end{aligned}
$$

Telescoping yields: 

$$
\begin{aligned}
    S_{T} = 
    \sum_{i = 0}^{T- 1} \delta_i 
    &= 
    \sum_{i = 0}^{T - 1} \epsilon_{i + 1}\tilde\eta_{i + 1}\Vert \mathcal G_L(y_i)\Vert^2
    \\
    &\le \sum_{i = 0}^{T - 1}\max(\epsilon_{i + 1} \tilde\eta_{i + 1}\Vert \mathcal G_L(y_i)\Vert^2, 0). 
\end{aligned}
$$

Under an ideal case where we wish to attain accelerations, we want $\lim_{T \rightarrow \infty} S_T < \infty$. 
One way to accomplish is choose the error sequence $\epsilon_i, i \in \N$ to be bounded by for all $i \in \N$, $\epsilon_i$ should satisfy: 

$$
\begin{aligned}
    \epsilon_{i + 1}\tilde \eta_{i + 1}
    \Vert \mathcal G_L(y_i)\Vert^2 
    &\le \delta_{i + 1}
    \\
    \iff 
    \epsilon_{i + 1}
    &\le 
    \frac{\delta_{i + 1} }{\tilde\eta_{t + 1}\Vert \mathcal G_L(y_i)\Vert^2}. 
\end{aligned}
$$

for any $\sum_{i = 0}^{T - 1}\delta_{i + 1}$ converges to a limit as $T \rightarrow \infty$. 


#### **Scenario 2 | Similar Triangle I**
This similar triangle approach will recover the original Nesterov acceleration sequence method proposed back in 1983. 
It is called a similar triangle approach because it employed the following conditions on top of the Triangular Generic Form of AG: $\tilde\eta_{t + 1} = \eta_t + L^{-1}$. 
This stepsize allows us to change updates so that $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, $\mathcal G_L(y_t)$ is now nullified. 
To start, substituting the definition of $z_{t +1} = z_{t} - L^{-1}\mathcal G_L(y_t), z_t$ into the above expression then we have: 

$$
\begin{aligned}
    x_{t + 1} 
    &= 
    z_{t + 1}  + L\eta_t (z_{t + 1} - z_t)
    \\
    &= (y_t - L^{-1}\mathcal G_L(y_t))
    + L \eta_t (y_t - L^{-1}\mathcal G_L(y_t) - z_t)
    \\
    &= (y_t - L^{-1}\mathcal G_L(y_t))
    + L \eta_t y_t - \eta_t \mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= 
    (1 + L\eta_t)y_t - (\eta_t + L^{-1})\mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= \eta_t Lz_t + x_t -(\eta_t + L^{-1}) \mathcal G_L(y_t)  - L\eta_t z_t
    \\
    &= x_t - (\eta_t + L^{-1})\mathcal G_L(y_t). 
\end{aligned}
$$

This new choice for $\tilde \eta, \eta$ conveys the following updates: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \mathcal G_L(y_t) 
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

this algorithm will allows us to reduce to the classical form of Accelerated Gradient by 

$$
\begin{aligned}
    y_{t + 1} &= (1 + L\eta_{t + 1})^{-1} (x_{t + 1} + L\eta_{t + 1}z_{t + 1})
    \\
    &= (1 + L\eta_{t + 1})^{-1} (
        z_{t + 1} + L\eta_t (z_{t + 1} - z_t) + L\eta_{t + 1} z_{t + 1}
    )
    \\
    &= 
    (1 + L\eta_{t + 1})^{-1} (
        (1 + L\eta_{t + 1})z_{t + 1} + L\eta_t(z_{t + 1} - z_t)
    )
    \\
    &= z_{t + 1} + (1 + L\eta_{t + 1})^{-1}L\eta_t (z_{t + 1} - z_t), 
\end{aligned}
$$

which allows us to get rid of $x_{t + 1}$, simplifying it into the classical acceleration form: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \mathcal G_L f(y_t)
    \\
    y_{t + 1} &= z_{t + 1} + (1 + L\eta_{t + 1})^{-1}L\eta_t (z_{t + 1} - z_t). 
\end{aligned}
$$

#### **Remarks**

It is possible to try weaken it by introducing $\delta \ge 0$ and $\tilde \eta_{t + 1} = \eta_t + L^{-1} + \delta_t$. 
Carry the same derivation with the new error term yields: 

$$
\begin{aligned}
    x_{t+1} &= 
    x_t - \tilde \eta_{t + 1} \mathcal G_L(y_t)
    \\
    &= L\eta_t z_t + x_t - \tilde \eta_{t + 1}\mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= (1 + L\eta_t)y_t - \tilde \eta_{t + 1} \mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= 
    (1 + L\eta_t) y_t - (\eta_t + L^{-1} + \delta_t)\mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= \left(
        y_t - L^{-1}\mathcal G_L(y_t)
    \right) + L\eta_t y_t
    - (\eta_t + \delta_t) \mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= z_{t + 1} + L\eta_t \left(
        y_t - (1 + \eta_t^{-1}\delta_t)L^{-1}\mathcal G_L(y_t) - z_t
    \right)
    \\
    &= 
    z_{t + 1} + L\eta_t \left(
        z_{t + 1} - \eta_t^{-1}\delta_t \mathcal G_L(y_t) - z_t
    \right)
    \\
    &= 
    z_{t + 1} + L\eta_t(z_{t + 1} - z_t) - L\delta_t \mathcal G_L(y_t), 
\end{aligned}
$$

where, the same momentum updates for $x_{t + 1}$ appeared with the error term $L\delta_t \mathcal G_L(y_t)$ at the end. 
This type of error term allows us to re-use the same proof for the convergence rate for the Nesterov accelerated gradient, but the error will later manifested into the $\epsilon_t$ error term in the abstract Lyapunov convergence proof. 


##### **The similar triangle geometry**
> At each step of the momentum algorithm, we have triangle $(y_t, z_t, z_{t + 1})$ and triangle $(x_t, z_t, x_{t + 1})$ similar to each other. 

**Demonstration**

1. Observe that $y_t = (1 + L\eta_t)^{-1}(x_t + L\eta_t z_t)$ is a convex combination between $x_t, z_t$. Hence $z_t, y_t, x_t$ are three collinear points. Additionally, we have $y_t - x_t = L\eta_t (z_t - y_t)$, hence $\Vert y_t - x_t\Vert/\Vert z_t - y_t\Vert = L\eta_t$. 
1. By the algorithm, we have $z_{t + 1} - y_t = - L^{-1} \mathcal G_L(y_t)$, and $x_{t + 1} - x_t = - \tilde \eta_{t + 1} \mathcal G_L(y_t)$, hence vector $z_{t + 1} - y_t$ parallels to $x_{t + 1} - x_t$. 
2. Finally, with update $x_{t +1} - z_{t + 1} = L\eta_t (z_{t +1} - z_t)$, we have three colinear points $(z_t, z_{t + 1}, x_t)$ with $\Vert z_{t + 1} - z_t\Vert/\Vert z_{t +1 } - z_t\Vert = L\eta_t$. 

From the above results, we can conclude that triangle $(y_t, z_t, z_{t + 1})$ is similar to $(x_t, z_t, x_{t + 1})$ because they share colinear points $z_t, y_t, x_t$ and $z_t, z_{t + 1}, x_{t + 1}$, and their sides $z_{t + 1} - y_t$ parallels to $x_{t + 1} - z_t$. 

The visual understanding of the situation allows us to duduce the upper bound because it creates a different way of eliminating the cross terms in the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$. 
The next claim will clarify the sitaution. 

#### **Claim 1.1 | Recovering nesterov original form**
> With the choice of $\tilde\eta_{t + 1} = \eta_t + L^{-1}$ and the AG proximal gradient generic tri-points form, we will be able to recover the classical Nesterov acceleration algorithm which is first proposed back in 1983. 
> This interpretation links the stepsize choices of $\eta_t$ with the momentum stepsize choices, providing extensive amount of intutions. 

**Demonstrations**

Start with the consideration of Lypunov analysis on PPM formulation of the Accelerated gradient. 
With $x_{t +1} - x_t = L\tilde\eta_{t+1}(z_{t + 1} - y_t)$ from the updates of $y_t$, we have 

$$
\begin{aligned}
    \Upsilon_{1, t + 1}^\text{AG} &\le 
   - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + \frac{\tilde\eta_{t + 1}L}{2}\Vert z_{t + 1} - y_t\Vert^2
    - \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        x_{t + 1} - z_{t + 1}
    \rangle
    \\
    &= 
    - \frac{1}{2}\Vert L \tilde \eta_{t+1} (z_{t+1} - y_t)\Vert^2 + 
    \frac{\tilde\eta_{t +1}L}{2}\Vert z_{t+1} - y_t\Vert^2
    - \langle 
        \tilde\eta_{t + 1} \mathcal G_L(y_t), 
        x_{t + 1} - z_{t + 1}
    \rangle
    \\
    &= 
    \left(
        \frac{L^2\tilde\eta_{t + 1}^2}{2}
         + 
        \frac{\tilde \eta_{t +1}}{2}
    \right)
    \Vert z_{t+1} - y_t\Vert^2
    - 
    \langle 
        \tilde \eta_{t+ 1} \mathcal G_L(y_t), x_{t+1} - z_{t+1}
    \rangle. 
\end{aligned}
$$

This completes the analysis for $\Upsilon_{1, t + 1}^\text{AG}$ with $\tilde\eta_{t+1}$. 
With the relations $x_{t +1} - z_{t + 1} = L\eta_t (z_{t +1} - z_t)$ in mind, we consider 
$$
\begin{aligned}
    \Upsilon_{2, t + 1}^{\text{AG}} 
    &\le 
    \langle \mathcal G_L(y_t), z_{t + 1} - z_t\rangle
    + 
    \frac{L }{2} \Vert z_{t+1} - y_t\Vert^2
    \\
    &= 
    \langle \mathcal G_L(y_t), L^{-1}\eta_t^{-1}(x_{t+1} - z_{t + 1})\rangle
    + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2. 
\end{aligned}
$$

Here, we made use of the assumption that $\tilde \eta_{t + 1} = \eta_t + L^{-1}$, it allowed for updates $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, as demonstrated previously. 
Therefore, the upper bound for the Lyapunov function evaluates to 

$$
\begin{aligned}
    & \Upsilon_{1, t + 1}^{\text{AG}} + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)\Upsilon_{2, t + 1}^{\text{AG}}
    \\
    & \le 
    \left(
        - \frac{L^2\tilde \eta_{t + 1}^2}{2}
        + \frac{\tilde\eta_{t+1}L}{2}
    \right)
    \Vert z_{t+1} - y_t\Vert^2
    - 
    \langle \tilde \eta_{t+1} \mathcal G_L(y_t), x_{t+1} - z_{t + 1}\rangle
    \\
    & \qquad + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)\left(
        \langle \mathcal G_L(y_t), L^{-1}\eta_t^{-1}(x_{t+1} - z_{t + 1})\rangle
        + \frac{L}{2}\Vert z_{t + 1} - y_t\Vert^2
    \right)
    \\
    &= 
    \frac{L}{2}
    \left(
       -\tilde\eta_{t + 1}^2 + \tilde\eta_{t + 1}
        + \sum_{i = 1}^{t}\tilde\eta_i
    \right)\Vert z_{t + 1} - y_t\Vert^2
    +
    \left(
        L^{-1}\eta_t^{-1} 
        \left(
            \sum_{i = 1}^{t}\tilde \eta_i
        \right)
        -
        \tilde \eta_{t + 1}
    \right)\langle \mathcal G_L (y_t), x_{t + 1} - z_{t + 1}\rangle
\end{aligned}\tag{$[*]$}
$$
The above quantity are required to be $\le 0$ for the convergence generic convergence results for accelerated gradient method. 
One sufficient conditions allows for the non-positivity of the quantity is for the coefficient of the term $\Vert z_{t+1} - y_t\Vert^2$ to be $\le 0$, producing for all $t$: 
$$
\begin{aligned}
    - \frac{1}{2}\left(
        L^2 \tilde\eta_{t+1}^2 - \tilde\eta_{t+1}L 
    \right) + 
    \frac{L}{2}\left(
        \sum_{i = 1}^{t} \tilde \eta_i
    \right) &\le 0
    \\
    - \left(
        L\tilde \eta_{t + 1}^2 
        - 
        \tilde\eta_{t + 1}
    \right) + 
    \sum_{i = 1}^{t}\tilde \eta_i 
    &\le 0
    \\
    -L \tilde \eta_{t+1}^2 + 
    \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &\le 0
    \\
    \sum_{i = 1}^{t + 1}\tilde \eta_i 
    &\le L \tilde \eta_{t + 1}^2. 
\end{aligned}
$$

We would also want the coefficient for the cross product term to be zero in $[(*)]$ making: 

$$
\begin{aligned}
    -\tilde \eta_{t + 1} + 
    \left(
        \sum_{i = 1}^{t}\tilde \eta_i
    \right)L^{-1}\eta_t^{-1} 
    &= 0
    \\
    \sum_{i = 1}^{t}\tilde \eta_i 
    &= 
    L \eta_t \tilde \eta_{t + 1}. 
\end{aligned}
$$

This creates the following set of constraints for the step size sequence $\eta_i, \tilde \eta_i$ for all $i \in \N\cup \{0\}$: 

$$
\begin{aligned}
    \begin{cases}
        \sigma_t = \sum_{i = 1}^{t}\tilde \eta_i  & \forall t \in \N,
        \\
        \sigma_{t + 1} \le L \tilde \eta_{t + 1}^2 & \forall t \in \N \cup \{0\}
        \\
        \sigma_t = L\eta_t \tilde \eta_{t + 1} & \forall t \in \N
    \end{cases}
\end{aligned}
$$
Observe that, $\tilde \eta_{t + 1}$ is defined with the inequality, and $\sigma_{t + 1}$. 
Hence, recursively, $\tilde\eta_{i}$ for $i = 1, \cdots, t$ is sufficient to define both $\tilde \eta_{t + 1}$, $\{\eta_i : i =1, \cdots, t\}$. 
Alternatively, if we know $\{\eta_i: i = 0, \cdots, t\}$, then it defines the sequence $\tilde \eta_{i}$ for $i = 1, \cdots, t + 1$. 
It's sufficient to establish exactly one of the sequences: $\eta_i$, or $\tilde \eta_{i}$. 
Substituting the third equality into the second inequality: 

$$
\begin{aligned}
    \sigma_{t + 1} 
    &\le L\tilde \eta_{t + 1}^2
    \\
    \tilde \eta_{t + 1} + \sigma_t
    &\le L \tilde \eta_{t + 1}^2
    \\
    \tilde \eta_{t + 1} + L\eta_t \tilde \eta_{t + 1}
    &\le L \tilde \eta_{t + 1}^2
    \\
    1 + L\eta_t &\le L \tilde\eta_{t + 1}. 
\end{aligned}
$$
We can divide by $\eta_t$ because it's assumed to be strictly larger than zero. 
Unfortunately, recall that assumption used $\tilde \eta_{t + 1} = \eta_t + L^{-1}$ to derive the inequality, which is equivalent to the above inequality being equal. 
So that gives equality: 

$$
\begin{aligned}
    1 + L\eta_{t} &= L \tilde \eta_{t + 1}. 
\end{aligned}
$$

Finally, to recover the momentum stepsizes for the classical Nesterov accelerated gradient, we consider the following: 
$$
\begin{aligned}
    L \sigma_{t + 1}
    &= L \tilde \eta_{t + 1} + L \sigma_{t}
    \\
    &= 
    L \tilde \eta_{t + 1} + L (L \eta_t \tilde \eta_{t + 1}) 
    \\
    &= 
    L \tilde \eta_{t + 1} + L \eta_t (L  \tilde \eta_{t + 1}) 
    \\
    &=
    L \tilde \eta_{t + 1} + L \eta_t (L \eta_t + 1)
    \\
    &= L (\eta_t + L^{-1}) + L\eta_t (L \eta_t + 1)
    \\
    &= (L\eta_t + 1)^2, 
\end{aligned}
$$

Simultaneously, with the equality we have 

$$
\begin{aligned}
    L \sigma_{t + 1}
    &= L^2 \eta_{t + 1} \tilde \eta_{t + 2}
    \\
    &= L \eta_{t + 1}(1+ L \eta_{t + 1}), 
\end{aligned}
$$

combining yields: 

$$
\begin{aligned}
    (L\eta_t + 1)^2 
    &= L\eta_{t + 1}(1 + L \eta_{t + 1})
    \\
    &= L\eta_{t + 1} + L^2 \eta_{t + 1}^2
    \\
    \iff 
    (L\eta_t + 1)^2 + 1/4 &=
    1/4 + 2(1/2)L \eta_{t + 1} + (L \eta_{t + 1})^2
    \\
    \iff 
    (L\eta_t + 1)^2 + 1/4 &= 
    (L \eta_{t + 1} + 1/2)^2. 
\end{aligned}
$$

With $a_t = L\eta_t + 1 = L \tilde \eta_{t + 1}$, consider the special case where it's an equality: 
$$
\begin{aligned}
    a_t^2 + 1/4 &= (a_{t + 1} - 1/2)^2 
    \\
    a_t^2 + 1/4 &= a_{t + 1}^2 + 1/4 - a_{t + 1}
    \\
    a_t^2 + a_{t + 1} &= a_{t + 1}^2. 
    \\
    \implies 
    a_{t + 1} &= 
    \frac{1 + \sqrt{1 + 4a_t^2}}{2}
\end{aligned}
$$

Recall that the momentum coefficients as described through the PPM is: 

$$
\begin{aligned}
    (1 + L \eta_{t+ 1})^{-1}L\eta_t = L\eta_t / a_{t + 1} = (a_t - 1)/a_{t + 1}. 
\end{aligned}
$$

And this is a full recovery of the Nesterov sequence. 
Finally, we present equivalent forms of the algorithms using the obtained sequence. 
The abstract convergence rate of $\mathcal O\left(\left(\sum_{i = 1}^{T}\tilde \eta_{i}\right)^{-1}\right)$ now links to the growth rate of the parameter $a_t$ via relation $a_t = L \tilde \eta_{t + 1}$. 

**Remarks**

This derivation only leave a single choice for the stepsize parameter. 
In this derivation we used the equality to derive the upper bound for the Lyapunov function. 
Therefore, there is only one single choice for the stepsize parameter at the end, if we are not involving any type of errors. 


#### **Scenario 3 | Similar triangle II**

In the previous scenario II, we choose the stepsize so that $x_{t + 1}$ can be projected into the correct position by $z_{t + 1}$ to allow colinearity for points $z_t, x_{t +1}, x_{t + 1}$. 
In this scenario, we choose the stepsize so that $z_{t +1}$ is a convex combinations of the point $x_{t+1}, z_t$, so that we still have the similar triangle as in the previous scenario. 


---
### **Some more nuanced results**

Results in this part are not coming from literatures, and they are my own works at testing the ideas presented by Ahn and in their works. 
Before we start, we list some of the specific type of accelerated gradient method. 
In any cases below, we are optimizing with convex functions. 

#### **Def 2.1 | Chambolle Dossal (2015)**
> When $f$ is differentiable and convex, we define the following algorithm 
> $$
> \begin{aligned}
>     z_{n + 1} &= y_n - L^{-1}\mathcal G_L(y_n)
>     \\
>     x_{n + 1} &= z_n + t_{n +1} (z_{n + 1} - z_n), 
>     \\
>     y_{n + 1} &= \left(
>         1 - \frac{1}{t_{n + 1}}
>     \right)z_{n + 1} + \left(
>         \frac{1}{t_{n + 1}}
>     \right)x_{n + 1}
> \end{aligned}
> $$
> where $t_n = (n + a - 1)/a$ for all $a > 2$. 
> Then the above algorithm is a form of accelerated gradient where the iterates converges to a minimizer. 


**Remarks**

In the context of Chambolle, Dossal, the gradient descent step for $z_{n + 1}$ is produced by the forward backward splitting operator of the gradient of sum of smooth non-smooth function. 


#### **Def 2.2 | Ryu's chapter 12**
> In chapter 12 of Ryu's book, an accelerated gradient method is presented as 
> $$
> \begin{aligned}
>     z_{t + 1} &= y_t + L^{-1}\nabla f(y_t), 
>     \\
>     x_{t + 1} &= x_t + (t + 1)(2L)^{-1}\nabla f(y_t), 
>     \\
>     y_{t + 1} &= \left(
>         1 - \frac{2}{t + 2} 
>     \right)z_{t + 1} + 
>     \left(
>         \frac{2}{t + 2}
>     \right)x_{t + 1}. 
> \end{aligned}
> $$

**Observations**

It is important to talk about the initial conditions of the algorithm. 
This algorithm is equivalent to the algorithm discussed scenario I, not a similar triangule. 


#### **Claim 2.3 | Ryu's variant is part of the framework**
> The algorithm list in the previous definition is a special case of the generic algorithm with the stepsize choice $\tilde \eta_{t} = \frac{t}{2L}, \eta_t = (t - 1)/(2L)$. 
> As a consequence we also have $\epsilon_t = 0$ for all $t \in \N$ hence the convergence results for the generic algorithm applies here as well. 

**Proof**

Firstly observe that the choice of stepsize makes it similar triangle algorithm because 

$$
\begin{aligned}
    L^{-1} + \eta_t 
    &= 
    L^{-1} + \frac{t - 1}{2L}
    \\
    &= \frac{t + 1}{2L}
    \\
    &= \tilde \eta_{t + 1}. 
\end{aligned}
$$

Which satisfies relations for a similar triangle algorithm. 

**Remark**

We show that it doesn't directly satisfies the conditions for the PPM stepszies $\eta_i, \tilde \eta_i$ for our generic convergence lemma. 
To show that it amounts to verify the relations 

$$
\begin{aligned}
    \begin{cases}
        \tilde \eta_{t + 1} (\tilde \eta_{t + 1} - L^{-1})
        - L^{-1} \sum_{i= 1}^{t}\tilde \eta_i 
        = 
        0
        & \forall t \in \N, 
        \\
        L \eta_t \tilde \eta_{t + 1} = \sum_{i=1}^{t}\tilde \eta_i 
        & \forall t \in \N. 
    \end{cases}
\end{aligned}
$$

For simplicity we let $\sigma_t = \sum_{ i =1}^{t}\tilde \eta_i$. 
The two equalities are algebraically equivalent in our context because 

$$
\begin{aligned}
    \tilde \eta_{t + 1}(\tilde \eta_{t + 1} - L^{-1}) 
    - L^{-1}\sigma_t &= 0
    \\
    \iff 
    \tilde \eta_{t + 1}\eta_t &= L^{-1}\sigma_t. 
\end{aligned}
$$

Hence it only requires to verify the equality $\tilde \eta_{t + 1}\eta_t = L^{-1} \sigma_t$. 
With that we have 

$$
\begin{aligned}
    \sigma_t &= \sum_{i = 1}^{t} \frac{i}{2L}
    \\
    &= \frac{1}{2L}\left(
        \frac{t(t + 1)}{2}
    \right)
    \\
    &= \frac{t(1 + t)}{4L}
    \\
    \iff 
    L^{-1}\sigma_t &= 
    \frac{t(1 + t)}{4L^2}
\end{aligned}
$$

By definition of the stepsizes the LHS of the equality evaluates to

$$
\begin{aligned}
    \tilde \eta_{t + 1} \eta_{t}
    &= \frac{t + 1}{2L} \frac{t - 1}{2L} 
    \\
    &= \frac{t^2 - 1}{4L^2}. 
\end{aligned}
$$

Not hard to see that 

$$
\begin{aligned}
    L\eta_t \tilde \eta_{t + 1} - \sigma_t 
    &= \frac{-t - 1}{4L} \le 0. 
\end{aligned}
$$

Which is weird. 
We suspect that Ryu's Lypunov function is just a better option than the one we used for deriving the convergent rates. 


#### **Claim 2.4 | Chambolle Dossal is also part of the framework**
> The AG algorithm proposed in Chambolle Dossal's writing is an example of the Generic algorithm such that the stepsize $L\eta_n = t_n - 1$, and $\tilde \eta_{n + 1} = L^{-1} + \eta_n$, hence the similar triangle condition is satisfied and the stepsize sequence $t_n = (n + a - 1)/a$ for all $a> 0$. 

**Demonstrations**

Since the setpesize satisfies $\tilde \eta_{n + 1} = L^{-1} + \eta_n$, the generic form admits similar triangle representation: 

$$
\begin{aligned}
    x_{n + 1} &= 
    z_{n + 1} + L\eta_n(z_{n + 1} - z_n)
    \\
    z_{n + 1}&= y_n - L^{-1}\mathcal G_L(y_n)
    \\
    y_{n + 1} &= 
    (1 + L\eta_{n + 1})^{-1}(L\eta_{n + 1} z_{n + 1} + x_{n + 1}). 
\end{aligned}
$$

Substitute $L\eta_n = t_n - 1$ then it yields 

$$
\begin{aligned}
    x_{n + 1} &= 
    (1 + L\eta_n) z_{n + 1} - L\eta_n z_n
    \\
    & = 
    t_n z_{n + 1} + (1 - t_n) z_n 
    \\
    &= z_n + t_n(z_{n +1} - z_n)
    \\
    y_{n + 1} &= (1 + L\eta_{n + 1})^{-1} (L\eta_{n + 1} z_{n + 1} + x_{n + 1})
    \\
    &= t^{-1}_{n + 1} ((t_{n + 1} - 1)z_n + x_{n + 1})
    \\
    &= (1 - t_{n + 1}^{-1})z_{n + 1} + t^{-1}x_{n + 1}. 
\end{aligned}
$$

The similar triangle condition is automatically satisfied by the definition of the stepsize. 

**Remark**

The sequence proposed, $\eta_n = (n - 1)/(aL)$, for $a > 2$, doesn't satisfy the equality: 

$$
\begin{aligned}
    L \eta_n\tilde \eta_{n + 1} \neq \sum_{i = 1}^{n}\tilde \eta_i. 
\end{aligned}
$$

That, is very interesting. 
Chambolle Dossal 2015 is breaking the conditions we established prior. 
We have no choice, but we can 
1. characterize the error between these 2 quantities based on a specific conditions for the stepszies parameters $t_n$ proposed in the literatures. 
2. Describe the sequence conditions (10) in Chambolle Dossal using the PPM stepsize parameters. 


