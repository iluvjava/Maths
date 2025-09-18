- [Proximal Gradient Inequality Part I](Proximal%20Gradient%20Inequality%20Part%20I.md)
- [Inexact FISTA Made Simple Part I](../../MATH%20602%20Nesterov%20Acceleration/Inexact%20FISTA%20Made%20Simple%20Part%20I.md)
- [Inexact FISTA made Simple Part II](../../MATH%20602%20Nesterov%20Acceleration/Inexact%20FISTA%20made%20Simple%20Part%20II.md)
- [Convex Epsilon Subgradient Deep Dive](../Non-Smooth%20Calculus/Convex%20Epsilon%20Subgradient%20Deep%20Dive.md) 

---
### **Intro**

Inexact proximal gradient inequality has a lot to do with inexact FISTA method, and their variants. 
This file will summarize some of the techniques found in the literature. 
Unfortunately, there are many different approaches and they all play an important roles for inexact proximal algorithms. 


---
### **Epsilon Subgradient**

In this file, let $g: \R^n \rightarrow \overline \R$ to be a closed, convex, and proper function. 

#### **Define | $\epsilon$-subgradient**
> Let $\epsilon \ge 0$, we define 
> $$
> \begin{aligned}
>     \partial_\epsilon g(x) := 
>     \left\lbrace
>         v \in \R^n: 
>         (\forall z \in \R^n)\; 
>         g(z) - g(x) - \langle v, z - x \rangle 
>         \ge - \epsilon
>     \right\rbrace. 
> \end{aligned}
> $$

---
### **Inexact proximal point/gradient based on $\epsilon$-subgradient**

The inexact proximal gradient relates directly to a proximal gradient inequality with absolute errors. 
Recall from [Inexact Proximal Evaluations](../Proximal%20Operator/Inexact%20Proximal%20Evaluations.md) the following: 

#### **Recall Definition | $\epsilon$-Inexact proximal operator**
> For all $x \in \R^n, \epsilon \ge 0, \lambda > 0$, $\tilde x$ is an inexact evaluation of proximal point at $x$, if and only if it satisfies: 
> $$
> \begin{aligned}
>     \lambda^{-1}(x - \tilde x) \in \partial_{\epsilon^2/(2\lambda)} g(\tilde x). 
> \end{aligned}
> $$
> which we denote by $\tilde x \approx_\epsilon \prox_{\lambda g}(x)$. 

#### **Theorem 1 | Inexact proximal inequality**
> Let $\epsilon \ge 0, x \in \R^n$. 
> $\tilde x \approx_\epsilon \prox_{\lambda g}(x)$ if and only if for all $z \in \R^n$ it satisfies: 
> $$
> \begin{aligned}
>     0 &\le 
>     g(z) - g(\tilde x) 
>     - \lambda^{-1}\langle x - \tilde x, z - \tilde x \rangle 
>     + \frac{\epsilon^2}{2\lambda}. 
>     \\
>     &= g(z) - g(\tilde x)  
>     + \frac{1}{2\lambda}\Vert x - z\Vert^2
>     - \frac{1}{2\lambda}\Vert x - \tilde x\Vert^2
>     - \frac{1}{2\lambda}\Vert z - \tilde x\Vert^2
>     + \frac{\epsilon^2}{2\lambda}. 
> \end{aligned}
> $$

**Proof**

It's direct algebra. 
Use the definiton of $\epsilon$-subgradient applied to the equivalent subgradient characterization of the $\epsilon$-inexact proximal operator. 
The equality follows by using the Cosine equality in Euclidean space. 

$\square$

**Remarks**

Make the observation that the proximal inequality had been relaxed by the introduction of inexact proximal operator. 

**Commentary | Widely used in the literature**

This idea is widely used in literatures for inexact proximal methods! 
However, actual implementations require sufficient conditions that are simple to compute $x\approx_\epsilon \prox_{\lambda g}(x)$, with as little prior knowledge as possible. 
Next, we will apply the duality results for $\epsilon$-subgradient, which can characterize the error term $\epsilon$ in computationally accessible terms. 

#### **Assumption 1 | for inexact proximal gradient**
> This assumption is about $(f, g, L)$ in the space of $\R^n$ where 
> - $f: \R^n \rightarrow \R$ is a $L$-Lipschitz smooth function that is also convex. 
> - $g: \R^n \rightarrow \overline \R$ is a closed, convex and proper function. 

#### **Definition | Inexact Proximal Gradient**
> Let $(f, g, L)$ satisfies **Assumption 1**. 
> Let $\epsilon \ge 0$. 
> Then, $\tilde x \approx_\epsilon T_B(x)$ solves the proximal gradient problem approximately if it satisfies variational inequality: 
> $$
> \begin{aligned}
>     \mathbf 0 \in \partial_\epsilon\left[
>         z \mapsto \langle \nabla f(x), z\rangle
>         + \frac{B}{2}\Vert z - x\Vert^2 + g(z)
>     \right](\tilde x)
>     = \nabla f(x) + B(x - \tilde x) + \partial_\epsilon g(\tilde x). 
> \end{aligned}
> $$

