[Dualization Techniques](../AMATH%20515%20Optimization%20Fundamentals/Duality%20Remastered/Dualization%20Techniques.md)
[Convex Conjugation](Duality/Convex%20Conjugation.md)


---
### **Intro**


> This is the Fenchel Fenchel Rockafellar Duality is stated as the following: 
> 
> $$
> \begin{aligned}
>     \begin{cases}
>         \inf_{x\in \mathbb X} \{h(Ax) + g(x)\}
>         \\
>         \sup_{y\in \mathbb Y} \{-h^\star(y) - g^\star(-Ay)\}
>     \end{cases}
> \end{aligned}
> $$
> If strong duality holds, then the primal and dual objective will be the same. 

**Note**

* The primal dual euclidean space is $\mathbb X, \mathbb Y$. 
* Operator $A$ is a linear operator. 


---
### **Remarks**

Fenchel Rockafellar is a special case of KKT duality. For an intro for KKT, see: [Introducing The KKT Conditions](Background/Introducing%20The%20KKT%20Conditions.md) for an introduction. 