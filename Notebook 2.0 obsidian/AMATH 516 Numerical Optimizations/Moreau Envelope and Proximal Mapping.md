[[Multivalued Functions, Set-valued Mappings]]

---
### **Intro**

A Moreau Envelope $\text{env}_{\alpha, f}(x)$, $\text{prox}_{\alpha, f}$ the proximal operator are defined for some function $f$: 

$$
\begin{aligned}
    & \text{env}_{\alpha, f}(x) := \min_{y}\left\lbrace
        f(y) + \frac{1}{2 \alpha }\Vert y - x\Vert^2
    \right\rbrace, 
    \\
    & \text{prox}_{\alpha,f}(x) := 
    \arg\min_{y}\left\lbrace
        f(y) + \frac{1}{2\alpha} \Vert y - x\Vert^2
    \right\rbrace. 
\end{aligned}
$$

The proximal operator is a singleton when the function $f$ is convex, proper and closed. Observe that $\text{env}_{\alpha, f}(x) = (f\square \frac{1}{2\alpha}\Vert \cdot \Vert^2)(x)$, which by ([[Infimal Convolution is Epigraph Addition]]) the epigraph of the envelope is the set addition between the epigraph of those 2 functions.  

**Remarks**

It's from Dimitry's Textbook, definition 3.59, pg 77. 

If we consider the fact that the infimal convolution is the epigraphical addition of 2 functions, then a Moreau Envelop smooths the function using the parameter $\alpha$, for example the Moreau Envelope of the absolute value $|x|$ is given as: 

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

Dimitry's Comments: The prox operator is a generalization of the set distance operations on sets. see [[Set Projections and Dist]] for more. in fact their share similarities when the function $f$ is convex, closed and proper. More specifically, prox with a parameter of $1$ gives Lipschitz continuous function with a Lipschitz constant of $L=1$. 

In addition please observe the following identities: 

$$
\begin{aligned}
    & \text{prox}_{f/\alpha, 1} =  \text{prox}_{f, \alpha}
    \\
    & \alpha^{-1}\text{env}_{\alpha f, 1}(x) = \text{env}_{f, \alpha}(x). 
\end{aligned}
$$

For notational simplicity, $\text{prox}_{f,1}$ is the same as $\text{prox}_{f}$. 

**Good References**

* Dimitry's class from UW. 
* [This](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf) survey paper from Stanford, it also contains more practical information about the prox operator. 

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

* **The Surjectivity Theorem**

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

Notice that, if the function $f$ is convex, then the proximal operator produces a unique solution, and in that case, the subgradient of the envelope is a gradient, because it's a singleton. It's also suggesting that the envelope is smooth, later we will see that it's not only smooth, but it's also lipschitz continuous with a modulus of $1/\alpha$. 

**Remarks**

The proof is from myself and it might contains some errors. 



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

Which is the results. Observe that, redefining $\Vert \cdot\Vert$ into $\Vert \cdot\Vert_\star$ will recover the inequality we wanted to prove. By properties of norm, the above inequality is sufficient for any more. $\blacksquare$. 


**Remarks**

To generalize the results where $\alpha$ is not neccesarily 1, we consider: $\text{prox}_{f, \alpha}(x) = \text{prox}_{f/\alpha, 1}(x)$, which doesn't affect the Lipschitz constant at all. The prox has the same lipschitz for any convex proper functions, for any parameter $\alpha > 0$. I deviated from the references materials and added the generality for $\Vert \cdot\Vert$ so that it works with $\Vert \cdot\Vert_\star$. 

**Corollary: Moreau Envelope is Smooth**

Consider the fact that the gradient, $\nabla \text{env}_{f, \alpha}(x)$ is $\alpha^{-1}(x - \text{prox}_{f, \alpha}(x))$ will be globally Lipschitz with constent $\alpha^{-1}$, therefore, $\text{env}_{f, \alpha}(x)$ is smooth with $\beta = \alpha^{-1}$, where $\alpha$ is subscripted under the envelope. 


---
### **Moreau Decomposition and Minty Parameterizations**

**Lemma**
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

At \[1\] we use the fact that $f(x)$ is closed proper and convex, and hence $\mathbf 0$ is part of the subgradient set at $z$. At \[2\] we simply use the subgradient of the sum of a smooth and non-smooth function. At \[4\] we invoke the Fenchel Identity and at \[6\] we re-interpreted the expression using the prox on the conjugate functions. At \[7\], \[8\] we simply use the definition of prox and the fact that $z = \text{prox}_f(x)$. 

**Remarks**

Minty Parameterizations: 
  * Moreau Envelope is a special case where the set-valued mapping is the subgradient of the function. In general for a set value mappings: $T$, we have the equality: 
  * $$(I + T^{-1})^{-1} = I - (I - T)^{-1}.$$
  * Please immediately observe that the Moreau Decomposition is a special case of the above formula where $T$ is the subgradient of some CCP functions. 

Moreau Decomposition With the Alpha parameters on Proximal operators: 
  * We use the property that $(\alpha f(x))^\star =\alpha f^\star(z/\alpha)$ and the identity described at the start to simplify the Moreau Decompositions formula. 


---
### **Gradient of Prox is Lipschitz for CCP Functions**

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

At \[1\] we use the conjugate formula for infimal convolution between 2 functions. Also, observe that $z$ is unique because $f(\cdot)\square\frac{1}{2}\Vert\cdot\Vert^2$ is a strongly convex function which has a unique minimum to it. At \[2\] we make use of the Moreau decomposition. And finally, the conjugate $f^\star$ is convex, and hence adding a quadratic to it is strongly convex, producing a singleton for the proximal mapping. The subgradient is actually gradient.$\square$ additionally, using the fact that $prox$ is L-1 Lipzchitz, the gradient is also a Lipschitz mapping. 

**Remarks**

When $f$ is an indicator function for a set, the function is definitely quadratic, and it's smooth too. For example $\delta_{\mathbf 0}(x)$ has a proximal mapping that is simply $\frac{1}{2}\Vert x\Vert^2$, which is smooth. 



