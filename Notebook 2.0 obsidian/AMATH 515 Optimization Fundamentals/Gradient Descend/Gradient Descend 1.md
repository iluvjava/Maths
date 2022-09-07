This is the algorithm we are going to study in this section.

[[Beta Smoothness]]
This is going to help us with the analysis of the algorithm, especially under the some of the assumption where we can use uniform step size for the algorithm. 

Content List: 
1. Intro with global upper $\beta$ smoothness upper bound.
2. Rate of convergence for $\beta$ smoothness.
3. Rate of convergence for convex $\beta$ smooth.
4. Rate of convergence for strong convex $\beta$ smooth.

---
### **Introduction:** 
The major idea here is to use the $\beta$ Smoothness property of the function to approximate an global upper bound of the function given some points of approximation on the function. 

Firstly let's define the notation: 

> $$
> m_x(y):=
> f(y) + \left\langle
> \nabla f(x), y
> \right\rangle(y - x) + 
> \frac{\beta}{2}\Vert y - x\Vert^2
> $$
> Solve this mini minimization problem by changing $y$ resulting in monotonic decrease of the objective function. 

Which is the RHS of the $\beta$ smoothness inequality from **[[Beta Smoothness]], Theorem 1**. Now, our task is to look for the unique minimizer for this quadratic term, we could do it with completing the square, or we can just take the gradient wrt $y$ and then solve for $y$ when gradient is zero. 

Facts: 
* Function value at $x$ matches with $m_x(y)$
* Function gradient at $x$ matches with $m_x(y)$
* Function bounded globally by $m_x(y)$ (This might be troublesome if function has exponential growth somewhere, cause that will squeeze $\beta$ to zero)

Taking the gradient we have: 

$$
\begin{aligned}
    \nabla[m_x(y)] &= \mathbf{0} + \nabla f(x) + \beta(y - x)
    \\
    \mathbf{0} &= \nabla f(x) + \beta y - \beta x
    \\ 
    y &= x - \frac{1}{\beta} \nabla f(x)
\end{aligned}
$$

And that means that for each step of gradient descent, we have the iterative scheme for $\beta$ smooth function: 

$$
x_{k + 1} = x_k - \frac{1}{\beta} \nabla f(x_k)
$$

In addition, we are also interested in the objective value of the function for one particular iteration, let's say that: 

$$
y^* = x - \frac{1}{\beta}\nabla f(x)
$$ 

And then we substitute this into the $m_x(y^*)$, and it's going to be like: 

$$
\begin{aligned}
m_x(y^*) &= f(x) + \nabla f(x)^T \left(
x - \frac{1}{\beta} \nabla f(x) - x 
\right) + \frac{\beta}{2}\Vert \frac{-1}{\beta}\nabla f(x)\Vert^2
\\
m_x(y^*) &= f(x) + \frac{-1}{\beta}\Vert \nabla f(x)\Vert^2 + \frac{1}{2\beta}\Vert \nabla f(x)\Vert^2
\\
m_x(y^*) &= f(x) -\frac{1}{2\beta}\Vert \nabla f(x)\Vert^2
\end{aligned}\tag{1}
$$

And notice that in the contex of the gradient descent, $x$ is $x_{k}$ and $y^*$ will be $x_{k + 1}$. 

---
### **Convergence with Beta Smoothness**

Here, we are going to show how the iteration is going to  converge under the $\beta$ smoothness assumption for the function. 

Continuing with the statement $(1)$, we have: 

$$
\begin{aligned}
    \frac{1}{2\beta}\Vert \nabla f(x_k)\Vert^2
    &\le f(x_k) - f(x_{k + 1})
    \\
    \frac{1}{2\beta}\Vert \nabla f(x_{k - 1})\Vert^2
    &\le f(x_{k - 1}) - f(x_{k})
    \\
    &(...)
    \\
    \frac{1}{2\beta}\Vert \nabla f(x_0)\Vert^2
    &\le f(x_0) - f(x_{1})
    \\
