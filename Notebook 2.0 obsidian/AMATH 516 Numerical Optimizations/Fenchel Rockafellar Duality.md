[[Dualization Techniques]], finding the Fenchel dual for a given function. [[Convex Conjugation]], the definition and interpretations for a convex conjugate of a function. 


---
### **Intro**


> This is the Fenchel Rockafellar Duality is stated as the following: 
> 
> $$
> \begin{aligned}
>     \begin{cases}
>         \inf_{x\in \mathbb X} \{g(x) + h(Ax)\}
>         \\
>         \sup_{y\in \mathbb Y} \{-h^\star(-y) - g^\star(A^*y)\}
>     \end{cases}
> \end{aligned}
> $$
> If strong duality holds, then the primal and dual objective will be the same. 

**Note**

* The primal dual euclidean space is $\mathbb X, \mathbb Y$, so that A is a mapping $\mathbb X \mapsto \mathbb Y$. 
* Operator $A$ is a linear operator. 

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
    \right\rbrace
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

and this derivation shows that the dual variable $y$ for the dualization of $g(Ax)$ is strictly negative of the dual variable in the end of the Fenchel Rockefellar Transform. 

---
### **Examples**


---
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [[Introducing The KKT Conditions]] for an introduction. 