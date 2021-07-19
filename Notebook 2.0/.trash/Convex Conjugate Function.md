[[Duality Preparation]]

---
### **Intro**

This file seeks to explain and explore further about the idea of convex conjugate. The concept first appears here: 

[[Duality Preparation#Convex Conjugate]]


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
#### **Fenchel's Conjugate Properties**

Double Conjugate making it Smaller.

$$
f^{**}(x) \le f(x)
$$



---
### **Fenchel's Identity**




