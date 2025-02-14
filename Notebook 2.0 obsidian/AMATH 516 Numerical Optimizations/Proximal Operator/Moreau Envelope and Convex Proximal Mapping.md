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
For example, if we assume that the function $f$ is closed, convex, and proper, their infimal convolution is closed, proper, and convex. 
Of course, if $p\in \text{prox}_f(x)$ then 

$$
\begin{aligned}
    \text{env}_f^\alpha(x) = f(p) + \frac{1}{2\alpha}\Vert x - p\Vert^2 \le f(y) + 
    \frac{1}{2\alpha}\Vert x - y\Vert^2 \quad \forall y \in \mathbb R^n
\end{aligned}
$$

setting $y = x$, then the envelope is always below the function. 
Moreover, with $f$ being convex, $f(\cdot) + \frac{1}{2\alpha}\Vert \cdot - x\Vert^2$ is strongly convex, since $f(\cdot) + \frac{1}{2\alpha}\Vert \cdot - x\Vert^2 - \frac{1}{2\alpha}\Vert \cdot - x\Vert^2$ is convex, the strong convexity index is $\alpha^{-1}$, recall that for any strongly convex function $g$ with convexity index $\lambda$ ([Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)), we have 

$$
\begin{aligned}
    g(x) - g(x^*) \ge \frac{\lambda}{2} \; \Vert x - x^*\Vert, x \in \argmin{x} f
    \\
    \implies 
    \left(f(p) + \frac{1}{2\alpha}\Vert x - p\Vert^2\right)
    - 
    \left(
        f(y) + \frac{1}{2\alpha}\Vert x - y\Vert^2 
    \right)
    &\le 
    - \frac{1}{2\alpha}\Vert y - p\Vert^2 
    \quad \forall y \in \R^n, 
\end{aligned}
$$

because, $p$ is a minimizer of $f(\cdot) + (1/(2\alpha ))\Vert \cdot - x\Vert^2$. 
Which is a much weaker conditions compare to descent condition imposed by just the Moreau Envelope. 


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

#### **Theorem 0.2 | Equivalence Characterization for Proximal Point** 
> For a convex proper, lower semi-continuous function $f$, let $x\in \text{dom} f$, and $y\in X$, then the following are equivalent: 
> 1. $x = \text{prox}_f(y)$, 
> 2. $y - x\in \partial f(x)$,
> 3. $\forall z \in X, x \in \text{prox}_f(y): \langle z - x, y - x\rangle \le f(z) - f(x)$, this is the generalized obtuse angle theorem for the proximal operator. 

**Proof**

To prove this, we need to use the calculus rules of Non-smooth analysis. For all $x\in \text{prox}_f(x)$, we have

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
In fact, with some set algebra, it's possible to show $\subseteq$ relation. The last identity is just the subgradient inequality followed by identity 2, by the assumption of convexity on $f$, i.e.: 

$$
\begin{aligned}
    y - x &\in \partial f(x), f(z) - f(x) - \langle \partial f(x),\; 
    z - x\rangle \ge 0 \; \forall z \in X
    \\
    \implies 
    f(z) - f(x) - \langle y - x, z - x\rangle 
    &\ge 0
    \; \forall z \in X. 
\end{aligned}
$$

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
### **As a Operators**

> When the function $f$ is convex closed and proper, the $\text{prox}_{\alpha, f}$ can be viewed the following operator $(I + \alpha \partial f)^{-1}$, which is also, a single valued operator that sometimes has a nice closed form solution to it.  

**Proof**: 
The prox has a unique solution when the function $f$ is convex with $\alpha > 0$; suppose that $y^+$ is such an optimal then using subgradient: 

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


**Remarks**

When is it invertible. 
When is it a set-value mapping? 
* Right from the start, we should not assume that it's invertible, and even if it is invertible, we need to know if the inverse operator is a multi-value map, or a single-value map. 
Because we know how subgradient work, in our case we had $f$ being closed convex and proper, then the proximal operator is-singled value. 
This is the result of $f + \frac{1}{2\alpha}\Vert \cdot - y\Vert$ being a strongly convex function. 
To characterize when the proximal operator is single-valued is more complicated.
$f$ being closed convex and proper is sufficient but unnecessary for the proximal map to be single-valued.
For more about it, check out the comments on Dima's work at the end of chapter 3 of his textbook for math 516 at UW.
Dima also mentioned that the proximal operator on $\alpha$ weakly convex function ($f$ is $a$ weakly convex when $f + \frac{\alpha}{2}\Vert x \Vert$ is a convex function), which will also result in the proximal operator being a singled value operator. 
Dima's discussion on the topic can be seemed [\<The Proximal Point Method Revisited\>](https://sites.math.washington.edu/~ddrusv/proxpoint_arxiv.pdf). 


