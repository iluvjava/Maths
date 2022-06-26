[[Convexity Preserving Operations of Sets]]

---
### **Intro**

Using the convexity theories for sets (Or maybe some other things), we apply it to the epi-graph of the function so that it translates to the convexity of the functions. These results will be listed here: 

Let $\{f_i\}_{i}^m, f$ be a listed of augmented real functions mapping between euclidean spaces $\mathbb E, \mathbb V$, with $\mathcal A$ be a linear mapping between $\mathbb M\mapsto \mathbb E$, then

* $f(\mathcal Ax + b)$ is a convex function. (By linear mapping of convex sets)
* $\sum_{i = 1}^{m}\alpha_if_i(x)$ with $\alpha_i \; \ge 0 \forall i$ then the sum is convex as well. (By sets addition, where the sets are the epigraph of $f$)
* $\max_i\{f_i(x)\}$ is convex too. (By intersection of convex epigraph of $f_i$)

For more complicated ones, see what is below. 

---
### **Affine Transformation of Input Parameters**

> $f:\mathbb E_1 \mapsto \mathbb E_2$ is a convex function, let $\mathcal A$ be a linear mapping $\mathbb E_3$ to $\mathbb E_1$ then $f(\mathcal Ax + b)$ is also a convex function. 

**Proof**

# TODO: Add Proofs




---
### **Convexity Under Partial Minimizations**

> Let $f$ be $\mathbb E_1 \times \mathbb E_2 \rightarrow (-\infty, \infty]$ and *convex*, so that the function is a proper augmented real function, and it has the property that is: 
> 
> $$
> \forall x \in \mathbb E_1 \exists y \in \mathbb E_2: f(x, y) < \infty
> $$
> 
> Then define: 
> 
> $$
> g(x) \equiv \min_{y\in \mathbb E_1} f(x, y) < \infty
> $$
> 
> Then $g(x)$ is a convex function. 

**Proof**

To prove that $g(x)$  is convex, WST: 

$$
\begin{aligned}
    \forall x_1, x_2 \in \mathbb E_1, \lambda \in [0, 1]: 
    g(\lambda x_1 + (1 - \lambda) x_2) \le 
        \lambda g(x_1) + (1 - \lambda)g(x_2)
\end{aligned}
$$

The case where $\lambda = 0, \lambda = 1$ is trivial. From the definition of $g(x)$, and **assuming that** $g(x_1), g(x_2) > -\infty$, then: 
$$
\begin{aligned}
    & \forall \epsilon > 0: 
    \\
    & \exists y_1 \in \mathbb E_2: f(x_1, y_1)\le g(x_1) + \epsilon < \infty
    \\
    & \exists y_2 \in \mathbb E_2: f(x_2, y_2)\le g(x_2) + \epsilon < \infty
\end{aligned}
$$

Next, using the fact that $f(x, y)$ is convex we obtained: 

$$
\begin{aligned}
    x_\lambda &:= \lambda x_1 + (1 - \lambda)x_2
    \\
    y_\lambda &:= \lambda y_1 + (1 - \lambda)y_2
    \\
    f(x_\lambda, y_\lambda) & \le \lambda f(x_1, y_1) + (1 - \lambda)f(x_2, y_2)
    \\
    f(x_\lambda, y_\lambda) & \le \lambda (g(x_1) + \epsilon) + (1 - \lambda)(g(x_2) + \epsilon)
    \\
    f(x_\lambda, y_\lambda) & \le \lambda (g(x_1) + \epsilon) + (1 - \lambda)(g(x_2) + \epsilon)
    \\
    f(x_\lambda, y_\lambda) & \le \lambda g(x_1) + (1 - \lambda)g(x_2) + \epsilon
    \\
    g(x_\lambda)\le f(x_\lambda, y_\lambda) & \le \lambda g(x_1) + (1 - \lambda)g(x_2) + \epsilon
\end{aligned}
$$

And therefore, the function $g(x)$ is convex for all $x_1, x_2 \in \mathbb E_1$ where $g(x_1), g(x_2) > -\infty$. On the contrary, assuming that $g(x_1)$ or $g(x_2)$ is $-\infty$, and WLOG, let $g(x_1) = -\infty$, then $g(x)$ would still be convex. Due to the fact that $g(x_1) = -\infty$, $g(x_\lambda) = -\infty$ as well. If $g(x_1) =\infty$ then: 

$$
\begin{aligned}
    & \forall M: 
    \\
    & \exists y_1: f(x_1, y_1) < M
\end{aligned}
$$

Consider the fact that $f$ is convex, then we have: 

$$
\begin{aligned}
    & f(x_\lambda, y_\lambda) \le \lambda f(x_1, y_1) + (1 - \lambda)f(x_2, y_2)
    \\
    & \exists y_2: f(x_2, y_2) < \infty
    \implies f(x_\lambda, y_\lambda) < \infty \text{ at least}
\end{aligned}
$$

I's given that $f(x_1, y_1)$ is less than any $M$, at the same time, $f(x_2, y_2)$ is finite, therefore $f(x_2, y_2) \le -\infty$, which proves it. 

**Remarks**

The epsilon bound limits the choice of $y$, for which, it's possible that for some given $x_1$, there exists an $y_1$ that approaches infinity. In addition, **it's not clear whether $f$ needs to be closed or not**. I believe might not requires it. Secondedly, there is convex functions where, there exists $x$ such that $g(x) = \infty$, for example, activation function $\delta_C(x, y)$ where $C:=\{x: \Vert x\Vert\le y\}$. 

In addition, the fact that $g(x)\neq \infty$ is there to prevent nonsense like $\infty \le \infty$. 

Finally, there exists a epigraphical interpretations of Partial Minimizations by which, we skip it for discussion. 

**Source**: \<First Oder Optimization Methods\> by SiAM. 




---
### **Corollary: Infimal Convolutions Preserves Convexity**

**Definition: Infimal Convolution**

> Define the infimal convolution between 2 proper functions: $h_1, h_2$. Giving us: 
> 
> $$
> \begin{aligned}
>    h_1\square h_2(x) = \min_{u \in \mathbb E} 
>    \{h_1(u) + h_2(x - u)\}
> \end{aligned}
> $$


**Theorem: Preservation of Convexity Over Infimal Convolution**

> Let $h_1$ be a *convex proper augmented real function* and let $h_1$ be a *convex real-valued function*, then their infimal convolution is a convex function. 

**Proof**

Both $h_1, h_2$ are convex, therefore their sum is also convex. Since $h_1$ is proper, and $h_1(x - u)<\infty$, we have: $h_1\square h_1(x) < \infty\;\forall x \in \mathbb E$. Using the partial minimization theorem, $h_1\square h_2$ is still convex. 



**Remarks**

When $h_1, h_2$ is convex, the addition between the epigraphs of $h_1, h_2$ will still be a convex function and it's equivalent to the infimal convolutions. It is implied that for a weaker assumption where, $h_1, h_2$  are both augmented real functions, the theorem might not fall through, in addition, the converse is unclear. 

**Source**
Proof taken from \<First Order Optimizations\> by SIAM. 
