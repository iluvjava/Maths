- [The Proximal Point Method](The%20Proximal%20Point%20Method.md)
- [KL Convergence Framework](KL%20Convergence%20Framework.md)

---
### **Intro**

We follow Attouch et al.[^1] writing on this topic. 
To set up our problem, we make the following assumption about the function $f$ that we are optimizing using the algorithm. 
1. $f: \mathbb R^n \mapsto \overline {\mathbb R}$ is a proper, lower semi-continuous function and bounded below. 

Recall that $\partial f$ is the [Limiting Subgradient](Limiting%20Subgradient.md). 
When the proximal point operator is solved inexactly, it yield the following generic set of conditions that are relavent to the convergence of the iterates of the algorithm. 

#### **Algorithm | Inexact Proximal Point Method**
> The inexact proximal point method is defined through a set of conditions. 
> Let $x_0 \in \mathbb R^n$, $0 < \underline \lambda \le \overline \lambda <\infty$, 
> $0 \le \sigma < 1$, let $\theta \in (0, 1)$. 
> Let $\lambda_k \in [\underline \lambda, \overline \lambda]$. 
> Then the algorithm needs to generate a sequence $(x^{(k)})_{k \in \mathbb N}$ and $w^{(k)}$ such that the following conditions are true: 
> 1. $f(x^{(k + 1)}) + \theta/(2\lambda_k)\Vert x^{(k + 1)} - x^{(k)}\Vert^2 \le f(x^{(k)})$. This is called the descent condition. 
> 2. $w^{(k + 1)} \in \partial f(x^{(k + 1)})$, this is the subgradient condition. 
> 3. $\Vert \lambda_k w^{(k + 1)} + x^{(k + 1)} - x^{(k)}\Vert^2 \le \sigma (\Vert \lambda_k w^{(k + 1)}\Vert^2 + \Vert x^{(k + 1)} - x^{(k)}\Vert^2)$. This is referred to as the error bounded condition. 

**Obervations**

This algorithm is called inexact proximal point method due to tha tthe third condition is related to an suboptimality condition of the proximal poinet method. 


#### **Claim | The Third Condition has a Weaker Formulations**
> The third condition is a stronger condition of the following condition 
> $$
>     \exists b > 0 \; : \Vert \lambda_kw^{(k + 1)}\Vert \le 
>     b\Vert x^{(k + 1)} - x^{(k)}\Vert. 
> $$

**Proof**

It's direct by considering $x = \lambda_k w^{(k + 1)}$ and $y = x^{(k + 1)} - x^{(k)}$. 
The third condition can then be expresed by 

$$
\begin{aligned}
    \Vert x + y\Vert^2 &\le
    \sigma(\Vert x\Vert^2 + \Vert y\Vert^2)
    \\
    \Vert x\Vert^2 + \Vert y\Vert^2 + 2\langle x, y\rangle 
    &\le 
    \sigma(\Vert x\Vert^2 + \Vert y\Vert^2)
    \\
    2\langle x, y\rangle &\le 
    (\sigma - 1)(\Vert x\Vert^2 - \Vert y\Vert^2)
    \\
    - \Vert x\Vert\Vert y\Vert &\le 
    \frac{\sigma - 1}{2}(\Vert x\Vert^2 - \Vert y\Vert^2)
    \\
    \Vert x\Vert\Vert y\Vert &\ge 
    \frac{1 - \sigma}{2}(\Vert x\Vert^2 - \Vert y\Vert^2)\ge 
    \frac{1 - \sigma}{2}\Vert x\Vert^2
    \\
    \Vert y\Vert &\ge 
    \frac{1 - \sigma}{2}\Vert x\Vert. 
\end{aligned}
$$

Substituting back, we obtain the claim that $\Vert x^{(k + 1)} - x^{(k)}\Vert \ge ((1 - \sigma)/2)\Vert \lambda_kw^{(k + 1)}\Vert$.
By the assumption that $\sigma \in [0, 1)$, we had that $b = (1 - \sigma)/2 > 0$. 



---
### **Proximal Gradient Method**

In thisection we verify that the method of proximal descent is an example of the inexact proximal point method. 

#### **Conditions | The Setup for Proximal Gradient Method**







[^1]:H. Attouch, J. Bolte, and B. F. Svaiter, “Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods,” _Math. Program._, vol. 137, no. 1, pp. 91–129, Feb. 2013, doi: [10.1007/s10107-011-0484-9](https://doi.org/10.1007/s10107-011-0484-9).