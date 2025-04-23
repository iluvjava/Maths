[[Dualization Techniques]], finding the Fenchel dual for a given function. [[Duality/Convex Conjugation Introduction]], the definition and interpretations for a convex conjugate of a function, and [[Duality/MinMax MaxMin Lemma]]. 

We might need to use [[Duality/Fenchel Identity, Inequality]] one theorem characterizing the existence of the minimizers for the primal and the dual problems. 


---
### **Intro**

The duality theorem, straight from the legendary researchers. We phrase the theorem and then we discuss its details, and problems. 


#### **Theorem-1 | Fenchel Rockafellar Dual Problems**
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
> If strong duality holds, then the primal and dual objective will be the same, i.e: $\mu = \mu^\star$. 

**Observations**: 

From the properties of the convex conjugate, the dual problem is obviously, concave. 

**Standing Assumptions**: 

We assume that $f, g$ are convex, closed and proper functions. This is required for the discussion of duality, but not necessary for generating the primal and the dual problem. 


**Strong Duality Condition:**

The simultaneous existence of minimizers both primal and dual such that their objectives are equaled is characterized following theorem: 

#### **Theorem-2 | Fenchel Rockafellar Duality**
> Let $x\in \text{dom}(g), y \in \text{dom}(h)$, then all of the following are equivalent: 
> 1. $x$ is a primal solution and $y$ is a dual solution achieving: $\mu = \mu^\star$. 
> 2. $g(x) + h(Ax) = -g^\star(A^*y) - h^\star(-y)$. 
> 3. $x\in \partial g^\star(A^*y)$, and $Ax\in \partial h^\star(-y)$
> 4. $x\in \partial g^\star(A^*y)$ and $-y \in \partial h(Ax)$. 
> 5. $x\in (\partial g)^{-1}(A^*y)$ and $-y\in \partial h(Ax)$. 

**Proof**: 

Consult theorem 20.4 in Heinz's course notes for more information. 

**References**: 

Theorem 20.4 in Heinz's course notes for the 563 optimization class at UBCO. 

#### **Corollary | Primal Solution via Dual Solution**
> Assuming that the dual problem has a solution, denoted as $y^+$, and there is no duality gap, meaning that $\mu^\star = \mu$, then the set of primal solutions has: 
> $$
> \begin{aligned}
>   {\arg\inf}_{x\in \mathbb X}\{g(x) + h(Ax)\} = \partial g^\star(A^*y)\cap A^{-1}(\partial h^\star(-y)). 
> \end{aligned}
> $$
> And, it's very much possible to have an empty set for the above dual characterizations for the primal optimal solutions.

#### **Theorem-3 | Regularity Conditions and existence of Minimizers**

> For any of the following conditions, if they hold for $f, g$, then, the primal and dual will have a solutions with zero duality gap. 
> 1. $\text{ri.dom}(g)\cap A(\text{ri.dom}(f))\neq \emptyset$ or, 
> 2. $\text{int.dom}(g)\cap A(\text{dom}(f))\neq \emptyset$ or,
> 3. $g$ is polyhedral and $\text{dom}(g)\cap \text{ri}(A(\text{dom}(f)))\neq \emptyset$ or, 
> 4. $f, g$ are polyhedral and $(\text{dom}(f))\cap A(\text{dom}(f))\neq \emptyset$. 

**Reference**: 

The above theorem that characterizes the existence of the solution for the primal and dual, are presented in section 5.4 of Prof Heinz's Textbook. 

**Notes**

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

$$
\begin{aligned}
    (f, A, g)^\star = (g^\star\circ(-I), A^*, f^\star),
\end{aligned}
$$

giving us the dual, and the primal problem, for easy notation. 


**Remarks for Demonstrations**

Things doesn't have to be convex for the above derivation to be correct. The convexity is really for the strong duality. 

#### **Theorem-4 | The Weak Duality**
> For all $(x, y)\in X\times Y$, we have
> $$ 
> f(x) + g(Ax) \ge \mu \ge \mu^\star \ge - f^\star(A^*y) - g^\star(-y) 
> $$

**Proof**
#UNFINISHED

**Remarks**: 

Sometimes, weak duality can be arbitrarily bad. The optimality gap can be infinite, and that would be somewhat common. 


---
### **Examples**

For a preliminary example, see [Apply Fenchel Rockafellar Dual to Linear Program](../../AMATH%20515%20Optimization%20Fundamentals/Apply%20Fenchel%20Rockafellar%20Dual%20to%20Linear%20Program.md). 

We make some examples that illustrate some subtleties behind the Fenchel Rockafaller duality, especially about the existence of the minimizers for the primal and the dual problems. 

**Example 1 | Non-Existence of Minimizers**




---
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [[Introducing The KKT Conditions]] for an introduction. 