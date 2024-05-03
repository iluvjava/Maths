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

We introduce a Lyponouv function derived from PPM using Moreau envelope. 
We also derive the convergence rate of PPM. 
After that we present analogous result for inexact proximal algorithms and how this idea is powerful. 


#### **Lemma 1 | Convex Moreau Envelope Inequality**
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

#### **Proposition 2 | Lyaponouv Function for Proximal Point Method**
> let $f$, then the function $\Phi_t$ is a Lyponouv function of the proximal point method, with step size $(\eta_t)_{t \in \N}$. 
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

Let $\phi: X \mapsto \overline \R$ be convex,  consider proximal point method $x_{t + 1} = \prox{\phi}(x_t)$, apply the optimality conditions of the Moreau envelope, we have $\forall u \in \R^n$

$$
\begin{aligned}
    & \phi(x_{t + 1}) + \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
    - \phi(u) - \frac{1}{2}\Vert u - x_t\Vert^2
    \le 
    - 
    \frac{1}{2}\Vert 
        u - x_{t + 1}
    \Vert^2
    \\
    & \text{let } \phi = \eta_{t + 1} f, u = x^*
    \\
    &\quad 
    \begin{aligned}
        \implies &
        \eta_{t + 1}(f(x_{t + 1}) - f(x_t)) 
        + 
        \frac{1}{2}\Vert x^* - x_{t + 1}\Vert^2 
        +  
        \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
        -
        \frac{1}{2}\Vert x^* - x_t\Vert^2 \le 0
        \\
        \iff & 
        \eta_{t + 1}(f(x_{t + 1}) - f(x_t)) 
        + 
        \frac{1}{2}\Vert x^* - x_{t + 1}\Vert^2 
        -
        \frac{1}{2}\Vert x^* - x_t\Vert^2 
        \le 
        - \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
        \le 0
        \\
        \implies & 
        \eta_{t + 1}(f(x_{t + 1}) - f(x_t)) 
        + 
        \frac{1}{2}\Vert x^* - x_{t + 1}\Vert^2 
        -
        \frac{1}{2}\Vert x^* - x_t\Vert^2 
        \le 0
        \leftarrow \text{([INEQ1])}
    \end{aligned}
    \\
    & \text{let } u = x_{t}
    \\
    &\quad  
    \begin{aligned}
        \implies& 
        f(x_{t + 1}) - f(x_t) \le 0 \leftarrow \text{([INEQ2])}, 
    \end{aligned}
    
\end{aligned}
$$

Then, we consider the following operations

$$
\begin{aligned}
    & 
    ([\text{INEQ1}]) + \left(
        \sum_{ i =1}^{t} \eta_t 
    \right)([\text{INEQ2}]) \le 0 
    \\
    \iff &
    \eta_{t + 1}(f(x_{t + 1}) - f(x_*))
    + 
    \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2
    - 
    \frac{1}{2}\Vert x^* - x_t\Vert
    + 
    \left(
        \sum_{i = 1}^t \eta_i  
    \right)(f(x_{t + 1}) - f(x_t)) \le 0
    \\
    \text{ Observe that } &
    \\
    & 
    \begin{aligned}
        & \quad 
        \left(\sum_{i = 1}^{t} \eta_i\right)
        (f(x_{t + 1}) - f(x_t))
        \\
        &= 
        \left(\sum_{i = 1}^{t} \eta_i\right)
        (f(x_{t + 1})- f(x_*) + f(x_*) - f(x_t))
        \\
        &= 
        \left(\sum_{i = 1}^{t} \eta_i\right)(f(x_{t + 1}) - f(x_*)) - 
        \left(\sum_{i = 1}^{t} \eta_i\right)(f(x_t) - f(x_*))
    \end{aligned}
    \\
    \iff & 
    {\scriptsize
    = 
    \left(
        \sum_{i = 1}^{t + 1}\eta_i
    \right)(f(x_{t + 1}) - f(x_*))
    + 
    \frac{1}{2}
    \Vert x_{t + 1} - x_*\Vert^2 - 
    \left(
        \left(
            \sum_{i = 1}^{t}\eta_i
        \right)(f(x_{t}) - f(x_*))
        + 
        \frac{1}{2}
        \Vert x_{t} - x_*\Vert^2
    \right) \le 0
    }
    \\
    \iff & =
    \Phi_{t + 1} - \Phi_{t} \le 0. 
