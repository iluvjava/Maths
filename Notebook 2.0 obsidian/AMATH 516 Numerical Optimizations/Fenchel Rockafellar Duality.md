[[Dualization Techniques]], finding the fenchel dual of a given function. 

[[Convex Conjugation]], the definition and interpretations for a convex conjugate of a function. 


---
### **Intro**

``
> This is the Fenchel Fenchel Rockafellar Duality is stated as the following: 
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
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [[Introducing The KKT Conditions]] for an introduction. 