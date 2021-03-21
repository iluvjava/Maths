[[Duality 2]], 
[[Duality]]

What is the relationship between the primal and dual variables? 
What is the Lagrangian? 
What implications do they have for algorithm designs? 

---
### Definition: Lagarangian

Starts with our primal problem: 

$$
\min_x \left\lbrace
    g(x) + h(Ax - b) + c^Tx
\right\rbrace
$$

And then during the dualization process, we have the lagrangian: 

$$
\min_x \sup_z 
\left\lbrace
    \underbrace{g(x) + c^Tx + z^T(Ax - b) - h^*(z)}_{\text{Lagarangian: }\mathcal{L}(x, z)}
\right\rbrace
$$

* Lagrangian is convex in $x$, concave in $z$, it's concave in $z$ because of the $h^*(z)$ located there. This is a saddle point of the system. This encodes both primal and dual problem. 
* $x$ is the primal variable and $z$ is the dual variable. 

Using the idea here, the primal dual pair can be rephrased as the following: 

$$
\text{Primal: }\sup_z \mathcal{L}(x, z)  \quad \text{Dual: } \inf_x \mathcal{L}(x, z)
$$

They are objectives that are inside the optimization operator.

And the duality theory can be phrased using the min max max min: 
$$
\inf_x\sup_z \mathcal{L}(x, z) \ge \sup_z\inf_x \mathcal{L}(x, z)
$$

---
### **Saddle Point of the Lagrangian**

Assuming: **Strong Duality Holds**

Assuming that $\bar{x}$ are solutions to the primal and $\bar{z}$ are solutions to the dual. 

Then: 

$$
[\bar{x}, \bar{z}]
$$

As a point is a stationary point of the Lagarangian, it's a saddle point for the system. This will mean that: 

$$
0\in \partial_x \left. \mathcal{L}(x, z) \right|_{(\bar{x}, \bar{z})} \wedge 0\in \partial_z \left. \mathcal{L}(x, z) \right|_{(\bar{x}, \bar{z})}
$$

**Why is this significant**? 

It gives up 3 representation of the optimality conditions for the closed convex optimization problem. They come from the optimal conditions from the sub-differential of the function, and the use of Fenchel Equality (The conjugate swapping trick). 

By using the representation of the optimality conditions, we will be able to connect the dual and the primal solutions, using the conditions for the sub-differential.

Examples... ? (Fill this out when we have the time)

---

### **Simple Example**

$$
\min_y f(y)\quad \max_z \left\lbrace
    -f^*(z)
\right\rbrace
$$

Are the primal and dual pair. 

$$
0 \in \partial f |_{\bar{y}} \iff \bar{y} \in \partial f^*|_0
$$

$$
0\in -\partial f^*|_{\bar{z}} \iff \bar{z} \in - \partial f|_0
$$

Not enough assumptions has been made to connect the primal and the dual, the only thing that can be said is that: 

$$
0 \in \partial f|_{\bar{y}} \cap (-\partial f^*|_{\bar{z}})
$$


---

### **Example 1b**

1a is sipped for now. 

This is the Lasso Least Square, **primal**: 

$$
\min_x \left\lbrace
    \frac{1}{2} \Vert Ax - b\Vert^2 + \lambda \Vert x\Vert_1
\right\rbrace
$$

The **Dual** problem is a constrained optimazation problem: 

$$
\max_z \left\lbrace
    -z^Tb - \frac{1}{2}\Vert z\Vert^2 \quad \text{s.t: } \Vert A^Tz\Vert_\infty \le \lambda
\right\rbrace
$$

Denote the optimal solutions for the primal and the dual to be: $\bar{x}, \bar{z}$, then using the optimality conditions for the system: 

$$
0 \in A\bar{x} - b + \lambda\partial \Vert \cdot\Vert_1|_{\bar{x}}
\quad \quad
0 \in -b - \bar{z} + \partial(\delta_{\lambda \Vert \cdot\Vert_\infty})|_{A^T\bar{z}}
$$

