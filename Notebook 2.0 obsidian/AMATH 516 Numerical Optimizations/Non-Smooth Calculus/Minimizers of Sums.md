[[Subdifferentials Subgradient Computations]]


---
### **Intro**

This is the key for duality. We state the theorem straight away and then prove it: 

**Theorem: Minimizing a Sum**
> Let f be proper on $X$, and let g be convex,, l.s.c and proper. Consider the problem (P) of minimizing $f + g$ we have: 
> 1. if $x^+$ is a local minimizer of (P), and f is differentiable at $x^+$ then $- \nabla f(x^+) \in \partial g(x^+)$. 
> 2. If f is convex and differentiable at $x^+\in \text{dom}(g)$ then $x^+$ is a global minimizer of (P) iff $- \nabla f(x^+) \in \partial g(x^+)$. 

**First Observations**

The first conditions is a necessary conditions for having potential a miniizer, the second condition is the sufficient conditions. See remarks about the case when $x\not\in \text{dom } g$. 

**proof (1.)**

let $y\in \text{dom }g$ by convexity $x_{\lambda}:= (1 - \lambda)x^+ + \lambda y\in \text{dom }g \;\forall \lambda \in (0, 1)$. By $x^+$ being a local minimizer we have for sufficiently small $\lambda$: 

$$
\begin{aligned}
    f(x^+) + g(x^+) &\le f(x_\lambda) + g(x_\lambda)
    \\
    &= f(x^+ + \lambda(y - x^+)) + g((1- \lambda)x^+ + \lambda y)
    \\
    &\le f(x^+ + \lambda(y - x^+)) + (1 - \lambda)g(x^+) + \lambda g(y), 
\end{aligned}
$$

where on the first second inequality we applied the Jasen's inequality. Rearranging we have: 

$$
\begin{aligned}
    g(x^+) - g(y) &\le 
    \frac{f(x^+ + \lambda(y - x^+)) - f(x^+)}{\lambda}
    \\
    \lambda &\searrow 0
    \\
    \implies &= \langle y - x^+, \nabla f(x^+)\rangle
    \\
    \implies 
    g(x^+) + \langle y - x^+, - \nabla f(x^+)\rangle &\le g(y), 
\end{aligned}
$$

and the last line is the claim that $-\nabla f(x^+) \in \partial g(x^+)$ at the end of (1).

**Proofs (2.)**

The $\implies$ direction is handled by $x^+$ is an global minimizer then it is a local minimizer, the converse is true by assuming that $-\nabla f(x^+)\in \partial g(x^+)$, then $\mathbf 0\in \nabla f(x^+) + \partial g(x^+) = \partial f(x^+) + \partial g(x^+) \subseteq \partial (f + g)(x^+)$; hence by convexity of the function $f + g$, $x^+$ is a global minimizer by convex subgradient property. 


**Remarks**: 

When one assume that $g$ is the indicator function for some convex set $C$, then the above sufficient/necessary conditions for minimizer $x^+$ becomes $-\nabla f(x^+) \in N_C(x^+)$, where, the gradient of the optimal on function $f$ is now in the normal cone of the convex constrain at the optimal point $x^+$. Under the spacial case where $f(x^+) = \mathbf 0$, we attain $x^+\in C$. If this is not the case, then $\nabla f(x)\neq \mathbf 0$ for all $x\in C$ hence the minimizer has to satisfies that $-\nabla f(x^+) \in N_C(x^+)$ and $x^+$ has to be on the boundary of $C$ because $N_C(x)  \{\mathbf 0\}\;\forall x \in \text{int}(C)$ by the property of [[../Background/Normal Cone]]. 


**References**: Heinz class at UBCO, Theorem 15.1 course notes. 