\end{aligned}
$$

Therefore, $\Phi_t$ is a Lyaponouv function of the proximal point method for convex, closed, proper $f$. 


**remarks**

We obesrve that, combining (\[INEQ1\]) and (\[INEQ2\]), we know that the function value and the error from the optimal solution $x^*$, decreases monotonically. 
The later is Fejer Monotonicity, and the former is much weaker implications. 



#### **Thm 1 | Baseline Convergence via Method of PPM**
> The convergence rate of the proximal point method applied to $f$, closed, convex proper, we have convergence rate of the function value: 
> $$
>   f(x_T) - f(x_*) \le O\left(\left(\sum_{i=1}^{T}\eta_t\right)^{-1}\right). 
> $$
> Where $x_*$ is the minimizer of $f$. 

**Proof**

With (\[INEQ1\]) alone. 
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

I am not sure about the convergence of $\Vert x_t - x^*\Vert^2$, or $x_t$. 



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


#### **Claim 1 | Inexact Lower Bounding PPM Descent Lemma**
> Let $l_f(x; x_t)$ be a convex, lsc, proper lower bound function. 
> Let $\phi(x) = \eta_{t + 1}l_f(x; x_t)$, 
> Let the lower bounding $\phi$ function satisfies inequality: 
> $$
> \phi(x) \le \eta_{t + 1}f(x) \le \phi(x) + \frac{L\eta_{n + 1}}{2}\Vert x - x_t\Vert^2, 
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
>     - \frac{1}{2}\Vert x_* - x_t\Vert 
>     & \le 
>     \left(
>         \frac{L \eta_{n + 1}}{2} - \frac{1}{2}
>     \right)\Vert x_{t + 1} - x_t\Vert^2.
> \end{aligned}
> $$
> This is a result analogous to Lemma-1. 

**Proof**

By $\phi(x)$ be a convex function and Lemma 1, Moreau Envelope Inequality produces: 

$$
{\small
\begin{aligned}
    \tag{$\star$}
    \phi(x_{t + 1}) - \phi(x_*) - 
    \frac{1}{2}\Vert x_t - x_*\Vert^2 
    + 
    \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    &\le 
    - \frac{1}{2}\Vert x_{t + 1} - x_t \Vert^2
    \\
    \left(
        \phi(x_{t + 1}) + \frac{\eta_{t + 1}L}{2}\Vert x_{t+1} -x_t\Vert^2
    \right)
    - \phi(x_*) - \frac{1}{2}\Vert x_t - x_*\Vert^2 + \frac{1}{2}\Vert x_* - x_{t + 1} \Vert^2
    &\le 
    \left(
        \frac{\eta_{t + 1}L}{2} - \frac{1}{2}
    \right)\Vert x_{t+1} - x_t\Vert^2
\end{aligned}
}

$$

Using the assumption of the lower bounding function of $f$, the hypothesis allows for 
$$
\begin{aligned}
    \left(
        \phi(x_{t + 1}) + \frac{\eta_{t + 1}L}{2}\Vert x_{t+1} -x_t\Vert^2
    \right) &\ge \eta_{t + 1}f(x_{t + 1}), 
    \\
    - \phi(x_*) &\ge  - \eta_{t + 1}f(x_*), 
\end{aligned}
$$

substituting the above inequality into the RHS of $(\star)$, we obtain: 

$$
\begin{aligned}
    \left(
        \eta_{t + 1} f(x_{t + 1}) - \eta_{t + 1}f(x_*)
    \right) 
    - \frac{1}{2}\Vert x_t - x_*\Vert^2 + 
    \frac{1}{2}\Vert x_* - x_{t + 1}\Vert^2 
    &\le 
    \left(
        \frac{\eta_{t + 1}L}{2} - \frac{1}{2}\Vert x_{t + 1} - x_t \Vert^2
    \right). 
\end{aligned}
$$

Since this is true for all $x_t$, we can can claim that $\Phi_t = (\sum_{i = 1}^t \eta_i)(f(x_t) - x(x_*)) + \frac{1}{2}\Vert x_* - x_t\Vert^2$ is strictly non-increasing when $\eta_{t + 1}\le L^{-1}$. 

