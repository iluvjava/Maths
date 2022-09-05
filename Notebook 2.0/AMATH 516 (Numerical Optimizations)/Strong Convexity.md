[[Characterizing Functions for Optimizations]]
[[Subgradient and Subdifferential Definition]]

---
### **Intro**

Here in this file we make use the following specific references: 

**References**: 
* Blog Post: [here](http://xingyuzhou.org/blog/notes/strong-convexity)
* Arxiv paper with more discussions and proofs: [here](https://arxiv.org/pdf/1803.06573.pdf)
  
**Definition**

> Let function $f:\mathbb E \mapsto \mathbb{\bar R}$ be strongly convex, then there exists $\alpha > 0$ such that $f - \frac{\alpha}{2}\Vert x\Vert^2$ is a convex function. 


Let $f:\mathbb E\mapsto \mathbb{\bar R}$ is a $\alpha$ strongly convex function then for any $x,y\in \mathbb E$, the following conditions are equivalent: 

1. $f(y) - f(x) - \langle \partial f(x),y - x \rangle\ge \frac{\alpha}{2}\Vert y - x\Vert^2$
2. $\langle \partial f(y) - \partial f(x), y - x\rangle \ge \frac{\alpha}{2}\Vert y - x\Vert^2$. 
3. $f(\alpha x + (1 - \alpha)y) \le \alpha f(x) + (1 - \alpha)f(y) -\frac{\alpha(1 - \alpha)}{2}\Vert y - x\Vert^2, \forall \alpha \in [0, 1]$


**Remarks**

We abuse notation slightly and write the subgradient inside of the inner product, resulting in the inner product being a set of values. 

1. The condition is saying that the difference between the affine minorants of the function at a given point $x$ and the function itself can is a coercive function. one immediate consequence of this formulation is that strong convex function is coercive.
2. The condition is saying that the subgradient of a strongly convex function is more than monotone, and it has a lower bound to the monotonicity of the subgradient operator. 
3. The condition is a stronger version of the Jensen's inequality for the convex case. 

**Theorem 1: Equivalences**
> Conditions 1, 2, 3 are all equivalent to the definition of strong convexity of a function. 

**Proof** 
*#TODO Remember to add the proofs for equivalances characterizations of strongly convex functions*

---
### **Implications**

Let $f:\mathbb E\mapsto \mathbb{\bar R}, \alpha > 0$, we consider the following conditions for the function: 

4. $\frac{1}{2}\text{dist}(\mathbf 0; \partial f(x))^2 \ge \alpha (f(x) - f^+)$ where $f^+$ is a minimum of the function, and this is called the Polyak-Lojasiewicz (PL) inequality. 
5. $\forall x, y\in \mathbb E, u\in \partial f(x), v\in \partial f(y): \Vert u - v\Vert\ge \alpha\Vert x - y\Vert$. 
6. $f(y)- f(x) - \langle \partial f(x), y - x\rangle + \frac{1}{2\alpha}\Vert u - v\Vert, \forall u\in \partial f(x), v\in \partial f(y)$. 
7. $\langle \partial f(x)-\partial f(y), x - y\rangle \le \frac{1}{\alpha}\Vert u - v\Vert, \forall u\in \partial f(x), v\in \partial f(y)$. 

**Theorem**

Conditions 4, 5, 6, 7 are all implied by the strong convexity, and those statements are important to convergence analysis for different algorithm however, they will be more general properties for functions. 


**Remarks**

4. Conditions 5 links the optimality for the function to the distance of the subgradient set to the zero vector. 
5. Condition 5 gives a lower bound for how much the gradient should change given the distance from $\Vert x - y\Vert$. 



### **Proofs**

**#TODO: Read the paper and add more proofs if you feel like it.**
