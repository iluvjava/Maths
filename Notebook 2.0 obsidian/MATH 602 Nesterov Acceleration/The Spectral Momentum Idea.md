- [V-FISTA](V-FISTA.md)
- [Cute Formula](../AMATH%20516%20Numerical%20Optimizations/Background/Euclidean%20Jensen's%20Equality.md)



---
### **Intro**

A slight modification can be made to the V-FISTA algorithm to estimate the $\mu$ the strongly convexity index while the algorithm is executing. 
Assume composition additive objective $h = f + g$ where $f$ is $L$ Lipschitz smooth and $\alpha \ge 0$ strong convex. 

**Define**
1. $\mathcal T_L = [I + L^{-1}\partial g]\circ[I + L^{-1}\nabla]$, denotes the proximal gradient operator. 
2. $\mathcal G_L = I - \mathcal T_L$ denotes the gradient mapping operator. 
3. $D_f(x, y) = f(x) - f(y) - \langle \nabla f(y), x - y\rangle$ is the Bregman divergence of the function. 

#### **The inexact V-FISTA algorithm**

Given Lipschitz constant $L$ for $f$, initialize any $x_0 = y_0$. 
Initialize $\mu_0$ satisfying $0 < \mu_0 \le L$, the algorithm generates iterates by the following procedures: 
$$
\begin{aligned}
    & \text{FOR }k = 1, \cdots N: 
    \\
    &\qquad
    \begin{aligned}
        & x_k = \mathcal T_L y_{k - 1}
        \\
        & \mu_k = \min\left(
            \mu_{k - 1},
            \frac{2D_f(x_k, x_{k - 1})}{\Vert x_k - x_{k - 1}\Vert^2}
        \right)
        \\
        & \rho_k = \sqrt{L/\mu_k}
        \\
        & y_k = x_k + (\rho_k - 1)/(\rho_k + 1)(x_k - x_{k - 1})   
    \end{aligned}
    \\
    & \text{END FOR}
\end{aligned}
$$

**Remarks**

This algorithm also support using line search for $L$ the lipschitz constant too.
Suppose that $\widetilde L \ge L$ given instead, then do

$$
\begin{aligned}
    & \text{WHILE: }
    D_f\left(
        T_{\widetilde L/2^k}y_k, y_k
    \right) \ge 
    \frac{\widetilde L}{2}
    \left\Vert T_{\widetilde L/2^k}y_k - y_k\right\Vert^2
    \\
    &\qquad 
    \begin{aligned}
        & k := k + 1   
    \end{aligned}
    \\
    & \text{END WHILE}
    \\
    & \widetilde L := \widetilde L/2^k
\end{aligned}
$$

before computing $x_k$, and use $\widetilde L$ instead. 
Alternative update rule for $\mu_k$ also include: 

$$
\begin{aligned}
    \mu_k &= 
    \frac{1}{2}
    \left(
		\mu_{k - 1} +
		\frac{2D_f(x_k, x_{k - 1})}{\Vert x_k - x_{k - 1}\Vert^2}
    \right)
\end{aligned}
$$

**Comments**

From a theoretical point of view, it's essential to consider the condition that can trigers an update of the sequence $\mu_k$ for the algorithm.
More specifically, fix any $k$, we consider the largest value of $k$ such that the following condition is true: 

$$
\begin{aligned}
    \mu
    \le 
    \frac{2D_f(x_k, x_{k - 1})}{\Vert x_k - x_{k - 1}\Vert^2}
    &
    \textcolor{red}{\le}
    \mu_k = 
    \frac{2D_f(x_t, x_{t - 1})}{\Vert x_t - x_{t - 1}\Vert^2}. 
\end{aligned}
$$

We need to characterize the necessary, and the sufficiant conditions that can cause the above inequality to be true (the type highlithed in red). 



----
### **Analysis of the heuristic**

<mark style="background: #FFF3A3A6;">We can show that the algorithm generates $\mu_k$ that converges to the true value of $\mu$, the strong convexity index for $f$ correctly, and very fast under a specific set of strong assumptions. 
</mark>

To show and claim something about the heuristic we need 2 lemmas. 
We also need to assume $g\equiv 0$, resulving in the proximal operator being the identity operator, and the algorithm becomes the accelerated gradient descent algorithm. 
We may work on generalizing that in the future. 

These lemmas will characterze the exact conditions when the algorithm updates the value of $\mu_k$ at the current iteration of the forloop, and it also shows the value that it updates $\mu_k$  to be as well. 

#### **Lemma 1**
> Let $f$ be strongly convex with $\alpha \ge 0$, then for all $\lambda \in [0, 1]$, for all $x, y$: 
> $$
> \begin{aligned}
>     D_f(\lambda x + (1 - \lambda)y, x)
>     & \le 
>     (1 - \lambda)D_f(y, x) - \alpha\frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2. 
> \end{aligned}
> $$

**Proof**

$$
\begin{aligned}
    D_f(\lambda x + (1 - \lambda)y, x)
    &= 
    f(\lambda x + (1 - \lambda)y) 
    - f(x) 
    - \langle \nabla f(x), \lambda x + (1 - \lambda)y - x\rangle
    \\
    & 
    \textcolor{gray}{\text{ by } f \text{ $\alpha$-strongly convex}}
    \\
    \implies &\le 
    \lambda f(x) + (1 - \lambda)f(y)
    - \alpha \frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2
    - f(x) 
    - \langle \nabla f(x), \lambda x + (1 - \lambda)y - x\rangle
    \\
    &= 
    (1 - \lambda)(f(y) - f(x))
    - \alpha \frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2
    - \langle \nabla f(x), (1 - \lambda)(y - x)\rangle
    \\
    &= (1 - \lambda)
    \left(
        f(y) - f(x) - \langle \nabla f(x), y -x\rangle
    \right)
    - \alpha \frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2
    \\
    &= (1 - \lambda)D_f(y, x) - \alpha \frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2. 
\end{aligned}
$$

**Remarks**

In the special case where $D_f$ is quadratic, for some weighted inner product and norm $\Vert \cdot\Vert_B$, the conditions of $\lambda \in [0, 1]$ can be relaxed. 
The next lemma will deal with that case: 

#### **Lemma 1.1**
> Let $f = \Vert \cdot\Vert^2_B/2 + \langle c, \cdot\rangle$ where $0 < \alpha \preceq B$, then we have for all $\lambda \in \R$ the inequality: 
> $$
> \begin{aligned}
>    D_f(\lambda x + (1 - \lambda)y, x) 
>    &\le 
>    (1 - \lambda)^2 D_f(x, y).
> \end{aligned}
> $$

**Proof**

Assume WLOG that $f = \frac{\Vert \cdot\Vert_B^2}{2}$ where we have $0 < \alpha \preceq B$, so that $B$ is a positive definite matrix that can induce $\langle ,\rangle_B$ and $\Vert \cdot\Vert_B$, giving us the opportunity to use the cute formula. 
Let $\lambda \in \mathbb R$, let's start the considerations of $D_f(\lambda x + (1 - \lambda)y, x)$ so by definition we have 

$$
\begin{aligned}
    & f(\lambda x + (1 - \alpha)y) - f(x) - \langle \nabla f(x), \lambda x + (1 - \lambda)y - x\rangle
    \\
    & \textcolor{gray}{
        \begin{aligned}
            f(\lambda x + (1 - \lambda)y) 
            &= 
            \frac{1}{2}\Vert \lambda x + (1 - \lambda)y\Vert^2
            \\
            &= 
            \frac{1}{2}
            \left(
                \lambda\Vert x\Vert_B^2 + (1 - \lambda)\Vert y\Vert_B^2
                - \lambda(1 - \lambda)\Vert x - y\Vert_B^2
            \right)
            \\
            &= 
            \lambda f(x) + (1 - \lambda)f(y) - \lambda(1 - \lambda)D_f(x, y)
        \end{aligned}
    }
    \\
    &= 
    \lambda f(x) + (1 - \lambda)f(y) - \lambda(1 - \lambda)D_f(x, y)
    - f(x) - \langle \nabla f(x), (1 - \lambda)(y - x)\rangle
    \\
    &= 
    (1 - \lambda)(f(y) - f(x))
    - f(x) - \langle \nabla f(x), (1 - \lambda)(y - x)\rangle
    - \lambda(1 - \lambda)D_f(x, y)
    \\
    &= (1 - \lambda)D_f(y, x) - \lambda(1 - \lambda)D_f(x, y)
    \\
    & 
    \textcolor{gray}{
        D_f(x, y) = D_f(y, x)
    }
    \\
    &= (1 - \lambda)^2 D_f(x, y). 
\end{aligned}
$$

We can WLOG assume $f = \frac{\Vert \cdot\Vert_B^2}{2}$ because with the added linear term, we have 

$$
\begin{aligned}
    f(\lambda x + (1 - \lambda)y) 
    &= 
    \frac{1}{2}\Vert \lambda x + (1 - \lambda)y\Vert^2
    \\
    &= \left(
        \lambda\Vert x\Vert_B^2 + (1 - \lambda)\Vert y\Vert_B^2
        - \lambda(1 - \lambda)\Vert x - y\Vert_B^2
    \right)
    +\lambda \langle c, x\rangle + (1 - \lambda)\langle c, y\rangle
    \\
    &= 
    \lambda f(x) + (1 - \lambda)f(y) - \lambda(1 - \lambda)D_f(x, y). 
\end{aligned}
$$

In a sense, Bregman divergence cannot see the linear term. 



#### **Lemma 1.2**
... 


#### **Lemma 2 | Descent lemma from smoothness**
> Assume $f$ is $L$-Lipschitz smooth and $\alpha$-strongly convex then $\forall x, y$: 
> $$
> \begin{aligned}
>   D_f\left(y - L^{-1}\nabla f(y), x\right) &\le D_f(y, x) + \langle \nabla f(x_t), L^{-1}\nabla f(y_t)\rangle. 
> \end{aligned}
> $$

**Proof**
$$
\begin{aligned}
    D_f\left(y - L^{-1}\nabla f(y), x\right)
    &= f\left(y - L^{-1}\nabla f(y)\right) 
    - f(x)
    - \left\langle \nabla f(x), y - x - L^{-1} \nabla f(y)\right\rangle
    \\
    & \textcolor{gray}{\text{by $L$-smoothness: }}
    \\
    \implies 
    &\le 
    f(y) - \frac{1}{2L}\Vert \nabla f(y)\Vert^2
    - f(x)
    - \left\langle \nabla f(x), y - x - L^{-1} \nabla f(y)\right\rangle
    \\
    &=
    f(y) - f(x) - \langle \nabla f(x), y - x\rangle
    - \frac{1}{2L}\Vert \nabla f(y)\Vert^2
    + \left\langle \nabla f(x), L^{-1}\nabla f(y)\right\rangle
    \\
    &= D_f(y, x)
    - \frac{1}{2L}\Vert \nabla f(y)\Vert^2
    + \left\langle \nabla f(x), L^{-1}\nabla f(y)\right\rangle. 
\end{aligned}
$$

**Remark**

Relative smoothness can be used here if the assumption for $f$ is specifically strong, i.e: When function $f$ is just a convex quadratic function. 



#### **Lemma 3 | Diminishing Bregman divergence**
> Suppose that
> 1. $f = \Vert \cdot\Vert^2_B/2 + \langle c, \cdot\rangle$ where $L \succeq B \succeq \alpha > 0$. The matrix is positive definite and has a bounded spectrum. 
> 2. $g \equiv 0$ so $\mathcal T_L = I - L^{-1}\nabla f$. 
> 3. Let $(x_t, y_t)_{t \in \N \cup \{0\}}$ be generated by the Inexact V-FISTA algorithm. 
> Then the bregman divergence of successive iterates $x_{t + 1}, x_t$ satisfies inequality: 
> $$
> \begin{aligned}
>     D_f(x_{t + 1} - x_t) \le 
>     (1 - \lambda_t)^2D_f(x_{t - t}, x_t)
>     - 
>     \frac{1}{2}\Vert \nabla f(y_t)\Vert^2 
>     + 
>     \left\langle 
>         \nabla f(x_t), L^{-1}\nabla f(y_t)
>     \right\rangle
> \end{aligned}
> $$

**Proof**

Name $\theta_t = (\rho_t - 1)/(\rho_t + 1)$, then let's consider quantity $D_f(x_{t + 1}, x_t)$: 

$$
\begin{aligned}
    D_f(x_{t + 1}, x_t) &= 
    D_f\left(y_t - L^{-1}\nabla f(y_t), x_t\right)
    \\
    &= D_f(y_t, x_t)
    - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2
    + \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
    \\
    & \quad 
    \textcolor{gray}{
        \begin{aligned}
            y_t &= x_t + \theta_t(x_t - x_{t - 1})
            \\
            &= (1 + \theta_t)x_t - \theta_t x_{t - 1}   
            \\
            &= (1 + \theta_t)x_t + (1 - (1 + \theta_t))x_{t -1}
            \\
            &= \lambda_t x_t + (1 - \lambda_t)x_{t -1} \quad \text{where: } \lambda_t := (1 + \theta_t)
        \end{aligned}
    }
    \\
    &= D_f(\lambda_t x_t + (1 - \lambda_t)x_{t - 1}, x_t) 
    - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2
    + \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
    \\
    & \textcolor{gray}{\text{ use Lemma 1.1}}
    \\
    &\le 
    (1 - \lambda_t)^2 D_f(x_{t - 1}, x_t) 
    - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2
    + \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
\end{aligned}
$$

$f$ is quadratic so $D_f(x_{t - 1}, x_t) = D_f(x_t, x_{t - 1})$. 
Because $\theta_t \in [0, 1]$ by $\rho_t = \sqrt{L_t/\mu_t} \in [1, \infty]$, so $\lambda_t \in [1, 2]$ and $(1 - \lambda_t)^2=\theta_t^2 \in [0, 1]$ by $\lambda_t = 1 + \theta_t$. 

Finally, suppose that we have 

$$
\textcolor{red}{
\begin{aligned}
    - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2
    + \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle \le 0,
\end{aligned}\tag{1}
}
$$
Then the above inequality reduces to $D_f(x_{t + 1}, x_t) \le \theta_t^2D_f(x_t, x_t)$. 
The condition `(1)` makes the Bregman Divergence monotone decreasing for current iterate $t$.
How often do we have `(1)` really depends. 

**Remarks**

When the gradient on $y_t$, and on $x_t$ are not pointing in the same direction, then the above is definitely true. 
Futhermore, the smoothness conditions can be improved and make the inequality we prove an equality.
We list it and their equivalent representations: 

$$
\begin{aligned}
    D_f(x_{t + 1}, x_t) &= 
    (1 - \lambda_t)^2D_f(x_{t -1}, x_t) - \Vert L^{-1}\nabla f(y_t)\Vert_B^2
    + 
    \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
    \\
    &= 
    \theta_t^2D_f(x_{t -1}, x_t) - \Vert L^{-1}\nabla f(y_t)\Vert_B^2
    + 
    \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
    \\
    &= 
    \theta_t^2 \Vert x_{t - 1} - x_t\Vert^2_B
    - \langle L^{-1} \nabla f(y_t), L^{-1}B \nabla f(y_t)\rangle
    + 
    \langle \nabla f(x_t), L^{-1} \nabla f(y_t)\rangle
    \\
    &= 
    \theta_t^2 \Vert x_{t - 1} - x_t\Vert^2_B
    + 
    \left\langle  L^{-1}\nabla f(y_t), \nabla f(x_t) - L^{-1} B\nabla f(y_t)\right\rangle, 
    \\
    D_f(x_{t + 1}, x_t) &= 
    \theta_t^2\Vert x_{t - 1} - x_t\Vert_B^2 - \Vert L^{-1}\nabla f(y_t)\Vert_B^2
    + 
    \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
\end{aligned}
$$

Now, this is complicated and it hs several representations. 
The inequality above admits equivalent representations: 

$$
\begin{aligned}
    D_f(x_{t + 1}, x_t) &\le 
    \theta_t^2D_f(x_{t -1}, x_t) 
    - \frac{1}{2L}\Vert \nabla f(y_t)\Vert^2 + 
    \left\langle \nabla f(x_t), L^{-1}\nabla f(y_t)\right\rangle
    \\
    \iff 
    D_f(x_{t + 1}, x_t) 
    &\le 
    \theta_t^2 D_f(x_{t - 1}, x_t)
    -
    \frac{1}{2L}\left(
        \left\Vert
            \nabla f(y_t) - \nabla f(x_t)
        \right\Vert^2
        - 
        \left\Vert
            \nabla f(y_t)
        \right\Vert^2
    \right)
\end{aligned}
$$



#### **Lemma 3.1 | Diminishing norm of successive iterates**
> Let $g \equiv 0$ so $T_L = I - L^{-1}\nabla f$, let $(x_t, y_t)_{t \in \N}$ be generated by the inexact V-FISTA algorithm, then the error between the successive iterates satisfies equality: 
> $$
> \begin{aligned}
>     \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
>     = \frac{\theta^2_t}{2}\Vert x_t - x_{t - 1}\Vert^2
>     + \frac{1}{2}\Vert L^{-1}\nabla f(y_t)\Vert^2
>     - \theta_t\left\langle x_t - x_{t - 1}, L^{-1}\nabla f(y_t)\right\rangle. 
> \end{aligned}
> $$

**Proof**

It's direct: 

$$
\begin{aligned}
    \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
    &= 
    \frac{1}{2}\Vert 
        y_t - L^{-1}\nabla f(y_t) - x_t
    \Vert^2
    \\
    &= 
    \frac{1}{2}\Vert y_t - x_t\Vert^2 
    + 
    \frac{1}{2}\Vert L^{-1} \nabla f(y_t)\Vert^2
    - 
    \theta_t\left\langle x_t - x_{t - 1}, L^{-1} \nabla f(y_t)\right\rangle
    \\
    &= 
    \frac{\theta^2_t}{2}\Vert x_t - x_{t - 1} \Vert^2 
    + 
    \left\langle 
        \frac{1}{2L}\nabla f(y_t)
        - \theta_t(x_t - x_{t -1}), 
        L^{-1}\nabla f(y_t)
    \right\rangle. 
\end{aligned}
$$

**Remark**

When $\theta_t \in (0, 1)$, a lower bound can be established if we assume that: 

$$
\textcolor{red}{
    \begin{aligned}
        \left\langle 
            \frac{1}{2L}\nabla f(y_t)
            - \theta_t(x_t - x_{t -1}), 
            L^{-1}\nabla f(y_t)
        \right\rangle \ge 0. 
    \end{aligned}\tag{2}
}
$$

When, $x_t - x_{t - 1}$ alinged with the direction of $-\nabla f(y_t)$, this condition definitely true. 



---
### **Analyzing diminishing estimates of the strong convexity constant**


#### **Assumptions Set 1**
1. $f = \Vert \cdot\Vert^2_B/2 + \langle c, \cdot\rangle$ where $L \succeq B \succeq \alpha 
0$. The matrix is positive definite and has a bounded spectrum. 
1. $g \equiv 0$ so $\mathcal T_L = I - L^{-1}\nabla f$. 
2. Let $(x_t, y_t)_{t \in \N \cup \{0\}}$ be generated by the Inexact V-FISTA algorithm. 


#### **Sufficient conditions for decrease in estimate**
When `(1), (2)` are both true, then it is a sufficient condition under **Assumption Set 1** that triggers the algorithm (inexact V-FISTA) to update $\mu_{t}$ and then immediately $\mu_{t + 1}$ to decrease the their value. 
More specifically we have 

$$
\begin{aligned}
    \frac{D_f(x_{t + 1}, x_{t})}{\Vert x_{t + 1} - x_t\Vert^2}
    &\underset{(1)}{\le }
    \frac{\theta_t^2 D_f(x_t, x_{t - 1})}
    {\Vert x_{t + 1} - x_t\Vert^2}
    \\
    &
    \underset{(2)}{\le }
    \frac{\theta_t^2D_f(x_t, x_{t -1})}{\theta_t^2\Vert x_t - x_{t -1}\Vert^2}
    \\
    &= \frac{D_f(x_t, x_{t -1})}{\Vert x_t - x_{t -1 }\Vert^2}. 
\end{aligned}
$$

Therefore, conditions `(1), (2)` are sufficient to create a decrease in the estimate for the strong convexity index $\mu_{k + 1}$, from $\mu_{k}$ which was just updated. 

#### **An equivalent condition for decrease in the estimate**

Define quantitles: 

$$
\begin{aligned}
    \epsilon_t^{(1)} 
    &:= \left\langle  L^{-1}\nabla f(y_t), \nabla f(x_t) - L^{-1} B\nabla f(y_t)\right\rangle, 
    \\
    \epsilon_t^{(2)}
    &:= \left\langle 
        \frac{1}{2L}\nabla f(y_t)
        - \theta_t(x_t - x_{t -1}), 
        L^{-1}\nabla f(y_t)
    \right\rangle
    \\
    r_t^{(1)} &= 
    \epsilon_t^{(1)}/D_f(x_{t - 1}, x_t), 
    \\
    r_t^{(2)} &= 
    \epsilon_t^{(2)}/\Vert x_t - x_{t - 1}\Vert^2. 
\end{aligned}
$$

From lemma 3 remark and lemma 3.1 results, the ratio has 

$$
\begin{aligned}
    \frac{D_f(x_{t + 1}, x_t)}{\Vert x_{t +1} - x_t\Vert^2}
    &= 
    \frac{
        \theta_t^2D_f(x_{t - 1}, x_t) + \epsilon_t^{(1)}
    }{
        \theta_t^2\Vert x_t - x_{t - 1}\Vert^2 + 
        \epsilon_t^{(2)}
    }
    \\
    &= 
    \frac{
        \theta_t^2D_f(x_{t - 1}, x_t) + \epsilon_t^{(1)}
    }{
        \theta_t^2\Vert x_t - x_{t - 1}\Vert^2 + 
        \epsilon_t^{(2)}
    }
    \\
    &= 
    \frac{
        \theta_t^2D_f(x_{t - 1}, x_t) + r_t^{(1)}D_f(x_{t - 1}, x_t)
    }{
        \theta_t^2\Vert x_t - x_{t - 1}\Vert^2 + 
        r_t^{(2)}
        \Vert x_t - x_{t -1}\Vert^2 
    }
    \\
    &= 
    \left(
        \frac{\theta_t^2 + r^{(1)}_t}{
            \theta_t^2 + r^{(2)}_t
        }
    \right) 
    \frac{D_f(x_{t - 1}, x_t)}{\Vert x_{t - 1}, x_t\Vert^2}. 
\end{aligned}
$$

Now, a decrease is possible when the ratio is $\le 1$, equivalently it's saying that $r_t^{(1)} \le r_t^{(2)}$. 
It still remains difficult to analyze. 
The problem here is the $x_{t} - x_{t - 1}$ appearing together with $x_t$. 
Let's try the substitution $v_t = x_t - x_{t - 1}$, maybe that will assist with the analysis and things. 


---
### **Analyzing the sufficient conditions that makes monotone decrease of the strong convexity index estimate**

The conditions `(1), (2)`, depends on $(y_t, x_t)$, it's a 2 parameters setup, making things complicated. 
We need to rephrase the statementin by $y_t, x_t$. 
These parameters are not linked well together by the algorithm unfortunately. 
Take note that $\theta_t(x_t - x_{t - 1}) = y_t - x_t$, that makes conditions `(1), (2)`: 

$$
\begin{aligned}
    \frac{-1}{2L}\Vert \nabla f(y_t)\Vert^2 
    + 
    \langle \nabla f(x_t), L^{-1} \nabla f(y_t)\rangle 
    &\le 
    0 
    \\
    \iff 
    \Vert \nabla f(x_t)\Vert &\le 
    \Vert \nabla f(y_t) - \nabla f(x_t)\Vert
    \\
    \\
    \left\langle 
        \frac{1}{2L}\nabla f(y_t)
        - 
        (y_t - x_t), 
        L^{-1}\nabla f(y_t)
    \right\rangle 
    &\ge 0
    \\
    \iff 
    \left\Vert 
        y_t - x_t - L^{-1} \nabla f(y_t) 
    \right\Vert
    &\ge 
    \Vert y_t - x_t\Vert
\end{aligned}
$$

Recall that $\theta_t(x_t - x_{t -1})$. 
The first condition says that $\nabla f(y_t)$ turns at least 45 degree from $\nabla f(x_t)$. 
The second condition says that $y_t - x_t$ alings in direction with $-L^{-1} \nabla f(y_t)$. 
Adding together the fact that $y_t, x_t, x_{t - 1}$ are colinear. 
We have a pictural representation of when the parameters shrinks and the function being optimized is simply quadratic. 


---
### **Just bruteforce it omg**

Assume that $h = f + g$ where $g \equiv 0$ and $f = \frac{1}{2}\Vert\cdot \Vert_G$ where $\mathbf 0 \preceq  G \preceq I$ is a linear operator. 
Without loss of generality we can assume further that $G$ is a diagonal matrix whose diagonal elements are sorted by their magnitude. 
Apply the inexact V-FISTA algorithm, we are interested in analyzing $D_f(x_{t + 1}, x_{t})/\Vert x_{t + 1} - x_t\Vert^2$ when the algorithm is executing. 

Alternatively consider writing the algorithm using the velocity vector $v_t$: 
$$
\begin{aligned}
    v_t &= x_t - x_{t - 1}
    \\
    y_t &= x_t + \theta_t v_t
    \\
    x_{t + 1} &= y_t - G y_t. 
\end{aligned}
$$

Then consider updates: 

$$
\begin{aligned}
    x_{t + 1} &= y_t - Gy_t
    \\
    &= x_t + \theta_t v_t - G(x_t + \theta_t v_t)
    \\
    x_{t + 1} - x_t &= \theta_t v_t - Gx_t - \theta_t G v_t
    \\
    v_{t + 1}
    &= 
    \theta_t (I - G)v_t - G x_t. 
\end{aligned}
$$

Observe that if we define $d_0 := - x_0$, and $d_t := \sum_{i = 1}^{t}v_i - x_0$, so that $d_t + x_0$ is conceptually the total displacement vector up to $x_t$ from $x_0$, and $x_t = d_t = v_t + d_{t - 1}$
This makes $x_t = d_t$.
Then the above simplifies to: 

$$
\begin{aligned}
    v_{t + 1} &= \theta_t(I - G)v_t - G d_t
    \\
    &= \theta_t (I - G)v_t - G(v_t + d_{t - 1})
    \\
    &= \theta_t (I - G - \theta_t^{-1}G)v_t - G d_{t - 1}. 
\end{aligned}
$$

Make $P_t = \theta_t(I - (1 + \theta_t^{-1}) G)v_t$. 
The above is compactly represented as $v_{t + 1} = P_t v_t - G d_{t - 1}$. 
The quantity we are interested is written as: 

$$
\begin{aligned}
    \bar v_{t + 1} 
    &= v_{t + 1} / \Vert v_{t + 1}\Vert, 
    \\
    \langle \bar v_{t + 1}, A\bar v_{t + 1}\rangle
    &= 
    \frac{
        \Vert 
            \theta_t v_t - Gy_t
        \Vert_G^2
    }{
        \Vert 
            \theta_t v_t - Gy_t
        \Vert^2
    }
    \\
    &= \frac{
        \Vert \theta_t v_t\Vert_G^2
        + \Vert Gy_t\Vert_G^2 - 2 \theta_t \langle v_t, G^2 y_t\rangle
    }{
        \Vert \theta_t v_t\Vert^2 
        + \Vert Gy_t\Vert^2 
        - 2 \theta_t \langle v_t, G y_t\rangle
    }. 
\end{aligned}
$$

**Try this instead**

Consider the divergence between $y_{t + 1}, y_t$ in the same context. 
From the algorithm it has $y_t = [I - G]y_{t - 1} + \theta_t([I - G]y_{t - 1} - [I - G]y_{t - 2})$.
It's the extrapolation of the gradient descent operator instead of the gradient descent operator on a extrapolated quantity. 
Which makes: 
$$
\begin{aligned}
    y_t - y_{t - 1} &= 
    -Gy_{t - 1} + \theta_t([I - G] y_{t - 1} - [I - G]y_{t - 2})
    \\
    &= - Gy_{t - 1} + \theta_t[I - G](y_{t - 1} - y_{t - 2}). 
\end{aligned}
$$

If we consider the substitution $v_t = y_t - y_{t - 1}$, and $T = I - G$, then the above simplifies to 

$$
\begin{aligned}
    v_t 
    &= - Gy_{t - 1} + \theta_t T v_{t - 1}
    \\
    &= -G(v_{t - 1} + y_{t - 2}) + \theta_t T v_{t - 1} 
    \\
    &= [- G + \theta T] v_{t - 1} - G y_{t - 2} 
    \\
    &= [- G + \theta T] v_{t - 1} - G (v_{t - 2} + y_{t - 3})
    \\
    & \textcolor{gray}{
        \text{Double linear recurrences on $v_t$}
    }
    \\
    &= [- G + \theta T] v_{t - 1} - G v_{t - 2} -G y_{t - 3}.  
\end{aligned}
$$

This observation has more beauty in it because an extrapolation step inside of the gradient operator is generally hard to analyze when the gradient is not an linear operator. 
This also makes things more relevant because the algorithm actually evaluates gradient on $y_t$ but it doesn't evaluate at $x_t$. 

---
### Use block linear recurrence

Simplyfing: 

$$
\begin{aligned}
    y_t &= T y_{t - 1} + \theta_t T(y_{t - 1} - y_{t - 2})
    \\
    &= (T + \theta_t T) y_{t - 1} - \theta_t T y_{t - 2}
    \\
    \begin{bmatrix}
        y_{t - 1}  \\ y_{t}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf 0 & I 
        \\
        - \theta_t T
        & T + \theta_t T
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} \\ y_{t - 1}
    \end{bmatrix}
    \\
    \begin{bmatrix}
        y_{t - 1}
        - y_{t - 2}
        \\ y_{t} - y_{t - 1}
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        \mathbf -I & I 
        \\
        - \theta_t T
        & - G + \theta_t T
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} 
        \\ 
        y_{t - 1}
    \end{bmatrix}
    \\
    &=
    \begin{bmatrix}
        I & \mathbf 0 
        \\
        \theta_t T & I 
    \end{bmatrix}
    \begin{bmatrix}
        -I & I 
        \\ 
        \mathbf 0 
        &
        - G
    \end{bmatrix}
    \begin{bmatrix}
        y_{t - 2} \\ y_{t - 1} 
    \end{bmatrix}
