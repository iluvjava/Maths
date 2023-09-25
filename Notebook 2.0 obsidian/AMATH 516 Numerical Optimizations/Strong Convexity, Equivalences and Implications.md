[[Characterizing Functions for Optimizations]]
[[Non-Smooth Calculus/Subgradient Intro]]

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
3. $f(\lambda x + (1 - \lambda)y) \le \lambda f(x) + (1 - \lambda)f(y) -\alpha\frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2, \forall \lambda \in [0, 1]$


**Remarks**

We abuse notation slightly and write the subgradient inside of the inner product, resulting in the inner product being a set of values. In the definition, the norm is not specified, and it doesn't have to be the Euclidean norm. 

1. The condition is saying that the difference between the affine minorants of the function at a given point $x$ and the function itself can is a coercive function. one immediate consequence of this formulation is that strong convex function is coercive.
2. The condition is saying that the subgradient of a strongly convex function is more than monotone, and it has a lower bound to the monotonicity of the subgradient operator. 
3. The condition is a stronger version of the Jensen's inequality for the convex case. 

**Theorem 1 | Equivalences**
> Conditions 1, 2, 3 are all equivalent to the definition of strong convexity of a function. 

---
### **Implications**

Let $f:\mathbb E\mapsto \mathbb{\bar R}, \alpha > 0$, we consider the following conditions for the function: 

4. $\frac{1}{2}\text{dist}(\mathbf 0; \partial f(x))^2 \ge \alpha (f(x) - f^+)$ where $f^+$ is a minimum of the function, and this is called the Polyak-Lojasiewicz (PL) inequality.
	1. References, for globally Lipschitz Gradient strongly convex functions: [here](https://angms.science/doc/NCVX/PolyakLojasiewiczIQ.pdf). 
5. $\forall x, y\in \mathbb E, u\in \partial f(x), v\in \partial f(y): \Vert u - v\Vert\ge \alpha\Vert x - y\Vert$. 
6. $f(y) \le f(x) + \langle \partial f(x), y - x\rangle + \frac{1}{2\alpha}\Vert u - v\Vert^2, \forall u\in  \partial f(x), v\in \partial f(y)$. 
7. $\langle \partial f(x)-\partial f(y), x - y\rangle \le \frac{1}{\alpha}\Vert u - v\Vert^2, \forall u\in \partial f(x), v\in \partial f(y)$. 
8. if $x^+\in \arg\min_{x}f(x)$ then $f(x) - f(x^+) \ge \frac{\alpha}{2}\Vert x - x^+\Vert^2$ and $x^+$ is a unique minimizer. 

**Theorem 2 |  Weaker Implications**

Conditions 4, 5, 6, 7 are all implied by the strong convexity, and those statements are important to convergence analysis for different algorithm however, they will be more general properties for functions. 

**Remarks**

4. Conditions 5 links the optimality for the function to the distance of the subgradient set to the zero vector. 
5. Condition 5 gives a lower bound for how much the gradient should change given the distance from $\Vert x - y\Vert$. 


---
### **Proofs**

**\[1\]=>\[4\]**

> Strong convexity means that the PL-Inequality is satisfied. 

Directly from \[1\] for all $x, y\in \mathbb R$. 

$$
\begin{aligned}
	f(y) - f(x) - \langle \partial f(x), y -x\rangle &\ge 
	\frac{\beta}{2}\Vert y - x\Vert^2
	\\
	\implies 
	\min_{y} f(y)
	&\ge \min_y
	\left\lbrace
	  \frac{\beta}{2}\Vert y - x\Vert^2 + f(x) + \langle \partial f(x), y -x\rangle
	\right\rbrace
	\\
	\mathbf 0 &\in \beta(y - x) + \partial f(x) \quad \textcolor{gray}{\triangleright \text{ let, y minimizes, exist cause quadratic objective}}
	\\
	\iff y &\in x - \frac{1}{\beta} \partial f(x)
	\\
	\implies 
	f(x_*) &\ge 
	\frac{\beta}{2}\left\Vert 
		\frac{1}{\beta}\partial f(x)
	\right\Vert^2 + f(x) + 
	\left \langle 
		\partial f(x), -\frac{1}{\beta}\partial f(x)
	\right\rangle \; \forall x \in \mathbb R^n
	\\
	& \ge \max_{u \in \partial f(x)}\left\lbrace
	   \frac{1}{2\beta} \Vert u\Vert^2 + f(x) - \frac{1}{\beta}\Vert u\Vert^2
	\right\rbrace
	\\
	&= f(x) -\frac{1}{2\beta} \min_{u\in \partial f(x)} \Vert u\Vert^2
	\\
	&= f(x) - \frac{1}{2\beta} \text{dist}^2_{\partial f(x)}(\mathbf 0).
\end{aligned}
$$

Therefore, the size of the subgradient bounds the objective value of the function, simplifying the above statement provides us with $f(x) - f(x_*) \le \frac{1}{2\beta }\text{dist}_{\partial f(x)}^2(\mathbf 0)$. 
