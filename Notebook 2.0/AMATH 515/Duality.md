Prereq: [[Duality Preparation]], [[Duality Prepraration 2]]

Here, we will use some of the ideas we prepared to demonstrate how duality works, with some examples and stuff. 

---
### Intro
Previous we were exposed to the idea of conjugate functions. And we learn the important facts that: 

1. The dual variable is the variable of the conjugate function. 

2. The double conjugate function of $f$ is itself when the function is closed and convex. 

3. We know how to figure out the conjugate of constraint functions, of the form: $Cx = b$, $Cx \le b$, where $C$ is a matrix, and this will represent the feasible domain for the optimization problem. 

4. One of the important lemma that can be concisely stated as: 
$$
\min_x{\max_y F(x, y)} \ge \max_y\min_xF(x,y)
$$
Which is pretty useful for the analysis of Duality.

For Duality, we will be interested about the following perspectives (Views, things, interpretations)

1. Computational benefits of looking for the dual problem. 
2. Perturbation and sensitivity analysis. 
3. Weak and strong duality. 
4. Characterizing the optimality of the solutions. 

---
### Equality Constraints, Any Objective

Consider objective function $g(x)$ and equality constraints: $Cx = d$, where $C$ is a matrix. We are going to look for the dual of the problem. 

Then the objective function can be mixed with the constraint function, giving us: 

$$
\min_x \left\lbrace
    g(x) + \delta_0(Cx - d)
\right\rbrace \tag{1}
$$

Take notice that, the function $\delta_0$ can be written as the conjugate conjugate (Because the feasible region defined is a linear subspace, and that is convex): 

$$
\delta_0 (Cx - d) = \sup_z \left\lbrace
    z^T(Cx - d) - \delta_0^*(z)
\right\rbrace
$$

And remember from the Second part of the duality preparation, the conjugate of the zero indicator function is actually zero, and therefore, we have: 

$$
\delta_0 (Cx - d) = \sup_z \left\lbrace
    z^T(Cx - d)
\right\rbrace
$$

And then we will have another expression for (1), which is: 

$$
\min_x \left\lbrace
    \sup_z \left\lbrace
    g(x) + z^T(Cx - d)
    \right\rbrace
\right\rbrace \tag{2}
$$

Amazingly, the thing that is inside the min sup operator has the name: **Lagrangian**. Which has information for both the primal and dual problem. 

From (2), we can swap the sup and min operator, which will give us the inequality that: 

$$
(2) \ge \sup_z \left\lbrace
    -zd + \min_x \left\lbrace
        g(x) + z^TCx
    \right\rbrace
\right\rbrace   
$$

Notice that I also take out the $-zd$ term because it doesn't depend on the variable x. And then I can also take the negative inside and chang the min to a $sup$, giving us: 

$$
\sup_z \left\lbrace
-zd - \sup_x \left\lbrace
-g(x) - z^TCx
\right\rbrace
\right\rbrace
$$

Immediately observe the fact that we are having: 

$$
\sup_x \left\lbrace
-g(x) - z^TCx
\right\rbrace
=
g^*(-C^Tz)
$$

This will in fact gives the fact that: 

> $$
> \sup_z \left\lbrace
> -zd - g^*(-C^Tz)
> \right\rbrace \tag{3}
> $$

(3) is the dual problem of (1), in this particular case. 

**Least Square Example**: 

Let's consider the case: 

$$
g(x) = \frac{1}{2} \Vert Ax - b\Vert^2 \quad s.t \quad Cx = d
$$

Then we have the conjugate to be: 

$$
g^*(z) = \frac{1}{2} (z + A^Tb)^T(A^TA)^{-1} (z + A^Tb)
$$

And then the dual of the problem using what we proved will be: 

$$
\max_z \left\lbrace
    -z^Td - \frac{1}{2} (A^Tb - C^Tz)^T(A^TA)^{-1}(A^Tb - C^Tz)
\right\rbrace
$$

And in this case the dual and the primal will be equation due to the fact that the function is closed and convex. 

---
### Inequality Constraints 

Consider the primal problem phrased by: 

$$
\min_x (g(x)) \quad s.t \quad Cx \le d
$$

And that is just: 
$$
\min_x \left\lbrace
    g(x) + \delta_{+}(d - Cx)
\right\rbrace
$$

Apply the double conjugate trick here: 

