Definition, conjugacy, interpretations and useful properties. 
Might need this [[Convex Conjugate (Examples Pack)]] for some of the advanced interpretations of the concept. 

---
### **Intro**

This file seeks to explain and explore further about the idea of convex conjugate. The concept first appears here: 


---
### **Fenchel Conjugate**

It's also called the Fenchel Legendre Transform.

**Definition**

> Let $f(x): \mathbb{R}^n \mapsto \mathbb{R} \cup \{-\infty, \infty\}$, then the Fenchel Conjugate is defined to be: 
> $$
> f^*(y) = \sup_{x \in E} \left\lbrace
>     y^Tx - f(x)
> \right\rbrace
> $$

#### **Conjugate Epigraph contains all Affine Minorants of the Original Function**

Let: 

$$
(y, z) \in \underset{r}{\text{epi}}(f)
$$

By definition: 

$$
r \ge z \ge f^*(y) \ge y^Tx - f(x) \implies f(x) \ge y^Tx - z \quad \forall  x
$$

If I have any inputs for the conjugate function： $y$, then: $f(x)\ge y^Tx - f^*(y)$, which, tells me the offset to compare with the conjugate function. 

**Note**: This is applicable even when the function is not convex, and equality will be satisfied. 



**Claim:**

> The support function over the epigraph of function $f$ is the conjugate function $f^*$, but in a high dimension. 

Define the convex indicator here: 
$$
\delta_Q(x) := \begin{cases}
    0 & x \in Q
    \\
    +\infty  &x \not\in Q    
\end{cases}
$$

**Define the Support function**

> $$
> S_Q(v) = \delta^*_Q(v) = \max_{x\in Q} \{v^Tx\}
> $$
> **Support function**: The conjugate of an indicator function over a convex set $Q$. 



$$
f^*(y) = \sup_{x}\left\lbrace
    \begin{bmatrix}
        -1 \\ y
    \end{bmatrix}^T
    \begin{bmatrix}
        f(x) \\ x
    \end{bmatrix}
\right\rbrace
    = 
    \sup_{(x, r)\in \text{epi}(f)} \left\lbrace
        \begin{bmatrix}
            -1 \\ y
        \end{bmatrix}^T
        \begin{bmatrix}
            f(x) \\ r
        \end{bmatrix}
    \right\rbrace
    =
    \delta^*_{\text{epi}(f)}
    \left(
        \begin{bmatrix}
        -1 \\ y
    \end{bmatrix}
    \right)
$$

**Moral of the Story**: 

If I take the Fenchel Transformn on both side of the above equation, then I get back the original function $f$.


---
### **Geometric Interpretations**

![[fenchel_transform_interpretations.png.png]]

> The dual variable is the slope of the tangent line and the value of the function is the negative of the y intersect (or whatever intersect on the higher dimension). 

**Observe** 

Given $z$ the dual varible, representing the slope of the line I want to "touch" the function $f$, then $f^*(z)$ gives me exactly the negative y intersect I need to move my line $z^Tx$ to touch $f$, at the point $x$, the dual variable. 




---
### **Fenchel's Conjugate Properties**

Double Conjugate making it Smaller.

> $$
> f^{**}(x) \le f(x)
> $$

Such a claim make sense geometrically, a convex envelop is reconstructed using the conjugate of the original function, and it will always be smaller in quantity. 

**Proof**

$$
\begin{aligned}
    f^{**}(z) = \sup_x \left\lbrace 
    z^Tx - f^*(x)
    \right\rbrace
    & =
    \sup_x \left\lbrace 
        z^Tx - \sup_{y} \left\lbrace
            z^Ty - f(y)
        \right\rbrace
    \right\rbrace 
    \\\underset{[1]}{\implies}
    \sup_x \left\lbrace 
    \inf_{y} \left\lbrace
       z^T(x - y) + f(y)
    \right\rbrace
    \right\rbrace
    &\le \inf_y
    \left\lbrace
        \sup_x \left\lbrace 
            z^T(x - y) + f(y)
        \right\rbrace
    \right\rbrace
\end{aligned}
$$

\[1\]:  Using Minmax, Maxmin Lemma, introduced in [[MinMax MaxMin Lemma]]

**Note**: 
> Equality is true when the function is convex, because a convex set can be reconstructed by all the half spaces (The Affine Minorants). 



---
### **Fenchel's Identity**

> Fenchel's Identity is useful because it links the dual and primal variable, and can be exploited for dualization of problems. 


**Claim 1**
> The dual variable is in the sub gradient of the original function. (Make sense geometrically), The argument is reversible, which means that: 
> $$
> z \in \partial f(x) \tag{1}
> $$
> $$
> f^*(z) = \sup_x \{z^Tx - f(x)\} \iff z \in \partial f(x) \quad \text{f is closed and convex}
> $$

**Proof**: 

Assume: **f is closed and convex**, by definition of convex conjugate: 

$$
\begin{aligned}
    f^*(z) &= \sup_x \{z^Tx - f(x)\} \ge z^Ty - f(y) \quad \forall y
    \\ \underset{[1]}{\implies}
    z^Tx^+ - f(x^+) &\ge  z^Ty - f(y) \quad \forall y
    \\ \underset{[2]}{\implies}
    f(y) &\ge  z^T(y - x) + f(x^+) \quad \forall y
    \\ \underset{[3]}{\implies}
    z &\in \partial f(x^+)
\end{aligned}

$$

\[1\]: $x^+$ is fixed by the sup, it solves the supreme operator.  

\[2\]: to 3: Just algebra.

\[3\]: By the definition of Sub gradient, the Cauchy Sub-gradient inequality. 



Suppose $x^{+} = \arg\sup_x\{z^Tx - f(x)\}$, then 

$$
\begin{aligned}
    \underset{(1)}{\implies} f^*(z) + f(x^+) &= z^Tx^+
    \\
    \underset{[1]}{\implies} f^{**}(z) + f^{*}(x^+) &= z^Tx^+
    \\ \underset{f \text{ convex}}{\implies}
    f(z) + f^{*}(x^+) &= z^Tx^+
\end{aligned}
$$


Notice that, this time, $z, x$ swapped, and we have $f^*(x)$ instead of $f(x)$. Go through the same proof for (1) but with $f(x)$ as $f^{**}(x)$, then we will have:

**Claim 2**
> $$
> z\in \partial f(x^+) \iff x^+ \in \partial f^*(z) \tag{2}
> $$
> Given dual, primal variable $x, z$, they are in the subgradient of each of their objective function, $f, f^*$. 