- [Local, Global Lipschitz Continuity](AMATH%20516%20Numerical%20Optimizations/Background/Local,%20Global%20Lipschitz%20Continuity.md)
- [Limit Sumpremum and Limit Infimum](MATH%20000%20Math%20Essential/Analysis/Limit%20Sumpremum%20and%20Limit%20Infimum.md)

---
### **Intro**

This type of subgradient and subderivative for locally/globally Lipschitz continuous function. 
The following contents are taken from Professor Wang's class at UBCO. 
And it's basically taken from Clarke's Book titled: "Optimization and Nonsmooth Analysis", page 25. 

#### **Definition | Clarke generalized directional derivative**
> Let $O$ be an open set in $\R^n$. 
> Suppose that $f: O \rightarrow \overline \R$ is locally Lipschitz on $O$. 
> For all $x \in O, v \in \R^n$, the Clarke generalized directional derivative is defined as
> $$
> \begin{aligned}
>     f^\circ(x; v) := \limsup_{\substack{y \rightarrow x \\ t \searrow 0}}
>     \frac{f(y + tv) - f(y)}{t}. 
> \end{aligned}
> $$



#### **Lemma | Basic properties of Clarke's generalized directional derivative**
> Let $f$ be locally Lipschitz around $x$ with constant $K$. 
> Then, 
> 1. $v \mapsto f(x, v)$ is finite, homogenous and sub-additive. $|f^\circ (x; v)|\le K \Vert v\Vert$. 
> 2. $f(x; v)$ is upper semicontinuous as a function of $(x, v)$, and it's $K$ Lipschitz as a function of $v$. 
> 3. $f(x; -v) = (-f)^\circ(x; v)$. 

**Proof**

For the notation let's define the differential quotient: $\Delta(x; v) := (f(x + v) - f(x))$. 

**We now prove (1.)**. 
It's direct because for all $t > 0, v$ it has from the $K$ Lipschitz continuity that: 
$$
\begin{aligned}
    |\Delta(x; v)| &= 
    \left|
        f(x + v) - f(x)
    \right| \le K \Vert v\Vert
    \\
    \implies 
    |f^\circ(x, v)| =
    \left| 
        \limsup_{\substack{t \searrow 0 \\ w \rightarrow x}}\;
        t^{-1}\Delta(w; tv) 
    \right|
    &\le
    \limsup_{t\searrow 0} t^{-1}K \Vert tv\Vert = K \Vert v\Vert. 
\end{aligned}
$$

To show that it's homogenous, let $\lambda > 0$, it's not hard to see it because: 

$$
\begin{aligned}
    f^\circ(x; \lambda v) &= 
    \limsup_{\substack y\rightarrow x, s \searrow 0} 
    s^{-1}\Delta(y; s\lambda v)
    \\
    &= \limsup_{\substack y\rightarrow x, \tau \searrow 0} 
    (\lambda^{-1}\tau)^{-1}\Delta(y; \tau v)
    \\
    &= \lambda f^\circ(x; v). 
\end{aligned}
$$

To see it's sub-additive, 

**We now prove (2.).** 
We can jump to the results to the proof using the following claim. 
Consider an arbitrary sequence $(x_n, v_n)\rightarrow (x, v)$. 
For all $n \in \N$, there exists this sequence $(w_n - x_n, s_n)\rightarrow (0, 0)$ such that: 
- (a): $-1/n < \Delta(x_n, s_n; v_n) - f^\circ (x_n, v_n)$, 
- (b): $\Vert w_n - x_n\Vert + s_n \le 1/n$. 

We list the following additional facts as well. 

- (c): $f$ is $K$ Locally Lipschitz at $x$. 
- (d): A property of liminf. If $\lim_{n\rightarrow \infty}b_n = b$, then $\liminf_{n\rightarrow \infty} a_n + b_n = \liminf_{n\rightarrow \infty} a_n + b$. 
- (f): $w_n \rightarrow x$ too because $\Vert w_n  - x\Vert \le \Vert w_n - x_n\Vert + \Vert x_n - x\Vert$. It's zero on the rhs

Using this claim, it would have. 

$$
\begin{aligned}
    f^\circ(x_n, v_n) - 1/n &\le 
    \Delta (w_n, s_n; v_n) 
    \\
    &= s_n^{-1}(f(w_n + s_n v_n) - f(w_n))
    \\
    &= s_n^{-1}(f(w_n + s_n v) - f(w_n) + f(w_n + s_nv_n) - f(w_n + s_n v))
    \\
    &\underset{\text{(c)}}{\le} 
    s_n^{-1}(f(w_n + s_n v) - f(w_n)) + K\Vert v_n - v\Vert
    \\
    &= \Delta(w_n, s_n; v) + K\Vert v_n - v\Vert. 
\end{aligned}\tag{1}
$$

Taking the limit on the inequality it gives:

$$
\begin{aligned}
    \limsup_{n\rightarrow \infty} f^\circ(x_n, v_n) - 1/n 
    &\underset{\text{(d)}}{=} \limsup_{n\rightarrow \infty} f^\circ(x_n, v_n)
    \\
    &\underset{\text{(1)}}{\le} 
    \limsup_{n\rightarrow \infty}
    \left(
        \Delta(w_n, s_n; v) 
        + K\Vert v_n - v\Vert
    \right)
    \\
    & \underset{\text{(d)}}{=}
    \limsup_{n\rightarrow \infty}
    \Delta(w_n, s_n; v) 
    \\
    &\underset{\text{(f)}}= 
    f^\circ(x; v). 
\end{aligned}
$$

It is upper semicontinuous. 
We now go back and prove **(a), (b)**. 
By definition, $f^\circ(x_n, v_n) = \limsup_{w\rightarrow x_n, s \searrow 0} s^{-1}\Delta(x_n; v_n)$


**Remarks**

We took [This stack exchange post](https://math.stackexchange.com/questions/4017434/proof-that-generalized-directional-derivative-is-upper-semicontinuous) as a reference for this file. 