$$
b - A\bar{x} \in \lambda\partial \Vert \cdot\Vert_1 |_{\bar{x}}
\quad \quad
b + \bar{z} \in \partial(\delta_{\lambda \Vert \cdot\Vert_\infty})|_{A^T\bar{z}}
$$

Using the Fenchel Conditions, on this term: 
$$
b - A\bar{x} \in \lambda \partial \Vert \cdot\Vert_1|_{\bar{x}}
\iff
\bar{x} \in \partial (\delta_{\lambda\Vert \cdot\Vert_\infty})|_{b - A\bar{x}}
$$

Ok, this is not good, we might need to anchor at $b$: 

$$
b\in A\bar{x} +\lambda \partial \Vert \cdot\Vert_1|_{\bar{x}}
\quad 
b \in \partial(\delta_{\lambda \Vert \cdot\Vert_\infty})|_{A^T\bar{z}} - \bar{z}
$$

---
### **Example: Constrained Least Square**

Consider the optimization problem: 

$$
\min_{Cx \le d} 
\left\lbrace
    \frac{1}{2}\Vert Ax - b\Vert^2 
\right\rbrace
$$

Minimize the least square problem wrt to a set of inequality constraints. 

The Lagrangian of the problem will be denoted by: 

$$
\mathcal{L}(x, y) = \frac{1}{2}\Vert Ax - b\Vert^2 + z^T(Cx - d) - \delta_+(z)
$$

Where the primal variables are $x$ and $z$, notice the **implicit constraints for the dual problem** is $z\ge 0$

Now we consider taking the partial derivative wrt to the primal variable, which will give us: 

$$
\partial_x \mathcal{L}(x, y) = 
A^T(Ax - b) + C^Tz
$$

Where, the indicator function drops out, and we skipped some fancy derivative stuff. We have equality here because it's smooth wrt to primal variable $x$, now consider: 

$$
\partial_y \mathcal{L}(x, y) = 
Cx - d - \partial \delta_+(z)
$$

The Optimality conditions can be expressed as: 

$$
0 = A^T(A\bar{x} - b) + C^T\bar{z} \hspace{4em} d - C\bar{x} \in -\partial \delta_+(\bar{z})
$$

Component wise, pick any $\bar{z}_i$. 

1. $\bar{z}_i > 0\implies \delta_+(\bar{z}_i) = 0 \implies (C\bar{x} - d)_i = 0$ 
2. $\bar{z}_i = 0 \implies \delta_+(\bar{z}_i) = (-\infty, 0] \implies (C\bar{x} - d)_i \le 0$

This is called: **Complementary Slackness** Conditions, we can merge the above 2 cases together, getting that: 

$$
\bar{z}(C\bar{x} - d) = \mathbf{0}
$$

This is how the primal and the dual variables **are brought together**. 



---
### **Interior Points Method**

The idea is: Relax the complementary slack. 

$$
\bar{z}_i(C\bar{x}_i - d_i) =\mu \ge \mathbf{0}
$$

Keeping $z>0$, slack $Cx - d$ negative, and then we drive $\mu$ to zero, carefully. 

Introducing the slack variables: 

$$
s = d - Cx 
$$

Then the optimality conditions are: 

$$
\begin{cases}
    A^T(Ax - b) + C^Tz = 0
    \\
    s + Cx - d = 0
    \\
    s_iz_i = 0
    \\
    s_i \ge 0 \wedge z_i \ge 0
\end{cases}
$$

Giving us a system of equations. Ok, there are some big tricks here to make the interior points method works with the optimality conditions above: 

Firstly, relax the third conditions $x_i z_i = 0$ into $x_i z_i = \mu$

$$
\min_{x, s} \left\lbrace
    \frac{1}{2} \Vert Ax - b\Vert^2 - \mu \sum_{i = 1}^{n}\left(
            \ln(s_i)
        \right)
\right\rbrace \quad\text{Where: } s_i = (d - Cx)_i
$$

One of the tricks which we use is the fact that as we derive the $\mu$ to zero, the term $\mu \ln(x)$ (Vector here) are approaching the positive indicator function: 

$$
\lim_{\mu \rightarrow 0} \mu \ln(s_i) = \delta_+(s)
$$

This will keep us at the interior of the simplex while optimizing. 
