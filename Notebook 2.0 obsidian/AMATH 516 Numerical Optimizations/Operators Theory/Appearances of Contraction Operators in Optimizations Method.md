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
    (1 + \beta)\Vert x - y\Vert^2 &= \Vert x - y\Vert^2 - \beta\Vert x - y\Vert^2
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

**Remarks**

The convergence can make arbitrarily fast by a choice of stepsize $\eta$ for the resolvent, so, $(I - \eta\partial f)^{-1}$ gives faster convergence by a choice of $\eta$ that is huge. The above presentation is simplified by ignoring a factor $\eta$. 
Not ignoring it makes 

$$
\begin{aligned}
    \left \Vert 
        (I + \eta \partial f)^{-1}x - (I + \eta \partial f)^{-1} y
    \right\Vert
    \le 
    (1 + \beta \eta )^{-1}\Vert x - y\Vert, 
\end{aligned}
$$

for all $x, y$. 

---
### **Gradient Descent on Smooth and Strongly Convex Functions**

Next, we prove that if a function is strongly convex and has Lipschitz gradient, then the gradient operator representing a gradient descent on such a function would be a contraction. By Lipschitz smoothness of the gradient, we trade off the need for proximal operator, and we still get linear convergence using the addition of smoothness. 

---
#### **Thm | Contraction Formed by Gradient Descent Operators on Lipschitz Smooth Strong Convex Functions**
> The gradient descent operator for a strong convex and smooth function is a contraction operator. More specifically let $f:\mathcal H\mapsto \mathbb R$ be a $L$-Lipschitz smooth function and strongly convex with $\beta > 0$. Let the gradient operator to be $T = I - \eta \nabla f$, then for all $\eta \in (0, 2/L)$, the operator $T$ is a contraction with ratio $\max(|1 - \eta L|, |1 - \eta \beta|)$. 

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
        \triangleright\;  \text{let } \hat f = \Vert \cdot\Vert^2/2 - \eta \nabla f(\cdot)
    }
    \\
    (1 - \eta L)\Vert y - x\Vert^2 
    &\le 
    \left\langle 
        \nabla \hat f(y) - \nabla \hat f (y), y -x
    \right\rangle 
    \le 
    (1 - \eta \beta)\Vert y - x\Vert^2. 
\end{aligned}
$$

We make $Q \ge \max(|1 - \eta L|, |1 - \eta \beta|)$, and $l = (1 - \eta L), u = (1 - \eta \beta)$, transforming the above 2 sided smoothness condition of $\hat f$ into 

$$
\begin{aligned}
    -Q\Vert y - x\Vert^2 
    &\le 
    \left\langle 
        \nabla \hat f(y) - \nabla \hat f (y), y -x
    \right\rangle 
    \le 
    Q\Vert y - x\Vert^2
    \\
    0 
    &\le 
    \left\langle 
        Q(y- x) + \nabla \hat f(y) - \nabla \hat f(x), y - x
    \right\rangle
    \le 2Q \Vert y - x\Vert^2
    \\
    & \textcolor{gray}{
	    \triangleright  \; \text{let } \phi(x) := Q\frac{\Vert x\Vert^2}{2} + \hat f(x)
    }
    \\
    0 &\le \left\langle 
        \nabla \phi(y) - \nabla \phi(x), y - x
    \right\rangle \le 2Q \Vert y - x\Vert^2, 
\end{aligned}
$$

hence $\phi$ is a $2Q$-smooth function. Using [the co-coersivity](../Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) of smooth function we have 

