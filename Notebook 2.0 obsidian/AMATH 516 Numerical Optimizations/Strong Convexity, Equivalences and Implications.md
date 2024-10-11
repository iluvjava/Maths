[[Characterizing Functions for Optimizations]]
[[Non-Smooth Calculus/Subgradient Intro]]

---
### **Intro**

Here in this file we make use the following specific references: 

**References**: 
* Blog Post: [here](http://xingyuzhou.org/blog/notes/strong-convexity)
* Arxiv paper with more discussions and proofs: [here](https://arxiv.org/pdf/1803.06573.pdf)
* Chapter of Nesterov book "Lectures on Convex Optimizations" is also a good source. However he consider smooth function. 
  
#### **Def | Strongly Convex Function**

> Let function $f:\mathbb E \mapsto \mathbb{\bar R}$ be strongly convex, then there exists $\alpha > 0$ such that $f - \frac{\alpha}{2}\Vert x\Vert^2_2$ is a convex function. 

**Remarks**

Be careful about the use of 2-norm here. In the general case, things might change, and there are alternative definition of strong convexity that works with different norm and vector spaces. This definition can be generalized with the energy norm. Generalizing to other norms (such as the infinity norm) will break the definition. 

**Conditions**

Let $f:\mathbb E\mapsto \mathbb{\bar R}$ is a $\alpha$ strongly convex function then for any $x,y\in \mathbb E$, the following conditions are equivalent: 

1. $f(y) - f(x) - \langle \partial f(x),y - x \rangle\ge \frac{\alpha}{2}\Vert y - x\Vert^2$
2. $\langle \partial f(y) - \partial f(x), y - x\rangle \ge \alpha\Vert y - x\Vert^2$. 
3. $f(\lambda x + (1 - \lambda)y) \le \lambda f(x) + (1 - \lambda)f(y) -\alpha\frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2, \forall \lambda \in [0, 1]$, the stronger Jensen's inequality for strong convex function. 


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
6. $f(y) \ge f(x) + \langle u, y - x\rangle + \frac{1}{2\alpha}\Vert u - v\Vert^2, \forall u\in  \partial f(x), v\in \partial f(y)$. 
7. $\langle \partial f(x)-\partial f(y), x - y\rangle \le \frac{1}{\alpha}\Vert u - v\Vert^2, \forall u\in \partial f(x), v\in \partial f(y)$. 
8. if $x^+\in \arg\min_{x}f(x)$ then $f(x) - f(x^+) \ge \frac{\alpha}{2}\Vert x - x^+\Vert^2$ and $x^+$ is a unique minimizer. 

**Theorem 2 |  Weaker Implications**

> Conditions 4, 5, 6, 7 are all implied by the strong convexity, and those statements are important to convergence analysis for different algorithm however, they will be more general properties for functions. 

**Remarks**

4. Conditions 5 links the optimality for the function to the distance of the subgradient set to the zero vector. 
5. Condition 5 gives a lower bound for how much the gradient should change given the distance from $\Vert x - y\Vert$. 

---
### **Strongly Convex and Smoothness Together**

There are some results that only happens with both strong convexity and Lipschitz smoothness of the function. 
These results are occasionally useful, especially deriving the best kind of behavior an algorithm can experience. 


---
### **Proofs for Theorem 1**

**\[Def\] <=> \[3.\]**

We show that the definition of a strongly convex function is equivalent to having a strong Jensen's Inequality, with the assumptions that $\Vert \cdot\Vert$ is the Euclidean norm. It's direct and consider any $\lambda \in (0, 1)$, we have 

$$
\begin{aligned}
	f(\lambda x + (1 - \lambda)y) &\le
	\lambda f(x) + (1 - f(y)) - \alpha\frac{\lambda(1 - \lambda)}{2}\Vert y - x\Vert^2
	\\
	&\quad \textcolor{gray}{\triangleright \text{using ([1])}} 
	\\
	f(\lambda x + (1 - \lambda)y) &\le 
	\lambda f(x) + (1 - \lambda) f(y) - 
	\\
	&\quad
	\frac{\alpha}{2}(
		\Vert \lambda x + (1 - \lambda)y\Vert^2 - \lambda \Vert x\Vert^2 - (1 - \lambda)\Vert y\Vert^2
	)
	\\
	f(\lambda x + (1 - \lambda)y) - \frac{\alpha}{2}\Vert \lambda x + (1 - \lambda)y\Vert^2
	&\le
	\lambda f(x) - \frac{\alpha\lambda}{2}\Vert x\Vert^2 + (1 - \lambda) f(y) - 
	\frac{\alpha}{2}(1 - \lambda)\Vert y\Vert^2
	\\
	\left[f - \frac{\alpha}{2}\Vert \cdot\Vert^2\right](\lambda x + (1 - \lambda)y) 
	&\le 
	\lambda \left[f - \frac{\alpha}{2}\Vert \cdot\Vert^2\right](x) + 
	(1 - \lambda)\left[f - \frac{\alpha}{2}\Vert \cdot\Vert^2\right](y), 
\end{aligned}
$$

(\[1\]): We used the [Cute Formula](Background/Euclidean%20Jensen's%20Equality.md) because of the Euclidean norm, and hence the function is $\alpha$-strongly convex in the 2 norm, if and only if $f - \alpha/2\Vert \cdot\Vert$ is a convex function. 

**\[Def\] <=> \[2.\]**


---
### **Proofs for Theorem 2**

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
