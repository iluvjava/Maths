[[Non smooth convex optimization]]
In this section, we will be interested in solving the proximal gradient method. 
[[Gradient Descent 2]] 
And this we will be continue working on the gradient descent method with addition with a non-smooth function. 

Which can be a one norm, or it can be an indicator function representing the constraints of the problem. 

---
### Intro, Recap

We pick up from the optimality conditions of the Sub-gradient of a non-smooth function.

Picking up from last time: 

$$
f(y) \le m_{x_k}(y) = g(x_k) + \nabla g(x_k)(y - x_k) + \frac{\beta}{2}\Vert y - x_k\Vert^2 + h(y)
$$

Where $h(y)$ is the non-smooth function. 

And from gradient descend, we will know that: 

$$
f(y) \le m_{x_k} (y) \quad \forall (y)
$$

$$
f(x_k) = m_{x_k}(x_k)
$$

The image in our mind is exactly the same as the Gradient descent for beta smooth function, however, notice that, the bounding function, $m_{x_k}$ doesn't have to be smooth. 

The algorithm make that choice that: 

$$
x_{k + 1} := \underset{y}{\text{argmin}} (m_{x_k}(y))
$$
And the inequality follows from the beta smoothness of the function, and it's like: 

$$
f(x_{k + 1}) \le m_{x_k}(x_{k + 1}) \le m_{x_k}(x_k) \le f(x_k) \tag{1}
$$

And the strategy here, is we minimize the model we created for the non-smooth function at each step of the gradient descend process. 

And the minimization of the problem, for the non-smooth function can be summarized. 

$$
x_{k + 1} = \underset{y}{\text{argmin}}\left(
    \frac{1}{2/\beta} \left\Vert 
        y - (x_k - \frac{1}{\beta}\nabla g(x_k)))
    \right\Vert^2 + h(y)
\right) \tag{2}
$$

Which is relavent from the proximal operator.

$$
x_{k + 1} = \underset{1/\beta, h}{\text{prox}}
    \left(
        x_k - \frac{1}{\beta}\nabla g(x_k))
    \right)
\tag{3}
$$

This works as well as the gradient descend for the $g(x)$ function. 

#### Optimality conditions to Termination Conditions

For the proximity operator, we can allow a solution to it if the following condition is true: 

For 
$$
\underset{t, h}{\text{prox}}(z) = 
\underset{y}{\text{argmin}} \left(
    \frac{1}{2t} \Vert y - z\Vert^2 + h(y)
\right)
$$
 
When: 

$$
0 \in \frac{1}{t}(x^+ - z) + \partial(h(x^+))
$$

This is saying that, zero is in the sub-differential, and it implies the fact that: 

$$
\frac{1}{t} (z - x^+) \in \partial h(x^+) \tag{4}
$$

What about the terminal conditions for the Gradient Descent method? 

From expression (4), assuming that the gradient descend method has gotten the result that: $x_{k + 1} = x_k$, then this would mean that: 

$$
x^+ = x_k \quad z = x_k - \frac{1}{\beta} \nabla g(x_k) \quad t = 1/\beta
$$

So then: 
$$
\beta (x_k - \frac{1}{\beta} \nabla g(x_k) - x_k) \in \partial h(x_k) \implies 
-\nabla g(x_k) \in \partial h(x_k) \implies 0 \in \nabla g(x_k) + \partial h(x_k)
$$

$x_k = x_{k + 1}$ and they are the global minimum of the function. 

---

### Def 

**Moreau Envelope** of the function $h$. 

$$
h_t(z) := \min_y \left(
    \frac{1}{2t} \Vert y - z\Vert^2 + h(y)
\right)
$$

And this is the minimal objective value that is coming out from the proximal operator. 

---
### Indicator Function

When $h(x)$ is the indictor function, the following thing can be said: 

The proximity operator decays to the set projection operator. 

The Moreau Envelop will give the distance between the point projected onto the set of the indicator function, and the $z$ vector that is outside of the set.

#### Example 2: 2 Normball

Suppose that $C = \mathbb{B}_2$, this is the 2-norm ball set. Then the projection is just like: 

$$
\underset{\mathbb{B}_2}{\text{proj}} \left(
    z
\right) = \begin{cases}
    \frac{z}{\Vert z \Vert} & \Vert x\Vert > 1
    \\
    z & z \le 1
\end{cases}
$$

#### Example 2: Infinity Norm

Let's project any point to the infinity norm, and this is going to be phrased as: 

$$
\underset{\mathbb{B}_1}{\text{proj}}(z)
= \underset{\Vert y\Vert_\infty \le 1}{\text{argmin}}\left(
    \frac{1}{2}\Vert y - z\Vert
\right) = 
\underset{\max_i(y_i) \le 1}{\text{argmin}} \sum_{i = 1}^{n}\left(\frac{1}{2}
    (y_i - z_i)^2
\right)
$$

And notice that, for each coordinate, this is independent, which means that, if we minimize it for each of the coordinate of the vector $y$, then we will get t he right answer. 

For the simplest case, we have: 

$$
\underset{[-1, 1]}{\text{proj}}(z_i) = \begin{cases}
    1 & z_i > 1 \\ z_i & |z_i| \le 1 \\ -1 & z_i < -1
