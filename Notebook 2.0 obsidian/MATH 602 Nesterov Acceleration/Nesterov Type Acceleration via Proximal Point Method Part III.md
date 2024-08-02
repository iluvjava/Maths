- [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md)


---
### **Intro**

This file directly continue from the previous part. 
It's split to reduce lags on the inefficient web based frameworks that renders markdown katex in real time. 

#### **ToC For Viewing with VS Code**
- [**Intro**](#intro)
  - [**ToC For Viewing with VS Code**](#toc-for-viewing-with-vs-code)
- [**Deriving Convergences of AG Variants From the Lyapunov Upper Bounds**](#deriving-convergences-of-ag-variants-from-the-lyapunov-upper-bounds)
  - [**Theorem | Generic Convergence Bound based on PPM Interpretation**](#theorem--generic-convergence-bound-based-on-ppm-interpretation)
  - [**Scenario 1 | Not Similar Triangle**](#scenario-1--not-similar-triangle)
    - [**The algorithm it reduces to**](#the-algorithm-it-reduces-to)
  - [**Scenario 1.1 | Non-Smooth, Not Similar Triangle**](#scenario-11--non-smooth-not-similar-triangle)
  - [**Scenario 2 | Similar Triangle I**](#scenario-2--similar-triangle-i)
    - [**The Similar Triangle Geometry**](#the-similar-triangle-geometry)
  - [**Claim 1.1 | Recovering Nesterov Original Form**](#claim-11--recovering-nesterov-original-form)
  - [**Scenario 2.5 | No Similar Triangle but Proximal Gradient**](#scenario-25--no-similar-triangle-but-proximal-gradient)
  - [**Scenario 3 | Similar Triangle II**](#scenario-3--similar-triangle-ii)
- [**Some more Nuanced Results**](#some-more-nuanced-results)
  - [**Def 2.1 | Chambolle Dossal (2015)**](#def-21--chambolle-dossal-2015)
  - [**Def 2.2 | Ryu's Chapter 12**](#def-22--ryus-chapter-12)
  - [**Claim 2.3 | Chambolle and Dossal's Variant doesn't fit the Framework**](#claim-23--chambolle-and-dossals-variant-doesnt-fit-the-framework)


---
### **Deriving Convergences of AG Variants From the Lyapunov Upper Bounds**

#### **Theorem | Generic Convergence Bound based on PPM Interpretation**
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
    \right)\Upsilon_{2, t + 1}^{\text{AG}} + \Upsilon_{2, t + 1}^{\text{AG}}. 
\end{aligned}\tag{$[*]$}
}
$$

Now, it is a big assumption, but with the assumption that $\Phi_{t + 1} - \Phi_t \le 0$ for the appropriate choice of $\tilde \eta_t, \eta_t$ in the algorithm, we have a convergence rate of $f(z_{T + 1}) - f(x_*) \le \mathcal O\left(\sum_{i = 1}^{T} \eta_i^{-1}\right)$ from the analysis of PPM. 


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
    \langle \mathcal G_L(y_t), y_t - z_t\rangle
\end{aligned}
$$

Observe that the cross product term for $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$ doesn't match. 
Hence let's consider the update for $y_t$, which can be written as $y_t - x_t = L \eta_t (z_t - y_t)$. We make the choice to do surgery on upper bound of $\Upsilon_{2, t + 1}^\text{AG}$, so $\langle \mathcal G_L(y_t), y_t - x_t\rangle = \langle \mathcal G_L(y_t), L \eta_t (z_t - y_t)\rangle$. 
With this in mind, applying the RHS of $[(*)]$ yields: 

$$
{\footnotesize
\begin{aligned}
    &\Upsilon_{1, t + 1}^\text{AG} + 
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
    \right)\langle \mathcal G_L(y_t), z_t - y_t\rangle
\end{aligned}
}
$$

If the algorithm were to have the abstract convergence rate, one of the sufficient condition is to have the above quantity less than or equal to zero, one sufficient condition of that is to have the coefficient for $\Vert \mathcal G_L(y_t)\Vert$ be $\le 0$, and the coefficient of the cross term $\langle \mathcal G_L(y_t), z_t - y_t\rangle$ be zero. 
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

To satisfy the equality, reader should verify that $\eta_{t} = (t - 1)/(2L)$ one of the options. And there are not many other options for the choice of the stepszies for the equality to be satisfied. 


#### **Scenario 2 | Similar Triangle I**
This similar triangle approach will recover the original Nesterov acceleration sequence method proposed back in 1983. 
It is called a similar triangle approach because it employed the following conditions on top of the Triangular Generic Form of AG: $\tilde\eta_{t + 1} = \eta_t + L^{-1}$. 
This stepsize allows us to change updates so that $x_{t + 1} = z_{t + 1} + L\eta_t (z_{t + 1} - z_t)$, $\mathcal G_L(y_t)$ is now nullified. 
To start, substituting the definition of $z_{t +1} = z_{t} - L^{-1}\mathcal G_L(y_t), z_t$ into the above expression then we have: 

$$
\begin{aligned}
    x_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t) 
    + L \eta_t y_t - \eta_t \mathcal G_L(y_t) - L\eta_t z_t
    \\
    &= 
    (1 + L\eta_t)y_t - (\eta_t + L^{-1})\mathcal G_L f(y_t) - L\eta_t z_t
    \\
    &= \eta_t Lz_t + x_t -(\eta_t + L^{-1}) \mathcal G_L f(y_t)  - L\eta_t z_t
    \\
    &= x_t - (\eta_t + L^{-1})\mathcal G_L f(y_t). 
\end{aligned}
$$

This new choice for $\tilde \eta, \eta$ conveys the following updates: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \mathcal G_L f(y_t) 
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


##### **The Similar Triangle Geometry**
> At each step of the momentum algorithm, we have triangle $(y_t, z_t, z_{t + 1})$ and triangle $(x_t, z_t, x_{t + 1})$ similar to each other. 

**Demonstration**

1. Observe that $y_t = (1 + L\eta_t)^{-1}(x_t + L\eta_t z_t)$ is a convex combination between $x_t, z_t$. Hence $z_t, y_t, x_t$ are three collinear points. Additionally, we have $y_t - x_t = L\eta_t (z_t - y_t)$, hence $\Vert y_t - x_t\Vert/\Vert z_t - y_t\Vert = L\eta_t$. 
1. By the algorithm, we have $z_{t + 1} - y_t = - L^{-1} \mathcal G_L(y_t)$, and $x_{t + 1} - x_t = - \tilde \eta_{t + 1} \mathcal G_L(y_t)$, hence vector $z_{t + 1} - y_t$ parallels to $x_{t + 1} - x_t$. 
2. Finally, with update $x_{t +1} - z_{t + 1} = L\eta_t (z_{t +1} - z_t)$, we have three colinear points $(z_t, z_{t + 1}, x_t)$ with $\Vert z_{t + 1} - z_t\Vert/\Vert z_{t +1 } - z_t\Vert = L\eta_t$. 

From the above results, we can conclude that triangle $(y_t, z_t, z_{t + 1})$ is similar to $(x_t, z_t, x_{t + 1})$ because they share colinear points $z_t, y_t, x_t$ and $z_t, z_{t + 1}, x_{t + 1}$, and their sides $z_{t + 1} - y_t$ parallels to $x_{t + 1} - z_t$. 

The visual understanding of the situation allows us to duduce the upper bound because it creates a different way of eliminating the cross terms in the upper bounds of $\Upsilon_{1, t + 1}^\text{AG}, \Upsilon_{2, t + 1}^\text{AG}$. 
The next claim will clarify the sitaution. 

#### **Claim 1.1 | Recovering Nesterov Original Form**
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
    - \frac{1}{2}\Vert L \tilde \eta_{t+} (z_{t+1} - y_t)\Vert^2 + 
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
    &= 
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

Next, we consider coefficient for the term $\Vert z_{t+1} - y_t\Vert^2$, if it's non-positive then we have

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

Substituting the above expression into the inequality then it satisfies

$$
\begin{aligned}
    \tilde \eta_{t + 1} + \sum_{i = 1}^{t} \tilde \eta_i 
    &\le L \tilde \eta_{t + 1}^2
    \\
    \tilde \eta_{t + 1} + L\eta_t \tilde \eta_{t + 1}
    &\le L \tilde \eta_{t + 1}^2
    \\
    1 + L\eta_t &\le L \tilde\eta_{t + 1}. 
\end{aligned}
$$

Observe that with $\tilde \eta_{t + 1} = \eta_t + L^{-1}$ the inequality is an equality. 
Finally, to recover the momentum stepsizes for the classical Nesterov accelerated gradient, we consider the following: 
$$
\begin{aligned}
    L \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &= L \tilde \eta_{t + 1} + L \sum_{i = 1}^{t} \tilde \eta_i 
    \\
    &= 
    L \tilde \eta_{t + 1} + L (L \eta_t \tilde \eta_{t + 1}) 
    \\
    &= L \tilde \eta_{t + 1} + L \eta_t (L \eta_t + 1)
    \\
    &= L (\eta_t + L^{-1}) + L\eta_t (L \eta_t + 1)
    \\
    &= (L\eta_t + 1)^2, 
\end{aligned}
$$

Simultaneously we have 

$$
\begin{aligned}
    L \sum_{i = 1}^{t + 1} \tilde \eta_i 
    &= L^2 \eta_{t + 1} \tilde \eta_{t + 1}
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

With $a_t = L\eta_t + 1 = L \tilde \eta_{t + 1}$ this is 
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


**Remarks**

This derivation only leave a single choice for the stepsize parameter. 
We are not sure if there could be more choices for the parameters that assures convergence rate of the algorithm. 

#### **Scenario 2.5 | No Similar Triangle but Proximal Gradient**

In this section, we discuss the case when $f$ is not necessarily smooth. 

#### **Scenario 3 | Similar Triangle II**   

In the previous scenario II, we choose the stepsize so that $x_{t + 1}$ can be projected into the correct position by $z_{t + 1}$ to allow colinearity for points $z_t, x_{t +1}, x_{t + 1}$. 
In this scenario, we choose the stepsize so that $z_{t +1}$ is a convex combinations of the point $x_{t+1}, z_t$, so that we still have the similar triangle as in the previous scenario. 


---
### **Some more Nuanced Results**

Results in this part are not coming from literatures, and they are my own works at testing the ideas presented by Ahn and in their works. 
Before we start, we list some of the specific type of accelerated gradient method. 
In any cases below, we are optimizing with convex functions. 

#### **Def 2.1 | Chambolle Dossal (2015)**
> When $f$ is differentiable and convex, we define the following algorithm 
> $$
> \begin{aligned}
>     y_n &= \left(
>         1 - \frac{1}{t_{n + 1}}
>     \right)z_{n} + \left(
>         \frac{1}{t_{n + 1}}
>     \right)x_{n}
>     \\
>     z_{n + 1} &= y_n - L^{-1} \nabla f(y_n)
>     \\
>     x_{n + 1} &= z_n + t_{t +1} (z_{n + 1} - z_n), 
> \end{aligned}
> $$
> where $t_n = (n + a - 1)/a$ for all $a > 2$. 
> Then the above algorithm is a form of accelerated gradient where the iterates converges to a minimizer. 

**Remarks**

In the context of Chambolle, Dossal, the gradient descent step for $z_{n + 1}$ is produced by the forward backward splitting operator of the gradient of sum of smooth non-smooth function. 


#### **Def 2.2 | Ryu's Chapter 12**
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
>         \frac{1}{t + 2}
>     \right)x_{t + 1}. 
> \end{aligned}
> $$

**Observations**

It is important to talk about the initial conditions of the algorithm. 
This algorithm is equivalent to the algorithm discussed scenario I, not a similar triangule. 


#### **Claim 2.3 | Chambolle and Dossal's Variant doesn't fit the Framework**
> The variety of accelerated gradient presented by Chambolle Dossal for convergence of the iterates, doesn't fit the accelerated gradient PPM form: 
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
> This is true because if there is a generic representation $x_{t + 1} = z_{t + 1} + \alpha_{t + 1}(z_{t + 1} - z_t)$ for some $\alpha_{t + 1} \in \R$ where $x_{t + 1}$ is produced from the accelerated gradient PPM generic form, then it must be that $a_{t + 1} = L\eta_t$, so $\tilde \eta_{t + 1} = \eta_t + L^{-1}$ is the only choice to make similar triangle. 

**Proof**

This comes from the consideration 

$$
\begin{aligned}
    x_{t + 1} &= z_{t + 1} + \alpha_{t + 1}(z_{t + 1} - z_t)
    \\
    &= 
    y_t + L^{-1}\nabla f(y_t) + \alpha_{t + 1} (
        y_t + L^{-1}\nabla f(y_t) - z_t
    )
    \\
    &= y_t + (L^{-1} + \alpha_{t + 1}L^{-1})\nabla f(y_t)
    + \alpha_{t + 1}y_t - \alpha_{t + 1}z_t
    \\
    &= (1 + \alpha_{t + 1})y_t 
    + L^{-1}(1 + \alpha_{t + 1})\nabla f(y_t) - \alpha_{t + 1}z_t. 
\end{aligned}
$$

Now we find $z_t$ in terms of $y_t, x_t$ using the updates of $y_t$, from the previous iterations which yields: 

$$
\begin{aligned}
    (1 + L\eta_t) y_t &= x_t + L\eta_t z_t
    \\
    (1 + L\eta_t)y_t - x_t &= L\eta_t z_t
    \\
    ((L\eta_t)^{-1} + 1)y_t - (L\eta_t)^{-1}x_t
    &= z_t, 
\end{aligned}
$$

substituting back we have

$$
\begin{aligned}
    x_{t + 1} &= 
    (1 + \alpha_{t + 1})y_t 
    + L^{-1}(1 + \alpha_{t + 1})\nabla f(y_t)
    - \alpha_{t + 1} 
    \left(
        ((L\eta_t)^{-1} + 1)y_t - (L\eta_t)^{-1}x_t
    \right)
    \\
    &= 
    \left(
        (1 + \alpha_{t + 1}) - \alpha_{t +1} ((L\eta_t)^{-1} + 1)
    \right)y_t 
    + 
    (1 + \alpha_{t + 1})L^{-1}\nabla f(y_t) 
    + 
    \alpha_{t + 1}(L\eta_t)^{-1} x_t. 
\end{aligned}
$$

If, $x_{t +1}$ were to have representation in the form of $x_t = y_t - \tilde\eta_{t + 1} \nabla f(y_t)$, then it must be that $(1 + \alpha_{t + 1}) - \alpha_{t +1} ((L\eta_t)^{-1} + 1) = 0$, and $\alpha_{t + 1} (L\eta_t)^{-1} = 1$, inevitably making $\alpha_{t + 1} = L\eta_t$. 

**Remarks**

So, what exactly does the Dossal and Chambolle variants fit into, requires some more investigation. 
It's mentioned in the writings by Chambolle and Dossal that, the algorithm they derived was related to the momentum acceleration method applied to some type of maximal monotone operator. 