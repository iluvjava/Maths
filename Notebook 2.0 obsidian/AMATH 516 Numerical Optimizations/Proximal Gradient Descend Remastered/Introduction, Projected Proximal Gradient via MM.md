prereq: 
* [[Subgradient and Subdifferential Definition]]
* [[Characterizing Functions for Optimizations]], Strong convexity is used. 
* [[Moreau Envelope and Proximal Mapping]], We use the proximal operator a lot in here, and some of the important properties of the proximal operator. 
* [[Global Lipschitz Gradient and its weaker Implications, Smoothness]], We use one of the smoothness property and its relations to convexity and Lipschitz of the gradient of the convex function. 

---
### **Intro**

Proximal gradient descend is a unconstrained optimization method, it aims to solve: 

> $$\min_x \{g(x) + h(x)\}$$

where $g(x), h(x)$ are convex but $h(x)$ is non-smooth and $g$ is smooth. It's the type of smooth to upper bound the function using a simple quadratic. Here, we derive the proximal gradient algorithm using the most common way of deriving the projected gradient algorithm: Majorizing and Minimizing. We derive a non-smooth upper bound from the gradient information of the function and then solves the minimum for the upper bound function for an update of the next step of the algorithm. 

**The Upper model Function**

By the property that $g$ is $\beta$ smooth and convexity of $h$ we have: 

$$
\begin{aligned}
    & f(x) + h(x) \le 
    g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
    + h(y) =: m_x(y) \quad \forall y
\end{aligned}
$$

Take note that, using the fact that function $f$ is smooth, we have a quadratic upper bound plus the affine function from below defined via the gradient, and this function is strongly convex, a very useful properties ([[Strong Convexity, Equivalences and Implications]]). 

**Remarks**

Please observe that it is implied that $\beta$, will be larger than the Lipschitz constant for the gradient of $l(x)$. Please recall the property of this particular type of smoothness. Additionally, the upper bounding function is a strongly convex function. 

**Define: The Proximal Operator and Moreau Envelope**

$$
\begin{aligned}
    & \underset{h, t}{\text{prox}}(
    z
    ) = 
    \arg\min_x \left\lbrace 
        \frac{1}{2t}
        \left\Vert
            x - z
        \right\Vert^2
        + 
        h(x)
    \right\rbrace, 
    \\
    & \text{env}_{h,t}(z) = 
    \min_{x} \left\lbrace
        h(x) + \frac{1}{2t}\Vert x - z\Vert^2
    \right\rbrace. 
\end{aligned}
$$

This is called the proximal operator, parameterized by a convexity information related parameter $t$, and the non-smooth function named $h(x)$. Please read [[Moreau Envelope and Proximal Mapping]] for more in depth discussion, their proven properties will be referred to later. 

---
### **Upperbound Function is Proximal Envelope on Gradient when Minimized**

Here we state some of the important results and claims related to upper smooth model, the Forward Backwards Envelope (FB Envelope) that we will soon define, and other associated properties. 

**The Forward Backward Envelope**: 
> Let $m^+(x) := \min_y m_x(y)$, then it's given by: 
> $$
> \begin{aligned}
>   m^+(x) &= m_x\circ \text{prox}_{g, \beta^{-1}}(x - \beta^{-1}\nabla l(x))
>   \\
>   &= \text{env}_{h, \beta^{-1}}(x - \beta^{-1}\nabla g(x)) - \frac{1}{2\beta} \Vert \nabla g(x)\Vert^2 + g(x).
> \end{aligned}
> $$


**Proof**

$$
\begin{aligned}
    m_x(y) &= g(x) + \underbrace{\nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2 + h(y)}_{\text{this part}}. 
\end{aligned}\tag{2}
$$
We complete the square on the terms that involves the variable $y$, then

