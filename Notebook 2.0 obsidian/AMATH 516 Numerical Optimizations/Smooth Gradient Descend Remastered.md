[[Global Lipschitz Gradient and its weaker Implications]]
[[Characterizing Functions for Optimizations]]

---
### **Intro**

We try to remake a previous passage [[Gradient Descend, Smoothness]] but go more in depth into the related ideas, because this smoothness conditions goes beyond what is employed in the proof for the smooth gradient, it's also used in envelope method, such as the forward backwards envelope for non-smooth added with smooth objectives. 

**Characerization of optimality**: 

1. $x - x^+$
2. $f(x) - f(x^+)$ 
3. $\Vert \nabla f(x)\Vert$ when we have smooth funciton. 

The first 2 is hard and requires stronger assumtptions than the last one. However, the last one might be dependent on other assumption about the algorithm to show that it converges to something, to make matter worse, the gradient alone cannot perfectly characterize optimality, indicating that algorithm that decreases (3.) must have edge cases where it fails. 

---
### **The Smooth Descend Frameworks**

The main idea is to create an upper bounding function and then minimize the upper bounding function to attain the next point for the gradient descend method. Suppose that $f$ is smooth globally (both from above and below!) with a constant that is $\le \beta$, then: 

$$
\begin{aligned}
    & |f(y) - f(x) - \langle \nabla f(x), y - x\rangle| \le \frac{\beta}{2}\Vert y - x\Vert^2
    \\
    \implies
    & f(y) \le f(x) + \langle \nabla f(x), y - x\rangle + \frac{\beta}{2}\Vert y - x\Vert^2, \; \forall x, y \in \mathbb E,
    \\
    & m_x(y) = f(x) + \langle \nabla f(x), y - x\rangle + \frac{\beta}{2}\Vert y - x\Vert^2
\end{aligned}
$$

we didn't assume convexity and hence, the gradient of the function might not be Lipzchitz (And it's implied that smooth functon will always have gradient, a singled value mapping), and we only need the upper bound. The functoin $m_x(y)$ is called the upper bounding function. Now we try looking for the minimium of the upper bounding function: 

$$
\begin{aligned}
    & \min_y(m_x(y)) \implies
    \nabla f(x) + \beta(y^+ - x) = \mathbf 0 \implies y^+ = x - \beta^{-1}\nabla f(x)
    \\
    \implies &
    m_x(y^+) = f(x) + \langle \nabla f(x), - \beta^{-1}\nabla f(x)\rangle + \frac{\beta}{2}\Vert  - \beta^{-1}\nabla f(x)\Vert^2, 
    \\
    & 
    m_x(y^+) = f(x) -\beta^{-1}\Vert \nabla f(x)\Vert^2 + \frac{1}{2\beta}\Vert \nabla f(x)\Vert^2, 
    \\
    & 
    m_x(y^+) = f(x) - \frac{1}{2\beta}\Vert \nabla f(x)\Vert^2
    \\
    \implies
    & 
    f(y^+) \le m_x(y^+) = f(x) - \frac{1}{2\beta}\Vert\nabla f(x) \Vert^2. 
\end{aligned}
$$

The upper-bounding function ensures decreasing objective of the objective function by the amount of gradient. This can then be expanded to show a convergence relationship between serveral steps and the gradient. Let's suppose that updating scheme is simply: $x^{(t + 1)} = y^+ = x^{(t)} - \beta^{-1}\nabla f(x^{(t)})$, then we have: 

$$
\begin{aligned}
    & f(x^{(t + 1)}) - f(x^{(t)}) \le -2\beta^{-1}\Vert \nabla f(x^{(t)})\Vert^2
    \\
    \implies &
    f(x^{(t + 1)}) - f(x^{(0)}) \le 
    \sum_{j = 1}^{t} \Vert \nabla f(x^{(j)})\Vert^2
    \\
    \implies
    & 
    \min_{0 \le j \le k}\Vert \nabla f(x^{(j)})\Vert^2 \le 
    \frac{1}{k}\sum_{j = 1}^{k}\Vert \nabla f(x_j)\Vert^2
    \le k^{-1}2\beta(f(x^{(0)}) - f(x^{(k + 1)}))
    \\
    \implies & \min_{0 \le j \le k}\Vert \nabla f(x^{(j)})\Vert \le
    k^{-1/2}\sqrt{2\beta(f(x^{0}) - f(x^{(k + 1)}))} \; .
\end{aligned}
$$

Which is saying that, the objective decrease of the function value, depends on whether the gradient is converging to $\mathbf{0}$ or not. And the rate of convergence, assuming that the sequence of $f(x^{(t)})$ actually converges to a local minimum (*bold assumption here, but it suffice to assume that the function is lsc and bounded from below*), we have: 


**Smooth Descend Gradient Conditions**: 
> $$
> \min_{0 \le j \le k}\Vert \nabla f(x^{(j)})\Vert \le k^{-1/2}\sqrt{2\beta(f(x^{0}) - f_{\min})}, 
> $$

