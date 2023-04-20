---
alias: Fenchel Equality
---
* [Convex Conjugation Introduction](Convex%20Conjugation%20Introduction.md)
* [Subgradient Introduction](../Non-Smooth%20Calculus/Subgradient%20Introduction.md)

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

However, the equality can be achieved if, the function $f$ is closed and convex. We state the theorem. 

**Theorem: Fenchel's Identity and Equivalences**
> Let $f$ be closed, convex and proper, let $x, y\in X$, then the following are equivalent: 
> 1. $f(x) + f^\star(y) = \langle x, y\rangle$, 
> 2. $y \in \partial f(x)$ , 
> 3. $x\in \partial f^\star(y)$ IF, $f$ is also l.s.c. 
> 
> The first item shows that equality can be achieved, and the second and third conditions gives what to expect for $x,y$ when equality is achieved. 


---
### **Fenchel Equality**

Recall these facts: 
- Conjugate is convex. 
- Zero in subgradient is global optimal for any convex function. 
- Subgradient strong sum rule. 

**Proof**

We first show that, (1) is equivalent to item (2). By the definition of convex conjugate we have: 
$$
\begin{aligned}
    & 
    f(x) + f^\star(y) = \langle x, y\rangle
    \\
    \iff &
     f(x) + \sup_{z\in X}
    \{
        \langle y, z\rangle - f(z) 
    \} = \langle x, y\rangle 
    \\
    \iff &
    \sup_{z\in X}
    \left\lbrace
       \langle y, z\rangle - f(z)
    \right\rbrace = \langle x, y\rangle - f(x)
    \\
    \iff &
    x \in \arg\sup_{z\in X}
    \left\lbrace
       \langle y, z\rangle - f(z) 
    \right\rbrace \neq \emptyset
    \\
    \iff & 
    x \in - \arg\inf_{z\in Z} \left\lbrace
       f(z) - \langle y, z\rangle
    \right\rbrace
    \\
    \iff &
    \mathbf 0 \in \partial [f(z) - \langle y, z\rangle |z](x) \quad \text{ by [1]}
    \\
    \iff & 
    \mathbf 0 \in \partial f(x) - y \quad \text{ by [2]}
    \\
    \iff & 
    y \in \partial f(x)
\end{aligned}
$$

- [1]: The function $f(z)$ is convex and proper, we may use the Fermat's rule for convex subgradient. 
- [2]: We use the strong subgradient sum rule since $f$ is convex proper, and $\langle . y\rangle$ is affine with domain on the entirety of $X$. 

We had shown that, (1), (2) are equivalent conditions. We now show (3). Adding the fact that $f$ is lower semi-continuous, its epigraph is closed. Hence, we invoke [Biconjugate Theorem](Biconjugate%20Theorem.md) to attain: $f = f^{\star\star}$. Re-applying the above proved equivalences, we have: $f^\star(y) + (f^\star)^\star(x) = \langle z, y\rangle \iff x \in \partial f^\star(y)$. By $f^{\star\star} = f$, we have $y\in \partial f(x)$as well. Therefore, $y\in \partial f(x)\iff x \in \partial f^\star(y)$. The closure of the function is essentially.

**Remarks**

One of the key things people focuses on is relevant to the optimality conditions of the primal dual problem. The original function reaches optimality means that $z\in \partial f(\mathbf 0)$, and equivalently we have $x^+ \in \partial f^\star(0)$. 

The last item, (3) is very important because it opens up a new way of looking for both, subgradient and conjugate functions under various context. Giving us new interpretations for both entities, and helps with computational rules and proving those rules. 