$$
\begin{aligned}
    & \quad \min_y \left\lbrace
    h(y) + \langle\nabla g(x), y - x\rangle + \frac{\beta}{2} \Vert y - x\Vert^2
    \right\rbrace
    \\
    & = \min_y\left\lbrace
        h(y) + 
        \frac{\beta}{2}
        \left(
            \Vert y - x\Vert^2 + 2\langle \beta^{-1} \nabla g(x), y - x\rangle
        \right)
    \right\rbrace
    \\
    & = \min_y\left\lbrace
        h(y) + 
        \frac{\beta}{2}
        \left(
            \Vert y - x\Vert^2 + 2\langle \beta^{-1} \nabla g(x), y - x\rangle
            + \Vert \beta^{-1}\nabla g(x)\Vert^2  - \Vert \beta^{-1}\nabla g(x)\Vert^2 
        \right)
    \right\rbrace
    \\
    & = \min_y\left\lbrace
        h(y) + 
        \frac{\beta}{2}
        \left(
            \left\Vert
                 y - x + \beta^{-1}\nabla g(x)
            \right\Vert^2
            - \Vert \beta^{-1}\nabla g(x)\Vert^2 
        \right)
    \right\rbrace
    \\
    &= \text{env}_{h, \beta^{-1}}
    (
        x - \beta^{-1}\nabla g(x)
    ) - \frac{\beta\Vert \beta^{-1}\nabla g(x)\Vert^2 }{2}, 
\end{aligned}
$$

adding back the $g(x)$ that is not part of the minimizations, we hae what we claimed. 



---
### **Proximal Gradient is the Minimizer of the Upper Bounding Function**

> $$
> \underset{h, \beta^{-1}}{\text{prox}} \left(x - \frac{\nabla g(x)}{\beta}\right) = 
> \arg\min_y \left\lbrace
>     g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2}
>     \Vert y - x\Vert^2 + h(y)
> \right\rbrace,
> $$
> the proximal operator minimize the upper model function $m_x(y)$. Here we assume that $h$ is proper. 

**Proof**

The proof is direct by considering the optimal solution is obtained when the subgradient of the expression inside argmin contains zero, therefore we have: 

$$
\begin{aligned}
    \mathbf 0 &\in 
    \nabla g(x) + {\beta}(y - x) + \partial h(y)
    \\
    \nabla g(x) + \beta x & \in
    \beta y + \partial h(y)
    \\
    -\beta^{-1} \nabla g(x) + x &\in y + \beta^{-1} \partial h(y)
    \\
    -\beta^{-1} \nabla g(x) + x &\in [I + \beta^{-1} \partial h](y)
    \\
    \implies
    [I + \beta^{-1}\partial h]^{-1}(- \beta^{-1} \nabla g(x) + x) 
    & \ni y,
\end{aligned}
$$
and using one of the operator interpretations of prox, the LHS of the expression is the prox of $h, \beta^{-1}$ on $x - \beta^{-1}\nabla g(x)$. 

**Remarks**

Intuitively, the larger $\beta$, the more pointy the quadratic is, meaning that smaller step size for the multiplier for the gradient of $g(x)$, and when $\beta$ is huge, less penalty will be placed on quadratic term inside of the proximal operator, making the infimal convolution resulting in more smoothing on the function $h$. 


---
### **Gradient of the Forward Backwards Envelope**

> If we assume that $l(x)$ is C2 smooth such that it has a Hessian to it, then we have the gradient for the Forward and Backwards Envelope given as: 
> 
> $$
> \begin{aligned}
>     \nabla_x m^+(x) = 
>     [I - \beta^{-1}\nabla \nabla ^Tl(x)]^T(x)
>     \beta(
>         x - \text{prox}_{\phi, r}(x - \beta \nabla l(x))
>     )
> \end{aligned}
> $$


**Proof**

$$
\begin{aligned}
    \nabla_x \left[
        \frac{-1}{2\beta}\Vert \nabla l(x)\Vert^2
        + l(x)
    \right](x)
    & = 
    \nabla_x l(x) - \beta^{-1}\nabla \nabla^T l(x)^T \nabla l(x)
    \\
    &= 
    \left[
        I - \beta^{-1}\nabla \nabla L
    \right]^T(x)\nabla l(x)
    \\
    \nabla_x \left[
        \text{env}_{\phi, \beta^{-1}} (
            x - \beta^{-1}\nabla l(x)
            )
    \right] &= 
    \nabla_x [x - \beta^{-1}\nabla l(x)]^T(x)
    \nabla_x [\text{env}_{\phi, \beta^{-1}}](x - \beta^{-1}\nabla l(x))
    \\
    &= 
    [I - \beta^{-1}\nabla\nabla^T l(x)]^T(x) \beta
    \left(
    \begin{aligned}
        & x - \beta^{-1}\nabla l(x)
        \\
        & 
        - \text{prox}_{\phi, \beta^{-1}}
        (
        x - \beta^{-1}\nabla l(x)
        )
    \end{aligned}
    \right),
\end{aligned}
$$

Adds these 2 terms together and we will obtain the results for the claim. 

**Remarks**