indicating that the minimum of the gradient converges to $\mathbf 0$ at a sub-linear rate of $\mathcal O(1/\sqrt{k})$. 

**Remarks**

Note, without much assumptions this formula only states that, the sequence of $f(x^{(t)})$ is non-increasing, however, it said nothing about its convergence, meaning that: 

When it converges:
   1. $f(x^{(t)})$ could converge, however, if it converges, it doesn't mean $x^{(t)}$ is converging (unless compact level sets), neither it states that we can't have a limit cycle of some sort (might be eliminated by smoothness? not sure). 
   2. $f(x^{(t)})$ could decrease but converge to a non-optimal value dual to gradient can be a false measure of optimality. 

When it diverges:
1. $f(x^{(t)})$ could diverge very fast, which is the case of the function is not bounded below and the initial $x^{(0)}$ is chosen in such a way that it starts sliding down a steep hill indefinitely. And under thet case, the bound for the gradient failed completely. 
   1. $f(x^{(t)})$ could diverge (but decreases) in just the right way that it cancels out with $1/\sqrt{k}$, making that bound a constant. 

Additionally, the gradient doesn't classify local optimality nor global optimality. It could be a false convergence to an inflection point of some sort. Due to these complications, it raise up the motivation to discuss [[Kurdyka Lojasiewicz Inequality]]. 

---
### **Smooth Descend with Convexity**

When convexity, lsc, and proper assumptions are added to $f$, we have a convergence rate express in terms of the objective value of the function, additionally we also have the ability to express the optimality wrt to $f_{\min} = f(x^+)$, and we hae to assume the existence of $x^+$, one of the global minimums of the function. We derive it directly by 

$$
\begin{aligned}
    f(x^{(t + 1)}) 
    & \le 
    f(x^{(t)}) + \langle\nabla f(x^{(t)}), x^{(t + 1)} - x^{(t)} \rangle + \frac{\beta}{2}
    \Vert x^{(t + 1)} - x^{(t)}\Vert^2
    \\
    &= 
    \underbrace{f(x^{(t)}) + \langle\nabla f(x^{(t)}), x^{(t + 1)} - x^{+} \rangle}_{\le f(x^+)}
    + 
    \langle \nabla f(x^{(t)}), x^+ - x^{(t + 1)}\rangle
    + \frac{\beta}{2}
    \Vert x^{(t + 1)} - x^{(t)}\Vert^2
    \\
    & \le 
    f(x^+) + 
    \frac{\beta}{2}\Vert x^{(t + 1)} - x^{(t)}\Vert^2 + \langle \nabla f(x^{(t)}), x^{(t + 1)} - x^+\rangle
    \\
    & = 
    f(x^+) + \frac{\beta}{2}\Vert x^{(t + 1)} - x^{(t)}\Vert^2 +
    \langle \beta(x^{(t)} - x^{(t + 1)}), x^{(t + 1)} - x^+\rangle
    \\
    &= 
    f(x^+)+ \frac{\beta}{2}(
        \Vert x^{(t + 1)} - x^{(t)}\Vert^2 +
        2\langle x^{(t)} - x^{(t + 1)}, x^{(t + 1)} - x^+\rangle
    )
    \\
    &= f(x^+) + 
    \frac{\beta}{2}
    (
        \Vert x^{(t)} - x^{(t + 1)} + x^{(t + 1)} - x^+\Vert^2 - \Vert x^{(t + 1)} - x^+\Vert^2
    )
    \\
    & = f(x^+) + \frac{\beta}{2}(\Vert x^{(t)} - x^+\Vert^2  - \Vert x^{(t + 1)} - x^+\Vert^2), 
\end{aligned}
$$

which is a telescoping series if I sum it up, because for the rhs, the second term for $t$ will cancel out with the first term of $k - 1$, as we sum it up, we will only be left with the second term for $t = t + 1$, and the first term for $t = 0$, giving us: 

$$
\begin{aligned}
    \sum_{j = 1}^k f(x^{(j)}) - k f(x^+) 
    &\le 
    \frac{\beta}{2}(
        \Vert x^{(0)} - x^+\Vert^2 - \Vert x^{(k + 1)} - x^+\Vert^2
    ) \le \frac{\beta}{2}\Vert x^{(0)} - x^+\Vert^2
    \\
    \implies
    f(x^{(k + 1)}) - f(x^+) 
    &\le 
    \frac{1}{k}\sum_{j = 1}^{k}\left(
        f(x^{j}) - f_{\min}
    \right) \le \frac{\beta}{2k}\Vert x^{(0)} - x^+\Vert^2
    \\
    f(x^{k + 1}) - f(x^+) 
    &\le 
    \frac{\beta}{2k}\Vert x^{(0)} - x^+\Vert^2, 
\end{aligned}
$$

which indicates that the convergence rate is sub-linear, in $\mathcal O(k^{-1})$. 

