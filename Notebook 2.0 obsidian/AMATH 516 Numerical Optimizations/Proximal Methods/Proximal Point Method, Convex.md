- [Smooth Gradient Descend The Basics](Smooth%20Gradient%20Descend%20The%20Basics.md)
- [Morau Envelope and Proximal Operators](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)

---
### **Intro**

We put the gradient descent method into the PPM frameworks. 
This is the starting point of unifying computational approaches that involves the use of the proximal point method. 
Assume Finite dimensional Euclidean space. 
I believe the results in this page is easily generalizable. 
Our attention is on the method of proximal point: 

$$
\begin{aligned}
    x_{t + 1} = \prox{\eta_{t + 1} f}(x_t). 
\end{aligned}
$$

We introduce a Lyapunov function derived from PPM using Moreau envelope. 
We also derive the convergence rate of PPM. 
After that we present analogous result for inexact proximal algorithms and how this idea is powerful. 


#### **Lemma 1.1 | Convex Moreau Envelope Inequality**
> $f$ is convex, proper, lsc. 
> Then 
> $$
>    \left(f(p) + \frac{1}{2\alpha}\Vert x - p\Vert^2\right)
>     - 
>     \left(
>         f(y) + \frac{1}{2\alpha}\Vert x - y\Vert^2 
>     \right)
>     \le 
>     - \frac{1}{2\alpha}\Vert y - p\Vert^2 
>     \quad \forall y \in \R^n, 
> $$
> For all $y\in X$ and $p = \prox{\alpha f}(x)$. 

**proof**

By definition of the proximal operator, we have optimality of the point $p\in X$.
So it must be smaller than all other points a minimizing the expression $f(z) + (1/(2\alpha))\Vert x - z\Vert^2$, and we use the strong convexity. 

**Remarks**

Alternatively we can represent it as 

$$
\begin{aligned}
    \text{env}^\alpha_f(x) - 
    \left(
        f(y) + \frac{1}{2\alpha}\Vert x - y\Vert^2 
    \right) \le 
    -\frac{1}{2\alpha}\left\Vert y - \prox{\alpha f}(x)\right\Vert^2. 
\end{aligned}
$$

The quadratic growth conditions of $f$, is strictly weaker than strong convexity. 
There is potential for $f + (1/2)\Vert \cdot + x\Vert^2$ that is not necessarily a strongly convex function. 
The reader should ponder and appreciate that $y$ is free. 

Similarly, if $f$ is $\beta$-strongly convex, $f(\cdot) + \frac{1}{2\alpha}\Vert  \cdot - x\Vert$ is $\beta + (1/\alpha)$ strongly convex, hence we have $\forall y \in \R^n$: 

$$
\begin{aligned}
    \text{env}^\alpha_f(x) - 
    \left(
        f(y) + \frac{1}{2\alpha}\Vert x - y\Vert^2 
    \right) 
    \le 
    -\frac{(\beta + \alpha^{-1})}{2}\left\Vert y - \prox{\alpha f}(x)\right\Vert^2. 
\end{aligned}
$$

Which gives us more decrease. 
The theorem is readily available for Bregman proximal point method as well. 
See [Bregman Proximal Mapping](../Proximal%20Operator/Bregman%20Proximal%20Mapping.md) for more information. 

#### **Proposition 1.2 | Lyapunouv Function for Proximal Point Method**
> let $f$ be lsc and $\beta$-strongly convex where $\beta \ge 0$, then the function $\Phi_t$ is a Lyapunouv function of the proximal point method, with step size $(\eta_t)_{t \in \N}$. 
> $\Phi_t$ is 
> $$
> \Phi_t = 
> \left(
>     \sum_{i = 1}^{t} \eta_i
> \right)(f(x_t) - f(x_*)) + \frac{1}{2} \Vert x_* - x_t\Vert^2 \quad \forall t \ge 1. 
> $$
> Where $x_*$ is a minimizer of the function $f$ which we assume exists. 
> We also define that $\phi_0 = \frac{1}{2}\Vert x_0 - x_* \Vert^2$

**Proof**

Let $\phi_{t + 1}: \R^n \mapsto \overline \R = \eta_{t + 1} f$ be convex,  consider proximal point method $x_{t + 1} = \prox{\phi}(x_t)$, apply the optimality conditions of the Moreau envelope, we have $\forall u \in \R^n$

