- [Proximal Gradient Method](Proximal%20Gradient%20Method.md), 
- [Beta Smoothness](../Basic%20Convexity/Beta%20Smoothness.md), 
- [Closed, Proper, Level Bounded, Strong Convex](../Basic%20Convexity/Closed,%20Proper,%20Level%20Bounded,%20Strong%20Convex.md).

Here, we will be focusing with the proof of theorem 3.12. 

We will be using: 
1. Strong convex of $g(x)$ 
2. And beta smoothness of $g(x)$


---
### **Proof**

![](Proximal%20Gradient%20Method.md#Theorem%203%2012)

And this is where the theorem is first stated. 

The optimization objective for one step of proximal gradient descend is: 

$$
\underset{y}{\text{argmin}}
\left(
    g(x) + \nabla g(x)^T(y - x) + \frac{1}{2t}\Vert x - y\Vert^2 + h(x)
\right)
$$

And the optimal is gonna be: 
$$
G_t(x) - \nabla g(x) \in \partial h(x^+) \tag{1}
$$

By Beta smoothness of the function $g(x)$ and alpha convex property of it: 
$$
g(y) \ge g(x) + \nabla g(x)^T(y - x) + \frac{\alpha}{2}\Vert x - y\Vert^2
\tag{2}
$$

$$
g(y) \le g(x) + \nabla g(x)^T(y - x) + \frac{\beta}{2}\Vert x - y\Vert^2
\tag{3}
$$

Consider the objective value at after the iterations: 

$$
f(x^+) = g(x - tG_t(x)) + h(x^+)
$$
By (3): and substitution is: $y = x - tG_t(x)$
$$
f(x^+) \le g(x) - tG_t(x)^T\nabla g(x) + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2 + h(x^+)
$$

Focusing on the term $g(x)$, we can use (2), but with $x, y$ swapped, using Alpha Strong convexity to turn system into: 

$$
f(x^+) \le g(y) + \nabla g(x)^T(x - y) - \frac{\alpha}{2}\Vert y - x\Vert^2 - tG_t(x)^T\nabla g(x) + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2 + h(x^+)
$$

Collecting the like terms with coefficient: $\nabla g(x)$, we can see that it's: $(x - y - tG_t(x))$ which is $x^+ - y$, and then that means: 

$$
f(x^+) \le g(y) + \nabla g(x)^T(x^+ - y) - \frac{\alpha}{2}\Vert y - x\Vert^2 + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2 + h(x^+)
$$

Using the convexity of $h(x)$, we have: 

$$
h(x^+) \le h(y) + \partial h(x)^T(x^+ - y) \le h(y) + (G_t(x) - \nabla g(x))^T(x^+ - y)
$$

And the second inequality is by (1). Substituting we have: 

$$
f(x^+) \le g(y) + \nabla g(x)^T(x^+ - y) - \frac{\alpha}{2}\Vert y - x\Vert^2 + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2 + h(y) + (G_t(x) - \nabla g(x))^T(x^+ - y)
$$

Collect coefficients of term: $(x^+ - y)$ we have its new coefficient to be: $G_t(x)$ and this gives us: 

$$
f(x^+) \le g(y) + G_t(x)^T(x^+ - y) - \frac{\alpha}{2}\Vert y - x\Vert^2 + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2 + h(y)
$$

And notice that: $x^+ - y = x - y - tG_t(x)$, and $g(y) + h(y) = f(y)$, substituting we have: 

$$
f(x^+) \le f(y) + G_t(x)^T(x - y) - t \Vert G_t(x)\Vert^2 - \frac{\alpha}{2}\Vert y - x\Vert^2 + \frac{\beta t^2}{2}\Vert G_t(x)\Vert^2
$$

Combine $||G_t(x)||^2$ we have: 

$$
f(x^+) \le f(y) + G_t(x)^T(x - y) - t(1 - \frac{\beta t}{2}) \Vert G_t(x)\Vert^2 - \frac{\alpha}{2}\Vert y - x\Vert^2
$$

And notice that, we need to swap so that $f(y)$ is on the left hand side of the inequality giving us: 

$$
f(y) \ge f(x^+) + G_t(x)^T(y - x) + t \left(
    1 - \frac{\beta t}{2}
\right) \Vert G_t(x)\Vert^2 + \frac{\alpha}{2} \Vert y - x\Vert^2
$$

---
### **Consequence**: 

Notice that, if we assume that $\alpha = 0$, so that it's not alpha strongly convex. And assume that $t = \frac{1}{\beta}$ so that the gradient step size is just what we had for smooth gradient descend, then we have: 
$$
f(x^+) \le f(x) - \frac{1}{2\beta}\Vert G_t(x)\Vert^2
$$

And this is the usual smooth gradient descent, without worrying about the non-smooth ness of function $h(x)$, and the alpha strong convexity of the function $g(x)$. 

And starting from this theorem, we can carry out the complexity analysis for the gradient descent algorithm but for prox gradient descend, and the good news the complexity didn't change with the strong convex, and strong convex beta smooth assumption. 

FISTA: Accelerated Prox Gradient Descend.


---
### Theorem 3.14

(...)