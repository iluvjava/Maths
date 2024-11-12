- [PPM APG Forms](PPM%20APG%20Forms.md)

---
### **Intro**

This part of the file continues discussion in [PPM APG Forms](PPM%20APG%20Forms.md). 
In this file we talks about the assumptions and constraints imposed in the parameters between these form so that they become equivalent to each other. 
In the section below we proved a lot of proposition. 
Now we give a high level summary of the propositions and how different form of algorithms are related to each other. 

This is the most relevant form discussion in this file: 


#### **Def | Generic SC APG**
> Let $h = f + g, \mathcal G_L, \mathcal T_L$ be given by Assumption Set 3. 
> Define an algorithm satisfying the following conditions for its iterates $(w_t, x_{t + 1}, z_{t + 1}, y_{t + 1})$. 
> $$
> \begin{aligned}
>     w_{t} &= (\mu\tilde \eta_{t} + 1)^{-1}(\mu \tilde \eta_{t} y_t + x_t) 
>     \\
>     x_{t + 1}&= w_t - \tilde \eta_{t}(\mu\tilde \eta_{t} + 1)^{-1} \mathcal G_L(y_t)
>     \\
>     z_{t + 1}&= y_t - L^{-1}\mathcal G_L(y_t)
>     \\
>     y_{t + 1} &= (1 + L\eta_{t + 1})^{-1}(L\eta_{t + 1}z_{t + 1} + x_{t + 1}). 
> \end{aligned}
> $$


The following definitions are made for matching the similar triangle form. 

#### **Theorem | The abstracted generic form**
> For all $k\ge 0$, iterates $(w_t, y_t, x_{t + 1}, z_{t + 1})$ satisfies resursively that: 
> $$
> \begin{aligned}
>     y_{t} &= 
>     (1 + \tau_t)^{-1}(\tau_t z_{t} + x_{t})
>     \\
>     w_t &= (1 + \xi_t)^{-1}(\xi_ty_t + x_t)
>     \\
>     x_{t + 1}
>     &= 
>     w_t - (1 + \xi_t)^{-1} \delta_t\mathcal G_L(y_t)
>     \\
>     z_{t + 1} &= 
>     y_t - L^{-1}\mathcal G_L y_t. 
> \end{aligned}
> $$
> 
> If $1 + \xi_t + \tau_t = L\delta_t$, then 
> $$
>     x_{t +1} - z_{t + 1} = (1 + \xi_t)^{-1}\tau_t(z_{t + 1} - z_t). 
> $$
> Which makes the algorithm a similar triangle form. 

**Proof**

We are inverested in identifying the conditions required for the sequence of $\xi_t, \tau_t, \delta_t$ such that there exists $\theta_t$ satisfying: 

$$
\begin{aligned}
    x_{t + 1} - z_{t + 1} 
    &= \theta_t(z_{t + 1} - z_t)
\end{aligned}
$$

To verify, do 

$$
\begin{aligned}
    x_{t + 1} &= 
    (1 + \xi_t)^{-1}(x_t + \xi_t y_t - \delta_t \mathcal G_L(y_t))
    \\
    & \textcolor{gray}{
        x_t = (1 + \tau_t)y_t - \tau_t z_t
    }
    \\
    &= 
    (1 + \xi_t)^{-1}((1 + \tau_t)y_t - \tau_t z_t + \xi_t y_t - \delta_t \mathcal G_L(y_t))
    \\
    &= 
    (1 + \xi_t)^{-1}((1 + \tau_t + \xi_t)y_t - \tau_t z_t - \delta_t \mathcal G_L(y_t))
    \\
    x_{t + 1} - z_{t + 1}
    &= 
    (1 + \xi_t)^{-1}((1 + \tau_t + \xi_t)y_t - \tau_t z_t - \delta_t \mathcal G_L(y_t))
    - (y_t - L^{-1}\mathcal G_Ly_t)
    \\
    &= 
    (1 + \xi_t)^{-1}(\tau_ty_t - \tau_t z_t - \delta_t \mathcal G_L(y_t))
    + L^{-1}\mathcal G_Ly_t
    \\
    &= 
    (1 + \xi_t)^{-1}
    \left(
        \tau_ty_t - \tau_t z_t + (L^{-1}(1 + \xi_t) - \delta_t) \mathcal G_L(y_t)
    \right)
    \\
    &= 
    (1 + \xi_t)^{-1}\tau_t
    \left(
        y_t - z_t + 
        \tau_t^{-1}(L^{-1}(1 + \xi_t) - \delta_t) \mathcal G_L(y_t)
    \right)