$$
\begin{aligned}
    & \phi_{t + 1}(x_{t + 1}) 
    + 
    \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
    - \phi_{t + 1}(u) - \frac{1}{2}\Vert u - x_t\Vert^2
    \le 
    - 
    \frac{1}{2}(1 + \beta\eta_{t + 1})\Vert 
        u - x_{t + 1}
    \Vert^2
    \\
    & \text{let } u = x_*
    \\
    &\quad 
    \begin{aligned}
        \implies &
        \eta_{t + 1}(f(x_{t + 1}) - f(x_*)) 
        + 
        \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
        +  
        \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
        -
        \frac{1}{2}\Vert x_* - x_t\Vert^2 
        \le 
        -\frac{\beta\eta_{t + 1}}{2}\Vert x_* - x_{t + 1}\Vert^2
        \\
        \iff & 
        \eta_{t + 1}(f(x_{t + 1}) - f(x_*)) 
        + 
        \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
        -
        \frac{1}{2}\Vert x_* - x_t\Vert^2 
        \le 
        - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
        -\frac{\beta\eta_{t + 1}}{2}\Vert x_* - x_{t + 1}\Vert^2
        \le 0
    \end{aligned}
    \\
    & \text{let } u = x_{t}
    \\
    &\quad  
    \begin{aligned}
        \implies& 
        f(x_{t + 1}) - f(x_t)
        \le 
        -\frac{1}{\eta_{t+1}} \Vert x_{t + 1} - x_t\Vert^2 
        - \frac{\beta}{2}\Vert x_t - x_{t + 1}\Vert^2
        \le 0
    \end{aligned}
\end{aligned}
$$


$\forall u$, define quantities

$$
\begin{aligned}
    \Upsilon_{1, t + 1}(u) &= 
    \eta_{t + 1}(f(x_{t + 1}) - f(u)) + \frac{1}{2}(
        \Vert x_{t + 1} - u\Vert^2 - 
        \Vert x_t - u\Vert^2
    )
    \\
    & \le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
    -\frac{\beta\eta_{t + 1}}{2}\Vert u - x_{t + 1}\Vert^2, 
    \\
    \Upsilon_{2, t + 1}
    &= 
    \eta_{t + 1}(f(x_{t + 1}) - f(x_t))
    \\
    &\le 
    - \Vert x_{t + 1} - x_t\Vert^2 - 
    \frac{\beta\eta_{t + 1}}{2}
    \Vert x_{t + 1} - x_t\Vert^2
    \\
    &= 
    -(1 + \beta\eta_{t + 1}/2)\Vert x_{t + 1} - x_t\Vert^2. 
\end{aligned}
$$

With $\Phi_t$ as defined in the proposition, observe the following demonstration for all $u$, $\beta \ge 0$: 

$$
\begin{aligned}
    \Phi_{t + 1} - \Phi_{t}
    &= 
    \left(
        \sum_{i = 1}^{t + 1}\eta_i
    \right)(f(x_{t + 1}) - f(u)) + 
    \frac{1}{2}\Vert x_{t + 1} - u\Vert^2 
    - 
    \left(
        \sum_{i = 1}^{t}\eta_i
    \right)(f(x_{t}) - f(u))
    - 
    \frac{1}{2}\Vert x_{t} - u\Vert^2
    \\
    &= 
    \left(\sum_{i = 1}^{t}\eta_{i}\right)
    (f(x_{t + 1}) - f(x_t)) 
    + \frac{1}{2}\Vert x_{t + 1} - u\Vert^2 
    - \frac{1}{2}\Vert x_{t} - u\Vert^2
    +
    \eta_{t + 1}(f(x_{t + 1}) - f(u))
    \\
    &= 
    \left(\sum_{i = 1}^{t}\eta_{i}\right)\Upsilon_{2, t + 1}
    + \Upsilon_{1, t + 1}(u)
    \\
    &\le 
    -\left(\sum_{i = 1}^{t}\eta_{i}\right)
    (1 + \beta\eta_{t + 1}/2)\Vert x_{t + 1} - x_t\Vert^2
    + 
    \left(
        - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
        -\frac{\beta\eta_{t + 1}}{2}\Vert u - x_{t + 1}\Vert^2
    \right)
    \le 0. 
\end{aligned}
$$

Therefore, we verified that $\Phi_t$ can indeed be a Lyapunouv function for the PPM algorithm.

**Remark**

This Lyapunouv function is not optimal for $\beta > 0$. 


#### **Thm 1.3 | Baseline Convergence via Method of PPM**
> The convergence rate of the proximal point method applied to $f$, closed, convex proper, we have convergence rate of the function value: 
> $$
>   f(x_T) - f(x_*) \le O\left(\left(\sum_{i=1}^{T}\eta_t\right)^{-1}\right). 
> $$
> Where $x_*$ is the minimizer of $f$. 

**Proof**

