Point and Stabilities. 



---


### 1D Stability:
**Definition of Stable:**
Given a 1D Autonomous system, $x' = f(x)$, a given node (initial conditions), say $x_0$ is stable if, $\exists t\in (x_0- \delta, x_0 + \delta)\setminus\{x_0\}$ such that any solution that start with such an initial conditions will converge to $x_0$, as close as they want as $t\rightarrow 0$.

**Definition of Unstable**
If a given system $x = f(x)$ has continuous $f(x)$. Then the point $x_0$ is stable if: 
$$
\forall \epsilon \exists \delta: \forall 0<|y - x_0| < \delta: \text{soln with } f(0) = y \quad \exists t: |f(t) - x| > \epsilon
$$


**Semi-Stable**
Semit-stable is unstable, and it's only occurring in 1D. 

---
### Linearization Analysis Of Stability
The fixed points are points, so intuitively it makes sense to check out the derivative and see what kind of information it can give us about the RHS of the ODEs. 

Consider $x'=f(x)$ as a system and has fixed point $x^*$. Let's consider a solution that is placed near the fixed point $x(t) = x^* + \epsilon(t)$, where $\epsilon(t)$ describes how far away is the function from the fixed point. 

Then, the derivative of $\epsilon(t)$ is: 

$$
\epsilon'(t) = f(x(t)) = f(x^* + \epsilon(t))
$$

Assuming that the function is smooth and has a Taylor Expansion, then: 

$$
\epsilon'(t) = f(x^*) + \epsilon(t)f'(x^2) + \frac{\epsilon^2}{2}f''(x^*)\cdots
$$

With the assumption that $|\epsilon(t)|$ is extremely small, then we can say that, the behavior of the function is governed by the linear term, and hence:

$$
\epsilon(t)\approx \epsilon(0)\exp(f'(x^*)t)
$$

And this will implies that: 

1. $f(x^*) < 0$ --> $|\epsilon(t)| \rightarrow 0$
2. $f(x^*) > 0$ --> $|\epsilon(t)| \rightarrow \infty$

And hence, negative derivative is stable and positive is unstable. When $f(x^*) =0$, then linearization cannot determine the stability of the fixed point, we will need to look at the sign of $f(x^*)$  near to determine. 


