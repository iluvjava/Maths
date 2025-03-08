[L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](../AMATH%20516%20Numerical%20Optimizations/Properties%20of%20Functions/Convex%20Function%20with%20Global%20Lipschitz%20Gradient.md)


---
### **Intro**

Ernest Ryu has a incredibly simple and powerful proof for the convergence of accelerated gradient of an $L$-Lipschitz smooth functions, for the Nesterov's Accelerated Gradient (Nes AG) method. 
The step sizes are also more general then the famous Nesterov sequence. (As discussed here [The Nesterov Momentum Sequence](The%20Nesterov%20Momentum%20Sequence.md)). 

We do the proof here and fill in the details. 
It's made for future references if we need it. 


#### **Assumptions and inequalities**
> Suppose that $f$ is $L$-Lipschitz smooth and convex. 
> Then it implies the following inequalities between the function value, and inner product that involves the gradient at some point. 
> $$
> \begin{aligned}
>     (\forall x \in \R^n)\; f(x) - f(x - L^{-1}\nabla f(x)) 
>     &\ge \frac{1}{2L}\Vert \nabla f(x)\Vert^2, 
>     \\
>     (\forall u, y \in \R^n)\; 
>     f(y) - f(u) &\le \langle \nabla f(y), y - u\rangle. 
> \end{aligned}
> $$
> We also assume that $f$ bounded below, has a minimier (there could be more) $x_*$, and we denote the minimum value of the function $f_*$. 

**Explain**

The first inequality is the descent lemma of a $L$-Lipschitz smooth function, the second inequality is convexity. 

#### **The algorithm**
> Written in similar triangle form, Ryu presented the algorithm as: 
> $$
> \begin{aligned}
>     z_{k + 1} &= y_k - L^{-1} \nabla f(y_k), 
>     \\
>     x_{k + 1} &= x_k - \theta_k L^{-1}\nabla f(y_k), 
>     \\
>     y_{k + 1} &= (1 - \theta_{k + 1}^{-1}) x_{k + 1}
>      + 
>     \theta_{k + 1} z_{k + 1}. 
> \end{aligned}
> $$

**Note**

The suggested choice of $\theta_k$ is $(k + 1)/ 2$. 
Linking back to PPM representation of the Nesterov acceleration algorithm, it has alternative representation involves step size sequence $\tilde \eta_t, \eta_t$ where iterates $(x_t, y_t, z_t)$ satisfies recursively: 

$$
\begin{aligned}
    z_{t + 1} &= y_t - L^{-1} \nabla f(y_t) , 
    \\
    x_{t + 1} &= x_t + \tilde \eta_t \nabla f(y_t), 
    \\
    y_{t + 1} &= 
    L\tilde \eta_{t + 1} ((L \tilde \eta_{t + 1} - 1)z_{t + 1} + x_{t + 1}). 
\end{aligned}
$$

here we note that, it's the PPM representation with $\tilde \eta_t = \eta_t + L^{-1}$, so $\mu = 0$, and it has the relation $\theta_t = L \tilde \eta_t$ in this case. 
For more information about PPM interpretation of the similar triangle form of Nesterov accelerated gradient algorithm visits: [Nesterov Type Acceleration via Proximal Point Method Part II](Nesterov%20Type%20Acceleration%20via%20Proximal%20Point%20Method%20Part%20II.md). Here we have $\tilde \eta_{t}$ instead 
of $\tilde \eta_t$, the difference in the indices simplifies the relations between $\eta_t, \tilde \eta_{t + 1}$. 


### **Proof of the convergence rate**

We employ the method of Lypunov anlaysis. 
Here is the process: 
1. Present a guess of the form of Lypunov function with underdetermined parameters that links to the suspected convergence rate of the algorithm. 
2. Solve for an upper bound of the convergence rate based on the sugguested Lypunov quantity. 

