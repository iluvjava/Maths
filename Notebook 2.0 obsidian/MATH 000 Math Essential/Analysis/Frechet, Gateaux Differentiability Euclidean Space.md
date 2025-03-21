- [Real Analysis Basics](Real%20Analysis%20Basics.md)

----
### **Intro**

We introduce the concepts of Frechet and Gâteaux differentiability for $\mathbb R^m\mapsto \mathbb R$ functions. 
The concept itself is more generalized and, it can present itself in variational calculus. 
See [Frechet Derivative in Banach Space](Frechet%20Derivative%20in%20Banach%20Space.md) for the same concept but in a much more generalized context. 

#### **Def | Frechet Derivative**
> Let $f: \mathbb R^n\mapsto \mathbb {\bar R}$ be differentiable at $\bar x \in \mathbb R^n$ if there exists $v \in \mathbb R^n$ such that 
> $$
> \begin{aligned}
>     f(x) = f(\bar x) + \langle v, x - \bar x\rangle + o(\Vert x - \bar x\Vert). 
> \end{aligned}
> $$
> Where the little-o notation promises the existence of a function $h(\Vert x - \bar x\Vert) = o(\Vert x - \bar x\Vert)$ in the expression such that $\lim_{x\rightarrow \bar x}\frac{h(\Vert x - \bar x\Vert)}{\Vert x - \bar x\Vert} = 0$. 

**Observations**

Equivalently it has: 
$$
\begin{aligned}
    \lim_{x\rightarrow \bar x} 
    \frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert} = 0. 
\end{aligned}
$$


#### **Def | Gâteaux Differentiable**
> A function $f: \mathbb R^n \mapsto \mathbb{\bar R}$ is Gâteaux differentiable when there exists $v \in \mathbb R^n$ such that for all $w$ the limit satisfies 
> $$
> \begin{aligned}
>     \lim_{\tau \rightarrow 0}
>     &= 
>     \frac{f(\bar x + \tau w) - f(\bar x)}{\tau} = \langle v, w\rangle. 
> \end{aligned}
> $$

**Observations**

It's equivalent to there exists $v \in \R^n$ such that for all $w \in \R^n$: 

$$
\begin{aligned}
    \lim_{\tau \rightarrow 0} 
    \frac{f(\bar x + \tau w) - f(\bar x) - \langle v, \tau w\rangle }{\tau}
    &= 0. 
\end{aligned}
$$

It differs from the Frechet Differentiability because $w$ is not involved in the limit. 
It meaks it weaker since the limit is easier to satisfies and has fewer conditions needed for it's convergence. 
Therefore, if $f$ is Frechet differentiable, it is also Gataux differentiable. 

---
### **Uniform convergence of differential quotient**

There are two quantities that are important here. 
Consider $\bar x$ fixed, we define the tilted affine error, and the differential quotient using notations: 

$$
\begin{aligned}
    E_f(x, \bar x | v) &:= f(x) - f(\bar x) - \langle v, x - \bar x\rangle,
    \\
    \Delta_f(\bar x, w, \tau) &:= \frac{f(\bar x + \tau w) - f(\bar x)}{\tau}. 
\end{aligned}
$$

Then Frenchet derivative demands vanishing first order error: 

$$
\begin{aligned}
    (\exists v \in \R^n)\quad 
    E_f(x, \bar x) = o(\Vert x - \bar x\Vert). 
\end{aligned}
$$

The Gataux derivative demands convergence of limit to a linear function, given any $w \in \R^n$: 
$$
\begin{aligned}
    \lim_{\tau\rightarrow 0} \Delta_f(\bar x, w, \tau) - \langle v, w\rangle = 0. 
\end{aligned}
$$

Here are their key differences: 
1. G-Derivative says nothing about the rate of convergence, and it only asserts limit on the subspace spant by $\bar x + w$. 
2. F-Derivative asserts uniform convergence of the $E_f(x, \bar x, v)$. 

If, the limit $\lim_{\tau \rightarrow 0}\Delta_f(\bar x, w, \tau)$ converges to $\langle v, w\rangle$ uniformly for $v \in \R^n$ in all direction, then $f$ is Frenchet Differentiable, i.e: 

$$
\begin{aligned}
    \lim_{\tau\rightarrow 0} \left\lbrace
        \sup_{\substack{w \in \R^n \\ \Vert w\Vert = 1}}
        \left|
            \Delta_f(\bar x, w, \tau) - \langle v, w\rangle
        \right|
    \right\rbrace = 0.
