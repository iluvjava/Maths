prereq: [[Introduction to Convexity]]

---
### **Differential Characterization of Convexity**


> Let $f: C\mapsto \R$ is a $C_1$ smooth function. 
> Suppose $C$ is a convex set, then the following are all equivalent. 
> 1. (**Convexity**) $f$ is a convex function. 
> 2. (**Gradient Inequalities**) $f(y)\geq f(x) + \langle \nabla f(x), y - x\rangle$ for all $x\in \text{dom}\;\nabla f, y \in C$. $\text{dom}\; f$ is convex. 
> 3. (**Monotonicity**) $\langle \nabla f(y) - \nabla f(x), y - x\rangle \geq 0$ for all $x, y\in \text{dom}\; \nabla f$. $\text{dom}\; \nabla f$ is a convex set. 

**References**: 

Chapter 2, theorem 2.1.5 of Yurii Nesterov's "Lectures in Convex Optimizations" textbook contains these information. 

**Remarks:**

With the **additional assumption that the function is $C2$ smooth**, then we can say that: $\nabla^2 f(x)$ is a **Positive Semi-Definite Matrix**. 

Read [Monotone Operators Introduction](../Operators%20Theory/Monotone%20Operators%20Introduction.md) for more about what conditions (3) refers to. 


**Observe:**

If the function is linear, then all above relations are going to be equals, so the inequalities are strict when the function is linear.

---
### **Proofs**

We define a convex function to be a function satisfying the secant line inequality. 
If $f$ is convex here then for all $x, y \in \text{dom}\; f$ it has for all $t \in [0, 1]$ the inequality: 

$$
\begin{aligned}
	f(x + t(y - x)) = f(ty + (1 - t)x) \leq tf(y) + (1 - t)f(x).	
\end{aligned}
$$

**Proof (1) --> (2)**

Pick any $x\in \text{dom}\; f, y \in \text{dom}\; \nabla f$. 
Using $f$ convex, the secant line inequality has for all $t\in (0, 1)$: 
$$
f(x + t(y - x)) = f(ty + (1 - t)x) \leq tf(y) + (1 - t)f(x).
$$

A $C_1$ smooth function has: 

$$
f(x + t(y - x)) = f(x) + t\langle \nabla f(x), y - x\rangle + o(t). 
$$

The above two inequalities imply: 

$$
\begin{aligned}
	0 &\le 
	f(ty + (1 - \tau)x) - t f(y) - (1 - t) f(x)
	\\
	&= 
	\left(
		f(x) + t \langle \nabla f(x), y - x\rangle
		+ o(t)
	\right)
	- t f(y) - (1 - t) f(x)
	\\
	&= 
	t \langle \nabla f(x), y - x\rangle + o(t)
	- t f(y) + t f(x)
	\\
	&= 
	t \left(
		\langle \nabla f(x), y - x\rangle + o(t)/t
		+ f(x) - f(y)
	\right)
	\\
	\iff 
	0 &\le 
	\langle \nabla f(x), y - x\rangle + o(t)/t + f(x) - f(y)
\end{aligned}
$$


Take the limit of $t\rightarrow 0$, it yields **(2)**. 
$\blacksquare$

**Proof (2) --> (3)**

Choose any $x, y \in \text{dom}\; \nabla f\subseteq \text{dom}\; f$ then condition **(1)** has: 

$$
\begin{cases}
	f(y) \geq f(x) + \langle \nabla f(x), y - x\rangle, 
	\\
	f(x) \geq f(y) + \langle \nabla f(y), x - y\rangle. 
\end{cases}
$$
The sum of both expression yields: 
$$
\begin{aligned}
	f(x) + f(y) 
	&\geq f(x) + f(y) + 
	\langle \nabla f(y) - \nabla f(x), x \rangle + 
	\langle \nabla f(x) - \nabla f(y), y\rangle
	\\
	\iff 
	0 &\geq 
	\langle \nabla f(y) - \nabla f(x), x \rangle + \langle \nabla f(x) - \nabla f(y), y\rangle
	\\
	&= \langle \nabla f(y) - \nabla f(x),x - y\rangle. 
\end{aligned}
$$

Therefore, the gradient operator is a monotone operator. 

$\blacksquare$

**Proof (3) --> (1)**: 
> If for all $x, y \in \text{dom}\; \nabla f$: 
> $$
>	\langle \nabla f(y) - \nabla f(x),y - x\rangle \geq 0. 
> $$ 
> Then $f$ is a convex function. 

**Proof**:

Fix any $x, y \in \R^n$. 
Define $\varphi (t) := f(x + t(y - x))$, and $x_t := x + t(y - x)$. 
By definition $\varphi'(t): (0, 1)\rightarrow \R = t\langle \nabla f(x_t), y - x \rangle$
It is monotone increasing because for all $s, t \in (0, 1)$ such that $t \le s$: 

$$
\begin{aligned}
	0 &\le (s - t)\langle \nabla f(x_s) - \nabla f(x_t), y - x \rangle
	\\
	&= \varphi'(s) - \varphi'(t)
	\\
	&= \langle \nabla f(x_s) - \nabla f(x_t), x_s - x_t\rangle. 
\end{aligned}
$$

The fundamental theorem of calculus has: 

$$
\begin{aligned}
	f(y) &= \varphi(1)
	\\
	&= 
	\varphi(0) + \int_0^1 \varphi'(\tau)d\tau 
	\\
	&\ge \varphi(0) + (1)\varphi'(0)
	\\
	&= f(x) + \langle \nabla f(x), y -x\rangle. 
\end{aligned}
$$


This statement is true for all $x$, equivalent to statement **(2)**. 
Taking the supreme of all $x$ we obtain:

$$
f(y) = \sup_{z\in \text{dom}\; \nabla f}\{ f(x) + \nabla f(z)^T(y - z)\},
$$

The above says $f(y)$ is the supremum of a collection of affine functions therefore by [[Convexity Preserving Operations for Functions]], $f(y)$ is a convex function. 
$\blacksquare$


**References**: Dimitri's Theorem 3.8, Course notes. 
