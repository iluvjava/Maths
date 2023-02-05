[[Convexity Preserving Operations of Sets]]

---
### **Intro**

Using the convexity theories for sets (Or maybe some other things), we apply it to the epi-graph of the function so that it translates to the convexity of the functions. These results will be listed here: 

Let $\{f_i\}_{i}^m, f$ be a listed of augmented real functions mapping between euclidean spaces $\mathbb E, \mathbb V$, with $\mathcal A$ be a linear mapping between $\mathbb M\mapsto \mathbb E$, then

* $f(\mathcal Ax + b)$ is a convex function. (By linear mapping of convex sets)
* $\sum_{i = 1}^{m}\alpha_if_i(x)$ with $\alpha_i \; \ge 0 \forall i$ then the sum is convex as well. (By sets addition, where the sets are the epigraph of $f$)
* $\max_i\{f_i(x)\}$ is convex too. (By intersection of convex epigraph of $f_i$)
* Let $h_1, h_2$ be a convex proper augmented real function and a convex real-valued function, we have their infimal convolution $h_1\square h_2$ to be convex as well. 
* Let $f(x, y)$ be a function in a product space such that it's a convex function for both parameters, then minimizing one of the product space, eg: $\inf_x f(x, y)$, with $y$ fixed, then it's still a convex function. 

For the proofs for more interesting ones, see what is below. 

---
### **Affine Transformation of Input Parameters**

> $f:\mathbb E_1 \mapsto \mathbb E_2$ is a convex function, let $\mathcal A$ be a linear mapping $\mathbb E_3$ to $\mathbb E_1$ then $f(\mathcal Ax + b)$ is also a convex function. 

**Proof**

Composition of the form $f(\mathcal A x + b)$ is the equivalent of applying: 

$$
\begin{bmatrix}
    f(\mathcal Ax + b)
    \\
    x
\end{bmatrix}
= 
\begin{bmatrix}
    f(x)
    \\
    \mathcal A^{-1}(x) - b
\end{bmatrix}
$$

On the epigraph of $f(x)$, where $.^{-1}$ should be interpreted as the pre-image of the linear mapping. Because $f$ is convex, $\text{epi}(f)$ is also convex, and applying a linear transformation to a convex set preserves its convexity. This is shown in [[Convexity Preserving Operations of Sets]]. 

---
### **Point Wise limit of Convex function is Still Convex**

> Let $f_n\rightarrow f$ pointwise and all $f_n$ are convex functions, then the limit function $f$ is still convex. 

Let $x, y\in \text{dom}f$, then there exists $N$ such that for all $n \ge n$ we have $f_n(x), f_n(y) < \infty$ by the property of point wise convergence. Then Jensen's inequality yields that $\forall \lambda \in [0, 1]$: 

$$
\begin{aligned}
    f_n(\lambda x + (1 - \lambda)y) &\le \lambda f_n(x) + (1 - \lambda) f_n(y)
    \\
    \lim_{n\rightarrow \infty}
    f_n(\lambda x + (1 - \lambda)y) &\le \lim_{n\rightarrow \infty}\lambda f_n(x) + (1 - \lambda) f_n(y)
    \\
    \implies 
    f(\lambda x + (1 - \lambda)y) &\le \lambda f(x) + (1 - \lambda) f(y), 
\end{aligned}
$$

which is direct from the property of limit. 

**Remarks**

Lower Semi-continuous properties might not be preserved under the pointwise limit of functions. One of the example would be $|x|^p$ where $p > 1$. If we take the limit as $p\rightarrow \infty$, we have a parcular function that is $1$ at $|x| = 1$, $\infty$ at $|x| > 1$, and zero at $|x| < 1$. 

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

The case where $\lambda = 0, \lambda = 1$ is trivial. From the definition of $g(x)$, and **assuming that** $g(x_1), g(x_2) > -\infty$, then for all very small $\epsilon > 0$: 
$$
\begin{aligned}
    & \forall \epsilon > 0: 
    \\
    & \exists y_1 \in \mathbb E_2: f(x_1, y_1)\le g(x_1) + \epsilon < \infty
    \\
    & \exists y_2 \in \mathbb E_2: f(x_2, y_2)\le g(x_2) + \epsilon < \infty, 
\end{aligned}
$$

We take note that $y_1, y_2$ are very close to $\arg\inf_y(f(x_1, y)), \arg\inf_y(f(x_2, y))$ Next, using the fact that $f(x, y)$ is convex we obtained: 

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
    g(x_\lambda)\le f(x_\lambda, y_\lambda) & \le \lambda g(x_1) + (1 - \lambda)g(x_2) + \epsilon. 
\end{aligned}
$$

And therefore, the function $g(x)$ is convex for all $x_1, x_2 \in \mathbb E_1$ where $g(x_1), g(x_2) > -\infty$. **On the contrary, assuming that** $g(x_1)$ or $g(x_2)$ is $-\infty$, and WLOG, let $g(x_1) = -\infty$, then $g(x)$ would still be convex. Due to the fact that $g(x_1) = -\infty$, $g(x_\lambda) = -\infty$ as well (????). If $g(x_1) =\infty$: 

$$
\begin{aligned}
    & \forall M \exists y_1: f(x_1, y_1) < M
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

