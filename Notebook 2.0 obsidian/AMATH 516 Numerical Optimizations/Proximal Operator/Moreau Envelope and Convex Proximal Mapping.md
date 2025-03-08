---
alias: Morau Envelope and Convex Proximal Operators

--- 
- [Multivalued Functions, Set-valued Mappings](../Operators%20Theory/Multivalued%20Functions,%20Set-valued%20Mappings.md)

---
### **Intro**

We will focus on when the function $f$ is closed convex, proper, and $\Vert \cdot\Vert$ is the Euclidean norm. 
That makes the properties of the prox more predictable. 
We can derive more theorems. 
A Moreau Envelope $\text{env}_{\alpha, f}(x)$, $\text{prox}_{\alpha, f}$ the proximal operator are defined for some function $f$: 

$$
\begin{aligned}
    & \text{env}_f^\alpha(x) := \min_{y}\left\lbrace
        f(y) + \frac{1}{2 \alpha }\Vert y - x\Vert^2
    \right\rbrace, 
    \\
    & \text{prox}_{\alpha f}(x) := 
    \arg\min_{y}\left\lbrace
        f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2
    \right\rbrace. 
\end{aligned}
$$

The proximal operator is a singleton when the function $f$ is convex, proper, and closed. 
Observe that $\text{env}_{\alpha, f}(x) = (f\square \frac{1}{2\alpha}\Vert \cdot \Vert^2)(x)$, which by ([Convexity Preserving Operations for Functions](../CVX%20Geometry/Convexity%20Preserving%20Operations%20for%20Functions.md)) the epigraph of the envelope is the set addition between the epigraph of those two functions and it inherits properties of them. 


**Notation nuance**

When we write $\text{prox}_{\alpha f}$, it is the same as $\text{prox}_{f, \alpha}$. 
The second type of proximal operator has a constant indicated explicitly on the under script. 

**Remarks**

It's from Dimitry's Textbook, definition 3.59, pg 77. 
If the infimal convolution is the epigraphical addition of 2 functions, then a Moreau envelope smooths the function using the parameter $\alpha$. 
For example, the Moreau Envelope of the absolute value $|x|$ is given as: 

$$
\begin{aligned}
   \text{env}_{\alpha, f}(x) = \begin{cases}
        \frac{1}{2 \alpha}|x|^2 & \text{if } |x|\le \alpha, 
        \\
        |x| - \frac{1}{2}\alpha & \text{otherwise}.
   \end{cases}
\end{aligned}
$$

Which is the Huber Loss function in statistics. 

**Dimitri's Comments**:
> The Moreau envelope is a generalization of the set distance squared operations on sets. 
> See [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md) for more. 
> In fact their share similarities when the function $f$ is convex, closed and proper. 
> More specifically, prox with a parameter of $1$ gives Lipschitz continuous function with a Lipschitz constant of $L=1$. 

#### **Theorem 0.1 | Basic Prox Identities**

> With $f$ Convex closed and proper, $\alpha > 0$. These identities transform the parameters of the prox/env operator. 
> 
> $$
> \begin{aligned}
>     & \text{prox}_{\alpha f} =  \text{prox}_{f, \alpha}
>     \\
>     & \lambda\text{env}_f^\mu = 
>     \text{env}_{\lambda f}^{\mu/\lambda}
>     \\
>     &\text{env}_f^\mu(x + y) = \text{env}_{f(x + (\cdot))}^\mu(y)
>     \\
>     & \text{prox}_{f}(\alpha f) = \alpha \left(\underset{\alpha^{-2}f(\alpha(\cdot))}{\text{prox}}(x)\right)
>     \\
>     & \text{prox}_{\alpha f}(x) = \sqrt{\alpha}\left(\underset{f(\sqrt{\alpha}(\cdot))}{\text{prox}}
>     \left(x / \sqrt{\alpha}\right)\right). 
> \end{aligned}
> $$
> For notational simplicity, $\text{prox}_{f,1}$ is the same as $\text{prox}_{f}$, the same applies for envelope. 

**Proof**