The forward and backwards envelope function and the original function share the same minimizer.  


---
### **Envelope Optimality Bounds**

> We can quantify how much the FB envelope does better compare to the upper bound function at the same point, and it's given by: 
> 
> $$
> \begin{aligned}
>     m^{+}(x) - m_x(x) \le \frac{-\beta}{2}\Vert x - P(x)\Vert^2, \;
>     P(x) =
>     \text{prox}_{\phi, \beta^{-1}} (x - \beta^{-1}\nabla l(x)). 
> \end{aligned}
> $$

**Proof**

We directly consider the fact that the upper bounding function is strongly convex with a constaint of $\beta$, eahich means that for the minimizer $y^+$ of the upper bounding function we can obtain: 

$$
\begin{aligned}
    m_x(y^+) - m_x(x) \le \frac{-\beta}{2}\Vert x -y^+\Vert^2
    \\
    m^+(x) - \underbrace{m_x(x)}_{l(x) + \phi(x)} \le 
    \frac{-\beta}{2}\Vert x -y^+\Vert^2, 
\end{aligned}
$$
and this is direct by the strong convexity definition substituting in the optimal point that sets the gradient/subgradient equals to zero. 


---
### **Claim 5**

> We define $f:= l + \phi$, then the difference between $f(P(x))$ and the envelope point $m^+(x)$ can be bounded, more > precisely: 
> 
> $$
> \begin{aligned}
>     f(P(x)) - m^+(x)\le 
>     \frac{-1}{2\beta} (1 - \beta^2)
>     \Vert \beta(x - P(x))\Vert^2, 
> \end{aligned}
> $$