$$
{\small
\begin{aligned}
    2Q\left\langle 
        \nabla \phi(y) - \nabla \phi(x), y - x
    \right\rangle
    &\ge 
    \Vert \nabla \phi(y) - \nabla \phi(x)\Vert^2
    \\
    2Q 
    \Vert Q(y - x)\Vert^2
    + 
    2Q^2\left\langle y-x, \nabla \hat f(y) - \nabla \hat f(x)  \right\rangle
    &\ge 
    Q^2\Vert y - x\Vert^2 + 
    \left\Vert \nabla \hat f(y) - \nabla \hat f(x)\right\Vert^2
    + 
    2Q^2\left\langle y - x, \nabla f \hat f(y) - \nabla \hat f(x)\right\rangle
    \\
    2Q^2\Vert y - x\Vert^2 &\ge 
    Q^2\Vert y - x\Vert^2 + \left\Vert
        \nabla \hat f(y) - \nabla \hat f(x)
    \right\Vert^2, 
\end{aligned}
}
$$

And therefore, the gradient of $\hat f$, has a Lipschitz constant $Q$. The minimum valid value of $Q$ is $\max(|u|, |l|)$. To see whether this can be a contraction, we solve for the values of step size $\eta$ such that it's a contraction. Consider 

$$
\begin{aligned}
    & | 1 - \eta L | < 1 
    \\
    & 1 - \eta L \in (-1, 1)
    \\
    & -\eta L \in (-2, 0)
    \\
    & \eta \in (0, 2/L)
\end{aligned}
$$

simultaneously
$$
\begin{aligned}
    & |1 - \eta \beta| < 1
    \\
    & -\eta \beta \in (-2, 0)
    \\
    & \beta \in (0, 2/\beta), 
\end{aligned}
$$

by $\beta < L$, we have valid range for parameter $\eta \in (0, 2/L)$ by taking the intersections of the sets. 


**Remarks**

The proof definitely won't work if we have other type of norms. Not sure what happens in other spaces. In finite Euclidean space, this theorem works solidly. Finally, the step size that minimize the contraction ratio is $2/(L + \beta)$, which is different from $1/L$, the step sizes for maximum descent of a smooth function. It's slightly larger in this case. 

To see the convergence of the function value, recall that for a L smooth function, we have upper bound from the iterates on the function values $f(x) - f^* \le \frac{L}{2}\Vert x - \bar x\Vert^2$, where $\bar x$ is a fixed point for the gradient operator $I - \eta\nabla f$. The convergence rate of the iterates follows recursively by the contraction. 


#### **Thm | The best Contraction Ratio**
> The best contraction ratio is $(\kappa - 1)/(\kappa + 1)$ where $\kappa = L/\alpha$, $L$ is the smoothness constant and $\alpha$ would be the strong convexity value. The best contraction ratio is attained by the value of $\eta = 2/(L + \beta)$. 

**Proof**

The best step-size is when $|1 - \eta L|$ intersects with $|1 - \eta \beta|$. The curve $|1 - \eta L|$ meets the x-axis at $1/L$, coming before $\beta$, hence we solve $1 - \eta \beta = \eta L - 1$, giving us $\eta = 2/(\beta + L)$. And then 

$$
\begin{aligned}
    |1 - 2L/(\beta + L)| &= |\beta + L - 2L|/(\beta + L) = (L - \beta)/(L + \beta)
    \\
    &= \frac{L/\beta - 1}{L/\beta + 1} = \frac{\kappa -1}{\kappa + 1}, 
\end{aligned}
$$

and the completes the proof for the claim. 

---
### **Corollary | Proximal Gradient Method**
> Let $f = g + h$ where $g$ is a smooth function with Lipschitz Gradient and $\beta$-strongly convex, let $h$ be convex with proximal operator. Then the proximal gradient operator is a contraction, with the same ratio as it was in the case of the gradient operator $\min(|1 - \eta L|, |1 - \eta \beta|)$, for $\eta\in (0, 2/L)$.  




**Proof**

The proximal gradient operator for this problem is $\text{prox}_{\eta g}\circ [I - \eta \nabla f]$, and this operator is a contraction because the prox operator is None Expansive and the gradient operator is a contraction, as proved previously. For more information about the none expansiveness of the proximal operator, see [Moreau Envelope and Convex Proximal Mapping](Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md) for more information. 