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
This weaker condition is the relative error condition in the KL Convergence framework. 

**Remarks**

As a consequence, we showed this Generic Proximal Point algorithm satsifies the first two conditions in the KL convergence frameworks. 

---
### **Proximal Gradient Method**

In thisection we verify that the method of proximal descent is an example of the inexact proximal point method. 

#### **Conditions | The Setup for Proximal Gradient Method**
> Let $f:= h + g$ be proper, l.s.c, and KL. 
> Assume $h$ has a $L$-Lipschitz continuous gradient and $C^1$. 

**Observations**

We use of the fact that $\widehat \partial [g + h](x) = \widehat\partial g(x) + \{\nabla h(x)\}$ to derive the algorithm. 



#### **Algorithm | The Generic Forward Backward Splitting Algorithm**
> Take $a, b > 0$. 
> Let $a > L$. 
> Take $x^{(0)} \in \text{dom} g$. 
> Then the algorithm generates sequence $\{x^{(k)}\}_{k \in \mathbb N}$ satisfying the conditions: 
> 1. $g(x^{(k + 1)}) + \left\langle x^{(k + 1)} - x^{(k)},\nabla h(x^{(k)}) \right\rangle + \frac{a}{2} \Vert x^{(k + 1)} - x^{(k)}\Vert^2 \le g(x^{(k)})$, 
> 2. $v^{(k + 1)} \in \partial g(x^{(k + 1)})$, 
> 3. $\Vert v^{(k + 1)} + \nabla h(x^{(k)})\Vert \le b \Vert x^{(k + 1)} - x^{(k)}\Vert$. 

**Observations**



#### **Lemma | Descent Lemma**
> Let $\nabla g: \mathbb R^n \mapsto \mathbb R^n$ be $L$-Lipschitz, then for all $x, y \in \mathbb R^n$
> $$
> \begin{aligned}
>     g(y) - g(x) - \langle \nabla g(x), y - x\rangle \le \frac{L}{2}\Vert x - y\Vert^2. 
> \end{aligned}
> $$

**Proof**

See [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information on this lemma. 

#### **Claim | Generic FBS Has Decent Property Satisfied**
> The FBS algorithm's conditions implies conditions in the inexact proximal point method. 

**Proof**

We show that condition (1.) matches the (1.) in the inexact proximal point method. 
Using the descent lemma on $g$, we set $y - x^{(k + 1)}, x = x^{(k)}$, then 
$$
\begin{aligned}
    h\left(x^{(k + 1)}\right) - h\left(x^{(k)}\right) - 
    \left\langle \nabla h(x^{(k)}), x^{(k + 1)} - x^{(k)}\right\rangle 
    &\le 
    \frac{L}{2}\left\Vert x^{(k + 1)} - x^{(k)}\right\Vert^2
    \\
    h\left(x^{(k + 1)}\right) - h\left(x^{(k)}\right)
    -
    \frac{L}{2}\left\Vert x^{(k + 1)} - x^{(k)}\right\Vert^2
    &\le 
    \left\langle \nabla h\left(x^{(k)}\right), x^{(k + 1)} - x^{(k)}\right\rangle . 
\end{aligned}
$$

now consider (1.) for the FBS we substitute the above lower bound for the inner product and yield

$$
\begin{aligned}
    g(x^{(k + 1)}) + 
    \left\langle x^{(k + 1)} - x^{(k)},\nabla h(x^{(k)}) \right\rangle 
    + 
    \frac{a}{2} \Vert x^{(k + 1)} - x^{(k)}\Vert^2 
    &\le g(x^{(k)})
    \\
    \implies 
    g(x^{(k + 1)}) + 
    h(x^{(k + 1)}) - h(x^{(k)})
    +
    \frac{a -L}{2}\Vert x^{(k + 1)} - x^{(k)}\Vert^2
    &\le 
    g(x^{(k)})
    \\
    \iff 
    f(x^{(k + 1)}) + \frac{a - L}{2}\Vert x^{(k + 1)} - x^{(k)}\Vert 
    &\le 
    f(x^{(k)}).
\end{aligned}
$$

Therefore, if it fits, then we have $\theta/(2 \lambda_k) = (a - L)/2$, so $\lambda_k^{-1} = a - L$. 
With $a > L > 0$, $a - L > 0$ hence $\lambda_k > 0$ and finite. 

#### **Algorithm | The Concrete FBS Algorithm**
> Assume that $\inf g(\mathbb R^n) > -\infty$, consider a sequence of step sizes $(\gamma_k)_{k \in \mathbb N}$ satisfies $0 < \underline \gamma < \gamma < \overline \gamma < 1/ L$ for all $k$. 
> Then we suggests the following sequence updates: 
> $$
> \begin{aligned}
>     x^{(k + 1)} = \text{prox}_{\gamma_k g}\left(
>         x^{(k)} - \gamma_k \nabla h\left(x^{(k)}\right)
>     \right). 
> \end{aligned}
> $$

**Observations**

We will show that this proposed sequence satisfies the generic formulations of the FBS algorithm. 
To do that we show that with the sequences, the generic algorithm conditions are satisfied. 






[^1]:H. Attouch, J. Bolte, and B. F. Svaiter, “Convergence of descent methods for semi-algebraic and tame problems: proximal algorithms, forward–backward splitting, and regularized Gauss–Seidel methods,” _Math. Program._, vol. 137, no. 1, pp. 91–129, Feb. 2013, doi: [10.1007/s10107-011-0484-9](https://doi.org/10.1007/s10107-011-0484-9).