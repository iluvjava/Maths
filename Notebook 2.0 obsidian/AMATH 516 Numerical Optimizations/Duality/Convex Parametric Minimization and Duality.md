- [Parametric Minimizations](../Background/Parametric%20Minimizations.md)
- [Fenchel Rockafellar Weak Duality](Fenchel%20Rockafellar%20Weak%20Duality.md)
- [Fenchel Identity](Fenchel%20Identity,%20Inequality.md)

---
### **Intro**

Weak duality requires the technique of sensitivity analysis (perturbation) to improve weak duality to strong duality. 
The following assumption setups the scope of the discussion. 

#### **Assumption Set 1 | The entire scope**
> $F: \mathbb R^n \times Y \rightarrow \overline \R$ is a convex and proper in its first parameter for all its second parameter.  

The first parameter represents the primal variable. 
The second parameter represent purtubation to the primal optimization problem. 

#### **Definition | Primal dual value functions**
> $p: \R^n \rightarrow \overline \R$ is defined as $p(y) = \inf_{x}F(x, y)$. 
> The conjugate $F^\star$ is defined as $F^\star(u, v) = [(\cdot,\cdot)\rightarrow F(\cdot, \cdot)]^\star(u, v)$.
> The dual value function $q: Y \rightarrow \overline\R$ is defined as $p(v) = \sup_{u} - F^\star(u, v)$. 

#### **Theorem | Strong duality prelude**
> Let $p, q$, be value functions for $F(x, y)$, then they satisfies: 
> $$
> \begin{aligned}
>     p^\star(v) &= F^\star(\mathbf 0 , v), q(\mathbf 0) = p^{\star\star}(\mathbf 0) \le p(\mathbf 0). 
> \end{aligned}
> $$
> In addition, if $\mathbf 0 \in \text{ri.dom}\;p$ so $\exists z \in \partial p(\mathbf 0)$ then strong duality holds with finite value $p(\mathbf 0) = q(\mathbf 0)$. 

**Proof**

The first equality is direct and it has 

$$
\begin{aligned}
    p^\star(v) &= \sup_{z}\{\langle v, z\rangle - p(z)\}
    \\
    &= \sup_{z}\{\langle v, z\rangle - \inf_{x} F(x, z)\}
    \\
    &= \sup_{z, x}\{\langle v, z\rangle + \langle \mathbf 0, x\rangle - F(x, z)\}
    \\
    &= F^\star(0, v). 
\end{aligned}
$$

Next, it has 

$$
\begin{aligned}
    q(\mathbf 0) &= \sup_{v}\left\lbrace
        - F^\star(\mathbf 0, v)
    \right\rbrace
    = 
    \sup_{v}\left\lbrace
        - p(v)^\star
    \right\rbrace = p^{\star\star}(\mathbf 0) \le p(\mathbf 0). 
\end{aligned}
$$

Using French identity and other theories, it gives: $p^{\star\star}(\mathbf 0) = p(\mathbf 0)$ because $\partial p(\mathbf 0)$ is not empty. 
The value is finite because $\mathbf 0$ is $\in \text{dom}\; p$. 

---
### **How is this useful**

These contents appeared in the discussion for strong duality in UW's course notes on non-smooth analysis. 
This requires a new understanding of Lagrangian. 
Let's take a look. 


