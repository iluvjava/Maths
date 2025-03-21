- [The Little-o Notations in Limits](The%20Little-o%20Notations%20in%20Limits.md)
- [Real Analysis Basics](Real%20Analysis%20Basics.md)

--- 
### **Intro**

#### **Theorem | Chain rule 1D**
> Let $f, g$ be two functions mapping of $\R\rightarrow \R$ . 
> Suppose that $f$ is differentialble at $g(\bar x)$ with derivative $f'$, and $g$ is differentiable at $\bar x$ with derivative $g'$. 
> Then the derivative ofthe composition is
> $$
> \begin{aligned}
>     (g\circ f)'(\bar x) = 
>     \lim_{h\rightarrow 0}\frac{f(g(\bar x + h))- f(g(\bar x))}{h} = 
>     f'(g(\bar x))g'(\bar x). 
> \end{aligned}
> $$

**Proof**

Using the Little-o notation, differentiability on $g$ means $g(\bar x + h) = g(\bar x) + g'(\bar x)h + o_g(h)$. 
Differentiability on $f$ means $f(g(\bar x) + \delta) = f'(g(\bar x)) \delta + o_f(\delta)$. 
For small $h$ it has: 

$$
\begin{aligned}
    \frac{f(g(\bar x + h)) - f(g(\bar x))}{h}
    &= 
    \frac{f(g(\bar x) + g'(\bar x)h + o_g(h)) - f(g(\bar x))}{h}
    \\
    &= 
    \frac{
        f(g(\bar x)) + f'(g(\bar x))(g'(\bar x)h + o_g(h)) 
        + o_f(h(g(\bar x) + h^{-1}o_g(h)))
        - f(g(\bar x))
    }{h}
    \\
    &= 
    \frac{
        f'(g(\bar x))(g'(\bar x)h + o_g(h)) 
        + o_f(h(g(\bar x) + h^{-1}o_g(h)))
    }{h}
    \\
    &= 
    \frac{
        f'(g(\bar x))(g'(\bar x)h + o_g(h)) 
    }{h}
    + 
    \frac{o_f(h(g(\bar x) + h^{-1}o_g(h)))}{h}
    \\
    &= 
    \frac{
        f'(g(\bar x))(g'(\bar x)h + o_g(h)) 
    }{h}
    + 
    \frac{o_f(h(g(\bar x) + h^{-1}o_g(h)))}{h(g(\bar x) + h^{-1}o_g(h))}
    (g(\bar x) + h^{-1}o_g(h)). 
\end{aligned}
$$


Taking the limit as $h\rightarrow 0$ on the above equality yields the results because the second term on the RHS has: 

$$
\begin{aligned}
    \lim_{h \rightarrow 0}
    \frac{o_f(h(g(\bar x) + h^{-1}o_g(h)))}{h(g(\bar x) + h^{-1}o_g(h))}
    (g(\bar x) + h^{-1}o_g(h))
    &= 
    \lim_{h \rightarrow 0}
    \left(
        \frac{o_f(h(g(\bar x) + h^{-1}o_g(h)))}{h(g(\bar x) + h^{-1}o_g(h))}
    \right)
    \lim_{h\rightarrow 0}(g(\bar x) + h^{-1}o_g(h))
    \\
    &= (0)(g(\bar x)) = 0. 
\end{aligned}
$$

$\square$