In this part we are going to do more works on the concepts of 
Strong convexity and its differential properties. 

---
### Prereq: 
[[Closed, Proper, Level Bounded, Strong Convex#Strong Convexity]]
* Definition of Alpha Strong convexity
* Properties of Alpha String Convexity

![[Closed, Proper, Level Bounded, Strong Convex#Theorem 2 23 Characterization of Strong Convexity]]


### Proof Strategies
Cyclic Proof for a list of equivalence. 

### Statement 1 <--> Statement 2
If a given function is alpha strongly convex, then we can say that: 
> $$(\nabla f(y) - \nabla f(x))^T(y - x)\ge \alpha ||y - x||^2$$ 

The definition of the Strong convexity has symmetry to exploit. 
$$
\begin{align}
	f(y) &\ge f(x) + \nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert  y -x\Vert^2
	\\
	f(x) &\ge f(y) + \nabla f(y)^T(x - y) + \frac{\alpha}{2}\Vert  x - y\Vert^2
\end{align}
$$
Summing up the expression above we have: 
$$
\begin{align}
	f(x) + f(y) &\ge f(x)+ f(y) 
	+ (-\nabla f(y) + \nabla f(x))^T(y - x) + \alpha \Vert y - x \Vert^2
	\\
	0 &\ge (\nabla f(x) - \nabla f(y))^T(y - x) + \alpha
	\Vert y - x\Vert^2
	\\
	(\nabla f(y) - \nabla f(x))^T(y - x) &\ge \alpha ||y - x||^2
\end{align}
$$
$\blacksquare$

---
### Statement 2 <--> Statement 3

Let $f$ be a Strongly Convex function and twice differentiable (Redundancy?), then by exercise in the previous parts for Strong Convexity, we know that, it's Alpha strongly convex if and only if $f - \frac{\alpha}{2}||x||^2$  is a convex function, and we want to prove that:

> $f$ is strongly convex <--> $f - \frac{\alpha}{2}||x||^2$ is convex <--> Statement 3 is true. 

Using the hypothesis that the function $f(x)$ is $C^2$ smooth, we know that it's convex if the Hessian is Positive Semi-Definite. 

If $f - \frac{\alpha}{2}||x||^2$ were to be convex, then its hessian will have to be semi-positive definite. 

The Hessian is computed by: 
$$
\begin{align}
	& \nabla^2
	\left(f - \frac{\alpha}{2}||x||^2
	\right)\\
	& \nabla^2 f - \alpha I
\end{align}
$$
And this matrix must have eigenvalues that are non-negative. That means that solution to the characteristic equation: 
$$
(\nabla^2 f - \alpha I - \lambda I) = (\nabla^2 f - (\alpha + \lambda)I)
$$
Must only have non-negative eigenvalues, and that means: 
$$
\lambda_i \le \alpha \quad \forall i
$$
And this means that: 
$$
\nabla^2f \succcurlyeq \alpha I
$$
$\blacksquare$

Theorem 2.23 Has been proven because: 

Statement 1 <--> Statement 2 <--> Statement 3 is verified, hence all 3 statements are equivalent. 
$\blacksquare$

---
### Exercise Statement 1:
#### Alpha And Level-Bounded

If a function $f$ is Alpha strongly convex, then it has minimizer and it will be level bounded.

Let's do it slowly so we know what we are doing, by definition, Level bounded means that the set: 
$$
\text{lev}_\alpha(f) = \{x: f(x)\le \alpha\}
$$
And this set is a bounded set. The idea here is to realize that, the epigraph of the function will have to lie within the norm ball. 

From the definition of strong convexity: 
$$
f(y) \ge \nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert y - x\Vert^2
$$

Notice that the RHS is a quadratic function, and it can be said that: 
$$
f(y) \in
\text{epi}
\left(\nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert y - x\Vert^2\right)
$$
And notice that, the epigraph of a quadratic is level bounded, and therefore, it has to be the case that, $f(x)$ is level bounded as well. 

#### Minimizer Exists

This is True by theorem [[Closed, Proper, Level Bounded, Strong Convex#Theorem 1 9 Rockafellar Roger Wets Variational Analysis]]

The function is closed, proper, then it has minimizer. 