Let $\Delta_t = f(x_t) - f(x_0), \Upsilon_t = \sum_{i = 1}^{t}\eta_i$ so $\Phi_t = \Upsilon_t\Delta_t + \frac{1}{2}\Vert x_t - x_*\Vert^2$. 
Just do 

$$
\begin{aligned}
    \Upsilon_T\Delta_T \le \Phi_T 
    &\le 
    \Phi_0 = \frac{1}{2}\Vert x_0 - x_*\Vert^2 
    \\
    \implies \Delta_T 
    &\le 
    \frac{1}{2\Upsilon_T} \Vert x_0 - x_*\Vert^2. 
\end{aligned}
$$


**Remarks**

The convergence of $\Vert x_t - x^*\Vert^2$, or $x_t$, is not so obvious from this theorem alone. 
Additional assumptions for $f$ is required. 
I think we may need the operator theories in optimizations. 


---
### **Analysis of Prox Convex Lower Bounding Function**

Let $f$ convex differentiable and its gradient be $L$-Lipschitz smooth, then the proximal method assists with the derivation of gradient descent method. 
Use $l_f(x; \bar x)$ to be a linearization of function $f$ at point $\bar x$: 

$$
\begin{aligned}
    l_f(x ; \bar x) &= f(\bar x) + \langle \nabla f(x), x - \bar x\rangle \le f(x) 
    \quad \forall x \in X. 
\end{aligned}
$$

We consider the following PPM method with undetermined stepsize scheme: 

$$
\begin{aligned}
    x_{t +1} = \argmin{x\in X} \left\lbrace
        l_f(x; x_t) + \frac{1}{2\eta_{t + 1}}\Vert x - x_t\Vert^2
    \right\rbrace = x_t - \eta_{t + 1} \nabla f(x_t). 
\end{aligned}
$$

Our goal is to apply the Lyaponouv function derived for PPM, to the approximation above. 
The reader should observe additional error introduced by the above approximation and how it's controlled by smoothness assumption of the gradient of $f$. 

**Remark**

$l_f(x; \bar x)$, can be any lsc, closed, convexlower bound function that is favorable for the proximal operator. 
Proximal gradient is one fine example where $l_f(x; \bar x)$ is not necessarily a smooth function. 
We illusrate how this property is used in the below proof for a claim. 


#### **Thm 2 | Generic Descent Lemma via PPM of Lower Bounding Function and Upper Smoothness**
> Let $f$ be a function that has minimizer: $x_*$.
> Let $l_f(x; x_t)$ be a convex, lsc, proper lower bound function. 
> Let the lower bounding $\phi$ function satisfies inequality: 
> $$
> \phi_t(x) \le \eta_{t + 1}f(x) \le \phi_t(x) + \frac{L\eta_{n + 1}}{2}\Vert x - x_t\Vert^2 \quad \forall x \in X, 
> $$ 
> Assume an algorithm the makes: 
> $$
> \begin{aligned}
>     x_{t +1} = \argmin{x\in X} \left\lbrace
>         l_f(x; x_t) + \frac{1}{2\eta_{t + 1}}\Vert x - x_t\Vert^2
>     \right\rbrace, 
> \end{aligned}
> $$
> Then the iterates satisfies: 
> $$
> \begin{aligned}
>     \eta_{t + 1}(f(x_{t + 1}) - f(x_*)) + \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2
>     - \frac{1}{2}\Vert x_* - x_t\Vert^2
>     & \le 
>     \left(
>         \frac{L \eta_{n + 1}}{2} - \frac{1}{2}
>     \right)\Vert x_{t + 1} - x_t\Vert^2.
> \end{aligned}
> $$
> This is a result analogous to Lemma-1. 
> Furhter more, if $\exists \epsilon > 0: \eta_i\in (\epsilon, 2L^{-1} - \epsilon)\;\forall i \in \N$ then $f(x_T) -f(x_*)$ at a rate of $\frac{L - \epsilon^{-1}}{TL\epsilon}$ where $x_*$ is the minimizer of $f$. 

**Proof**

By $\phi_t(x)$ be a convex function and Lemma 1, Moreau Envelope Inequality produces $\forall u$: 

$$
{\small
\begin{aligned}
    \phi_t(x_{t + 1}) - \phi_t(u) - 
    \frac{1}{2}\Vert x_t - u\Vert^2 
    + 
    \frac{1}{2}\Vert u - x_{t + 1}\Vert^2 
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t \Vert^2
    \\
    \left(
        \phi_t(x_{t + 1}) + \frac{\eta_{t + 1}L}{2}\Vert x_{t+1} -x_t\Vert^2
    \right)
    - \phi_t(u) - \frac{1}{2}\Vert x_t - u\Vert^2 + \frac{1}{2}\Vert u - x_{t + 1} \Vert^2
    &\le 
    \left(
        \frac{\eta_{t + 1}L}{2} - \frac{1}{2}
    \right)\Vert x_{t+1} - x_t\Vert^2. 
\end{aligned}\tag{$\star$}
}
$$

