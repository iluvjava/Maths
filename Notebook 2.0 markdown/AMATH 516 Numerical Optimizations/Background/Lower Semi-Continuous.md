[Topological Basics for Optimizations](Topological%20Basics%20for%20Optimizations.md)

---
**Lower-Smicontinuous**

A function $f: \mathbf{E}\mapsto \mathbb{\bar{R}}$, then the function is lower semi-continuous if: 

> $$
> \forall x \in \mathbf{E}: \liminf_{y\rightarrow x} f(y)\ge f(x)
> $$

The definition prevents discrete Jump at the point say $a$, and the function has $f(a) = 1$ but $f(x) = 1 \;\forall\; x < a$. Graphically it's saying that there is no upper jump in the value of the function. In the case of 1D, an upper jump discontinuity doesn't exist on the domain of the function. 

**Example**

The following function is not lower semi-continuous: 

$$
\begin{aligned}
    f(x):= 
    \begin{cases}
        0 & x < 0
        \\
        1 & x \ge 0    
    \end{cases}
\end{aligned}
$$

The lower semi-continuity failed at the point $x = 0$. Consider $\mathbb B_\epsilon(0)\setminus\{0\}$, then: 

$$
\begin{aligned}
    \lim_{\epsilon \rightarrow 0} 
    \left\lbrace
        \inf_{y\in \mathbb B_\epsilon(0)\setminus \{0\}} f(y)
    \right\rbrace 
    = 
    0 \le f(0) = 1
\end{aligned}
$$

Therefore the function is not lower semi-continuous. 


**Remarks:**

A lower semi-continuous function doesn't have a jump discontinuity that goes up. 