$$
\min_x \left\lbrace
g(x) + \sup_z \left\lbrace
z^T(d-  Cx) - \delta_+^*(z)
\right\rbrace
\right\rbrace
$$

$$
\min_x \left\lbrace
g(x) + \sup_z \left\lbrace
z^T(d-  Cx) - \delta_-(z)
\right\rbrace
\right\rbrace
$$

$$
\min_x \left\lbrace
g(x) + \sup_{z\le 0} \left\lbrace
z^T(d-  Cx)
\right\rbrace
\right\rbrace
$$

And notice that, we are maximizing, but subtracting the conjugate of $\delta_+$, which is just $\delta_-$, and hence we really don't want negative number or else we got super small, therefore we have to choose $z \ge 0$, which means that we have: 

$$
\min_x \left\lbrace
    g(x) + \sup_{z \ge 0} 
    \left\lbrace
        z^T(Cx - d)
    \right\rbrace
\right\rbrace
$$

Boom, there is a constraint sitting there below the sup. And we can start swapping the min sup and get: 

$$
\min_x\sup_{z\ge 0}
\left\lbrace
g(x) + z^T(Cx - d)
\right\rbrace
\ge 
\sup_{z\ge 0}\min_x
\left\lbrace
g(x) + z^T(Cx - d)
\right\rbrace
$$
$$
\sup_{z \ge 0}
\left\lbrace
-z^Td + \min_x \left\lbrace
g(x) + (C^Tz)^Tx
\right\rbrace
\right\rbrace
$$
> $$
> \sup_{z\ge 0}\left\lbrace
> -d^Tz - g^*(-C^Tz)
> \right\rbrace \tag{4}
> $$

Notice that the only difference here is the fact that there is a $z\ge 0$ under the sup now. 

And this is the way to figure out the duality theory for linear programming. **Isn't that cool**?

#### **A Summarization**

What we did here all the time, it's just using the property of the double conjugacy: 

$$
h(x) = \sup_z \left\lbrace
x^Tz - h^*(z)
\right\rbrace
$$

Where the function is closed and convex. This is a very general way to compute the dual, and it's for the general case too.

### **Linear Programming Duality **

At this stage, is not hard to see that (4) is applicable for duality in linear programming. 

The conjugate of a linear objective function is the indicator function. If $f(x) = C^Tx$, then the conjugate is $\delta_0(z - c)$. When $z = c$, this is good, when it's not, this is not good. 

---
### Complex Example

A general example will be: 

$$
\min_x \left\lbrace
g(x) + h(Ax - b) + c^Tx
\right\rbrace
$$

Notice that, we can have the double conjugate on the function $h(x)$. Let's assume that the function is closed and convex, then we have: 

$$
h(Ax - b) = \sup_z \left\lbrace
z^T(Ax - b) - h^*(z)
\right\rbrace
$$

Then we can have: 

$$
\min_x \left\lbrace
\sup_z \left\lbrace
g(x) + c^Tx + z^T(Ax - b)
\right\rbrace
\right\rbrace
$$

And then we have: 

$$
\ge \sup_z\left\lbrace
-z^Tb - h^*(z) + \min_x \left\lbrace
g(x) + x^T(A^Tz + c)
\right\rbrace
\right\rbrace
$$

$$
= \sup_z\left\lbrace
-z^Tb - h^*(z) - g^*(-A^Tz - c)
\right\rbrace
$$

And that is the dual, maximal system. 

---
### Example: Lasso

$$
\min_x \left\lbrace
\lambda \Vert x\Vert_1 + \frac{1}{2}\Vert Ax - b\Vert^2
\right\rbrace
$$

then: 
$$
g(x) = \lambda \Vert x\Vert_1 \implies g^*(z) = \delta_{\lambda \mathbb{B}_\infty}(z)
$$

$$
h(z) = \frac{1}{2}\Vert x\Vert h^2
\implies h^*(z) = \frac{1}{2} \Vert x\Vert^2
$$

We can then use what we had for the previous problem, giving us the template for this one, and we have: 

$$
\sup_{\Vert A^Tz\Vert_\infty \le \lambda} \left\lbrace
-z^Tb - \frac{1}{2}\Vert z\Vert^2
\right\rbrace
$$

That indicator function, will force a constraint into the sup operator, hence, going under the sup operator. 