Here we use the additional fact that the Hessian for $l(x)$ has a bounded operator norm that is $< \beta$. Using the a non-trivial property of smoothness [[Global Lipschitz Gradient and its weaker Implications, Smoothness]] of the upper envelope function $m^+(x)$ and the fact that $P(x)$ the projected gradient is the minimizer for the envelope function (??? #VERIFICATION NEEDED), we can derive the inequality 

$$
\begin{aligned}
    f\circ P(x) - m^+(x) \le 
    \frac{-\beta}{2}
    \Vert 
        \underbrace{[I - \beta^{-1}\nabla \nabla^T l](x)
        \beta 
        (x - P(x))}_{\nabla m^+(x)}
    \Vert^2, 
\end{aligned}
$$

An we focuses on only the RHS, we make the assumption is $\beta$ is larger than the maximum eigen values for the Hessian $\nabla \nabla^Tl(x)$ giving us (Which later we will see why this is important), then for the RHS: 

$$
\begin{aligned}
    & \frac{-\beta}{2}
    \Vert [\beta I - \nabla \nabla^Tl](x)\beta(x - P(x))\Vert^2
    \\
    \le& \frac{-\beta}{2} 
    \Vert \beta I - \nabla \nabla^Tl(x) \Vert^2 \Vert \beta(x - P(x))\Vert^2, 
\end{aligned}
$$

recall that the spectral norm for a matrix is the singular value, in the case when the matrix is symmetric, which it is in this case because it's the hessian and we assumed that $l(x)$ is $C^2$, then its spectral norm squared is equal to the maximum of all its eigenvalues. Now we assume that: 

$$
\begin{aligned}
    & \lambda_{\max}(\nabla \nabla^T l(x)) = L, \; 
    \lambda_{\min}(\nabla \nabla^T l(x)) = \lambda
    \\
    \implies
    & 
    \Vert [\beta I - \nabla\nabla^Tl](x)\Vert^2 \le \beta - \lambda, 
\end{aligned}
$$

we also make use of the fact that $\nabla\nabla^T l(x) \succeq 0$, and we assume that $\beta \ge L$, so then we can obtain the new upper bound: 

$$
\begin{aligned}
    f \circ P(x) - m^+(x) \le 
    \frac{-\beta}{2}(\beta - \lambda)
    \Vert x - P(x)\Vert^2 , 
\end{aligned}
$$

which completes if we just move the beta into the norm. 

---
### **Termination Conditions and Optimality**

> If proximal operator produces $x^{(k+ 1)} = x^{(k)}$ (it converges), then optimality condition for the original minimization problem is satisfied. 
 

**Proof**

$$
\begin{aligned}
    x^+ &= \underset{u}{\text{argmin}} \left(
        g(x) + \nabla g(x)^T(u - x) + \frac{1}{2t}\Vert u - x\Vert^2 + h(u)
    \right)
    \\
    0 &\in \nabla g(x) + \frac{1}{t}(x^+ - x) + \partial h(x^+)
    \\
    G_t(x) - \nabla g(x) &\in \partial h(x^+)
    \\
    G_t(x) &\in \partial h(x^+) + \nabla g(x).
\end{aligned}

$$

Where $G_t(x) = \frac{1}{t}(x^+ - x)$, it can be interpreted as the step size function, but influenced by the smoothness and the regularization term. Take notice that, if $x^+ = x$, meaning that the proximal operator becomes the identity, then the optimal solution is satisfied because zero belongs to the subgradient of $g(x) + h(x)$. 

---
### **Objective Decrease of Each Step**

Let $x$ be any point, and $x^+ \in P(x)$, the output of the prox gradient operator, then it will impose an objective decrease of the value of the function $F(x):= l(x) + \phi(x)$, more precisely we have the relation that: 

$$
\begin{aligned}
    f(x^+) - f(x) \le \left(\frac{L}{2} - \frac{2}{2\beta}\right)\Vert x - x^+\Vert^2, 
\end{aligned}
$$
where $L$ is the lipschitz constant for the gradient of $l(x)$. To prove it we first consider the fact that $x^+$ minimizes the envelope we have: 

$$
\begin{aligned}
    \phi(x^+)+ 
    \langle \nabla l(x), x^+ - x\rangle + \frac{1}{2\beta}\Vert x^+ - x\Vert^2 
    \le& \phi(x)
    \\
    \varphi(x^+) - \varphi(x) + \langle \nabla l(x) - x^+ - x\rangle 
    \le& \frac{-1}{2\beta} \Vert x^+ - x\Vert^2, 
\end{aligned}
$$

using the smoothness property of $l(x)$, we have: 

$$
\begin{aligned}
    l(x^+) - l(x) - \langle \nabla l(x), x^+ - x\rangle 
    \le& \frac{-1}{2\beta} \Vert x^+ - x\Vert^2
    \\
    \implies
    \varphi(x^+) + l(x^+) - l(x) - \varphi(x)
    \le& 
    \left(
        \frac{L}{2} - \frac{1}{2\beta}
    \right)\Vert x^+ - x\Vert^2
    \\
    f(x^+) - f(x) 
    \le &
    \left(
        \frac{L}{2} - \frac{1}{2\beta}
    \right)\Vert x^+ - x\Vert^2, 
\end{aligned}
$$

And it's ot hard to see that to assert decreasing objective, the multiplier on the RHS for the norm will have to be strictly less than zero, meaning that $L^{-1} > \beta$. The larger the Lipschitz constant, the more carefule we have to be about the step size $\beta$. 


---
### **Formulation of Proximal Gradient Descend**

Assuming that $g(x)$ is beta smooth, meaning that it can be bounded above by a parabolic of convexity $\beta$, and let $h$ be a convex but non-smooth function. 

>$$
>\begin{aligned}
>    & \text{Initialize: }x^{(0)}
>    \\
>    & \text{for } k = \text{ from } 1 \text{ to } \infty
>    \\
>    &\hspace{2em}
>    \begin{aligned}
>        & x^{(k)} = \underset{h, \frac{1}{\beta}}{\text{prox}}
>        \left(x^{(k - 1)} - \frac{\nabla g(x)}{\beta}\right)
>        \\  
>        & \text{break if } x^{(k)} = x^{(k + 1)}
>    \end{aligned}
>\end{aligned}
>$$

**Note** 

For accelerated gradient, it's exactly the same. 

---
### **FISTA, Accelerated Proximal Gradient**

This accelerated gradient algorithm is referenced from: [[FISTA_ A Fast Iterative Shrinka - Amir Beck.pdf]]. 

The iteration will be started with: $x_0 = y_0$, $t_0 = 1$, the update sequence is: 

>$$ 
>\begin{aligned}
>    & x_{k + 1} = \underset{1/\beta, h}{\text{prox}}\left(
>        y_k - \frac{1}{\beta}\nabla f(y_k)
>    \right)
>    \\
>    & t_{k + 1} = \frac{1 + \sqrt{1 + 4t_k^2}}{2}
>    \\
>    & y_{k + 1} = x_{k + 1} + \frac{t_k - 1}{t_{k + 1}}(x_{k + 1} - x_k)
>\end{aligned}
>$$

Take notice that this is exactly the same when compare to the gradient descent without the proximal operator. 




