- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md)


---
### **Intro**

This file replaces [Strong Convexity LEGACY](Strong%20Convexity%20LEGACY.md). 
Some of the contents will be re-written and stated in a clear manner. 

#### **Definition | strongly convex function**
> $f: \R^n \rightarrow \R^n$ is $\alpha$ strongly convex if and only if $f - \alpha/2\Vert \cdot\Vert^2$ is a convex function. 

The theorem below is from [Subgradient Characterizations of Convexity](Subgradient%20Characterizations%20of%20Convexity.md). 

#### **Theorem | Equivalences of convexity via subgradient**
> Let $f: \R^n \rightarrow \overline \R$ is convex then the following are equivalent: 
> 1. $f$ is a convex function. 
> 2. For all $x\in \R^n, y \in \text{dom}\; \partial f(y) \neq \emptyset$, for all $v \in \partial f(y)$ such that $f(x) - f(y) - \langle v, x- y\rangle \ge 0$. 
> 3. For all $x, y \in \text{dom}\; \partial f$, it has $\forall x' \in \partial f(x), y' \in \partial f(y)$ then $\langle x' - y', x - y\rangle \ge 0$ and it's maximally monotone. 

Recall the following definition of strong convexity. 

#### **Definition | Strong convexity**
> The function $f:\R^n \rightarrow \overline \R$ is strongly convex if and only if there exists $\alpha > 0$ such that $f - \alpha/2\Vert \cdot\Vert^2$ is also a convex function. 

Such a function has the following property: 
1. $f$ is bounded below. 
2. $f$ has a unique minimizer and minimum which we denote it by $\bar x, f_+$. 

The following characterization of convexity are equivalent. 
Recall the definition of subgradient $\partial f: \R^n \rightarrow 2^{\R^n}$. 

#### **Theorem 2 | Equivalent subgradient characterizations of strong convexity**
> Let $f: \R^n \rightarrow \overline \R$ be a $\alpha > 0$-strong convex function then the following statement are equivalent: 
> 1. $f - \alpha/2\Vert \cdot\Vert^2$ is a convex function. 
> 2. It has for all $x \in \text{dom}\; \partial f, v \in \partial f(x), y \in \R^n$ $f(y) - f(x) - \langle v, y - x\rangle - \frac{\alpha}{2}\Vert x - y\Vert^2 \ge 0$. 
> 3. $\partial f: \R^n \rightarrow 2^{\R^n}$ is a maximally monotone operator and it has for all $x, y \in \text{dom}\; \partial f$, $x' \in \partial f(x), y' \in \partial f(y)$ such that $\langle x - y, x' - y'\rangle \ge \alpha\Vert x - y\Vert^2$. 

**Proof**


Subgradient sum rule allows: 

$$
\begin{aligned}
    \partial [f - \alpha/2\Vert \cdot\Vert^2](x) &= \partial f(x) - \alpha x. 
\end{aligned}
$$
Let's show that **(1) implies (2) are equivalent**. 
Starting with $f - \alpha/2\Vert \cdot\Vert^2$ is convex, the equivalent subgradient characterization has for all $y \in \R^n$, $x' \in \partial \left[f - \alpha/2\Vert \cdot\Vert^2\right](x)$ that $\exists v := x' + \alpha x \in \partial f(x)$ such that: 

$$
\begin{aligned}
    0 &\le 
    f(y) + \alpha/2\Vert x\Vert^2 - f(x) - \alpha/2\Vert y\Vert^2 - \langle x', y - x\rangle
    \\
    &= f(y) - f(x) - \langle v - \alpha x, y -x\rangle + \alpha/2(\Vert x\Vert^2 - \Vert y\Vert^2)
    \\
    &= 
    f(y) - f(x) 
    - \langle v, y - x\rangle - \alpha \Vert x\Vert^2 
    + \alpha \langle x, y\rangle
    + \alpha/2(\Vert x\Vert^2 - \Vert y\Vert^2)
    \\
    &= 
    f(y) - f(x) 
    - \langle v, y - x\rangle
    + \alpha \langle x, y\rangle
    + \alpha/2(-\Vert x\Vert^2 - \Vert y\Vert^2)
    \\
    &= f(y) - f(x) 
    - \langle v, y - x\rangle - \frac{\alpha}{2} \Vert x -y\Vert^2. 
\end{aligned}
$$
$v, x$ are one to one relation hence this holds for all $v \in \partial f(x)$. 
Starting from here, **(2) implies (3)** is direct; take any $x, y \in \text{dom}\; \partial f$ it has $\forall x' \in \partial f(x), y' \in \partial f(y)$: 
$$
\begin{aligned}
    0 &\le f(x) - f(y) - \langle y', x - y \rangle - \frac{\alpha}{2}\Vert x - y\Vert^2
    \\
    &\le f(x) - f(y) - \langle y', x - y \rangle - \frac{\alpha}{2}\Vert x - y\Vert^2
    + f(y) - f(x) - \langle x', y - x\rangle - \frac{\alpha}{2}\Vert x - y\Vert^2
    \\
    &= \langle y' - x', y - x\rangle - \alpha\Vert x - y\Vert^2. 
\end{aligned}
$$

**To show that (3) implies (2)**, consider any $x, y \in \R^n$, for all $x' \in \partial f(x), y' \in \partial f(y)$ it has: 

$$
\begin{aligned}
    0 &\le 
    \langle x - y, x' - y'\rangle - \alpha\Vert x - y\Vert^2
    \\
    &= \langle x - y, x' - y' - \alpha(x - y)\rangle
    \\
    &= \langle x - y, x' - \alpha x - (y' - \alpha y)\rangle. 
\end{aligned}
$$