It's given that $f(x_1, y_1)$ is less than any $M$, at the same time, $f(x_2, y_2)$ is finite, therefore $f(x_2, y_2) \le -\infty$, which proves it. 

**Remarks**

The epsilon bound limits the choice of $y$, for which, it's possible that for some given $x_1$, there exists an $y_1$ that approaches infinity. In addition, **it's not clear whether $f$ needs to be closed or not**. I believe might not requires it. Secondedly, there is convex functions where, there exists $x$ such that $g(x) = \infty$, for example, activation function $\delta_C(x, y)$ where $C:=\{x: \Vert x\Vert\le y\}$. In addition, the fact that $g(x)\neq \infty$ is there to prevent nonsense like $\infty \le \infty$. 

Finally, there exists a epigraphical interpretations of Partial Minimizations in Dimitri's textbook. A partial minimization is projection of the epi-graph onto one of the Euclidean space (of a Euclidean product space). And by the property of the projection as a linear transform, we proved that it's still going to be convex. 

**Source**: \<First Oder Optimization Methods\> by SIAM, theorem 2.18

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

> Let $h_1$ be a *convex proper augmented real function* and let $h_2$ be a *convex real-valued function*, then their infimal convolution is a convex function. 

**Proof**

Both $h_1, h_2$ are convex, therefore their sum is also convex. Since $h_1$ is proper, and $h_1(x - u)<\infty$, we have: $h_1\square h_1(x) < \infty\;\forall x \in \mathbb E$. Using the partial minimization theorem, $h_1\square h_2$ is still convex. 


**Remarks**

When $h_1, h_2$ is convex, the addition between the epigraphs of $h_1, h_2$ will still be a convex function and it's equivalent to the infimal convolutions. It is implied that for a weaker assumption where, $h_1, h_2$  are both augmented real functions, the theorem might not fall through due to the $h_1\square h_2\neq \infty$ in addition, the converse is unclear. 

**Example: Distance Function to Any Set is CONVEX**

A distance function to any set, not necessarily closed can be expressed as an infimal convolution: 

$$
\begin{aligned}
    \text{dist}_C(x) &= \inf_{y\in C} \{\Vert x - y\Vert\}
    \\
    &= \inf_{y\in C} \{\Vert x - y\Vert + \delta_C(y)\}
    \\
    &= \delta_C\square \Vert \cdot \Vert
\end{aligned}
$$

$\delta_C$ is convex and it's an augmented real function and $\Vert \cdot \Vert$ is convex and a real-valued function. Applying infimal convolution preserving property, the distance function is convex. 


**Source**
Proof taken from \<First Order Optimizations\> by SIAM, theorem 2.19


---
### **Monotone Convex Compositions**

> Let $h$ be $\mathbb{R}_n \mapsto \bar{\mathbb R}$ that is non-decreasing (More on this later) and convex. Let $g(x) = [f_1(x)\; f_2(x)\; \cdots \; f_n(x)]^T$ where $f_i(x)$ are all convex, then the composition $h(g(x))$ is still convex. 

**Definitions: Monotonic Multivariables Functions** 

The function $h$ is monotonic if $x \le y$ where $\le$ denotes every element of $x$ is less than $y$ and $x, y\in \mathbb R$, then $h(x) \ge f(y)$. Whis definition is also equivalent to $f(x + \epsilon \mathbf e_i) \ge f(x)$ for any given $x$ with $\epsilon \ge 0$. These 2 definitions are equivalent. 

**Proof**

The proof is direct by considering the convexity for each $f_i$: 

$$
\begin{aligned}
    & \forall x, y \in \mathbb E, 1\le i \le n, \lambda\in [0, 1] : f_i(\lambda x + (1 - \lambda)y) \ge \lambda f_i(x) + (1 - \lambda)f_i(y)
    \\
    & g(x) := [f_1\; f_2\; \cdots \; f_n](x)
    \\
    \implies &
    g(\lambda x + (1 - \lambda)y) \ge \lambda g(x) + (1 - \lambda)g(x)
    \\
    [1]\implies & 
    h(g(\lambda x + (1 -\lambda)y)) \ge h(\lambda g(x) + (1 - \lambda)g(x))
    \\
    [2]\implies &
    h(\lambda g(x) + (1 -\lambda)g(y)) \ge \lambda h(g(x)) + (1 - \lambda) h(g(y))
    \\
    \implies & 
    h(g(\lambda x + (1 -\lambda)y)) \ge \lambda h(g(x)) + (1 - \lambda) h(g(y))
\end{aligned}
$$

* [1]: By the monotonicity of $h$
* [2]: By the convexity of $h$. 

The proof is done. 

**Remarks**: 

* **Monotonicity:** 
  * The monotonicity can be extended to any type of partial ordering for $\mathbb E$, and I think there is more. 

* **Quasi Convex**
  * A weaker theorem regarding the construction of quasi convex can be find: [here](https://web.stanford.edu/~boyd/papers/pdf/dqcp.pdf). It stated that the composition between any monotone functions (which they give a different definition of) with a convex function produces what they referred to as: "Disciplined Quasi Convex Functions". 


**Source:**
From a subgradient lecture [here](http://www.seas.ucla.edu/~vandenbe/236C/lectures/subgradients.pdf). Further info about disciplined quasi-convex can be find [here](https://web.stanford.edu/~boyd/papers/pdf/dqcp.pdf). 

