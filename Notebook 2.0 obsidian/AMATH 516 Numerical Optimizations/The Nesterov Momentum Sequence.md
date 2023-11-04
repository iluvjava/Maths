- [A Better Proof for FISTA Convergence](Proximal%20Methods/A%20Better%20Proof%20for%20FISTA%20Convergence.md)

---
### **Intro**

To prevent cluttering, we state some of the properties of the default Nesterov Momentum Sequence and its variants. The Nestrov Momentum sequence is 

$$
\begin{aligned}    
    \begin{cases}
        \lambda^2_{k + 1} - t_{k + 1} = \lambda_k^2, 
        \\
        \lambda_k = \lambda_{k + 1}\theta_k + 1, 
    \end{cases}
\end{aligned}
$$

When defining the sequence for the algorithm, it's also defined that $\lambda_0 = 0$ to be the base case. 


#### **Theorem | Properties of the Sequences**
> With $i\ge 1$, we have $\lambda_i \ge 1$, $\lambda_{i -1}^2 = (\lambda_i - 1)\lambda_i$ being the recurrence relation, then the followings are true 
> 1. $(i + 1)/2 \le \lambda_{i - 1}\le i$, so the sequence is bounded between. 
> 2. The ratio, $\theta_k = (\lambda_i - 1)/\lambda_{i + 1}$ is a monotone increasing sequence that converges to $1$. 

**Proof**

$$
\begin{aligned}
    \lambda_n &= 1/2 + (1/2)\sqrt{1 + 4\lambda_{n-1}^2}
    \\
    &\ge \frac{1}{2} + \frac{1}{2}(2 \lambda_{n - 1}) \ge \lambda_{n - 1} + 1/2
    \\
    \lambda_n &= 1/2 + (1/2)\sqrt{1 + 4\lambda_{n-1}^2}
    \\
    &\le  1/2+ (1/2)(1 + 2\lambda_{n - 1}) = 1 + \lambda_{n - 1},
\end{aligned}
$$

where, we used the monotonicity and sub additivity propert of the square root. This established an lower bound and upper bound, we may then unroll the recurrence and gain 

$$
\begin{aligned}
    \lambda &\in [\lambda_{n - 1} + 1/2, \lambda_{n - 1} + 1] 
    \\
    &\in [\lambda_{n - 2} + 1, \lambda_{n - 2} + 2]
    \\
    &\in [\lambda_1 + (n - 1)/2, \lambda_1 + n - 1], 
\end{aligned}
$$

when the initial condition of $\lambda_1 = 1$, we have $\lambda_n \in [(n + 1)/2, n]$. The first claim is proved. In addition, observe that fact that the sequence $\lambda_n$ is monotincally increasing due to the mapping $1/2 + (1/2)\sqrt{1 + 4(\cdot)^2}$ makes any input larger, it's a monotonically increasing function, therefore. With this in mind, it suffice t show that the mapping $\theta_k$ as a function of $\lambda_{i}$ is also a monoton function to show that the sequence $\theta_k$ is increasing as well. We can simplify the recurrences for it getting 

$$
\begin{aligned}
    \theta_n &= \frac{\lambda_n - 1}{\lambda_{n + 1}}
    \\
    &= \frac{2\lambda_n - 2}{
        1 + \sqrt{1 + 4\lambda_n^2}
    }
    \\
    \theta (x)&= \frac{2x - 2}{1 + \sqrt{1 + 4x^2}}
    \\
    &= \frac{2 - 2/x}{1/x + \sqrt{1/x^2 + 4}}, 
\end{aligned}, 
$$

here we take note that the numerator increases as $x\rightarrow \infty$, and the denominator decreases as $x\rightarrow \infty$. And therefore, the mapping $\theta_x$ is a monotone increasing function. Since next term of the sequence is produced by the mapping, mainly $\theta(\lambda_n) = \lambda_{n + 1}$, the parameter $\theta$ increases monotonically. Finally, by the lower bound of $\lambda_n \ge (n + 1)/2$, it approaches infinity and hence $\lim_{\lambda\rightarrow \infty}\theta(\lambda) = 1$, by taking the limit. 