The operator is maximal monotone: 
* The subgradient operator of a closed convex and proper(CCP) function has $\partial f$ as a maximal monotone operator. 
Therefore, $x,y \in \text{gph}(\partial f)$, we have $(\bar x - x, \bar y - y)\ge 0 \implies  (\bar x, \bar y)\in \text{gph}(\partial f)$. 
Consequently, $I + \partial f$ is single-valued and subjective, so the inverse $(I +\partial f)^{-1}$ is a singled-value operator. 
For all $\alpha>0$, it's the same.
* **The Surjectivity Theorem**, [Minty's Theorem, The Surjectivity Theorem](../Operators%20Theory/Minty's%20Theorem,%20The%20Surjectivity%20Theorem.md)
* > The surjectivity theorem states, $T$ is maximal monotone iff $I + T$ is surjective. This is theorem 3.79 in Dima's work, and the proof is shown in 3.8.3.. 

Monotone operators deserve their own pages. 
We skip the details here.
I want to highlight one essential observation. 
When $f(x) = \delta_C(x)$, the proximal operator becomes the set projection operator onto the set. 

---
### **Prox is L1-Lipschitz under 2-Norm, and Firmly Non-expansive**

The Proximal operator can be understood as the special case of the set projection. 
It retains one of the properties of a set projection as well. 
A set projection onto a convex set is a L1 Lipschitz mapping. 
The proximal operator is also a L1 Lipschitz mapping for CCP functions. 

#### **Thm 2.1 | The Proximal operator is Firmly Non-Expansive**
> Let $f:\mathbb E \mapsto \mathbb{\bar R}$ be a closed, convex proper function. Then $\text{prox}_f(x)$, with $\alpha= 1$ is a singleton for every point $x\in \mathbb E$. Moreover, for any points $x, y\in \mathbb E$ the estimate holds: 
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

We use [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md) to prove. 
We also use the fact that $x^+$ is the minimum solution of $\text{prox}_f(x)$ and $y^+$ is the minimum of $\text{prox}_f(y)$. 
Define $g(z):= f(z) + \frac{1}{2}\Vert z - x\Vert^2$. 
For simplicity, we denote $P_f(x), P_g(x)$ as the proximal operator at $x$. 
$g(Z)$ is strongly convex.
Let $\alpha = 1$ then $g(y^+) - g(x^+)\ge \frac{1}{2}\Vert x^+ - y^+\Vert^2$ because of strong convexity. 
We use $x^+\in P_f(x)$, $y^+\in P_f(y)$, the strong convexity condition is

$$
{\scriptsize
\begin{aligned}
    f\left(y^+\right) 
    +\frac{1}{2}\Vert y^+ - x\Vert^2 - f(x) - \frac{1}{2}\Vert x^+ - x\Vert^2 & \ge 
    \frac{1}{2}\Vert x^+ - y^+\Vert^2
    \\
    \implies 
    f\left(x^+\right) + \frac{1}{2}\Vert x - x^+\Vert^2 &\le 
    f(y^+) + \frac{1}{2}\Vert y^+ - x\Vert^2 - \frac{1}{2}\Vert y^+ - x^+\Vert^2. 
    \\
    & = 
    \left(
        f(y^+) + \frac{1}{2}\Vert y^+ - y\Vert^2
    \right) - \frac{1}{2} \Vert y^+ - y\Vert^2 + \frac{1}{2}\Vert y^+ - x\Vert^2 - \frac{1}{2}
    \Vert x^+ - y^+\Vert^2 
\end{aligned}
}
$$

Then we consider the term: $f(y^+) + \frac{1}{2}\Vert y^+ - y\Vert^2$ and use strong convexity (wrt to $y^+$ in this case) again to obtain 
$$
\begin{aligned}
    f(x^+) + \frac{1}{2}\Vert x^+ - y\Vert^2 - f(y^+) - \frac{1}{2}\Vert y^+ - y\Vert^2 
    & \ge \frac{1}{2}\Vert x^+ - y^+\Vert^2
    \\
    \implies 
    f(x^+) + \frac{1}{2}\Vert x^+ - y\Vert^2  
    - \frac{1}{2}\Vert x^+ - y^+\Vert^2
    & \ge 
    f(y^+) + \frac{1}{2}\Vert y^+ - y\Vert^2, 
\end{aligned}
$$

replacing the expression with this larger quantity, the HRS has upper bound: 