\end{aligned}
$$

Next we need an eigen decomposition on the matrix symbolically.
Which is actually not hard. 
Since $G$ is semi-definite it admits ortho-normal decomposition $G = V \Lambda V^T$. 
We do an eigen decomposition on the matrix 
$$
\begin{aligned}
   \begin{bmatrix}
        -I & I 
        \\ 
        \mathbf 0 
        &
        - G
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        -I & I 
        \\ 
        \mathbf 0 
        &
        - V\Lambda V^T
    \end{bmatrix}
    \\
    &= 
    \begin{bmatrix}
        I & 
        \\
        & V
    \end{bmatrix}
    \begin{bmatrix}
        -I & I 
        \\ 
        \mathbf 0 
        &
        -\Lambda
    \end{bmatrix}
    \begin{bmatrix}
        I & 
        \\
        & V^T
    \end{bmatrix}. 
\end{aligned}
$$

Next observe that it's a permutation away from a block 2x2 upper diagonal matrix: 

$$
\begin{align*}
    \begin{bmatrix}
        -I & I 
        \\ 
        \mathbf 0 
        &
        -\Lambda
    \end{bmatrix}
    &= 
    P_\pi
    \text{diag}
    \left(
        \begin{bmatrix}
            1 & 1
            \\
            0 & -\lambda_i
        \end{bmatrix}
        : 
        i = 1, \cdots n
    \right)
