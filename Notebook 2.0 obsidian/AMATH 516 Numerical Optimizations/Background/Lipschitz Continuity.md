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

For this part of the content, we faithfully follow Prof Wang's teaching of MATH 564 at the university of Britich Columbia, Okanagan. 

#### **Def 2.29 | Lipschitz Function**

> Let $A\subseteq \mathbb R^n$, We say that $f: \mathbb R^n \mapsto \mathbb R$ is Lipschitz if $\exists K > 0$ such that $|f(x)  - f(y)| \le K\Vert x - y\Vert$ for all $x, y \in \mathbb A$. 
> 1. When $A$ is $\mathbb R^n$, we say that $f$ is a *Lipschitz function*. 
> 2. We say that if $f$ is *locally Lipschitz* on $O \subseteq \mathbb R^n$ if for all $x \in O$, there exists $\mathcal N(x) \subseteq O$, a neighbourhood of $x$ that is in $O$, such that $f$ is Lipschitz on $N(x)$. 


**Observations**

If the topology defines the neighbourhood function to be the open ball around $x$, then we have point $x$ in the boundary to be inadmissible for neithbourhood $\mathcal N(x)$, meaning that all locally Lipschitz function are locally Lipschitz on an open set. 

#### **Example**

> Let $f = x^2$ be a function on $\mathbb R$, then 
> 1. $f$ is locally Lipschitz. 
> 2. $f$ is not a Lipschitz function! 

**Demonstration**