\end{aligned}
$$


The RHS is can be verified through 

$$
\begin{aligned}
    z_{t + 1} - z_t &= 
    y_t - L^{-1}\mathcal G_L(y_t) - z_t
    \\
    &= (y_t - z_t) - L^{-1}\mathcal G_L(y_t). 
\end{aligned}
$$

It necessitates the condition: 

$$
\begin{aligned}
    \tau_t^{-1}(L^{-1}(1 + \xi_t) - \delta_t) 
    &= - L^{-1}
    \\
    (1 + \xi_t) - L\delta_t
    &= 
    - \tau_t
    \\
    1 + \xi_t + \tau_t
    &=
    L\delta_t. 
\end{aligned}
$$

Which allows for: 

$$
\begin{aligned}
    x_{t + 1} - z_{t + 1} &= 
    (1 + \xi_t)^{-1}\tau_t
    \left(y_t - z_t - L^{-1}\mathcal G_L(y_t)\right) 
    = 
    (1 + \xi_t)^{-1}\tau_t(z_{t + 1} - z_t). 
\end{aligned}
$$
That is what we want to prove. 

**Remarks**

Back to the original algorithm we have 

$$
\begin{aligned}
    & 
    \begin{aligned}
       \tau_t &= L \eta_t
        \\
        \xi_t &= \mu\tilde \eta_t
        \\
        \delta_t &= \tilde \eta_t
    \end{aligned}
    \\
    & 1 + \xi_t + \tau_t 
    = 
    1 + \mu \tilde \eta_t + L \eta_t = L \tilde \eta_t
    = L \delta_t. 
\end{aligned}
$$

Therefore, we want to have the conditions $1 + \mu \tilde \eta_t + L \eta_t = L \tilde \eta_t$ for the parameters in the PPM APG form. 




--- 
### **A list of propositions**

Below proposition describe the relations between these variations of Nesterov type accelerated proximal gradient method. 
Here is a list of conditions we considered: 

1. $\mu = 0$, 
2. $\tilde\eta_{t} = \eta_t + L^{-1} + L^{-1} \mu \tilde\eta_{t}$. 

Here is what the following proposition is about: 
1. Proposition 1, If (1.) then S-CVX Generic APG -> Generic Similar Triangle
2. Proposition 2, Similar triangle and Momentum form is equivalent. 
3. Proposition 3, if (1.) and (2.), then  Generic Similar Triangle is equivalent to Chambolle Dossal, 2015 where we when $t_n = L \tilde \eta_{n}$. 
4. Proposition 4, if (1.), then there is a choice of constant stepsize sequence $\tilde \eta_t, \eta_t$ which recovers the V-FISTA algorithm. 
5. Proposition 5 tramsforms Nesterov's 2.2.19 into the same format as Generic SC APG form. 
6. Proposition 5.1 matches the parameters in the algorithm Nesterov's 2.2.19 with the step sizes parameters found in the SC APG Form. 



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

Suppose that $(\rho_t)_{t \in \N}$ is a sequence such that $\rho_t > 1$ for all $t$. 
Consider for all $t \in \N$, the following relations between $\rho_t$ and $\tilde \eta_t, \eta_t$: 

$$
\begin{aligned}
    L \eta_t &:= \rho_t, 
    \\
    \mu \tilde \eta_t &:= \frac{1}{\rho_t - 1}, 
    \\
    L \tilde \eta_t &:= \frac{\rho_t^2}{\rho_t - 1}. 
\end{aligned}
$$

Then it satisfies the of similar triangle $\tilde \eta_t = \eta_t + L^{-1} + L^{-1} \mu \tilde \eta_t$ because: 

$$
\begin{aligned}
    L \tilde \eta_t - \mu \tilde \eta_t 
    &= \frac{\rho_t^2}{\rho_t - 1} - \frac{1}{\rho_t - 1}
    \\
    &= \frac{\rho_t^2 - 1}{\rho_t - 1} 
    \\
    &= \frac{(\rho_t - 1)(\rho_t + 1)}{\rho_t - 1} 
    \\
    &= \rho_t + 1
    \\
    &= L\eta_t + 1
