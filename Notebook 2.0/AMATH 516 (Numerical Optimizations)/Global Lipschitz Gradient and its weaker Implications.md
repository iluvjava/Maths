[[Characterizing Functions for Optimizations]]


---
### **Intro**

We introduce $f:\mathbb E \mapsto \mathbb{\bar R}$, which has a Lipchitz continuous gradient, and we wish to see what is impied, and adding convexity shows a stronger equivalences between 3 different conditions. 

**References:** 

Lipschitz gradient characterize change of the objective value of the functions with the norm for the gradient, and smoothness of a function, which is important for the convergence behaviors of fixed gradient method. One of the major source for this file will be coming from the UCLA class lecture slides, linked [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/gradient.pdf#page14). The references of this slide will also be acknowledged and cited. There is another paper talking about the Lipchitz Gradient and it's relations to strong convexity: [here](https://arxiv.org/abs/1803.06573). 

**Globally Lipchitz gradient**: 

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, and it has a gradient that Lipschitz continuous with constant $L >0$  when
> $$
> \Vert \nabla f(x) - \nabla f(y)\Vert_\star\le L \Vert y - x\Vert, \forall x, y\in \mathbb E. 
> $$

The statement is defined for any norm $\Vert \cdot\Vert$ in $\mathbb E$ and it is very strong, and here is a list of conditions that are implied by it: 
1. $x^+\in \arg\min_x{f(x)}\implies \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+) \le (L/2) \Vert x - x^+\Vert^2$. This gives an lower bound for the optimality gap using the gradient at the current point. 
2. $|f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2$, the function is smooth from below and above. 

With the addition assumption that $f$ is a convex function, we can obtain a stronger version of monotonicity of gradients by giving it a lower bound to it. 

3. $\langle \nabla f(x) - \nabla f(y), y - x\rangle \ge L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2$

**Proposition 1: Implications**

> Globally Lipchitz Gradient $\nabla f$ implies condition 1, 2 are true. 

**Proposition 2: Stronger Implications under Convexity and Equivalence**
> By assuming that $f$ is convex, and it has Lipchitz gradient, condition 3 is implied (by condition 1, and 2), and condition 3 is a equivalent to $f$ having a globally lipschitz gradient. hence all conditions are equivalent under the assumption that $f$ is a convex function. 

**Remarks**

When the condition for convexity is not present, smoothness and Lipschitz gradient is no longer equivalent, and hence there exists the function $x^2\sin(x^{-1})$ who is smooth but its one dimensional equivalent of a gradient is not globally Lipschitz Continuous. 

---
### **Proof of Proposition 1**

We prove that Lipchitz gradient implies smoothness(condition 1) and conditions 2. Let $f$ be a function whose gradient is globally Lipschitz. Let's start it with Cauchy Schwart and $x, y\in \mathbb E$: 

$$
\begin{aligned}
    & \left|
        \frac{\langle \nabla f(y) - \nabla f(x), y - x\rangle}{\Vert y - x\Vert}
    \right|
    \le 
    \Vert \nabla f(x) - \nabla f(y)\Vert_\star \le L \Vert y - x\Vert
    \\
    \implies & 
    |\langle \nabla f(y) - \nabla f(x), y - x\rangle |\le L \Vert y - x\Vert^2. 
\end{aligned}
$$
Let $\phi(t) = x - t(y - x)$ for $t \in [0, 1]$, then we consider the foundamental theorem of calculus: 
$$
\begin{aligned}
    & f(\phi(1)) - f(\phi(0)) = f(y) - f(x) = \int_{0}^{1} 
    \langle \nabla f(\phi(t)), y -x\rangle
    dt
    \\
    \implies & 
    f(y) = f(x) + \int_{0}^1\langle \nabla f(\phi(t)), y - x\rangle dt
    \\
    \implies & 
    \left|
        f(y) - f(x) - \langle \nabla f(x), y -x\rangle
    \right| = 
    \left|
        \int_{0}^{1}\langle \nabla f(\phi(t)) - \nabla f(x), y - x\rangle dt
    \right|
    \\
    & = \left|
        \int_{0}^{1} 
            t^{-1}\langle \nabla f(\phi(t)) - \nabla f(x), \phi(t) - x \rangle
        dt
    \right|
    \\
    & \le 
    \int_{0}^{1} 
        \frac{L}{t}\Vert \phi(t) - x\Vert^2
    dt = \int_{0}^{1} 
        Lt\Vert y - x\Vert^2
    dt = \frac{L}{2}\Vert y - x\Vert^2 .
