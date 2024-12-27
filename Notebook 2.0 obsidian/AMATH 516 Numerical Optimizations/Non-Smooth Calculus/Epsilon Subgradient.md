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
- Pham Duy Khanh, et al. Inexact Proximal Methods for Weakly Convex Functions, on Arxiv. 

Taken from the weakly convex function IPPM is the following definition of epsilon subgradient: 

#### **Definition | Epsilon convex subgradient**
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
Which is changing WRT to whatever $x$ is given in relation to $\bar x$, but here $\epsilon \ge 0$ is fixed. 


When $g:\R \rightarrow \R = - x^2, \bar x = 0$, $\partial g_\epsilon(0) = \emptyset \;\forall \epsilon \ge 0$. 
Because from the definition it tries to assert $\exist \epsilon \ge 0, v \in \R$ such that $vx \le \bar x + \epsilon$. 
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

This section focuses on the section in Moduchovich's book. 
The book assume convexity, and it analyzes properties of the convex epsilon subdifferential and its calculus rules. 

**Assumption**

> $f: \R^n\rightarrow \overline \R$ is a convex, proper lsc function. 





#### **Proposition | Basic properties of convex epsilon differential**
> Let $f:\R^n\rightarrow \overline \R$, choose any $\bar x \in \text{dom }f$, the $\partial f(\bar x)$ has 
> 1. $0\le\epsilon_1\le \epsilon_2\implies \partial_{\epsilon_1}f(\bar x)\subseteq \partial_{\epsilon_2}f(\bar x)$. 
> 2. $\partial f(\bar x) = \bigcap_{\epsilon > 0}\partial f_\epsilon(\bar x)$. 


The can of worms has been opens. 
Epsilon subgradient mirrors the standard convex subgradient in an intriguing way. 

**Remarks**

Proposition 5.16 in the book. 

#### **Proposition | Fenchel epsilon inequality**
> Take $f:\R^n\rightarrow \overline \R$ as assumed in this section. 
> Let $\epsilon \ge 0$. 
> Then $x^* \in \partial_\epsilon f(x)$ if and only if 
> $$
>     f^\star(x^*) + f(\bar x) \le \langle x^*, \bar x\rangle + \epsilon.
> $$

**Proof**

The forward direction shows that the inequality is true for any $x^* \in \partial_\epsilon f(\bar x), \bar x \in \text{dom}\; f$. 
By definition of the epsilon subdifferential, for all $x \in \R^n$: 

$$
\begin{aligned}
    \langle x^*, x - \bar x\rangle 
    &\le f(x) - f(\bar x) + \epsilon
    \\
    \iff 
    \langle x^*, x\rangle - f(x) &\le 
    \langle x^*, \bar x\rangle - f(\bar x) + \epsilon
    \\
    \implies 
    \sup_{y\in \R^n}\{\langle x^*, y\rangle - f(y)\} = 
    f^\star(x^*) &\le 
    \langle x^*, \bar x\rangle - f(\bar x) + \epsilon. 
\end{aligned}
$$

We can take the supremum because the inequality of the epsilon subdifferential is true for all $x \in \text{dom}\; f$. 

The inverse is by 

$$
\begin{aligned}
    f^\star(x^*) + f(\bar x) 
    &\le \langle x^*, \bar x\rangle + \epsilon
    \\
    f^\star(x^*) = 
    \sup_{y\in \R^n}\left\lbrace\langle y, x^*\rangle - f(y) \right\rbrace
    &\le 
    \langle x^*, \bar x\rangle - f(\bar x)  + \epsilon. 
\end{aligned}
$$

If we specify any $x \in \text{dom}\; f$, then it implies: 

$$
\begin{aligned}
    \langle x, x^*\rangle - f(x) 
    &\le f^\star(x^*) 
    \le \langle x^*, \bar x\rangle - f(\bar x) + \epsilon
    \\
    \implies 
    \langle x, x^*\rangle - f(x) 
    &\le
    \langle x^*, \bar x\rangle - f(\bar x) + \epsilon
    \\
    \langle x^*, x - \bar x\rangle&\le 
    f(x) - f(\bar x) + \epsilon. 
\end{aligned}
$$

The above inequality is true for all $x\in \text{dom}\; f$, hence equivalently $x^*\in \partial_\epsilon f(\bar x)$. 

**Remarks**

There is nothing new here in the proof, setting $\epsilon = 0$, it becomes the same proof for Fenchel inequality in the classical convex analysis case. 

This is proposition 5.18 in the book. 


#### **Proposition | Strong subgradient sum rule**
> Take both $f, g: \R^n\rightarrow \overline \R$ to satisfy assumption in this section. 
> Let $\epsilon \ge 0$. 
> Then the $\epsilon$ subdifferential sum rule states that 
> $$
> \begin{aligned}
>     \partial_\epsilon[f + g](\bar x) = 
>     \bigcup \left\lbrace
>         \partial_{\epsilon_1} f(\bar x) + 
>         \partial_{\epsilon_2} g(\bar x) \left|\; 
>             \min(\epsilon_1, \epsilon_2) \ge 0\wedge 
>             \epsilon_1 + \epsilon_2 = \epsilon
>         \right.
>     \right\rbrace
> \end{aligned}
> $$
> in each of the following scenario: 
> 1. $f$ is continuous at some point $\bar u \in \text{dom}\; f$. 
> 2. $\text{ri.dom}\; f \cap \text{ri.dom}\;g \neq \emptyset$. 

**Proof**

The inclusion of $\supseteq$ is obvious and the direction $\subseteq$ are not obvious and requires considerations under listed scenario 1, 2. 

Let's handle the easier case first. 
Fix any $\epsilon = \epsilon_1 + \epsilon_2 \ge 0$. 
By definition of $\bar x \in \text{dom}\; f \cap \text{dom}\; g$, for all $x \in \R^n$: 

$$ 
\begin{aligned}
    \langle v_1, x - \bar x\rangle 
    &\le f(x) - f(\bar x) + \epsilon_1 \quad (\forall v_1 \in \partial_{\epsilon_1} f(\bar x)), 
    \\
    \langle v_2, x - \bar x\rangle 
    &\le g(x) - g(\bar x) + \epsilon_2 \quad (\forall v_2 \in \partial_{\epsilon_2} g(\bar x)). 
\end{aligned}
$$

Fix any $v_1 \in \partial_{\epsilon_1}f(\bar x), v_2 \in \partial_{\epsilon_2}g(\bar x)$
Adding the inequalities implies

$$
\begin{aligned}
    \langle v_1 + v_2, x - \bar x\rangle &\le 
    [f + g](\bar x)
    - 
    [f + g](\bar x) + \epsilon_1 + \epsilon_2
    \\
    &= 
    [f + g](\bar x)
    - 
    [f + g](\bar x) + \epsilon
    \\
    \implies 
    v_1 + v_2 &\in \partial_\epsilon [f + g](\bar x). 
\end{aligned}
$$

Take note that, when $\epsilon = 0$ and/or $\bar x \not\in \text{dom}\; f\cap \text{dom}\; g$ becomes an edge case.
In this case, the subgradients $\partial_{\epsilon_1} f(\bar x), \partial_{\epsilon_2} g(\bar x)$ can be empty, which make things trivially true. 
Therefore, the easier direction $\supseteq$ had been verified. 