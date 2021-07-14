To do this, we would need 
[[Convex Conjugate Function]]. 
And [[MinMax MaxMin Lemma]].
But we also need [[Convex Conjugate (Examples Pack)]]

---
### **Intro**

Dualization process can put the primal optimization problem, preferably convex, into another optimization problem such that, weak, or strong duality theorem can be applied. 

Under strong duality, solving one of the problem, primal or dual, will solve both problem at the same time. If a link between the dual and the primal variables is found. 

However, there is no general way of doing so, and some of the are not unique, let's consider examples that popped up in calculus class. 

**Motivating Example** 

Back in grade school, we see the example of minimizing the function: 

> $$
> f(x, y) = x^2 + y^2 \text{ s.t: } x + y -2 = 0
> $$

An optimization problem on a parabolic function on a line constraint, we want to minimize the objective under such a constraint, which means that: 

$$
\begin{aligned}
    &\min_{x, y} \left\lbrace
        f(x, y) : g(x, y) = 0
    \right\rbrace
    \\
    =& \min_{x, y} \left\lbrace
    f(x, y) + \delta_0(g(x, y))
    \right\rbrace
    \\
    \delta_0(g(x, y)) 
    =& 
    \sup_{z} \left\lbrace
        zg(x, y) - \delta_0^*(z)
    \right\rbrace
    \\ \underset{[1]}{\implies }
    \delta_0(g(x, y)) =& \sup_{z} \left\lbrace
    zg(x, y)
    \right\rbrace
    \\\implies
    \min_{x, y} \left\lbrace
        f(x, y) : g(x, y) = 0
    \right\rbrace
    =& 
    \min_{x, y} \left\lbrace
        f(x, y) + \sup_z\left\lbrace
            zg(x, y)
        \right\rbrace 
    \right\rbrace
    \\
    =& 
    \min_{x, y}\sup_z \left\lbrace
    f(x, y) + zg(x, y)
\right\rbrace
\end{aligned}
$$

\[1\]: Which is from the definition of the Fenchel Conjugation. And conveniently we know that $\delta_0(z)$ is just zero. 

Expression inside $\min\sup$ is the lagrangian we learned. 

$$
\mathcal{L}(x, y, z) =
f(x, y) + zg(x, y)
$$

And, remember from our calculus class, we will be setting the Lagrangian to zero, so that, the gradient of the constraint function equals to the gradient of the objective function. 

Taking the gradient of the Lagrangian will give use a system of equations to solve for the optimality conditions. 

$$
\begin{aligned}
    \nabla_{x, y}\mathcal{L}(x,y, z) &= \nabla f(x, y) - z\nabla g(x, y) = 0    
    \\
    \nabla_{z}\mathcal{L}(x, y, z) &= g(x, y) = 0
\end{aligned}
$$

And this, is also the optimality conditions, and in the case of sub-differential, or the in the form of equation.

**Key Take away**
> It's not mysterious at all, duality it's just an improved version of the Lagrangian Multiplier. 
> The dual is from the convex conjugate of the constraint function. 

**Summarization**

1. Express the constraints as a Delta function. 
2. Consider conjugating on the constraint function. 
3. Move the min max together. 
4. What is inside is the Lagrangian for the problem. 

This process is very general and can be used in a lot of different cases. 

