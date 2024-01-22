---

alias: Proximal Mapping Examples

---
[Proximal Gradient, Forward Backwards Envelope](../Proximal%20Methods/Proximal%20Gradient,%20Forward%20Backwards%20Envelope.md)


---
### **Intro**

We give examples for proximal gradient operator of simple cases of $f$. 
They are the building blocks of more complicated cases of proximal mapping. 
Read the above prereq for formulas and known calculus rule for proximal mappings. 

**References**: 

The book First Order Optimizations by Amir Beck. 


---
### **L1 Regularization**


Let $f = \Vert \cdot\Vert_1: \mathbb R^n \mapsto \mathbb R$, we want to solve for 
$$
\begin{aligned}
    \underset{t\lambda f}{\text{prox}}(y)
    &= 
    \underset{x \in \mathbb R^n}{\text{argmin}}
    \left\lbrace
        \frac{1}{2}\Vert x - y\Vert + \lambda\Vert x\Vert_1
    \right\rbrace
\end{aligned}
$$
And the proximal operator is the famoust soft thresholding mapping $\text{sign}(y)\max(y - \lambda t, 0)$, the operation is applied element wise to the vector $y$. 
Additionally, we have $\text{sign}(\alpha)$ where it maps positive, negative $\alpha$ number to $1, -1$ and to zero, if the number is zero. 


#### **Demonstration**
Our objective is to solve this. Consider this: 

$$
\begin{aligned}
    x^+=& \arg \min_x \left\lbrace
        \frac{1}{2t} \Vert x - y \Vert^2 + \lambda\Vert x\Vert_1
    \right\rbrace 
    \\
    =& 
    \arg\min_{x_1, x_2 \cdots x_n} \left\lbrace
    \sum_{i = 1}^{n}\left(
            \frac{1}{2t} (x_i - y_i)^2 + \lambda |x_i|
        \right)
    \right\rbrace
    \\
    \implies 
    x^+_i =& \arg\min_{x_i}\left\lbrace
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right\rbrace
\end{aligned}
$$

We need to solve for each element of $x_i$, and will need to discuss them by cases because $|x_i|$ is not smooth. Assuming that $x_i \neq 0$, then: 

$$
\begin{aligned}
    \partial\left[
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right] &= 0
    \\
    \frac{1}{t}(x_i - y_i) \pm \lambda &= 0
    \\
    x_i - y_i \pm \lambda t &= 0
    \\
    x_i &= y_i \mp \lambda t
\end{aligned}
$$

Take notice that, when 

$$
\begin{aligned}
    x_i \ge 0 &\implies y_i - \lambda t \ge 0 \implies y_i \ge \lambda t
    \\
    x_i \le 0 &\implies y_i + \lambda t \le 0 \implies y_i \le -\lambda t
\end{aligned}
$$

And if $x_i = 0$, then we will need subgradient, and we have: 


$$
\begin{aligned}
    \partial\left[
        \frac{1}{2t}(x_i - y_i)^2 + \lambda |x_i|
    \right] &\ni 0
    \\
    \frac{1}{t}(x_i - y_i) + [-\lambda, \lambda] &\ni 0
    \\
    x_i - y_i + [-t \lambda, t \lambda] &\ni 0
    \\
     \text{set }x_i &= 0
    \\
    y_i \in [-t \lambda, t\lambda]
\end{aligned}
$$

Take a specfic element of $x_i$, it would only be determined by $y_i$, in which case it's an element-wise operation where the operation for each $y_i$ is given by 

$$
\left(\underset{t\lambda f}{\text{prox}}(y)\right)_i = 

\begin{cases}
    y_i - \lambda t  & y_i \ge \lambda t
    \\
    y_i + \lambda t & y_i \le -\lambda t
    \\
    0 & y_i \in [-t \lambda, t\lambda]
\end{cases}
$$

And it's not hard to realize that the above expression would be equivalent to $\text{sign}(y_i)\max(|y_i| - \lambda t, 0)$. 
The reader should verify this. 
Finally, broadcasting the function to the whole array of $y$ would yield the proximal operator. 

**Remarks**

