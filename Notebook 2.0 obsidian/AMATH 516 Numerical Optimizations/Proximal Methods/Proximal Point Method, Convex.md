- [Smooth Gradient Descend The Basics](Smooth%20Gradient%20Descend%20The%20Basics.md)
- [Morau Envelope and Proximal Operators](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)

---
### **Intro**

We put the gradient descent method into the PPM frameworks. 
This is the starting point of unifying computational approaches that involves the use of the proximal point method. 
We make the assumption that $f$ is a convex function. 
Assume Finite dimensional Euclidean space. 
I believe the results in this page is easily generalizable. 
Our attention is on the method of proximal point: 

$$
\begin{aligned}
    x_{t + 1} = \prox{\eta_t f}(x_t). 
\end{aligned}
$$

and one of its variant, the method of gradient descent. 


#### **Lemma | Foundamental Prox Lemma for Prox Lyaponouv Function**
> $f$ is convex, proper, lsc. 
> Then 
> $$\left(f(p) + \frac{1}{2\alpha}\Vert x - p\Vert^2\right)
>     - 
>     \left(
>         f(y) - \frac{1}{2\alpha}\Vert x - y\Vert^2 
>     \right)
>     \le 
>     - \frac{1}{2\alpha}\Vert y - p\Vert^2 
>     \quad \forall y \in \R^n, 
> $$
> For all $y\in X$ and $p = \prox{\alpha f}(x)$. 

**proof**

By definition of the proximal operator, we have optimality of the point $p\in X$.
So it must be smaller than all other points a minimizing the expression $f(z) + (1/(2\alpha))\Vert x - z\Vert^2$, and we use the strong convexity. 


#### **Proposition | Lyaponouv Function for Proximal Point Method**
> let $f$, then the function $\Phi_t$ is a Lyponouv function of the proximal point method, with step size $(\eta_t)_{t \in \N}$. 
> $\Phi_t$ is 
> $$
> \Phi_t = 
> \left(
>     \sum_{i = 1}^{t} \eta_i
> \right)(f(x_t) - f(x_*)) + \frac{1}{2} \Vert x_* - x_t\Vert^2 \quad \forall t \ge 1. 
> $$
> Where $x_*$ is a minimizer of the function $f$ which we assume exists. 
> We also define that $\phi_0 = \frac{1}{2}\Vert x_0 - x_* \Vert$

**Proof**

Let $\phi: \R\mapsto \overline \R$, consider $x_{t + 1} = \prox{\phi}(x_t)$, apply the optimality conditions of the Moreau envelope, we have $\forall u \in \R^n$

$$
\begin{aligned}
    & \phi(x_{t + 1}) + \frac{1}{2}\Vert x_{t + 1} - x_t\Vert^2
    - \phi(u) - \frac{1}{2}\Vert u - x_t\Vert^2
    + 
    \frac{1}{2}\Vert 
        u - x_{t + 1}
    \Vert^2 \le 0
    \\
    & \text{let } \phi = \eta_{t + 1} f, u = x^*
    \\
    & 
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
        \implies & 
        \eta_{t + 1}(f(x_{t + 1}) - f(x_t)) 
        + 
        \frac{1}{2}\Vert x^* - x_{t + 1}\Vert^2 
        -
        \frac{1}{2}\Vert x^* - x_t\Vert^2 \le 0
        \leftarrow \text{([INEQ1])}
    \end{aligned}
    \\
    \implies 
    & f(x_{t + 1}) - f(x_t) \le 0, \leftarrow \text{([INEQ2])}. 
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
    {\small
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
    \iff &
    \Phi_{t + 1} - \Phi_{t} \le 0. 
\end{aligned}
$$

Therefore, $\Phi_t$ is a Lyaponouv function of the proximal point method for convex, closed, proper $f$. 


**remarks**

We obesrve that, combining (\[INEQ1\]) and (\[INEQ2\]), we know that the function value and the error from the optimal solution $x^*$, decreases monotonically. 
The later is Fejer Monotonicity, and the former is much weaker implications. 


#### **Thm | Baseline Convergence via Method of PPM**
> The convergence rate of the proximal point method applied to $f$, closed, convex proper, we have convergence rate of the function value: 
> $$
>   f(x_T) - f(x_*) \le O\left(\left(\sum_{i=1}^{T}\eta_t\right)^{-1}\right). 
> $$

**Proof**

Just do 

$$
\begin{aligned}
    & \text{let } \Delta_t = f(x_t) - f(x_0), \Upsilon_t = \sum_{i = 1}^{t}\eta_i
    \\
    & \text{so } \Phi_t = \Upsilon_t\Delta_t. 
    \\
    & \Upsilon_T\Delta_T \le \Phi_T \le \Phi_0 = \frac{1}{2}\Vert x - x_*\Vert^2 
    \\
    & \implies \Delta_T \le \frac{1}{2\Upsilon_T} \Vert x-x_*\Vert^2. 
\end{aligned}
$$


**Remarks**

Muller, 1991. 



---
### **Applications of Gradient Descent via PPM**

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


#### **Claim | Allowable Stepsizes and Rate of Convergence**

