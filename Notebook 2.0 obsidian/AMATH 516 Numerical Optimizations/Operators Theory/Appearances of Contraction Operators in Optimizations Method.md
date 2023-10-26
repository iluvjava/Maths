- [Banach Contraction in Metric Space](../../MATH%20601%20Functional%20Analysis,%20Measure%20Theory/Functional%20Spaces/Banach%20Contraction%20in%20Metric%20Space.md), 
- [Characterizing Functions for Optimizations](../Background/Characterizing%20Functions%20for%20Optimizations.md). 
- [Subgradient Intro](../Non-Smooth%20Calculus/Subgradient%20Intro.md)
- [Strong Convexity, Equivalences and Implications](../Strong%20Convexity,%20Equivalences%20and%20Implications.md)
---
### **Intro**

A fixed point iterations can be applied to solve equations in fixed point form. It finds the root for equation of the form $x = Tx$ where $T$ is a contractive mapping. Recall that a function $g$ is strongly convex when $g(x) - (1/2)\Vert x\Vert$ is a convex function. The fixed point iterations tries to root find the equation $\mathbf 0 = \nabla f(x)$, which is equivalent to solving the equation $x = x^+ - \beta \nabla f(x^+)$. Here we are in euclidean space, which is a special type of metric space.

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

Next, we prove that if a function is strongly convex and has Lipschitz gradient, then the gradient operator representing a gradient descent on such a function would be a contraction. By Lipschitz smoothness of the gradient, we trade off the need for proximal operator, and we still get linear convergence using the addition of smoothness. 

---
#### **Thm | Contraction Formed by Gradient Descent Operators on Lipschitz Smooth Strong Convex Functions**
> The gradient descent operator for a strong convex and smooth function is a contraction operator. More specifically let $f$ be Lipscthiz smooth with parameter $L$, and strongly convex with $\beta$. Let the gradient operator to be $T = I - \eta \nabla f$, then for all $\eta \in (0, 2/L)$, the operator $T$ is a contraction with ratio $\max(|1 - \eta L|, |1 - \eta \beta|)$. 

**Proof**

$\nabla f$ is strongly monotone and Lipschitz bounded and hence 

$$
\begin{aligned}
    \beta\Vert y - x\Vert^2
    & \le 
    \langle \nabla f(y) - \nabla f(x), y -x\rangle 
    \le 
    L \Vert y - x\Vert^2 
    \\
    -\eta L \Vert y - x\Vert^2 &\le 
    -\langle \eta\nabla f(x) - \eta\nabla f(y), y -x \rangle \le 
    -\eta \beta \Vert y - x\Vert^2
    \\
    (1 - \eta L)\Vert y - x\Vert^2 &\le 
    \langle (y - x)- \eta(\nabla f(y) - \nabla f(x)), y - x\rangle \le 
    (1-\eta \beta) \Vert y - x\Vert^2
    \\
    &\textcolor{gray}{
        \triangleright \text{let } \hat f = \Vert \cdot\Vert^2/2 - \eta \nabla f(\cdot)
    }
    \\
    (1 - \eta L)\Vert y - x\Vert^2 
    &\le 
    \langle \nabla \hat f(y) - \nabla \hat f (y), y -x\rangle 
    \le 
    (1 - \eta \beta)\Vert y - x\Vert^2. 
\end{aligned}
$$

We make $Q \ge \max(|1 - \eta L|, |1 - \eta \beta|)$, and $l = (1 - \eta L), u = (1 - \eta \beta)$. Observe that if $\phi(x) = Q \Vert \cdot\Vert^2/2 - \hat f(x)$ would be a $Q - l$ smooth because

$$
\begin{aligned}
    - u \Vert x - y\Vert ^2 
    &\le -\langle \nabla \hat f(y) - \nabla \hat f(x), y-x\rangle
    \le 
    -l \Vert y - x\Vert^2
    \\
    0 &\le \left\langle 
        Q(y - x) - \left(\hat f(y) - \hat f(x)\right), y - x 
    \right\rangle 
    \le 
    (Q - l)\Vert y - x\Vert^2
    \\
    0 &\le
    \left\langle 
        \nabla \phi(y) - \nabla \phi(x), y - x 
    \right\rangle 
    \le 
    (Q - l)\Vert y - x\Vert^2, 
\end{aligned}
$$

fuction $\phi$ would be $Q - l$ smooth hence $\Vert \nabla \phi (y) - \nabla \phi(x)\Vert^2 \le (Q - l)^2\Vert y - x\Vert^2$, the LHS equals to

$$
\begin{aligned}
    \Vert \nabla \phi(y) - \nabla \phi(x)\Vert^2 
    &= 
    Q^2\Vert y - x\Vert +
    \Vert \nabla \hat f(y) - \nabla \hat f(x)\Vert^2 
    - 2\left\langle Q(y - x), \nabla \hat f(y) - \nabla \hat f(x) \right\rangle
    \\
    & \textcolor{gray}{\triangleright\text{strong convexity has :}}
    \\
    & 
    \\
    & \ge \left(
        1 - \frac{2 Q}{l}
    \right)\Vert \nabla \hat f(y) - \nabla \hat f(x)\Vert^2 + Q^2\Vert y - x\Vert^2

\end{aligned}
$$




**Remarks**

The situation would change drastically if we are looking at infinite dimension with different norms for strong convexity and Lipschitz smoothness of the gradient. If we had different type of norm in $\mathbb R^n$ for smoothness and strong convexity, the only thing differs would be $\beta, L$.


---
### **Corollary | Proximal Gradient Method**
> Let $f = g + h$ where $g$ is a smooth function with Lipschitz Gradient and $\beta$-strongly convex, let $h$ be convex with proximal operator. Then the proximal gradient operator is a contraction, with the same ratio as it was in the case of the gradient operator $\min(|1 - \eta L|, |1 - \eta \beta|)$, for $\eta\in (0, 2/L)$.  



**Proof**

The proximal gradient operator for this problem is $\text{prox}_{\eta g}\circ [I - \eta \nabla f]$, and this operator is a contraction because the prox operator is None Expansive and the gradient operator is a contraction, as proved previously. For more information about the none expansiveness of the proximal operator, see [Moreau Envelope and Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Proximal%20Mapping.md) for more information. 