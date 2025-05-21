- [MinMax MaxMin Lemma](MinMax%20MaxMin%20Lemma.md)
- [Convex Conjugation Introduction](Convex%20Conjugation%20Introduction.md)

---
### **Intro**

We will introduce weak duality. 
Let $\mathbb X, \mathbb Y$ be two Hilbert space. 
Let $g:\mathbb X\rightarrow \overline \R, h:\mathbb Y \rightarrow \overline \R$ be proper functions. 
Let $A:\mathbb X \rightarrow \mathbb Y$ be a linear mapping and $A^*$ denotes its adjoin. 
The following should be obvious: 

$$
\begin{aligned}
    \inf_{x \in \mathbb X}\left\lbrace
        g(x) + h(Ax) 
    \right\rbrace &\ge 
    \inf_{x \in \mathbb X} \left\lbrace
        g(x) + h^{\star\star}(Ax)
    \right\rbrace
    \\
    &= \inf_{x \in \mathbb X} \left\lbrace
        g(x) + \sup_{y \in \mathbb Y} \left\lbrace
            \langle y, Ax\rangle - h^\star(y)
        \right\rbrace
    \right\rbrace
    \\
    &= \inf_{x \in \mathbb X} \sup_{y \in \mathbb Y}
    \left\lbrace
        g(x) + \langle y, Ax\rangle - h^\star(y)
    \right\rbrace
    \\
    &\ge 
    \sup_{y \in \mathbb Y}\inf_{x \in \mathbb X}
    \left\lbrace
        g(x) + \langle y, Ax\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \sup_{y \in \mathbb Y} 
    \left\lbrace
        - \sup_{x \in \mathbb X} \left\lbrace
            - g(x) - \langle A^*y, x\rangle
        \right\rbrace - h^\star(y)
    \right\rbrace
    \\
    &= \sup_{y \in \mathbb Y} 
    \left\lbrace
        - g^\star(- A^* y)
        - h^\star (y)
    \right\rbrace
    \\
    &= -\inf_{y \in \mathbb Y} \left\lbrace
        g^\star(- A^* y) + h^\star(y)
    \right\rbrace. 
\end{aligned}
$$

This is the weak duality, it shows the lower bound of any optimization problem is another optimization problem using the theories of conjugates. 
There are several quantities in the above chain of inequalities that has names. 

$$
\begin{aligned}
    p^+:= \inf_{x \in \mathbb X}\left\lbrace
        g(x) + h(A x)
    \right\rbrace & \quad \text{Primal Optimal},
    \\
    \mathcal L(x, y) 
    := g(x) + \langle y, Ax\rangle - h^\star(y)
    & \quad \text{Primal Dual Lagrangian}, 
    \\
    q^+:= \sup_{y\in \mathbb Y}\left\lbrace
        - g^\star(- A^* y) - h^\star(y)
    \right\rbrace & \quad 
    \text{Dual Optimal}. 
\end{aligned}
$$

Now consider for all $(u, v) \in \mathbb X \times \mathbb Y$. 
Now look: 

$$
\begin{aligned}
    g(u) + h(Au) &\ge 
    g(u) + h^{\star\star}(Au) 
    \\
    &= g(u) + \sup_{y \in \mathbb Y}\left\lbrace
        \langle y, Ax\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \sup_{y \in \mathbb Y}\left\lbrace
        \langle y, Ax\rangle + g(u) - h^\star(y)
    \right\rbrace 
    \\
    & = \sup_{y \in \mathbb Y} \mathcal L(u, y)
    \\
    &\ge 
    \underbrace{\inf_{x \in \mathbb X}
        \sup_{y\in \mathbb Y} \mathcal L(x, y)
    }_{\le p^+}
    \\
    & \ge \sup_{y \in \mathbb Y}\inf_{x \in \mathbb X} \mathcal L(x, y)
    \\
    &= \sup_{y \in \mathbb Y}\inf_{x \in \mathbb X} 
    \left\lbrace
        g(x) + \langle A^*y, x\rangle - h^\star(y)
    \right\rbrace
    \\
    &= \sup_{y \in \mathbb Y} \left\lbrace
        - \mathcal g^\star(- A^* y) - h^\star(y)
    \right\rbrace \\ 
    &= q^+ 
    \\
    & \ge - g^\star(-A^* v) - h^\star(v)
    \\
    &= - \sup_{x \in \mathbb X}\left\lbrace
        \langle x, - A^* v\rangle - g(x) 
    \right\rbrace - h^\star(v)
    \\
    &= \inf_{x \in \mathbb X}\left\lbrace
        g(x) - \langle Ax, v \rangle 
    \right\rbrace - h^\star(v)
    \\
    &= \inf_{x \in \mathbb X}
        \mathcal L(x, v)
    . 
\end{aligned}
$$

Now, it has the following if we only look at the key inequalities

$$
\begin{aligned}
    g(u) + h(Au) \ge 
    g(u) + h^{\star\star}(Au) \ge 
    \underbrace{\inf_{x\in \mathbb X}\sup_{y \in \mathbb Y} \mathcal L(x, y)}_{\le p^+}
    \ge 
    \underbrace{\sup_{y \in \mathbb Y} \inf_{x \in \mathbb X} \mathcal L(x, y)}_{=q^+}
    \ge - g^\star(-A^*v) - h^\star(v) = \inf_{x \in \mathbb X} \mathcal L(x, v). 
\end{aligned}
$$

In convex programming. 
All of these quantities are equal. 
This is call strong duality and people talk about it a lot because it propels a type of algorithm referred to as "Primal Dual Algorith" for mathematical programming. 