\end{aligned}
$$

So, the momentum coefficient can be similified as well: 

$$
\begin{aligned}
    \theta_{t + 1} 
    &= \frac{L\eta_t}{(1 + \mu \tilde\eta_{t})(1 + L\eta_{t + 1})}
    \\
    &= \frac{\rho_t}{
        \left(
            1 + \frac{1}{\rho_t - 1}
        \right)
        (1 + \rho_t)
    }
    \\
    &= \frac{\rho_t}{
        \left(
        \frac{\rho_t}{\rho_t - 1}
        \right)
        (1 + \rho_t)
    }
    \\
    &= 
    \frac{\rho_t - 1}{\rho_t}
    \frac{\rho_t}{1 + \rho_t}
    \\
    &= \frac{\rho_t - 1}{1 + \rho_t}. 
\end{aligned}
$$

Set $\rho_t = \sqrt{\kappa}$, then we obtain the desired result. 


**Remark**

The choice of $\rho$ in here is deliberate. 
It it's directly related to a parameter in the convergence proof of the V-FISTA algorithm, see [V-FISTA](V-FISTA.md) for more information. 
Using the new sequence $\rho_t$, it allows us to simplify the updates in the original PPM APG to be: 

$$
\begin{aligned}
    x_{t +1} &= 
    \left(
        1 + \frac{1}{\rho_t - 1}
    \right)^{-1}
    \left(
        \frac{1}{\rho_t - 1} y_t
        + 
        x_t 
        - 
        \frac{1}{\mu(\rho_t - 1)} \mathcal G_L y_t
    \right)
    \\
    &= \rho_t^{-1}
    \left(
        y_t + (\rho_t - 1)x_t - \mu^{-1}\mathcal G_L y_t
    \right)
    \\
    &= 
    \rho_t^{-1}(y_t - x_t) + x_t - \rho_t^{-1}\mu^{-1}\mathcal G_L y_t. 
\end{aligned}
$$


#### **Proposition 5 | Nes 2.2.19 Intermediate Form**
> The nesterov 2.2.19 algorithm which is given by the following rules of updates for the sequence of vector $(y_k, x_k, v_k)$ and scalars $(\gamma_k, \alpha_k)$ with Lipschitz constant and strong convexity constant $L, \mu$ is given by:  
> $$
> \begin{aligned}
>     L\alpha_k^2 
>     &\le 
>     (1 - \alpha_k)\gamma_k + \alpha_k\mu = \gamma_{k + 1}, 
>     \\
>     y_k &= (\gamma_k + \alpha_k \mu)^{-1}
>     (\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k),
>     \\
>     x_{k + 1}&= 
>     y_k - L^{-1}\mathcal G_Ly_k, 
>     \\
>     v_{k + 1} &= 
>     \gamma_{k + 1}^{-1}
>     \left(
>         (1 - \alpha_k)\gamma_k v_k + \alpha_k \mu y_k - \alpha_k \mathcal G_L y_k 
>     \right). 
> \end{aligned}
> $$
> Then the above iterates can be expressed without the sequence $(\gamma_k)_{k \ge0}$ if we assume the equality: $L\alpha_k^2 = \gamma_{k + 1}$, producing: 
> $$
> \begin{aligned}
>     y_k &= 
>     \left(
>         1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
>     \right)
>     \\
>     x_{k + 1} &= 
>     y_k - L^{-1} \mathcal G_L y_k
>     \\
>     v_{k + 1} &= 
>     \left(
>         1 + \frac{\mu}{L \alpha_k - \mu}
>     \right)^{-1}
>     \left(
>         v_k + 
>         \left(\frac{\mu}{L \alpha_k - \mu}\right) y_k
>     \right) - \frac{1}{L\alpha_{k}}\mathcal G_L y_k
>     \\
>     0 &= \alpha_k^2 - \left(\mu/L - \alpha_{k -1}^2\right) \alpha_k - \alpha_{k - 1}^2. 
> \end{aligned}
> $$



**Proof**

From definition we have equality: $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \alpha_k \mu$, so $\gamma_{k + 1} + \alpha_k \gamma_k = \gamma_k + \alpha_k \mu$, with that in mind we can simplify the expression for $y_k$ by 

