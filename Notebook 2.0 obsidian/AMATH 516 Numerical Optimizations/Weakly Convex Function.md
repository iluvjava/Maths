- [Characterizing Functions for Optimizations](AMATH%20516%20Numerical%20Optimizations/Background/Characterizing%20Functions%20for%20Optimizations.md)

---
### **Intro**

Contents in this section is essentially the same with [Strong Convexity](Properties%20of%20Functions/Strong%20Convexity.md). 
The term "weakly convex" is also referred to as "Hypoconvexity" in the literatures. 


#### **Definition | Weakly convex function**
> Let $f: \R^n \rightarrow\overline \R$ be an l.s.c proper function. 
> We define $F$ to be $q$ weakly convex if there exists $q \in \R$ such that the function $F + q/2\Vert \cdot\Vert^2$ is a convex function. 

It's obvious that $\text{dom}\;f$ must be a convex set for all weakly convex function. 
Not only that, since $F + q/\Vert \cdot\Vert^2$ is a convex function, it is locally Lipschitz on the set $\text{ri dom}\; F$ by $1/2\Vert \cdot\Vert^2$ globally Lipschitz everywhere. 
The following claim state this preliminary observation from the definition of weakly convex function. 

#### **An observation on weakly convex function**
> If $f$ is $q$ weakly convex, then it is locally Lipschitz continuous on $\text{ri dom}\; f$. However, if a function is Lipschitz continuous, it is not necessarily weakly convex. 
> For example $- \Vert x\Vert$. 

#### **Definition | regular Subgradient**
> Let $F:\R^n \rightarrow \overline \R$ be l.s.c and proper. 
> Then the regular subgradient $\hat \partial f(x)$ is the set such that for all $\bar x \in \text{dom}(f), x \in \R^n$ it has $\forall v \in \hat \partial f(\bar x)$: 
> $$
> \begin{aligned}
>     0 &\le 
>     \liminf_{x \rightarrow \bar x} 
>     \frac{
>         f(x) - f(\bar x) - \langle v, x - \bar x\rangle 
>     }
>     {\Vert x - \bar x\Vert}.
> \end{aligned}
> $$
> Or equivalently: 
> $$
> \begin{aligned}
>     0 \le 
>     f(x) - f(\bar x) - \langle v, x - \bar x\rangle 
>     - o(\Vert x - \bar x\Vert). 
> \end{aligned}
> $$

Recall the sequence of equivalent characterization for convex function through their convex subgradient from [Subgradient Characterizations of Convexity](Properties%20of%20Functions/Subgradient%20Characterizations%20of%20Convexity.md). 

In addition, we take the sum rule for regular subgradient (See [Regular Subgradient](Non-Smooth%20Calculus/Subgradients%20Intro.md)) for more and, it gives: 

$$
\begin{aligned}
    \partial[f + q/2\Vert \cdot\Vert^2](x)
    =
    \hat \partial[f + q/2\Vert \cdot\Vert^2](x) 
    &= 
    \hat \partial f(x) + qx. 
\end{aligned}
$$

---
### **Basic characterizations on weakly convex functions**


#### **Theorem 1 | weak convexity equivalent characterizations via regular subgradient**
> Let $F$ be a $q$ weakly convex function. 
> Then the following conditions are all equivalent. 
> 1. There exists $q \in \R$ such that $h:= f + q/2\Vert \cdot\Vert^2$ is a convex function. 
> 2. For all $\alpha \in [0, 1], x \in \R^n, y \in \R^n$ it has $0 \le f(\alpha x + (1 - \alpha)y) - \alpha f(x) - (1 - \alpha)f(y) + q \alpha(1 - \alpha)/2 \Vert x - y\Vert^2$. 
> 3. It has, for all $x \in \R^n, y \in \R^n$ and $u \in \hat \partial f(y)$ the inequality: $0 \le f(x) - f(y) - \langle u, x - y\rangle + q/2\Vert x - y\Vert^2$. 

**Proof**

**We first prove (1) is equivalent to (2)**. 
The proof is direct and, we will make use the following intermediate results: 
- **(a)**: The cute inequality in Euclidean space. See [Equalities, Inequalities of Euclidean Space](Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md). 