A simpler form is listed [here](https://math.stackexchange.com/questions/1961888/the-proximal-operator-of-the-l-1-norm-function), the prox operator supper the one norm on a complex vector too. 


---
### **Box Constrained**

The box constraint is defined by the region $[l_i, u_i]\; \forall 1 \le i \le n$, for each of the variable $x_i$. 
Projecting onto a single interval for $y_i$ just $\min(\max(y_i, l_i), u_i)$. 
Apply that for $1\le i \le n$ will work, this is by the parallel property of the proximal operator, so we have

$$
\begin{aligned}
    \text{prox}_{\text{Box}[l, u]}(y) = \min(\max(y, l), u). 
\end{aligned}
$$



---
### **Projection on to Hyper Plane Box Intersections**

> Let $C\subseteq \mathbb R^n$ defined as 
> $$
> C = H_{a, b}^= \cap \text{Box}[l, u] = \{x\in \mathbb R^n: \langle a, x\rangle= b \wedge l \le x \le u\}, 
> $$
> where $a\neq \mathbf 0$, $b \in \mathbb R$, $l \in [-\infty, \infty), u \in (-\infty, \infty]$. Assuming that $C\neq \emptyset$ then 
> $$
> \begin{aligned}
>     &\Pi_C(x) = \Pi_{\text{box}[l, u]}(x - \mu a)
>     \\
>     &\text{where }\mu \in \mathbb R \text{ solves: } \langle a, \Pi_{\text{Box}[l, u]}(x - \mu a)\rangle = b. 
> \end{aligned}
> $$
> The equation can be easily solved using bisection method because it's a $\mathbb R \mapsto \mathbb R$ equation. 

**Demonstration**

The problem become aparently if we can consider its Lagrangian. 
We group the inequality box constrant and us the equality constraint to make the dual variable $u\in \mathbb R$ then the projection also has representation 

$$
\begin{aligned}
    \Pi_{\text{Box}[l, u]\cap H_{a, b}^=}(x)
    &= 
    \underset{l \le y \le u}{\text{argmin}}
    \left\lbrace
        \frac{1}{2}\Vert x - y\Vert^2 + \delta_{H_{a, b}^=}(y)
    \right\rbrace
    \\
    \mathcal L(y, u) &= 
    \delta_{\text{Box}[l, u]}(y) + \frac{1}{2}\Vert x - y\Vert^2 + 
    u(\langle a, y\rangle - b). 
\end{aligned}
$$

Let $(y, u)$ be optimal solution to the saddle point of $\mathcal L$, then it satisfies the conditions: 

$$
\begin{aligned}
    \nabla_u \mathcal L(y^*, u^*) &= \langle a, y^*\rangle - b = 0
    \\
    \iff 
    \langle a, y^*\rangle - b&= 0
    \\
    \partial [\mathcal L(\cdot, u^*)](y^*) &= 
    \partial \delta_{\text{Box}[l, u]}(y^*) + 
    \left\lbrace
        (y^* - x) + u^* a
    \right\rbrace \ni \mathbf 0
    \\
    \mathbf 0 &\in 
    N_{\text{Box}[l, u]}(y^*) + 
    \left\lbrace
        (y^* - x) + u^* a
    \right\rbrace
    \\
    x - ua &\in \{y^*\} + N_{\text{Box}[l, u]}(y^*)
    \\
    \iff y^* & \in \Pi_{\text{Box}[l, u]}(x - u^* a)
\end{aligned}
$$

We use one characterization from [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) to jump from the second last step to the last step. 
The first condition $\langle a, y^*\rangle - b$, substituted by $y^* = \Pi_{\text{Box}[l, u]}(x - u^*a)$, then we attained an equation for solving for $u^*$. 
The solution exists as long as we assume non-empty $C$, then strong duality would apply and solutions $(y^*, u^*)$ of the Lagrangian exists. 


**Remarks**

The equation $\langle a, \Pi_{\text{Box}[l, u]}(x - \mu a)\rangle = b$ can be solved efficiently because it's a $\mathbb R\mapsto \mathbb R$ mapping. 
Simple bisection root finding method will work. 
This demonstration is taken from, Amir Beck First Order method textbook, theorem 6.27. 


---
### **Probability Simplex Projection**

> Proximal mapping over the indicator function of the probability simplex $\Delta_n$ in $\mathbb R^n$ yield the projectin operator onto the convex set $\Delta_n$. The projection can be computed as 
> $$
> \begin{aligned}
>     & \Pi_{\Delta_n}(x) = \Pi_{\mathbb R_+}(x - \mu a)
>     \\
>     & \text{where }\mu \in \mathbb R \text{ solves: } \langle a, \Pi_{\mathbb R_+}(x - \mu \mathbf 1)\rangle = 1. 
> \end{aligned}
> $$

**Demonstrations**

In the previous theorem, observe that $u$ the vector has the option to be an infinite vector, which means that $\mathbb R_+$ is a perfectly fine box to use for the above theorem. 
Based on this observation, setting $a = \mathbf 1, b =1$ then $H_{a, b}^=$ is $\sum_{i = 1}^{n}x_i = 1$ for our case. 
Combining these two sets, the intersection of them is the definition of probability simplex. 
There for we apply the previously proved theorem on projection onto the intersection of a box and a hyper plane. 


---
### **Example 6.16 in Beck's Textbook**! 



---
### **Example 6.17 In Beck's Textbook**! 


---
### **Cheatsheet**
[Amir's Prox Cheatsheet](../References/Amir's%20Prox%20Cheatsheet.pdf)