Using the assumption of the lower bounding function of $f$, the hypothesis allows for 
$$
\begin{aligned}
    \left(
        \phi_t(x_{t + 1}) + 
        \frac{\eta_{t + 1}L}{2}\Vert x_{t+1} -x_t\Vert^2
    \right) &\ge \eta_{t + 1}f(x_{t + 1}), 
    \\
    - \phi_t(u) &\ge  - \eta_{t + 1}f(u), 
\end{aligned}
$$

substituting the above inequality into the RHS of $(\star)$, we obtain $\forall u \in X$: 

$$
\begin{aligned}
    \left(
        \eta_{t + 1} f(x_{t + 1}) - \eta_{t + 1}f(u)
    \right) 
    - \frac{1}{2}\Vert x_t - u\Vert^2 + 
    \frac{1}{2}\Vert u - x_{t + 1}\Vert^2 
    &\le 
    \left(
        \frac{\eta_{t + 1}L}{2} - \frac{1}{2}
    \right)
    \Vert x_{t + 1} - x_t \Vert^2. 
\end{aligned}
$$

Since this is true for all $x_t$, we can can claim that $\Phi_t = (\sum_{i = 1}^t \eta_i)(f(x_t) - f(x_*)) + \frac{1}{2}\Vert x_* - x_t\Vert^2$ is strictly non-increasing when $\eta_{t + 1}\le L^{-1}$. 
Surprisingly, if $\eta_i \in (0, 2L^{-1})$, $\Phi_{t}$ still convergeces. 
For simplicity we make $\sigma_t = \sum_{i = 1}^{t}\eta_i$. 
It starts with considerations that $(L\eta_{t + 1}/2 - 1) < 0$, so that 

$$
\begin{aligned}
    f(x_{t + 1}) - f(x_t) &\le 
    \left(\frac{L\eta_{t + 1}}{2} - 1\right)\Vert x_{t + 1} - x_t\Vert^2
    \\
    f(x_T) - f(x_0)
    &\le 
    \underbrace{
    \left(
        \frac{L\sigma_T}{2} - T
    \right)
    }_{< 0}
    \sum_{t = 0}^{T - 1}\Vert x_{t + 1} - x_t\Vert^2
    \\
    \implies 
    \sum_{t = 0}^{T -1}\Vert x_t - x_{t + 1}\Vert^2
    &\le 
    \left(
        \frac{L}{2}\sigma_T  - T
    \right)^{-1} 
    (f(x_T) - f(x_0))
\end{aligned}
$$

Continue on the RHS of $\Phi_{t + 1} - \Phi_t$ so 
$$
\begin{aligned}
    \sum_{t = 0}^{T - 1}\Phi_{t + 1} - \Phi_t 
    &\le 
    \left(
        \frac{L}{2}\sigma_T - \frac{T}{2}
    \right)\sum_{t = 0}^{T - 1}\Vert x_{t + 1} - x_t\Vert^2
    \\
    \Phi_T - \Phi_0 &\le 
    \left(
        \frac{\frac{L}{2}\sigma_T - \frac{T}{2}}{
            \frac{L}{2}\sigma_T - T
        }
    \right)
    (f(x_T) - f(x_0))
    \\
    &= 
    \left(
        \frac{L\sigma_T - T}{L\sigma_T - 2T}
    \right)
    (f(x_T) - f(x_0)), 
\end{aligned}
$$
implies
$$
\begin{aligned}
    \sigma_T (f(x_T) - f(y)) + \frac{1}{2}\Vert y - x_t\Vert^2
    - \frac{1}{2}\Vert y - x_0 \Vert^2 
    &\le 
    \left(
        \frac{L\sigma_T - T}{L\sigma_T - 2T}
    \right)
    (f(x_T) - f(x_0))
    \\
    \iff
    f(x_T) - f(y) + 
    \frac{1}{2\sigma_T}(\Vert y - x_t\Vert^2 - \Vert y - x_0\Vert^2)
    &\le 
    \left(
        \frac{L- T\sigma_T^{-1}}{2T - L\sigma_T}
    \right)
    (f(x_0) - f(x_T)), 
\end{aligned}
$$
therefore we obtain the bound: 
$$
\begin{align}
    f(x_T) - f(y) &\le 
    \left(
        \frac{L- T\sigma_T^{-1}}{2T - L\sigma_T}
    \right)
    (f(x_0) - f(x_T))
    - 
    \frac{1}{2\sigma_T}(\Vert y - x_t\Vert^2 - \Vert y - x_0\Vert^2)
