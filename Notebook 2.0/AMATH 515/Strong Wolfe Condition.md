[[Line Search Gradient Descend]]

---
### **Intro**

Given a descned direciton, we search for the best step size into the directon. In the relevant file above, we had steepest descend and the armijo line search. 

Here we introduce the: **Strong Wolfe Condition**

List of parameters: 

$$
c_1, c_2, \alpha, x^{(k)}, p, \nabla[f]
$$

* $\alpha$ is the step size that we want to determine, easily. 
* $0 < c_1 < c_2 < 1$ are 2 of the small constant that determines the behaviors of the line search algorithm. 
* $x^{(k)}$, the point are currently at. 
* $p$, the search direction. 
* $\nabla[f]$ The gradient operator. 

### **Wolfe Conditions**

> $$
> \begin{aligned}
>     f(x^{(k)} + \alpha p) \le& f(x^{(k)}) + c_1 \alpha \nabla [f^T](x^{(k)})p
>     \\
>     \nabla [f](x^{(k)} + \alpha p)^T p \ge& c_2 \nabla [f^T](x^{(k)}) p
> \end{aligned}
> $$

* The first conditions prevent it from over steping, stepping pass the local minima of a convex region (If there is any local minima and it's a convex region)

* The second condition will assert some kind of convexity constraint, it make sure that, on the direciton of the search direction, the gradient is decreasing ($c_2$ should be close to 1, somewhere around $0.9$). 

The second condition is sometimes wrote as: 

$$
\left|
    p^T \nabla[f](x^{(k)} + \alpha p)
\right| - 
c_2
\left|
    p^T \nabla[f](x^{(k)}) 
\right| \le 0
$$

* Along the search direction, the gradient of the objective function is at least, decreasing, and increasing by a bit is allowed if $c_2 < 1$. 
* The absolute value ignore the direction information. 

