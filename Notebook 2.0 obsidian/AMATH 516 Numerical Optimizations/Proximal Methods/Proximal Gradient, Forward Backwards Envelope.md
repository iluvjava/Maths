prereq: 
* [Subgradient Intro](../Non-Smooth%20Calculus/Subgradient%20Intro.md)
* [[Characterizing Functions for Optimizations]], Strong convexity is used. 
* [[Moreau Envelope and Proximal Mapping]], We use the proximal operator a lot in here, and some of the important properties of the proximal operator. 
* [[../Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications | Strong Smoothness Conditions]], We use one of the smoothness property and its relations to convexity and Lipschitz of the gradient of the convex function. 
  [[Proximal Gradient Method]], The old notes for proximal gradient methods when Sasha was teaching for the class. 

---
### **Intro**

Sum of smooth and non smooth problems has structure that can be exploited. 

#### **Def | Problem Form**

> $$\min_x \{g(x) + h(x)\}$$

**Assumptions**

1. $g(x), h(x)$ are convex
2. $h(x)$ is non-smooth 
3. $g$ is smooth with constant $L$. 

Here, we derive the proximal gradient algorithm using the idea of upper Envelope Minimizations. We derive a non-smooth upper bound from the gradient information of the function and then solves the minimum for the upper bound function for an update of the next step of the algorithm. 

**The Upper model Function**

By the property that $g$ is $\beta$ smooth and convexity of $h$ we have: 

$$
\begin{aligned}
    & f(x) + h(x) \le 
    g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2} \Vert y - x\Vert^2
	    + h(y) =: m_x(y) \quad \forall y \in \mathbb E 
\end{aligned}
$$

Take note that, using the fact that function $f$ is smooth, we have a quadratic upper bound plus the affine function from below defined via the gradient, and this function is strongly convex, a very useful properties ([[Strong Convexity, Equivalences and Implications]]). 

**Remarks**

Please observe that it is implied that $\beta$, will be larger than the Lipschitz constant for the gradient of $g(x)$, let's say it's $L$. Please recall the property of this particular type of smoothness. Additionally, the upper bounding function is a strongly convex function. 

**Define | The Proximal Operator and Moreau Envelope**

For any $f:\mathbb R^n \mapsto \mathbb{\bar R}$, we have the gradient and the Moreau Enveloped defined to be: 

$$
\begin{aligned}
    & \underset{th}{\text{prox}}(z) = 
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
### **The Proximal Gradient Descend Method**

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

For accelerated gradient, it's exactly the same but with whatever momentum terms we want to use for it. 

**Remarks**

The step-size is fixed in the above algorithm and it's $\beta^{-1}$ to be precise, it's required to have $\beta \ge L$, where $L$ is the Lipschitz constant for $f$ to have the method as a monotone method. See later sections for me exposition of the matter.


---
### **Proximal Gradient Minimizes the Upper Bounding Function**

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
### **Minimizations of the Upper Bound Function**

The Forward Backward Envelope is the resulting function of minimizing upper bounding $m_x(y)$ wrt to parameter $y$. Readers should realize that the minimizers is unique due strong convexity of our upper bounding function. 

