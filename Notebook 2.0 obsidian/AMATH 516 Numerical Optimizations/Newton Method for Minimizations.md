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
    f(y) &\le f(x) + \langle \nabla f(x), y - x\rangle + 
    \langle y - x, H_f[x](y - x)\rangle \quad \forall x, y \in X
    \\
    f(y) &\le 
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


**References**

The proofs are from myself, the approach is inspired by J.Wright's Book on Numerical Optimization Method. 


---
### **Quadratic Convergence of the Iterates**

> The method produces sequence of $x^{(k)}$ that converges quadratically with $\Vert x^{(k)} - x_*\Vert$ has a quadratic convergence. 

By considering $G(x) = x - H^{-1}_f[x]\nabla f(x)$, and let $x_*$ be the unique minimizer that exists so that it has $\nabla f(x_*) = \mathbf 0$ then we consider

$$
\begin{aligned}
    G(x) - x^* &= x - x^* - H^{-1}_f[x]\nabla f(x)
    \\
    &= H^{-1}[x](H_f[x](x - x^*) - \nabla f(x))
    \\
    &= 
    \overbrace{H^{-1}[x](
        \underbrace{H_f[x](x - x_*) - (\nabla f(x) - \nabla f(x_*)))}_
        {[[1]]}
    }^{[[2]]}, 
\end{aligned}
$$

using the Taylor's theory, we make the observation that 

$$
\begin{aligned}
    \nabla f(x) - \nabla f(x_*) &= \int_0^1 
    H_f[x + t(x_* - x)](x - x_*)
    dt
    \\
    \implies 
    [[1]]&:= 
    \int_{0}^{1} 
        [H_f[x] - H_f[x + t(x_* - x)]](x - x_*)
    dt
    \\
    \Vert [[1]]\Vert &\le 
    \int_0^1 \Vert 
        H_f[x] - H_f[x + t(x_* - x)]
    \Vert dt \Vert x - x_*\Vert, 
\end{aligned}
$$

recall from assumption that the Hessian is a L-Lipschitz mapping and therefore we have 

$$
\begin{aligned}
    \Vert  H_f[x] - H_f[x + t(x_* - x)] \Vert
    &\le 
    \frac{L}{2}\Vert t(x - x_*)\Vert
    \\
    &= Lt\Vert x - x_*\Vert
    \\
    \implies 
    \Vert [[1]]\Vert &\le \int_{0}^{1} Lt dt
    \Vert x - x_*\Vert^2 = \frac{L}{2}\Vert x - x_*\Vert^2
    \\
    \implies \Vert [[2]]\Vert 
    & \le 
    \left 
    \Vert 
        H_f[x]^{-1}
    \right
    \Vert
    \frac{L}{2}
    \Vert x - x_*\Vert^2, 
\end{aligned}
$$

finally, with strong convexity we consider a bound on the inverse Hessian, gloablly. 

$$
\begin{aligned}
    [[3]]\rightarrow
    \Vert H^{-1}_f[\cdot]\Vert &= \sup \frac{\Vert H_f^{-1}[\cdot] x\Vert}
    {\Vert x\Vert}
    = \sqrt{\lambda_{\max}(H^{-1}_f(H^{-1}_f)^T)}
    \\
    &= \sqrt{\lambda_{\max}(H^{-2}_f)} \quad \textcolor{gray}{\triangleright \text{by Hessian being sym P.D}
    }
    \\
    &= \frac{1}{\beta}, 
    \quad 
    \textcolor{gray}{\small\triangleright\text{
        by strong convexity 
        }\beta = \lambda_{\min}(H_f)
    }
\end{aligned}
$$

combining all previous results we have an upper bound for \[\[2\]\] given as 

$$
\begin{aligned}
    \Vert [[2]]\Vert =\Vert G(x) - x^*\Vert \le \frac{L}{2\beta} \Vert x - x_*\Vert^2, 
\end{aligned}
$$

then dividing by both side by $\Vert x - x_*\Vert^2$ gives us the definition of a quadratic convergence on the iterates. 


---
### **Quadratic Convergence of the Gradients**

$$
\begin{aligned}
    \left\Vert 
        \nabla f(x^{(k + 1)})
    \right\Vert 
    &= 
    \left\Vert 
        \nabla f(x^{(k + 1)})
         - \nabla f(x^{(k)}) - H_f[x^{(k)}]
        \left(
            \underbrace{-H_f^{-1}[x^{(k)}]\nabla f(x^{(k)})}_{
                =: p_k = x^{(k + 1)} - x^{(k)}
            }
        \right)
    \right\Vert
    \\
    &= 
    \left\Vert 
        \int_{0}^{1} 
            H_f[x^{(k)} + tp_k](x^{(k + 1)} - x^{(k)})
        dt
        -H_f[x^{(k)}]p_k
    \right\Vert 
    \\
    & \quad \textcolor{gray}{
        \triangleright
        \partial_t \nabla f(x^{(k)} + tp_k) = H_f[x^{(k)} + tp_k]p_k
    }
    \\
    &\le 
    \int_{0}^{1} 
        \left\Vert H_f[x^{(k)} + tp_k] - H_f[x^{(k)}]\right
        \Vert 
    dt
    \Vert p_k\Vert \quad \textcolor{gray}{
        \triangleright \text{recall } p_k = x^{(k + 1) - x^{(k)}}
    }
    \\
    & \le 
    \frac{L}{2}\Vert p_k\Vert^2 \quad \textcolor{gray}{
        \triangleright\text{Hessian is Lipschitz and bounded by }
        Lt \Vert p_k\Vert
    }
    \\
    &\le 
    \frac{L}{2}
    \left\Vert H_f^{-1}[x^{(k)}]\right\Vert^2 
    \left\Vert 
        \nabla f(x^{(k)})
    \right\Vert^2 
    \\
    &\le \frac{L}{2\beta} \left\Vert \nabla f(x^{(k)})
    \right\Vert^2
    \quad \textcolor{gray}{\triangleright \text{Use results from }[[3]]}, 
\end{aligned}
$$

dividing both sides by the RHS norm establish the quadratic convergence of the norm of the gradient map. 

**Remarks**

From [Strong Convexity, Equivalences and Implications](Strong%20Convexity,%20Equivalences%20and%20Implications.md) one can estabish that $\Vert \nabla f(x)\Vert^2 \ge 2\beta(f(x) - f(x_*))$, hence the objective value is also converging quadratically. 

