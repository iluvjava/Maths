What kind of conditions are necessary for an input of an function. 
[Jacobian and Hessian](Jacobian%20and%20Hessian.md)


---
### **Optimality Conditions Characterized by Jacobian and Hessians**

**Definition: Twice Differentiable**

> A function $f: \mathbb R^n\mapsto R$ is twice differentiable at $x$ if we have: 
> 
> $$
> f(x + h) = f(x) + \nabla f(x)^T h + \frac{1}{2}h^T\nabla^2 f(x)h + o(||h||^2)
> $$

**Definition: Local Minimum**: 
> $\bar{x}$ is a local minimal for f if $\exists$ a small ball $B_\epsilon$, with $f(\bar{x}) \leq  f(x)$ for all $x\in B_\epsilon$. 


---
### **Optimality Conditions**

**Theorem: First order Optimality Condition**
> if $\bar{x}$ is a local min for $f$, then $\nabla f(\bar{x}) = \mathbf{0}$. 

**Proof**: 

By definition that $\bar{x}$ is the local minimum, then there exists a $t$ small enough such that: 

$$
\begin{aligned}
    & 0 \leq \frac{f(\bar{x} - t\nabla f(\bar{x})) - f(\bar{x})}{t}
    \\
	& \text{Using Calculus}: 
    \\ &
    \begin{aligned}
        f(\bar{x} - t\nabla f(\bar{x}))
        =&
         f(\bar{x}) + \nabla f(\bar{x})^T(-\nabla f(\bar{x}))t + o(||h||)
        \\
        =& f(\bar{x}) -t||\nabla f(\bar{x})||^2 + o(||h||)   
    \end{aligned}
    \\
    [1]\implies 
    &
    0
    \leq
    \frac{f(\bar{x} - t\nabla f(\bar{x})) - f(\bar{x})}
    {t}
    =
    -||\nabla f(\bar{x})||^2 + \frac{o(||h||)}{t} \leq \frac{o(||h||)}{t}
    \\
    t\rightarrow 0 \underset{[2]}{\implies} & 
    0 = ||\nabla f(\bar{x})|| = 0
\end{aligned}
$$

* \[1\]: Substitute $f(\bar x - t \nabla f(\bar x))$. 

* \[2\]:Taking the limit as $t\rightarrow 0$ and we keep in mind the non-negativity property of the norm, implying that the norm of the gradient has to be approaching zero. 

**Remarks**

The converse is generally not true. Recall from your basic calculus class. 

**Theorem: Second order Optimality _Necessary_ Conditions**

> If f is twice differentiable, then
> 1. $\bar{x}$ a local min for f --> $\nabla f(\bar{x}) = \mathbf{0}$ and $\nabla^2 f(\bar{x})$ is **positive semi-definite**. 

**Proof**: 

By previous theorem 1, the first component of the conclusion is automatically true. Consider the function value at $\bar x + tv$ at the point $\bar x$ for ANY $v$ and scalar $t$, using the second order approximation and the fact that $\bar x$ is the local minimum:

$$
\begin{aligned}
    & 0 \leq f(\bar{x} + tv) - f(\bar{x}) = \frac{t^2}{2}v^T\nabla^2 f(\bar{x}) v + o(t^2)
    \\
    [1]\implies
    & 0 \leq \frac{1}{2} v^T \nabla^2 f(\bar{x}) v + \frac{o(t^2)}{t^2}
    \\
    t\rightarrow 0 \implies &
    \frac{1}{2} v^T \nabla^2 f(\bar{x}) v \geq 0
\end{aligned}
$$

$\blacksquare$

**Theorem: Optimality Sufficient Conditions**:
> If the Hessian is Positive Definite (Stronger than positive semi-definite) at a point, then the point is a local minimum of the function. 

**Why Positive Semi-definite means optima for the given point?**

The intuitive understanding comes from the fact that, the Jacobian of the gradient is Symmetric (or the Hessian). By spectral theorem ([Hermitian Adjoint](../../AMATH%20584%20Numerical%20Linear%20Algebra/Matrix%20Theory/Hermitian%20Adjoint.md)), the matrix is diagonalizable with an orthogonal basis: $H = QDQ^T$. If the matrix is positive definite, The eigenvalues are all strictly positive. Consequently for every unit vector $v$, $v^THv$ is positive. Which means that Hessian is describing a function in which, for every direction I walk in space, the function is increasing in the direction. Since the function is already having a gradient of zero, then $f(x +v)- f(x) = 0 + v^THv + o(\Vert v\Vert^2)$, dividing by $v$ on both sides, we can choose $v$ small enough such that it's bounded by $v^THv$, the smallest eigenvalues of the matrix. Resulting in $f(x + v) - f(x) > 0$ for any $v$, proving that $x$ is the local minimum of the function. 



