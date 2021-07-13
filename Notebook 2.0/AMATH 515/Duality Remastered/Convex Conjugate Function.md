
Definition, conjugacy, interpretations and useful properties. 

---
### **Intro**

This file seeks to explain and explore further about the idea of convex conjugate. The concept first appears here: 


---
### **Fenchel Conjugate**

It's also called the Fenchel Legendre Transform.

**Definition**

Let $f(x): \mathbb{R}^n \mapsto \mathbb{R} \cup \{-\infty, \infty\}$, then the Fenchel Conjugate is defined to be: 

$$
f^*(y) = \sup_{x \in E} \left\lbrace
    y^Tx - f(x)
\right\rbrace
$$

#### **Conjugate Epigraph contains all Affine Minorants of the Original Function**

Let: 

$$
(y, z) \in \underset{r}{\text{epi}}(f)
$$

By definition: 

$$
z \ge f(y) \ge y^Tx - f(x) \implies f(x) \ge y^Tx - z \quad \forall  x
$$

If I have any inputs for the conjugate function： $y$, then: $f(x)\ge y^Tx - f^*(y)$, which, tells me the offset to compare with the conjugate function. 

**Note**: This is applicable even when the function is not convex. 

#### **Conjugate is the Support function of Epi f**

Define: Support Function. 

Support function is defined on a convex set. 

Define the convex indicator here: 
$$
\delta_Q(x) := \begin{cases}
    0 & x \in Q
    \\
    +\infty  &x \not\in Q    
\end{cases}
$$

Then the support function of the set is: 

$$
S_q(v) = \delta^*_Q(v) = \max_{x\in Q} \{v^Tx\}
$$

Note, the support function of a convex set is the convex conjugate of the indicator function. 

**Support function**: I have a vector, I want to find another vector that is in the convex set such that it aligns the best with the given vector, and the vector is provided by the support function. 

> The conjugate of a function is the support function of the epigraph of the function. 

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

In the epigraph of function $f$, how do I choose a vector in the epigraph such that it maximizes the dot product with the vector that points straight down? 

---
### **Geometric Interpretations**

![[fenchel_transform_interpretations.png.png]]

The dual variable is the slope of the tangent line and the value of the function is the negative of the y intersect (or whatever intersect on the higher dimension). 

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

**Note**: Equality is true when the function is convex, because a convex set can be reconstructed by all the half spaces (The Affine Minorants). 





---
### **Fenchel's Identity**

> Fenchel's Identity is useful because it links the dual and primal variable, and can be exploited for dualization of problems. 

Assume: **f is closed and convex**, by definition of convex conjugate: 


$$
\begin{aligned}
    f^*(z) &= \sup_x \{z^Tx - f(x)\} \ge z^Ty - f(y) \quad \forall y
    \\ \underset{[1]}{\implies}
    z^Tx - f(x) &\ge  z^Ty - f(y) \quad \forall y
    \\ \underset{[2]}{\implies}
    f(y) &\ge  z^T(y - x) + f(x) \quad \forall y
    \\ \underset{[3]}{\implies}
    z &\in \partial f(x)
\end{aligned}

$$

\[1\]: $x$ is fixed by the sup. 

\[2\]: to 3: Just algebra.

\[3\]: By the definition of Sub gradient, the Cauchy Sub-gradient inequality. 

**Claim 1**
> $$
> z \in \partial f(x) \tag{1}
> $$
> The dual variable is in the sub gradient of the original function. (Make sense geometrically), The argument is reversible, which means that: 
> $$
> f^*(z) = \sup_x \{z^Tx - f(x)\} \iff z \in \partial f(x) \quad \text{f is closed and convex}
> $$

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
> z\in \partial f(x) \iff x \in \partial f^*(z) \tag{2}
> $$
> Given dual, primal variable $x, z$, they are in the subgradient of each of their objective function, $f, f^*$. 