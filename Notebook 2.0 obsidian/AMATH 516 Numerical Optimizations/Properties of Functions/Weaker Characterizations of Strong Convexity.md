[Characterizing Functions for Optimizations](Background/Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

The class of Quasi-strongly convex function is a generalizations of the class of strongly convex function. 
**References**
- Necoara et al. "Linear convergence of first order methods for non-strongly convex optimization"

The targets of relaxations on the ideas of strong convexity focuses on the error bound and quadratic growth conditions. 

---
### **Global Settings of the theories**

The following assumption will be made throughout this entire file. 


#### **Assumption Set 1 | $(f, x, x^*)$**
> The following assumption is about $(f, X, X^*)$. 
> 1. $\emptyset\neq X \subseteq \R^n$ is a closed convex set. 
> 2. $f: \R^n \rightarrow \R$ be a differentiable function such that $\nabla f$ is $L_f > 0$ Lipschitz continuous. 
> 3. Suppose the optimization problem **(P)** has $-\infty < f_* = \min_{x \in X} f(x)$ such that $\emptyset\neq X^* = \argmin{x \in X} f(x)$. Or equivalently, the fix point set of operator $(I + L^{-1}\partial g)^{-1}(I - L^{-1}\nabla f)$ is $X^*$. 


Denote $\mathcal P$ to be the projected gradient operator: 

$$
\begin{aligned}
    \mathcal P_\lambda (x) &:= \Pi_X(x - \lambda^{-1} \nabla f(x)), 
    \\
    \mathcal G_{\lambda} &:= \lambda(I - P_\lambda). 
\end{aligned}
$$

Define Bregman Divergence 

$$
\begin{aligned}
    D_{f}: \R^n \times \R^n \rightarrow \R &= 
    (x, y) \mapsto f(x) - f(y) - \langle \nabla f(y), x - y\rangle. 
\end{aligned}
$$

#### **Definition | $\kappa\ge 0$ strongly convex and $L_f$ smooth**
> A function $f \in \mathbb S(L_f, \kappa_f, X)$ is strongly convex if and only if there exists $L_f \ge \kappa_f \ge 0$ such that for all $x, y \in X$ it satisfies: 
> $$
> \begin{aligned}
>   \kappa_f \Vert x - y\Vert^2 \le D_f(x, y) \le L_f \Vert x - y\Vert^2. 
> \end{aligned}
> $$

#### **Definitions | Weaker characterizations**
> Suppose that $f$ satisfies Assumption 1, let $L_f \ge \kappa_f \ge 0$ such that for all $x \in X$, $\bar x = \Pi_{X^*} x$. 
> We define the following: 
> 1. Quasi-strong convexity **(Q-SCNVX)**: $0 \le D_f(\bar x, x) - \frac{\kappa_f}{2}\Vert x - \bar x\Vert^2$. Denoted by $\mathbb S'(L_f, \kappa_f, X)$. 
> 2. Quadratic under approximation **(QUA)**: $0 \le D_f(x, \bar x) - \frac{\kappa_f}{2}\Vert x - \bar x\Vert^2$. Denoted by $\mathbb U(L_f, \kappa_f, X)$. 
> 3. Quadratic Gradient Growth **(QGG)**: $0\le D_f(x, \bar x) + D_f(\bar x, x) - \kappa_f/2\Vert x - \bar x\Vert^2$. Denoted by $\mathbb G(L_f, \kappa_f, X)$. 
> 4. Quadratic Function Growth **(QFG)**: $0 \le f(x) - f^* - \kappa_f/2\Vert x - \bar x\Vert^2$. Denoted by $\mathbb F(L_f, \kappa_f, X)$. 
> 5. Error Bound **(EB)**: $\Vert \mathcal G_{L_f}(x)\Vert \ge \Vert x - \bar x\Vert$. Denoted by $\mathbb E(L_f, \kappa_f, X)$. 

**Remark**

Do not confuse the concept of Quasi weak convexity with "quasi convexity", or "strong quasi convex" in the literature. 
Since the parameter $\kappa \ge 0$, the case $\kappa_f = 0$ is not excluded hence this definition includes all convex functions as well. 

#### **Literature's Contributions**
In Necoara's paper, they did: 
1. Introduce relations between various weaker characterizations of strong convexity with proofs. 
2. Gave examples of convex functions satisfying the conditions. 
3. Showed linear convergence rate of Projected Gradient, or Accelerated Projected Gradient Method under some weaker settings of strong convexity. 

We will provide more details to their results, and make compact presentations for their results. 


#### **Configuration 1 | $(x, \bar x, f, X, X^*, \varphi)$**
> We configure $(x, \bar x, f, X, X^*, \varphi)$.
> 1. Let $(f, X, X^*)$ be given as in Assumption 1. 
> 2. $x \in X$ is arbitrary, and $\bar x = \Pi_{X^*} x$. 
> 3. Define the function $\varphi(x) = (1/2)\dist(x | X^*)^2$. 

**Remarks**

This is the configuration they used to define Q-SCNVX, QUA, QGG, QFG and EB. 
This configuration is made to quantify variables so that the text come after it becomes easier to read. 

---
### **My thoughts on their arguments**

Their argument is surprisingly simple, in fact. 
We first introduce a function with a special type of Bregman Divergence. 

#### **Definition | semi bregman divergence**
> Let $d_C^2 = \dist(\cdot | C)^2$.
> Denote $\overline{(\cdot)} = \Pi_C(x)$ to be the projection of some vector onto the set $C$. 
> Then for all $x, y \in \R^n$: 
> $$
> \begin{aligned}
>     D_{d_C^2/2}(x, y) = 
>     - \frac{1}{2}\Vert \bar x - \bar y\Vert^2
>     + \langle x - \bar x, \bar x - \bar y\rangle
>     + \frac{1}{2} \Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

See [Semi Bregman Divergence](../Semi%20Bregman%20Divergence.md) for the proof. 

$\blacksquare$

**Remarks**

The following properties about semi Bregman Divergence are quite important. 



The following theorem will characterize the equivalent conditions for the definition of the Quasi-strongly convex functions, using the semi Bregman Divergence. 


#### **Theorem | quasi strongly convex functions equivalent conditions**
> Let $(f, X, x, \bar x)$ be given by Configuration 1. 
> Denote $\varphi = (1/2)\dist(x | X^*)$. 
> Then the following conditions are equivalent characterizations of quasi strong convexity. 
> 1. There exists $\kappa_f \ge 0$ such that, it satisfies $0 \le D_f(\bar x, x) - \kappa_f D_{\varphi}(x, \bar x)$, for all $x$ . 
> 2. $f \in \mathbb S' (L_f, \kappa_f, X)$. 

**Proof**

Trivial. 
Use the definition of Semi Bregman Divergence above. 

$\blacksquare$ 

A less trivial result will now follow. 

#### **Theorem | quadratic function growth equivalent conditions**
> Suppose that $(f, X, x, \bar x)$ are given by Configuration 1. 
> Then, the following conditions are equivalent. 
> 1. $f \in \mathbb U(L_f, \kappa_f, X)$ is QUA. 
> 2. Let $h = f - \kappa_f/2 \Vert \cdot\Vert^2$, then $0 \le D_h(x, \bar x)$ for all $x$. 
> 3. For all $x$, it satisfies $\kappa_f D_\varphi(x, \bar x) \le D_f(x, \bar x)$. 

**Proof**

For the equivalent between (1.) and (2.), it's just some algebra. 
Look: 

$$
\begin{aligned}
    0 &\le 
    f(x) - f_* - \langle \nabla f(\bar x), x - \bar x\rangle - \frac{\kappa_f}{2}\Vert x - \bar x\Vert^2
    \\
    &= 
    f(x) - f_* - \langle \nabla f(\bar x), x - \bar x\rangle
    - \kappa_f\left(
        \frac{1}{2}\Vert x\Vert^2 + \frac{1}{2}\Vert \bar x\Vert^2 - \langle x, \bar x\rangle
    \right)
    \\
    &= f(x) - f_* - \langle \nabla f(\bar x), x - \bar x\rangle
    - \kappa_f\left(
        \frac{1}{2}\Vert x\Vert^2 
        - \frac{1}{2}\Vert \bar x\Vert^2 
        + \Vert \bar x\Vert^2
        - \langle x, \bar x\rangle
    \right)
    \\
    &= \left(
        f - \frac{\kappa_f}{2}\Vert x\Vert^2
    \right) - 
    \left(
        f - \frac{\kappa_f}{2}\Vert \bar x\Vert^2
    \right) 
    - \kappa_f \langle \bar x - x, \bar x\rangle 
    - \langle \nabla f(\bar x), x - \bar x\rangle
    \\
    &= \left(
        f - \frac{\kappa_f}{2}\Vert x\Vert^2
    \right) - 
    \left(
        f - \frac{\kappa_f}{2}\Vert \bar x\Vert^2
    \right) 
    - \langle \nabla f(\bar x) - \kappa_f x, x - \bar x\rangle
    \\
    &= h(x) - h(\bar x) - \langle \nabla h(\bar x), x - \bar x\rangle. 
\end{aligned}
$$

It's done. 
For the equivalent between (1.), and (3.), it's obvious from the definition of QUA, and semi bregman divergence. 

$\blacksquare$

We now provide some examples of the definitions. 

#### **Example 1 | The most obvious and direct example**
> Consider $(f, X, X^*)$ that satisfies Assumption 1. 
> Suppose that in addition, $f = (1/2)\dist(x | X_f)^2$. 
> In addition, let $X_f = \argmin{x \in \R^n} \;f(x)$, and assume that $X_f \cap X \neq \emptyset$. 
> Then, $f$ is Q-SCNVX, QUA, QGG, QF. 

**Demonstration**

When $X_f \cap X \neq \emptyset$, we have the luxury of $X^* = X_f \cap X$. 


