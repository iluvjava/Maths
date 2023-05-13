- [Measuring Rate of Convergence](../../AMATH%20515%20Optimization%20Fundamentals/Gradient%20Descend/Measuring%20Rate%20of%20Convergence.md), 
- [Taylor Series](../Calc/Taylor%20Series.md), 
- [Fixed Point Iterations 1D](Fixed%20Point%20Iterations%201D.md). 

---
### **Intro**

We derive the newton's method for function $\mathbb R \mapsto \mathbb R$ and then show the conditions for which it converges super-linearly. To derive it consider the Tayler expansion of a function $f$. Let $s$ to be the root of the function and expands it at the point $x$. We re-arrange it and solve it for root $s$

$$
\begin{aligned}
    f(s) &= f(x) + f'(x)(x - s) + \mathcal O(|x - s|^2)
    \\
    0 &= f(x) + f'(x)x - f'(x)s + \mathcal O(|x - s|^2)
    \\
    f'(x)s &= f(x) + f'(x)x + \mathcal O(|x - s|^2)
    \\
    s &= f(x)/f'(x) + x + \mathcal O(|x - s|^2). 
\end{aligned}
$$

Ignoring the error term, we obtain the iterative formula: 

$$
\begin{aligned}
    g(x_n) := x_{n + 1} &= x_n + \frac{f(x_n)}{f'(x_n)} .
\end{aligned}
$$

#### **Complications of the Method**

The method seems good on paper, but observe that it's requiring the function to be at least, differentiable. And even so it didn't show whether it will converges, for what initial guess, and the rate of convergences. It turns out that the method can
1. Converge to a root.
2. Converges quadratically. 
3. Converges linearly. 
4. Converges sub-linearly.

Newton's method can converges quadratically even if the second derivative doesn't exists around the root. Newton's method converges linearly when the root has multiplicity more than $1$. We now give an example where the method converges linearly, to a root that is a critical point, and the second derivative doesn't exist (blows up to infinity) around the root: 

$$
\begin{aligned}
    & f(x) = |x|^{3/2}
    \\
    & f'(x) = (3/2)\text{sign}(x)|x|^{1/2}
    \\
    & f''(x) = (3/4)|x|^{-1/2}, 
\end{aligned}
$$

however observe the the newton's method converges linearly because: 

$$
\begin{aligned}
    x_{n + 1} &= x_n - \frac{|x_n|^{3/2}}{(3/2)\text{sign}(x_n)|x_n|^{1/2}}
    \\
    &= x_n - (2/3)\text{sign}(x_n)|x_n|
    \\
    &= x_n - (2/3)x_n = x_n/3, 
\end{aligned}
$$

which is just a geometric sequence. This is the graph

![](../../Assets/Newton%20Linear%20Converge%20Nontsmooth%20Edge%20Case.png)



---
### **Sequence Ratio Characterizations**

In this section, we characterize the ratio between the error of successive iterations produced by a fixed point iteration on the mapping $g(x)$, the newton's method. we make the basic assumption that: 

1. $f$ is differentiable, around the root. (Implied that $f$ is continuous.)
2. $f'$ is a continuous function, around the root. 

This is the weakest assumption I made to start the analysis. 


#### **First Level Characterizations**

Let $s$ be the root of $f$, then the ratio of the fixed point iteration error of the next iterate over the previous is

$$
\begin{aligned}
    g(x) - s &= (x - s) - \frac{f(x)}{f'(x)}
    \\
    \frac{g(x) - s}{x - s} &= 1 - \frac{f(x)}{f'(x)(x - s)}. 
\end{aligned}
$$

#### **Simple Root Means Super Linear Convergence**

> With assumptions listed before, assuming that $s$ is a simple root of $f$, meaning that $f(s) = 0 \wedge f'(s)\neq 0$, then there exists initial guess $x_0\in \mathbb{R}$ (near $s$ for sure) such that the iteration error $|x_n - s|$ has super linear convergence. 

**Poof**:

Consider taking the limit of the first level characterization. 

$$
\begin{aligned}
    \lim_{x\rightarrow s} \frac{g(x) - s}{x - s} 
    &= \lim_{x\rightarrow s} 
    \left(
        1 - \frac{f(x)}{f'(x)(x - s)}
    \right)
    \\
    [1]\implies 
    &= 
    1 - \frac{\lim_{x\rightarrow s}\frac{f(x) - f(s)}{(x - s)}}{f'(s)}
    \\
    &= 
    1 - \frac{f'(s)}{f'(s)} = 0 <1
\end{aligned}
$$

\[1\]: We used the fact that funtion $f$ is differentiable around the root $s$, and $f(s) = 0$ and the fact that $f'(s)\neq 0$ and it's a continuous function. Therefore, using the limit, we choose some $\epsilon < 1$ to bound the error, we want the ratio to be bounded strictly below $1$ in absolute value, which means 

$$
\begin{aligned}
    &\left|1- \frac{f(x)(x - s)}{f'(x)} \right| \le \epsilon <1
    \\
    \iff
    &
    \frac{|g(x) - s|}{|x - s|} \le \epsilon <1, \forall x\in [x - \delta, + \delta]
\end{aligned}
$$

by the definition of the limit equals to $1$, there exists some $\delta > 0$ where the above condition is true. Choose $x_0\in [s - \delta, s + \delta]$, then the fixed point iteration of $g$ will have to converge, and it converges super-linearly. In this part, we use the pre-requisite for this file. To see, simple expand the inequality recursively and index the iterate $x$. 

#### **Thm | Sufficient Conditions for Quadratic convergence around a Simple Root**

> Based on the conditions previous theorem, we also choose the $\delta$ such that sequence start in $[s - \delta, s + \delta]$ converges, then it converges quadratically if, $f''(x)$ exists for $[x - \delta, x + \delta]$ (which can have discontinuity at $s$) and $f''(x)(x - s) \rightarrow 0$ as $x\rightarrow s$, then $|x_n - s|$ converges quadratically. 

**Proof**

Cf from first level characterizations, we expand the Taylor series for $f$ around $x\in [s - \delta, s + \delta]$ we have: 

$$
\begin{aligned}
    \frac{g(x) - s}{x - s} &= 1 - \frac{f(x)}{f'(x)(x - s)}
    \\
    &= 
    \frac{f'(x)(x - s) - (f'(x)(x - s) + f''(x)(x - s)^2)}{f'(x)(x - s)}
    \\
    &= \frac{f''(x)(x - s)^2}{f'(x)(x - s)}
    \\
    \iff 
    \frac{g(x) - s}{(x - s)^2}&= \frac{f''(x)(x - s)}{f'(x)}
    \\
    \implies 
    \left| 
        \frac{g(x) - s}{(x - s)^2}
    \right| &= 
    \left|
        \frac{f''(x)(x - s)}{f'(x)}
    \right| \le \epsilon < 1, 
\end{aligned}
$$

by the fact that the initial guess make the first ratio strictly less than $1$, the quadratic convergence condition is satisfied and it converges quadratically for all initial $x\in [s - \delta, s + \delta]$. 

**Remarks**

Sometimes, the newton's method converges quadratically, but the second derivative doesn't exists around the root. For example, consider the following example: 

$$
\begin{aligned}
    & f(x) = (1/2)(\max(x - 1, 0))^2 - x +1;
    \\
    & f'(x) = \max(0, x - 1) - 1;
    \\
    & f''(x) = \text{DNE}. 
\end{aligned}

$$

guesses from both sides of the root $s = 1$ converges, from the left it converges in one step, near the right it converges quadratically, due to the quadratic slope. Plot
![](../../Assets/Newton%20Quadratic%20Edge%20Case.png)

---
### **Roots with Multiplicity**

A function $f$ has a root $s$ with multiplicity $m$ if $f(x) = (x - s)^mh(x)$ such that $\lim_{x\rightarrow s}h(x) \neq 0$. 

### **Thm | Linear Convergence for Roots of Multiplicity**
> The function $f$ has a root $s$ with a multiplicity of $m$ so it takes the form of $f(x) = (x - s)^mh(x)$, where $h(s)\neq 0$, and when $h'(x)$ have a first order removable singularity using $(x - s)$, meaning that $\lim_{x\rightarrow s}h'(x)(x - s) = 0$, then the Newton's method converges linearly.

**Proof**

The difference between $x_{n + 1}$ and $x_n$ is given as: 

$$
\begin{aligned}
    \frac{f(x)}{f'(x)} &= \frac{(x - s)^mh(x)}{m(x - s)^{m - 1}h(x) + (x - s)h'(x)}
    \\
    &= \frac{(x - s)h(x)}{mh(x) + (x - s)h'(x)}, 
\end{aligned}
$$

now we consider the ratio between the error of 2 iterates which is given like: 

$$
\begin{aligned}
    g(x) - s &= (x - s) - \frac{(x - s)h(x)}{mh(x) + (x - s)h'(x)}
    \\
    &= (x - s)
    \left(
        1 - \frac{h(x)}{mh(x) + (x - s)h'(x)}
    \right)
    \\
    \iff
    \frac{g(x) - s}{x - s} &=
    \left(
        1 - \frac{h(x)}{mh(x) + (x - s)h'(x)}
    \right)
    \\
    \implies
    \left|\frac{g(x) - s}{x - s}\right|
    &= \left|
    1 - \frac{h(x)}{mh(x) + (x - s)h'(x)}
    \right|, 
\end{aligned}
$$

by the hypothesis, we have the limit of $h(x)$ goes to something non zero, and $(x - s)h'(x)$ goes to zero, giving us: 

$$
\begin{aligned}
    \lim_{x\rightarrow s}
    \left|\frac{g(x) - s}{x - s}\right|
    &=\lim_{x\rightarrow s} \left|
        1 - \frac{h(x)}{mh(x) + (x - s)h'(x)}
    \right|
    \\
    &= 
    \left|
        1 - \frac{h(s)}{mh(s) + 0}
    \right| = \left |1 - \frac{1}{m}\right| < 1,
\end{aligned}
$$

therefore, choosing any iterate $x$ such that the error ratio is strictly less than $1$ will product a first order convergence sequence

**Remark**

Finally, even if $\lim_{x\rightarrow s}(x-s)h'(x) < \infty$, or even if it equals to $\infty$, it will still converge. In the first case it would still converge, but a rate slower than $1 - 1/m$, and in the latter case, it might converge, but at a sub-linear rate. 


---
### **Extreme Edge Case, Sub-linear Convergence**

When applying the Newton's method to the function $f(x) = \exp(-1/x^2)$, to solve for the root $s = 0$, the function converges at a rate that is sub-linear. This is experimentally confirmed, the reader should confirm that the iteration is $x_{n + 1} = x_{n} - x_n^3/2$, which actually a gradient descend with step size $1$ on the function $x^4/8$. 

This function yields sub-linear convergence results because, it's differentiable around $x=0$, the derivative at $x=0$ can be extended because it's a removable discontinuity, and doing that results in a function $f^{(k)}(0)$ always exists as a continuous function but $f^{(k)}(0) = 0$ for all $k$. 