#### **Lyapunov function**
> At each iteration, we define the following quantities to be the Lyapunov function. 
> $$
> \begin{aligned}
>     \Phi_t &= \sigma_t (f(z_t) - f(x_*)) + 
>     \frac{1}{2}\Vert x_t - x_*\Vert^2
>     \\ 
>     \Phi_0 &= \frac{1}{2} \Vert x_0 - x_*\Vert^2. 
> \end{aligned}
> $$
> As a consequence, if for all $t \in \N$ it has $\Phi_{t + 1} - \Phi_t \le 0$, then $f(z_t) - f_*$ has convergence $\mathcal O(\sigma_t^{-1})$. 

**Demonstrations**

Telescoping $\Phi_{t} - \Phi_{t - 1}$ for $t = 1, \cdots, n$, then $\Phi_{n} - \Phi_0 \le 0$. 
Then writing things out and divides both side by $\sigma_t$ yields the convergence rate. 



#### **Thm | Convergence of the algorithm**
> If $\sigma_{t + 1} - \sigma_t \le \tilde \eta_t$, and $\sigma_{t + 1} = L \tilde \eta_t^2$, so $L\tilde \eta_t^2 - L \tilde \eta_{t -1}^2 \le \tilde \eta_t$, then we have descent on the Lyapunov function: 
> $$
> \begin{aligned}
>     \Phi_{t + 1} - \Phi_t &= \sigma_{t + 1}(f(z_{t + 1}) - f_*) 
>     - \sigma_{t}(f(z_t) - f_*) + 
>     \frac{1}{2}(
>         \Vert x_{t + 1} - x_*\Vert^2 
>         - 
>         \Vert x_t - x_*\Vert^2
>     ) \le 0. 
> \end{aligned}
> $$
> As a consequence, we have that $f(z_t) - f_*$ convergeces $\mathcal O(\sigma_t^{-1})$, and if we set $\tilde \eta_t = \theta_t L^{-1}$, it then gives the relations $\theta_t^2 - \theta_{t - 1}^2 \le \theta_t$, recovering the relaxed sequence of the Nesterov momentum sequence. 

**Proof**

Firstly, establish the difference between the norm square using the algorithm: 

$$
\begin{aligned}
    \frac{1}{2}(
        \Vert x_{t + 1} - x^*\Vert^2 - 
        \Vert x_t - x_*\Vert    ^2
    )
    &= 
    \frac{1}{2}\Vert 
        x_t - \tilde \eta_t \nabla f(y_t) - x_*
    \Vert^2 - \Vert x_t - x_*\Vert^2
    \\
    &= 
    \frac{1}{2}\Vert x_t - x_*\Vert^2 
    + \tilde \eta_t^2 /2 \Vert \nabla f(y_t)\Vert^2 
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle - 
    \frac{1}{2}\Vert x_t - x_*\Vert^2 
    \\
    &= 
    \tilde \eta_t^2 /2 \Vert \nabla f(y_t)\Vert^2 
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle. 
\end{aligned}
$$

Therefore, we simplifies 

