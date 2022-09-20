Here we are going to talk about details of the analysis of the gradient descend algorithm. 

[[Gradient Descend, Smoothness]]


---
### **Intro**
From previous part where we discussed gradient descend we have: 
> $$
> m_k(y):=
> f(y) + \left\langle
> \nabla f(x), y
> \right\rangle(y - x_k) + 
> \frac{\beta}{2}\Vert y - x_k\Vert^2
> \tag{1}
> $$

Where $m_k(y)$ is just a global upper quadratic bound centered at $x = x_k$, the kth step of the gradient descend. And the parabola wrt $y$ has minimum: 

$$
x_{k + 1} = 
x_k - \frac{1}{\beta} \nabla f(x_k)
\tag{2}
$$

And the objective value after the iteration is: 

$$
f(x_{k + 1}) \le
f(x_{k}) - \frac{1}{2\beta}\Vert \nabla f(x_k)\Vert^2
\tag{3} = m_k(x_{k + 1})
$$
Because of beta smoothness, the actual function value is less than the minimal of the global quadratic bound. This is by the definite of Beta Smoothness.

---
### **Gradient Descend: Beta Smoothness and Convex**

Assume the objective function $f$ is Beta Smooth and Convex. Using the fact that it's beta smooth, we know that: 

$$
f(x_{k + 1}) \le m_k(x_{k + 1})
$$

At the same time, we know that the step gradient descend algorithm takes is always decreasing the objective value and therefore we have: 

$$
m_k(x_{k + 1}) \le f(x_k) \le m_k(x^*)
$$
Where $x^*$ is the argmin of the function, and it has $\nabla f(x^*) = \mathbf{0}$. Then  we conclude that: 

$$
m_k(x^*) = f(x_k) + \frac{\beta \Vert x^* - x_k\Vert^2}{2}
$$

However, we also know that the $x_{k + 1}$ gets closer to $x^*$ because of the gradient descend algorithm, and therefore: 

$$
\Vert x_{k+ 1} - x^*\Vert \le \Vert x_{k} - x^*\Vert
$$

$$
\frac{\beta \Vert x^* - x_k\Vert^2}{2} - 
\frac{\beta \Vert x^* - x_{k + 1}\Vert^2}{2} \ge 0
$$

And therefore we got an tighter upper bound which is: 

$$
m_k(x^*) - \frac{\beta \Vert x^* - x_{k + 1}\Vert^2}{2} \ge m_k(x^*) \ge f(x_k) \ge m_k(x_{k + 1}) \tag{4}\ge f(x_{k + 1})
$$

$$
f(x_{k + 1}) \le m_k(x^*) - \frac{\beta \Vert x^* - x_{k + 1}\Vert^2}{2} \tag{4.1}
$$

expanding expression (4.1) using the definition of $m_k(x^*)$ we have: 

$$
f(x_{k + 1}) \le f(x_k) + \nabla f(x_k)^T(x^* - x_k) + \frac{\beta}{2}
\left(
    \Vert x_k - x^*\Vert^2 - \Vert x_{k + 1} - x^*\Vert^2
\right)
$$

By convexity of $f(x)$, we can say that: 

$$
f(x^*) \ge f(x_k) + \nabla f(x_k)^T(x^* - x_k)
$$

Combining the previous 2 expression, we have a loosened upper bound which is: 

$$
f(x_{k + 1}) \le f(x^*) + \frac{\beta}{2}
\left(
    \Vert x_k - x^*\Vert^2 - \Vert x_{k + 1} - x^*\Vert^2
\right)
\tag{5}
$$

$$
f(x_{k + 1}) - f(x^*)\le \frac{\beta}{2}
\left(
    \Vert x_k - x^*\Vert^2 - \Vert x_{k + 1} - x^*\Vert^2
\right)
\tag{5.1}
$$

Using circular cancellation and all the points of descend on (5.1) we have: 

$$
\sum_{i = 1}^{k} \left(f(x_i) - f^* \right) = 
\frac{\beta}{2}\left(
    \Vert x_1 - x^*\Vert^2 - \Vert x_k - x^*\Vert^2
\right)
\le
\frac{\beta }{2} \Vert x_1 - x^*\Vert^2
\le
\frac{\beta }{2} \Vert x_0 - x^*\Vert^2
\tag{6}
$$

Because we are monotonically decreasing the value of the objective function using the gradient descend method, we have: 

$$
f(x_{i}) - f(x^*) < f(x_{i - 1})  - f(x^*) < f(x_{i - 2}) - f(x^*) \cdots < f(x_0) - f(x^*)
$$

Using (6) and the inequality above: 

> $$
> f(x_k) - f(x^*) \le \frac{1}{k} 
> \sum_{i = 1}^{k} \left(f(x_i) - f(x^*)\right) 
> \le 
> \frac{\beta \Vert x_0 - x^*\Vert^2}{2k} 
> \tag{7}
> $$

Using expression [intro (3)](Gradient%20Descend%202.md#intro), we have: 

$$
\frac{1}{2\beta} \Vert \nabla f(x_k)\Vert^2 \le 
f(x_k) - f(x_{k + 1})
$$

Doing the gradient descend and summing up all steps we walked in the domain to get the displacement, and this will give us the following: 

$$
\frac{1}{2\beta} \sum_{i = 0}^{m} \left(\Vert \nabla f(x_k)\Vert^2\right)
\le f(x_0) - f(x_m) \le f(x_m) - f(x^*) \underset{(7.1)}{\le }
\frac{\beta \Vert x_0 - x^*\Vert}{2(m + 1)}
$$
(7.1) follows from 7. 

And hence we have: 

> $$
> \min_{0 \le i \le m} \Vert \nabla f(x_i)\Vert^2 \le \frac{\beta \Vert x_0 - x^*\Vert}{2(m + 1)} \in 
> \mathcal{O}\left(
>     \frac{1}{m}
> \right) \tag{8}
> $$

---
**Gradient Descend: Beta Smooth and Strong Convex**

Here we still assume that the function is beta smooth so we can have continuous descend, and we also place the additional assumption that the function is Alpha Strong Convex, and the result can be stated as: 

> $$
> \Vert x_k - x^*\Vert^2 \le \left(
> \frac{Q - 1}{Q + 1}
> \right)^k \Vert x_0 - x^*\Vert^2 \tag{9}
> $$

Where $Q = \beta/\alpha$ and its implicitly implied that $\beta > \alpha$ (it should not surprise the reader). 

Proof is straight forward in the lecture notes. 