\end{aligned}
$$
From the third line to the 5th line, we have the inequality for the smoothness conditions. To prove condition 2, we start of rethinking about condition 1, there are 2 parts of the inequality for condition 2, we start with the lower bound $\frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+)$ by taking the inf on the inequality
$$
\begin{aligned}
    f(y) &\le f(x) + \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y - x\Vert^2
    \\
    \implies \inf_y\{f(y)\} &\le f(x) + \inf_y 
    \left\lbrace
        \langle \nabla f(x), y - x\rangle + \frac{L}{2}\Vert y -x \Vert^2
    \right\rbrace
    \\
    & = \inf_{\Vert v\Vert = 1, t}\left\lbrace
        t\langle \nabla f(x), v\rangle + \frac{t^2L}{2}
    \right\rbrace
    \\
    & = 
    \inf_{\Vert v\Vert = 1}\left\lbrace
        \frac{-1}{L}(\langle \nabla f(x), v\rangle)^2 + 
        \frac{1}{2L}(\langle \nabla f(x), v\rangle)^2
    \right\rbrace
    \\
    &= 
    f(x) + \inf_{\Vert v\Vert = 1} \left\lbrace
        -\frac{1}{2L}\langle \nabla f(x), v\rangle^2
    \right\rbrace = f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert^2_\star, 
\end{aligned}
$$
since $x^+$ is a minimizer of $f$, we have $f(x^+)=\inf_y f(y)$ therefore the above simplies to: 
$$
\begin{aligned}
    & f(x^+) \le f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert_\star^2
    \\
    \implies & f(x) - f(x^+) \ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2. 
\end{aligned}
$$

To prove the upper bound, we simply substitue $x^+$ to the smoothness condition, which will set $\nabla f(x^+)$ to $\mathbf 0$ because it's a minimizer for the function $f$. We skip it for simplicity. $\blacksquare$


---
### **Proof of Proposition 2**

To prove proposition 2, we make the assumption that $f$ is a lsc convex function and it has globally Lipschitz continuous gradient with constant $L$, then we define these 2 functions
$$
\begin{aligned}
    f_x(x) := f(z) + \langle \nabla f(x), z\rangle, 
    \\
    f_y(z):= f(z) + \langle \nabla f(y), z\rangle. 
\end{aligned}
$$

Please observe the fact that, since $f$ is convex, then $f_x, f_y$ has minimizers, and in this case, $x$ one of the minimizers for $f_x$ and $y$ is a minimizer for $f_y$. In addition, the gradient of $f_x, f_y$ is globally Lipschitz too because $f$ has globally Lipschitz gradient. Since $x, y$ are minimizer for $f_x, f_y$, we use conditions 3

$$
\begin{aligned}
    \frac{1}{2L}\Vert\nabla f_x(y) \Vert_\star^2 \le& f_x(y) - f_x(x)
    \\
    \frac{1}{2L}\Vert \nabla f(y) - \nabla f(x)\Vert_\star^2 \le &
    f(y) - f(x) - \langle \nabla f(x), z\rangle + \langle \nabla f(x), x\rangle
    \\
    = & f(y) - f(x) - \langle \nabla f(x), y - x\rangle. 
\end{aligned}
$$
By a similar token but in the case of $f_y$, we obtain
$$
\begin{aligned}
    \frac{1}{2L}\Vert \nabla f_y(x)\Vert_\star^2
    \le& f_y(x) - f_y(y)
    \\
    \frac{1}{2L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 
    \le& f(x) - f(y) - \langle \nabla f(y), x- y\rangle. 
\end{aligned}
$$
Combining the 2 statement we obtain the co-coersive property of the gradient: 

$$
\begin{aligned}
    \frac{1}{L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 \le 
    \langle \nabla f(y) - \nabla f(x), y -x\rangle
\end{aligned}.
$$
And this completed our proof. 

**Remarks**

The co-coersive conditions of the gradient implies the fact that the gradient is Lipschitz. However, without the assumption of function $f$ being convex, we cannot get condition 3 to hold. Which would mean that there exists some type of non-convex function that could be smooth, and makes condition 1 true, but it's not having a gradient that is Lipschitz, therefore, the conditions 2 specifically is a weaker conditions compare to globally Lipschitz gradient of the function. More specifically, we consider the $f(x) = x^2\sin(x^{-1}) ,\forall x\neq 0$ as a function who is smooth, but it doesn't have globally Lipschitz Gradient. We first show that this function $f$ is globally lipschitz, hence it's smooth. Consider that $f'(x) = 2x\sin(x^{-1}) + \cos(x^{-1})$ then: 
$$
\begin{aligned}
    & f'(x) \le 2|x\sin(x^{-1})| + \cos(x^{-1}), \forall x
    \\
    & f'(x) \le M + 1, \forall x.
\end{aligned}
$$
This is true because the limit of $x\sin(x^{-1})$ to $\pm\infty$ is $1$, and the function is continuous on the region $(-\infty, 0), (0, +\infty)$, therefore it has to be bounded, let it be bounded by $M$. Then we have $f$ being Lipschitz continuous because
$$
\begin{aligned}
    |f(y) - f(z)| \le& \sup_{z\in \mathbb R} |f'(z)(y - x)|
    \\
    |f(y) - f(z)| \le& (M + 1)|y - x|
\end{aligned}. 
$$
Giving us global Lipschitz continuity, and therefore $f$ has to be smooth. However, it's derivative is definitely not Lipschitz. Its derivative is differentialble but the derivative of $x\sin(x\^{-1})$ is not bounded, therefore it's derivative is no longer globally Lipschitz. Therefore we conclude the fact that under the general case, for any function with condition 2, the smoothness condition is strictly weaker than having globally Lipschitz gradient. 