$$
\begin{aligned}
    y_{k} &= 
    (\gamma_k + \alpha_k \mu)^{-1}
    (\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)
    \\
    &= 
    (\gamma_{k + 1} + \alpha_k \gamma_k)^{-1}
    (\alpha_k \gamma_k v_k + \gamma_{k + 1}x_k)
    \\
    &= 
    \left(
        \frac{\gamma_{k + 1}}{\alpha_k\gamma_k} + 1
    \right)^{-1}
    \left(
        v_k + \frac{\gamma_{k + 1}}{\alpha_k \gamma_k} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{L\alpha_k^2}{\alpha_kL\alpha_{k - 1}^2} 
    \right)^{-1}
    \left(
        v_k + \frac{L\alpha_k^2}{\alpha_k L\alpha_{k - 1}^2} x_k
    \right)
    \\
    &= 
    \left(
        1 + \frac{\alpha_k}{\alpha_{k - 1}^2}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k}{\alpha_{k - 1}^2} x_k
    \right). 
\end{aligned}
$$

For $v_{k + 1}$ we use $\gamma_{k + 1} = (1 - \alpha_k)\gamma_k + \mu \alpha_k$ which gives us: 

$$
\begin{aligned}
    v_{k + 1} &= 
    \gamma_{k + 1}^{-1}
    ((1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k)
    - \alpha_k\gamma_{k + 1}^{-1}\mathcal L y_k
    \\
    &= 
    ((1 - \alpha_k)\gamma_k + \alpha_k \mu)^{-1}
    \left(
        (1 - \alpha_k)\gamma_k v_k + \mu\alpha_k y_k
    \right)
    - \alpha_k\gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k\mu}{(1 - \alpha_k)\gamma_k} y_k
    \right)
    - \alpha_k\gamma_{k + 1}^{-1}\mathcal G_L y_k
    \\
    &= 
    \left(
        1 + \frac{\alpha_k\mu}{(1 -\alpha_k)L\alpha_{k - 1}^2}
    \right)^{-1}
    \left(
        v_k + 
        \frac{\alpha_k\mu}{(1 - \alpha_k)L\alpha_{k - 1}^2} y_k
    \right)
    - \frac{1}{L\alpha_{k}}\mathcal G_L y_k
\end{aligned}
$$

We can eliminate the $\gamma_k$ which defines the $\alpha_k$ by considering 

$$
\begin{aligned}
    L\alpha_k^2 &= 
    (1 - \alpha_k)\gamma_k + \alpha_k \mu 
    \\
    &= 
    (1 - \alpha_k)L\alpha_{k - 1}^2 
    + \alpha_k \mu
    \\
    L\alpha_k^2 &= 
    L \alpha_{k - 1}^2 + 
    (\mu - L \alpha_{k - 1}^2)\alpha_k
    \\
    \iff     
    0
    &=  
    L \alpha_k^2 - (\mu - L \alpha_{k - 1}^2)\alpha_k 
    - L \alpha_{k -1}^2. 
\end{aligned}
$$

Next, we simplify the coefficients using the above relations further. 
From the above results we have the relation $(1 - \alpha_k)L\alpha_{k - 1}^2 = L \alpha_k^2 - \alpha_k \mu$. 
Therefore it gives 

$$
\begin{aligned}
    \frac{\alpha_k\mu}{(1 - \alpha_k)L \alpha_{k - 1}^2}
    &= 
    \frac{\alpha_k\mu}{L \alpha_k^2 - \alpha_k \mu}
    = \frac{\mu}{L \alpha_k - \mu}. 
\end{aligned}
$$

Next we have: 
$$
\begin{aligned}
    L\alpha_k^2 &= 
    (1 - \alpha_k)L\alpha_{k - 1}^2 + \alpha_k \mu 
    \\
    L \alpha_k^2 - \alpha_k\mu &= 
    (1 - \alpha_k)L \alpha_{k - 1}^2
    \\
    \alpha_{k - 1}^2
    &= 
    \frac{L \alpha_k^2 - \alpha_k\mu}{L (1 - \alpha_k)}
    \\
    \frac{1}{\alpha_{k - 1}^2}
    &= 
    \frac{L (1 - \alpha_k)}{L \alpha_k^2 - \alpha_k\mu}
    \\
    \frac{\alpha_k}{\alpha_{k - 1}^2}
    &= 
    \frac{L - L\alpha_k}{L\alpha_k - \mu}. 