$$
\begin{aligned}
    f(x^+) + \frac{1}{2}\Vert x - x^+\Vert^2 &\le 
    f(x^+) + \frac{1}{2}\Vert x^+ - y\Vert^2 - \frac{1}{2}\Vert y^+ - y\Vert^2
    + \frac{1}{2}\Vert y^+ - x\Vert^2 - \Vert x^+ - y^+\Vert
    \\
    \implies
    \Vert x^+ - y^+\Vert &\le 
    \frac{1}{2}\Vert x^+ - y\Vert^2 - \frac{1}{2}\Vert y^+ - y\Vert^2
    + \frac{1}{2}\Vert y^+ - x\Vert^2  - \frac{1}{2}\Vert x - x^+\Vert^2
    \\
    \implies
    \Vert x^+ - y^+\Vert &\le 
    \frac{1}{2}\left(
        \Vert x^+ - y\Vert^2 - \Vert y^+ - y\Vert^2
        + \Vert y^+ - x\Vert^2  - \Vert x - x^+\Vert^2
    \right)
    \\
    & = \langle y^+ - x+^, y\rangle + \langle x^+ - y^+, x\rangle
    \\
    &= 
    \langle y^+ - x^+, y - x\rangle. 
\end{aligned}
$$

Since $y^+ \in P_f(y), x^+ \in P_f(x)$, and the choice is arbitrary, the above expression is equivalent to 
$$
\begin{aligned}
    & \Vert P_f(x) - P_f(y)\Vert^2 \le \langle P_f(y) - P_f(x), y - x\rangle \le 
    \Vert P_f(y) - P_f(x) \Vert \Vert y - x\Vert_\star
    \\
    \implies & 
    \Vert P_f(x) - P_f(y)\Vert \le \Vert y - x\Vert_\star .
\end{aligned}
$$

That is the observation we made from the claim. 
Observe that redefining $\Vert \cdot\Vert$ into $\Vert \cdot\Vert_\star$ will recover the inequality we wanted to prove. 
By properties of norm, the above inequality is sufficient for any norm in finite Euclidean spaces.
$\blacksquare$


**Remarks**

To generalize the results where $\alpha$ is not necessarily 1, we consider: $\text{prox}_{f, \alpha}(x) = \text{prox}_{f/\alpha, 1}(x)$, which doesn't affect the Lipschitz constant at all. 
The prox has the same Lipschitz for any convex proper functions, for any parameter $\alpha > 0$. 
I deviated from reference materials and added the generality for $\Vert \cdot\Vert$ to work with $\Vert \cdot\Vert_\star$. 

The proximal operator is also <mark style="background: #FFF3A3A6;">*firmly nonexpansive*</mark>. 
This subset of Lipschitz-1 Operators.
It helps with proving the convergence of many algorithms that uses the proximal operator. 
For context, read [Firmly Nonexpansive Operators](../Operators%20Theory/Firmly%20Nonexpansive%20Operators.md) for more about Firmly Nonexpansive operators in general. 
There is also a simpler version of the proof for the Firmly Nonexpansiveness of the prox operators. 

#### **Corollary 2.2 | The gradient of Moreau Envelope is Firmly Nonexpansive**

> Consider the previous fact that the gradient, $\nabla \text{env}_{f, \alpha}(x)$ is $\alpha^{-1}(x - \text{prox}_{f, \alpha}(x))$ will be globally Lipschitz with constant $\alpha^{-1}$, therefore, $\text{env}_{f, \alpha}(x)$ is smooth with $\beta = \alpha^{-1}$, where $\alpha$ is subscripted under the envelope. 

**References**: 

Dimitri's AMATH 516, UW. Somewhere in the course notes I forgot where is where. 


---
### **Proximal Decomposition and Minty Parameterization**

The prox of the conjugate is related to the prox. Similar to how a linear subspace has its orthogonal component. 

#### **Lemma 3.1| When are Subgradient Invertible**
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
    & z\in \partial \left[
        f(\cdot) \square \frac{1}{2}\Vert \cdot\Vert^2
    \right](x)
    \\
    & x \in \partial \left[
        \left(
            f(\cdot) \square \frac{1}{2}\Vert \cdot \Vert^2
        \right)^\star
    \right](z) \quad 
    \textcolor{gray}{\triangleright \text{ Fenchel Identity}}
    \\
    & x \in \partial \left[
        f^\star + \frac{1}{2}\Vert \cdot \Vert^2
    \right](z)\quad 
    \textcolor{gray}{\triangleright \text{[1]}} 
    \\
    & x\in 
    \partial f^\star(z) + z
    \\
    & \mathbf 0  \in \partial f^\star(z) + z - x
    \\
    & \mathbf 0 \in 
    \partial \left[
        f^\star(\cdot) + \frac{1}{2}\Vert \cdot - x\Vert
    \right](z)
    \\
    & z\in \text{prox}_{f^\star}(x)
    \\
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


