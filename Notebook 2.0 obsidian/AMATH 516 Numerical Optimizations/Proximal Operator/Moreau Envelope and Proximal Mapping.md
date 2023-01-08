[[Multivalued Functions, Set-valued Mappings]]

---
### **Intro**

This is a central hub for various concepts about Moreau Envelope and Proixmal mapping. Here we will focus on the case when the function $f$ is closed convex and proper so the properties of the prox is more predictable and allows us to derive more theorems. A Moreau Envelope $\text{env}_{\alpha, f}(x)$, $\text{prox}_{\alpha, f}$ the proximal operator are defined for some function $f$: 

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

The proximal operator is a singleton when the function $f$ is convex, proper and closed. Observe that $\text{env}_{\alpha, f}(x) = (f\square \frac{1}{2\alpha}\Vert \cdot \Vert^2)(x)$, which by ([[Infimal Convolution is Epigraph Addition]]) the epigraph of the envelope is the set addition between the epigraph of those 2 functions and it inherits properties of them. For example, if we assume that the function $f$ is closed convex and proper, the their infimal convolution is also a closed, proper and convex.   This conceptualization will help with the intuitive understanding of many proximal algorithm.

**Notation nuance**

When the proximal operator is written as $\text{prox}_{\alpha f}$ is the same as $\text{prox}_{f, \alpha}$. The second type of proximal operator has a constant indicated explicitly on the under script. 

**Remarks**

It's from Dimitry's Textbook, definition 3.59, pg 77. If we consider the fact that the infimal convolution is the epigraphical addition of 2 functions, then a Moreau Envelop smooths the function using the parameter $\alpha$, for example the Moreau Envelope of the absolute value $|x|$ is given as: 

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
> The moreau envelope is a generalization of the set distance squared operations on sets. see [[Convex Sets Projections and Dist, Intro]] for more. in fact their share similarities when the function $f$ is convex, closed and proper. More specifically, prox with a parameter of $1$ gives Lipschitz continuous function with a Lipschitz constant of $L=1$. 

In addition please observe the following identities: 

$$
\begin{aligned}
    & \text{prox}_{\alpha f} =  \text{prox}_{f, \alpha}
    \\
    & \lambda\text{env}_f^\mu = 
    \text{env}_{\lambda f}^{\mu/\lambda}
\end{aligned}
$$

For notational simplicity, $\text{prox}_{f,1}$ is the same as $\text{prox}_{f}$. 

**Good References**

* Dimitry's class from UW. 
* [This](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf) survey paper from Stanford, it also contains more practical information about the prox operator. 
* \<First Order Methods for Optimizations\> by Beck. This book has more details summarizations on the properties of proximal gradient. 

---
### **As a Operators**

> When the function $f$ is convex closed and proper, the $\text{prox}_{\alpha, f}$ can be viewed the following operator $(I + \alpha \partial f)^{-1}$, which is also, a single valued operator that sometimes has a nice closed form solution to it.  

**Proof**: 
The prox has a unique solution when the function $f$ is convex with $\alpha > 0$, suppose that $y^+$ is such an optimal then using subgradient: 

$$
\begin{aligned}
    0 &\in \partial\left[
        \left.
            f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2 
        \right| y
    \right](y^+)
    \\
    0 &\in \partial f(y^+) + \frac{1}{\alpha}(y^+ - x)
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

Therefore, the proximal operator on a function that is convex proper and closed can be viewed as a weighted resolvant of the subgradient operator. 


**Remarks**

When is it invertible and when is it a set-value mapping? 
* Right from the start, we should not assume that it's invertible, and even if it is invertible, we need to know if the inverse operator is a multi-value mapping, or a single value mapping. In this particular case, because we know how subgradient work, and $f$ being closed convex and proper, it's singled value. But, to characterize such properties in the general case, we need to read more. Check out: The end of chapter 3 comments on Dimitry's work. Dimitry's also mentioned the fact that proximal operator on $\alpha$ weakly convex function ($f$ is $a$ weakly convex when $f + \frac{\alpha}{2}\Vert x \Vert$ is a convex function), which will also result in proximal operator being a singled value operator. Dimity's discussion on the topic can be seem [\<The Proximal Point Method Revisited\>](https://sites.math.washington.edu/~ddrusv/proxpoint_arxiv.pdf). 


The operator is maximal monotone: 
* In brief, the subgradient operator of a CCP function, we have $\partial f$ to be a maximal monotone operator. Meaning that for any $x,y \in \text{gph}(\partial f)$, we have $(\bar x - x, \bar y - y)\ge 0 \implies  (\bar x, \bar y)\in \text{gph}(\partial f)$. And because of this, it terms out that $I + \partial f$ is single-valued and it's surjective, meaning that the inverse $(I +\partial f)^{-1}$ is a singled value operator too. With $\alpha$ it doesn't change thing. 

