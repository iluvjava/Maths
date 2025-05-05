- [Characterizing Functions for Optimizations](AMATH%20516%20Numerical%20Optimizations/Background/Characterizing%20Functions%20for%20Optimizations.md)

---
### **Intro**

Contents in this section is essentially the same with [Strong Convexity](Properties%20of%20Functions/Strong%20Convexity.md). 
The term "weakly convex" is also referred to as "Hypoconvexity" in the literatures. 


#### **Definition | Weakly convex function**
> Let $f: \R^n \rightarrow\overline \R$ be a l.s.c proper function. 
> We define $F$ to be $q$ weakly convex if there exists $q \in \R$ such that the function $F + q/2\Vert \cdot\Vert^2$ is a convex function. 

It's obvious that $\text{dom}\;f$ must be a convex set for all weakly convex function. 
Not only that, since $F + q/\Vert \cdot\Vert^2$ is a convex function, it is locally Lipschitz on the set $\text{ri dom}\; F$ by $1/2\Vert \cdot\Vert^2$ globally Lipschitz everywhere. 
Therefore: 

> If $f$ is $q$ weakly convex, then it is locally Lipschitz continuous on $\text{ri dom}\; f$. 

#### **Definition | regular Subgradient**
> Let $F:\R^n \rightarrow \overline \R$ be l.s.c and proper. 
> Then the regular subgradient $\hat \partial f(x)$ is the set such that for all $\bar x \in \text{dom}(f), x \in \R^n$ it has: 
> $$
> \begin{aligned}
>     \left(\forall v \in \hat \partial f(\bar x)\right)\; 
>     0 &\le 
>     \liminf_{x \rightarrow \bar x} 
>     \frac{
>         f(x) - f(\bar x) - \langle v, x - \bar x\rangle 
>     }
>     {\Vert x - \bar x\Vert}. 
> \end{aligned}
> $$
> and equivalently: 
> $$
> \begin{aligned}
>     \left(\forall v \in \hat \partial f(\bar x)\right)\; 
>     0 \le 
>     f(x) - f(\bar x) - \langle v, x - \bar x\rangle 
>     - o(\Vert x - \bar x\Vert). 
> \end{aligned}
> $$

Recall the sequence of equivalent characterization for convex function through their convex subgradient from [Subgradient Characterizations of Convexity](Properties%20of%20Functions/Subgradient%20Characterizations%20of%20Convexity.md). 

In addition, we take the sum rule for regular subgradient (See [Regular Subgradient](Non-Smooth%20Calculus/Subgradient%20Intro.md)) for more and, it gives: 

$$
\begin{aligned}
    \hat \partial[f + q/2\Vert \cdot\Vert^2](x) 
    &= 
    \hat \partial f(x) + x. 
\end{aligned}
$$

One final missing ingredient is the equivalence between the regular subgradient and the limiting subgradient for Locally Lipschitz functions. 




---
### **Basic characterizations on weakly convex functions**


#### **Theorem | weak convexity equivalences**
> Let $F$ be a $q$ weakly convex function. 
> Then the following conditions are all equivalent. 