$$
{\small
\begin{aligned}
    \Phi_{t + 1} - \Phi_t &= 
    \sigma_{t + 1}(f(z_{t + 1}) - f_*) 
    - \sigma_{t}(f(z_t) - f_*) 
    + 
    \frac{\tilde \eta_t^2}{2}\Vert \nabla f(y_t)\Vert^2 - 
    \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    & \textcolor{gray}{
        \text{by statement hypothesis: } \sigma_{t + 1} = L\tilde \eta_t
    }
    \\
    &= 
    \sigma_{t + 1}(f(z_{t + 1}) - f_*) 
    - \sigma_{t}(f(z_t) - f_*) 
    + 
    \frac{\sigma_{t + 1}}{2L}\Vert \nabla f(y_t)\Vert^2 - 
    \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= \sigma_{t + 1} 
    \left(
        f(z_{t + 1}) - f_* + \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 
    \right)
    - \sigma_t(f(z_t) - f_*)
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    & \textcolor{gray}{
        f(y_t) - f(z_{t + 1}) \le \frac{1}{2L}\Vert \nabla f(y_t )\Vert^2 
        \text{, descent lemma}
    }
    \\
    \implies 
    &\le 
    \sigma_{t + 1}(f(y_t) - f_*) - \sigma_t(f(z_t) - f_*)
     - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= 
    \sigma_{t + 1}(f(y_t) - f(z_t) + f(z_t) - f_*) - \sigma_t(f(z_t) - f_*)
     - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= \sigma_{t + 1}(f(y_t) - f(z_t) ) +
    (\sigma_{t + 1} - \sigma_t)(f(z_t) - f_*)
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= (\sigma_{t + 1}- \tilde \eta_t)(f(y_t) - f(z_t)) +
    \tilde \eta_t(f(y_t) - f(z_t)) + 
    (\sigma_{t + 1} - \sigma_t)(f(z_t) - f_*)
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    & \textcolor{gray}{
        \text{Use relation: }
        \sigma_{t + 1} - \sigma_t \le \tilde \eta_t, \tilde \eta_t > 0
    }
    \\
    \implies 
    &\le 
    (\sigma_{t + 1}- \tilde \eta_t)(f(y_t) - f(z_t)) +
    \tilde \eta_t(f(y_t) - f(z_t)) + 
    \tilde \eta_t(f(z_t) - f_*)
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= 
    (\sigma_{t + 1}- \tilde \eta_t)(f(y_t) - f(z_t)) +
    \tilde \eta_t(f(y_t) - f_*)
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    & \textcolor{gray}{
        \begin{aligned}
            \text{Use inequalities: } &
            \\
            f(y_t) - f(z_t) 
            &\le \langle \nabla f(y_t), y_t - z_t\rangle
            \\
            f(y_t) - f_* 
            &\le \langle \nabla f(y_t), y_t - x_*\rangle
        \end{aligned} 
    }
    \\
    \implies &\le 
    (\sigma_{t + 1}- \tilde \eta_t)\langle \nabla f(y_t), y_t - z_t\rangle +
    \tilde \eta_t\langle \nabla f(y_t), y_t - x_*\rangle
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    & \textcolor{gray}{
        \text{Use } \sigma_{t + 1} = L \tilde \eta_t^2
    }
    \\
    &= 
    (L\tilde \eta_t^2 - \tilde \eta_t)\langle \nabla f(y_t), y_t - z_t\rangle +
    \tilde \eta_t\langle \nabla f(y_t), y_t - x_*\rangle
    - \tilde \eta_t \langle \nabla f(y_t), x_t - x_*\rangle
    \\
    &= 
    \tilde \eta_t\langle 
        \nabla f(y_t), 
        (L\tilde \eta_t - 1)(y_t - z_t) + y_t - x_* - x_t + x_*
    \rangle
    \\
    &= \tilde \eta_t
    \langle 
        \nabla f(y_t), 
        L\eta_t y_t - (L \tilde \eta_t - 1)z_t - x_t
    \rangle. 
\end{aligned}\tag{[1]}
}
$$

Finally, by the algorithm iterate $y_t$ has equality: 

$$
\begin{aligned}
    y_t &= (1 + L\eta_t)^{-1}(L\eta_t z_t + x_t)
    \\
    & \textcolor{gray}{
        \text{Use: } L\eta_t + 1 = L\tilde \eta_t, L\eta_t = L \tilde \eta_t - 1
    }
    \\
    y_t &= 
    (L\tilde \eta_t)^{-1}
    (
        (L\tilde \eta_t - 1)z_t + x_t
    )
    \\
    L\tilde \eta_t y_t &= 
    (L\tilde \eta_t - 1) z_t + x_t, 
\end{aligned}
$$

Continuing from (\[1\]), observe that we have now $\Phi_{t + 1} - \Phi_t \le 0$. 
The theorem is now proven. 

**Remarks**

Ryu's proof make use of a Lyapunov function. 
A Lyapunov function is a tool for verifying the convergence rate, and it's not the full techniques for figuring out the convergence rate. 
The full techniques requires taking the element inequalities into considerations and the optimality gaps. 
A Lyapunov arguments usually simplifies the proofs, and it may be used to investigate certain type of convergences for the algorithms. 