#### **Def | The Forward Backward Envelope**
> Let $m^+(x) := \min_y m_x(y)$, then it's given by: 
> $$
> \begin{aligned}
>   m^+(x) &= m_x\circ \text{prox}_{h, \beta^{-1}}(x - \beta^{-1}\nabla g(x))
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
	        \textcolor{blue}{
		        \Vert y - x\Vert^2 + 2\langle \beta^{-1} \nabla g(x), y - x\rangle
	            + \Vert \beta^{-1}\nabla g(x)\Vert^2 
		    }
            - \Vert \beta^{-1}\nabla g(x)\Vert^2 
        \right)
    \right\rbrace
    \\
    & = \min_y\left\lbrace
        h(y) + 
        \frac{\beta}{2}
        \left(
	        \textcolor{blue}
	        {
	            \left\Vert
	                 y - x + \beta^{-1}\nabla g(x)
	            \right\Vert^2
            }
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
### **Gradient of the Forward Backwards Envelope**

> If we assume that $g(x)$ is C2 smooth such that it has a Hessian to it, then we have the gradient for the Forward and Backwards Envelope can be computed via
> 
> $$
> \begin{aligned}
>     \nabla_x m^+(x) = 
>     [I - \beta^{-1}\nabla \nabla ^Tg(x)]^T(x)
>     \beta(
>         x - \text{prox}_{h, \beta^{-1}}(x - \beta \nabla g(x))
>     )
> \end{aligned}
> $$


**Proof**

$$
\begin{aligned}
    & \nabla_x \left[
        \frac{-1}{2\beta}\Vert \nabla g(x)\Vert^2
        + g(x)
    \right](x)
    \\
    & =\nabla_x g(x) - \beta^{-1}\nabla \nabla^T g(x)^T \nabla g(x)
    \\
    &= 
    \left[
        I - \beta^{-1}\nabla \nabla g
    \right]^T(x)\nabla g(x);
    \\[1em]
    & \nabla_x \left[
        \text{env}_{h, \beta^{-1}} (
            x - \beta^{-1}\nabla g(x)
            )
    \right] 
    \\
    &= 
    \nabla_x [x - \beta^{-1}\nabla g(x)]^T(x)
    \nabla_x [\text{env}_{h, \beta^{-1}}](x - \beta^{-1}\nabla g(x))
    \\
    &= 
    [I - \beta^{-1}\nabla\nabla^T g(x)]^T(x) \beta
    \left(
        x - \beta^{-1}\nabla g(x) 
        - \text{prox}_{\phi, \beta^{-1}}
        (
        x - \beta^{-1}\nabla g(x)
        )
    \right),
\end{aligned}
$$

Adds these 2 terms together and we will obtain the results for the claim. We made use of the gradient of an moreau envelope. Recall from pre-requisite the the gradient of $\text{env}_{\alpha, f} = \alpha^{-1}[I - \text{prox}_{\alpha f}](x)$. 

**Remarks**

The forward and backwards envelope function and the original function share the same minimizer.  Not useful in the proof for the convergence of the method, But it's stated in \<Proximal Newton Methods for Convex Optimization\> by Alberto Bemporad. 


---
### **Envelope Minimum Compared to Function Value**
The minimum of the envelope is always less than or equal to the function value at the same point. 

#### **Thm | Envelope Minimum is lower than Function Value**
> We can quantify how much the FB envelope does better compare to the upper bound function at the same point, and it's given by: 
> $$
> \begin{aligned}
>     m^{+}(x) - m_x(x) \le \frac{-\beta}{2}\Vert x - P(x)\Vert^2, 
>     \;
>     P(x) =
>     \text{prox}_{h, \beta^{-1}} (x - \beta^{-1}\nabla g(x)). 
> \end{aligned}
> $$

**Proof**

We directly consider the fact that the upper bounding function is strongly convex with a constant of $\beta$, each means that for the minimizer $y^+$ of the upper bounding function we can obtain: 

$$
\begin{aligned}
    m_x(y^+) - m_x(x) &\le \frac{-\beta}{2}\Vert x -y^+\Vert^2
    \\
    m^+(x) - \underbrace{m_x(x)}_{g(x) + h(x)} &\le 
    \frac{-\beta}{2}\Vert x -y^+\Vert^2, 
\end{aligned}
$$
and this is direct by the strong convexity definition substituting in the optimal point that sets the gradient/subgradient equals to zero. 


---
### **Claim 5 | One step Descent**

> We define $f:= g + h$, then the difference between $f(P(x))$ and the envelope point $m^+(x)$ can be bounded, more > precisely: 
> 
> $$
> \begin{aligned}
>     f(P(x)) - m^+(x)\le 
>     \frac{-1}{2\beta} (1 - \beta^2)
>     \Vert \beta(x - P(x))\Vert^2, 
> \end{aligned}
> $$

Here we use the additional fact that the Hessian for $l(x)$ has a bounded operator norm that is $< \beta$. Using the a non-trivial property of smoothness [[../Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications]] of the upper envelope function $m^+(x)$ and the fact that $P(x)$ the projected gradient is the minimizer for the envelope function, we can derive the inequality 

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

An we focuses on only the RHS, we make the assumption is $\beta$ is larger than the maximum eigen values for the Hessian $\nabla \nabla^Tg(x)$ giving us (Which later we will see why this is important), then for the RHS: 

$$
\begin{aligned}
    & \frac{-\beta}{2}
    \Vert [\beta I - \nabla \nabla^Tg](x)\beta(x - P(x))\Vert^2
    \\
    \le& \frac{-\beta}{2} 
    \Vert \beta I - \nabla \nabla^Tg(x) \Vert^2 \Vert \beta(x - P(x))\Vert^2, 
\end{aligned}
$$

recall that the spectral norm for a matrix is the singular value, in the case when the matrix is symmetric, which it is in this case because it's the hessian and we assumed that $l(x)$ is $C^2$, then its spectral norm squared is equal to the maximum of all its eigenvalues. Now we assume that: 

$$
\begin{aligned}
    & \lambda_{\max}(\nabla \nabla^T g(x)) = L, \; 
    \lambda_{\min}(\nabla \nabla^T g(x)) = \lambda
    \\
    \implies
    & 
    \Vert [\beta I - \nabla\nabla^Tg](x)\Vert^2 \le \beta - \lambda, 
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

which completes the proof if we just move the beta into the norm. 


**Remarks**

Not what this is and whether this is useful or not. But it's stated in the IEEE paper: \<Proximal Newton Methods for Convex Composite Optimizations\> by Panagiotis Patrinos and Alberto Bemporad. 

---
### **Termination Conditions and Optimality**

> If proximal operator produces $x^{(k+ 1)} = x^{(k)}$ (it converges), then optimality condition for the original minimization problem is satisfied. 
 

**Proof**

$$
\begin{aligned}
    x^+ &= \underset{u}{\text{argmin}} \left(
        g(x) + \langle \nabla  g(x), u - x \rangle + \frac{\beta}{2}\Vert u - x\Vert^2 + h(u)
    \right)
    \\
    \mathbf 0 &\in \nabla g(x) + \beta(x^+ - x) + \partial h(x^+)
    \\
    G_\beta(x) - \nabla g(x) &\in \partial h(x^+)
    \\
    G_\beta(x) &\in \partial h(x^+) + \nabla g(x).
\end{aligned}
$$

Where $G_t(x) = \beta(x - x^+)$, it can be interpreted as the step size, or the error of the fixed point iterations on the prox gradient operator. Take notice that, if $x^+ = x$, it would mean current $x^+, x$ are fixed point of the proximal gradient operator, then the optimal solution is satisfied because zero belongs to the subgradient of $g(x) + h(x)$. 

---
### **A Monotone Method**

A point produced by the proximal gradient point step, will decrease the objective function. 

**Theorem: Stepsize that Ensures Objective Decrease**

> If $f$ is convex and Lipschitz smooth with constant $L$, then if a step size of $L^{-1} > \beta$ will give objective decrease at each step of the proximal gradient iteration. 

Let $x$ be any point, and $x^+ \in P(x)$, the output of the proximal gradient operator, then it will impose an objective decrease of the value of the function $g(x):= g(x) + h(x)$, more precisely we have the relation that: 

$$
\begin{aligned}
    f(x^+) - f(x) \le \left(\frac{L}{2} - \frac{1}{2\beta}\right)\Vert x - x^+\Vert^2, 
\end{aligned}
$$

where $L$ is the Lipschitz constant for the gradient of $g(x)$. To prove it we first consider the fact that $m_x(x^+)$ lower bounds the summed objective we have: 

$$
\begin{aligned}
    h(x^+)+ 
    \langle \nabla g(x), x^+ - x\rangle + \frac{1}{2\beta}\Vert x^+ - x\Vert^2 
    &\le h(x)
    \\
    h(x^+) - h(x) + \langle \nabla g(x) - x^+ - x\rangle 
    &\le \frac{-1}{2\beta} \Vert x^+ - x\Vert^2, 
\end{aligned}
$$

using the smoothness property of $g(x)$, we have: 

$$
\begin{aligned}
    g(x^+) - g(x) - \langle \nabla g(x), x^+ - x\rangle 
    & \le \frac{L}{2}\Vert x^+ - x\Vert^2
    \\
    \implies
    h(x^+) + g(x^+) - g(x) - h(x)
    &\le 
    \left(
        \frac{L}{2} - \frac{1}{2\beta}
    \right)\Vert x^+ - x\Vert^2
    \\
    f(x^+) - f(x) 
    &\le
    \left(
        \frac{L}{2} - \frac{1}{2\beta}
    \right)\Vert x^+ - x\Vert^2, 
\end{aligned}
$$

to assert decreasing objective, the multiplier on the RHS for the norm will have to be strictly less than zero, meaning that $L^{-1} > \beta$. The larger the Lipschitz constant, the more careful we have to be about the step size $\beta$. 

---
### **Convergence in the Convex Case**

See [[Proximal Gradient Convergence Rate]] for a proof of the convergence rate under the same assumptions that we had been discussing. Without the strong convexity assumption, the convergence rate for the algorithm is $\mathcal O(1/k)$ for the optimality measure. Under strong convexity assumptions and strong smoothness assumption, weaker convergence and stronger convergence results can be obtained under both cases. 

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

Take notice that this is exactly the same when compare to the gradient descent without the proximal operator. This algorithm with the Nesterov acceleration is provably better and its convergence proof is listed in [[Proximal Gradient with Momentum Accelerations]]. 


---
### **Extension and Augmentations**


#UNFINISHED: Fill out the extension of the proximal gradient method in the future! Just an overview would be great. 

**References**: First Order Optimizations from Amir Beck. 

---
### **Proximal Gradient In Relations to Other Algorithms**

Take notice that, the closest algorithm to the proximal gradient method is the 
projected subgradient method. For more details see: [[Projected Subgradient Method Convergence Proof]]. And here is a list of different names for the same methods: 

|Model|Name|
|---|---|
|$\min_{x\in \mathbb E}f(x)$|Gradient Method|
|$\min_{x\in C}f(x)$|Projected gradient|
|$\min_{x\in \mathbb E}\{f(x) - \lambda \Vert x\Vert_1\}$|ISTA|
|$\min_x{h(x)}$|Proximal Point Method|

Do note that, in the case where both functions $f,g$ are nonsmooth, parts of the convergence for the projected subgradient method will still apply due to the links between the proximal operator and the convex set projection operator. 




