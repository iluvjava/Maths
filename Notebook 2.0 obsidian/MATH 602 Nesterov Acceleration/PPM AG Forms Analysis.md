- [PPM AG Forms](PPM%20AG%20Forms.md)

---
### **Intro**

This part of the file continues discussion in [PPM AG Forms](PPM%20AG%20Forms.md). 
In this file we talks about the assumptions and constraints imposed in the parameters between these form so that they become equivalent to each other. 
In the section below we proved a lot of proposition. 
Now we give a high level sommary of the propositions and how different form of algorithms are related to each other. 



--- 
### **A lot of propositions**


#### **Proposition 1 | Generic Similar Triangle Form is a special case of S-CVX Generic AG**
> The similar triangle is a special case of the AG generic form. 
> Suppose that $(x_t, y_t, z_t), \eta_t, \tilde \eta_t$ be the iterates and the stepsize sequences be given by the PPM AG generic form. 
> If in addition, the sequence $\tilde \eta_t, \eta$ satisfies the conditions for all $t \in \N$
> $$
> \begin{aligned}
>     \tilde\eta_{t} &= \eta_t + L^{-1} + L^{-1} \mu \tilde\eta_{t}, 
> \end{aligned}
> $$
> then $x_{t +1}$ in the the AG Generic Form has alternative representation: 
> $$
> \begin{aligned}
>     x_{t + 1} &= 
>     z_{t + 1} + 
>     \frac{L\eta_t}{1 + \mu \tilde \eta_{t}} 
>     (z_{t + 1} - z_t). 
> \end{aligned}
> $$
> This would at the end, produce the following relations for all $t \in \N$: 
> $$
> \begin{aligned}
>     z_{t + 1} &= 
>     y_t - L^{-1}\mathcal G_L(y_t), 
>     \\
>     x_{t + 1}&= 
>     z_{t + 1} + \frac{L\eta_t}{1 + \mu\tilde \eta_{t}}(z_{t + 1} - z_t), 
>     \\
>     y_{t + 1}&= 
>     (1 + L\eta_{t + 1})^{-1} (L\eta_{t + 1}z_{t + 1} + x_{t + 1}). 
> \end{aligned}
> $$

**Proof**

We start by showing that there exists a constant $\alpha \in \R$ such that $z_{t + 1} - z_t = \alpha (x_{t + 1} - z_{t + 1})$ by $\tilde \eta_{t} = \eta_t + L^{-1} + L^{-1} \mu \tilde \eta_{t}$. 
Firstly, we have the equality which it's proved at the end. 

$$
\begin{aligned}
    z_{t + 1} - z_t
    &= 
    - (L\eta_t)^{-1} y_t 
    - L^{-1}\mathcal G_L(y_t) + (L \eta_t)^{-1} x_t. 
\end{aligned}\tag{1}
$$

Next, we have this equality which we proved later at the end: 

$$
\begin{aligned}
    x_{t + 1} - z_{t + 1}
    &= 
    (1 + \mu\tilde \eta_{t})^{-1}
    \left(
        x_t - y_t +     
        \left(
            - \tilde \eta_{t} + L^{-1}
            + \mu \tilde \eta_{t}L^{-1}
        \right)
        \mathcal G_L(y_t)
    \right). 
\end{aligned}\tag{2}
$$

Since 

$$
\begin{aligned}
    \tilde\eta_{t} &= \eta_t + L^{-1} + L^{-1} \mu \tilde\eta_{t}
    \\
    (1 - L^{-1}\mu)\tilde \eta_{t}
    &= L^{-1} + \eta_t 
    \\
    - \tilde \eta_{t} + L^{-1}\mu \tilde \eta_{t}
    + L^{-1}
    &= - \eta_t, 
\end{aligned}
$$

so substituting 

$$
\begin{aligned}
    x_{t + 1} - z_{t + 1}
    &= 
    (1 + \mu \tilde \eta_{t})^{-1}
    (x_t - y_t - \eta_t \mathcal G_L(y_t))
    \\
    &= (1 + \mu \tilde \eta_{t})^{-1}
    \eta_t(\eta_{t}^{-1}(x_t - y_t) - \mathcal G_L(y_t))
    \\
    &= (1 + \mu \tilde \eta_{t})^{-1}
    \eta_t L(z_{t + 1} - z_t)
    \\
    x_{t + 1} &= 
    z_{t + 1} + 
    \frac{L \eta_t}{1 + \mu \tilde \eta_t}(z_{t + 1} - z_t). 
\end{aligned}
$$

To show (1): 

