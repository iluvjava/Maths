File contains exercises for [[Closed, Proper, Level Bounded, Strong Convex]]

---

### Alpha Strongly Convex
We are going to solve the following exercises. 

![[Closed, Proper, Level Bounded, Strong Convex#Strong Convexity]]

In this part, we will prove something about alpha strongly convex. 

#### Statement 1
Trivial. 

---
#### Statement 2
$$f(x) = g(x) + \frac{\alpha}{2}||x||^2$$
Is Strongly Convex.

**Proof**:
By definition, we have: 
$$
f(y) = g(y) + \frac{\alpha}{2}||y||^2
$$ 
This following is expression **(1)**: 
$$
f(x) + \nabla f(x)^T(y - x) + \frac{\alpha||y - x||^2}{2}
$$

Which is: 
$$
g(x)+\frac{\alpha\Vert x\Vert}{2} + (\nabla g(x)^T + \alpha x)(y - x) + \frac{\alpha}{2}||y - x||^2
$$
$$
\left[g(x) + \nabla g(x)^T(y - x)\right] + 
\left[\frac{\alpha||x||^2}{2}
+\alpha x^T(y - x) + \frac{\alpha}{2}||y - x||^2
\right]
$$
Take notice that, the first component is less than $g(y)$ by the convexity of $g(x)$. 

And the second component can be simplified: 

$$
\begin{aligned}
	&
	\frac{\alpha||x||^2}{2}
	+\alpha x^T(y - x) + \frac{\alpha}{2}||y - x||^2
	\\&
	\frac{\alpha||x||^2}{2}
	+\alpha x^T(y - x) + \frac{\alpha}{2}
	\left(
		\Vert y\Vert^2 + \Vert x \Vert^2 - 2x^Ty
	\right)
	\\&
	\alpha\Vert x\Vert^2 - \alpha ||x||^2+\alpha x^Ty
	+
	\frac{\alpha}{2}
	\left(
		\Vert y\Vert^2 - 2x^Ty
	\right)
	\\&
	\frac{\alpha}{2}||y||^2
\end{aligned}
$$

And therefore, the expression **(1)** eventually got into: 

$$
f(x) + \nabla f(x)^T(y - x) + \frac{\alpha||y - x||^2}{2}
=
\left[g(x) + \nabla g(x)^T(y - x)\right] + 
\left[\frac{\alpha||y||^2}{2}
\right]
$$
This is expression **(2)**

And by the convexity of $g(x)$, we have: 
$$
\begin{aligned} 
	g(y)+\frac{\alpha||y||^2}{2} &\ge
	\left[g(x) + \nabla g(x)^T(y - x)\right] + 
	\left[\frac{\alpha||y||^2}{2}
	\right]
	\\
	f(y) &\ge f(x) + \nabla f(x)^T(y - x) + \left[\frac{\alpha||y - x||^2}{2}\right]
\end{aligned}
$$
The first expression is just convexity of the function $g(x)$, and the second line is obtained by substituting expression **(2)**. 
$\blacksquare$

### Statement 3
The proof that goes --> is easy be the definition of Alpha Strongly Convex. 

<-- is the statement that, if $f(x) - \frac{\alpha}{2}||x||$ is convex, then the function $f(x)$ is alpha strongly convex. 

From the definition that the function $f(x) - \frac{\alpha}{2}||x||^2$ is convex, we can start and say: 

$$
\begin{aligned}
	f(y) - \frac{\alpha}{2}||y||^2 
	&\underset{(1)}{\ge}
	f(x) - \frac{\alpha}{2}||x||^2
	+ 
	\nabla\left[ f(x) - \frac{\alpha}{2}||x||^2\right]^T(y - x)
	\\
	&\underset{(2)}{\ge}
	f(x) - \frac{\alpha}{2}||x||^2 + \nabla f(x)^T(y - x) - \alpha x^Ty + \alpha ||x||^2
	\\
	&\underset{(3)}{\ge}
	f(x) +\frac{\alpha}{2}||x||^2 + \nabla f(x)^T(y - x) - \alpha x^Ty
	\\ 
	f(y) &\underset{(4)}{\ge}
	f(x) +\frac{\alpha}{2}||x||^2 + \nabla f(x)^T(y - x) - \alpha x^Ty + \frac{\alpha}{2}||y||^2 
	\\
	&\underset{(5)}{\ge}
	f(x) +\nabla f(x)^T(y - x) + \frac{\alpha}{2}||y - x||^2
\end{aligned}
$$
$\blacksquare$
Explanations: 
1. By the defintion that the function $f(x) - \frac{\alpha}{2}||x||^2$ is a convex function. 
2. Distribute: $\nabla\left[ f(x) - \frac{\alpha}{2}||x||^2\right]$ --> $\nabla f(x) + \alpha x$, with transpose and simplify the dot product into modulus expression. 
3. Merge $||x||^2$
4. Move $||y||^2$ from left to right. 
5. Realize that: 
$$
\frac{\alpha}{2}||y - x||^2
=
\frac{\alpha}{2}||y||^2 + \frac{\alpha}{2}||x||^2 - \alpha x^Ty
$$
And substitute this into the RHS and we arrived at the definition of $f(x)$ being Alpha Strongly Convex. 

