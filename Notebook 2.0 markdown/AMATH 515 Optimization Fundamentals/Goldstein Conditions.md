[Strong Wolfe Condition](Strong%20Wolfe%20Condition.md)

---
### **Intro**

It's a Wolfe's conditions, but it's stricter in some sense. 


Let $c\in \left(0, \frac{1}{2}\right)$, the condition is: 

> $$
> f(x_{\langle k\rangle}) + (1 - c)\alpha_k \nabla[f^{T}](x_{\langle k\rangle}) \le 
> f(x_{\langle k\rangle} + \alpha_k p_k) \le f(x_{\langle k\rangle}) + 
> c \alpha_k \nabla[f^T](x_{\langle k\rangle}) p_k
> $$

The objective value of the function is between the ray projected by a line from below, the $(1 -c)\alpha_k\nabla f^T_k p$, and the line above, $c\alpha_k\nabla f^{T}_kp_k$

The ray is much narrow compare to the ray from Wolfe's conditions, and most of the time, it won't contain the minima if it's near a convex region of the objective function. 
