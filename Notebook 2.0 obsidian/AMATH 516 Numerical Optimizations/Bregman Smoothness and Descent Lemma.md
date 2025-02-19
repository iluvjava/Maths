- [Bregman Divergence](Bregman%20Divergence.md)
- [Bregman Proximal Mapping](Bregman%20Proximal%20Mapping.md)

---
### **Intro**

Combining Bregman divergence and Proximal mapping, we can create a descent lemma analogous to gradient descent with globally Lipschitz smooth function. 
See [L-Smoothness as an Implication of Globally Lipschitz Gradient Under Convexity](Properties%20of%20Functions/Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) for more information about that.
The results and characterizations are also similar. 
These servers as a basis for the mirror descent algorithm. 
For this part we take heavy references from paper by Heinz et al[^1]. 

---
### **Specifications of Problem Types**

We are interested in $C \subseteq \mathbb R^n$ where $\text{int}(C)\neq \emptyset$. 
We consider the convex problem problem of the form 
$$
    \inf\left\lbrace
        \Phi(x) := f(x) + g(x) \; |\;  x \in C
    \right\rbrace. 
$$

where $f, g$ are proper convex and $g$ is also continuously differentiable with $\text{int.dom}(g)\neq \emptyset$. 
It's tempting to use projected subgradient. 
However that would be slow and it won't take advantage of the smooth plus non-smooth composite structure of the problem. 
If we use proximal gradient, we would need to frequently project onto the set $C$, and we lose the convergence proof. 
In addition to the previous drawback of using proximal gradient, the function $g$ in our case is also not $L$-Lipschitz globally smooth. 
We will develop some theories for smoothness relative to a Bregman divergence. 
We will also develop descent lemma that is analogous to the $L$-Lipschitz smooth case. 

#### **Philosophy of Generalizing Smoothness Relative to a Bregman Divergence**
Recall from [Global Lipschitz Gradient, Strong Smoothness, Equivalence and Implications](Properties%20of%20Functions/Global%20Lipschitz%20Gradient,%20Strong%20Smoothness,%20Equivalence%20and%20Implications.md) that if function $F$ is $L$-Lipschitz smooth, then $L/2 \Vert \cdot\Vert^2 - f$ is a convex function. 
Since $L/2 \Vert \cdot\Vert^2 - f$ is convex, we have the equivalent characterization of smoothness we have for all $x, y \in \mathbb R^n$

$$
\begin{aligned}
    (L\Vert y\Vert^2/2 - f(y)) - (L\Vert x\Vert^2/2 - f(x)) \ge 
    \langle Lx - \nabla f(x), y - x\rangle. 
\end{aligned}
$$

The key idea here is to realize that the energy function $\omega(x) = \frac{\Vert x\Vert^2}{2}$ has the ability to induce a Bregman divergence and therefore the above condition of smoothness is relative to a specific $\omega$. 
For any $\omega$ that can induce a Bregman divergence, we say that $f$ is Bregman smooth wrt $\omega$ when $\omega(x) - f(x)$ is a convex function. 


#### 


[^1]: H. H. Bauschke, J. Bolte, and M. Teboulle, “A Descent Lemma Beyond Lipschitz Gradient Continuity: First-Order Methods Revisited and Applications,” Mathematics of OR, vol. 42, no. 2, pp. 330–348, May 2017, doi: 10.1287/moor.2016.0817.