See the Exercise below. 

**Exercise**

See above. 


#### **Lemma | Moreau Envelope as conjugate**
> Let $f: \R^n \rightarrow \overline \R$ then the Moreau Envelope $\env_f^{\lambda}$ has for all $\lambda > 0$, $x \in \R^n$ the equality: 
> $$
> \begin{aligned}
>     \env_f^\lambda(x) 
>     = 
>     \frac{1}{2\lambda}\Vert x\Vert^2
>     -
>     \lambda^{-1}
>     \left[
>         \lambda f(z) + \frac{1}{2}\Vert \cdot\Vert^2
>     \right]^\star(x). 
> \end{aligned}
> $$


**Proof**
$$
\begin{aligned}
    \env_f^\lambda(x) &= \min_{z \in \R^n}\left\lbrace
        f(z) + \frac{1}{2\lambda}\Vert x - z\Vert^2
    \right\rbrace
    \\
    &= \lambda^{-1}\min_{z \in \R^n}\left\lbrace
        \lambda f(z) + \frac{1}{2}\Vert x - z\Vert^2
    \right\rbrace
    \\
    &= \lambda^{-1}\left(
        \min_{z \in \R^n}
        \left\lbrace
            \lambda f(z) + \frac{1}{2}\Vert z\Vert^2 - \langle z, x\rangle
        \right\rbrace
        + \frac{1}{2}\Vert x\Vert^2
    \right)
    \\
    &=
    \frac{1}{2\lambda}\Vert x\Vert^2
    -
    \lambda^{-1}
    \left[
        \lambda f(z) + \frac{1}{2}\Vert \cdot\Vert^2
    \right]^\star(x). 
\end{aligned}
$$

**Remarks**

The convex conjugate function is always convex. 
The Squared norm is also convex. 
The function may be nonconvex but it's a difference between two convex functions. 



---
### **As Operators**

Proximal operators has good properties under the convex setting.
Let's derive some using knowledge from convex analysis. 

#### **Theorem 1 | Proximal mapping is a singled valued Resolvent of subgradient**
> Let $f$ be convex, closed and proper. Let $\alpha > 0$. 
> Then it has the following consequences: 
> 1. $\text{prox}_{\alpha, f}$ is the resolvent operator of the subgradient: $(I + \alpha \partial f)^{-1}$. 
> 2. It is a single valued operator. 

**Proof**: 

The proximal operator has unique minimizer when $f$ is convex because $\alpha f(\cdot) + \Vert \cdot - y\Vert$ is strongly convex (See [Strong Convexity](../Properties%20of%20Functions/Strong%20Convexity.md) for more). 
Let $y^+$ be the minimizer then using Subgradient Sum rule between a smooth and non-smooth function (See [Subgradient Sum Rule](../Non-Smooth%20Calculus/Subgradient%20Sum%20Rule.md)): 

$$
\begin{aligned}
    \mathbf 0 &\in \partial\left[
        \left.
            f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2 
        \right| y
    \right](y^+)
    \\
    \mathbf 0 &\in \partial f(y^+) + \frac{1}{\alpha}(y^+ - x)
    \\
    \frac{x}{\alpha} &\in 
    (\partial f + \alpha^{-1}I)(y^+)
    \\
    x &\in 
    (\alpha \partial f + I)(y^+)
    \\
    y &\in (\alpha\partial f+ I)^{-1}(x).
\end{aligned}
$$

Therefore, we can view the proximal gradient operator as the resolvent of the subgradient operator $\alpha \partial f$. 
$\blacksquare$

**Remarks**

**Convexity is not necessary for the single valued Property**. 
$f$ being closed convex and proper is sufficient but unnecessary for the proximal map to be single-valued.
In Dima's paper [\<The Proximal Point Method Revisited\>](https://sites.math.washington.edu/~ddrusv/proxpoint_arxiv.pdf), 
he mentioned that the proximal operator on $\alpha$ weakly convex function ($f$ is $a$ weakly convex when $f + \frac{\alpha}{2}\Vert x \Vert$ is a convex function), which will also result in the proximal operator being a singled value operator. 


