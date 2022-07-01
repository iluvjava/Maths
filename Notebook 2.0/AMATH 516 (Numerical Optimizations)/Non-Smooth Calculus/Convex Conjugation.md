* [[Characterizing Functions for Optimizations]]
* [[Support Function]]

---
### **Intro**


Convex conjugate is fenchel conjugate, It's also called the Fenchel Legendre Transform. The below information is from the internet and the AMATH 515 class I took. 

**Definition**

> Let $f(x): \mathbb{R}^n \mapsto \mathbb{R} \cup \{-\infty, \infty\}$, then the Fenchel Conjugate is defined to be: 
> $$
> f^\star(y) = \sup_{x \in E} \left\lbrace
>     y^Tx - f(x)
> \right\rbrace
> $$

---
### **Conjugate Epigraph Contains all Affine Minorants of the Original Function**

$\forall (y, z) \in {\text{epi}}(f^\star)$ and we assume $f$ is proper, and by definition: 

$$ 
	z \ge f^\star(y) \ge y^Tx - f(x) \implies f(x) \ge y^Tx - z \;\forall x 
$$

Please observe that the vector from $\text{epi}(f)$ is a supporting affine minor of the original function $f(x)$. The relation between original and conjugate function can be expressed as: $f(x)\ge y^Tx - f^\star(y)$. This is refers to as the *Cauchy Subgradient inequality* or *fenchel inequality*. 

**Remarks**

The conjugate function $f^\star(x)$'s epigraph provides the least offset of the affine functions that is below the functon $f$, given the slope of the affine function. 


**Example: The Support Function on the Indicator of the Epigraph of $f$**

> The support function over the epigraph of function $f$ is the conjugate function $f^*$, but in a high dimension. To quantify the epigraph, Define the convex indicator over the epigraph: 

$$
\delta_Q(x) := \begin{cases}
    0 & x \in Q
    \\
    +\infty  &x \not\in Q    
\end{cases}
$$

Recall the definition from the support functions and consider: 

$$
\begin{aligned}
    f^\star(x) &= \sup_y\{\langle y, x\rangle - f(y)\}
    \\
    &= \sup_{y} \left\lbrace
        \left\langle 
            \begin{bmatrix}
                y\\ f(y)
            \end{bmatrix}
            , 
            \begin{bmatrix}
                x \\ -1
            \end{bmatrix}
        \right\rangle
    \right\rbrace
    \\
    &= 
    \sup_{z\in \text{epi}(f)}
    \left\lbrace
        \left\langle 
            z, 
            \begin{bmatrix}
                x 
                \\
                -1
            \end{bmatrix}
        \right\rangle
    \right\rbrace
    \\
    &= 
    \delta^\star_{\text{epi}(f)}\left(
        \begin{bmatrix}
            x \\ - 1
        \end{bmatrix}
    \right)
\end{aligned}
$$

From the first line the the second line, we make the intuitive assumption that the finite value for supremum is always attain at the boundary of the epigraph, then using that we construct $z = [y \;f(y)]^T$ to denote it. And finally we arrive at the fact that, the conjugate function is the suppotr function for $\text{epi}(f)$, along the vector $[x\; - 1]^T$. 

---
### **Geometric Interpretations**

![[fenchel_transform_interpretations.png.png]]

> The dual variable is the slope of the tangent line and the value of the function is the negative of the y intersect (or whatever intersect on the higher dimension). 

**Observe** 

Given $z$ the dual varible, representing the slope of the line I want to "touch" the function $f$, then $f^*(z)$ gives me exactly the negative y intersect I need to move my line $z^Tx$ to touch $f$, at the point $x$, the dual variable. 




---
### **Bi-Conjugation**

**Theorem Statement**

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

**Theorem Statement**
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


---
### **Examples**

For more examples regarding the convex conjugate of functions, see [[Convex Conjugate Examples]] for more information. 