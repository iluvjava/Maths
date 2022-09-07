In this part we are going to do more works on the concepts of 
Strong convexity and its differential properties. 

---
### **Prereq**:
[](Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md#Strong%20Convexity)
* Definition of Alpha Strong convexity
* Properties of Alpha Strong Convexity

![](Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md#Theorem%202%2023%20Characterization%20of%20Strong%20Convexity)


---
### **Proof Strategies**
Cyclic Proof for a list of equivalence. 

### **Statement 1 $\iff$ Statement 2**
If a given function is alpha strongly convex, then we can say that: 
> $$(\nabla f(y) - \nabla f(x))^T(y - x)\ge \alpha ||y - x||^2$$ 

The definition of the Strong convexity has symmetry to exploit. 
$$
\begin{aligned}
	f(y) &\ge f(x) + \nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert  y -x\Vert^2
	\\
	f(x) &\ge f(y) + \nabla f(y)^T(x - y) + \frac{\alpha}{2}\Vert  x - y\Vert^2
\end{aligned}
$$
Summing up the expression above we have: 
$$
\begin{aligned}
	f(x) + f(y) &\ge f(x)+ f(y) 
	+ (-\nabla f(y) + \nabla f(x))^T(y - x) + \alpha \Vert y - x \Vert^2
	\\
	0 &\ge (\nabla f(x) - \nabla f(y))^T(y - x) + \alpha
	\Vert y - x\Vert^2
	\\
	(\nabla f(y) - \nabla f(x))^T(y - x) &\ge \alpha ||y - x||^2
\end{aligned}
$$
$\blacksquare$

---
### **Statement 2 $\iff$ Statement 3**

Let $f$ be a Strongly Convex function and twice differentiable (Redundancy?), then by exercise in the previous parts for Strong Convexity, we know that, it's Alpha strongly convex if and only if $f - \frac{\alpha}{2}||x||^2$  is a convex function, and we want to prove that:

> $f$ is strongly convex <--> $f - \frac{\alpha}{2}||x||^2$ is convex <--> Statement 3 is true. 

Using the hypothesis that the function $f(x)$ is $C^2$ smooth, we know that it's convex if the Hessian is Positive Semi-Definite. 

If $f - \frac{\alpha}{2}||x||^2$ were to be convex, then its hessian will have to be semi-positive definite. 

The Hessian is computed by: 
$$
\begin{aligned}
	& \nabla^2
	\left(f - \frac{\alpha}{2}||x||^2
	\right)\\
	& \nabla^2 f - \alpha I
\end{aligned}
$$
And this matrix must have eigenvalues that are non-negative(By 3rd characteristics of convexity). That means the solution to the characteristic equation: 
$$
(\nabla^2 f - \alpha I - \lambda I) = (\nabla^2 f - (\alpha + \lambda)I)
$$
Must only have non-negative eigenvalues, and that means: 
$$
\lambda_i \ge \alpha \quad \forall i
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
### **Exercise Statement 1**:
#### Alpha And Level-Bounded

**Proof strategies**: If $f$ is level bounded, then its domain under a certain level has to be smaller than the RHS of the strong convexity. If that function is level bounded, then so is $f$. 

If a function $f$ is Alpha strongly convex, then it has minimizer and it will be level bounded.

Placing a gamma level bound on function $f$, we have: 
$$
\text{lev}_\gamma(f) = \{
	y: f(y) \le \gamma
\}
$$
This set should be non-empty. If it can't be find, then the function is not proper. 

Placing on a beta level bound on the function of RHS of the strong convexity definition, we have: 
$$
\begin{aligned}
	g(y) &:= \nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert y - x\Vert^2
	\\
	\text{lev}_\beta(g) &= \{y: g(y) \le \beta\}
\end{aligned}
$$
Take notice that, if $\gamma$ is $\beta$, choose any element $t$ from set $\text{lev}_\gamma{(f)}$, we know that $f(t) \le \gamma =\beta$, by strong convexity: 
$$
g(t) \le f(t) \le \beta \implies g(t) \le \beta
$$

Therefore: 
$$
\text{lev}_\beta{(f)} \subseteq \text{lev}_\beta{(g)}
$$

Hence, if the function $g$ is level bounded, then $f$ will has to be level bounded. 

**$g(y)$ is Level bounded**

This is true because: 

$$
\nabla f(x)^T(y - x) + \frac{\alpha}{2}\Vert y - x\Vert^2
$$

Is a increasing, strictly quadratic function hence is a level bounded function --> $f$ is level bounded as well. 

$\blacksquare$ 

#### Minimizer Exists

This is True by theorem [](Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md#Theorem%201%209%20Rockafellar%20Roger%20Wets%20Variational%20Analysis)

The function is closed, proper, and it's level bounded as proven above, therefore it has minimizer. 


#### Minimizer is Unique

**Proof Strategies**: Use the second properties of the strong convexity. Proof with contradiction to show that it's impossible for a strongly convex function to have 2 different minimizers. 

Suppose the existence of 2 minimizers (Proved before), $x_1$, $x_2$, because they are minimizers: 
$$
\nabla f(x_1) = \nabla f(x_2) = 0
$$

However also notice that using the second properties of characterizations of strong convexity we have: 
$$
\begin{aligned}
	\nabla f(y)^T(y - x_1) &\ge \alpha \Vert y - x_1\Vert^2 \\
	\nabla f(y)^T(y - x_2) &\ge \alpha \Vert y - x_2 \Vert^2
\end{aligned}
\quad \forall y
$$

Notice that this is only true if $\nabla f(y) = \gamma(y - x)$ where $\gamma > 0$. Simply put, the gradient of the function at all points is the same as the vector that points from the minimizer to that point. 

This creates a contradiction if $x_1 \neq x_2$, because that means the gradient at point $y$ is a vector that points to 2 directions, and this is impossible. $\blacksquare$