- [PPM APG Forms](PPM%20APG%20Forms.md)

---
### **Intro**

This part of the file continues discussion in [PPM APG Forms](PPM%20APG%20Forms.md). 
In this file we talks about the assumptions and constraints imposed in the parameters between these form so that they become equivalent to each other. 
In the section below we proved a lot of proposition. 
Now we give a high level sommary of the propositions and how different form of algorithms are related to each other. 



--- 
### **A list of propositions**

Below proposition describe the relations between these variations of Nesterov type accelerated proximal gradient method. 
Here is a list of conditions we considered: 

1. $\mu = 0$, 
2. $\tilde \eta_t + L^{-1} + L^{-1} \mu \tilde \eta_t$. 

Here is what the following proposition is about: 
1. Proposition 1, If (1.) then S-CVX Generic APG -> Generic Similar Triangle
2. Proposition 2, Similar triangle and Momentum form is equivalent. 
3. Proposition 3, if (1.) and (2.), then  Generic Similar Triangle is equivalent to Chambolle Dossal, 2015 where we when $t_n = L \tilde \eta_{n}$. 
4. Proposition 4, if (1.), then there is a choice of constant stepsize sequence $\tilde \eta_t, \eta_t$ which recovers the V-FISTA algorithm. 
5. Proposition 5 links parameters from Nesterov's analysis to the PPM method. 



#### **Proposition 1 | Generic Similar Triangle Form is a special case of S-CVX Generic APG**
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

#### **Proposition 2 | Similar Triangle is momentum form**
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
> Then the algorithm are equivalent to Chambolle and Dossal's algorithms if and only if we have sequence $t_n = L \tilde \eta_{n}$ and $\mu = 0$. 

**Proof**

First, we present $\eta_t$ using $\tilde \eta_t$. 
The Generic Similar Triangle Form admits has $x_{t + 1}$ to be: 
$$
\begin{aligned}
    x_{t + 1} 
    &= z_{t + 1} + (1 + \mu\tilde \eta_{t})^{-1}L\eta_t (z_{t + 1} - z_t)
    \\
    &=  
    (1 + L\eta_t(1 + \mu \tilde \eta_{t})^{-1})z_{t + 1}
    - L\eta_t(1 + \mu\tilde \eta_{t})^{-1} z_t
    \\
    &= 
    \left(
        \frac{1 + \mu\tilde \eta_{t} + L \eta_t}{1 + \mu \tilde \eta_{t}}
    \right)z_{t + 1}
    + 
    z_t - 
    \left(
        1 + \frac{ L\eta_t}{\mu \tilde \eta_t + 1}
    \right)z_t
    \\
    & 
    \textcolor{gray}{
        \text{use: } \tilde \eta_t = \eta_t + L^{-1} + L^{-1}\mu\tilde \eta_t
    }
    \\
    &= 
    \left(
        \frac{L\tilde \eta_{t}}{1 + \mu\tilde \eta_{t}}
    \right)z_{t + 1}
    + 
    z_t 
    - 
    \left(
        \frac{L\tilde \eta_{t}}{1 + \mu \tilde \eta_{t}}
    \right)z_t 
    \\
    &= z_t + 
    \left(
        \frac{L\tilde \eta_{t}}{1 + \mu \tilde \eta_{t}}
    \right)
    (z_{t + 1} - z_t). 
\end{aligned}
$$

Recall that Chmabolle Dossal 2015 has $x_{n + 1} = z_t + t_n(z_{t + 1} - z_t)$, 
therefore above suggests that $t_n = L \tilde \eta_{n}(1 + \mu \tilde \eta_{n})^{-1}$. 
From the second equality to the third equality, we use the relations $L\tilde \eta_{t} = \eta_t + 1 + \mu\tilde \eta_{t}$.
At the same time, we check that: 

$$
\begin{aligned}
    y_{t + 1} &= \left(
        \frac{L\eta_{t + 1}}{1 + L \eta_{t + 1}}
    \right)z_{t + 1} + 
    \left(
        \frac{1}{1 + L \eta_{t + 1}}
    \right) x_{t + 1}
    \\
    &= 
    \left(
        1 - \frac{1}{1 + L\eta_{t + 1}}
    \right)z_{t + 1} + 
    \left(
        \frac{1}{1 + L \eta_{t + 1}}
    \right)x_{t + 1}. 
\end{aligned}
$$