* **The Surjectivity Theorem**, [[Minty's Theorem, The Surjectivity Theorem]]

* > The surjectivity theorem stated that, $T$ is maximal monotone iff $I + T$ is surjective. This is stated as theorem 3.79 in Dimitry's work, and the proof is shown in 3.8.3. 

Monotone operator deserves its pages. Here will skip the details. 

Here, I want to highlight one important observation we should make here, and that is the special case where $f(x) = \delta_C(x)$, under that case, the proximal operator becomes the set projection operator onto the set. 



---
### **Subgradient of Moreau Envelope**

$$
\begin{aligned}
    & \text{env}_{f, \alpha}(x) = \min_y \left\lbrace
        f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2
    \right\rbrace ,
    \\
    & \text{let: }y^+ \in \text{prox}_{f, \alpha}(x) \text{ then: }
    \\
    & \begin{aligned}
        \text{env}_{f, \alpha}(x) &= f(y^+) + \frac{1}{2\alpha} \Vert y^+ - x\Vert^2,
        \\
        \partial\text{env}_{f, \alpha}(x) &= \mathbf 0 + 
        \partial_x\left[
            \frac{1}{2\alpha}\Vert y^+ - x\Vert^2
        \right]
        \\
        &= \mathbf 0 + \frac{1}{\alpha}(x - y^+)
        \\
        &= \frac{1}{\alpha}(x - \text{prox}_{f, \alpha}(x)). 
    \end{aligned}
\end{aligned}
$$

Notice that, if the function $f$ is convex, then the proximal operator produces a unique solution, and in that case, the subgradient of the envelope is a gradient, because it's a singleton. It's also suggesting that the envelope is smooth, later we will see that it's not only smooth, but its gradient also Lipschitz continuous with a modulus of $1/\alpha$, implying that it's also strongly smooth according to [[Global Lipschitz Gradient, Strong Smoothness, Euivalences and Implications]]. 

**Remarks**

The proof is from myself and it might contains some errors. It's a theorem stated in Dimitry's Textbook, Theorem 3.64. Notice that this works even if function $f$ is not necessarily strongly smooth ($\beta$ smooth). 



---
### **Prox is L1-Lipschitz**

> Let $f:\mathbb E \mapsto \mathbb{\bar R}$ be a closed, convex proper function. then $\text{prox}_f(x)$, with $\alpha= 1$ is a singleton for every point $x\in \mathbb E$. Moreoever, for any points $x, y\in \mathbb E$ the estimate holds: 
> $$
> \begin{aligned}
>     \Vert \text{prox}_f(x) - \text{prox}_f(y)\Vert^2_\star \le 
>     \langle \text{prox}_f(x) - \text{prox}_f(y), x - y\rangle. 
> \end{aligned}
> $$
Basically it's Lipschitz continuous with a constant of 1 (Try using the Cauchy schwartz inequality). 

**Proof**

To prove we make use of [[Strong Convexity, Equivalences and Implications]], and the fact that $x^+$ is the minimum solution of $\text{prox}_f(x)$ and $y^+$ is the minimum of $\text{prox}_f(y)$. For simplicity we denotes $P_f(x), P_g(x)$ as the proximal operator at $x$. Define $g(z):= f(z) + \frac{1}{2}\Vert z - x\Vert^2$ is strongly convex wrt to $z$, $\alpha = 1$ then $g(y^+) - g(x^+)\ge \frac{1}{2}\Vert x^+ - y^+\Vert^2$ where $x^+\in P_f(x)$, $y^+\in P_f(y)$, expanding it we have: 

$$
\begin{aligned}
    f(y^+) +\frac{1}{2}\Vert y^+ - x\Vert^2 - f(x) - \frac{1}{2}\Vert x^+ - x\Vert^2 & \ge 
    \frac{1}{2}\Vert x^+ - y^+\Vert^2
    \\
    \implies 
    f(x^+) + \frac{1}{2}\Vert x - x^+\Vert^2 &\le 
    \underbrace{f(y^+) + \frac{1}{2}\Vert y^+ - x\Vert^2 - \frac{1}{2}\Vert y^+ - x^+\Vert^2. }_{
        \begin{aligned}
            & = 
            \left(
                f(y^+) + \frac{1}{2}\Vert y^+ - y\Vert^2
            \right) - \frac{1}{2} \Vert y^+ - y\Vert^2 + \frac{1}{2}\Vert y^+ - x\Vert^2 - \frac{1}{2}
            \Vert x^+ - y^+\Vert^2 
        \end{aligned}
    }
\end{aligned}
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

replacing the expression with this larger quantity we obtain a larger rhs: 

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

Since $y^+ \in P_f(y), x^+ \in P_f(x)$, and the choice is arbitrary, the above expression is equivalent to: 
$$
\begin{aligned}
    & \Vert P_f(x) - P_f(y)\Vert^2 \le \langle P_f(y) - P_f(x), y - x\rangle \le 
    \Vert P_f(y) - P_f(x) \Vert \Vert y - x\Vert_\star
    \\
    \implies & 
    \Vert P_f(x) - P_f(y)\Vert \le \Vert y - x\Vert_\star .
\end{aligned}
$$

Which is the results. Observe that, redefining $\Vert \cdot\Vert$ into $\Vert \cdot\Vert_\star$ will recover the inequality we wanted to prove. By properties of norm, the above inequality is sufficient for any more.$\blacksquare$


**Remarks**

To generalize the results where $\alpha$ is not necessarily 1, we consider: $\text{prox}_{f, \alpha}(x) = \text{prox}_{f/\alpha, 1}(x)$, which doesn't affect the Lipschitz constant at all. The prox has the same Lipschitz for any convex proper functions, for any parameter $\alpha > 0$. I deviated from the references materials and added the generality for $\Vert \cdot\Vert$ so that it works with $\Vert \cdot\Vert_\star$. 

**Corollary: Moreau Envelope is Smooth**

Consider the fact that the gradient, $\nabla \text{env}_{f, \alpha}(x)$ is $\alpha^{-1}(x - \text{prox}_{f, \alpha}(x))$ will be globally Lipschitz with constent $\alpha^{-1}$, therefore, $\text{env}_{f, \alpha}(x)$ is smooth with $\beta = \alpha^{-1}$, where $\alpha$ is subscripted under the envelope. 


---
### **Moreau Decomposition and Minty Parameterizations**

**Lemma: When are Subgradient Invertible**
> Let $f:\mathbb E\mapsto \mathbb{\bar R}$ be proper closed and convex, then $(\partial f)^{-1} = \partial f^\star$. 

**Proof Lemma**
To show it, we make use of the [[Fenchel Identity]]: 
$$
\begin{aligned}
    & x\in \partial f(z) \iff z \in \partial f^\star(x)
    \\
    & x\in \partial f(z)\implies z \in (\partial f)^{-1}(x)
    \\
    \implies & z \in (\partial f)^{-1}(x) 
    \iff  
    z \in \partial f^\star(x). 
\end{aligned}    
$$

**Remarks:**

Due to the nature of multi-valued mapping, it's possible that $(\partial f(z))^{-1} = \emptyset$ for some value of $z$. We may not assume that $\partial f(x)$ has $\text{rng}(\partial f) = \mathbb E$. And because of this, we can't specialize the statement for a strong class of differentiable functions. It's wrong to state the fact that $\nabla f^{-1} = \nabla f^\star$ because it's possible that the gradient $f$ was never one-to-one. Additional assumptions are needed. 

The extra assumption needed are strict convexity (Positive definiteness of hessian) over the whole domain, and the function $f$ is coercive over the whole domain. 


**References:**

Proposition 11.3 in Rockafellar. 

**Moreau Decomposition** 

Consider $f:\mathbb E \mapsto \mathbb{\bar R}$, where $f$ is a CCP (closed convex proper) functions, then: 
> $$
> \begin{aligned}
>   x = \text{prox}_{f, 1}(x) + \text{prox}_{f^{\star}, 1}(x)
> \end{aligned}
> $$

**Proof**
$$
\begin{aligned}
    & z = \text{prox}_f(x) & 
    \\
    \implies & \mathbf 0 \in \partial \left(
        f(\cdot) + \frac{1}{2}\Vert \cdot - x\Vert^2
    \right)(z) & [1]
    \\
    \implies &\mathbf 0\in \partial f(z) + z - x & [2]
    \\
    \implies & x - z \in \partial f(z)  & [3]
    \\
    \implies & z\in \partial f^\star(x - z) & [4]
    \\
    \implies& \mathbf 0 \in \partial f^\star(x - z) - z &[5]
    \\
    \implies & 
    \mathbf 0\in \partial\left(
        f^\star(\cdot) - \frac{1}{2}\Vert \cdot - x\Vert^2
    \right)(x - z) &[6]
    \\
    \implies & 
    x - z= \text{prox}_{f^\star}(x) &[7]
    \\
    & x = \text{prox}_f(x) + \text{prox}_{f^\star}(x).  &[8]
\end{aligned}
$$

At \[1\] we use the fact that $f(x)$ is closed proper and convex, and hence $\mathbf 0$ is part of the subgradient set at $z$. At \[2\] we simply use the subgradient of the sum of a smooth and non-smooth function. At \[4\] we invoke the Fenchel Identity and at \[6\] we re-interpreted the expression using the prox on the conjugate functions. At \[7\], \[8\] we simply use the definition of prox and the fact that $z = \text{prox}_f(x)$. Additionally, one can Chose to use property from [[Convex Conjugation]] and use $\lambda f$ instead where $\lambda \ge 0$, in which case we have: 

$$
\begin{aligned}
    x &= \text{prox}_{\lambda f}(x) + \text{prox}_{(\lambda f)^\star}(x)
    \\
    &= \text{prox}_{f, \lambda^{-1}}(x) + \text{prox}_{\lambda f^\star(\cdot/\lambda)}(x)
    \\
    &= 
    \text{prox}_{f, \lambda^{-1}}(x) + \text{prox}_{f^\star(\cdot /\lambda), \lambda^{-1}}(x), 
\end{aligned}
$$

which is more useful for direct applications. 

**Remarks**

Minty Parameterizations: 
  * Moreau Envelope is a special case where the set-valued mapping is the subgradient of the function. In general for a set value mappings $T$ that is maximally monotone, we have the equality: $(I + T^{-1})^{-1} = I - (I + T)^{-1}$ holds, see [[Resolvent and Minty Paramaterization]], [[Inverse of Subgradient of the Convex Conjugate]] for more information. 
  * Please immediately observe that the Moreau Decomposition is a special case of the above formula where $T$ is the subgradient of some CCP functions. 

Moreau Decomposition With the Alpha parameters on Proximal operators: 
  * We use the property that $(\alpha f(x))^\star =\alpha f^\star(z/\alpha)$ and the identity described at the start to simplify the Moreau Decompositions formula. 


---
### **Gradient of Moreau Envelope is Lipschitz for CCP Functions**

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
    \right](z)
    \\
    & x \in \partial \left[
        f^\star + \frac{1}{2}\Vert \cdot \Vert^2
    \right](z) &  [1]
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
    & z \in x - \text{prox}_{f}(x) & [2]
\end{aligned}
$$

At \[1\] we use the conjugate formula for infimal convolution between 2 functions. Also, observe that $z$ is unique because $f(\cdot)\square\frac{1}{2}\Vert\cdot\Vert^2$ is a strongly convex function which has a unique minimum to it. At \[2\] we make use of the Moreau decomposition. And finally, the conjugate $f^\star$ is convex, and hence adding a quadratic to it is strongly convex, producing a singleton for the proximal mapping. The subgradient is actually gradient.$\square$ additionally, using the fact that prox is L-1 Lipzchitz, the gradient is also a Lipschitz mapping. 

**Remarks**

When $f$ is an indicator function for a set, the function is definitely quadratic, and it's smooth too. For example $\delta_{\mathbf 0}(x)$ has a proximal mapping that is simply $\frac{1}{2}\Vert x\Vert^2$, which is smooth. 

The derivative of the envelope where $\alpha$ presents instead of one, we have $\alpha^{-1}(x - \text{prox}_{f, \alpha}(x))$. 


---
### **Quick Formulas for the Proximal Operators**

Here is a list of useful formula about the proximal operator, in the most general context possible. We stated without the proof. The reference is taken from the survey paper from Stanford.  

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

Follows directly from [[Minimizer of Quadratic Sum, Weighted Average]]. 

**Parallelization**

> Suppose that function $f(x)$ can be written as the Euclidean cross product $(f_1(x_1), f_2(x_2), \cdots, f_m(x_m))$, and we assume that each of $x_1, x_2, \cdots, x_n$ are vector in $\mathbb R^{k_1}, \mathbb R^{k_2}, \cdots, \mathbb R^{k_m}$ such that $x =\bigotimes_{i=1}^m x_i$,then we can write the proximal gradient operator of $f$ in parallel form which is given as: 
> $$
> \begin{aligned}
>     \text{prox}_{f, \lambda}((x_1, x_2, \cdots, x_m)) = 
>     (\text{prox}_{f_1, \lambda}(x_1), \text{prox}_{f_2, \lambda}(x_2), \cdots \text{prox}_{f_m, \lambda}(x_m)).
> \end{aligned}
> $$
> In general, if there exists any permutation of the list of $x_1, x_2, \cdots, x_m$, the parallelization property of prox will be come applicable. 

---
### **Misc**

[[Proximal on Moreau Envelope]]. 


---
### **Amir's Cheatsheet**


