* [[Convex Conjugation]]
* [[../Non-Smooth Calculus/Subgradient Definition]]


---
### **Intro**

The Fenchel inequality ties together the idea of convex conjugate, subgradients, and convexity of functions. 

**Observation: Fenchel Inequality**
> Let $f$ be a proper function, then it's possible to choose $x\in \text{dom}(x)$ such that $f(x)\neq \infty$, by this we have: 
> $$
> \begin{aligned}
>   & f^\star(y) = \sup_{x'\in X} \{\langle y, x'\rangle - f(x')\} \ge \langle y, x\rangle - f(x)
>   \\
>   & f(x) + f^\star(y) \ge \langle x, y\rangle. 
> \end{aligned}
> $$
> This is direct from the definition of Fenchel Conjugate. 

However, the equality can be achived if, the function $f$ is closed and convex. We state the theorem. 

**Theorem: Fenchel's Identity**
> Let $f$ be closed, convex and proper, let $x, y\in X$, then the following are equivalent: 
> 1. $f(x) + f^\star(y) = \langle x, y\rangle$, 
> 2. $y \in \partial f(x)$ , 
> 3. $x\in \partial f^\star(y)$. 
> The first item shows that equality can be achived, and the secon and third conditions gives what to expect for $x,y$ when equality is achived. 


---
### **Fenchel's Equaltiy**

Recall these facts: 
- Conjugate is convex. 
- Zero in subgradientis gobal optimal for any convex funtion. 
- Subgradient strong sum rule. 

**Proof**

Recall: *f is closed and convex*, by definition equality is attainable using supporting halfspaces (or Fermat rules for the convex subgradient if we are not doing epigraphical intrepretations) defined via the convex conjugate functions: 

$$
\begin{aligned}
    f^\star(y) &= \sup_{x'\in X} \{\langle x', y\rangle - f(x)\}
    \\
    f^\star(y) &= -\inf_{x'\in X}\{f(x') - \langle x', y\rangle\}
\end{aligned}
$$

We note that, $\exists x^+ \in X: \mathbf 0 \in \partial f(x^+) - y$, because the function $f$ is a convex function on $X$, further more, we havee $\langle \cdot, y\rangle$ which has an entire domain of $X$, and $f$ is proper, therefore, we can use the subgradient sum rule, giving us the above conditions. Substituting $x^+$ we obtain: 
$$
\begin{aligned}
    & \mathbf 0 \in \partial f(x^+) - y
    \\
    \iff & y \in \partial f(x^+)
    \\
    \iff & f^\star(y) = \langle x^+, y\rangle - f(x^+) \quad \text{subgradient fermat}
    \\
    \iff &
    f(x^+) = f^\star(y) + \langle x^+, y\rangle
    \\
    \iff &
    x^+\in \partial f^\star(y),
\end{aligned}
$$

where on the last line, we use the observation that, the function $f^\star$ is a convex function, therefore we can use the subgradient Fermat theorem. 

**Remarks**

* Notice that, this time, $z, x$ swapped, and we have $f^\star(x)$ instead of $f(x)$. Go through the same proof for (1) but with $f(x)$ as $f^{\star\star}(x)$, then we will a new claim:

**Corollary: Fenchel's Identity**
> $$
> z\in \partial f(x^+) \iff x^+ \in \partial f^\star(z) \tag{2}
> $$
> Given dual, primal variable $x, z$, they are in the subgradient of each of their objective function, $f, f^\star$. 

**Proof**

See the remarks before the claim. 

**Remarks**

One of the key things people focuses on is relavent to the optimality conditions of the primal dual problem. The original function reaches optimality means that $z\in \partial f(\mathbf 0)$, and equivalently we have $x^+ \in \partial f^\star(0)$. 

This corollary is **extremely important** because it opens up a new way of looking for both, subgradient and conjugate functions under various context. Giving us new interpretations for both entities, and helps with computational rules and proving those rules. 