Let $x \in \R^n, y \in \R^n$. 
Starting with the Jensen's inequality by the convexity of $h$ it has for all $\alpha \in [0, 1]$ the inequality: 

$$
\begin{aligned}
    0 &\le h(\alpha x + (1 - \alpha)y) - \alpha h(x) - (1 - \alpha) h(y)
    \\
    &= (h(\alpha x + (1 - \alpha)y) - \alpha h(x) - (1 - \alpha) h(y))
    +  \frac{q}{2}\Vert \alpha x + (1 - \alpha)y \Vert^2 - \frac{q\alpha}{2}\Vert x\Vert^2
    - \frac{q(1 - \alpha)}{\Vert y\Vert^2}
    \\
    &\underset{\text{(a)}}{=}
    h(\alpha x + (1 - \alpha)y) - \alpha h(x) - (1 - \alpha) h(y)
    \\ &\quad 
        +  
        \frac{q}{2}\left(
            \alpha \Vert x\Vert^2 + (1 - \alpha)\Vert y\Vert^2 - \alpha(1 - \alpha)\Vert x - y\Vert^2
        \right)
        - \frac{q\alpha}{2}\Vert x\Vert^2
        - \frac{q(1 - \alpha)}{2}\Vert y\Vert^2
    \\
    &= 
    h(\alpha x + (1 - \alpha)y) - \alpha h(x) - (1 - \alpha) h(y)
    - \frac{q \alpha(1 - \alpha)}{2}\Vert x - y\Vert^2. 
\end{aligned}
$$

**Now we show (1) is equivalent to (3)**
Let $x, y \in \R^n$. 
The subgradient of $h$ has 
$$
\begin{aligned}
    \partial h(y) = \hat \partial[f + q/2\Vert \cdot\Vert^2](y)
    = \hat \partial f(y) + q y. 
\end{aligned}
$$
Hence, for all $v \in \partial h(y)$ there exists $u \in \hat \partial f(y)$ such that $v = u + q y$. 
The following intermediates results are in order for the proof. 
- **(a)**: $(\forall v \in \partial h(y))\left(\exists u \in \hat \partial f(y)\right)\; v = u + qy$. 
- **(b)**: Because $h$ is convex, it's equivalent to the subgradient characterization of convexity and, it has $(\forall v \in \partial h(y))\; 0 \le f(x) - f(y) - \langle v, x - y\rangle$. 

Starting with **(b)**, it has 

$$
\begin{aligned}
    0 
    &\le 
    h(x) - h(y) - \langle v, x - y\rangle
    \\
    &\underset{\text{(a)}}{=} 
    f(x) + \frac{q}{2} \Vert x\Vert^2 
    - f(y) - \frac{q}{2}\Vert y\Vert^2
    - \langle u + qy, x - y\rangle
    \\
    &= 
    f(x) - f(y) + 
    q\left(
        \frac{1}{2}\Vert x\Vert^2 - \frac{1}{2}\Vert y\Vert^2
        - \langle q^{-1}u + y, x - y\rangle
    \right)
    \\
    &= 
    f(x) - f(y) + 
    q\left(
        \frac{1}{2}\Vert x\Vert^2 - \frac{1}{2}\Vert y\Vert^2
        - \langle q^{-1}u, x - y\rangle
        - \langle y, x - y\rangle
    \right)
    \\
    &= f(x) - f(y) + 
    q\left(
        \frac{1}{2}\Vert x\Vert^2 + \frac{1}{2}\Vert y\Vert^2
        - \langle q^{-1}u, x - y\rangle
        + \langle y, x\rangle
    \right)
    \\
    &= 
    f(x) - f(y) + 
    q\left(
        \frac{1}{2}\Vert x - y\Vert^2
        - q^{-1}\langle u, x - y \rangle
    \right)
    \\
    &= 
    f(x) - f(y) + \frac{q}{2}\Vert x - y\Vert^2 - \langle u, x - y\rangle. 
\end{aligned}
$$

$\blacksquare$