\end{align}
$$
In the case where $\sup_{i\in \N} \eta_i \le 2L^{-1} - \epsilon$, and $\inf_{i\in \N}\eta_i \ge \epsilon$ with $\epsilon > 0$. 
Then we have 
$$
\begin{aligned}
    \frac{L -T\sigma_T^{-1}}{2T - L\sigma_T}
    &\le 
    \frac{L - \epsilon^{-1}}{2T - LT(2L^{-1} - \epsilon)}
    \\
    &= 
    \frac{L - \epsilon^{-1}}{2T - T(2 - L\epsilon)}
    \\
    &= 
    \frac{L - \epsilon^{-1}}{TL\epsilon}. 
\end{aligned}
$$
With $y = x_*$, by $f(x_t)$ strictly monotone decreasing, we get the claimed convergence rate by 
$$
\begin{aligned}
    f(x_T) - f(x_*) 
    &\le 
    \frac{L - \epsilon^{-1}}{TL\epsilon}(f(x_0) - f(x_T)) 
    \le 
    \frac{L - \epsilon^{-1}}{TL\epsilon}(f(x_0) - f(x_*)) 
\end{aligned}
$$


**Remark**

If, $f$ is differentiable, and $\phi_t(x) = l_f(x, x_t) = f(x_t) + \langle \nabla f(x_t), x - x_t\rangle$. 
Then, the upper $L$-Lipschitz gradient smooth condition and convexity of $f$ are backed into the inequality: 

$$
\eta_{t + 1}l_f(x, x_t) \le 
\eta_{t + 1} f(x) \le \eta_{t + 1}l_f(x, x_t) + \frac{\eta_{t + 1}L}{2}\Vert x - x_t\Vert^2
\quad \forall x \in X. 
$$

we empahsize that it's the upper smoothness wrt to 2-norm. 
In implementation of algorithms, we only need to make sure that: 

$$
\eta_{t + 1}l_f(x_{t + 1}, x_t) \le 
\eta_{t + 1} f(x_{t + 1}) \le \eta_{t + 1}l_f(x_{t + 1}, x_t) 
+ 
\frac{\eta_{t + 1}L_t}{2}\Vert x_{t + 1} - x_t\Vert^2
\quad \forall t \in \N. 
$$

for the appropriate $L_t$, this is called: "line search". 
This is strictly weaker than what is used to prove the theorem. 
There are some potential for generalization and creativity by considering various kind of convex $\phi_t(x)$. 
One can imagine maximizing $\eta_{t + 1}L_t$ by appropriate choice of $x_{t + 1}$ to obtain faster convergence rate. 


**Questions**

Would a similar analysis work for strongly convex functions, or it's going to be a different story since $\Phi_t$, the Lyapunov function would change accordingly? 
I don't have any good ideas but to use gradient descent on the envelope interpretation to asist the analysis in the strongly convex case. 

#### **Thm-2 | Stepsize and the Convergence of the Gradient Descent Method**
> Choose stepsize $0 < \eta_t \le L^{-1}$, then the method of PPM on convex lower bounding function (which is gradient descent) has convergence rate $\mathcal O\left(\sum_{i = 1}^{T}\eta_t^{-1}\right)$. 

**Proof**

Set $\eta_{t + 1} \in (0, L^{-1}]$, then we can conclude the same conclusion as theorem 1. 
Because the inequality in claim 1 are less than zero, and that makes the exact same inequalities as proposition 2, making the results of theorem 1 follows naturally. 

**Remarks**

In practice, the step size is usually constant, or it's determined by some type line search algorithm. 

#### **Corollary-2.1 | Proximal Gradient Descent**
> Consider additive composite $f = g + h$ where $g$ is convex and $h$ is convex smooth with $L$-Lipschitz gradient. 
> Consider $l_f(x; \bar x) = g(x) + h(\bar x) + \langle \nabla h(\bar x), x - \bar x\rangle$. 
> Then proximal point method $x_{t + 1} \in \text{prox}[l_f(\cdot, \bar x)](x_t)$ produces the proximal gradient method and the above convergence analysis.   

**Proof**

The proximal point on $l_f(x, \bar x)$, is proximal gradient, that part is obvious. 
See [Proximal Gradient, Forward Backwards Envelope](Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md) for more information.
Next, $l_f(\cdot, \bar x)$ is convex for all $\bar x \in X$, and by convexity of $g$, it is a lower bounding function for $f$. 
The function $h$ is smooth, and therefore the upper bound
$$
    f(\cdot) \le l_f(\cdot | x_t) + \frac{L}{2}\Vert\cdot - x_t\Vert^2 
