[Real Analysis Basics](Real%20Analysis%20Basics.md)

---
### **Intro**

Lipschitz Continuity is a type of continuity for function. Let's consider the Euclidean space to be the metric space and we consider functions of the type: $f(x):\mathbb{R}^m\mapsto \mathbb{R}^n$. Then, the function is Lipschitz if: 

> $$
> \exists L\in \mathbb{R}: \Vert f(x) - f(y)\Vert \le L \Vert x - y\Vert
> $$

Sometime, the function has Lipschitz Continuity over a compact domain, in that case the function is referred as Locally Lipschitz. 

**Remarks**

Take notes that, all Lipschitz continuous functions are also uniformly continuous. 
This is direct from the definition above. 
Proof Skipped. However, the converse is not true and one exception is $\sqrt{x}$ where it has it's derivative being unbounded at $x = 0$, uniformly continuous is a more general characteristics for functions compare to Lipschitz, but they are very god damn close. The statement that is stronger than Lipschitz continuity is differentiable function, under the ordinary definition of differentiability. 

$||\cdot||$ here is any norm, more importantly, it can be entirely different norm. Things are very different when we are in infinite dimensional spaces. 


---
### **Beta-Smoothness**

A function is beta smooth if its derivative is Lipschitz Continuous.  See [Beta Smoothness](Beta%20Smoothness.md) for more information. 
The condition of beta-smoothness is stronger than Lipschitz continuity.
See [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information about using the global Lipschitz continuity used in convex optimization methods. 


---
### **Local Lipschitz Coninuity**