\end{align*}
$$

Where 

$$
\begin{aligned}
    (\forall i = 1, \cdots 2n): 
    P_\pi e_i = \begin{cases}
        e_{j}, \text{where } j = \lfloor i/2\rfloor & \text{if } i \equiv 1 \text{ mod } 2
        \\
        e_{j}, \text{where } j = n +  i/2 & \text{else}
    \end{cases}
\end{aligned}
$$

So the above decomposition has 

$$
\begin{aligned}
    \begin{bmatrix}
        -I & I \\ \mathbf 0 & -G 
    \end{bmatrix}
    &=   
    \begin{bmatrix}
        I & 
        \\
        & V
    \end{bmatrix} P_\pi^TP_\pi
    \text{diag}
    \left(
        \begin{bmatrix}
            1 & 1
            \\
            0 & -\lambda_i
        \end{bmatrix}
        : 
        i = 1, \cdots n
    \right)
    P_\pi^T P_\pi 
     \begin{bmatrix}
        I & 
        \\
        & V
    \end{bmatrix}^T. 
\end{aligned}
$$

We perform decomposition on the smaller 2x2 matrix to get its eigen system first. 
This would just be

$$
\begin{aligned}
    \begin{bmatrix}
        1 & 1
        \\
        0 & -\lambda_i
    \end{bmatrix}
    &= 
    \begin{bmatrix}
        1 & \frac{1}{1 - \lambda_i}
        \\
        0 & -1
    \end{bmatrix}
    \begin{bmatrix}
        1 & 
        \\
        & - \lambda_i
    \end{bmatrix}
    \begin{bmatrix}
        1 & \frac{1}{1 - \lambda_i}
        \\
        0 & -1
    \end{bmatrix}^T. 
\end{aligned}
$$

Therefore the block matrix admits eigen decomposition: 


