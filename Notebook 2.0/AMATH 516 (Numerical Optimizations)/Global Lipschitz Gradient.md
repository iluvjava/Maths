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

We prove that Lipchitz gradient implies smoothness. Let's start it with Cauchy Schwart and $x, y\in \mathbb E$: 

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
From the third line to the 5th line, we have the inequality for the smoothness conditions. To prove condition 2, we start of rethinking about condition 1, there are 2 parts of the inequality for condition 2, we start with the lower bound by 
$$
\begin{aligned}
    
\end{aligned}
$$


---
### **Proof of Proposition 2**