- [Banach Contraction in Metric Space](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md), 
- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md). 
- [Subgradient Intro](../Non-Smooth%20Calculus/Subgradient%20Intro.md)
- [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md)
---
### **Intro**

A fixed point iterations can be applied to solve equations in fixed point form. It finds the root for equation of the form $x = Tx$ where $T$ is a contractive mapping. Recall that a function $g$ is strongly convex when $g(x) - (1/2)\Vert x\Vert$ is a convex function. The fixed point iterations tries to root find the equation $\mathbf 0 = \nabla f(x)$, which is equivalent to solving the equation $x = x - \beta \nabla f(x)$. Here we are in euclidean space, which is a special type of metric space. 

**Theorem | Strong Convexity make Proximal Point Contractive**
> The proximal point method considers a form of fixed point iterations: 
> $$
>   \forall n \in \N: x_{n + 1} = (\partial f + I)^{-1}x_n, 
> $$
> The sequence always converge when the function $f$ is strongly convex with constant $\beta$ and it will converge to the global minimum. 

**Proof**

Let $u, v$ be in Euclidean space $\mathbb E$ then there exists $x, y$ such that $u \in \partial f(x) + x, v\in \partial f(x) + y$ (<mark style="background:#CACFD9A6;">By unknown facts</mark>, Max Monotone Operators related), Let $T$ be the resolvent to $\partial f$ then $Tu = x, Tv = y$. Then: 
$$
\begin{aligned}
    (1 - \beta)\Vert x - y\Vert &= \Vert x - y\Vert - \beta\Vert x - y\Vert
    \\
    & \le 
    \langle x - y, x - y\rangle + 
    \langle \partial f(x) - \partial f(y), x - y\rangle \quad \text{Strong Monotone}
    \\
    &= 
    \langle \partial f(x) + x - \partial f(y) - y, x - y\rangle
    \\
    \implies 
    (1 + \beta)\Vert Tu - Tv\Vert^2 &\le 
    \langle u - v, Tu - Tv\rangle \le \Vert u - v\Vert\Vert Tu - Tv\Vert
    \\
    (1 + \beta)\Vert Tu - Tv\Vert &\le 
    \Vert u - v\Vert
    \\
    \Vert Tu - Tv\Vert &\le \frac{1}{1 + \beta} 
    \Vert u - v\Vert, 
\end{aligned}
$$

And by the fact that $\beta > 0$ for any strongly convex functions, the above fixed point iterations on the resolvent of subgradient is a contraction and it will converge to a unique minimum from Banach Contraction Theorems in metric space. 


**References**:

Prof Wang's Math 328 class, lecture 5. 


---
### **Gradient Descent on Smooth and Strongly Convex Functions**

Next, we prove that if a function is strongly convex and it's also smooth, then there exists


#### **Thm | Contraction Formed by Gradient Descent Operators on Lipschitz Smooth Strong Convex Functions**
> The gradient descent operator for a strong convex and smooth function is a contraction operator. More specifically let $f$ be Lipscthiz smooth with parameter $L$, and strongly convex with $\beta$. Let the gradient operator to be $T = I - \eta \nabla f$, then for all $\eta \in (0, 2/L)$, the operator $T$ is a contraction with ratio $\min(|1 - \eta L|, |1 - \eta \beta|)$. 

**Proof**

We may directly consider expanding the norm of the gradient operator over any 2 points $x, y \in \mathbb R^n$, with the [co-coersivenss of Lipschitz Smooth function](../Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) $[[1]]: \langle \nabla f(y) - \nabla f(x), y -x\rangle \ge L^{-1}\Vert \nabla f(x) - \nabla f(y)\Vert^2$ giving us: 

$$
\begin{aligned}
    \Vert 
        [I - \eta \nabla f](y) - [I - \eta \nabla f](x)
    \Vert^2 
    &= 
    \Vert 
        (y - x) - \eta (\nabla f(y) - \nabla f(x))
    \Vert^2
    \\
    & \le 
    \Vert y - x\Vert^2 + \eta^2 \Vert \nabla f(y) - \nabla f(x)\Vert^2
    -
    2\eta \langle \nabla f(y) - \nabla f(x), y- x\rangle
    \\
    [ [1] ] 
    \implies 
    & \le \Vert y - x\Vert^2 + \eta^2 \Vert \nabla f(y) - \nabla f(x)\Vert
    - \frac{2\eta }{L} \Vert \nabla f(x) - \nabla f(y)\Vert^2 
    \\
    & \le \Vert y - x\Vert^2 
    + \eta(\eta - 2 /L) \Vert \nabla f(y) - \nabla f(x)\Vert^2 \rightarrow [[2]]