$$
applies. 
The inequality in Theorem 2 is satisfied hence the results of theorem 2 applies. 

---
### **The PPM with Strongly Convex Objective**

It may be counter intuitive to write things in this order, but we will see the necessity since the convergence proof for PPM for strongly convex objective function involves more theorems. 
The proof below will be similar to proving the convergence rate of gradient descent on a strongly convex and Lipchitz smooth function. 
To elucidate recall from [Proximal Point Method, Interpretations](Proximal%20Point%20Method,%20Interpretations.md) that, the proximal point method with a constant stepsize is equivalent to gradient descent on the Moreau Envelope of the function. 
The only difference here is that our PPM analysis is based on varying stepsizes. 

#### **Theorem 3.1 | PPM Convergence for Strongly Convex Function**
> Let $f$ be $\beta$-strongly convex. 
> Then the proximal point method has a linear convergence rate with a ratio of $(1 -\eta_{t + 1}\beta)$. 

**Proof**

With $\beta$-strong convexity of $f$, the proximal operator $P_{t + 1}=(I + \eta_{t + 1}\partial f)^{-1}$ is a contraction with constant $(1 + \beta_{t + 1})^{-1}$ where $\beta_{t+ 1} = \eta_{t + 1}\beta$ for all $t \in \N$. 
We can conclude that $I - P_{t + 1}$ is $1 - (1 + \beta)^{-1}$ strongly monotone and Lipschitz smooth by

$$
\begin{aligned}
    0 &\le \langle P_{t + 1} x - P_{t + 1} y, x - y\rangle 
    \\
    &\le \Vert P_{t + 1}x - P_{t + 1} y\Vert \Vert x - y\Vert \leftarrow \text{ Cauchy }
    \\
    &\le (1 + \beta_{t + 1})^{-1} \Vert x - y \Vert^2 \leftarrow \text{ Contraction} 
    \\
    \implies 
    - (1 + \beta_{t + 1})^{-1} \Vert x - y\Vert^2 
    &\le 
    \langle -(P_{t + 1} x - P_{t + 1}y), x - y\rangle \le 0
    \\
    (1 - (1 + \beta_{t + 1})^{-1}) \Vert x - y\Vert^2 
    &\le 
    \langle (x - y) - (P_{t + 1}x - P_{t + 1}y), x - y\rangle 
    \le \Vert x - y\Vert^2 
    \\
    (1 - (1 + \beta_{t + 1})^{-1}) \Vert x - y\Vert^2 
    &\le 
    \langle [I - P_{t + 1}]x - [I - P_{t + 1}]y, x - y\rangle 
    \le \Vert x - y\Vert^2. 
\end{aligned}
$$

Recall from [[Moreau Envelope and Convex Proximal Mapping]] that for any convex $g$ the gradient on the Moreau Envelope of $g$ has

$$
\begin{aligned}
    \underbrace{\nabla \left[x \mapsto \min_{u}\left\lbrace
        g(u) + \frac{1}{2}\Vert u - x\Vert^2
    \right\rbrace\right](x)}_{
        \nabla \env{g}(x)
    } 
    &= 
    x - (I + \partial g)^{-1}x, 
\end{aligned}
$$

with $g = \eta_{t + 1}f$ then the above is 

$$
\begin{aligned}
   \nabla \env{\eta_{t + 1}f}(x) = 
   x - (I + \eta_{t + 1}\partial f)^{-1}x = [I - P_t] x, 
\end{aligned}
$$

naming $\env{\eta_{t+ 1}f}$ as $F_{t + 1}$ for short, we have $\forall t \in \Z_+: \nabla F_{t + 1} = [I - P_{t + 1}]x$ being a strongly monotone operator, which we previously derived. 
Therefore, $F_{t + 1}$ is a strongly convex function and Lipschitz smooth function with constants: $(1 - (1 + \beta_{t + 1})^{-1}), 1$. 
Now, we make use of the Lipschitz Smoothness and strong convexity to yield: 

$$
\begin{aligned}
    F_{t + 1}(x_{t + 1}) - F_{t + 1}(x_t) &= 
    F_{t + 1}(P_{t + 1} x_t)  - F_{t + 1}(x_t)
    \\
    &= F_{t + 1}(x_t - (x_t - P_{t + 1}x_t)) - F_{t + 1}(x_t)
    \\
    &= 
    F_{t + 1}(x_t - \nabla F_{t + 1}(x_t)) - F_{t + 1}(x_t)
    \\
    &\le - \frac{1}{2}\Vert \nabla F_{t + 1}(x_t)\Vert^2 \leftarrow \text{ By $1$-Lipschitz Smooth}. 