**Remarks**

There is an implict use of calculus rules for the Epsilon subgradient here. 


#### **Theorem | Inexact proximal gradient inequality**
> Let $(f, g, L)$ satisfies **Assumption 1**. 
> Let $\epsilon \ge 0$. 
> Consider $\tilde x \approx_\epsilon T_{B + \beta}(x)$. 
> If in addition, it satisfies $D_f(\tilde x, x) \le B/2\Vert x - \tilde x\Vert^2$. 

**Proofs**




---
### **Inexact proximal gradient with relative errors**

One technique used in the literature is from Catalyst. 
See [Catalyst Accelerations Part IV, Inexact Oracles](../../MATH%20602%20Nesterov%20Acceleration/Catalyst%20Accelerations%20Part%20IV,%20Inexact%20Oracles.md) for more information 
Catalyst as introduced by Hongzhou Lin et al. 
They Characterize the error of the inner loop by the optimality gap of the proximal point problem presented to the algorithm in the inner loop. 
We make the following assumptions, notations in this section. 

1. $f: \R^n \rightarrow \R$ is a convex differentiable function with $L$ Lipschitz smooth gradient. 
2. $g: \R^n \rightarrow \overline \R$ is a closed, convex, and proper function. 

The ideas in this section are also in "Catalyst acceleration for first-order convex optimization: from theory to practice" by Lin et al. 
We refer to this paper by "The second Catalyst paper". 
Recall the following lemma from [Inexact FISTA made Simple Part II](../../MATH%20602%20Nesterov%20Acceleration/Inexact%20FISTA%20made%20Simple%20Part%20II.md). 

#### **Lemma | minimizing a strongly convex function inexactly**
> Let $h: \R^n \rightarrow \overline \R$ be a $\kappa$ strongly convex function. 
> Let $x^+ = \argmin{z}\;h(z)$ to be the minimizer. 
> For all $\epsilon$ let $\tilde x$ be such that $h(\tilde x) - h(x^+) \le \epsilon$.
> Then it has 
> $$
> \begin{aligned}
>     (\forall z\in \R^n)(\forall \theta \in \R)\quad
>     0 &\le 
>     h(z) - h(\tilde x) - \frac{\kappa(1 - \theta)}{2}\Vert z - \tilde x\Vert^2
>     + \epsilon \max\left(1, \theta^{-1}\right). 
> \end{aligned}
> $$

**Proof** See the file in the link above. $\square$

Using this, we derived the following proximal inequality, which is essentially the same as the second Catalyst paper by Hongzhou Lin et al. 
See the original file for their respective proofs. 
Denote $T_{\kappa}$ to be the exact evaluation of the proximal gradient operator on $f, g$. 

#### **Definition | Inexact proximal gradient operator with relative error**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> Let $\delta \ge 0$, $\kappa \ge 0$, define $h_\kappa(z| x) := z \mapsto g(z) + \langle \nabla f(x), z\rangle + \frac{\kappa}{2}\Vert z - x\Vert^2$. 
> Let $x^+ = T_\kappa(x)$, with $T_\kappa$ given by **Definition 1**. 
> Then, the inexact proximal gradient operator is defined as: 
> $$
> \begin{aligned}
>     T_\kappa^{(\delta)}(x) := 
>     \left\lbrace
>         z \in \R^n : 
>         h_\kappa(z| x) - h_\kappa(x^+ | x) \le \frac{\delta}{2}\Vert z - x\Vert^2
>     \right\rbrace. 
> \end{aligned}
> $$

#### **Theorem | Inexact over regularized proximal gradient inequality**
> Let $(F, f, g, L)$ satisfies **Assumption 0**. 
> For any $\delta \in [0, 1], \kappa \ge 0$. 
> For all $x$, let $\tilde x \in T_{B + \kappa}^{(\delta\kappa)}(x)$ and assume $D_f(\tilde x, x) \le B/2\Vert \tilde x - x\Vert^2$. 
> Then, for all $z \in \R^n$: 
> $$
> \begin{aligned}
>     0 &\le 
>     F(z) - F(\tilde x)
>     + \frac{B + \kappa}{2}\Vert z - x\Vert^2
>     - \frac{(B + \kappa)(1 - \delta)}{2}\Vert z - \tilde x\Vert^2. 
> \end{aligned}
> $$

**Commentaries**. 
This approach requires the inner loop to tackle a conex feasibility problem of the form $h_\kappa(z) - h^+ \le \frac{\delta\kappa}{2}\Vert z - x\Vert^2$. 
It's not hard to see that the solution always exists. 
This problem is difficult to track the complexity for because $h^+$ is unknown. 
In addition, it's impossible to know in prior what the desired accuracy is needed to satisfies the conditions since it depends on $x, x^+$, with $x^+$ being the minimizer of $h$. 
This limits the possible use of algorithms that solve the inner loop problem, theoretically, and in practice. 