Recall that in Chambolle Dossal 2015, itertes $y_{n + 1} = (1 - t_{n + 1}^{-1})z_{n + 1} + t_{n + 1}^{-1} x_{n + 1}$. 
Therefore, the above results suggests that $t_{n + 1} = 1 + L\eta_{n + 1}$. 
However, by the relations between $\tilde \eta_n, \eta_n$ as asserted via the similar triangle form, we have 

$$
\begin{aligned}
    \tilde \eta_t &= \eta_t + L^{-1} + L^{-1}\mu \tilde \eta_t
    \\
    L\tilde \eta_t - \mu \tilde \eta_t 
    &= 
    L \eta_t + 1
    \\
    (L - \mu)\tilde \eta_t &= L\eta_t + 1. 
\end{aligned}
$$

For $t_n$ to be the same, these two have to be equivalent, but for all $\mu > 0$

$$
\begin{aligned}
    L\tilde \eta_n (1 + \mu \tilde \eta_n)^{-1} \not = 
    (L - \mu )\tilde \eta_n
\end{aligned}
$$

Therefore, they are only equals when $\mu = 0$, then the generic similar triangle algorithm would be equivalently represented as the algrithm in Chambolle Dossal 2015's paper. 




#### **Proposition 4 | V-FISTA**
> V-FISTA is a form of Generic Similar Triangle Form, where the stepsizes $\tilde \eta_t, \eta_t$ are constants satisfying: 
> $$
> \begin{aligned}
>     \tilde \eta_t 
>     &= \frac{1}{\mu(\sqrt{\kappa} - 1)}
>     \quad \forall t \in \N, 
>     \\
>     \eta_t
>     &= 
>     \frac{1}{\mu\sqrt{\kappa}}
>     \quad \forall t \in \N. 
> \end{aligned}
> $$
> So the Momentum Form of the algorithm would simplify to 
> $$
>  \begin{aligned}
>      y_{t + 1} &= z_{t + 1} + 
>      \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}
>      (z_{t +1} - z_t)
>      \\
>      z_{t + 1} 
>      &= y_t - L^{-1}\mathcal G_L(y_t). 
>  \end{aligned}
> $$


**Proof**


Removing the subscript for the index because the stepsizes are constant in this case, observe that we have 

$$
\begin{aligned}
    L\eta &= \frac{L}{\mu \sqrt{\kappa}} = \frac{\kappa}{\sqrt{\kappa}} = \sqrt{\kappa}, 
    \\
    \mu \tilde \eta &= 
    \frac{1}{\sqrt{\kappa} - 1}, 
    \\
    L\tilde \eta &= 
    \frac{\kappa}{\sqrt{\kappa} - 1}. 
\end{aligned}
$$

With that it establishes relations

$$
\begin{aligned}
    \frac{L\eta }{(1 + \mu \tilde \eta)(1 + L\eta)}
    &= 
    \frac{\sqrt{\kappa}}{
        \left(
            1 + \frac{1}{\sqrt{\kappa} - 1}
        \right)
        \left(
            1 + \sqrt{\kappa}
        \right)
    }
    \\
    &= \frac{\sqrt{\kappa}}{
        \left(
            \frac{\sqrt{\kappa}}{\sqrt{\kappa} - 1}
        \right)(1 + \sqrt{\kappa})
    }
    \\
    &=
    \frac{\sqrt{\kappa}}{1 + \sqrt{\kappa}}\left(
        \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa}}
    \right)
    \\
    &= 
    \frac{\sqrt{\kappa} - 1}{\sqrt{\kappa} + 1}. 
\end{aligned}
$$

The sequence is valid because 

$$
\begin{aligned}
    \tilde \eta_{t} 
    &= \eta_t + L^{-1} + L^{-1} \mu \tilde \eta_{t}
    \\
    (L - \mu)\tilde \eta_{t}
    &= 
    1 + L \eta_t 
    \\
    L \tilde \eta_{t} - 
    \mu \tilde \eta_{t}
    &= 1 + L \eta_t. 
\end{aligned}
$$

Starting from the LHS it yields: 

$$
\begin{aligned}
    L\tilde \eta - \mu \tilde \eta 
    &= \frac{\kappa}{\sqrt{\kappa} - 1} - 
    \frac{1}{\sqrt{\kappa} - 1}
    \\
    &= 
    \frac{\kappa - 1}{\sqrt{\kappa} - 1}
    \\
    &= 
    \frac{(\sqrt{\kappa} + 1)(\sqrt{\kappa} - 1)}{\sqrt{\kappa} - 1}
    \\
    &= 1 + \sqrt{\kappa} = 1 + L \eta. 
\end{aligned}
$$

#### **Proposition 5 | Nes 2.2.19**
> 