Take note that $u = x' - \alpha x \in \partial f(x), v = y' - \alpha y \in \partial f(y)$. 
Subgradient sum rule indicates that: 
$$
\begin{aligned}
    u \in \partial \left[f - \alpha/2\Vert \cdot\Vert^2\right](x), 
    v \in \partial \left[f - \alpha/2\Vert \cdot\Vert^2\right](y). 
\end{aligned}
$$

Through subgradient characterization of convexity, the function $f - \alpha/2\Vert \cdot\Vert^2$ is convex. 
$\blacksquare$


#### **Theorem | Jensen inequality characterization of strong convexity**
> Let $f:\R^n \rightarrow \R$ be $\alpha \ge 0$ strongly convex then, it is equivalent to 
> $$
> (\forall \lambda \in [0, 1])\; 
> f(\lambda x + (1 - \lambda)y) \le \lambda f(x) + (1 - \lambda)f(y) -\alpha\frac{\lambda(1 - \lambda)}{2}> \Vert y - x\Vert^2
> $$

**Proof**

Let $h = x\mapsto f(x) - \alpha/2 \Vert \cdot\Vert^2$, which is a convex function. 
Then, Jensen inequality yields on $h$ the following: 

$$
\begin{aligned}
    0 &\le h(\lambda x + (1 - \lambda)y) - \lambda h(x) - (1 - \lambda) h(y)
    \\
    &= (f(\lambda x + (1 - \lambda)y) - \lambda f(x) - (1 - \lambda) f(y))
    - \frac{\alpha}{2}\Vert \lambda x + (1 - \lambda)y \Vert^2 
    + \frac{\alpha\lambda}{2}\Vert x\Vert^2
    + \frac{\alpha(1 - \lambda)}{2}\Vert y\Vert^2
    \\
    &\underset{\text{(a)}}{=}
    f(\lambda x + (1 - \lambda)y) - \lambda f(x) - (1 - \lambda) f(y)
    \\ &\quad 
        -  
        \frac{\alpha}{2}\left(
            \lambda \Vert x\Vert^2 + (1 - \lambda)\Vert y\Vert^2 + \lambda(1 - \lambda)\Vert x - y\Vert^2
        \right)
        + \frac{\alpha\lambda}{2}\Vert x\Vert^2
        + \frac{\alpha(1 - \lambda)}{2}\Vert y\Vert^2
    \\
    &= 
    f(\lambda x + (1 - \lambda)y) - \lambda f(x) - (1 - \lambda) f(y)
    - \frac{\alpha \lambda(1 - \lambda)}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

$\blacksquare$


---
### **Basic consequence of strong convexity**

Theorems below are weaker than the condition of strong convexity. 

#### **Lemma 1 | PL Error bound**
> Let $f: \R^n \rightarrow \R$ be $\alpha$ strongly convex. 
> For all $x\in \R^n$, the optimality gap satisfies: 
> $$
> \begin{aligned}
>     \alpha/2 \Vert x - \bar x\Vert^2 \le 
>     f(x) - f^+
>     \le 1/(2\alpha)\dist(\mathbf 0; \partial f(x))^2 . 
> \end{aligned}
> $$

**Proof**

The lower bound is direct from the gradient characterization of strong convexity. 
The upper bound is direct by considering the strongly convex characterization that: 

$$
\begin{aligned}
    (\forall v \in \partial f(x))\; 
    0 
    &\le \inf_{y\in \R^n}
    \left\lbrace
        f(y) - f(x) - \langle v , y - x\rangle - \frac{\alpha}{2} 
        \Vert x - y\Vert^2
    \right\rbrace 
    \\
    &= \inf_{y\in \R^n}
    \left\lbrace
        f(y) - \langle v , y - x\rangle - \frac{\alpha}{2} 
        \Vert x - y\Vert^2
    \right\rbrace 
    - f(x)
    \\
    &\le 
    \inf_{y\in \R^n}
    \left\lbrace
        f(y) 
        +
        \sup_{z \in \R^n} 
        \left\lbrace
            - \langle v , z - x\rangle - \frac{\alpha}{2} 
            \Vert x - z\Vert^2
        \right\rbrace
    \right\rbrace 
    - f(x)
    \\
    &= 
    f^+ + 
    \sup_{z \in \R^n} 
    \left\lbrace
        - \langle v , z - x\rangle - \frac{\alpha}{2} 
        \Vert x - z\Vert^2
    \right\rbrace - f(x)
    \\
    &= 
    f^+ + \langle v, \alpha^{-1}v\rangle
    - \frac{\alpha}{2}\Vert \alpha^{-1} v\Vert^2
    - f(x)
    \\
    &= f^+ - f(x) + \frac{1}{2\alpha} \Vert v\Vert^2. 
\end{aligned}
$$

The upper bound is justified because this holds for all $v \in \partial f(x)$.
Where we used: 

$$
\begin{aligned}
    v &\in \argmin{z}
    \left\lbrace
        - \langle v , z - x\rangle - \frac{\alpha}{2} 
        \Vert x - z\Vert^2
    \right\rbrace
    \\
    \implies
    \mathbf 0 &= - v - \alpha(z - x)
    \\ \iff 
    0 &= - \alpha^{-1}v - (z - x)
    \\
    \iff 
    \alpha^{-1} v - x &= -z
    \\
    -\alpha^{-1} v  &= z -x. 
\end{aligned}
$$

$\blacksquare$


#### **Lemma 2 | cute secant line inequality**



---
### **Co-coersiveness of strong convexity**

Strong convexity mirrors some of the properties of Lipschitz smoothness of a function. 
This is true because the inverse of $\partial f$ is a nonexpansive operator. 


#### **Theorem 3.1 | The inverse is nonexpansive**

