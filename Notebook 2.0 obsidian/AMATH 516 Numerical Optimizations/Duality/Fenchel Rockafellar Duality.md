- [Dualization Techniques](Dualization%20Techniques.md). 
- [Convex Conjugation Introduction](Duality/Convex%20Conjugation%20Introduction.md)
- [MinMax MaxMin Lemma](Duality/MinMax%20MaxMin%20Lemma.md). 
- [Fenchel Identity, Inequality](Duality/Fenchel%20Identity,%20Inequality.md)
- [Fenchel Rockafellar Weak Duality](Fenchel%20Rockafellar%20Weak%20Duality.md)

---
### **Intro**

The duality theorem, straight from the legendary researchers. 
We phrase the theorem and then we discuss its details, and problems. 


#### **Theorem 1 | Fenchel Rockafellar primal dual problems**
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

#### **Theorem 2 | Fenchel Rockafellar Duality equivalences**
> Let $x\in \text{dom}(g), y \in \text{dom}(h)$, then all the following are equivalent: 
> 1. $x$ is a primal solution and $y$ is a dual solution achieving: $\mu = \mu^\star$. 
> 2. $g(x) + h(Ax) = -g^\star(A^*y) - h^\star(-y)$. 
> 3. $x\in \partial g^\star(A^*y)$, and $Ax\in \partial h^\star(-y)$
> 4. $x\in \partial g^\star(A^*y)$ and $-y \in \partial h(Ax)$. 
> 5. $x\in (\partial g)^{-1}(A^*y)$ and $-y\in \partial h(Ax)$. 

**Proof**: 

The equivalence between 2, 3, 4, 5, are self evident. 
We will prove $(1)\iff (2)$. 


$\blacksquare$

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

The theorem follows describes a sufficient conditions for strong duality. 

#### **Theorem 3 | Regularity Conditions and existence of minimizers**

> For any of the following conditions, if they hold for $f, g$, then, the primal and dual will have a solution with zero duality gap. 
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
### **Examples**

For a preliminary example, see [Apply Fenchel Rockafellar Dual to Linear Program](../../AMATH%20515%20Optimization%20Fundamentals/Apply%20Fenchel%20Rockafellar%20Dual%20to%20Linear%20Program.md). 
We make some examples that illustrate some subtleties behind the Fenchel Rockafaller duality, especially about the existence of the minimizers for the primal and the dual problems. 


---
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [Introducing The KKT Conditions](Introducing%20The%20KKT%20Conditions.md) for an introduction. 
For a derivation of the Fenchel Rockafellar Strong Duality via convex parametric pertubation Frameworks and KKT, see [Convex Parametric Minimization and Strong Duality](Convex%20Parametric%20Minimization%20and%20Strong%20Duality.md). 