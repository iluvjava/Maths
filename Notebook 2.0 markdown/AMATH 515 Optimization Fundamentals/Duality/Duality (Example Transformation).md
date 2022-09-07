Prereqs: [Duality (Dualization)](Duality%20(Dualization).md), [Duality (Dualitzation More Examples)](Duality%20(Dualitzation%20More%20Examples).md). 
Here we are going to apply some of the ideas duality. 

---
### **Intro**

This part is really for myself, personally I want to see the Duality theorem in actions on the examples that I love. 

In lectures, we didn't mention the interpretation of 2 players games and the idea of viewing the optimization problem as an extension to the Lagrange Multiplier, and hence, they will be addressed here. 

This is important because, Von Neuman himself uses the idea of a 2 player games to demonstrate the Lagrangian. And the lagrangian is what we all know from the very start of optimization problems. But when we face more complex constraints, we will have to start dealing with the non-smooth geometry and such to understand it better. 

---
### **Calculus Example: Lagrangian is Generalized Lagrange Multiplier** 

Back in grade school, we see the example of minimizing the function: 

$$
f(x, y) = x^2 + y^2 \text{ s.t: } x + y -2 = 0
$$
and the objective is to:

$$
\min_{x, y} \left\lbrace
    f(x, y) : g(x, y) =0
\right\rbrace
$$

And now, we can use the activation function learned here to express the constraint: 

$$
\min_{x, y} \left\lbrace
    f(x, y) + \delta_0(g(x, y))
\right\rbrace
$$

And, we can express the indicator function in terms of its conjugate, giving us: 

$$
\delta_0(g(x, y)) = \sup_{z} \left\lbrace
    zg(x, y) - \delta_0^*(z)
\right\rbrace
$$

Which is from the definition of the Fenchel Conjugation. And conveniently we know that $\delta_0(z)$ is just zero. 

$$
\delta_0(g(x, y)) = \sup_{z} \left\lbrace
    zg(x, y)
\right\rbrace
$$

fascinating, now we have the 2 player game expression of the optimization, which is just: 

$$
\min_{x, y} \left\lbrace
    f(x, y) + \sup_z\left\lbrace
        zg(x, y)
    \right\rbrace 
\right\rbrace
$$

$$
\min_{x, y}\sup_z \left\lbrace
    f(x, y) + zg(x, y)
\right\rbrace
$$

Ok, firstly, let's assume that the objective function $f(x, y)$ is convex and the contour of the function $g(x,y)$ is also convex, then: 

Boom, this is the Lagrangian, this is also the Lagrange Multiplier. Remember the fact that, the saddle point of the Lagrangian system is going to produce the optimal for the primal and the dual problem??? Let's take a look: 

$$
\mathcal{L}(x, y, z) =
f(x, y) + zg(x, y)
$$

And, remember from our calculus class, we will be setting the Lagrangian to zero, so that, the gradient of the constraint function equals to the gradient of the objective function. 

Taking the gradient of the Lagrangian will give use a system of equations to solve for the optimality conditions. 

$$
\begin{aligned}
\nabla_{x, y}\mathcal{L}(x,y, z) &= \nabla f(x, y) - z\nabla g(x, y) &= 0    
\\
\nabla_{z}\mathcal{L}(x, y, z) &= g(x, y) = 0
\end{aligned}
$$

And this, is also the optimality conditions, and in the case of sub-differential, or the in the form of equation.

It's not mysterious at all, duality it's just an improved version of the Lagrangian Multiplier. 

---
### **Polyhedra Constraint, 2-Norm Objective**

**Objective**: Using strong duality to find the optimality conditions for the 2-norm polyhedra minimization problem.

Here we consider the primal optimization problem to be: 

$$
\min_x \left\lbrace
    \frac{1}{2}\left\Vert
         Ax - b
    \right\Vert^2 + \delta_+(d - Cx)
\right\rbrace
$$

Where the delta indicator function helps us to assert the constraints onto the objective function. Let's consider the Fenchel's Transform on this thing:

$$
\delta_+(d - Cx) = \max_z \left\lbrace
    (d - Cx)^Tz - \delta_+^*(z)
\right\rbrace = \max_{z\ge 0} \left\lbrace
    (d - Cx)^Tz
\right\rbrace
$$

Beautiful, then the Lagrangian will be define as: 

$$
\mathcal{L}(x, y) := 
\frac{1}{2}
\left\Vert
    Ax - b 
\right\Vert^2
+ (d - Cx)^Tz - \delta^*_+(z)\tag{1}
$$

And notice that: $\delta_+^*(z) \implies \delta_-(z)$, so them: 

$$
 - \delta_+^*(z) = -\delta_-(z) = + \delta_+(z)
$$

Following up from (1), the Lagrangian, we will have the expression with the positivity constraints on the dual decision variables: 

$$
\mathcal{L}(x, z) = \left\Vert
    Ax - b 
\right\Vert^2
+ (d - Cx)^Tz + \delta_+(z)\tag{2}
$$

Let's phrase the optimality conditions out for the system, and see what we can get out of it. 

$$
\begin{cases}
    \partial_x \mathcal{L}(x, z; s) = 0 \implies A^T(A \bar{x} - b) + C^T\bar{z} & = 0 
    \\
    \partial_z\mathcal{L}(x, z; s) = 0 \implies Cx - d \in \partial \delta_+(z)
\end{cases} \tag{3}
$$

And take note that, with the constraint that $z \ge 0$, the sub differential of positivity indicator function is: 

$$
[\delta_+(z)]_i := 
\begin{cases}
    0 & z_i \ge 0 \\
    (-\infty, 0] & z_i = 0
\end{cases}
$$

Therefore, the second conditions for expression (3), the sub differential to be: 

$$
\forall i = \begin{cases}
    (Cx - d)_i = 0 & z_i \ge 0
    \\
    (Cx - d)_i \ge 0 & z_i = 0
\end{cases}
$$

And notice that, the slack variable, representing how close we are to the boundary of the polyhedra for a particular constraint is expressed as: $s = d - Cx$, and this gives u: 

$$
\forall i = \begin{cases}
    s_i = 0 & z_i \ge 0
    \\
    s_i \ge 0 & z_i = 0
\end{cases}
$$

And notice that this conditions here can compactly express as: $s_iz_i = 0 \wedge s_i, z_i \ge 0$

Now we can complete the saddle point for the Lagrangian and set it to be: 

$$
\begin{cases}
    \partial_x \mathcal{L}(x, z; s) = 0 &\implies A^T(A \bar{x} - b) + C^T\bar{z}  = 0 
    \\
    \partial_z\mathcal{L}(x, z; s) = 0 &\implies s_i, z_i \ge 0 \wedge s_iz_i = 0\quad \forall i
\end{cases} \tag{3}
$$

What we showed, is the idea of **Complementary Slackness**, and this is the same kind of idea that pops up for the duality theorem for the Linear Programming problem. Up until now, it doesn't lead to the algorithm yet, more clever tricks are needed for an implementable, newton based solving algorithm for it. It's called Interior Points Method, which is often used in practice. 

**Note**: 
There are other ways of transforming, for example one can introduce slack variable, and then use the equality constraint as the function under Fenchel Transform. 

---
### **Linear Programming**


---
### **Generalized Linear Models**


