- [Newton's Method 1D](../MATH%20464%20Numerical%20Analysis/Newton's%20Method%201D.md)
- [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md)

---
### **Intro**

We derive and use the newton's method for optimizations and we show its different kind of convergence. To derive the algorithm, we make the assumptions that 

**Assumptions**
> 1. $f$ is a second differentiable convex function with positive definite hessian matrix at some point $x$ denoted by $H_f[x]\succeq \beta$, $\beta > 0$. This gives the function a unique minimum and an positive definite Hessian everywhere. 
> 2. The Hessian is also a Lipschitz continuous operator around our minimizer $x_*$, which means that it has $\Vert H_f[x] - H_f[y]\Vert\le L\Vert x - y\Vert$ for all $x, y \in \mathbb R^n$. 

Then by convexity and positive definiteness we conclude that 

$$
\begin{aligned}
    f(x) &\le f(x) + \langle \nabla f(x), y - x\rangle + 
    \langle y - x, H_f[x](y - x)\rangle \quad \forall x, y \in X
    \\
    f(x) &\le 
    f(x)  + \min_{y} \left\lbrace
       \langle \nabla f(x), y - x\rangle + 
       \langle y - x, H_f[x](y - x)\rangle
    \right\rbrace, 
\end{aligned}
$$

the minimizer of the convex upper envelope will produce the Newton's method by 

$$
\begin{aligned}
    \mathbf 0 &= \nabla f(x) + H_f[x](y - x)
    \\
    y - x &= -H_f[x]\nabla f(x)
    \\
    y &= x - H_f[x] \nabla f(x), 
\end{aligned}
$$
which produces the newton's method. The newton's method iterates a produced by the scheme $x^{(k + 1)}= x^{(k)} - H_f[x]\nabla f(x^{(k)})$. 


---
### **Quadratic Convergence of the Iterates**

The method produces sequence of $x^{(k)}$ that converges quadratically with $\Vert x^{(k)} - x_*\Vert$ having a quadratic convergence. 

---
### **Quadratic Convergence of the Gradients**