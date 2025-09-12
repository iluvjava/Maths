- [Proximal Gradient Inequality Part I](Proximal%20Gradient%20Inequality%20Part%20I.md)
- [Inexact FISTA Made Simple Part I](../../MATH%20602%20Nesterov%20Acceleration/Inexact%20FISTA%20Made%20Simple%20Part%20I.md)
- [Inexact FISTA made Simple Part II](../../MATH%20602%20Nesterov%20Acceleration/Inexact%20FISTA%20made%20Simple%20Part%20II.md)
- [Convex Epsilon Subgradient Deep Dive](../Non-Smooth%20Calculus/Convex%20Epsilon%20Subgradient%20Deep%20Dive.md) 

---
### **Intro**

Inexact proximal gradient inequality has a lot to do with inexact FISTA method, and their variants. 
Unfortunately, there are many different approaches and they all play an important roles for inexact proximal algorithms. 

---
### **Epsilon Subgradient**

In this section, let $g: \R^n \rightarrow \overline \R$ to be a closed, convex, and proper function. 

#### **Define | epsilon subgradient**
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
### **Inexact Proximal gradient with absolute errors**

The inexact proximal gradient relates directly to a proximal gradient inequality with absolute errors. 

#### **Definition | Inexact proximal operator**
> For all $x \in \R^n, \epsilon \ge 0, \lambda > 0$, $\tilde x$ is an inexact evaluation of proximal point at $x$, if and only if it satisfies: 
> $$
> \begin{aligned}
>     \lambda^{-1}(x - \tilde x) \in \partial_{\epsilon^2/(2\lambda)} g(x). 
> \end{aligned}
> $$
> which we denote by $\tilde x \approx_\epsilon \prox_{\lambda g}(x)$. 

#### **Theorem | Inexact proximal inequality**
> Let $\epsilon \ge 0, x \in \R^n$. 
> $\tilde x \approx_\epsilon \prox_{\lambda g}(x)$ if and only if for all $z \in \R^n$ it satisfies: 
> $$
> \begin{aligned}
>     0 &\le 
>     g(z) - g(x) 
>     - \lambda^{-1}\langle x - \tilde x, z - x \rangle 
>     + \frac{\epsilon^2}{2\lambda}. 
>     \\
>     &= g(z) - g(x) + \frac{1}{2\lambda}\Vert \tilde x - z\Vert^2 
>     - \frac{1}{2\lambda} \Vert x - \tilde x \Vert^2 - \frac{1}{2\lambda} \Vert z - x\Vert^2
>     + \frac{\epsilon_2}{2\lambda}. 
> \end{aligned}
> $$

**Proof**

It's direct algebra by the definiton of epsilon subgradient applied to the equivalent subgradient characterization of the inexact proximal operator. 

$\square$

**Remarks**

Make the observation that the proximal inequality had been relaxed by the introduction of inexact proximal operator. 


---
### **Inexact proximal gradient with relative errors**