\end{aligned}
$$

Next, by strongly convexity of $F_{t + 1}$, let $x_* = \argmin{x}f(x) = \argmin{x}F_{t + 1}(x)$ (it's one of the implications stated in [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)) we would have for all $t \in \N$: 
$$
\begin{aligned}
    \frac{1}{2} \Vert \nabla F_{t + 1}(x_t)\Vert^2 &\ge 
    (1 - (1 + \beta_{t + 1})^{-1})(
        F_{t + 1}(x_t) - F_{t + 1}(x_*)
    ) \leftarrow \text{ Result of Strong convexity. }
    \\
    \implies 
    F_{t + 1}(x_{t + 1}) - F_{t + 1}(x_t)
    &\le 
    -(1 - (1 + \beta_{t + 1})^{-1}) (F_{t + 1}(x_t) - F_{t + 1}(x_*))
    \\
    F_{t + 1}(x_{t + 1}) - F_{t + 1}(x_*)
    &\le 
    F_{t + 1}(x_t) - F_{t + 1}(x_*) 
    -(1 - (1 + \beta_{t + 1})^{-1}) (F_{t + 1}(x_t) - F_{t + 1}(x_*))
    \\
    &= 
    (1 + \beta_{t + 1})^{-1} (F_{t + 1}(x_t) - F_{t + 1}(x_*))
    \\
    \iff 
    F_{t + 1}(x_{t + 1}) - F_{t + 1}(x_*) 
    &\le (1 + \beta_{t + 1})^{-1}(F_{t + 1}(x_t) - F_{t + 1}(x_*))
\end{aligned}
$$

This establishes the descent of optimality gap for one step of the iteration. 
Amazingly, unrollowing the above would yield: 

$$
\begin{aligned}
    F_{t + 1}(x_{t + 1}) - F_{t+1}(x_*) &\le 
    \left(
        \prod_{j = 0}^{t} (1 + \beta_{t + 1})^{-1} 
    \right)(F_{1}(x_0) - F_1(x_*)). 
\end{aligned}\tag{$[*]$}
$$

Recall the property of a Moreau Envelope and by the definition of $F_{t + 1}$ satisfies for all $x$: 

$$
\begin{aligned}
    \eta_{t + 1} f(x)
    &\le 
    F_{t + 1}(x) = \eta_{t + 1} f(P_{t + 1} x) + \frac{1}{2}\Vert P_{t + 1}x - x \Vert^2 
    \le 
    \eta_{t + 1} f(x). 
\end{aligned}
$$

Continuing (\[*\]), we can simplify with the above and $F_0 = f$ so 

$$
\begin{aligned}
    f(x_{t + 1}) - f(x_*) &\le 
    \eta_{t + 1}^{-1} 
    \left(
        \prod_{j = 0}^{t} (1 + \beta_{t + 1})^{-1} 
    \right)(F_1(x_0) - f(x_*)), 
\end{aligned}
$$

where $\beta_{t+ 1} = \eta_{t + 1}\beta$ for all $t \in \Z_+$. 


**Comments**

From a theoretical point of view, this proof is not good and it's kinda cheating since it made use of the gradient descent interpretation and theory of monotone operator, while at the same time, reusing the same old convergence proof of gradient descent instead of innovating the old ideas. 

We try an alternative approach the addresses the above comment. 
The alternative proof doesn't use the Lipschitz smoothness of the Moreau envelope. 

**Alternative Proof**

With $\beta$-strongly convex $f$, let $\phi = \eta_{t + 1}f$, let $E_\phi(x)$ be $\min_u \{\eta_{t + 1} f(u) + (1/2)\Vert u - x\Vert^2\}$ which is the Moreau envelope of $\phi$, let $P_\phi := [I + \eta_{t + 1}\partial f]^{-1}$. 
For any $x_0$ let $x_{t + 1} = P_\phi(x_t)$, with $x_* \in \argmin{x} \phi(x)$, we realize these consequences:
1. $I - P_\phi$ is a $1 - (1 + \eta_{t + 1}\beta)^{-1}$ strongly monotone operator;
2. $\nabla E_\phi = I - P_\phi$, meaning that $E_\phi$ is $1 - (1 + \eta_{t + 1}\beta)^{-1}$ strongly convex;
3. $P_\phi$ is a contractive mapping with constant $(1 + \beta\eta_{t + 1})^{-1}$. 

Using strong convexity of the Moreau envelope it has 

$$
\begin{aligned}
    \frac{1}{2}\Vert \nabla E_\phi(x_t)\Vert^2 
    &\ge 
    (1 - (1 + \beta\eta_{t + 1})^{-1}) (E_\phi(x_t) - E_\phi(x_*))
    \\
    &\ge 
    (1 - (1 + \beta\eta_{t + 1})^{-1})\left(
        \frac{1}{2}(1 - (1 + \beta\eta_{t + 1})^{-1})
    \right)\Vert x - x_*\Vert^2
    \\
    &= 
    \frac{1}{2}\left(
        1 - (1 + \eta_{t + 1}\beta)^{-1}
    \right)^2 \Vert x_t - x_*\Vert^2
\end{aligned}
$$

invoke PPM descent inequality on the function $\phi$, it has 

$$
{\small
\begin{aligned}
    E_\phi(x_{t + 1}) - \phi(x_*) - \frac{1}{2}\Vert x_t - x_*\Vert^2 
    &\le 
    -\frac{1 + \eta_{t + 1}\beta}{2}\Vert x_{t + 1} - x_*\Vert^2
    \\
    \iff 
    \phi(x_{t + 1}) - \phi(x_*)
    &\le 
    -\frac{1}{2}(1 + \eta_{t + 1}\beta)\Vert x_{t + 1} - x_*\Vert^2
    - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2 
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    \\
    \implies 
    \phi(x_{t + 1}) - \phi(x_*)
    &\le 
    -\frac{1}{2}(1 + \eta_{t + 1}\beta)\Vert x_{t + 1} - x_*\Vert^2
    - \frac{1}{2}(1 - (1 + \eta_{t + 1}\beta)^{-1})^2\Vert x_t - x_*\Vert^2
    + \frac{1}{2}\Vert x_t - x_*\Vert^2
    \\
    \iff
    \phi(x_{t + 1}) - \phi(x_*)
    &\le 
    -\frac{1}{2}(1 + \eta_{t + 1}\beta)\Vert x_{t + 1} - x_*\Vert^2
    + \frac{1}{2}\left(
        1 - (1 - (1 + \eta_{t + 1}\beta)^{-1})^2
    \right)
    \Vert x_t - x_*\Vert^2
    \\
    \implies
    \phi(x_{t + 1}) - \phi(x_*)
    &\le 
    -\frac{1}{2}(1 + \eta_{t + 1}\beta)\Vert x_{t + 1} - x_*\Vert^2
    \\
    & \quad 
    + \frac{1}{2}\left(
        1 - (1 - (1 + \eta_{t + 1}\beta)^{-1})^2
    \right)
    \left(
        \prod_{i = 1}^{t}
            (1 + \eta_i \beta)^{-1}
    \right)\Vert x_0 - x_*\Vert^2. 
\end{aligned}
}
$$

On the last inequality, we used the property of $P_\phi$ being a $(1 + \eta_{t + 1}\beta)^{-1}$ contractive mapping. 
Using the definition of $\phi$, we have 

$$
\begin{aligned}
    f(x_{t + 1}) - f(x_*)
    &\le 
    -\frac{1}{2\eta_{t + 1}}(1 + \eta_{t + 1}\beta)\Vert x_{t + 1} - x_*\Vert^2
    \\
    & \quad 
    + \frac{1}{2\eta_{t + 1}}\left(
        1 - (1 - (1 + \eta_{t + 1}\beta)^{-1})^2
    \right)
    \left(
        \prod_{i = 1}^{t}
            (1 + \eta_i \beta)^{-1}
    \right)\Vert x_0 - x_*\Vert^2, 
\end{aligned}
$$

and the convergence is asymptotically $\mathcal O\left(\prod_{i = 1}^{t} (1 + \eta_i\beta)^{-1}\right)$. 

**Comment:** 

The convergence rate is a bit too good to be true, considering upper bounding $(1/2)\Vert x_0 - x_*\Vert^2 \le (\eta_{t + 1}\beta)(f(x_t) - f(x_*))$ applied to the middle of the inequality to derive step-wise Lyapunov function, then we are in trouble. 

---
### **Analysis of Prox Convex Lower Bounding Function (Strongly Convex)**

In this section, we consider lower bounding functions that are strongly convex, in which case we hope to make use of proximal point method with strongly convex objective that has a constant $\mu$. 

#### **Condition 1 | Strongly Convex Lower-Bounding Function**
> 


---
### **Proximal Point in the Rockafellar Manner**

This section will only summarizes some of the key results from Rockafellar's writing of the proximal point method in the convex case. 
In this section we briefly view over how geniuses like Rockafellar handles the situations. 

#### **Assumption (A), (B) | Approximation on PPM**


