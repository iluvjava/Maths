[[../../MATH 000 Math Essential/Analysis/Real Analysis Basics]]


---
### **Intro**

**Definition: Convex Direction Subderivatives**

> let f be proper on $\mathbb E$, suppose that $x\in \text{int}.\text{dom}f$, and let $d\in \mathbb E$. Then the directional derivative of $f$ at $x$ in the direction of $d$ is: 
> $$
> \begin{aligned}
>     f'(x|d) := 
>     \lim_{\alpha\searrow0} \frac{
>         f(x + \alpha d) - f(x)
>     }{\alpha}
> \end{aligned}
> $$
> if, the limit exists. 

**References**: Heinz Textbooks would be the best place because he didn't talk about modern variational analysis in his course notes. 

---
### **Convex Monotone Quotient**

> Let $f$ be convex and proper on $\mathbb E$, suppose that $x\in \text{int.dom}(f)$, let $d\in \mathbb E$, Then: 
> $$
> \begin{aligned}
>     \Phi_d(\alpha) := 
>     \frac{f(x + \alpha d) - f(x)}{\alpha}, 
> \end{aligned}
> $$
> is increasing $\mathbb R_{++}$; as a consequence, $f'(x|d)$ exists and: 
> 
> $$
> \begin{aligned}
>     f'(x|d) = \inf_{\alpha > 0} \Phi_d(\alpha) = 
>     \inf_{\alpha > 0} \frac{f(x + \alpha d) - f(x)}{\alpha}. 
> \end{aligned}
> $$
> Additionally, $-\infty < -f'(x|d) \le f'(x|d)\le \infty$, hence, function that is real-valued. 

**Observations**: 
The theorem states that fact that, the choosing a direction $d$ and walk along that direction, then the function always increases. 

**Proof**

Consider $0 < \alpha < \beta$ and set $\lambda = \frac{\alpha}{\beta}$, then $\lambda \in (0, 1)$, from the convexity of $f$ we have: 

$$
\begin{aligned}
    f(x + \alpha d) &= f((1 - \lambda)x + \lambda(x + \beta d))
    \\
    &\le (1 - \lambda)f(x) + \lambda(f(x + \beta d) - f(x)) \quad \text{Jensen}
    \\
    &= f(x) + \lambda (f(x + \beta d) - f(x))
    \\
    \implies 
    f(x + \alpha d) - f(x) &\le 
    \frac{\alpha}{\beta}(
        f(x + \beta d) - f(x)
    )
    \\
    \implies
        \frac{f(x + \alpha d) - f(x)}{\alpha}
    &\le 
    \frac{1}{\beta}(
        f(x + \beta d) - f(x)
    ), 
\end{aligned}
$$

where, the last expression is illustrating the monotone different quotient for the differential function $f'(x|d)$. Let's assume that $\beta$ is small enough such that $x\pm \beta d\in \text{dom}(f)$, which is possible because $x\in \text{int.dom }f$ from assumption, then by convexity of $f$ we have from Jensen: 
$$
\begin{aligned}
    f(x) &\le \frac{1}{2}f(x - \alpha d) + \frac{1}{2}f(x + \alpha d)
    \\
    \implies f(x) - f(x - \alpha d) &\le f(x + \alpha d) - f(x), 
\end{aligned}
$$
The above expression implies that $f(x) > -\infty$.  Using the previous results for monotone differential quotient we have: 
$$
\begin{aligned}
    -\Phi_{-d}(\beta) &\le \Phi_{-d}(\alpha)
    \\
    &= \frac{f(x) - f(x - \alpha d)}{\alpha}
    \\
    & \le 
    \frac{f(x + \alpha d) - f(x)}{\alpha} = \Phi_d(\alpha)
    \\
    &\le \Phi_d(\beta), 
\end{aligned}
$$

which implies the chain of inequalities: 
$$
\begin{aligned}
    -\infty < - \Phi_{-d}(\beta) \le - f'(x| -d)\le f'(x|d) \le \Phi(\beta) < \infty. 
\end{aligned}
$$



**Remarks**

Please take note of the $\lim$ goes into the $\inf$ after the assumption of convexity. 

**References**: Heinz's MATH 563 at UBCO, Theorem 11.3


---
### **More Properties on Convex Subdifferentials**

Let $f$ be convex proper on $X$, let $x\in \text{int.dom }f$, let $d\in X, \gamma \ge 0$, let $y\in X$, then all of the following holds: 
1. $f'(x|d) \le f(x + d) - f(x)$
2. $f'(x| \cdot)$ is convex. 
3. $f'(x|\gamma d) = \gamma f'(x|d)$. 
4. $f'(x|y - x) \le f(y) - f(x)$. And this one resembles subgradient inequality. 

**Remarks**

for $x\in \text{bd.dom }f$, the directional derivative is still define, more specifically, when $d\in N_{\text{dom }f}(x)$, we have $f'(x|d) = \infty$ due to the fact that $f(x + \alpha d) = \infty \;\forall \alpha > 0$, and when $d \in T_{\text{dom }f}(x)$, the subdifferential is definitely ok to evaluate using the limit definition. 
