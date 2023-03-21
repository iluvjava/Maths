[[Dualization Techniques]], finding the Fenchel dual for a given function. [[Convex Conjugation]], the definition and interpretations for a convex conjugate of a function, and [[Duality/MinMax MaxMin Lemma]]. 


---
### **Intro**


**Theorem: Fenchel Rockafellar Dual Problems**
> Let $g: \mathbb X\mapsto \mathbb{\bar{R}}$, let $h: \mathbb{Y}\mapsto \mathbb{\bar R}$, let $A$ be a linear mapping from $\mathbb X$ to $\mathbb Y$, then the primal and the dual problem have the following format: 
> 
> $$
> \begin{aligned}
>     \begin{cases}
>         \mu = \inf_{x\in \mathbb X} \{g(x) + h(Ax)\}
>         \\
>         \mu^\star = \sup_{y\in \mathbb Y} \{-h^\star(-y) - g^\star(A^*y)\}
>     \end{cases}
> \end{aligned}
> $$
> If strong duality holds, then the primal and dual objective will be the same. 

**Observations**: 

From the properties of the convex conjugate, the dual problem is obvious, concave with the maximization objective. 


**Strong Duality Conditions:**
The simultaneous existence of minizers for the primal and dual such that, their objective values are equaled to each other is characterized by the following theorem: 

**Theorem: Duality**
> Let $x\in \text{dom}(g), y \in \text{dom}(h)$, then all of the following are equivalent: 
> 1. $x$ is a primal solution and $y$ is a dual solution achieving: $\mu = \mu^\star$. 
> 2. $g(x) + h(Ax) = -g^\star(A^*y) - h^\star(-y)$. 
> 3. $x\in \partial g^\star(A^*y)$, and $Ax\in \partial h^\star(-y)$
> 4. $x\in \partial g^\star(A^*y)$ and $-y \in \partial h(Ax)$. 
> 5. $x\in (\partial g)^{-1}(A^*y)$ and $-y\in \partial h(Ax)$. 

**Proof**: 

Consult theorem 20.4 in Heinz's coursenots for more information. 

**Note**

* The primal dual euclidean space is $\mathbb X, \mathbb Y$, so that A is a mapping $\mathbb X \mapsto \mathbb Y$. 
* Operator $A$ is a linear operator. 

**References**: Sasha, AMATH 515, of the Dualization Techniques, combined with Heinz's class materials, chapter 20 to be precise. 

---
### **Demonstrations**

The duality statement can be constructed by using Dualizations techniques and the [[Duality/MinMax MaxMin Lemma]]. Starts by considering the following facts with $f, g$ instead: 

$$
\begin{aligned}
    g(Ax) &= 
    \sup_{y\in Y}\left\lbrace
       \langle y, Ax\rangle - g^\star(y)
    \right\rbrace
    \\
    (P) &:= 
    \inf_{x\in X}
    \left\lbrace
       f(x) + g(Ax)
    \right\rbrace, 
\end{aligned}
$$

we write down the objective of $(P)$ and substitute the dual representation for one of the function: $g(Ax)$, giving us: 

$$
\begin{aligned}
    & \quad \inf_{x\in X}\left\lbrace
       f(x) + \sup_{y\in Y}
       \left\lbrace
          \langle y, Ax\rangle - g^\star(y)
       \right\rbrace
    \right\rbrace
    \\
    &= 
    \inf_{x\in X}
    \sup_{y\in Y}
    \left\lbrace
        f(x) + \langle y, Ax\rangle - y^\star(y)
    \right\rbrace
    \\
    & \le 
    \sup_{y\in Y}
    \left\lbrace
        -g^\star(y)
        + 
        \inf_{x\in X}
        \left\lbrace
            f(x) + \langle y, Ax\rangle
        \right\rbrace
    \right\rbrace  \quad \text{ Minmax Lower Bounding}
    \\
    & = 
    \sup_{y\in Y}
    \left\lbrace
        -g^\star(y)
        - 
        \sup_{x\in X}
        \left\lbrace
            - f(x) - \langle y, Ax\rangle 
        \right\rbrace
    \right\rbrace
    \\
    & = 
    \sup_{y\in Y}
    \left\lbrace
        -g^\star(y)
        - 
        \sup_{- x\in X}
        \left\lbrace
            \langle y, Ax\rangle - f(-x)
        \right\rbrace
    \right\rbrace
    \\
    & = 
    \sup_{y\in Y}
    \left\lbrace
        -g^\star(y) - 
        [f\circ (-I)]^\star(A^Ty)
    \right\rbrace, 
\end{aligned}
$$

And finally, we make the claim that $[f\circ (-I)]^\star = f^\star \circ(-I)$, and this will provide us with the chance to substitute $-y\in Y$ instead, giving us: 

$$
\begin{aligned}
    & \quad \sup_{-y\in Y} \left\lbrace
        -g^\star(-y) - [f^\star\circ(-I)](-A^Ty)
    \right\rbrace
    \\
    &= 
    \sup_{-y\in Y}\left\lbrace
        -g\star(-y) - f^\star(A^Ty)
    \right\rbrace, 
\end{aligned}
$$

and this derivation shows that the dual variable $y$ for the dualization of $g(Ax)$ is strictly negative of the dual variable in the end of the Fenchel Rockefellar Transform. For simplicity, we have the option to write the dual problem in triplet form that are easier to manipulate for things: 

**Theorem: The Weak Duality**
> 



---
### **Examples**


---
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [[Introducing The KKT Conditions]] for an introduction. 