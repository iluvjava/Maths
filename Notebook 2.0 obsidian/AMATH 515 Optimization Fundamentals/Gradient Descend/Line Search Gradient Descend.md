[[Gradient Descend, Smoothness]], [[Newton Method]]

---

### Intro

Inspired by Newton's method's way of looking for the optimal descend direction using the Positive Definite Hessian, we are now going to see how to use that idea for Gradient Descend algorithm. 

1. Exact Line search: Given descent direction d, solve: 
$$
\gamma_k = \min_{\gamma} (f(x_k + \alpha d))
$$
Along the descend direction, we are interested in looking for the minimal objective value on the line of descend. 

2. (More common) **Armijo Line Search**. We just try to find the largest $\gamma \le 1$ that satisfies: 
$$
f(x_k + \gamma_k d_k) \le f(x_k) - m \gamma \Vert \nabla f(x_k)\Vert^2 \tag{1}
$$
Where m is called a fudge factor. 
  * set: $\gamma = 1$, if (1) then return. 
  * Else: try $\gamma := 0.9\gamma \nabla f(x_k)$

Also called a Damped Newton's method, this is good when the function is not $\beta$ smooth. 
