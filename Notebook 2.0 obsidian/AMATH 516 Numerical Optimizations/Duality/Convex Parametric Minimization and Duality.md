- [Parametric Minimizations](../Background/Parametric%20Minimizations.md)
- [Fenchel Rockafellar Weak Duality](Fenchel%20Rockafellar%20Weak%20Duality.md)
- [Fenchel Identity](Fenchel%20Identity,%20Inequality.md)

---
### **Intro**

Weak duality requires the technique of sensitivity analysis (perturbation) to improve weak duality to strong duality. 

**The following contents are extended from MATH 516 from University of Washington taught by Jame Burkes**

The following assumption setups the scope of the discussion. 

#### **Assumption Set 1 | The entire scope**
> $F: \mathbb R^n \times Y \rightarrow \overline \R$ is a convex and proper in its first parameter for all its second parameter.  

The first parameter represents the primal variable. 
The second parameter represent purtubation to the primal optimization problem. 

#### **Definition 1 | Primal dual value functions**
> $p: \R^n \rightarrow \overline \R$ is defined as $p(y) = \inf_{x}F(x, y)$. 
> The conjugate $F^\star$ is defined as $F^\star(u, v) = [(\cdot,\cdot)\rightarrow F(\cdot, \cdot)]^\star(u, v)$.
> The dual value function $q: Y \rightarrow \overline\R$ is defined as $p(v) = \sup_{u} - F^\star(u, v)$. 

#### **Theorem 1 | Strong duality prelude**
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

Using Fenchel identity and other theories, it gives: $p^{\star\star}(\mathbf 0) = p(\mathbf 0)$ because $\partial p(\mathbf 0)$ is not empty. 
The value is finite because $\mathbf 0$ is $\in \text{dom}\; p$. 

---
### **How is this useful**

These contents appeared in the discussion for strong duality in UW's course notes on non-smooth analysis. 
This requires a new understanding of Lagrangian. 
Let's take a look. 

#### **Definition 2 | Primal Perturbed Lagrangian**
> Let $h:\R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. 
> The perturbed Lagrangian is defined as 
> $$
> \begin{aligned}
>     \widetilde {\mathcal L}(x, y, z):= 
>     g(x) + \langle y, Ax - z\rangle - h^\star(y). 
> \end{aligned}
> $$

#### **Proposition 1 | convex parametric optimization and perturbed Lagrangian**
> Let $h:\R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. 
> Let $A \in \R^{m\times n}$. 
> Define $F:\R^m \times \R^n :=(x, z)\mapsto  g(x) + h(Ax - z)$, then we have the following relations: 
> 1. $F(x, z) = \sup_{y}\widetilde{\mathcal L}(x, y, z)= g(x) + h(Ax - z)$ where $\widetilde {\mathcal L}$ is the perturbed Lagrangian, and $F(x, z)$ is convex. 
> 2. $F^\star(x^*, z^*) = g^\star(x^* + Az^*) + h^\star(-z^*)$, which is the negative of the dual objective. 
> 3. $F(x, \mathbf 0)$ represent the primal objective and $-F^\star(\mathbf 0, z^*)$ represent the dual objective to be maximized. 

**Proof**

**To see Item (1)**, it has: 
$$
\begin{aligned}
    \sup_{y} \widetilde{\mathcal L}(x, y, z)
    &= 
    \sup_{y} \left\lbrace
        g(x) + \langle y, Ax - z\rangle - h^\star(y)
    \right\rbrace
    \\
    &= g(x) + \sup_{y} \left\lbrace
        \langle y, Ax - z\rangle - h^\star(y)
    \right\rbrace
    \\
    &= g(x) + h^{\star\star}(Ax - z) 
    \\
    &\underset{\text{(a)}}{=} g(x) + h(Ax - z) 
    \\
    &= F(x, y)
\end{aligned}
$$

In (a) of above, The biconjugate theorem applies here because $h$ is a closed and convex function. 
**To see item (2)**, directly consider conjugating which gives 

$$
\begin{aligned}
    F^\star(x^*, z^*) &= 
    \sup_{x, z} \left\lbrace
        \langle x^*, x\rangle + \langle z^*, z\rangle - g(x) - h(Ax - z)
    \right\rbrace
    \\
    &= \sup_{x}\left\lbrace
        \langle x^*, x\rangle - g(x) + \sup_{z} \left\lbrace
            \langle z^*, z\rangle - h(Ax - z)
        \right\rbrace
    \right\rbrace
    \\
    &= \sup_{x}\left\lbrace
        \langle x^*, x\rangle - g(x) + 
        (z\mapsto h(Ax - z))^\star(z^*)
    \right\rbrace
    \\
    &= 
    \sup_{x}\left\lbrace
        \langle x^*, x\rangle 
        \underbrace{- g(x) + h^\star(- z^*) + \langle z^*, Ax\rangle}_{
            =-\widetilde {\mathcal L}(x, - z^*, \mathbf 0)
        }
    \right\rbrace
    \\
    &= \sup_x\left\lbrace
        \langle x, A^Tz^* + x^*\rangle - g(x) 
    \right\rbrace + h^\star(Ax -z^*)
    \\
    &= g^\star(A^Tz^* + x^*) + h^\star(-z^*). 
\end{aligned}
$$
In the middle of the derivation it had 
$$
\begin{aligned}
    F^\star(x^*, z^*) &= \sup_{x}\left\lbrace
        \langle x^*, x\rangle - \widetilde{\mathcal L}(x, -z^*, \mathbf 0)
    \right\rbrace
    =- \inf_{x} \left\lbrace
        \widetilde{\mathcal L}(x, - z^*, \mathbf 0) - \langle x^*, x\rangle
    \right\rbrace. 
\end{aligned}
$$

**For Item (3)**, we write out the results obtained previously and, it has

$$
\begin{aligned}
    F(x, \mathbf 0) &= \sup_{y} \widetilde{\mathcal L} (x, y, \mathbf 0) 
    =  g(x) + h(Ax), 
    \\
    -F^\star(\mathbf 0, z^*) &= 
    - g^\star(A^T z^*) -  h^\star(-z^*).
\end{aligned}
$$

$\blacksquare$


#### **Theorem | Primal Dual value functions and strong duality**
> Let $h:\R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. 
> Let $A \in \R^{m\times n}$. 
> Define $F:\R^m \times \R^n :=(x, y)\mapsto  g(x) + h(Ax - y)$. 
> Define value function $p(y) := \inf_x F(x, y)$. 
> Define dual value function $q(u) := \sup_{u}- F^\star(u, v)$. 
> If $\mathbf 0 \in \text{ri.dom}\; p$, then strong duality holds and $p(\mathbf 0) = q(\mathbf 0)$.

**Proof**

The function $F(x, y) = g(x) + h(Ax - y)$ is convex proper and closed because both $g, h$ are convex proper closed function. 
Hence, Theorem 1 applies and, it has $p(\mathbf 0) = p^{\star\star}(\mathbf 0)= q(\mathbf 0)$ which gives strong duality by Proposition 1. 


