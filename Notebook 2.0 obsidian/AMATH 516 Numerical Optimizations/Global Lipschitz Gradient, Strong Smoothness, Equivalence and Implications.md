---
alias: Smoothness and its Euivalences
alias: L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity
---
* [[Characterizing Functions for Optimizations]]
* [[Dual Norm]]

---
### **Intro**

We introduce $f:\mathbb E \mapsto \mathbb{\bar R}$, which has a Lipchitz continuous gradient, and we wish to see what is implied, and adding convexity shows a stronger equivalences between 3 different conditions. Please take note that, the inner product is not defining the norm, nor is the norm defined by the inner product. The norm is arbitrary in our context, and we use dual norm formulations instead. The inner product is the standard Eulidean space inner product, and we use Holder's inequality. 

**References:** 

Lipschitz gradient characterize change of the objective value of the functions with the norm for the gradient, and smoothness of a function, which is important for the convergence behaviors of fixed gradient method. One of the major source for this file will be coming from the UCLA class lecture slides, linked [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/gradient.pdf#page14). The references of this slide will also be acknowledged and cited. There is another paper talking about the Lipchitz Gradient and it's relations to strong convexity: [here](https://arxiv.org/abs/1803.06573). Finally, one of the ultimate reference we should use is Beck's \<First Order Methods in Optimizations\>, where it has detailed proofs and overview for characterizations of strong smoothness for functions. Finally, *Dimitri's AMATH 516* has Exercise 3.12 that covers the additional properties and equivalences for the Strong Smoothness Properties. 

**Def | Globally Lipchitz gradient**: 

> Let $f: \mathbb E \mapsto \mathbb{\bar R}$, and it has a gradient that Lipschitz continuous with constant $L >0$  when
> $$
> \Vert \nabla f(x) - \nabla f(y)\Vert_\star\le L \Vert y - x\Vert, \forall x, y\in \mathbb E. 
> $$

The statement is defined for any norm $\Vert \cdot\Vert$ in $\mathbb E$ and it is very strong, and here is a list of conditions that are implied by it: 
1. $x^+\in \arg\min_x{f(x)}\implies \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+) \le (L/2) \Vert x - x^+\Vert^2$. This gives a lower bound for the optimality gap using the gradient at the current point. 
2. $|f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{L}{2}\Vert y - x\Vert^2$, the function can be squeezed between 2 tangential quadratic function. 

With the additional assumption that $f$ is a *convex function*, we can obtain a stronger version of monotonicity of gradients by giving it a lower bound to it. This is called the co-coercivity of gradient. 

3. $\langle \nabla f(x) - \nabla f(y), y - x\rangle \ge L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2$, co-coersive property, it's like monotone but stronger. 
4. $f(x) + \langle \nabla f(x), y - x\rangle + (2\beta)^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert^2 \le f(y)$. 
5. $0 \le \langle \nabla f(x) - \nabla f(y), x - y\rangle\le \beta \Vert x - y\Vert^2$, monotone gradient and bounded. 

Assuming that $f$ has a second derivative, a Hessian matrix, then 

6. $\nabla^2 f(x)\preceq LI$

**Remarks**

An stronger statement for the Globally Lipschitz gradient is the fact that the spectral norm of Hessian is bounded globally as well, regardless of convexity of the function or not. 

**Proposition 1 | 1, 2 Are Implied by Lipschitz Gradient**

> Globally Lipchitz Gradient $\nabla f$ implies condition 1, 2 are true. Mathematically, let \[0\] denote the statement that the gradient is globally lipscthiz continuous, let \[?\] denotes the item number for the above listed conditions, then I wish to say that
> * $[0]\implies [1]$ 
> * $[0]\implies [2]$

**Proposition 2 | Equivalences Under Convexity**

> By assuming that $f$ is convex, and it has Lipchitz gradient, condition 3 is implied (by condition 1, and 2), and condition 3 is a equivalent to $f$ having a globally Lipschitz gradient. hence all conditions are equivalent under the assumption that $f$ is a convex function. I wish that say that, which is also what the proof resemble, is the facts that 
> * $[0]\wedge\text{cvs}\implies [3]$
> * $[3]\implies [0]$

**Open Question 3 | Equivalence of 1, 2 Requires Extra Ingredient**

> I am not sure when (1), (2) are equivalent if convexity is not used. However, for a function that has a well defined Hessian via second derivatives, it's equivalent. This means that counter examples if exist, might not have a continuous Hessian, and it shouldn't be convex. 

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
Let $\phi(t) = x - t(y - x)$ for $t \in [0, 1]$, then we consider the fundamental theorem of calculus: 
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
From the third line to the 5th line, we have the inequality for the smoothness condition (Condition (2)). There are 2 parts of the inequality for condition (1), we start with the lower bound $\frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2 \le f(x) - f(x^+)$ by taking the infimum on strong smoothness (condition (2))
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
since $x^+$ is a minimizer of $f$, we have $f(x^+)=\inf_y f(y)$ therefore the above simplifies to: 
$$
\begin{aligned}
    & f(x^+) \le f(x) - \frac{1}{2L} \Vert \nabla f(x)\Vert_\star^2
    \\
    \implies & f(x) - f(x^+) \ge \frac{1}{2L}\Vert \nabla f(x)\Vert_\star^2. 
\end{aligned}
$$

To prove the upper bound, we simply substitute $x^+$ to the smoothness condition (condition (2)), which will set $\nabla f(x^+)$ to $\mathbf 0$ because it's a minimizer for the function $f$. We skip it for simplicity. $\blacksquare$

---
### **Proof of Proposition 2**

Recall materials from [Convex Conjugation Introduction](Duality/Convex%20Conjugation%20Introduction.md), assume that $f$ is a convex function, consider defining 2 functions of the form
$$
\begin{aligned}
    & f_x(z) := f(z) - \langle \nabla f(x), z\rangle
    \\
    \implies  &
    \nabla_z f_x(z) = \nabla f(z) - \nabla f(x)
    \\
    \implies 
    & \arg\inf_z f_x(z) = x
    \\
    & f_y(z):= f(z) - \langle \nabla f(y), z\rangle
    \\
    \implies 
    & \nabla_zf_y(z) = \nabla f(z) - \nabla f(y)
    \\
    \implies 
    & \arg\inf_z f_y(z) = y
\end{aligned}
$$

The function $f_x, f_y$ has minimizer, which can be solved by setting the gradient to zero. $f_x, f_y$ has minimizers $x, y$ respectively, they are unique because $f$ is convex, and affine function are convex too, sum of 2 convex functions are convex. The gradient of $f_x, f_y$ is globally Lipschitz too because $f$ has globally Lipschitz gradient. $x, y$ are minimizers for $f_x, f_y$, we use condition (1) obtaining 

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
Summing the 2 inequalities we obtain the co-coercive property of the gradient (condition (3)): 

$$
\begin{aligned}
    \frac{1}{L}\Vert \nabla f(x) - \nabla f(y)\Vert_\star^2 \le 
    \langle \nabla f(y) - \nabla f(x), y -x\rangle.
\end{aligned}
$$
For the above equation, using Cauchy inequality (Or Holder's Inequality in this case due to the use of the Dual norm.) yields Globally Lipschitz gradient. Condition 3 alone is enough to show Lipschitz gradient conditions. 

**Remarks**




----
### **Examples**

We give examples for functions that is strongly smooth. 

**References**: Chapter 23 of Prof Heinz's Course notes. 