\end{cases}
$$

#### Example 3: Infinity Norm Linear Projection Problem: 

Consider: 
$$
\min_{\Vert x\Vert_\infty \le 1} \left(
    \frac{1}{2} \Vert Ax - b\Vert^2
\right)
$$
And the gradient descent on this will be the algorithm: 

$$
x_{k + 1} = \underset{\mathbb{B}_\infty}{\text{proj}} \left(
    x_k - \frac{1}{\beta} A^T(Ax_k - b) 
\right) = 
\min\left(1, 
    \max\left(
            -1, x_k - \frac{1}{\beta} A^T(Ax_k - b) 
        \right)
\right)
$$

And this is the algorithm for the regression problem where, we are given a infinity norm constraint that, the vector is having an infinity norm that is less than 1. 

#### Example 4: 1-Norm Regularization

Let $h(x) = \lambda \Vert x\Vert_1$, then consider the optimization problem: 
$$
\min_{x} 
\left(
g(x) + \lambda \Vert x\Vert_1
\right)
$$

And this is the 1-norm regularized optimization problem for a given beta-smooth function. 

And the gradient descend algorithm is like: 

$$
x_{k + 1} := \underset{\lambda/\beta, \Vert \cdot \Vert_1}{\text{prox}}
\left(
    x_k - \frac{1}{\beta} \nabla g(x_k)
\right)
$$
This problem can be reduced to a minimization problem, which is harder to solve, but calculus with different cases. It's going to be like: 

$$
\underset{\lambda/\beta, \Vert \cdot \Vert_1}{\text{prox}}
\left(
    x_k - \frac{1}{\beta} \nabla g(x_k)
\right) = \underset{y}{\text{argmin}}\left(
    \frac{\beta }{2\lambda } \Vert y - x_k - \frac{1}{\beta} \nabla g(x_k) \Vert^2 + \Vert y\Vert_1
\right)
$$

Take notice that, for each ste pf the gradient descent, the optimization process is coordinate independent, they are not interacting with each other. Hence, minimizing each of the coordinate value will minimize the global value. 

let $\alpha = \beta/\lambda$, $z = x_k - \frac{1}{\beta} \nabla g(x_k)$, then we have: 

Therefore: 
$$
\forall i \quad \min_{i} 
\left(
    \frac{\alpha}{2} (y_i - z_i)^2 + |y_i|
\right)
$$
And, we will need to optimize each of the coordinate, doing it with the old calculus way, you cut it into 2 functions, and then optimize on both and then look for the minimal of these 2. 

#### Example 5: 1-Norm Ball

Optimizing this as the constraint of the objective is a bit hard. There is 2 ways: 
1. An deterministic algorithm.
2. Use the duality idea from linear programming, and the 1 norm ball can be put into a linear programming problem.

---
### The General Case

So here, we are just messing with the Proximal Operator for one step of Gradient Descent, and generically, we are solving the optimization problem with the local global upper parabola with the non-smooth convex function: 

$$
x^+ = \underset{u}{\text{argmin}} \left(
    g(x) + \nabla g(x)^T(u - x) + \frac{1}{2t}\Vert u - x\Vert^2 + h(u)
\right)
$$
Where $x^+$ is the optimal solution of this problem, and $x$ is the previous step of the proximal gradient descend. 

And this will implies the optimal feature that:

$$
0 \in \nabla g(x) + \frac{1}{t}(x^+ - x) + \partial h(x^+)
$$

Which is: 
$$
G_t(x) - \nabla g(x) \in \partial h(x^+)
$$


Where $G_t(x) = \frac{1}{t}(x^+ - x)$, it can be interpreted as the step size function, but influenced by the smoothness and the regularization term. 

---

### Theorem 3.12

* $g(x)$ is alpha convex and beta smooth. 
* $h(x)$ is convex. 
* $f(x) = g(x) + h(x)$
* Let $x^+$ be the result from the proximity operator. 
Knowing the fact that $z = x - t\nabla g(x)$, then: 

$$
\frac{1}{t}\left(
    x - t\nabla g(x) - x^+
\right)\in \partial h(x^+)
$$

And then this would mean that: 

$$
\frac{1}{t}( x- x^+) - \nabla g(x) \in \partial h(x^+)
$$

Let the step function to be defined as: $g_t(x):= \frac{1}{t}(z - x^+)$, And this will be the termination criteria for the algorithm. 

If $g_t(x)$ is zero, then it means that, we step exactly onto the optimal, also the point of discontinuity. And here, $g_t(x)$ is the "gradient" for the non-smooth optimization. 

Theorem Statement: 

$$
f(y) \ge f(x^+) + G_t(x)^T(y - x) + t(1 - \frac{\beta t}{2})\Vert G_t(x)\Vert^2 + \frac{\alpha}{2}\Vert y - x\Vert^2
\quad \forall y
$$

Where the function $G_t(x)$ is the step vector scared by the regularization term: 
$$
G_t(x) = \frac{1}{t}(x^+ - x) \implies x^+ = x - tG_t(x)
$$
And the function we defined earlier has become the direction of gradient descend. 

