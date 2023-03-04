[[../Background/Characterizing Functions for Optimizations]]

---
### **Intro**

Choose any line segment $[x_0, x_1]$, where $x_0$ is everywhere and $x_1 \in \text{dom}(f)$, in the domain of a convex function, then walking along the line segment approaching $x_0$ from $x_1$ will yield the value of the function at $x_1$. 

The following theorem is a direct application of the l.s.c property and convexity. A counter example will be created to show that some convex function is not continuous when a limit of a point approached on a curve. 

**Theorem Statement** : 

> Let $f:X\rightarrow (-\infty, \infty]$ be convex, l.s.c and proper. Let $x_0 \in X$, $x_1 \in \text{dom}(f)$, let $x_\lambda:= \lambda x_1 + (1 - \lambda)x_0$, then $\lim_{\lambda\searrow 0} f(x_\lambda) = f(x_0)$. 

**Proof**

$$
\begin{aligned}
    f(x_0) &\le \lim\inf_{\lambda\searrow 0}f(x_\lambda)
    \\
    & \le \lim\inf_{\lambda \searrow 0} (1 - \lambda)f(x_0) + \lambda f(x_1)
    \\
    &= f(x_0)
\end{aligned}
$$

The first line is l.s.c, the second line is the secant line inequality for convex function, the third line the limit. When $x_0 \not\in \text{dom}(f)$, we just have infinity $\le$ infinity, and things still work out. 



---
### **Rockfaller 2D Counter Example**






