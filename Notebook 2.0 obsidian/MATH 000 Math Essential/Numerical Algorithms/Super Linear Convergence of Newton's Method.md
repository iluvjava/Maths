[[../../AMATH 515 Optimization Fundamentals/Gradient Descend/Measuring Rate of Convergence]]

---
### **Intro**

Here we show that, under some assumptions on the objective function $f$, then the newton's method has a quadratic accelerations rate. To start, we model the newton's iterations using a fixed point iteration. The newton's iterations admit formulas: 

$$
\begin{aligned}
    x_{n + 1} &= x_n - \frac{f(x_n)}{f'(x_n)} = g(x_n), 
    \\
    g'(x) &= 1 + \frac{f(x)}{f'(x)^2f''(x)} - \frac{f'(x)}{f'(x)}
    \\
    &=\frac{f(x)}{f'(x)^2f''(x)}, 
\end{aligned}
$$

for now, we make the following assumptions about the iterative function $g(x)$ at the targeted root $x$, giving us: 

$$
\begin{aligned}
    f(x) = 0, f'(x) \neq 0 
    \implies
    g'(x) = 0. 
\end{aligned}
$$

We then introduce a theorem that is taylored for this situation. 

**Theorem: Convergence of the Newton's Method**

> let the fixed point iteration function $g(x)$ be $g'(x) = 0$, with $g''(x)$ bounded new a region around $x\pm \delta$, we further assume that $|g(x)'| < k < 1$ for that interval (This is saying that we won't shoot away from the fixed point right at the beginning). Then, a fixed point iterations on the function $g$ converges quadratically. 

**proof:**

We consider a taylor expansion around the fixed point $x$: 
$$
\begin{aligned}
    g(x + \delta) &= g(x) + \delta g'(x) + \frac{\delta^2}{2} g''(\xi), \; \xi \in [x - \delta, x+ \delta]
    \\
    g(x + \delta) &= x + \frac{\delta^2}{2} g''(\xi), 
\end{aligned}
$$

now lets say that $x + \delta = p_n$, the nth point of the fixed point iterations, then 

$$
\begin{aligned}
    g(p_n) &= x + \frac{(p_n - x)^2}{2} g''(\xi)
    \\
    p_{n + 1} - x &= \frac{(p_n - x)^2}{2} g''(\xi)
    \\
    \frac{p_{n + 1}}{(p_{n + 1} - x)^2} &= \frac{g''(\xi)}{2}, 
\end{aligned}
$$

now take note that with the convergence of the fixed point iteration, we have $p_n\rightarrow x$, which means that $\xi \rightarrow x$, which would mean that: 

$$
\begin{aligned}
    \lim_{n\rightarrow \infty} \frac{p_{n + 1}}{(p_{n} - x)^2} &= 
    \lim_{\xi \rightarrow x} \frac{g''(\xi)}{2} = \frac{g''(x)}{2}, 
\end{aligned}
$$

which is very close to the quadratic convergence. To make sure that it converges, we needs write $|g''(\xi)|\le M$ for all $\xi\in [x - \delta, x + \delta]$, then we set constant $C = \frac{M}{2}$, using the conditions for quadratic convergence we need to make sure that $|p_0|/C < 1$. Implying that the smallar the value for $M$, the more problem smaller the interval we will have to use to assert convergence. Also, observe that if $g''(\xi) = 0$, then the newton's method is going to converge in just one step. 