\end{aligned}\tag{2}
$$

Summing up all the terms we have a lot of things canceled out on the RHS of these inequalities, giving us: 

$$
\frac{1}{2\beta} \sum_{j = 0}^{k} \left(
    \Vert\nabla f(x_j) \Vert^2  \right)
    \le f(x_0) - f(x_{k + 1})
$$

The sum of all the squared 2 norm of the gradient step we divided by the $\beta$ smoothness scale, we will have the change in the objective value for the algorithm as a lower bound. (A pretty pessimistic estimate)

Let's make the assumption that the $x_{k + 1}$ is giving us $\inf(f)$, noted as $f^*$, then we can have: 

$$
\min_{j} \Vert\nabla f(x_j) \Vert^2 
\le
\frac{\sum_{j = 0}^{k} \left(\Vert \nabla f(x_j)\Vert  \right)}{k}
\le
\frac{2\beta(f(x_0) - f^*)}{k}
$$

The first term is the smallest gradient step, and the second terms is the average gradient step, and the third term is the upper bound of the objective decrease. 

Taking the square root at both side we have: 

$$
\min_{j} \Vert \nabla f(x_j)\Vert \le 
\frac{1}{\sqrt{k}} \sqrt{
    2\beta \left(
        f(x_0) - f^*
    \right)
}
$$

And then we have the following theorem for the descent algorithm.

> The gradient descent for a $\beta$ smoothness function has the convergence rate of $$\mathcal{O}\left(
> \frac{1}{\sqrt{k}}
> \right)$$
> This is sub linear, and it's the most pessimistic upper bound on the convergence of the gradient (Not the objective function!)

---

## Adding More Assumptions
For the following parts, we are not going to prove this in this file, but the results will be stated from the course materials 

And notice some of the metrics that are involved here. 
1. The objective value of the function. measured by the distance from the current iterate on the objective value to the inf of the function. 
2. The minimal of the gradient. 
3. The distance of the optimal and the current iterate under the domain of the function. 

As we add more and more assumption on the function, we can use more and more precise metric for the optimization. 

### Convergence with Convexity
Suppose that the objective **function $f$ is $\beta$ smooth and convex**, then the iterates generated by the gradient descent method satisfies that: 

$$
f(x_k) - f^* \le \frac{\beta \Vert x_0 - x\Vert^2}{2k}
$$
The distance from the objective value is inversely proportional to the norm squared distance from initial to optimal. 
$$
\min_{i} \Vert  \nabla f(x_i)\Vert \le \frac{2\beta \Vert x_0 - x^*\Vert}{k}
$$

### Convergence with Strong Convexity
Suppose that the objective function **$f$ is $\beta$ smooth and strongly convex**, then gradient descend will give: 

$$
\Vert x_k - x^*\Vert^2 \le 
\left(
\frac{Q - 1}{Q + 1}
\right)^k \Vert x_0 - x^*\Vert^2
\le 
(1 - Q^{-1})^k \Vert x_0 - x^*\Vert^2
$$
Where the quotient is given as: $Q: = \beta/\alpha$. Where the alpha is the lower bound from the strong convexity of the function $f$ and the $\beta$ is the upper bound for the beta smoothness of the function. 

In addition, the analysis of this follows from the previous case, and we can place another bound on the other optimality metric: 

The minimal gradient is bounded by: 

$$
\min_{i}\Vert \nabla f(x_i)\Vert \in
\mathcal{O}
\left(
\sqrt{
    \left(
        1 - \frac{\alpha}{\beta}
    \right)^k
}
\right)
$$

And for the objective value it's bounded by: 

$$
f(x_k) - f^*
\in
\mathcal{O}
\left\lbrace
    \left(
        1 - \frac{\alpha}{\beta}
    \right)^k
\right\rbrace
$$
