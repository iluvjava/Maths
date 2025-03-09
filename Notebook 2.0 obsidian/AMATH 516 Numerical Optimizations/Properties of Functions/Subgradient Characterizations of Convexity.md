- [Gradient, Hessian Characterization of Convex Functions](../CVX%20Analysis/Gradient,%20Hessian%20Characterization%20of%20Convex%20Functions.md)
- [Subgradient Intro](../Non-Smooth%20Calculus/Subgradient%20Intro.md)
- [Moreau Envelope and Convex Proximal Mapping](../Proximal%20Operator/Moreau%20Envelope%20and%20Convex%20Proximal%20Mapping.md)
- [Resolvent Operators](../Operators%20Theory/Resolvent%20Operators.md)


---
### **Intro**

A similar characterization of convexity through the subgradient of a function also exists. 
The proof is not direct and it needs some theories about the subgradient as a monotone operator, and the Epi convergence of Envelope function to the original function. 

Let $f:\R^n \rightarrow \overline \R$ be any function and it doesn't necessarily has to be convex. 
In this file we adopt the traditional Fenchel Convex Subgradient: 

$$
\begin{aligned}
    \partial f(x) := 
    \left\lbrace
        u \in \R^n : (\forall y \in \R^n)
            \; f(y) - f(x) - \langle u, y - x\rangle
    \right\rbrace. 
\end{aligned}
$$

This is the theorem we wish to prove. 

#### **Theorem | Equivalences of convexity via subgradient**
> Let $f: \R^n \rightarrow \overline \R$ is convex then the following are equivalent: 
> 1. $f$ is a convex function. 
> 2. For all $x\in \R^n, y \in \R^n$, for all $v \in \partial f(y)$ it has $f(y) - f(x) - \langle v, x- y\rangle \ge 0$. 
> 3. For all $x, y \in \R^n$, it has $\forall x' \in \partial f(x), y' \in \partial f(y)$ then $\langle x' - y', x - y\rangle \ge 0$. 

**Proof**



