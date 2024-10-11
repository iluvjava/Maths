This file is a supplement for [Smooth Gradient Descend The Basics](AMATH%20516%20Numerical%20Optimizations/Smooth%20Gradient%20Descend%20The%20Basics.md). 


---
### **Intro**

A convergence proof for smooth gradient descent hinges on the PL conditions generalizes the convergence results for a bigger class of functions that are not necessarily convex. 
PL conditions is one of the weaker consequence of strong convexity. 
Recall contents from [Strong Convexity, Equivalences and Implications](AMATH%20516%20Numerical%20Optimizations/Strong%20Convexity,%20Equivalences%20and%20Implications.md) that for a $\mu$ strongly convex function $f$, it satisfies the PL conditions: 

$$
\begin{aligned}
    (\forall x): (1/2)\text{dist}(\mathbf 0 ,\partial f(x))^2
    \ge \mu(f(x) - f(x_*)). 
\end{aligned}
$$

where a unique $x_*$ exist for strongly convex function, and $\partial f$ is the convex subgradient. 
In a much general context when the function $f$ is not convex, $\partial f$ becomes the Mordukhovich limiting subgradient, and $x_*$ is a stationary point satisfying $\mathbf 0 \in \partial f(x_*)$. See [Limiting Subgradient](AMATH%20516%20Numerical%20Optimizations/Limiting%20Subgradient.md) for more information. 
Unfortunately to assert the convergence of algorithm such as gradient descent method, we have to assume more conditions.

**Assumptions**

1. $f$ has Lipschitz gradient with constant $L$ in $\Vert \cdot\Vert$, 2-norm. 
2. $f$ is $\mu$ PL, in the same norm as above. 
3. $\mathbf 0 \in \partial f(x^*)$, so $x_*$ is a stationary point. $\partial f$ is the Limiting subgradient. 

Suppose that the method gradient descent generates for all $x_0$, $x_{k + 1} = x_k - L^{-1} \nabla f(x_k)$. 

#### **Claim | Linear convergence to stationary point**


**Proof**

#### **Claim | Convergence rate of proximal point method**

**Proof**