**It is a maximal monotone operator.** 
* The subgradient operator of a closed convex and proper(CCP) function has $\partial f$ as a maximal monotone operator. 
Therefore, $x,y \in \text{gph}(\partial f)$, we have $(\bar x - x, \bar y - y)\ge 0 \implies  (\bar x, \bar y)\in \text{gph}(\partial f)$. 
Consequently, $I + \partial f$ is single-valued and subjective, so the inverse $(I +\partial f)^{-1}$ is a singled-value operator. 
For all $\alpha>0$, it's the same.
* **The Surjectivity Theorem**, [Minty's Theorem, The Surjectivity Theorem](../Operators%20Theory/Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md). The surjectivity theorem states, $T$ is maximal monotone iff $I + T$ is surjective. This is theorem 3.79 in Dima's work, and the proof is shown in 3.8.3.. 


#### **Theorem 2 | Equivalence Characterization for Proximal Point** 
> For a convex proper, lower semi-continuous function $f$, let $x\in \text{dom} f$, and $y\in X$, then the following are equivalent: 
> 1. $x = \text{prox}_f(y)$, 
> 2. $y - x\in \partial f(x)$,
> 3. $\forall z \in X, x \in \text{prox}_f(y): \langle z - x, y - x\rangle \le f(z) - f(x)$, this is the generalized obtuse angle theorem for the proximal operator. 

**Proof**

**Prove (1) $\iff$ (2)**. For all $x\in \text{prox}_f(y)$, it has: 

$$
\begin{aligned}
    x &\in \text{prox}_f(y)
    \\
    \mathbf 0 &\in 
    \partial f(x) + \{x - y\} \quad \textcolor{gray}{\triangleright \text{Subgradient addition rule, Prox def. }}
    \\
    y - x &\in \partial f(x)
\end{aligned}
$$

observe that one may use the singleton assumption with prox and provide us with the identity $y - \text{prox}_f(y) \in \partial f(\text{prox}_f(y))$. 

**Proof of (2) $\implies$ (3)**. 
By the assumption of convexity on $f$, we can use the subgradient inequality on $y - x \in \partial f(x)$ which gives $\forall z \in X$: 

$$
\begin{aligned}
    0 &\le
    f(z) - f(x) - \langle \partial f(x),\; 
    z - x\rangle
    \\
    &=
    f(z) - f(x) - \langle y - x, z - x\rangle. 
\end{aligned}
$$

Since this is true for all $z$, $y - x \in \partial f$.
Hence  **(2) $\impliedby$ (3)** as well. 

**Remarks**

The second property is pivotal to understanding the proximal gradient operator.
Recall that from [Proximal Point Method, Interpretations](../Proximal%20Methods/Proximal%20Point%20Method,%20Interpretations.md), we can interpret the proximal operator as a Backward Euler scheme. 
Which is just another word for [Resolvent Operators](Resolvent%20Operators.md) of the subgradient operator. 
The second condition, $y - x \in \partial f(x)$, states that, given any point $y$, the point $x$, is a point where the vector $y - x$ points along the set of directions indicated subgradient. 
The second condition mirrors the backward Euler method. 
The third condition results in $y - x \in \partial f(x)$, with the additional convexity assumption placed on $f$, and the third condition becomes the subgradient inequality.
I don't have a good interpretation yet. 
For condition 3, observe that with $y = z$, it gives $\Vert z - x\Vert^2 \le f(z) - f(x), x = \underset{f}{\text{prox}}(z)$. 

Conditions 3, works for lsc continuous function in Hilbert spaces, see Heinz's monotone book proposition 12.26. 

**Good References**

* Dimitry's class from UW. 
* [This](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf) survey paper from Stanford, it also contains more practical information about the prox operator. 
* \<First Order Methods for Optimizations\> by Beck. This book has detailed summarizations for the properties of proximal gradient. 


---
### **Prox is L1-Lipschitz under 2-Norm, and Firmly Non-expansive**

The Proximal operator can be understood as the special case of the set projection. 
It retains one of the properties of a set projection as well. 
A set projection onto a convex set is a L1 Lipschitz mapping. 
The proximal operator is also a L1 Lipschitz mapping for closed convex proper (CCP) functions. 

#### **Thm 2.1 | The Proximal operator is Firmly Non-Expansive**
> Let $f:\mathbb E \mapsto \mathbb{\bar R}$ be a closed, convex proper. 
> Then $\text{prox}_f(x)$ with $\alpha= 1$ is a singleton valued mapping for all $x\in \mathbb E$. 
> In addition, for any points $x, y\in \mathbb E$, it is firmly non-expensive and it has: 
> $$
> \begin{aligned}
>     \Vert \text{prox}_f(x) - \text{prox}_f(y)\Vert^2 \le 
>     \langle \text{prox}_f(x) - \text{prox}_f(y), x - y\rangle. 
> \end{aligned}
> $$

**Observations**

Using Cauchy inequality, it's Lipschitz continuous with a constant of 1.
The proximal operator is certainly continuous too. 

**Proof**

Denote $P_f(x)$ for the proximal operator for $f$ at $x$. 
For all $x$, it has unique $x^+\in P_f(x)$, $y^+\in P_f(y)$, by $P_f$ is single valued by Theorem 1 when $F$ is convex. 
We use the quadratic growth condition from [Strong Convexity](../Properties%20of%20Functions/Strong%20Convexity.md) on $x\mapsto f(x) + \Vert x - z\Vert^2$ for all $z$ at $x^+, y^+$ because it is $1$-strongly convex and it gives: 

$$
\begin{aligned}
    0 &\le 
    f(y^+) + \frac{1}{2}\Vert y^+ - x\Vert^2
    - \left(
            f(x^+)
            + \frac{1}{2}\Vert x^+ - x\Vert^2
    \right) - \frac{1}{2}\Vert y^+ - x^+\Vert^2
    \\
    &= 
    \left(
        f(y^+) + \frac{1}{2}\Vert y^+ - y\Vert^2
    \right)
    + \frac{1}{2}\Vert y^+ - x\Vert^2
    - \frac{1}{2}\Vert y^+ - y\Vert^2
    - 
    f(x^+)
    - \frac{1}{2}\Vert x^+ - x\Vert^2
    - \frac{1}{2}\Vert y^+ - x^+\Vert^2
    \\
    &\le 
    \left(
        f(x^+) + \frac{1}{2}\Vert x^+ - y\Vert^2
        - \frac{1}{2}\Vert x^+ - y^+\Vert^2
    \right)
    \\
    & \quad
        + \frac{1}{2}\Vert y^+ - x\Vert^2
        - \frac{1}{2}\Vert y^+ - y\Vert^2
        - f(x^+)
        - \frac{1}{2}\Vert x^+ - x\Vert^2
        - \frac{1}{2}\Vert y^+ - x^+\Vert^2
    \\
    &= 
    \left(
        \frac{1}{2}\Vert x^+ - y\Vert^2
        + \frac{1}{2}\Vert y^+ - x\Vert^2
        - \frac{1}{2}\Vert y^+ - y\Vert^2
        - \frac{1}{2}\Vert x^+ - x\Vert^2
    \right)
    - \Vert y^+ - x^+\Vert^2
    \\
    &= \langle x^+ - y^+, y - x\rangle 
    - \Vert y^+ - x^+\Vert^2. 
\end{aligned}
$$

On the last equality we used one of the lemmas from [Equalities, Inequalities of Euclidean Space](../Background/Equalities,%20Inequalities%20of%20Euclidean%20Space.md). 
The final inequality is the claim that proximal operator is firmly-nonexpensive. 

$\blacksquare$


**Remarks**

If $\alpha$ is not necessarily 1, we consider: $\text{prox}_{f, \alpha}(x) = \text{prox}_{f/\alpha, 1}(x)$.
See [Convex Conjugation Introduction](../Duality/Convex%20Conjugation%20Introduction.md) for information on convex conjugate formulas. 

The prox is firmly nonexpansive for any convex proper functions, for any parameter $\alpha > 0$.
Read [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md) for more convex on Firmly Nonexpansive operators in general. 
Proximal operator is a Resolvent operator of subgradient, in a more general context, firmly nonexpansiveness holds for resolvent operators in general, visits [Resolvent Operators](../Operators%20Theory/Resolvent%20Operators.md) for more information. 

If the function is strongly convex, then the proximal operator becomes a contraction. 
Visit [Appearances of Contraction Operators in Optimizations Method](../Operators%20Theory/Appearances%20of%20Contraction%20Operators%20in%20Optimizations%20Method.md) for more information. 


#### **Corollary 2.2 | The gradient of Moreau Envelope is Firmly Nonexpansive**
> Consider the previous fact that the gradient, $\nabla \text{env}_{f, \alpha}(x)$ is $\alpha^{-1}(x - \text{prox}_{f, \alpha}(x))$ will be globally Lipschitz with constant $\alpha^{-1}$, therefore, $\text{env}_{f, \alpha}(x)$ is smooth with $\beta = \alpha^{-1}$, where $\alpha$ is subscripted under the envelope. 

**References**: 

Dimitri's AMATH 516, UW. Somewhere in the course notes I forgot where is where. 


---
### **Proximal Decomposition and Minty Parameterization**

The prox of the conjugate is related to the prox through the following lemma. 

#### **Lemma 3.1 | When are Subgradient Invertible**
> Let $f:\mathbb E\mapsto \mathbb{\bar R}$ be proper closed and convex and subgradient $\partial f$ is surjective, then $(\partial f)^{-1} = \partial f^\star$. 

**Proof for Lemma**

To show it, we make use of the [Fenchel Identity, Inequality](../Duality/Fenchel%20Identity,%20Inequality.md). 

**Remarks:**

Function $\exp(x)$ doesn't have a surjective subgradient mapping. 
Hence, the domain of its subgradient is also not entire. 
The theorem here is not applicable for all values of $x$ outside the domain of the subgradient of the conjugate or outside the range of the range of the subgradient.
Global strict convexity and coerciveness are the sufficient conditions for an invertible subgradient operator using the dual subgradient; the subgradient of these functions is surjective. 
For more information, see [Simply Legendre Type](../Simply%20Legendre%20Type.md). 


**References:**

Proposition 11.3 in Rockafellar. 

#### **Theorem 3.2 | Proximal Decomposition** 

> Consider $f:\mathbb E \mapsto \mathbb{\bar R}$, where $f$ is a CCP (closed convex proper) functions, then: 
> $$
> \begin{aligned}
>   x = \text{prox}_{f}(x) + \text{prox}_{f^{\star}}(x)
> \end{aligned}
> $$

**Proof**
$$
\begin{aligned}
    & z = \text{prox}_f(x) 
    \\
    \iff &
    x - z \in \partial f(z) & [1]
    \\
    \iff &
    \partial f^\star(x - z) \ni z & [2]
    \\
    \iff & 
    \mathbf 0 \in \partial f^\star(x - z) - z 
    \\
    \iff & 
    \mathbf 0 \in \partial f^\star(x - z)  + (x - z - x)
    \\
    \iff & 
    \mathbf 0 \in \partial \left[
        f^\star(\cdot) + \frac{1}{2}\Vert \cdot - x \Vert^2
    \right](x - z) & [3]
    \\
    \iff & 
    x - z \in \text{prox}_{f^\star}(x)
    \iff 
    x - z = \text{prox}_{f^\star}(x) & [4]
\end{aligned}
$$

* \[1\]: By using the second equivalence property that characterize the proximal point. 
* \[2\]: Using the Fenchel Identity, see [Fenchel Identity, Inequality](../Duality/Fenchel%20Identity,%20Inequality.md), also read the lemma at the start of the section. 
* \[3\]: Using the subgradient sum rule, $\iff$ is there for because we can use the strong sum rule in this case, due to the fact that the inner product is entire on its domain. 
* \[4\]: When $f$ is convex proper and closed, the proximal operator is singled valued. 

$$
\begin{aligned}
    x &= \text{prox}_{\lambda f}(x) + \text{prox}_{(\lambda f)^\star}(x)
    \\
    &= \text{prox}_{f\lambda^{-1}}(x) + \text{prox}_{\lambda f^\star(\cdot/\lambda)}(x)
    \\
    &= 
    \text{prox}_{\lambda^{-1}f}(x) + \text{prox}_{\lambda^{-1}f^\star(\cdot /\lambda)}(x), 
\end{aligned}
$$

which is more useful for direct applications. 

**Remarks**

Minty Parameterization: 
  * Moreau Envelope is a special case where the set-valued mapping is the subgradient of the function. In general for a set value mappings $T$ that is maximally monotone, we have the equality: $(I + T^{-1})^{-1} = I - (I + T)^{-1}$ holds, see [Resolvent Identity, Minty Re-Paramaterization](../Operators%20Theory/Resolvent%20Identity,%20Minty%20Re-Paramaterization.md), [Inverse of Subgradient of the Convex Conjugate](../Operators%20Theory/Inverse%20of%20Subgradient%20of%20the%20Convex%20Conjugate.md) for more information. 
  * Please immediately observe that the Moreau Decomposition is a special case of the above formula where $T$ is the subgradient of some CCP functions. 

Moreau Decomposition With the Alpha parameters on Proximal operators: 
  * We use the property that $(\alpha f(x))^\star =\alpha f^\star(z/\alpha)$ and the identity described at the start to simplify the Moreau Decomposition formula. 


---
### **Gradient of Moreau Envelope is Lipschitz for CCP Functions**

#### **Thm 4.0 | Gradient of the Moreau Envelope**
> Let $f: \mathbb E \rightarrow \overline \R$ be a convex, closed function mapping from Euclidean space $\mathbb E$ to augmented real $\overline R$. 
> Then the gradient of Moreau Envelope $\text{env}_f(x)$ exists for all $x \in \mathbb E$ and it's given by 
> $$
> \begin{aligned}
>     \nabla \text{env}_f(x) = x - \prox_{f}(x). 
> \end{aligned}
> $$

**Proof**

Let $f$ be a convex function that is lsc, then the proximal mapping of the function has gradient, meaning that it's differentiable everywhere. We prove it consider: 
$$
\begin{aligned}
    & z\in \partial \text{env}_{f}(x)
    \\
    \iff & z\in \partial \left[
        f(\cdot) \square \frac{1}{2}\Vert \cdot\Vert^2
    \right](x)
    \\
    \iff & x \in \partial \left[
        \left(
            f(\cdot) \square \frac{1}{2}\Vert \cdot \Vert^2
        \right)^\star
    \right](z) \quad 
    \textcolor{gray}{\triangleright \text{ Fenchel Identity}}
    \\
    \iff 
    & x \in \partial \left[
        f^\star + \frac{1}{2}\Vert \cdot \Vert^2
    \right](z)\quad 
    \textcolor{gray}{\triangleright \text{[1]}} 
    \\
    \iff 
    & x\in 
    \partial f^\star(z) + z
    \\
    \iff 
    & \mathbf 0  \in \partial f^\star(z) + z - x
    \\
    \iff 
    & \mathbf 0 \in 
    \partial \left[
        f^\star(\cdot) + \frac{1}{2}\Vert \cdot - x\Vert
    \right](z)
    \\
    \iff
    & z\in \text{prox}_{f^\star}(x)
    \\
    \iff
    & z \in x - \text{prox}_{f}(x) \quad
    \textcolor{gray}{\triangleright \text{[2]}}
\end{aligned}
$$

- At \[1\] we use the conjugate formula for infimal convolution between 2 functions. 
Also, observe that $z$ is unique because $f(\cdot)\square\frac{1}{2}\Vert\cdot\Vert^2$ is a strongly convex function that has a unique minimum to it. 
See [Infimal Convolution and its Properties](../CVX%20Geometry/Infimal%20Convolution%20and%20its%20Properties.md) for more info regarding taking the conjugate of the infimal convolution between 2 functions. 
- At \[2\] we make use of the Moreau decomposition.

Finally, the conjugate $f^\star$ is convex hence, adding a quadratic makes it strongly convex. 
This produces a singleton for the proximal mapping. 
The subgradient is a gradient.
$\square$ 

Additionally, using the fact that proximal mapping is L-1 Lipschitz, the gradient is a Lipschitz mapping. 

**Remarks**

When $f$ is an indicator function for a set, the envelope is the distance to the set squared, which is smooth. 
For example $\delta_{\{\mathbf 0\}}(x)$ has a proximal mapping that is simply $\frac{1}{2}\Vert x\Vert^2$, which is smooth. 
The derivative of the envelope where $\alpha$ presents instead of one, we have $\alpha^{-1}(x - \text{prox}_{\alpha f}(x))$. 
It's the same proof but slightly enhanced. 
We demonstrate below

$$
\begin{aligned}
    z &\in \partial [\text{env}^\alpha_f](x)
    \\
    z & \in 
    \partial \left[
        f(\cdot) \square \frac{1}{2\alpha}\Vert \cdot\Vert^2
    \right](x)
    \\
    x &\in \partial \left[\left(
        f(\cdot) \square \frac{1}{2\alpha}\Vert \cdot\Vert^2
    \right)^\star\;\right](z)
    \\
    x &\in \partial \left[
        f^\star + \alpha^{-1}\left(\frac{1}{2}\Vert \alpha(\cdot)\Vert^2\right)
    \right](z)
    \\
    x &\in \partial f^\star + \alpha z
    \\
    \mathbf 0 
    &\in \partial f^\star(z) + \alpha z - x
    \\
    \mathbf 0 &\in 
    \alpha^{-1}f^\star(z) + z - \alpha^{-1}x
    \\
    \mathbf 0 &\in \partial \left[
        \alpha^{-1}f^\star(\cdot) + \frac{1}{2}\Vert (\cdot) - \alpha^{-1}x\Vert^2
    \right](z)
    \\
    z & \in 
    \text{prox}_{\alpha^{-1}f^\star} (\alpha^{-1} x) = \alpha^{-1} \text{prox}_{\alpha f^\star(\alpha(\cdot))}(x) = \alpha^{-1} \text{prox}_{(\alpha f)^\star}(x). 
    \\
    &\quad  \textcolor{gray}{\triangleright\text{first equality is prox identity}}
    \\
    &\quad \textcolor{gray}{\triangleright \text{[1]}}
\end{aligned}
$$

\[1\]: We made use of a formula from [Convex Conjugate Computations Examples](../Duality/Convex%20Conjugate%20Computations%20Examples.md). With prox decomposition, we have the final result of $\alpha^{-1}(x - \text{prox}_{\alpha f}(x))$
 

---
### **Quick Formulas for the Proximal Operators**

Here is a list of helpful formulas for the proximal operator. 
We stated without proof.
We referenced a survey paper on Stanford and Amir Beck's textbook. 

**Post Composition**

> Let $f(x) = \alpha \varphi(x) + b$ be closed and convex then, with $\alpha > 0$ to keep things convex then we have: 
> 
> $$
> \begin{aligned}
>     \text{prox}_{\lambda, f}(v) 
>     = 
>     \text{prox}_{\alpha\lambda, \varphi}(v). 
> \end{aligned}
> $$


**Precomposition**

> if $f(x) = \varphi(\alpha x + b)$ with $\alpha \neq 0$, then we have
> $$
> \begin{aligned}
>     \text{prox}_{\lambda, f}(v)
>     = 
>     \frac{1}{\alpha} (
>         \text{prox}_{\alpha^2\lambda, \varphi}
>         (\alpha v + b) - b
>     ). 
> \end{aligned}
> $$



**Unitary Composition**

> And in the spacial case where $Q$ is an orthogonal matrix, let's assume that $f(x) = \varphi(Qx)$: 
> 
> $$
> \begin{aligned}
>     \text{prox}_{\lambda, f}(v) = Q^T \text{prox}_{\lambda, \varphi}(Qv). 
> \end{aligned}
> $$

**References**: 

Amir Beck, Theorem 6.15 (Composition with Affine Mapping)


**Affine Addition**

> Let $f(x) = \varphi(x) + \langle a, x\rangle + b$ then: 
> 
> $$
> \begin{aligned}
>     \text{prox}_{\lambda, f}(v) = 
>     \text{prox}_{\lambda, \varphi}(v - \lambda a). 
> \end{aligned}
> $$

**Regularizations**

> Let $f(x) = \varphi(x) + \frac{\rho}{2}\Vert x - a\Vert^2$, then 
> 
> $$
> \begin{aligned}
>     \text{prox}_{\lambda, f} (v)
>     = 
>     \text{prox}_{\tilde\lambda\varphi}
>     \left(
>         \frac{\tilde \lambda v}{\lambda}
>         + 
>         \rho \tilde\lambda a
>     \right).
> \end{aligned}
> $$
> where $\tilde\lambda = \lambda/(1 + \lambda \rho)$. 

**Quadratic sums**

> Let $f(x) = g(x) + \sum_{i=1}^{n} \alpha_i\Vert x - y_i\Vert_2^2$. To find, we need to make use of the fact that the minimizer for sum of squared 2-norm is the weighted average of all points $y_i$ where the weight is the multiplier $\alpha_i$ where $\alpha_0 = \lambda^{-1}$. 
> $$
> \begin{aligned}
>     \text{prox}_{\lambda f}(y_0)
>     = 
>     \text{prox}_{\lambda g}\left(
>         \frac{\sum_{i = 0}^{n}\alpha_i y_i}{
>             \sum_{i = 0}^{n}\alpha_i}
>     \right).
> \end{aligned}
> $$

**Proof**

It follows directly from [Minimizer of Quadratic Sum, Weighted Average](../Minimizer%20of%20Quadratic%20Sum,%20Weighted%20Average.md). 

**Parallelization**

> Suppose that function $f(x)$ can be written as the Euclidean cross product $(f_1(x_1), f_2(x_2), \cdots, f_m(x_m))$, and we assume that each of $x_1, x_2, \cdots, x_n$ are vector in $\mathbb R^{k_1}, \mathbb R^{k_2}, \cdots, \mathbb R^{k_m}$ such that $x =\bigoplus_{i=1}^m x_i$,then we can write the proximal gradient operator of $f$ in parallel form which is given as: 
> $$
> \begin{aligned}
>     \text{prox}_{f, \lambda}((x_1, x_2, \cdots, x_m)) = 
>     (\text{prox}_{f_1, \lambda}(x_1), \text{prox}_{f_2, \lambda}(x_2), \cdots \text{prox}_{f_m, \lambda}(x_m)).
> \end{aligned}
> $$
> In general, if there exists any permutation of the list of $x_1, x_2, \cdots, x_m$, the parallelization property of prox will be come applicable. 


#### **Beck's Cheatsheet**
See [Amir's Prox Cheatsheet](../References/Amir's%20Prox%20Cheatsheet.pdf) for a quick reference for more formulas for use for applications. 


---
### **Examples For Proximal Mapping**

We list one example of proximal operators here for demonstration. 
For more examples or how to compute and implement it for optimization algorithms, visit: [Proximal Operators Example Pack](Proximal%20Operators%20Example%20Pack.md). 
For more about the projection onto a convex set, see [Convex Sets Projections and Dist, Intro](../Background/Convex%20Sets%20Projections%20and%20Dist,%20Intro.md), 

**Example | Projection onto Convex Sets**
> Allow $f(x) = \delta_Q(x)$ to be an indicator function of a closed convex set $Q$, then the proximal operator $\text{prox}_{\delta_Q}(x) = \Pi_Q(x)$, which is the projection onto the convex $Q$. 

**Demonstrations**

We invoke the definition and the meaning of this, and then we examine the property of the proximal mapping and envelope from above using this example. 


---
### **Proximal Mapping and Moreau Envelope in the Nonconvex Case**