\end{aligned}
$$

The sufficiency comes by considering $x = \bar x + \tau w$: 

$$
\begin{aligned}
    0 &= \lim_{\tau\rightarrow 0} \left\lbrace
        \sup_{\substack{w \in \R^n \\ \Vert w\Vert = 1}}
        \left|
            \frac{f(\bar x + \tau w) - f(\bar x) - \langle v, \tau w\rangle}{\tau}
        \right|
    \right\rbrace
    \\
    &= 
    \lim_{\tau\rightarrow 0} \left\lbrace
        \sup_{x \in \tau \mathbb B(\mathbf 0)}
        \left|
            \frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert}
        \right|
    \right\rbrace
    \\
    &= 
    \limsup_{x \rightarrow \bar x}
    \left|
        \frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert}
    \right|
    \\
    &\ge \lim_{x\rightarrow \bar x}
    \left|
        \frac{f(x) - f(\bar x) - \langle v, x - \bar x\rangle}{\Vert x - \bar x\Vert}
    \right|
    \ge 0.
\end{aligned}
$$

The absolute value gives upper bound to zero and nullifying the sign introduced from $\tau$. 
We had demonstrated the conditions where Gateaux derivatives is equivalent to Frechet Derivative. 

#### **Example | A continuous function that is G-Differentiable but not F-Differentiable**
> The function 
> $$
> \begin{aligned}
>     f(x, y) &= \begin{cases}
>         \sqrt{x^2 + y^2}\frac{x^2y}{x^4 + y^2} & (x, y) \neq (0, 0),
>         \\
>         0 & (x, y) = (0, 0). 
>     \end{cases}
> \end{aligned}
> $$
> It is Gâteaux differentiable but not Frechet Differentiable.

**Demonstrations**

The problem occurs at $(0, 0)$.
The function is Lipschitz continuous at the point $(0, 0)$ by considering the following: 

$$
\begin{aligned}
    |f(x, y)| &= 
    \Vert (x, y)\Vert \left|
        \frac{x^2y}{x^4 + y^2}
    \right|
    \\
    &= 
    \Vert (x, y)\Vert \left|
        \frac{x^2 y}{x^4 + y^2 - 2x^2y + 2x^2y}
    \right|
    \\
    &= 
    \Vert (x, y)\Vert \left|
        \frac{x^2 y}{(x^2 - y)^2 + 2x^2y}
    \right|
    \\
    &\le 
    \Vert (x, y)\Vert \left|
        \frac{x^2 y}{2x^2y}
    \right| = (1/2)\Vert (x, y)\Vert. 
\end{aligned}
$$

This function is Gataux differentiable at $(0, 0)$. 
Choose any line crossing $(\tau, k \tau)$ parameterized by $\tau \in \mathbb R$  and $k \in \R$, the limit of the differential quotient is 

$$
\begin{aligned}
    \lim_{\tau \rightarrow 0}
    \sqrt{\tau^2 + k^2\tau^2}\frac{k^2 \tau^3}{k^4\tau^4 + \tau^2}
    &= 
    \lim_{\tau \rightarrow 0}
    \sqrt{1 + k^2}\frac{k^2 \tau^3}{k^4\tau^3 + \tau^2}
    \\
    &= 
    \lim_{\tau \rightarrow 0}
    \sqrt{1 + k^2}\frac{k^2}{k^4 + \tau^{-1}} = 0. 
\end{aligned}
$$

Zero has $\langle (0, 0), (x, y)\rangle$ hence it's consider a linear functional. 
However, the function is not Frechet differentiable. 
Maximizing the value of the differential quotient for all region close to the point $(0, 0)$. 
Consider $(x, y) = (t, t^2)$ then $x^4 + y^2 = t^4 + t^4 = 2t^4$ and 

$$
\begin{aligned}
    |f(t, t^2)| &= \Vert (t, t^2)\Vert \left|
        \frac{t^4}{2t^4}
    \right| = \frac{1}{2}\Vert (t, t^2)\Vert
    \\
    \implies
    \frac{|f(t, t^2) - 0|}{\Vert (t, t^2) - (0, 0)\Vert} 
    &= 
    \frac{1}{2}. 
\end{aligned}
$$

And therefore, on the last line, it shows that the differential quotient doesn't converge uniformly for all $x$ near $\bar x$. 


