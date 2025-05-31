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
The second parameter represents perturbation to the primal optimization problem. 

#### **Definition 1 | Primal dual value functions**
> $p: \R^n \rightarrow \overline \R$ is defined as $p(y) = \inf_{x}F(x, y)$. 
> The conjugate $F^\star$ is defined as $F^\star(u, v) = [(\cdot,\cdot)\rightarrow F(\cdot, \cdot)]^\star(u, v)$.
> The dual value function $q: Y \rightarrow \overline\R$ is defined as $p(v) = \sup_{u} - F^\star(u, v)$. 

#### **Theorem 1 | Strong duality prelude**
> Let $p, q$, be value functions for $F(x, y)$, then they satisfy: 
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
### **How is this useful (remastered)**

The following contents is written by myself. 

#### **Definition 2 | perturbed Lagrangian**
> Let $h:\R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. 
> The perturbed Lagrangian is defined as 
> $$
> \begin{aligned}
>   \widetilde{\mathcal L}(x, y, \tilde x, \tilde y) 
>   = \langle \tilde x, x\rangle + g(x) + \langle y, Ax - \tilde y\rangle - h^\star(y). 
> \end{aligned}
> $$


#### **Proposition 1 | Properties of the perturbed Lagrangian**
> Let $h: \R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. Let $A \in \R^{m\times n}$. 
> Define $F: \R^m \times \R^n:= (x, z)\mapsto g(x) + h(Ax - z)$ then, we have the following relations: 
> 1. And the relations to primal dual problem are: $\sup_y \widetilde{\mathcal L}(x, y, \tilde x, \tilde y) = \langle \tilde x, x\rangle + g(x) + h(Ax - \tilde y)$ and, $\inf_{x} \widetilde{\mathcal L}(x, y, \tilde x, \tilde y) = - g^\star(-\tilde x - A^T y) - \langle y, \tilde y\rangle - h^\star(y)$. 
> 2. $F(x, z) = \sup_{y} \widetilde {\mathcal L}(x, y, \mathbf 0, z) = g(x) + h(Ax - z)$. The conjugate has: $F^\star(x^*, z^*)-\inf_{x} \widetilde{\mathcal L}(x, -z^*, -x^*, \mathbf 0) = g^\star\left(x^* + A^T z^*\right) - h^\star(-z^*)$. 

**Proof**

**Let's prove item (1)**. 
To see that, it's direct: 

$$
\begin{aligned}
    \sup_y \left\lbrace
        \widetilde{\mathcal L}(x, y, \tilde x, \tilde y) 
    \right\rbrace
    &=
    \sup_{y}\left\lbrace
        \langle \tilde x, x\rangle + g(x) + \langle y, Ax - \tilde y\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \langle \tilde x, x\rangle + g(x) + 
    \sup_{y}\left\lbrace
        \langle y, Ax - \tilde y\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \langle \tilde x, x\rangle + g(x) + 
    h^{\star\star}(Ax - \tilde y)
    \\
    &\underset{\text{(a)}}{=} \langle \tilde x, x\rangle + g(x) + 
    h(Ax - \tilde y)
\end{aligned}
$$

We used (a): That the function $h$ is a closed convex proper function hence $h^{\star\star} = h$. 
Similarly, we also have 

$$
\begin{aligned}
    \inf_{x} \left\lbrace
        \widetilde{\mathcal L}(x, y, \tilde x, \tilde y)
    \right\rbrace
    &= 
    \inf_x \left\lbrace
        \langle \tilde x, x\rangle + g(x) + \langle y, Ax - \tilde y\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \inf_x \left\lbrace
        \langle x, \tilde x + A^T y\rangle + g(x) - \langle y, \tilde y\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \inf_x \left\lbrace
        \langle x, \tilde x + A^T y\rangle + g(x)
    \right\rbrace - \langle y, \tilde y\rangle - h^\star(y)
    \\
    &= g^\star(\tilde x + A^T y) - \langle y, \tilde y\rangle - h^\star(y). 
\end{aligned}
$$

**To see Item (2)**, we used the results of the above derivations. 

$$
\begin{aligned}
    g(x) + h(Ax - z) &= 
    \sup_{y} \left\lbrace
        \widetilde {\mathcal L}(x, y, \mathbf 0, z)
    \right\rbrace = F(x, z).
\end{aligned}
$$

Taking the dual, it yields: 

$$
\begin{aligned}
    F^\star(x^*, z^*) 
    &= \sup_{x, z}\left\lbrace
        \langle x^*, x\rangle + \langle z^*, z\rangle - g(x) - h(Ax - z)
    \right\rbrace
    \\
    &= \sup_{x}\left\lbrace
        \langle x^*, x\rangle - g(x) + 
        \sup_{z}\left\lbrace
            \langle z^*, z\rangle - h(Ax - z)
        \right\rbrace
    \right\rbrace
    \\
    &= \sup_{x} \left\lbrace
        \langle x^*, x\rangle - g(x) + 
        h^\star(- z^*) + \langle Ax, z\rangle
    \right\rbrace
    \\
    &= - \inf_x\left\lbrace
        - \langle x^*, x\rangle + g(x) - h^\star(-z^*) - \langle Ax, z^*\rangle
    \right\rbrace
    \\
    &= 
    - \inf_x\left\lbrace
        \langle - x^*, x\rangle + g(x) - h^\star(-z^*) + \langle Ax, -z^*\rangle
    \right\rbrace = -\inf_{x} \left\lbrace
        \widetilde{\mathcal L}(x, -z^*, -x^*, \mathbf 0)
    \right\rbrace
    \\
    &= \sup_{x}\left\lbrace
        \langle x^*, x\rangle - g(x) + \langle Ax, z^*\rangle + h^\star(-z^*)
    \right\rbrace
    \\
    &= \sup_x\left\lbrace
        \langle x, x^* + A^Tz^*\rangle - g(x)
    \right\rbrace + h^\star(-z^*)
    \\
    &= g^\star\left(x^* + A^T z^*\right) + h^\star(-z^*). 
\end{aligned}
$$

$\blacksquare$

#### **Theorem | Primal Dual value functions and strong duality**
> Let $h:\R^m \rightarrow \overline \R, g: \R^n \rightarrow \overline \R$ be convex, closed and proper functions. 
> Let $A \in \R^{m\times n}$. 
> 1. Define $F:\R^m \times \R^n :=(x, y)\mapsto  g(x) + h(Ax - y)$. 
> 2. Define value function $p(y) := \inf_x F(x, y)$. 
> 3. Define, dual value function $q(u) := \sup_{v}- F^\star(u, v)$. 
> 
> If $\mathbf 0 \in \text{ri.dom}\; p$, then strong duality holds and $p(\mathbf 0) = q(\mathbf 0)$.

**Proof**

The function $F(x, y) = g(x) + h(Ax - y)$ is convex proper and closed because both $g, h$ are convex proper closed function. 
Hence, Theorem 1 applies and, it has $p(\mathbf 0) = p^{\star\star}(\mathbf 0)= q(\mathbf 0)$ which gives strong duality by Proposition 1. 
$\blacksquare$