\end{aligned}
$$


**Remarks**

The algorithm simplifies nicely under the assumption that $\mu = 0$, for the iterates $y_k, v_{k + 1}$ it has 

$$
\begin{aligned}
    y_k &= 
    \alpha_k v_k + (1 - \alpha_k) x_k
    \\
    v_{k + 1} &= 
    (1 + L\alpha_k)v_k + (1 + 1/(L\alpha_k)) y_k - 1/(L\alpha_k)\mathcal G_L y_k. 
\end{aligned}
$$

And the updates for $\alpha_k$ is now $L\alpha_k = (1 - \alpha_k)L \alpha_{k - 1}^2$. 


#### **Proposition 5.1 | Nes 2.2.19 is Similar Triangle**
> The Nesterov's 2.2.19 fits into the APG Abstract Generic form below: 
> $$
> \begin{aligned}
>     y_k &= (1 - \tau_k)^{-1}(v_k + \tau_k x_k),
>     \\
>     v_{k + 1} &= (1 + \xi_k)^{-1}(v_k + \xi_k y_k) - (1 + \xi_k)^{-1}\delta_k \mathcal G_L(y_k),
>     \\
>     x_{k + 1} &= y_k - L^{-1}\mathcal G_L (y_k). 
> \end{aligned}
> $$ 
> Where for all $k \ge0$: 
> $$
> \begin{aligned}
>     \tau_k &= \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}, 
>     \\
>     \xi_k &= \frac{\mu}{L \alpha_k - \mu},
>     \\
>     (1 + \xi_k)^{-1}\delta_k &= \frac{1}{L\alpha_k}
>     \iff L \delta_k = \frac{1 + \xi_k}{\alpha_k}
>     \\
>     L\alpha_k^2 &= (1 - \alpha_k)L\alpha_{k - 1}^2 + \mu\alpha_k
> \end{aligned}
> $$
> Then we have $(1 + \tau_k + \xi_k) = L \delta_k$ and hence $v_{k + 1} - x_{k + 1} = (1 + \xi_k)^{-1}\tau_k(x_{k + 1} - x_k)$. 


**Proof**

Using the theorem for abstracted generic APG form, it remains to verify the equality $(1 + \tau_k + \xi_k) = L \delta_k$. 
To do that we have: 

$$
\begin{aligned}
    1 + \tau_k + \xi_k &= 
    1 + \frac{L(1 - \alpha_k)}{L \alpha_k - \mu} 
    + \frac{\mu}{L \alpha_k - \mu}
    \\
    &= 
    1 + \frac{L - L \alpha_k + \mu}{L\alpha_k - \mu}
    \\
    &= 
    \frac{L - L \alpha_k + \mu + L \alpha_k - \mu}{L\alpha_k - \mu}
    \\
    &= \frac{L}{L\alpha_k - \mu}. 
\end{aligned}
$$

Next we have 

$$
\begin{aligned}
    \frac{1 + \xi_k}{\alpha_k}
    &= 
    \frac{1 + \frac{\mu}{L\alpha_k - \mu}}{\alpha_k}
    = 
    \frac{\frac{L\alpha_k - \mu + \mu}{L \alpha_k - \mu}}{\alpha_k}
    = 
    \frac{L}{L\alpha_k - \mu}. 
\end{aligned}
$$

Therefore we have representation 