\end{aligned}
$$

Depending on the sign of the quantity $(\eta^2 - 2\eta/L)$, we need to invoke different conditions to upper and lower bound it. Firstly if we assume that the quantity is larger than zero, which means we want an upper bound. And the upper bound can be provided by the Lipscthiz constant for the gradient operator. By the non-negativity assumption, we would made the restriction on the step size parameter giving us: 

$$
\begin{aligned}
    \eta(\eta - 2/L) &\ge 0
    \\
    \eta  - 2/L &\ge 0
    \\
    \eta &\ge 2/L, 
\end{aligned}
$$

With the lipschitz condition for the gradient operator we have $\Vert \nabla f(y) - \nabla f(x)\Vert \le L\Vert y - x\Vert$ then the upper bound \[\[2\]\] simplifies to 
$$
\begin{aligned}
    {[[2]]} &\le  \Vert y - x\Vert^2 
    + (\eta^2 - 2\eta/L) L^2 \Vert y - x\Vert^2
    \\
    &= (1 + \eta^2 L^2 - 2nL)\Vert y - x\Vert^2
    \\
    &= (1 - \eta L)^2 \Vert y - x\Vert^2 \rightarrow [[2.1]]. 
\end{aligned}
$$

and when the condition of $\eta \ge 2 /L$ is false, the upper bound will be a lower bound instead. Next, to gain another upper bound, we consider a different sign for the coefficient, consider 

$$
\begin{aligned}
    \eta(\eta - 2/L) &\le 0
    \\
    \eta &\le 2/L, 
\end{aligned}
$$

then we may use an lower bound from the strong convexity to create an upper bound for the constant. Strong convexity gives Lipz lower bound $\Vert \nabla f(y) - \nabla f(x)\Vert^2 \ge \beta^2 \Vert y - x\Vert^2$, with that we make 

$$
\begin{aligned}
   {[[2]]} &\le \Vert y - x\Vert^2 + (\eta^2 - 2\eta/L) \beta^2 \Vert y - x\Vert^2
    \\
    &\le (1 + \eta^2\beta^2 - 2\eta\beta^2/L) \Vert y - x\Vert^2 
    \\
    & \le (1 + \eta^2 \beta - 2\eta \beta/L)\Vert y - x\Vert^2,  \text{by } \beta/L \le 1
    \\
    &= (1 - \eta\beta)^2\Vert y - x\Vert^2 \leftarrow [[2.2]], 
\end{aligned}
$$

and when condition $\eta \le 2/L$ is not true, the upper bound then became a lower bound. Since the two conditions on $\eta$ are all possible values of eta, the maximum of the 2 bound will form the upper bound for the Lipschitz index, which is given by 

$$
\begin{aligned}
    \Vert Ty - Tx\Vert^2 
    &\le \max((1 - \eta L)^2, (1 - \eta \beta)^2)\Vert y - x\Vert^2
    \\
    \implies 
    \Vert Ty - Tx\Vert 
    &\le \max(|1 - \eta L|, |1 - \eta \beta|)\Vert y - x\Vert^2. 
\end{aligned}
$$

Next, we seek for a value of $\eta$ such that the Lipschitz constant gives a contraction. 

$$
\begin{aligned}
    |1 - \eta L| &< 1
    \\
    -1 < 1 - \eta L &< 1
    \\
    -2 - \eta L & < 0
    \\
    0 < \eta L &< 2
    \\
    0 < \eta  &< 2/L, 
\end{aligned}
$$

simultaneously 

$$
\begin{aligned}
    |1 - \eta \beta| &< 1
    \\
    -1 < 1 - \eta\beta &< 1
    \\
    0 < \eta \beta &< 2
    \\
    0 < \eta &< 2/\beta, 
\end{aligned}
$$

Hence it would be the case that $0 < \eta < \min(2/L, 2/\beta)$, however, we take note that $L$ is the upper bound for the Lipschitz constant and $\beta$ is the lower bound, resulting in $\min(2/L, 2/\beta) = 2/L$, taking the value of the smaller quantities. Therefore, the theorem is proven. 