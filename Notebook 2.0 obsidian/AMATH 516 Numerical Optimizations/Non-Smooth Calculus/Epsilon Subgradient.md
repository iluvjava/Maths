Pre-req: 
- [Subgradient Intro](Subgradient%20Intro.md)
- [Convex Separations Theorems](../CVX%20Geometry/Strict%20Separations%20Theorem.md)


---
### **Intro**

Epsilon subgradient is an half cooked version of the subgradient. 
It's instrumental to studying exact subgradient, and it's weaker than the exact subgradient. 
It's computationally more appealing as well. 

**Reference**

- Moduchovich B. Mau Nam. N, Convex Analysis and Beyond: Volume I: Basic Theory, Springer Series in Operations Research and Financial Engineering. Specifically Chapter 5. 
- Pham Duy Khanh, et al. Inexact Proximal Methods  for Weakly Convex Functions, on Arxiv. 

Taken from the weakly convex function IPPM is the following definition of Epsilong subgradient: 

#### **Definition | Epislon convex subgradient**
> Let $g: \R^n \rightarrow \overline \R$ be proper, lsc. 
> Let $\epsilon \ge 0$. 
> Then the $\epsilon$-subdifferential of $g$ at some $\bar x \in \text{dom}\;g$ is given by: 
> $$
> \begin{aligned}
>     \partial g_\epsilon(\overline x) := 
>     \left\lbrace
>         v \in \R^n \left| \; 
>             \langle v, x - \overline x\rangle \le 
>             g(x) - g(\overline x) + \epsilon \;\forall x \in \R^n
>         \right. 
>     \right\rbrace.
> \end{aligned}
> $$

**Observations**

$\partial g_0(x)$ is the same as the convex subdifferential. 
Regular subgradient had $\epsilon = o(\Vert x - \bar x\Vert)$. 
Which is changing wrt to whatever $x$ is given in relatin to $\bar x$, but here $\epsilon \ge 0$ is fixed. 


When $g:\R \rightarrow \R = - x^2, \bar x = 0$, $\partial g_\epsilon(0) = \emptyset \;\forall \epsilon \ge 0$. 
Because from the definition it tries to asserts $\exist \epsilon \ge 0, v \in \R$ such that $vx \le \bar x + \epsilon$. 
Which is simply impossible. 

A more, permissible interpretation is to uplift the dimension. 
Consider any $v \in \partial g_\epsilon(\bar x), \bar x \in \text{dom }g$ and $\epsilon \ge 0$, the inequality in the definition has $\forall x \in \R^n$: 

$$
\begin{aligned}
    \iff 
    \langle v, x - \bar x\rangle &\le g(x) - g(\bar x) + \epsilon 
    \\
    \iff 
    \langle v, x- \bar x\rangle - g(x) + g(\bar x) 
    &\le \epsilon
    \\
    \iff 
    \left\langle 
        \begin{bmatrix}
            g(x) - g(\bar x) \\ x - \bar x
        \end{bmatrix}, 
        \begin{bmatrix}
            1 \\ v
        \end{bmatrix}
    \right\rangle &\le \epsilon. 
\end{aligned}
$$

The last line of inequality resembles the normal cone definition of epigraph of $g$ at the point $\bar x$. 
It's a weaker normal cone description of the epigraph of $g$. 


#### **Definition | Epsilon regular subgradient**
> Let $g: \R^n \rightarrow \overline \R$ be proper, lsc. 
> Let $\epsilon \ge 0$. 
> Then the $\epsilon$-subdifferential of $g$ at some $\bar x \in \text{dom}\;g$ is given by: 
> $$
> \begin{aligned}
>     \widehat \partial g_\epsilon(\overline x) := 
>     \left\lbrace
>         v \in \R^n \left| \; 
>             \langle v, x - \overline x\rangle \le 
>             g(x) - g(\overline x) + o(\Vert x - \bar x\Vert) + \epsilon \;\forall x \in \R^n
>         \right. 
>     \right\rbrace.
> \end{aligned}
> $$


**Remarks**

I made this up, not sure if this is the references or not. 


#### **Definition | Weak epsilon subdifferential**
> Let $\epsilon, \varrho$ be non-negative numbers. 
> The weak $\epsilon$-subdifferential of a $\varrho$ weakly convex function $g: \R^n \rightarrow \overline \R$ is defined by 
> $$
> \begin{aligned}
>     \partial_{\epsilon, \varrho} g(\overline x) := 
>     \left\lbrace
>         v \in \R^n \left| 
>             \langle v, x - \bar x\rangle \le 
>             g(x) - g(\bar x) + \varrho/2\Vert x - \bar x\Vert^2 \; \forall x \in \R^n
>         \right.
>     \right\rbrace. 
> \end{aligned}
> $$

**Observations:**

The little-o term is replaced with the 2-norm squared. 
This is a more specific identification of the epsilon regular subgradient. 




---
### **Epsilon subgradient under the convexity assumption**





