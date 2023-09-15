[[Moreau Envelope and Proximal Mapping]]


---
### **Intro**

Assume that the function $f$ is convex, lsc and proper and we have access to the subgradient oracle of the function, then the proximal point method: 

$$
\begin{aligned}
    x^{(t + 1)}\in \text{prox}_{f, \alpha}(x^{(t)})
\end{aligned}
$$
can be interpreted as: 
1. Gradient on the Moreau envelope. 
2. Fixed point iterations on the subgradient operator.
4. Backward Euler on the gradient dynamics involving the subgradient oracle. [[Projected Proximal Gradient, Interpretations]] for more. 

References: 
1. [Proximal Algorithms](https://web.stanford.edu/~boyd/papers/pdf/prox_algs.pdf)
2. [[Primer on Monotone Operators.pdf]]


---
### **Proximal Point Method is a Fixed Point Iterations**

Assuming that the iterations converges, consider: 

$$
\begin{aligned}
    & \mathbf 0\in \partial f(x)
    \\
    & x\in \partial f(x) + x
    \\
    & x\in \left(
        \partial f + I
    \right)(x)
    \\
    & 
    x \in (\partial f + I)^{-1}(x). 
\end{aligned}
$$

If the iteration converges, then it obtains the optimal values for function. However, the convergence of it largely depends analysis of monotone operators. 


---
### **Proximal Point Method is Gradient Descend on Moreau Envelope**

Here, we assume that the envelope indeed is differentiable and has gradient, implying the fact that $\text{prox}$ oracle is only returning one single value (Doesn't necessarily means that the function $f$ is convex.), nonetheless, we can consider one gradient step: 

$$
\begin{aligned}
    x^{(t + 1)} &= x^{(t)} - \gamma \nabla (\text{env}_{f, \alpha}(x^{(t)}))
    \\
    x^{(t + 1)} &= x^{(t)} - \gamma \alpha^{-1}(x^{(t)} - \text{prox}_{f, \alpha}(x)), 
\end{aligned}
$$

by being specific about the length of the gradient step, let $\gamma = \alpha$ then $x^{(t)}$ on the rhs cancelled out giving us the same expression for the proximal point method. 

**Remarks**

Moreau envelope can be viewed as a type of smoothing for any given functions. From [[Moreau Envelope and Proximal Mapping]], we know that the subgradient of the Moreau envelope is indeed the gradient, implying the fact the the envelope is differentiable. Additionally, the Lipschitz constant for the gradient is bounded to bounded Lipschitz for the proximal operator, further implying the fact that the envelope gradient is globally Lipschitz. This allows for great convergence results for the proximal point method. 


---
### **Backwards Euler and Proximal Point**

We consider $f(x)$ to be a convex, lsc function that is proper, then the proximal point method considers the following update scheme: 

$$
\begin{aligned}
    x^{(t + 1)} \in \text{prox}_{f, \gamma}(x^{(t)}), 
\end{aligned}
$$

which is equivalent to the backwards Euler methods on the gradient dynamics: $X'(t) = -\partial f(X(t))$. To derive we starts by assuming the following approximation via first order forward finite differences: 

$$
\begin{aligned}
    \frac{X(t + \Delta t) - X(t)}{\Delta t} &= -\partial f(X(t  + \Delta t))
    \\
     - X(t) &= 
    - X(t + \Delta t)-\Delta t\partial f(X(t + \Delta t))
    \\
    X(t) &= 
    [I + \Delta t\partial f](X(t + \Delta t))
    \\
    X(t + \Delta t) &= [I + \Delta t\partial f]^{-1}(x(t))
\end{aligned}
$$

**Remarks**

We abuse the notation and use subgradient despite the fact that it's a set value mapping not a single value mapping as in the traditional derivation for the backwards Euler method. 


---
### **Proximal Point Can be a Banach Contraction**

We state and prove that fact that a proximal point iterations on a strongly convex function is a contraction on the Euclidean space. See [Appearences of Contraction Operators](../Operators%20Theory/Appearences%20of%20Contraction%20Operators.md)  for a detailed exposition. 



