To do this, we would need 
[[Convex Conjugate Function]]. 
And [[MinMax MaxMin Lemma]].
But we also need [[Convex Conjugate Examples]]

---
### **Intro**

Dualization process can put the primal optimization problem, preferably convex, into another optimization problem such that, weak, or strong duality theorem can be applied. 

Under strong duality, solving one of the problem, primal or dual, will solve both problem at the same time. If a link between the dual and the primal variables is found. 

However, there is no general way of doing so, and some of the are not unique, let's consider examples that popped up in calculus class. 

**High Level Description of the Dualization Technique:** 

> 1. Express the constraints as a Delta function. 
> 2. Consider conjugating on the constraint function. 
> 3. Move the min max together. 
> 4. What is inside is the Lagrangian for the problem. 
> 5. Exchange the MinMax into MaxMin, and then try to find the conjugate of the objective. 


**The Lagrangian is the Larange Multiplier**

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

**Let's Introduce the Lagrangian**

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

**Let's Keep find the Dual problem**

$$
\begin{aligned}
    \min_{x, y}\max_z \left\lbrace
        f(x, y) + zg(x, y)
        \right\rbrace
    \ge 
    \max_{z}\min_{x, y}
    \left\lbrace
        f(x, y) + zg(x, y)
    \right\rbrace
\end{aligned}
$$

The dual problem is a maximization problem with the objective inside an minimization operator.

$$
\max_z\left\lbrace
    \min_{x, y}\left\lbrace
    f(x, y) + zg(x, y)
    \right\rbrace
\right\rbrace
$$


**Interpretations of the MinMax Gameplay**

This interpretation comes from [here](https://www.youtube.com/watch?v=uh1Dk68cfWs)

> The dual is maximizing the constraint multiplier, this is giving a pentalty to the maximization player, the primal. 
> 
> When these 2 players balanced out, it then means that any improvement will lead to either, increase in the objective of primal, or decrease in the objective of the dual.
>  
> Which only happens when there is no more intersection between the objective of these 2 players. 


---
### **Dualization On Equality Constraints for any Objective**

Consider objective function $g(x)$ as a mapping from $\mathbb{R}^n$ to $\mathbb{R}$ and equality constraints: $Cx = d$, where $C$ is a matrix. We are going to look for the dual of the problem. 


$$
\min_x \left\lbrace
    g(x) + \delta_0(Cx - d)
\right\rbrace \tag{1}
$$

Conjugation on constraint indictor:

$$
\begin{aligned}
    \delta_0 (Cx - d) &= \sup_z \left\lbrace
        z^T(Cx - d) - \delta_0^*(z)
    \right\rbrace
    \\
    \delta_0 (Cx - d) &= \sup_z \left\lbrace
        z^T(Cx - d)
    \right\rbrace    
\end{aligned}
$$

Use the dual for expression (1), make $\sup$ into $\max$

$$
\begin{aligned}
    \min_x \left\lbrace
        \max_z \left\lbrace
        g(x) + z^T(Cx - d)
        \right\rbrace
    \right\rbrace 
    &\underset{[1]}{\ge} \max_z \left\lbrace
        -z^Td + \min_x \left\lbrace
            g(x) + z^TCx
        \right\rbrace
    \right\rbrace      
    \\
    &= \max_z \left\lbrace
        -z^Td - \max_x \left\lbrace
            -g(x) -z^TCx
        \right\rbrace
    \right\rbrace  
    \\
    &= 
    \max_z \left\lbrace
        -z^Td - g^*(-Cx)
    \right\rbrace   
\end{aligned}
$$

\[1\]: By the minmax, maxmin lemma. 

> This is the dual problem: 
> $$
> \sup_z \left\lbrace
> -zd - g^*(-C^Tz)
> \right\rbrace \tag{3}
> $$
> This is the Lagrangian: 
> $$
> \mathcal{L}(x, z) = g(x) + z^T(Cx - d)
> $$



**Least Square Example**: 

Let's consider the case: 

$$
\begin{aligned}
    g(x) &= \frac{1}{2} \Vert Ax - b\Vert^2 \quad s.t \quad Cx = d
    \\
    g^*(z) &\underset{[1]}{=} \frac{1}{2} (z + A^Tb)^T(A^TA)^{-1} (z + A^Tb)
    \\
    &= 
    \max_z \left\lbrace
        -z^Td - \frac{1}{2} (A^Tb - C^Tz)^T(A^TA)^{-1}(A^Tb - C^Tz)
    \right\rbrace
\end{aligned}
$$

\[1\]: This can be found in the convex conjugate examples sets. 

And in this case the dual and the primal will be equation due to the fact that the function is closed and convex. 


**Summarization**

1. Express the constraints as a Delta function. 
2. Consider conjugating on the constraint function. 
3. Move the min max together. 
4. What is inside is the Lagrangian for the problem. 
5. Exchange the MinMax into MaxMin, and then try to find the conjugate of the objective. 

This process is very general and can be used in a lot of different cases. 