$$
\begin{aligned}
    v_{k + 1} &= 
    x_{k + 1} + \left(
        1 + \frac{\mu}{L\alpha_k - \mu}
    \right)^{-1}\left(
        \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= 
    x_{k + 1} + \left(
        \frac{L\alpha_k}{L\alpha_k - \mu}
    \right)^{-1}\left(
        \frac{L(1 - \alpha_k)}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= 
    x_{k + 1} + \left(
        \frac{L\alpha_k - \mu}{L\alpha_k}
    \right)\left(
        \frac{L - L\alpha_k}{L\alpha_k - \mu}
    \right)(x_{k + 1} - x_k)
    \\
    &= x_{k + 1} + \left(
        \alpha_k^{-1} - 1
    \right)(x_{k + 1} - x_k). 
\end{aligned}
$$


**Remarks**

Up until this point, we had showed that the Nesterov's 2.2.19 algorithm is equivalent to the following form: 

$$
\begin{aligned}
    y_k &= 
    \left(
        1 + \frac{L - L\alpha_k}{L\alpha_k - \mu}
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \left(
       \frac{L - \mu}{L\alpha_k - \mu} 
    \right)^{-1}
    \left(
        v_k + 
        \left(\frac{L - L\alpha_k}{L\alpha_k - \mu} \right) x_k
    \right)
    \\
    &= 
    \frac{L\alpha_k - \mu}{L - \mu} v_k
    + 
    \frac{L - L \alpha_k}{L - \mu} x_k
    \\
    x_{k + 1} &= y_t - L^{-1}\mathcal G_L(y_k)
    \\
    v_{k + 1} 
    &= 
    x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \\
    0 &= 
    L \alpha_k^2 = (1 - \alpha_k)L\alpha_{k - 1}^2 + \alpha_k \mu. 
\end{aligned}
$$


With that in order, we can simplify it into the momentum form because: 

$$
\begin{aligned}
    v_{k + 1} &= 
    x_{k + 1} + (\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \\
    \iff 
    (L \alpha_{k + 1} - \mu)v_{k + 1} 
    &= 
    (L \alpha_{k + 1} - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k), 
    \\

    \\
    y_{k + 1} &= 
    (L - \mu)^{-1}((L\alpha_{k + 1} - \mu)v_{k + 1} + (L - L \alpha_{k + 1})x_{k + 1})
    \\
    &= (L - \mu)^{-1}
    \left(
        (L\alpha_{k + 1} - \mu)x_{k + 1} + 
        (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
        + (L - L \alpha_{k + 1})x_{k + 1}
    \right)
    \\
    &= 
    (L - \mu)^{-1}
    \left(
        (L - \mu)x_{k + 1} + (L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)(x_{k + 1} - x_k)
    \right)
    \\
    &= x_{k + 1} + \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}(x_{k + 1} - x_k). 
\end{aligned}
$$

Unfortuately, this is still different from what Nesterov did the chapter 2 of his book. 
But after some simplications we can get there because: 

$$
\begin{aligned}
    \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^{-1} - 1)}{L - \mu}
    &= \frac{(L\alpha_{k + 1} - \mu)\alpha_k(1 - \alpha_k)}{\alpha_k^2(L - \mu)}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \left(
        \frac{\alpha_k^2(L - \mu)}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \alpha_k(1 - \alpha_k)
    \left(
        \frac{L\alpha_k^2 - \mu\alpha_k^2}{L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= 
    \alpha_k(1 - \alpha_k)
    \left(
        \frac{(L\alpha_{k + 1} - \mu)(\alpha_k^2 + \alpha_{k + 1})}
        {L\alpha_{k + 1} - \mu}
    \right)^{-1}
    \\
    &= \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}. 
\end{aligned}
$$

We skipped some steps, but it's easy to verify using $L\alpha_{k + 1}^2 = (1 - \alpha_{k + 1})L\alpha_k^2 + \mu\alpha_{k + 1}$. 

$$
\begin{aligned}
    (L\alpha_{k + 1} - \mu)(\alpha_k^2 + \alpha_{k + 1})
    &= 
    L\alpha_{k + 1}\alpha_k^2 - \mu \alpha_k^2 + L \alpha_{k + 1}^2 + \mu\alpha_{k + 1}
    \\
    &= 
    L\alpha_{k + 1}\alpha_k^2 - \mu \alpha_k^2 + (
        (1 - \alpha_{k + 1})L\alpha_k^2 - \mu\alpha_{k + 1}
    ) - \mu\alpha_{k + 1}
    \\
    &= 
    L\alpha_k^2 - \mu \alpha_k^2. 
\end{aligned}
$$

Therefore, we also have the same results as stated in Nesterov's book that: 

$$
\begin{aligned}
    y_{k + 1} &= 
    x_{k + 1} + 
    \frac{\alpha_k(1 - \alpha_k)}{\alpha_k^2 + \alpha_{k + 1}}(x_{k + 1} - x_k). 
\end{aligned}
$$


---
### **In relations with Nesterov's Estimating Sequence technique**

PPM APG interpretation of Nesterov's accelerated gradient method has direct link to the Nesterov's estimating sequence technique used to show the convergence. 
We will introduce the technique and then compare it with the PPM APN form. 