$$
\begin{aligned}
    y_{t} &= (1 + L\eta_{t})^{-1}(L\eta_{t}z_{t} + x_{t})
    \\
    (1 + L\eta_t)y_t - x_t &= L\eta_t z_t
    \\
    z_t & = (L\eta_t)^{-1}((1 + L\eta_t)y_t - x_t), 
    \\[1em]
    z_{t + 1} - z_t 
    &= \underbrace{ y_t - L^{-1}\mathcal G_L(y_t)}_{=z_{t + 1}}
    - \underbrace{(L\eta_t)^{-1}((1 + L\eta_t)y_t - x_t)}_{=z_t}
    \\
    &= 
    y_t - L^{-1} \mathcal G_L(y_t) - (L\eta_t)^{-1}y_t - y_t + (L\eta_t)^{-1} x_t
    \\
    &= 
    -L^{-1}\mathcal G_L(y_t) + (L\eta_t)^{-1}(x_t - y_t)
    \\
    &= 
    L^{-1}(\eta_t^{-1}(x_t - y_t) -\mathcal G_L(y_t)). 
\end{aligned}
$$

To show (2): 

$$
\begin{aligned}
    x_{t + 1} - z_{t + 1}&= 
    \left(
        (1 + \mu \tilde \eta_{t})^{-1} (\mu \tilde \eta_{t }y_t + x_t)
        - \frac{\tilde \eta_{t }}{1 + \mu\tilde \eta_{t }}
        \mathcal G_L(y_t)
    \right) - \left(
        y_t - L^{-1}\mathcal G_L(y_t)
    \right)
    \\
    &= 
    (1 + \mu \tilde \eta_{t})^{-1}
    \left(
        x_t + \mu \tilde \eta_{t} y_t
        - \tilde \eta_{t} \mathcal G_L(y_t)
        - (1 + \mu \tilde \eta_{t})
        (y_t - L^{-1}\mathcal G_L(y_t))
    \right)
    \\
    &= 
    (1 + \mu\tilde \eta_{t})^{-1}
    \left(
        x_t - y_t + 
        (
            -\tilde \eta_{t} + 
            (
                1 + \mu\tilde \eta_{t})L^{-1}
            )
            \mathcal G_L(y_t)
        )
    \right)
    \\
    &= 
    (1 + \mu\tilde \eta_{t})^{-1}
    \left(
        x_t - y_t +     
        (
            - \tilde \eta_{t} + L^{-1}
            + \mu \tilde \eta_{t}L^{-1}
        )
        \mathcal G_L(y_t)
    \right). 
\end{aligned}
$$

#### **Proposition 2 | Similar Triangle form is equivalent to momentum form**
> Let iterates $(x_t, y_t, z_t), \eta_t, \tilde \eta_t$ be given by the relations in Similar Triangle Form then it's algebraically equivalent to: 
> $$
> \begin{aligned}
>     y_{t + 1} &= z_{t + 1} + 
>       \frac{L\eta_t}{(1 + \mu \tilde\eta_{t})(1 + L\eta_{t + 1})}(z_{t + 1} - z_t)
>     \\
>     z_{t + 1} &= y_t - L^{-1}\mathcal G_L(y_t). 
> \end{aligned}
> $$
> Which fits the Generic Nesterov Momentum Form with 
> $$\theta_{t + 1} = \frac{L\eta_t}{(1 + \mu \tilde\eta_{t})(1 + L\eta_{t + 1})}.$$

**Proof**

From the similar triangle form, directly substituting the value of $x_{t + 1}$ into the expression for $y_{t + 1}$ it yields: 

$$
\begin{aligned}
    y_{t + 1} &= 
    (1 + L\eta_{t + 1})^{-1} (L\eta_{t + 1}z_{t + 1} + x_{t + 1})
    \\
    &= 
    (1 + L\eta_{t + 1})^{-1}
    \left(
        L\eta_{t + 1}z_{t + 1} + z_{t + 1} + \frac{L\eta_t}{1 + \mu\tilde \eta_t}(z_{t + 1} - z_t)
    \right)
    \\
    &= 
    (1 + L\eta_{t + 1})^{-1}
    \left(
        (1 + L\eta_{t + 1})z_{t +1} + 
        \frac{L\eta_t}{1 + \mu\tilde \eta_t}(z_{t + 1} - z_t)
    \right)
    \\
    &= 
    z_{t + 1} + 
    \frac{L\eta_t}{(1 + L\eta_{t + 1})(1 + \mu\tilde \eta_t)}
    (z_{t + 1} - z_t)
\end{aligned}
$$



#### **Proposition 3 | Chambolle, Dossal 2015 is a special case of Generic Similar Triangle Form**
> Let iterates $(x_t, y_t, z_t)$ and stepszie sequence $\tilde \eta_t, \eta_t$ be generated by Similar Triangle Form. 
> If in addition we also have $\mu = 0$, then it recovers:  
> 